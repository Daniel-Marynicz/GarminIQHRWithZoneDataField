using Toybox.Math;
using Toybox.Test;

class CurrentHRZoneTest {

	(:test)
	function formatTest(logger) {
		
		logger.debug(4.96f.format("%.1f"));
		
		return true;
	}

	(:test)
	function roundDownTest(logger)
	{
		var number;
		var result;
		
		number = 4.02;
		result = CurrentHRZone.roundDown(number);
		CurrentHRZoneTest.assertRound(1, number, result, 4.0);
		
		number = 4.09;
		result = CurrentHRZone.roundDown(number);
		CurrentHRZoneTest.assertRound(1, number, result, 4.0);
		
		number = 4.12;
		result = CurrentHRZone.roundDown(number);
		CurrentHRZoneTest.assertRound(1, number, result, 4.1);
		
		number = 4.19;
		result = CurrentHRZone.roundDown(number);
		CurrentHRZoneTest.assertRound(1, number, result, 4.1);
		
		number = 4.89;
		result = CurrentHRZone.roundDown(number);
		CurrentHRZoneTest.assertRound(1, number, result, 4.8);
		
		number = 4.9;
		result = CurrentHRZone.roundDown(number);
		CurrentHRZoneTest.assertRound(1, number, result, 4.9);
		
		return true;
	}

	(:test)
	function roundTest(logger)
	{
		var result;
		var number;
		
		number = 4.681234;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(1, number, result, 4.68);
		
		number = 4.6812345;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(2, number, result, 4.68);
		
		
		number = 4.6862345;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(3, number, result, 4.69);

		number = 4.1212345;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(4, number, result, 4.12);

		number = 4.1252345;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(5, number, result, 4.13);

		number = 4.1262345;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(6, number, result, 4.13);

		number = 214.121234;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(7, number, result, 214.12);

		number = 214.125234;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(8, number, result, 214.13);

		number = 214.126234;
		result = CurrentHRZone.round(number);
		CurrentHRZoneTest.assertRound(9, number, result, 214.13);

		

		return true;
	}
	function assertRound(testNumber, number, result, expectedResult) {
		var msg = "#" + testNumber + " For number " + number + " result "  + result + " is not equal to  expectedResult " + expectedResult;
		Test.assertEqualMessage(result, expectedResult, msg);
	}
	
	(:test)
	function computeTest(logger)
	{
		var heartRateZones = [0, 1, 2, 3, 4, 5];
		
		//min zone 1 - The minimum heart rate threshold for zone 1
		heartRateZones[0] = 108;
		//max zone 1 - The maximum heart rate threshold for zone 1
		heartRateZones[1] = 133;
		//max zone 2 - The maximum heart rate threshold for zone 2
		heartRateZones[2] = 148;
		//max zone 3 - The maximum heart rate threshold for zone 3
		heartRateZones[3] = 158;
		//max zone 4 - The maximum heart rate threshold for zone 4
		heartRateZones[4] = 166;
		//max zone 5 - The maximum heart rate threshold for zone 5
		heartRateZones[5] = 184;
		
		var hrZoneCalc = new CurrentHRZone(heartRateZones);
		
		var result; 
		
		result = hrZoneCalc.compute(0f);
		CurrentHRZoneTest.assertHR(0f, result, 0.0f);
		result = hrZoneCalc.compute(1f);
		CurrentHRZoneTest.assertHR(1f, result, 0.0f);
		result = hrZoneCalc.compute(2f);
		CurrentHRZoneTest.assertHR(2f, result, 0.0f);
		result = hrZoneCalc.compute(3f);
		CurrentHRZoneTest.assertHR(3f, result, 0.0f);
		result = hrZoneCalc.compute(4f);
		CurrentHRZoneTest.assertHR(4f, result, 0.0f);
		result = hrZoneCalc.compute(5f);
		CurrentHRZoneTest.assertHR(5f, result, 0.0f);
		result = hrZoneCalc.compute(6f);
		CurrentHRZoneTest.assertHR(6f, result, 0.0f);
		result = hrZoneCalc.compute(7f);
		CurrentHRZoneTest.assertHR(7f, result, 0.0f);
		result = hrZoneCalc.compute(8f);
		CurrentHRZoneTest.assertHR(8f, result, 0.0f);
		result = hrZoneCalc.compute(9f);
		CurrentHRZoneTest.assertHR(9f, result, 0.0f);
		result = hrZoneCalc.compute(10f);
		CurrentHRZoneTest.assertHR(10f, result, 0.0f);
		result = hrZoneCalc.compute(11f);
		CurrentHRZoneTest.assertHR(11f, result, 0.1f);
		result = hrZoneCalc.compute(12f);
		CurrentHRZoneTest.assertHR(12f, result, 0.1f);
		result = hrZoneCalc.compute(13f);
		CurrentHRZoneTest.assertHR(13f, result, 0.1f);
		result = hrZoneCalc.compute(14f);
		CurrentHRZoneTest.assertHR(14f, result, 0.1f);
		result = hrZoneCalc.compute(15f);
		CurrentHRZoneTest.assertHR(15f, result, 0.1f);
		result = hrZoneCalc.compute(16f);
		CurrentHRZoneTest.assertHR(16f, result, 0.1f);
		result = hrZoneCalc.compute(17f);
		CurrentHRZoneTest.assertHR(17f, result, 0.1f);
		result = hrZoneCalc.compute(18f);
		CurrentHRZoneTest.assertHR(18f, result, 0.1f);
		result = hrZoneCalc.compute(19f);
		CurrentHRZoneTest.assertHR(19f, result, 0.1f);
		result = hrZoneCalc.compute(20f);
		CurrentHRZoneTest.assertHR(20f, result, 0.1f);
		result = hrZoneCalc.compute(21f);
		CurrentHRZoneTest.assertHR(21f, result, 0.1f);
		result = hrZoneCalc.compute(22f);
		CurrentHRZoneTest.assertHR(22f, result, 0.2f);
		result = hrZoneCalc.compute(23f);
		CurrentHRZoneTest.assertHR(23f, result, 0.2f);
		result = hrZoneCalc.compute(24f);
		CurrentHRZoneTest.assertHR(24f, result, 0.2f);
		result = hrZoneCalc.compute(25f);
		CurrentHRZoneTest.assertHR(25f, result, 0.2f);
		result = hrZoneCalc.compute(26f);
		CurrentHRZoneTest.assertHR(26f, result, 0.2f);
		result = hrZoneCalc.compute(27f);
		CurrentHRZoneTest.assertHR(27f, result, 0.2f);
		result = hrZoneCalc.compute(28f);
		CurrentHRZoneTest.assertHR(28f, result, 0.2f);
		result = hrZoneCalc.compute(29f);
		CurrentHRZoneTest.assertHR(29f, result, 0.2f);
		result = hrZoneCalc.compute(30f);
		CurrentHRZoneTest.assertHR(30f, result, 0.2f);
		result = hrZoneCalc.compute(31f);
		CurrentHRZoneTest.assertHR(31f, result, 0.2f);
		result = hrZoneCalc.compute(32f);
		CurrentHRZoneTest.assertHR(32f, result, 0.2f);
		result = hrZoneCalc.compute(33f);
		CurrentHRZoneTest.assertHR(33f, result, 0.3f);
		result = hrZoneCalc.compute(34f);
		CurrentHRZoneTest.assertHR(34f, result, 0.3f);
		result = hrZoneCalc.compute(35f);
		CurrentHRZoneTest.assertHR(35f, result, 0.3f);
		result = hrZoneCalc.compute(36f);
		CurrentHRZoneTest.assertHR(36f, result, 0.3f);
		result = hrZoneCalc.compute(37f);
		CurrentHRZoneTest.assertHR(37f, result, 0.3f);
		result = hrZoneCalc.compute(38f);
		CurrentHRZoneTest.assertHR(38f, result, 0.3f);
		result = hrZoneCalc.compute(39f);
		CurrentHRZoneTest.assertHR(39f, result, 0.3f);
		result = hrZoneCalc.compute(40f);
		CurrentHRZoneTest.assertHR(40f, result, 0.3f);
		result = hrZoneCalc.compute(41f);
		CurrentHRZoneTest.assertHR(41f, result, 0.3f);
		result = hrZoneCalc.compute(42f);
		CurrentHRZoneTest.assertHR(42f, result, 0.3f);
		result = hrZoneCalc.compute(43f);
		CurrentHRZoneTest.assertHR(43f, result, 0.3f);
		result = hrZoneCalc.compute(44f);
		CurrentHRZoneTest.assertHR(44f, result, 0.4f);
		result = hrZoneCalc.compute(45f);
		CurrentHRZoneTest.assertHR(45f, result, 0.4f);
		result = hrZoneCalc.compute(46f);
		CurrentHRZoneTest.assertHR(46f, result, 0.4f);
		result = hrZoneCalc.compute(47f);
		CurrentHRZoneTest.assertHR(47f, result, 0.4f);
		result = hrZoneCalc.compute(48f);
		CurrentHRZoneTest.assertHR(48f, result, 0.4f);
		result = hrZoneCalc.compute(49f);
		CurrentHRZoneTest.assertHR(49f, result, 0.4f);
		result = hrZoneCalc.compute(50f);
		CurrentHRZoneTest.assertHR(50f, result, 0.4f);
		result = hrZoneCalc.compute(51f);
		CurrentHRZoneTest.assertHR(51f, result, 0.4f);
		result = hrZoneCalc.compute(52f);
		CurrentHRZoneTest.assertHR(52f, result, 0.4f);
		result = hrZoneCalc.compute(53f);
		CurrentHRZoneTest.assertHR(53f, result, 0.4f);
		result = hrZoneCalc.compute(54f);
		CurrentHRZoneTest.assertHR(54f, result, 0.5f);
		result = hrZoneCalc.compute(55f);
		CurrentHRZoneTest.assertHR(55f, result, 0.5f);
		result = hrZoneCalc.compute(56f);
		CurrentHRZoneTest.assertHR(56f, result, 0.5f);
		result = hrZoneCalc.compute(57f);
		CurrentHRZoneTest.assertHR(57f, result, 0.5f);
		result = hrZoneCalc.compute(58f);
		CurrentHRZoneTest.assertHR(58f, result, 0.5f);
		result = hrZoneCalc.compute(59f);
		CurrentHRZoneTest.assertHR(59f, result, 0.5f);
		result = hrZoneCalc.compute(60f);
		CurrentHRZoneTest.assertHR(60f, result, 0.5f);
		result = hrZoneCalc.compute(61f);
		CurrentHRZoneTest.assertHR(61f, result, 0.5f);
		result = hrZoneCalc.compute(62f);
		CurrentHRZoneTest.assertHR(62f, result, 0.5f);
		result = hrZoneCalc.compute(63f);
		CurrentHRZoneTest.assertHR(63f, result, 0.5f);
		result = hrZoneCalc.compute(64f);
		CurrentHRZoneTest.assertHR(64f, result, 0.5f);
		result = hrZoneCalc.compute(65f);
		CurrentHRZoneTest.assertHR(65f, result, 0.6f);
		result = hrZoneCalc.compute(66f);
		CurrentHRZoneTest.assertHR(66f, result, 0.6f);
		result = hrZoneCalc.compute(67f);
		CurrentHRZoneTest.assertHR(67f, result, 0.6f);
		result = hrZoneCalc.compute(68f);
		CurrentHRZoneTest.assertHR(68f, result, 0.6f);
		result = hrZoneCalc.compute(69f);
		CurrentHRZoneTest.assertHR(69f, result, 0.6f);
		result = hrZoneCalc.compute(70f);
		CurrentHRZoneTest.assertHR(70f, result, 0.6f);
		result = hrZoneCalc.compute(71f);
		CurrentHRZoneTest.assertHR(71f, result, 0.6f);
		result = hrZoneCalc.compute(72f);
		CurrentHRZoneTest.assertHR(72f, result, 0.6f);
		result = hrZoneCalc.compute(73f);
		CurrentHRZoneTest.assertHR(73f, result, 0.6f);
		result = hrZoneCalc.compute(74f);
		CurrentHRZoneTest.assertHR(74f, result, 0.6f);
		result = hrZoneCalc.compute(75f);
		CurrentHRZoneTest.assertHR(75f, result, 0.6f);
		result = hrZoneCalc.compute(76f);
		CurrentHRZoneTest.assertHR(76f, result, 0.7f);
		result = hrZoneCalc.compute(77f);
		CurrentHRZoneTest.assertHR(77f, result, 0.7f);
		result = hrZoneCalc.compute(78f);
		CurrentHRZoneTest.assertHR(78f, result, 0.7f);
		result = hrZoneCalc.compute(79f);
		CurrentHRZoneTest.assertHR(79f, result, 0.7f);
		result = hrZoneCalc.compute(80f);
		CurrentHRZoneTest.assertHR(80f, result, 0.7f);
		result = hrZoneCalc.compute(81f);
		CurrentHRZoneTest.assertHR(81f, result, 0.7f);
		result = hrZoneCalc.compute(82f);
		CurrentHRZoneTest.assertHR(82f, result, 0.7f);
		result = hrZoneCalc.compute(83f);
		CurrentHRZoneTest.assertHR(83f, result, 0.7f);
		result = hrZoneCalc.compute(84f);
		CurrentHRZoneTest.assertHR(84f, result, 0.7f);
		result = hrZoneCalc.compute(85f);
		CurrentHRZoneTest.assertHR(85f, result, 0.7f);
		result = hrZoneCalc.compute(86f);
		CurrentHRZoneTest.assertHR(86f, result, 0.7f);
		result = hrZoneCalc.compute(87f);
		CurrentHRZoneTest.assertHR(87f, result, 0.8f);
		result = hrZoneCalc.compute(88f);
		CurrentHRZoneTest.assertHR(88f, result, 0.8f);
		result = hrZoneCalc.compute(89f);
		CurrentHRZoneTest.assertHR(89f, result, 0.8f);
		result = hrZoneCalc.compute(90f);
		CurrentHRZoneTest.assertHR(90f, result, 0.8f);
		result = hrZoneCalc.compute(91f);
		CurrentHRZoneTest.assertHR(91f, result, 0.8f);
		result = hrZoneCalc.compute(92f);
		CurrentHRZoneTest.assertHR(92f, result, 0.8f);
		result = hrZoneCalc.compute(93f);
		CurrentHRZoneTest.assertHR(93f, result, 0.8f);
		result = hrZoneCalc.compute(94f);
		CurrentHRZoneTest.assertHR(94f, result, 0.8f);
		result = hrZoneCalc.compute(95f);
		CurrentHRZoneTest.assertHR(95f, result, 0.8f);
		result = hrZoneCalc.compute(96f);
		CurrentHRZoneTest.assertHR(96f, result, 0.8f);
		result = hrZoneCalc.compute(97f);
		CurrentHRZoneTest.assertHR(97f, result, 0.8f);
		result = hrZoneCalc.compute(98f);
		CurrentHRZoneTest.assertHR(98f, result, 0.9f);
		result = hrZoneCalc.compute(99f);
		CurrentHRZoneTest.assertHR(99f, result, 0.9f);
		result = hrZoneCalc.compute(100f);
		CurrentHRZoneTest.assertHR(100f, result, 0.9f);
		result = hrZoneCalc.compute(101f);
		CurrentHRZoneTest.assertHR(101f, result, 0.9f);
		result = hrZoneCalc.compute(102f);
		CurrentHRZoneTest.assertHR(102f, result, 0.9f);
		result = hrZoneCalc.compute(103f);
		CurrentHRZoneTest.assertHR(103f, result, 0.9f);
		result = hrZoneCalc.compute(104f);
		CurrentHRZoneTest.assertHR(104f, result, 0.9f);
		result = hrZoneCalc.compute(105f);
		CurrentHRZoneTest.assertHR(105f, result, 0.9f);
		result = hrZoneCalc.compute(106f);
		CurrentHRZoneTest.assertHR(106f, result, 0.9f);
		result = hrZoneCalc.compute(107f);
		CurrentHRZoneTest.assertHR(107f, result, 0.9f);
		result = hrZoneCalc.compute(108f);
		CurrentHRZoneTest.assertHR(108f, result, 1.0f);
		result = hrZoneCalc.compute(109f);
		CurrentHRZoneTest.assertHR(109f, result, 1.0f);
		result = hrZoneCalc.compute(110f);
		CurrentHRZoneTest.assertHR(110f, result, 1.0f);
		result = hrZoneCalc.compute(111f);
		CurrentHRZoneTest.assertHR(111f, result, 1.1f);
		result = hrZoneCalc.compute(112f);
		CurrentHRZoneTest.assertHR(112f, result, 1.1f);
		result = hrZoneCalc.compute(113f);
		CurrentHRZoneTest.assertHR(113f, result, 1.1f);
		result = hrZoneCalc.compute(114f);
		CurrentHRZoneTest.assertHR(114f, result, 1.2f);
		result = hrZoneCalc.compute(115f);
		CurrentHRZoneTest.assertHR(115f, result, 1.2f);
		result = hrZoneCalc.compute(116f);
		CurrentHRZoneTest.assertHR(116f, result, 1.3f);
		result = hrZoneCalc.compute(117f);
		CurrentHRZoneTest.assertHR(117f, result, 1.3f);
		result = hrZoneCalc.compute(118f);
		CurrentHRZoneTest.assertHR(118f, result, 1.3f);
		result = hrZoneCalc.compute(119f);
		CurrentHRZoneTest.assertHR(119f, result, 1.4f);
		result = hrZoneCalc.compute(120f);
		CurrentHRZoneTest.assertHR(120f, result, 1.4f);
		result = hrZoneCalc.compute(121f);
		CurrentHRZoneTest.assertHR(121f, result, 1.5f);
		result = hrZoneCalc.compute(122f);
		CurrentHRZoneTest.assertHR(122f, result, 1.5f);
		result = hrZoneCalc.compute(123f);
		CurrentHRZoneTest.assertHR(123f, result, 1.5f);
		result = hrZoneCalc.compute(124f);
		CurrentHRZoneTest.assertHR(124f, result, 1.6f);
		result = hrZoneCalc.compute(125f);
		CurrentHRZoneTest.assertHR(125f, result, 1.6f);
		result = hrZoneCalc.compute(126f);
		CurrentHRZoneTest.assertHR(126f, result, 1.6f);
		result = hrZoneCalc.compute(127f);
		CurrentHRZoneTest.assertHR(127f, result, 1.7f);
		result = hrZoneCalc.compute(128f);
		CurrentHRZoneTest.assertHR(128f, result, 1.7f);
		result = hrZoneCalc.compute(129f);
		CurrentHRZoneTest.assertHR(129f, result, 1.8f);
		result = hrZoneCalc.compute(130f);
		CurrentHRZoneTest.assertHR(130f, result, 1.8f);
		result = hrZoneCalc.compute(131f);
		CurrentHRZoneTest.assertHR(131f, result, 1.8f);
		result = hrZoneCalc.compute(132f);
		CurrentHRZoneTest.assertHR(132f, result, 1.9f);
		result = hrZoneCalc.compute(133f);
		CurrentHRZoneTest.assertHR(133f, result, 1.9f);
		result = hrZoneCalc.compute(134f);
		CurrentHRZoneTest.assertHR(134f, result, 2.0f);
		result = hrZoneCalc.compute(135f);
		CurrentHRZoneTest.assertHR(135f, result, 2.0f);
		result = hrZoneCalc.compute(136f);
		CurrentHRZoneTest.assertHR(136f, result, 2.1f);
		result = hrZoneCalc.compute(137f);
		CurrentHRZoneTest.assertHR(137f, result, 2.2f);
		result = hrZoneCalc.compute(138f);
		CurrentHRZoneTest.assertHR(138f, result, 2.2f);
		result = hrZoneCalc.compute(139f);
		CurrentHRZoneTest.assertHR(139f, result, 2.3f);
		result = hrZoneCalc.compute(140f);
		CurrentHRZoneTest.assertHR(140f, result, 2.4f);
		result = hrZoneCalc.compute(141f);
		CurrentHRZoneTest.assertHR(141f, result, 2.4f);
		result = hrZoneCalc.compute(142f);
		CurrentHRZoneTest.assertHR(142f, result, 2.5f);
		result = hrZoneCalc.compute(143f);
		CurrentHRZoneTest.assertHR(143f, result, 2.6f);
		result = hrZoneCalc.compute(144f);
		CurrentHRZoneTest.assertHR(144f, result, 2.6f);
		result = hrZoneCalc.compute(145f);
		CurrentHRZoneTest.assertHR(145f, result, 2.7f);
		result = hrZoneCalc.compute(146f);
		CurrentHRZoneTest.assertHR(146f, result, 2.8f);
		result = hrZoneCalc.compute(147f);
		CurrentHRZoneTest.assertHR(147f, result, 2.8f);
		result = hrZoneCalc.compute(148f);
		CurrentHRZoneTest.assertHR(148f, result, 2.9f);
		result = hrZoneCalc.compute(149f);
		CurrentHRZoneTest.assertHR(149f, result, 3.0f);
		result = hrZoneCalc.compute(150f);
		CurrentHRZoneTest.assertHR(150f, result, 3.1f);
		result = hrZoneCalc.compute(151f);
		CurrentHRZoneTest.assertHR(151f, result, 3.2f);
		result = hrZoneCalc.compute(152f);
		CurrentHRZoneTest.assertHR(152f, result, 3.3f);
		result = hrZoneCalc.compute(153f);
		CurrentHRZoneTest.assertHR(153f, result, 3.4f);
		result = hrZoneCalc.compute(154f);
		CurrentHRZoneTest.assertHR(154f, result, 3.5f);
		result = hrZoneCalc.compute(155f);
		CurrentHRZoneTest.assertHR(155f, result, 3.6f);
		result = hrZoneCalc.compute(156f);
		CurrentHRZoneTest.assertHR(156f, result, 3.7f);
		result = hrZoneCalc.compute(157f);
		CurrentHRZoneTest.assertHR(157f, result, 3.8f);
		result = hrZoneCalc.compute(158f);
		CurrentHRZoneTest.assertHR(158f, result, 3.9f);
		result = hrZoneCalc.compute(159f);
		CurrentHRZoneTest.assertHR(159f, result, 4.0f);
		result = hrZoneCalc.compute(160f);
		CurrentHRZoneTest.assertHR(160f, result, 4.1f);
		result = hrZoneCalc.compute(161f);
		CurrentHRZoneTest.assertHR(161f, result, 4.2f);
		result = hrZoneCalc.compute(162f);
		CurrentHRZoneTest.assertHR(162f, result, 4.3f);
		result = hrZoneCalc.compute(163f);
		CurrentHRZoneTest.assertHR(163f, result, 4.5f);
		result = hrZoneCalc.compute(164f);
		CurrentHRZoneTest.assertHR(164f, result, 4.6f);
		result = hrZoneCalc.compute(165f);
		CurrentHRZoneTest.assertHR(165f, result, 4.7f);
		result = hrZoneCalc.compute(166f);
		CurrentHRZoneTest.assertHR(166f, result, 4.8f);
		result = hrZoneCalc.compute(167f);
		CurrentHRZoneTest.assertHR(167f, result, 5.0f);
		result = hrZoneCalc.compute(168f);
		CurrentHRZoneTest.assertHR(168f, result, 5.0f);
		result = hrZoneCalc.compute(169f);
		CurrentHRZoneTest.assertHR(169f, result, 5.1f);
		result = hrZoneCalc.compute(170f);
		CurrentHRZoneTest.assertHR(170f, result, 5.1f);
		result = hrZoneCalc.compute(171f);
		CurrentHRZoneTest.assertHR(171f, result, 5.2f);
		result = hrZoneCalc.compute(172f);
		CurrentHRZoneTest.assertHR(172f, result, 5.2f);
		result = hrZoneCalc.compute(173f);
		CurrentHRZoneTest.assertHR(173f, result, 5.3f);
		result = hrZoneCalc.compute(174f);
		CurrentHRZoneTest.assertHR(174f, result, 5.3f);
		result = hrZoneCalc.compute(175f);
		CurrentHRZoneTest.assertHR(175f, result, 5.4f);
		result = hrZoneCalc.compute(176f);
		CurrentHRZoneTest.assertHR(176f, result, 5.5f);
		result = hrZoneCalc.compute(177f);
		CurrentHRZoneTest.assertHR(177f, result, 5.5f);
		result = hrZoneCalc.compute(178f);
		CurrentHRZoneTest.assertHR(178f, result, 5.6f);
		result = hrZoneCalc.compute(179f);
		CurrentHRZoneTest.assertHR(179f, result, 5.6f);
		result = hrZoneCalc.compute(180f);
		CurrentHRZoneTest.assertHR(180f, result, 5.7f);
		result = hrZoneCalc.compute(181f);
		CurrentHRZoneTest.assertHR(181f, result, 5.7f);
		result = hrZoneCalc.compute(182f);
		CurrentHRZoneTest.assertHR(182f, result, 5.8f);
		result = hrZoneCalc.compute(183f);
		CurrentHRZoneTest.assertHR(183f, result, 5.8f);
		result = hrZoneCalc.compute(184f);
		CurrentHRZoneTest.assertHR(184f, result, 5.9f);

		result = hrZoneCalc.compute(185f);
		CurrentHRZoneTest.assertHR(185f, result, 6.00f);
		result = hrZoneCalc.compute(185f);
		CurrentHRZoneTest.assertHR(185f, result, 6.00f);
		result = hrZoneCalc.compute(186f);
		CurrentHRZoneTest.assertHR(186f, result, 6.00f);
		result = hrZoneCalc.compute(187f);
		CurrentHRZoneTest.assertHR(187f, result, 6.00f);
		result = hrZoneCalc.compute(188f);
		CurrentHRZoneTest.assertHR(188f, result, 6.00f);
		result = hrZoneCalc.compute(189f);
		CurrentHRZoneTest.assertHR(189f, result, 6.00f);
		result = hrZoneCalc.compute(190f);
		CurrentHRZoneTest.assertHR(190f, result, 6.00f);
		result = hrZoneCalc.compute(191f);
		CurrentHRZoneTest.assertHR(191f, result, 6.00f);
		result = hrZoneCalc.compute(192f);
		CurrentHRZoneTest.assertHR(192f, result, 6.00f);
		result = hrZoneCalc.compute(9999f);
		CurrentHRZoneTest.assertHR(9999f, result, 6.00f);

		return true;
	
	}
	
	function assertHR(hr, result, expectedResult) {
		var msg = "For HR " + hr + " result "  + result + " is not equal to  expectedResult " + expectedResult;
		Test.assertEqualMessage(result, expectedResult, msg);
	}
}
