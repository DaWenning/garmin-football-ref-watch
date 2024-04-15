import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class RefereeView extends WatchUi.View {

    private var _dayTimeElement;
    private var _dayTimeTimer;

    private var _downclockElement;    
    private var _downclockTimer; 
    

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Referee(dc));

        _dayTimeElement = findDrawableById("daytime");
        _dayTimeTimer = new Timer.Timer();
        _dayTimeTimer.start(method(:updateDayTime), 1000, true);

        _downclockElement = findDrawableById("downclock") as Text;
        _downclockTimer = new Timer.Timer();  

        WatchUi.requestUpdate();
    }

    function onShow() as Void {
        updateDayTime();
    }

    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    function onHide() as Void {
        _dayTimeTimer.stop();
        _downclockTimer.stop();
    }

    function updateDayTime() as Void {
        var myTime = System.getClockTime();
        _dayTimeElement.setText(myTime.hour.format("%02d") + ":" + myTime.min.format("%02d")+ ":" + myTime.sec.format("%02d"));
        WatchUi.requestUpdate();
    }

    function startDownClock(time) {
        if (_downclockTimer == null) {
            _downclockTimer = new Timer.Timer();
            Application.getApp().setDownClockRunning(false);
        }
        System.println("StartDownClock");
        
        Application.getApp().resetDownClockTime(time * 10);
        _downclockTimer.start(method(:updateDownclock), 100, true); 
        Attention.vibrate([new Attention.VibeProfile(100, 200)]);
        
    }

    function updateDownclock() {
        if (Application.getApp().getDownClockTime() == 150) {
            Attention.vibrate([new Attention.VibeProfile(100, 500)]);
        }
        else if (Application.getApp().getDownClockTime() == 0) {
            Attention.vibrate([new Attention.VibeProfile(100, 300),new Attention.VibeProfile(100, 300),new Attention.VibeProfile(100, 500)]);
            _downclockTimer.stop();
        }
        Application.getApp().decrementDownClockTime();
        setDownClockElementText();
        WatchUi.requestUpdate();
    }

    function setDownClockElementText() {
        var time = Application.getApp().getDownClockTime();
        
        var secs = Math.floor(time/10);
        _downclockElement.setText(secs.format("%02d"));
    }


}