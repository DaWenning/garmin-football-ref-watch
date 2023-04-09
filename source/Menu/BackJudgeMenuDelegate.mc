import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class BackJudgeMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();       
    }

    function onBack() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
    
    function onMenuItem(item as Symbol) as Void {
        
        if (item == :back_to_position) {
            WatchUi.pushView(new MainView(), new MainDelegate(), WatchUi.SLIDE_UP);
        } else if (item == :start_game) {
            //WatchUi.popView(WatchUi.SLIDE_UP);
        } else if (item == :stats_of_last_game) {
            var statsView = new GameStatsView();
            WatchUi.pushView(statsView, new GameStatsDelegate(statsView), WatchUi.SLIDE_UP);      
        } else if (item == :resetQuarter) {
            Application.getApp().resetGameClock();
        } else if (item == :restartGame) {
            Application.getApp().restartGame();
        } else if (item == :settings) {
            var settingsView = new SettingsView();
            WatchUi.pushView(settingsView, new SettingsBehaviorDelegate(settingsView), WatchUi.SLIDE_UP);      
        } else if (item == :exit) {
            System.exit();
        }
    }

}