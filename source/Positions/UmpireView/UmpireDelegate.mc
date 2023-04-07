import Toybox.Lang;
import Toybox.WatchUi;

class UmpireDelegate extends WatchUi.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

    function onBack() as Boolean {
        _view.resetDown();
        return true;
    }

    function onKey(keyEvent) as Boolean {
        
        if (keyEvent.getKey() == 4) {
            // Start / Stop Timer
            _view.nextDown();
        }

        return true;
    }

    function onTap(clickEvent) as Boolean {

        return true;
    }
}