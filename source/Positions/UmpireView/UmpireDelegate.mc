import Toybox.Lang;
import Toybox.WatchUi;

class UmpireDelegate extends WatchUi.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        if (!_view.isInTimeout()) { WatchUi.pushView(new Rez.Menus.UmpireMenu(), new UmpireMenuDelegate(), WatchUi.SLIDE_UP); }
        else {_view.stopTimeout();}
        return true;
    }

    function onBack() as Boolean {
        if (!_view.isInTimeout()) {_view.resetDown();}
        return true;
    }

    function onKey(keyEvent) as Boolean {
        
        if (keyEvent.getKey() == 4) {
            // Start / Stop Timer
            if (!_view.isInTimeout()) { _view.nextDown(); }
        }

        return true;
    }

    function onTap(clickEvent) as Boolean {


        return true;
    }

    function onHold(holdEvent) as Boolean {

        var coords = holdEvent.getCoordinates();
        var settings = System.getDeviceSettings();

        var x = coords[0];

        if (x < 75) {
            homeTimeout();
        }
        else if (x > (settings.screenWidth - 75)) {
            awayTimeout();
        }
        return true;
    }

    
    function homeTimeout() as Boolean { 
        if (!_view.isInTimeout() && Application.getApp().getTimeoutsHome() != 0) {  _view.startTimeout(true); }        
        return true;
    }

    function awayTimeout() as Boolean { 
        if (!_view.isInTimeout() && Application.getApp().getTimeoutsAway() != 0) { _view.startTimeout(false); }
        return true; 
    }
}