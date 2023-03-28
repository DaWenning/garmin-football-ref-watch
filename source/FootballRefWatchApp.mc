import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class FootballRefWatchApp extends Application.AppBase {

    private var _quarterLength;
    private var _numQuarters;

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
        _quarterLength = Application.Storage.getValue("QUARTER_LENGTH");
        //_quarterLength = 0.5;
        if (_quarterLength == null) {
            _quarterLength = 12;
            Application.Storage.setValue("QUARTER_LENGTH", _quarterLength);
        }

        _numQuarters = Application.Storage.getValue("NUM_QUARTERS");
        if (_numQuarters == null) {
            _numQuarters = 4;
            Application.Storage.setValue("NUM_QUARTERS", _numQuarters);
        }



        var _mainView = new FootballRefWatchView();

        return [ _mainView, new FootballRefWatchDelegate(_mainView) ] as Array<Views or InputDelegates>;
    }

    function getQuarterLength() as Number  {
        return _quarterLength;
    }

    function setQuarterLength(length) {
        _quarterLength = length;
        Application.Storage.setValue("QUARTER_LENGTH", length);
    }

    function getNumQuarters() as Number {
        return _numQuarters;
    }

    function setNumQuarters(numQuarters) {
        _numQuarters = numQuarters;
        Application.Storage.setValue("NUM_QUATERS", _numQuarters);
    }

}

function getApp() as FootballRefWatchApp {
    return Application.getApp() as FootballRefWatchApp;
}