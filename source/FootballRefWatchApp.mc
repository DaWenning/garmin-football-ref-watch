import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

using Toybox.ActivityRecording;

class FootballRefWatchApp extends Application.AppBase {

    private var _periodLength;
    private var _numPeriods;

    private var _isGameClockRunning;
    private var _gameClockTime;
    private var _currentPeriod;

    function initialize() {
        AppBase.initialize();

        

        _isGameClockRunning = false;

        _periodLength = Properties.getValue("periodLength");
        if (_periodLength == null) {
            _periodLength = 12;
            //Application.Storage.setValue("PERIOD_LENGTH", _periodLength);
            Application.Properties.setValue("periodLength", _periodLength);
        }
        resetGameClock();

        // _numPeriods = Application.Storage.getValue("NUM_PERIODS");
        _numPeriods = Properties.getValue("numPeriods");
        if (_numPeriods == null) {
            _numPeriods = 4;
            // Application.Storage.setValue("NUM_PERIODS", _numPeriods);
            Application.Properties.setValue("numPeriods", _numPeriods);
        }
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

    function getPeriodLength() { return _periodLength; }
    function setPeriodLength(val) { _periodLength = val; Properties.setValue("periodLength", _periodLength);}

    function getNumPeriods() { return _numPeriods; }
    function setNumPeriods(val) { _numPeriods = val; Properties.setValue("numPeriods", _numPeriods);}  

    function isGameClockRunning() { return _isGameClockRunning; }
    function setGameClockRunning(newClockStatus) { _isGameClockRunning = newClockStatus; }

    function getGameClockTime() { return _gameClockTime; }
    function decrementGameClockTime() { _gameClockTime --; }
    function resetGameClock() { _gameClockTime = getPeriodLength() * 60 * 10; }

    function getCurrentPeriod() { return _currentPeriod; }
    function setCurrentPeriod(val) { _currentPeriod = val; }

    



    function restartGame() {
        resetGameClock();
        _currentPeriod = 1;
    }
}