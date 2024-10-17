import Toybox.Lang;
import Toybox.WatchUi;

class MainDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();

        WatchUi.pushView(new Rez.Menus.PositionSelectMenu(), new PositionSelectMenuDelegate(), WatchUi.SLIDE_UP); 
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.PositionSelectMenu(), new PositionSelectMenuDelegate(), WatchUi.SLIDE_UP); 
        return true;
    }

    function onBack() as Boolean {
        WatchUi.pushView(new Rez.Menus.PositionSelectMenu(), new PositionSelectMenuDelegate(), WatchUi.SLIDE_UP); 
        return true;
    }

    function onKey(keyEvent) as Boolean {
        WatchUi.pushView(new Rez.Menus.PositionSelectMenu(), new PositionSelectMenuDelegate(), WatchUi.SLIDE_UP); 
        return true;
    }

    function onTap(clickEvent) as Boolean {
        WatchUi.pushView(new Rez.Menus.PositionSelectMenu(), new PositionSelectMenuDelegate(), WatchUi.SLIDE_UP); 
        return true;
    }
}