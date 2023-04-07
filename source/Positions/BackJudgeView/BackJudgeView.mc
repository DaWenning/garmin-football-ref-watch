import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class BackJudgeView extends WatchUi.View {

    private var TWO_MINUTES = 1200;

    private var _dayTimeElement;
    private var _dayTimeTimer;
    private var _gameclockElement;    
    private var _gameclockTimer;     

    private var _periodElement;
    private var _currentPeriod;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.BackJudge(dc));

        _currentPeriod = 1;

        _dayTimeElement = findDrawableById("daytime");
        _dayTimeTimer = new Timer.Timer();
        _dayTimeTimer.start(method(:updateDayTime), 1000, true);

        _gameclockElement = findDrawableById("gameclock") as Text;
        _periodElement = findDrawableById("period") as Text;
        _gameclockTimer = new Timer.Timer();
        
        WatchUi.requestUpdate();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {        
        updateDayTime();
        setGameClockElementText();
        setPeriodElementText();
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

    function toggleGameClock() {
        if (_gameclockTimer == null) {
            _gameclockTimer = new Timer.Timer();
            Application.getApp().setGameClockRunning(false);
        }

        if (! Application.getApp().isGameClockRunning()) {
            if (Application.getApp().getGameClockTime() == 0) {
                // ACTION: Set Next Period
                _currentPeriod ++;
                Application.getApp().setGameClockRunning(false);
                //_gameclockTime = Application.getApp().getPeriodLength() * 60 * 10;
                Application.getApp().resetGameClock();
                setGameClockElementText();
                setPeriodElementText();
            }
            else {
                // ACTION: start GameClock
                Attention.vibrate([new Attention.VibeProfile(50, 100)]);
                _gameclockTimer.start(method(:updateGameclock), 100, true); 
                Application.getApp().setGameClockRunning(true);
            }
        }
        else {
            // ACTION: stop GameClock
            Attention.vibrate([new Attention.VibeProfile(50, 100)]);
            _gameclockTimer.stop();
            Application.getApp().setGameClockRunning(false);
        }
    }
    
    function updateGameclock() as Void {

        if (Application.getApp().getGameClockTime() == TWO_MINUTES) {
            if ((_currentPeriod == 2 || _currentPeriod == 4) && Application.getApp().getNumPeriods() == 4) {
                // Two Minute Warning
                var vibeData = [new Attention.VibeProfile(100, 750)];
                Attention.vibrate(vibeData);
            }            
        }
        else if (Application.getApp().getGameClockTime() == 0) {
            // End of Period
            toggleGameClock();
            var vibeData = [new Attention.VibeProfile(100, 300), 
                            new Attention.VibeProfile(0, 100), 
                            new Attention.VibeProfile(100, 300), 
                            new Attention.VibeProfile(0, 100), 
                            new Attention.VibeProfile(100, 300)];
            Attention.vibrate(vibeData);
            return;
        }

        //_gameclockTime = _gameclockTime - 1;
        Application.getApp().decrementGameClockTime();
        setGameClockElementText();

        WatchUi.requestUpdate();
    }

    function setGameClockElementText() {
        var time = Application.getApp().getGameClockTime();
        var mins = Math.floor(time / 600);
        var secs = Math.floor((time - (mins * 600))/10);
        _gameclockElement.setText(mins.format("%02d") + ":" + secs.format("%02d"));
    }

    function setPeriodElementText() {
        _periodElement.setText(_currentPeriod + " / " + Application.getApp().getNumPeriods() + " Period");
    }





    /*function toggleGameClock() {
        if (_gameclockTimer == null) {
            _gameclockTimer = new Timer.Timer();
            Application.getApp().setGameClockRunning(false);
        }

        if (! Application.getApp().isGameClockRunning()) {

            if (Application.getApp().getGameClockTime() == 0) {
                // Next Period
                _currentPeriod ++;
                setPeriodElementText();
                resetPeriod();

            }
            else {
                Attention.vibrate([new Attention.VibeProfile(50, 100)]);
                _gameclockTimer.start(method(:updateGameclock), 100, true); 
                Application.getApp().setGameClockRunning(true);
            }            
        }
        else {
            Attention.vibrate([new Attention.VibeProfile(50, 100)]);
            _gameclockTimer.stop();
            Application.getApp().setGameClockRunning(false);
        }            
    }*/

    /*function resetStartOfGame() {
        if (_gameclockTimer != null) {
            _gameclockTimer.stop();
        }

        Application.getApp().setGameClockRunning(false);
        //_gameclockTime = Application.getApp().getPeriodLength() * 60 * 10;
        Application.getApp().resetGameClock();
        _currentPeriod = 1;
        setGameClockElementText();
        setPeriodElementText();
        WatchUi.requestUpdate();
    }*/

    /*function resetPeriod() {
        if (_gameclockTimer != null) {
            _gameclockTimer.stop();
        }

        Application.getApp().setGameClockRunning(false);
        //_gameclockTime = Application.getApp().getPeriodLength() * 60 * 10;
        Application.getApp().resetGameClock();
        setGameClockElementText();
        WatchUi.requestUpdate();
    }*/
}
