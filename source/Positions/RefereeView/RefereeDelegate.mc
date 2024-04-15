import Toybox.Lang;
import Toybox.WatchUi;

class RefereeDelegate extends WatchUi.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean { 
        WatchUi.pushView(new Rez.Menus.RefereeMenu(), new RefereeMenuDelegate(), WatchUi.SLIDE_UP);
        return true; 
    }
    function onBack() as Boolean { 

        _view.startDownClock(25);
        
        return true; 
    }
    function onKey(keyEvent) as Boolean { 
        if ( keyEvent.getKey() == 4) {
            _view.startDownClock(40);
        }
        return true; 
    }
    function onTap(clickEvent) as Boolean {

            return true;
    }

}