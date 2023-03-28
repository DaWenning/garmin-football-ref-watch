import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class FootballRefWatchApp extends Application.AppBase {

    private var _periodLength;
    private var _numPeriods;

    private var _startTimes = [];
    private var _stopTimes = [];

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {

        // INIT STORAGE
        _periodLength = Application.Storage.getValue("PERIOD_LENGTH");
        //_periodLength = 0.5;
        if (_periodLength == null) {
            _periodLength = 12;
            Application.Storage.setValue("PERIOD_LENGTH", _periodLength);
        }

        _numPeriods = Application.Storage.getValue("NUM_PERIODS");
        if (_numPeriods == null) {
            _numPeriods = 4;
            Application.Storage.setValue("NUM_PERIODS", _numPeriods);
        }



        var _mainView = new FootballRefWatchView();

        return [ _mainView, new FootballRefWatchDelegate(_mainView) ] as Array<Views or InputDelegates>;
    }

    function getPeriodLength() as Number  {
        return _periodLength;
    }

    function setPeriodLength(length) {
        _periodLength = length;
        Application.Storage.setValue("PERIOD_LENGTH", length);
    }

    function getNumPeriods() as Number {
        return _numPeriods;
    }

    function setNumPeriods(numPeriods) {
        _numPeriods = numPeriods;
        Application.Storage.setValue("NUM_PERIODS", _numPeriods);
    }

}

function getApp() as FootballRefWatchApp {
    return Application.getApp() as FootballRefWatchApp;
}