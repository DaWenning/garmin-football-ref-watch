import Toybox.Lang;
import Toybox.WatchUi;

class BackJudgeDelegate extends WatchUi.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        return true;
    }

    function onBack() as Boolean {
        if (! Application.getApp().isGameClockRunning()){
            WatchUi.pushView(new Rez.Menus.BackJudgeMenu(), new BackJudgeMenuDelegate(), WatchUi.SLIDE_UP);
        }
        return true;
    }

    function onKey(keyEvent) as Boolean {
        
        if (keyEvent.getKey() == 4 && !Application.getApp().isHalfTimeBreak()) {
            // Start / Stop Timer
            _view.toggleGameClock();
        }

        return true;
    }

    function onTap(clickEvent) as Boolean {

        return true;
    }
}