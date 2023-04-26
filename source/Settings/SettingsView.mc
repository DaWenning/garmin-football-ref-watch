import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class SettingsView extends WatchUi.View {


    function initialize() {
        View.initialize();

    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Settings(dc));

        setPeriodLength(Application.getApp().getPeriodLength());
        setNumPeriods(Application.getApp().getNumPeriods());        

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

    
    function setPeriodLength(newLength) {
        var d8  = findDrawableById("QL_8_BTN")  as SelectButton;
        var d10 = findDrawableById("QL_10_BTN") as SelectButton;
        var d12 = findDrawableById("QL_12_BTN") as SelectButton;
        var d15 = findDrawableById("QL_15_BTN") as SelectButton;

        d8 .setSelected(false);
        d10.setSelected(false);
        d12.setSelected(false);
        d15.setSelected(false);

        var ds = findDrawableById("QL_" + newLength + "_BTN") as SelectButton;
        ds.setSelected(true);
        Application.getApp().setPeriodLength(newLength);
        Application.getApp().setGameClockRunning(false);
        Application.getApp().resetGameClock();
        //_mainView.resetStartOfGame();
        WatchUi.requestUpdate();
    }

    function setNumPeriods(numPeriods) {
        var n1 = findDrawableById("NQ_1_BTN") as SelectButton;
        var n2 = findDrawableById("NQ_2_BTN") as SelectButton;
        var n3 = findDrawableById("NQ_3_BTN") as SelectButton;
        var n4 = findDrawableById("NQ_4_BTN") as SelectButton;

        n1.setSelected(false);
        n2.setSelected(false);
        n3.setSelected(false);
        n4.setSelected(false);

        var ns = findDrawableById("NQ_" + numPeriods + "_BTN") as SelectButton;
        ns.setSelected(true);
        Application.getApp().setNumPeriods(numPeriods);
        Application.getApp().setGameClockRunning(false);
        Application.getApp().resetGameClock();
        //_mainView.resetStartOfGame();
        WatchUi.requestUpdate();
    }
}