import Toybox.Lang;
import Toybox.WatchUi;

class SettingsBehaviorDelegate extends WatchUi.BehaviorDelegate {

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
        
        var coords = clickEvent.getCoordinates();

        var x = coords[0];
        var y = coords[1];

        // Quarter Length
        if (110 <= y && y < 195) {
            if (0 < x && x < 105)        { _view.setPeriodLength(8);  System.println("New Period Length: 8"); }
            else if (105 < x && x < 210) { _view.setPeriodLength(10); System.println("New Period Length: 10");}
            else if (210 < x && x < 315) { _view.setPeriodLength(12); System.println("New Period Length: 12");}
            else if (315 < x && x < 420) { _view.setPeriodLength(15); System.println("New Period Length: 15");}
        } 
        // Num Periods
        else if (230 <= y && y < 320) {
            if (0 < x && x < 105)        { _view.setNumPeriods(1); System.println("New Period Length: 8"); }
            else if (105 < x && x < 210) { _view.setNumPeriods(2); System.println("New Period Length: 10");}
            else if (210 < x && x < 315) { _view.setNumPeriods(3); System.println("New Period Length: 12");}
            else if (315 < x && x < 420) { _view.setNumPeriods(4); System.println("New Period Length: 15");}
        }

        return true;
    }
}