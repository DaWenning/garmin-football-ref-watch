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
        WatchUi.pushView(new Rez.Menus.MainMenu(), new FootballRefWatchMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(keyEvent) as Boolean {
    
        return true;
    }

    function onTap(clickEvent) as Boolean {
        var coords = clickEvent.getCoordinates();

        //var x = coords[0];
        var y = coords[1];


         if ( y > 200) {
            System.println("Pushing Umpire View ... ");
            var view = new UmpireView();
            WatchUi.pushView(view, new UmpireDelegate(view), WatchUi.SLIDE_UP);
         }
         else {
            System.println("Pushing Backjudge View ...");
            var view = new BackJudgeView();
            WatchUi.pushView(view, new BackJudgeDelegate(view), WatchUi.SLIDE_UP);
         }


        return true;
    }
}