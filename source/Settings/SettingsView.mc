import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class SettingsView extends WatchUi.View {

    private var ql_8_btn, ql_10_btn, ql_12_btn, ql_15_btn;
    private var nq_1_btn, nq_2_btn, nq_3_btn, nq_4_btn;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.Settings(dc));

        ql_8_btn  = findDrawableById("ql_8_btn");
        ql_10_btn = findDrawableById("ql_10_btn");
        ql_12_btn = findDrawableById("ql_12_btn");
        ql_15_btn = findDrawableById("ql_15_btn");

        nq_1_btn = findDrawableById("nq_1_btn");
        nq_2_btn = findDrawableById("nq_2_btn");
        nq_3_btn = findDrawableById("nq_3_btn");
        nq_4_btn = findDrawableById("nq_4_btn");

        setQuarterLength(8);
        setNumQuarters(3);
        

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

    }

    function setNumQuarters(numQuarters) {

    }
}