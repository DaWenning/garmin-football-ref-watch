import Toybox.Lang;
import Toybox.WatchUi;

class MainDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        return true;
    }

    function onBack() as Boolean {
        //WatchUi.pushView(new Rez.Menus.MainMenu(), new FootballRefWatchMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(keyEvent) as Boolean {
    
        return true;
    }

    function onTap(clickEvent) as Boolean {

        return true;
    }
}