import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class FootballRefWatchView extends WatchUi.View {

    private var _dayTimeElement;
    private var _dayTimeTimer;

    private var _gameclockElement;
    private var _gameclockTime;
    private var _gameclockTimer; 
    private var _gameclockRunning;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        _dayTimeElement = findDrawableById("daytime");
        _dayTimeTimer = new Timer.Timer();
        _dayTimeTimer.start(method(:updateDayTime), 1000, true);

        _gameclockElement = findDrawableById("gameclock") as Text;

        _gameclockTime = Application.getApp().getQuarterLength() * 60 * 10;
        updateDayTime();
        setGameclockElementText();
        
        WatchUi.requestUpdate();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
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
    }

    function updateDayTime() as Void {
        var myTime = System.getClockTime();
        _dayTimeElement.setText(myTime.hour.format("%02d") + ":" + myTime.min.format("%02d")+ ":" + myTime.sec.format("%02d"));
        WatchUi.requestUpdate();
    }
    function updateGameclock() as Void {
        
        if (_gameclockTime == 1200) {
            // Two Minute Warning
            var vibeData = [new Attention.VibeProfile(100, 750)];
            Attention.vibrate(vibeData);
        }
        else if (_gameclockTime == 0) {
            // End of Quarter
            toggleGameclock();
            var vibeData = [new Attention.VibeProfile(100, 300), 
                            new Attention.VibeProfile(0, 100), 
                            new Attention.VibeProfile(100, 300), 
                            new Attention.VibeProfile(0, 100), 
                            new Attention.VibeProfile(100, 300)];
            Attention.vibrate(vibeData);
            return;
        }

        _gameclockTime = _gameclockTime - 1;
        setGameclockElementText();

        WatchUi.requestUpdate();
    }
    function setGameclockElementText() {
        var mins = Math.floor(_gameclockTime / 600);
        var secs = Math.floor((_gameclockTime - (mins * 600))/10);
        _gameclockElement.setText(mins.format("%02d") + ":" + secs.format("%02d"));
    }
    function toggleGameclock() {
        if (_gameclockTimer == null) {
            _gameclockTimer = new Timer.Timer();
            _gameclockRunning = false;
        }

        if (! _gameclockRunning) {
            _gameclockTimer.start(method(:updateGameclock), 100, true);
            _gameclockRunning = true;
        }
        else {
            _gameclockTimer.stop();
            _gameclockRunning = false;
        }            
    }
    function resetTimer() {
        if (_gameclockTimer != null) {
            _gameclockTimer.stop();
        }

        _gameclockRunning = false;
        _gameclockTime = Application.getApp().getQuarterLength() * 60 * 10;
        setGameclockElementText();
        WatchUi.requestUpdate();
    }
}
