import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class UmpireView extends WatchUi.View {

    private var _dayTimeElement;
    private var _dayTimeTimer;

    private var _downElement;
    private var _currentDown;

    private var _isInTimeout;
    private var _timeoutTimer;
    private var _timeoutTime;
    // private var _timeoutHomeSelectable;
    // private var _timeoutAwaySelectable;

    private var _timeoutHomeLabel;
    private var _timeoutAwayLabel;

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

        _timeoutTimer = new Timer.Timer();
        _timeoutTime = 600;
        _isInTimeout = false;

        _timeoutHomeLabel = findDrawableById("numHomeTimeouts") as Text;
        _timeoutAwayLabel = findDrawableById("numAwayTimeouts") as Text;

        //_timeoutHomeSelectable = findDrawableById("timeoutHomeSelectable");
        //_timeoutAwaySelectable = findDrawableById("timeoutAwaySelectable");
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

    function isInTimeout() { return _isInTimeout; }



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

    function startTimeout(isHomeTeam) {
        _isInTimeout = true;
        _timeoutTime = 600;
        _timeoutTimer.start(method(:updateTimeoutTime), 100, true); 
        _downElement.setText("1:00");
        WatchUi.requestUpdate();

        if (isHomeTeam) {
            _downElement.setColor(Graphics.COLOR_RED);
            var num = Application.getApp().decrementTimeoutsHome();
            System.println("Timeouts remaining: " + num);
            _timeoutHomeLabel.setText(num.toString());
        }
        else {
            _downElement.setColor(Graphics.COLOR_BLUE);
            var num = Application.getApp().decrementTimeoutsAway();
            System.println("Timeouts remaining: " + num);
            _timeoutAwayLabel.setText(num.toString());
        }
        
    }

    function updateTimeoutTime() {
        _timeoutTime --;
        _downElement.setText("0:" + Math.floor(_timeoutTime / 10).format("%02d"));
        WatchUi.requestUpdate();
        if (_timeoutTime == 100) { // 10 Second Warning
            var vibeData = [new Attention.VibeProfile(100, 300), 
                            new Attention.VibeProfile(0, 100), 
                            new Attention.VibeProfile(100, 300)];
            Attention.vibrate(vibeData);
        }
        else if (_timeoutTime == 0) {
            _isInTimeout = false;
            _timeoutTimer.stop();
            var vibeData = [new Attention.VibeProfile(100, 500), 
                            new Attention.VibeProfile(0, 100), 
                            new Attention.VibeProfile(100, 500)];
            Attention.vibrate(vibeData);
            _downElement.setColor(Graphics.COLOR_WHITE);
            _downElement.setText(_currentDown.toString());
        }
    }

}
