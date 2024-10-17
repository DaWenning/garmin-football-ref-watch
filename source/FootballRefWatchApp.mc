import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

using Toybox.ActivityRecording;
using Toybox.System;
using Toybox.Timer;

class FootballRefWatchApp extends Application.AppBase {

    private var _PERIOD_LENGTH as Integer;
    function getPeriodLength() as Integer { return _PERIOD_LENGTH; }
    function setPeriodLength(val as Integer) { _PERIOD_LENGTH = val; Properties.setValue("periodLength", _PERIOD_LENGTH);}

    private var _NUM_PERIODS as Integer;
    function getNumPeriods() as Integer { return _NUM_PERIODS; }
    function setNumPeriods(val as Integer) { _NUM_PERIODS = val; Properties.setValue("numPeriods", _NUM_PERIODS);}  

    private var _HALFBREAK_LENGTH as Integer;


    private var _GameClockRunning as Boolean;
    function isGameClockRunning() as Boolean { return _GameClockRunning; }
    function setGameClockRunning(newClockStatus as Boolean) { _GameClockRunning = newClockStatus; }

    private var _gameClockTime as Integer = 0;
    function getGameClockTime() as Integer { return _gameClockTime; }
    

    private var _currentPeriod as Integer = 1;
    function getCurrentPeriod() as Integer { return _currentPeriod; }
    function setCurrentPeriod(val as Integer) { _currentPeriod = val; }
    function getCurrentHalf() as Integer { if (_currentPeriod == 1 || _currentPeriod == 2) {return 1;} else {return 2;}}


    private var _isHalfTimeBreak as Boolean = false;
    function isHalfTimeBreak() as Boolean { return _isHalfTimeBreak; }
    function setHalfTimeBreak(val as Boolean) { _isHalfTimeBreak = val; }

    private var _startTimes as Array<System.ClockTime> = new Array<System.ClockTime>[4];
    function getStartTimes() as Array<System.ClockTime> { return _startTimes; }

    private var _endTimes as Array<System.ClockTime> = new Array<System.ClockTime>[4];
    function getEndTimes() as Array<System.ClockTime> { return _endTimes; }

    private var _timeoutsHome;
    function getTimeoutsHome() { return _timeoutsHome; }

    private var _timeoutsAway;
    function getTimeoutsAway() { return _timeoutsAway; }

    private var _usedTimeoutsHome as Array<Number> = new Array<Number>[6];
    function getUsedTimeoutsHome() as Array<Number> { return _usedTimeoutsHome; }
    
    private var _usedTimeoutsAway as Array<Number> = new Array<Number>[6];
    function getUsedTimeoutsAway() as Array<Number> { return _usedTimeoutsAway; }    

    private var _isDownClockRunning as Boolean = false;    
    function isDownClockRunning() as Boolean { return _isDownClockRunning; }
    function setDownClockRunning(val as Boolean) { _isDownClockRunning = val;}

    private var _downClockTime;
    function getDownClockTime() { return _downClockTime; }

    private var _activitySession;
    private var _systemSettings;

    private var _DAYTIME_TIMER as Timer.Timer = new Timer.Timer();
    function getDayTimeTimer() as Timer.Timer { return _DAYTIME_TIMER; }
    private var _VIEW_TIMER as Timer.Timer = new Timer.Timer();
    function getViewTimer() as Timer.Timer { return _VIEW_TIMER; }
    
    function initialize() {
        AppBase.initialize();        

        _GameClockRunning = false;

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

        _HALFBREAK_LENGTH = Properties.getValue("halfTimeLength");
         if (_HALFBREAK_LENGTH == null) {
            _HALFBREAK_LENGTH = 15;
            Application.Properties.setValue("halfTimeLength", _HALFBREAK_LENGTH);
        }

        restartGame();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        //Attention.backlight(0.6);

        _activitySession = ActivityRecording.createSession({  // set up recording session
            :name=>"Football Referee",                   // set session name
            :sport=>Activity.SPORT_AMERICAN_FOOTBALL,              // set sport type
            :subSport=>Activity.SUB_SPORT_FIELD        // set sub sport type
        });
        _systemSettings = System.getDeviceSettings();
        _activitySession.start();

        
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
        _activitySession.stop();
        _activitySession.save();
        _activitySession = null;

        
        _DAYTIME_TIMER.stop();
        _VIEW_TIMER.stop();
        
    }

    // Return the initial view of your application here
    function getInitialView() {        
        return [new MainView(), new MainDelegate()];
    }

    function dropTimer() {_gameClockTime = 10;}
    function resetGameClock() {
        _gameClockTime = _PERIOD_LENGTH * 60 * 10 + 1; 
    }
    function setGameClockToHalftime() { _gameClockTime = _HALFBREAK_LENGTH * 60 * 10;  }
    function incrementPeriod() { _currentPeriod ++; return getCurrentPeriod(); }
    function decrementGameClockTime() { _gameClockTime --; }
      
    function pushStartTime(time as System.ClockTime) { _startTimes[_currentPeriod - 1] = time; } 
    function pushEndTime(time as System.ClockTime)   { _endTimes[_currentPeriod - 1] = time; }
    
    
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
            _usedTimeoutsHome[calcTimeoutPosition(_timeoutsHome)] = 0; 
            _timeoutsHome = _timeoutsHome + 1;
        } 
        return _timeoutsHome ; 
    }

    
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
            _usedTimeoutsAway[calcTimeoutPosition(_timeoutsAway)] = 0;
            _timeoutsAway = _timeoutsAway + 1;
        } 
        return _timeoutsAway; 
    }

    function getSystemSettings() { return _systemSettings; }

    function decrementDownClockTime() { _downClockTime --; }
    function resetDownClockTime(val) {_downClockTime = val;}

    function calcTimeoutPosition(pos) as Number {
        var to = ((getCurrentHalf() - 1) * 3 ) + (3 - pos) - 1;
        // System.println("Position: " + to);
        return to;
    }

    function startDayTimeTimer(method, time) {
        _DAYTIME_TIMER.stop();
        _DAYTIME_TIMER.start(method, time, true);
    }

    function startViewTimer(method, time) {
        _VIEW_TIMER.stop();
        _VIEW_TIMER.start(method, time, true);
    }

    function restartGame() {
        resetGameClock();
        _currentPeriod    = 1;
        _startTimes       = new Array<System.ClockTime>[4];
        _endTimes         = new Array<System.ClockTime>[4];
        _usedTimeoutsHome = new Array<Number>[6];
        _usedTimeoutsAway = new Array<Number>[6];
        _timeoutsHome = 3;
        _timeoutsAway = 3;
        _isHalfTimeBreak = false;
    }
}