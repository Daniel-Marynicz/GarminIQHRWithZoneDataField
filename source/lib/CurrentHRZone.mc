using Toybox.Math;

class CurrentHRZone {

	private var heartRateZones;
	
	function initialize(hrZones) {
		heartRateZones = hrZones;
	}
	
	function compute(currentHeartRate)
	{

	    var currentZone = 0.0f;
	    var fraction = 0.0f;
	    var range = 0;
	    //zone 0
    	switch (true) {
	    	case currentHeartRate < heartRateZones[0]:
	    		range = heartRateZones[0];
	    		fraction = currentHeartRate;
	    		currentZone = 0.0f;
	    		break;
				//zone 1
	    	case currentHeartRate >=  heartRateZones[0] && currentHeartRate <= heartRateZones[1]:
	    		range = heartRateZones[1] - heartRateZones[0] + 1; 
	    		fraction = currentHeartRate - heartRateZones[0];
	    		currentZone = 1.0f;
	    		break;
	    		//zone 2
	    	case currentHeartRate >  heartRateZones[1] && currentHeartRate <= heartRateZones[2]:
	    		range = heartRateZones[2] - heartRateZones[1];
	    		fraction = currentHeartRate - heartRateZones[1] - 1;
	    		currentZone = 2.0f;
	    		break;
	    		//zone 3
	    	case currentHeartRate >  heartRateZones[2] && currentHeartRate <= heartRateZones[3]:
	    		range = heartRateZones[3] - heartRateZones[2];
	    		fraction = currentHeartRate - heartRateZones[2] - 1;
	    		currentZone = 3.0f;
	    		break;
	    		//zone 4
	    	case currentHeartRate >  heartRateZones[3] && currentHeartRate <= heartRateZones[4]:
	    		range = heartRateZones[4] - heartRateZones[3];
	    		fraction = currentHeartRate - heartRateZones[3] - 1;
	    		currentZone = 4.0f;
	    		break;
	    		//zone 5
	    	case currentHeartRate >  heartRateZones[4] && currentHeartRate <= heartRateZones[5]:
	    		range = heartRateZones[5] - heartRateZones[4];
	    		fraction = currentHeartRate - heartRateZones[4] - 1;
	    		currentZone = 5.0f;
	    		break;
    		case currentHeartRate > heartRateZones[5]:
    			return 6.0f;
    		default:
	    		return 6.0f;
		}
    	
    	var result = currentZone.toNumber().toFloat() + fraction.toNumber().toFloat() / range.toNumber().toFloat();
    	
    	return roundDown(result);
    }
    
    function round(number)
	{
		return Math.round(number * 100) / 100;
	}
	
	function roundDown(number)
	{
		return (number * 10 ).toNumber().toFloat() / 10;
	}
}
