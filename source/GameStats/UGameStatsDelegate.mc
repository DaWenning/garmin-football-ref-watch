import Toybox.Lang;
import Toybox.WatchUi;

class UGameStatsDelegate extends WatchUi.BehaviorDelegate {


    function initialize(view) {
        BehaviorDelegate.initialize();
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