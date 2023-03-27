import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class FootballRefWatchApp extends Application.AppBase {

    private var quarterLength;
    private var numQuarters;

    private var startTimes;

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
        quarterLength = Application.Storage.getValue("QUARTER_LENGTH");
        //quarterLength = 0.1;
        if (quarterLength == null) {
            quarterLength = 12;
            Application.Storage.setValue("QUARTER_LENGTH", quarterLength);
        }

        numQuarters = Application.Storage.getValue("NUM_QUARTERS");
        if (numQuarters == null) {
            numQuarters = 4;
            Application.Storage.setValue("NUM_QUARTERS", numQuarters);
        }

        var _mainView = new FootballRefWatchView();

        return [ _mainView, new FootballRefWatchDelegate(_mainView) ] as Array<Views or InputDelegates>;
    }

    function getQuarterLength() as Number  {
        return quarterLength;
    }

}

function getApp() as FootballRefWatchApp {
    return Application.getApp() as FootballRefWatchApp;
}