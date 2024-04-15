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
        /*
        var coords = clickEvent.getCoordinates();

        //var x = coords[0];
        var y = coords[1];

        var settings = System.getDeviceSettings();
        
        var button = Math.floor(settings.screenHeight / 3);

         if (y > 0 &&  button >= y ) {
            System.println("Umpire");
            var view = new UmpireView();
            WatchUi.pushView(view, new UmpireDelegate(view), WatchUi.SLIDE_UP);
         }
         else if (y > button &&  2*button >= y ){
            System.println("Backjudge");
            var view = new BackJudgeView();
            WatchUi.pushView(view, new BackJudgeDelegate(view), WatchUi.SLIDE_UP);
         }
         else {
            System.println("Referee");
            var view = new RefereeView();
            WatchUi.pushView(view, new RefereeDelegate(view), WatchUi.SLIDE_UP);
         }

        System.println("Y Koord: "  + y);

        return true;*/
    }
}