import Toybox.WatchUi;

class SettingsButton extends WatchUi.Drawable {

    private var _color, _string;

    public function initialize(params) {
        // You should always call the parent's initializer and
        // in this case you should pass the params along as size
        // and location values may be defined.
        Drawable.initialize(params);
    }
}
  