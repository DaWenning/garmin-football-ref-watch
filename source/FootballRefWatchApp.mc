import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class FootballRefWatchApp extends Application.AppBase {

    private var worker;

    function initialize() {
        AppBase.initialize();
        worker = new Worker();

        worker.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [new MainView(), new MainDelegate()] as Array<Views or InputDelegate>;
    }

    function getWorker() {
        return worker;
    }
}