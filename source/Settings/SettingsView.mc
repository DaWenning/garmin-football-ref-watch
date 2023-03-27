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

        setQuarterLength(12);
        setNumQuarters(4);
        

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

    
    function setQuarterLength(newLength) {
        var d8 = findDrawableById("QL_8_BTN") as BgFill;
        var d10 = findDrawableById("QL_10_BTN") as BgFill;
        var d12 = findDrawableById("QL_12_BTN") as BgFill;
        var d15 = findDrawableById("QL_12_BTN") as BgFill;

        d8.setSelected(false);
        d10.setSelected(false);
        d12.setSelected(false);
        d15.setSelected(false);

        var ds = findDrawableById("QL_" + newLength + "_BTN") as BgFill;
        ds.setSelected(true);
    }

    function setNumQuarters(numQuarters) {
        var n1 = findDrawableById("NQ_1_BTN") as BgFill;
        var n2 = findDrawableById("NQ_2_BTN") as BgFill;
        var n3 = findDrawableById("NQ_3_BTN") as BgFill;
        var n4 = findDrawableById("NQ_4_BTN") as BgFill;

        n1.setSelected(false);
        n2.setSelected(false);
        n3.setSelected(false);
        n4.setSelected(false);

        var ns = findDrawableById("NQ_" + numQuarters + "_BTN") as BgFill;
        ns.setSelected(true);
    }
}