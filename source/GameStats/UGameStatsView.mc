import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class UGameStatsView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.UGameStats(dc));
    }

    function onShow() as Void {  

        var _usedTimeoutsHome = Application.getApp().getUsedTimeoutsHome();
        var _usedTimeoutsAway = Application.getApp().getUsedTimeoutsAway();

        for (var i = 0; i < 6; i++) {
            System.println("Index: " + i);
            var homeLabel = findDrawableById("to_home_" + i) as Text;
            var awayLabel = findDrawableById("to_away_" + i) as Text;
            System.println(_usedTimeoutsHome[i]);
            System.println(_usedTimeoutsAway[i]);
            if (_usedTimeoutsHome[i] != null) {System.println("TO HOME["+i+"]: " + _usedTimeoutsHome[i]); homeLabel.setText(_usedTimeoutsHome[i] + "");}
            if (_usedTimeoutsAway[i] != null) {System.println("TO AWAY["+i+"]: " + _usedTimeoutsAway[i]); awayLabel.setText(_usedTimeoutsAway[i] + "");}
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onHide() as Void {
        
    }
}