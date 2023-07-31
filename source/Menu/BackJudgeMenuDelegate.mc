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
            WatchUi.pushView(new Rez.Menus.PositionSelectMenu(), new PositionSelectMenuDelegate(), WatchUi.SLIDE_UP);
        } else if (item == :start_game) {
            //WatchUi.popView(WatchUi.SLIDE_UP);
        } else if (item == :stats_of_last_game) {
            var statsView = new BJGameStatsView();
            WatchUi.pushView(statsView, new BJGameStatsDelegate(statsView), WatchUi.SLIDE_UP);      
        } else if (item == :reset_quarter) {
            Application.getApp().resetGameClock();
        } else if (item == :restart_game) {
            Application.getApp().restartGame();
        } else if (item == :settings) {
            var settingsView = new SettingsView();
            WatchUi.pushView(settingsView, new SettingsBehaviorDelegate(settingsView), WatchUi.SLIDE_UP);      
        } else if (item == :exit) {
            System.exit();
        }
    }

}