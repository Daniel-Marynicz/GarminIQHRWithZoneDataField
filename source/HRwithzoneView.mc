using Toybox.WatchUi;
using Toybox.Graphics;

class HRwithzoneView extends DataFieldWithFiveValuesView {

    protected var hrZoneCalc;

    function initialize() {
        DataFieldWithFiveValuesView.initialize();
        onSettingsChanged();
    }
    
    function onSettingsChanged()
    {
    	var heartRateZones = UserProfile.getHeartRateZones(UserProfile.getCurrentSport());
        hrZoneCalc = new CurrentHRZone(heartRateZones);
        labelValue = Rez.Strings.label;
    }

    
    // The given info object contains all the current workout information.
    // Calculate a value and save it locally in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        var currentHRZone = 0.0f;
        var currentHeartRate = 0.0f;
        if(info has :currentHeartRate && info.currentHeartRate != null){
            currentHeartRate = info.currentHeartRate;
            currentHRZone = hrZoneCalc.compute(info.currentHeartRate);
        }
        mainValue = "___";
        bottomRightValue = "_._z";
        if (currentHRZone > 0.0f) {
        	bottomRightValue =  currentHRZone.format("%.1f") + "z";
        }
        if (currentHeartRate > 0.0f) {
        	mainValue = currentHeartRate.format("%d");
        }
    }
}
