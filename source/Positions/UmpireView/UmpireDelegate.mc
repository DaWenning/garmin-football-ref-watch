import Toybox.Lang;
import Toybox.WatchUi;

class UmpireDelegate extends WatchUi.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        return true;
    }

    function onBack() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new FootballRefWatchMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(keyEvent) as Boolean {
        
        if (keyEvent.getKey() == 4) {
            // Start / Stop Timer
            //_mainView.toggleGameclock();
        }

        return true;
    }

    function onTap(clickEvent) as Boolean {

        return true;
    }
}