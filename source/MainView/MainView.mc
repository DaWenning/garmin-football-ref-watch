import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Attention;

class MainView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainView(dc));    
    }

    function onShow() as Void {
        WatchUi.pushView(new Rez.Menus.PositionSelectMenu(), new PositionSelectMenuDelegate(), WatchUi.SLIDE_UP);
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

}