import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class UmpireView extends WatchUi.View {

    private var _dayTimeElement;
    private var _dayTimeTimer;

    private var _downElement;
    private var _currentDown;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Umpire(dc));

        _dayTimeElement = findDrawableById("daytime");
        _dayTimeTimer = new Timer.Timer();
        _dayTimeTimer.start(method(:updateDayTime), 1000, true);

        _downElement = findDrawableById("down");
        _currentDown = 1;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        updateDayTime();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        _dayTimeTimer.stop();
    }


    function updateDayTime() as Void {
        var myTime = System.getClockTime();
        _dayTimeElement.setText(myTime.hour.format("%02d") + ":" + myTime.min.format("%02d")+ ":" + myTime.sec.format("%02d"));
        WatchUi.requestUpdate();
    }

    function nextDown() {
        _currentDown ++;
        if (_currentDown == 2) {
            var vibeData = [new Attention.VibeProfile(100, 200), new Attention.VibeProfile(0, 100), new Attention.VibeProfile(100, 200)];
            Attention.vibrate(vibeData);
        }
        else if (_currentDown == 3) {
            var vibeData = [new Attention.VibeProfile(100, 200), new Attention.VibeProfile(0, 100), new Attention.VibeProfile(100, 200), new Attention.VibeProfile(0, 100), new Attention.VibeProfile(100, 200)];
            Attention.vibrate(vibeData);
        }
        else if (_currentDown == 4) {
            var vibeData = [new Attention.VibeProfile(100, 400), new Attention.VibeProfile(0, 100), new Attention.VibeProfile(100, 400)];
            Attention.vibrate(vibeData);
        }
        else if (_currentDown == 5) {
            _currentDown = 1;
            var vibeData = [new Attention.VibeProfile(100, 1000)];
            Attention.vibrate(vibeData);
        }
        _downElement.setText(_currentDown.toString());
        WatchUi.requestUpdate();
    }

    function resetDown() {
        _currentDown = 1;
        _downElement.setText(_currentDown.toString());
        var vibeData = [new Attention.VibeProfile(100, 200)];
            Attention.vibrate(vibeData);
        WatchUi.requestUpdate();
    }

    
}
