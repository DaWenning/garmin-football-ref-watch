import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class FootballRefWatchApp extends Application.AppBase {

    private var worker;

    private var _periodLength;
    private var _numPeriods;

    private var _startTimes = [];
    private var _stopTimes = [];

    function initialize() {
        AppBase.initialize();
        worker = new Worker();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        
        _periodLength = Application.Storage.getValue("PERIOD_LENGTH");
        if (_periodLength == null) {
            _periodLength = 12;
            Application.Storage.setValue("PERIOD_LENGTH", _periodLength);
        }

        _numPeriods = Application.Storage.getValue("NUM_PERIODS");
        if (_numPeriods == null) {
            _numPeriods = 4;
            Application.Storage.setValue("NUM_PERIODS", _numPeriods);
        }



        //var _mainView = new BackJudgeView();

        //return [ _mainView, new BackJudgeDelegate(_mainView) ] as Array<Views or InputDelegates>;
        return [new MainView(), new MainDelegate()] as Array<Views or InputDelegate>;
    }

    function getWorker() {
        return worker;
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