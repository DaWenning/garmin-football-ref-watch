import Toybox.Lang;
import Toybox.WatchUi;

class SettingsBehaviorDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
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
        if (keyEvent.getKey() == 4) {

        }
        return true;
    }

    function onTap(clickEvent) as Boolean {
        System.println("CLICKING SOMETHING ... ");
        return true;
    }
}