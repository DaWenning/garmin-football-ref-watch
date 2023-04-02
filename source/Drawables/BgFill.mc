import Toybox.WatchUi;

class SelectButton extends WatchUi.Drawable
{
    private var _pos;
    private var _height;

    private var _isSelected;


    function initialize(params) {
        Drawable.initialize(params);

        _pos  = params.get(:pos);
        _height = params.get(:height);

        _isSelected = false;
    }

    function draw(dc) {
        var pX = Math.floor(dc.getWidth() / 4) * _pos + (_pos * 2);
        var pY = dc.getHeight() * _height;
        var pWidth =  Math.floor(dc.getWidth() / 4) - 2;
        var pHeight = dc.getHeight() * 0.15;
        drawComplex(dc,pX,pY,pWidth,pHeight);
    }

    function drawComplex(dc, pX, pY, pWidth, pHeight) {

        if (_isSelected) {
            dc.setColor(Graphics.COLOR_RED,Graphics.COLOR_TRANSPARENT);
            dc.fillRectangle(pX,pY,pWidth,pHeight);
        } else {
            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawRectangle(pX,pY,pWidth,pHeight);
        }       
    }

    function setSelected(selected) {
        _isSelected = selected;
    }
}