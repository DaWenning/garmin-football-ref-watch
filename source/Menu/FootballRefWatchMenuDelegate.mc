import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class FootballRefWatchMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();       
    }

    function onBack() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
    
    function onMenuItem(item as Symbol) as Void {
        
        if (item == :start_game) {
            //WatchUi.popView(WatchUi.SLIDE_DOWN);
            Application.getApp().restartGame();
        } else if (item == :stats_of_last_game) {
            System.println("Displaying Stats of Game ... ");        
        } else if (item == :resetTimer) {
            //_mainView .resetStartOfGame();
            Application.getApp().resetGameClock();
        } else if (item == :settings) {
            var settingsView = new SettingsView();
            WatchUi.pushView(settingsView, new SettingsBehaviorDelegate(settingsView), WatchUi.SLIDE_UP);
        // } else if (item == :item1) {
            
        // } else if (item == :item2) {
        //     System.println("Item 2 ... ");        
        } else if (item == :exit) {
            System.exit();
        }
    }

}