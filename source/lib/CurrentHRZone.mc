class CurrentHRZone {

	function compute(heartRateZones, info)
	{
	  	if(!hasHR(info)){
	  		return 0.0f;
	    }
	    var currentHeartRate = info.currentHeartRate;
	    var currentZone = 0.0f;
	    var hrFraction = 0.0f;
	    var range = 0;
    	
    	//zone 0
    	if (currentHeartRate < heartRateZones[0]) {
    		range = heartRateZones[0];
    		hrFraction = currentHeartRate;
    		currentZone = 0.0f;
			//zone 1
    	}  else if (currentHeartRate >=  heartRateZones[0] && currentHeartRate <= heartRateZones[1]) {
    		range = heartRateZones[1] - heartRateZones[0]; 
    		hrFraction = currentHeartRate - heartRateZones[0];
    		currentZone = 1.0f;
    		//zone 2
    	} else if (currentHeartRate >  heartRateZones[1] && currentHeartRate <= heartRateZones[2]) {
    		range = heartRateZones[2] - heartRateZones[1];
    		hrFraction = currentHeartRate - heartRateZones[1];
    		currentZone = 2.0f;
    		//zone 3
    	} else if (currentHeartRate >  heartRateZones[2] && currentHeartRate <= heartRateZones[3]) {
    		range = heartRateZones[3] - heartRateZones[2];
    		hrFraction = currentHeartRate - heartRateZones[2];
    		currentZone = 3.0f;
    		//zone 4
    	} else if (currentHeartRate >  heartRateZones[3] && currentHeartRate <= heartRateZones[4]) {
    		range = heartRateZones[4] - heartRateZones[3];
    		hrFraction = currentHeartRate - heartRateZones[3];
    		currentZone = 4.0f;
    		//zone 5
    	} else if (currentHeartRate >  heartRateZones[4] && currentHeartRate <= heartRateZones[5]) {
    		range = heartRateZones[5] - heartRateZones[4];
    		hrFraction = currentHeartRate - heartRateZones[4];
    		currentZone = 5.0f;
    	} else {
    		//zone 6
    		return 6.0f;
		}
    	
    	return currentZone.toNumber().toFloat() + hrFraction.toNumber().toFloat() / range.toNumber().toFloat();
    }	
    
    function hasHR(info) {
    	return info has :currentHeartRate && info.currentHeartRate != null;
    }
}
