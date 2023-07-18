import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class RefereeMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();       
    }

    function onBack() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
    
    function onMenuItem(item as Symbol) as Void {
        
        if (item == :back_to_position) {
            WatchUi.pushView(new MainView(), new MainDelegate(), WatchUi.SLIDE_UP);
        } else if (item == :start_game) {
            //WatchUi.popView(WatchUi.SLIDE_UP);
        } else if (item == :exit) {
            System.exit();
        }
    }

}