import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

using Toybox.ActivityRecording;
using Toybox.System;

class FootballRefWatchApp extends Application.AppBase {

    private var _PERIOD_LENGTH;
    private var _NUM_PERIODS;
    private var _HALFTIME_LENGTH;

    private var _isGameClockRunning;
    private var _gameClockTime;
    private var _currentPeriod;
    private var _isHalfTimeBreak;


    private var _startTimes;
    private var _endTimes;

    private var _timeoutsHome;
    private var _timeoutsAway;
    private var _usedTimeoutsHome;
    private var _usedTimeoutsAway;

    function initialize() {
        AppBase.initialize();        

        _isGameClockRunning = false;
        _PERIOD_LENGTH = Properties.getValue("periodLength");
        if (_PERIOD_LENGTH == null) {
            _PERIOD_LENGTH = 12;
            Application.Properties.setValue("periodLength", _PERIOD_LENGTH);
        }
        _NUM_PERIODS = Properties.getValue("numPeriods");
        if (_NUM_PERIODS == null) {
            _NUM_PERIODS = 4;
            Application.Properties.setValue("numPeriods", _NUM_PERIODS);
        }

        _HALFTIME_LENGTH = Properties.getValue("halfTimeLength");
         if (_HALFTIME_LENGTH == null) {
            _HALFTIME_LENGTH = 15;
            Application.Properties.setValue("halfTimeLength", _HALFTIME_LENGTH);
        }

        restartGame();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        Attention.backlight(0.6);
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {

    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [new MainView(), new MainDelegate()] as Array<Views or InputDelegate>;
    }

    function getPeriodLength() { return _PERIOD_LENGTH; }
    function setPeriodLength(val) { _PERIOD_LENGTH = val; Properties.setValue("periodLength", _PERIOD_LENGTH);}

    function getNumPeriods() { return _NUM_PERIODS; }
    function setNumPeriods(val) { _NUM_PERIODS = val; Properties.setValue("numPeriods", _NUM_PERIODS);}  

    function isGameClockRunning() { return _isGameClockRunning; }
    function setGameClockRunning(newClockStatus) { _isGameClockRunning = newClockStatus; }

    function getGameClockTime() { return _gameClockTime; }
    function decrementGameClockTime() { _gameClockTime --; }
    function resetGameClock() { _gameClockTime = getPeriodLength() * 60 * 10; }
    function setGameClockToHalftime() { _gameClockTime = _HALFTIME_LENGTH * 60 * 10;  }

    function getCurrentPeriod() { return _currentPeriod; }
    function getCurrentHalf() { return Math.floor(_currentPeriod / 2); }
    function setCurrentPeriod(val) { _currentPeriod = val; }
    function incrementPeriod() { _currentPeriod ++; return getCurrentPeriod(); }

    function getStartTimes() { return _startTimes; }
    function pushStartTime(time as System.ClockTime) { _startTimes[_currentPeriod - 1] = time; }

    function getEndTimes() { return _endTimes; }
    function pushEndTime(time as System.ClockTime) { _endTimes[_currentPeriod - 1] = time; }
    
    function getTimeoutsHome() { return _timeoutsHome; }
    function resetTimeoutsHome() { _timeoutsHome = 3; return _timeoutsHome; }
    function decrementTimeoutsHome() as Number { 
        if (_timeoutsHome != 0) {
            _timeoutsHome = _timeoutsHome - 1; 
            _usedTimeoutsHome[calcTimeoutPosition(_timeoutsHome)] = getCurrentPeriod(); 
        } 
        return _timeoutsHome ; 
    }
    function incrementTimeoutsHome() as Number { 
        if (_timeoutsHome != 3) {
            _timeoutsHome = _timeoutsHome + 1; 
            calcTimeoutPosition(_timeoutsHome);
            _usedTimeoutsHome[calcTimeoutPosition(_timeoutsHome)] = null; 
        } 
        return _timeoutsHome ; 
    }

    function getTimeoutsAway() { return _timeoutsAway; }
    function resetTimeoutsAway() { _timeoutsAway = 3; return _timeoutsAway; }
    function decrementTimeoutsAway() as Number { 
        if (_timeoutsAway != 0) {
            _timeoutsAway = _timeoutsAway - 1;
            _usedTimeoutsAway[calcTimeoutPosition(_timeoutsAway)] = getCurrentPeriod(); 
        }
        return _timeoutsAway; 
    }
    function incrementTimeoutsAway() as Number { 
        if (_timeoutsAway != 3) {
            _timeoutsAway = _timeoutsAway + 1;
            _usedTimeoutsAway[calcTimeoutPosition(_timeoutsAway)] = null;
        } 
        return _timeoutsAway; 
    }

    function isHalfTimeBreak() { return _isHalfTimeBreak; }
    function setHalfTimeBreak(val) { _isHalfTimeBreak = val; }

    function calcTimeoutPosition(pos) {
        var to = ((getCurrentHalf() - 1) * 3 ) + (3 - pos);
        System.println("Timeout Position: " + to);
        return to;
    }



    function restartGame() {
        resetGameClock();
        _currentPeriod = 1;
        _startTimes = new Array<System.ClockTime>[_NUM_PERIODS];
        _endTimes = new Array<System.ClockTime>[_NUM_PERIODS];
        _usedTimeoutsHome = new Array<Number>[6];
        _usedTimeoutsAway = new Array<Number>[6];
        _timeoutsHome = 3;
        _timeoutsAway = 3;
        _isHalfTimeBreak = false;
    }
}