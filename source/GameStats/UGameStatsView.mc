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
        for (var i = 1; i <= 6; i++) {
            var homeLabel = findDrawableById("to_home_" + i);
            var awayLabel = findDrawableById("to_away_" + i);
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