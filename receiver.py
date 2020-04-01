import asyncore
import socket
import struct
from databaseAccess import DatabaseAccess
from database import Database
from statsProcessor import StatsProcessor
from ambiguousResultHandler import AmbiguousResultHandler
from gearTracker import GearTracker
from timeTracker import TimeTracker
from progressTracker import ProgressTracker
from speedTracker import SpeedTracker
from respawnTracker import RespawnTracker

class Receiver(asyncore.dispatcher):

    def __init__(self, address, speed_unit, approot):
        asyncore.dispatcher.__init__(self)
        self.speed_unit = speed_unit
        self.speed_modifier = speed_unit == 'mph' and 0.6214 or 1
        self.address = address
        self.approot = approot
        self.finished = False
        self.track = 0
        self.car = 0
        self.fieldCount = 66

        self.database = Database(approot).setup()
        self.ambiguousResultHandler = AmbiguousResultHandler(Database.laptimesDbName)
        self.databaseAccess = DatabaseAccess(self.database, self.ambiguousResultHandler)
        self.userArray = self.database.initializeLaptimesDb()
        self.statsProcessor = StatsProcessor(self)
        
        self.initTrackers()

    def reconnect(self):
        self.received_data = False

        self.create_socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.bind(self.address)
        self.print("Waiting for data on %s:%s" % self.address)

    def writable(self):
        return False

    def handle_expt(self):
        self.print('exception occurred!')
        self.handle_close()

    def handle_error(self):
        # TODO #17 Log errors to file and ask to contact developer
        asyncore.dispatcher.handle_error(self)

    def informCloseAndWaitForInput(self):
        self.print('The connection was closed.')
        input('Press ENTER to end program.')

    def handle_close(self):
        self.close()
        self.informCloseAndWaitForInput()

    def readable(self):
        return True

    def handle_read(self):
        data = self.recv(self.fieldCount * 8)

        if not data:
            return

        if not self.received_data:
            self.received_data = True
            self.print("Receiving data on %s:%s" % self.address)

        self.parse(data)

    def formatTopSpeed(self):
        topSpeed_kmh = self.speedTracker.getTopSpeed() * 3.6
        return '%.1f' % (topSpeed_kmh * self.speed_modifier,)

    def formatLapTime(self, laptime):
        return '%.2f' % (laptime,)

    # TODO #17 Log in a "python" way
    def printResults(self, laptime):
        dbAccess = self.databaseAccess
        data = "dirtrally.%s.%s.%s.time:%s|s" % (self.userArray[0], dbAccess.identify(self.track), dbAccess.identify(self.car), self.formatLapTime(laptime))
        self.print(data)
        data = "dirtrally.%s.%s.%s.topspeed:%s|%s" % (self.userArray[0], dbAccess.identify(self.track), dbAccess.identify(self.car), self.formatTopSpeed(), self.speed_unit)
        self.print(data)

    def showCarControlInformation(self):
        if isinstance(self.car, (list,)):
            for car in self.car:
                self.print(self.databaseAccess.describeCarInterfaces(car))
        else:
            self.print(self.databaseAccess.describeCarInterfaces(self.car))

    def allZeroStats(self, stats):
        return stats.count(0) == len(stats)

    def parse(self, data):
        stats = struct.unpack(str(self.fieldCount) + 'f', data[0:self.fieldCount * 4])

        if not self.allZeroStats(stats):
            # TODO Some trackers must consider if a frame is a respawn
            self.respawnTracker.track(stats)
            self.timeTracker.track(stats)
            self.progressTracker.track(stats)
            self.gearTracker.track(stats)
            self.speedTracker.track(stats)
        
        timeDelta = self.timeTracker.getTimeDelta()
        stageProgress = self.progressTracker.getProgress()
        isRestart = self.respawnTracker.isRestart()
        lap = self.progressTracker.getLap()

        # TODO If onFinish:resetRecognition, we wouldn't need self.finished, no?
        self.statsProcessor.handleGameState(isRestart, self.inStage(), self.finished, lap, timeDelta, stageProgress, stats)

    def resetRecognition(self):
        self.track = 0
        self.car = 0
        self.initTrackers()

    def inStage(self):
        return self.track != 0 and self.car != 0

    # TODO Remove. 
    def prepareStage(self):
        pass

    def initTrackers(self):
        self.timeTracker = TimeTracker()
        self.gearTracker = GearTracker()
        self.progressTracker = ProgressTracker()
        self.speedTracker = SpeedTracker()
        self.respawnTracker = RespawnTracker()

    def startStage(self, stats):
        self.finished = False

        idle_rpm = stats[64]  # *10 to get real value
        max_rpm = stats[63]  # *10 to get real value
        top_gear = stats[65]
        track_z = stats[6]
        
        dbAccess = self.databaseAccess
        track_length = self.progressTracker.getTrackLength()
        self.track = dbAccess.identifyTrack(track_z, track_length)
        self.car = dbAccess.identifyCar(idle_rpm, max_rpm, top_gear)

        data = "dirtrally.%s.%s.%s.started:1|c" % (self.userArray[0], dbAccess.identify(self.track), dbAccess.identify(self.car))
        self.print(data)

        self.showCarControlInformation()

    def finishStage(self, stats):
        # TODO Move to time tracker?
        laptime = stats[62]
        self.databaseAccess.recordResults(self.track, self.car, laptime, self.formatTopSpeed())
        self.printResults(laptime)
        self.finished = True

    def print(self, message):
        print(message)
