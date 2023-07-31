import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class PositionSelectMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();       
    }

    function onBack() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
    
    function onMenuItem(item as Symbol) as Void {
        
        if (item == :umpire) {
            var view = new UmpireView();
            WatchUi.pushView(view, new UmpireDelegate(view), WatchUi.SLIDE_UP);
        } else if (item == :backjudge) {
            var view = new BackJudgeView();
            WatchUi.pushView(view, new BackJudgeDelegate(view), WatchUi.SLIDE_UP);
        } else if (item == :referee) {
            var view = new RefereeView();
            WatchUi.pushView(view, new RefereeDelegate(view), WatchUi.SLIDE_UP);
        } else {
            System.exit();
        }
    }

}