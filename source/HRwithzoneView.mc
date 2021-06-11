using Toybox.WatchUi;
using Toybox.Graphics;

class HRwithzoneView extends DataFieldWithFiveValuesView {

    hidden var currentHRZoneCompute;
    hidden var heartRateZones;
	

    function initialize() {
        DataFieldWithFiveValuesView.initialize();
        heartRateZones = UserProfile.getHeartRateZones(UserProfile.getCurrentSport());
        var currentHRZoneCalc = new CurrentHRZone();
        currentHRZoneCompute = currentHRZoneCalc.method(:compute);
        labelValue = Rez.Strings.label;
    }

    
    // The given info object contains all the current workout information.
    // Calculate a value and save it locally in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        var currentHRZone = currentHRZoneCompute.invoke(heartRateZones, info);
        if(info has :currentHeartRate){
            if(info.currentHeartRate != null){
                mainValue = info.currentHeartRate;
            } else {
                mainValue = 0.0f;
            }
        }
        bottomRightValue =  currentHRZone.format("%.1f") + "z";
        mainValue = mainValue.format("%d");
    }
}
