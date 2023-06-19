import Toybox.Lang;
import Toybox.WatchUi;

class BackJudgeDelegate extends WatchUi.BehaviorDelegate {

    private var _view;

    function initialize(view) {
        BehaviorDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        System.println("OnMenu");
        if ((System.getDeviceSettings().inputButtons & System.BUTTON_INPUT_DOWN) == 0) {
            if (! Application.getApp().isGameClockRunning()){
                WatchUi.pushView(new Rez.Menus.BackJudgeMenu(), new BackJudgeMenuDelegate(), WatchUi.SLIDE_UP);
            }
        }
        return true;
        
    }

    function onBack() as Boolean {
        System.println("OnBack");
        if ((System.getDeviceSettings().inputButtons & System.BUTTON_INPUT_DOWN) != 0) {
            if (! Application.getApp().isGameClockRunning()){
                WatchUi.pushView(new Rez.Menus.BackJudgeMenu(), new BackJudgeMenuDelegate(), WatchUi.SLIDE_UP);
            }
        }
        return true;
    }

    function onKey(keyEvent) as Boolean {
        
        if ( keyEvent.getKey() == 4) {
            if (!Application.getApp().isHalfTimeBreak()) {
                // Start / Stop Timer
                _view.toggleGameClock();
            }
        }
        else {
            System.println(keyEvent.getKey() + "");
        }

        return true;
    }

    function onTap(clickEvent) as Boolean {

        return true;
    }
}