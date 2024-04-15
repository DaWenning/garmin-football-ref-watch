import Toybox.Lang;
import Toybox.WatchUi;

class BJGameStatsDelegate extends WatchUi.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        return true;
    }

    function onBack() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }

    function onKey(keyEvent) as Boolean {
        
        return true;
    }

    function onTap(clickEvent) as Boolean {

        return true;
    }

}