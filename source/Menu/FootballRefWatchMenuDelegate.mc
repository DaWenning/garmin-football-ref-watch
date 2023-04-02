import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class FootballRefWatchMenuDelegate extends WatchUi.MenuInputDelegate {

    private var _mainView;

    function initialize(_view) {
        MenuInputDelegate.initialize();
        _mainView = _view;
    }

    function onBack() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
    
    function onMenuItem(item as Symbol) as Void {
        
        if (item == :start_game) {
            //WatchUi.popView(WatchUi.SLIDE_DOWN);
        } else if (item == :stats_of_last_game) {
            System.println("item 2");        
        } else if (item == :resetTimer) {
            _mainView .resetStartOfGame();
        } else if (item == :settings) {
            var settingsView = new SettingsView(_mainView);
            WatchUi.pushView(settingsView, new SettingsBehaviorDelegate(settingsView), WatchUi.SLIDE_UP);
        } else if (item == :exit) {
            System.exit();
        }
    }

}