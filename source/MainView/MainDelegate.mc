import Toybox.Lang;
import Toybox.WatchUi;

class MainDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        System.exit();
    }

    function onBack() as Boolean {
        
        return true;
    }

    function onKey(keyEvent) as Boolean {
    
        return true;
    }

    function onTap(clickEvent) as Boolean {
        var coords = clickEvent.getCoordinates();

        //var x = coords[0];
        var y = coords[1];

        var settings = System.getDeviceSettings();


         if ( y > (settings.screenWidth / 2)) {
            var view = new UmpireView();
            WatchUi.pushView(view, new UmpireDelegate(view), WatchUi.SLIDE_UP);
         }
         else {
            var view = new BackJudgeView();
            WatchUi.pushView(view, new BackJudgeDelegate(view), WatchUi.SLIDE_UP);
         }

        System.println("Y Koord: "  + y);

        return true;
    }
}