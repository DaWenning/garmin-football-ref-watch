import Toybox.WatchUi;

class TimeoutButton extends WatchUi.Drawable
{

    private var _home;

    function initialize(params) {
        Drawable.initialize(params);

        _home  = params.get(:home);
    }

    function draw(dc) {
        var pX = 0;
        dc.setColor(Graphics.COLOR_RED,Graphics.COLOR_TRANSPARENT);
        if (! _home) {
            pX = dc.getWidth() - 75;
            dc.setColor(Graphics.COLOR_BLUE,Graphics.COLOR_TRANSPARENT);
        }
        var pWidth =  75;//Math.floor(dc.getWidth() / 4) - 2;
        var pHeight = dc.getHeight();
        //drawComplex(dc,pX,pY,pWidth,pHeight);
        dc.fillRectangle(pX, 0,pWidth,pHeight);
    }

    function drawComplex(dc, pX, pY, pWidth, pHeight) {

        // if (_isSelected) {
        //     dc.setColor(Graphics.COLOR_RED,Graphics.COLOR_TRANSPARENT);
        //     dc.fillRectangle(pX,pY,pWidth,pHeight);
        // } else {
        //     dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        //     dc.drawRectangle(pX,pY,pWidth,pHeight);
        // }       
    }

    function setSelected(selected) {
        //_isSelected = selected;
    }
}