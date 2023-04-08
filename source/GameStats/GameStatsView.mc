import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class GameStatsView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.GameStats(dc));

        var startTimes = Application.getApp().getStartTimes();
        var endTimes   = Application.getApp().getEndTimes();

        for (var i = 0; i < Application.getApp().getNumPeriods(); i++) {
            var start = null;
            var end = null;
            
            if (startTimes.size() > i) {  start = startTimes[i]; }
            if (endTimes.size() > i)   {  end   = endTimes[i];   }
            
            if (start != null) {
                var time = start.hour.format("%02d") + ":" + start.min.format("%02d");
                var duration = 0;
                System.println(start.hour * 60 + start.min);
                
                if (end != null) {
                    time += " - " + end.hour.format("%02d") + ":" + end.min.format("%02d");
                    System.println(end.hour * 60 + end.min);
                    duration = (end.hour * 60 + end.min) - (start.hour * 60 + start.min);
                }
                var timeDraw = findDrawableById("time_" + i) as Text;
                timeDraw.setText(time);
                System.println(i + ": " + time);

                var durationDraw = findDrawableById("duration_" + i) as Text;
                durationDraw.setText(duration.format("%02d"));
                System.println(i + ": " + duration.format("%02d"));
            }
            else {
                System.println(i + ": No Time ..." );
                var draw = findDrawableById("time_" + i) as Text;
                draw.setText(" - / - ");
                var durationDraw = findDrawableById("duration_" + i) as Text;
                durationDraw.setText("-/-");
            }
            
        }
    }

    function onShow() as Void {  
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onHide() as Void {
        
    }
}