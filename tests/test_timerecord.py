import unittest
from unittest.mock import MagicMock
from tests.test_base import TestBase
from timerecorder import timerecord
from timerecorder.receiver import Receiver
from timerecorder.statsProcessor import StatsProcessor

class TestTimeRecord(TestBase):

    def __init__(self, methodName):
        TestBase.__init__(self, methodName, 'test-files')
        self.UpdateResourcesFunction = StatsProcessor.updateResources

    def setUp(self):
        StatsProcessor.updateResources = MagicMock()
        self.thing = Receiver('test-files')

    def tearDown(self):
        StatsProcessor.updateResources = self.UpdateResourcesFunction

    def testCloseGracefullyOnError(self):
        Receiver.reconnect = MagicMock(side_effect=IOError)

        timerecord.informUser = MagicMock()

        timerecord.main('logfile')

        self.assertTrue(timerecord.informUser.called)  # @UndefinedVariable, PyDev restriction

    def testLetKeyboardInterruptPassSilently(self):
        Receiver.reconnect = MagicMock(side_effect=KeyboardInterrupt)

        timerecord.informUser = MagicMock()

        timerecord.main('logfile')

        self.assertFalse(timerecord.informUser.called)  # @UndefinedVariable, PyDev restriction

if __name__ == "__main__":
    unittest.main()
