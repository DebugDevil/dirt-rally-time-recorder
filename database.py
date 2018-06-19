import sqlite3


class Database:
    
    laptimesDb = '\dirtrally-laptimes.db'
    
    def __init__(self, approot):
        self.approot = approot
        self.db = self.checkSetup(approot)
        self.track = None
        self.car = None
    
    def checkSetup(self, approot):
        try:
            conn = sqlite3.connect(approot + '/dirtrally-lb.db')
            db = conn.cursor()
            return db
        except (Exception) as exc:
            # TODO Set it up with tracks.sql and cars.sql
            print("Error connecting to database:", exc)

    def initializeLaptimesDb(self):
        try:
            lapconn = sqlite3.connect(self.approot + self.laptimesDb)
            lapdb = lapconn.cursor()
            lapdb.execute('SELECT user,pass FROM user;')
            res = lapdb.fetchall()
            userArray = res[0]
        except (Exception) as exc:
            try:
                print("Trying to init the db", exc)
                lapdb.execute('CREATE TABLE laptimes (Track INTEGER, Car INTEGER, Time REAL);')
                lapdb.execute('CREATE TABLE user (user TEXT, pass TEXT);')
                # TODO Read username from config.yml
                lapdb.execute('INSERT INTO user VALUES (?, ?)', ('defaultuser', 'defaultpassword'))
                lapconn.commit()
                # TODO Drop password?
                lapdb.execute('SELECT user,pass FROM user;')
                res = lapdb.fetchall()
                userArray = res[0]
            except (Exception) as exc:
                print("Error initializing " + self.laptimesDb, exc)
        finally:
            lapconn.close()
        
        return userArray

    def identifyTrack(self, z, tracklength):
        self.db.execute('SELECT id, name, startz FROM Tracks WHERE abs(length - ?) < 0.000000001', (tracklength,))
        track = self.db.fetchall()
        if (len(track) == 1):
            index, name, startz = track[0]
            self.track = index
            print("Track: " + name)
        elif (len(track) > 1):
            for index, name, startz in track:
                if abs(z - startz) < 50:
                    self.track = index
                    print("Track: " + str(name) + " Z: " + str(z))
        
        else:
            self.track = -1
            print("Failed to get track: " + str(tracklength) + " / " + str(z))
        return self.track
    
    def identifyCar(self, rpm, max_rpm):
        self.db.execute('SELECT id, name FROM cars WHERE abs(maxrpm - ?) < 0.01 AND abs(startrpm - ?) < 0.01', (max_rpm, rpm))
        car = self.db.fetchall()
        if (len(car) == 1):
            index, name = car[0]
            self.car = index
            print("Car: " + name)
        elif (len(car) == 2):
            # Peugeot T16 Rally and Hillclimb cars have identical RPMs
            self.car = 0
            for index, name in car:
                if (self.track >= 1000 and index >= 1000):
                    self.car = index
                if (self.track < 1000 and index < 1000):
                    self.car = index
        
        else:
            # If we're on Pikes Peak, we try to keep the previous car index (bug with 2nd run)
            if (self.track <= 1000):
                self.car = -1
            print("Failed to get car name: " + str(max_rpm) + " / " + str(rpm))
        return self.car

    def recordResults(self, laptime):
        try:
            lapconn = sqlite3.connect(self.approot + self.laptimesDb)
            lapdb = lapconn.cursor()
            lapdb.execute('INSERT INTO laptimes (Track, Car, Time) VALUES (?, ?, ?)', (self.track, self.car, laptime))
            lapconn.commit()
            lapconn.close()
            # TODO Record topspeed?
            # TODO Record timestamp
        except (Exception) as exc:
            print("Error connecting to database:", exc)