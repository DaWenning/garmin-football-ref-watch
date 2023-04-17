import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class UmpireMenuDelegate extends WatchUi.MenuInputDelegate {

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
        } else if (item == :next_quarter) {
            //WatchUi.popView(WatchUi.SLIDE_UP);
            var nextQuarter = Application.getApp().incrementPeriod();
            if (nextQuarter == 3) {
                Application.getApp().resetTimeoutsHome();
                Application.getApp().resetTimeoutsAway();
            }
        } else if (item == :add_TO_home) {
            //WatchUi.popView(WatchUi.SLIDE_UP);
            Application.getApp().incrementTimeoutsHome();
        } else if (item == :add_TO_away) {
            //WatchUi.popView(WatchUi.SLIDE_UP);
            Application.getApp().incrementTimeoutsHome();
        } else if (item == :restart_game) {
            Application.getApp().restartGame();
        } else if (item == :exit) {
            System.exit();
        }
    }

}