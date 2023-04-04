import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application;


class Worker {

    private var _periodLength;
    private var _numPeriods;

    function initialize() {
        _periodLength = Properties.getValue("periodLength");
        if (_periodLength == null) {
            _periodLength = 12;
            //Application.Storage.setValue("PERIOD_LENGTH", _periodLength);
            Application.Properties.setValue("periodLength", _periodLength);
        }

        // _numPeriods = Application.Storage.getValue("NUM_PERIODS");
        _numPeriods = Properties.getValue("numPeriods");
        if (_numPeriods == null) {
            _numPeriods = 4;
            // Application.Storage.setValue("NUM_PERIODS", _numPeriods);
            Application.Properties.setValue("numPeriods", _numPeriods);
        }

    }


    function getPeriodLength() { return _periodLength; }
    function setPeriodLength(val) { _periodLength = val; Properties.setValue("periodLength", _periodLength);}

    function getNumPeriods() { return _numPeriods; }
    function setNumPeriods(val) { _numPeriods = val; Properties.setValue("numPeriods", _numPeriods);}
    
}