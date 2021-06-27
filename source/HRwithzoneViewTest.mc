using Toybox.Test;

(:test)
class HrZoneCalcMock {

	private var zone;

	function initialize(hrZones)
	{
	}
	
	function setZone(z)
	{
		zone = z;
	}
	
	function compute(hr)
	{
		return zone;
	}
}

(:test)
class HRwithzoneViewMock extends HRwithzoneView {
 	function initialize() {
        HRwithzoneView.initialize();
    }
    
	function setHrZoneCalc(calc) {
		hrZoneCalc = calc;
	}
	
	function getBottomRightValue()
	{
		return bottomRightValue;
	}
	
	function getMainValue()
	{
		return mainValue;
	}
}

(:test)
class ActivityMock {
	public var currentHeartRate;
	
	function initialize(hr) {
        currentHeartRate = hr;
    }
}

(:test)
class HRwithzoneViewTest {

	(:test)
	function computeTest(logger)
	{
	
		var hrWithzoneView = new HRwithzoneViewMock();
		var hrZoneCalcMock = new HrZoneCalcMock([]);
		
		hrWithzoneView.setHrZoneCalc(hrZoneCalcMock);
		
		Test.assertEqual(hrWithzoneView.getMainValue(), "");
		Test.assertEqual(hrWithzoneView.getBottomRightValue(), "");
		
		
		hrZoneCalcMock.setZone(1.5);
		hrWithzoneView.compute({});
		
		
		Test.assertEqual(hrWithzoneView.getMainValue(), "___");
		Test.assertEqual(hrWithzoneView.getBottomRightValue(), "_._z");
		
		hrZoneCalcMock.setZone(1.5);
		hrWithzoneView.compute(new ActivityMock(162));
		Test.assertEqual(hrWithzoneView.getMainValue(), "162");
		Test.assertEqual(hrWithzoneView.getBottomRightValue(), "1.5z");

		
		hrZoneCalcMock.setZone(2.9);
		hrWithzoneView.compute(new ActivityMock(122));
		Test.assertEqual(hrWithzoneView.getMainValue(), "122");
		Test.assertEqual(hrWithzoneView.getBottomRightValue(), "2.9z");

		return true;
	}
}
