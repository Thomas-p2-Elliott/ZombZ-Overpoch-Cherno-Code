/*---------------------------------------------------------------------------
Devils Castle Missions
---------------------------------------------------------------------------*/
//amount of AI to keep at fortress
P2AI_DcAI_Amount = 20; 
//amount of minutes before respawn check
P2AI_DC_resSleep = 45;
//spawn point of ai fortress
P2AI_DC_COORDS = [6897.4219, 11429.939];


/*---------------------------------------------------------------------------
Ground AI Unit Positions
---------------------------------------------------------------------------*/
P2AI_Castle_GroundAIPosList = [
  [6903.0205, 11436.104, 0], 
  [6902.5884, 11431.425, 0], 
  [6903.2622, 11428.022, 0], 
  [6904.5156, 11424.898, 6.1035156e-005], 
  [6907.0791, 11422.068, 0], 
  [6911.6338, 11421.869, 3.0517578e-005], 
  [6918.0342, 11421.504, 6.1035156e-005], 
  [6922.4409, 11421.714, 6.1035156e-005], 
  [6924.4097, 11426.218, 9.1552734e-005], 
  [6924.9209, 11432.051, -9.1552734e-005], 
  [6924.7026, 11437.551, 0.00042724609], 
  [6920.4463, 11439.189, 6.1035156e-005], 
  [6918.834, 11445.778, 0.00039672852], 
  [6918.4561, 11450.584, 0.00012207031], 
  [6917.2554, 11456.186, 0], 
  [6913.8853, 11458.673, 0.00015258789], 
  [6911.3833, 11454.939, -3.0517578e-005], 
  [6910.397, 11449.555, 6.1035156e-005], 
  [6906.0986, 11445.312, 3.0517578e-005], 
  [6892.751, 11410.523, -6.1035156e-005], 
  [6889.0132, 11409.316, -3.0517578e-005], 
  [6884.937, 11407.769, -0.00018310547], 
  [6900.7676, 11393.88, -0.00015258789], 
  [6900.5776, 11397.533, -3.0517578e-005], 
  [6899.8423, 11400.81, -9.1552734e-005], 
  [6898.8818, 11404.388, -6.1035156e-005], 
  [6896.5918, 11408.979, -3.0517578e-005], 
  [6871.7891, 11448.563, 9.1552734e-005], 
  [6871.4263, 11453.241, -3.0517578e-005], 
  [6871.1934, 11457.387, -6.1035156e-005], 
  [6871.1616, 11461.397, 0], 
  [6894.043, 11473.504, 0], 
  [6891.3193, 11474.13, -9.1552734e-005], 
  [6887.1558, 11472.639, -3.0517578e-005], 
  [6876.9609, 11472.891, 0], 
  [6873.1978, 11473.216, 0], 
  [6869.939, 11472.218, -3.0517578e-005], 
  [6866.5664, 11471.79, 3.0517578e-005], 
  [6863.8076, 11470.326, -3.0517578e-005], 
  [6886.333, 11457.217, -0.00012207031], 
  [6890.6519, 11453.475, 0], 
  [6895.9966, 11448.98, -3.0517578e-005], 
  [6888.9629, 11433.202, 3.0517578e-005], 
  [6889.7661, 11429.382, -6.1035156e-005], 
  [6891.0874, 11425.197, -9.1552734e-005], 
  [6884.686, 11433.15, 0], 
  [6881.7622, 11431.36, -6.1035156e-005], 
  [6882.0356, 11427.664, 0], 
  [6883.0107, 11424.225, -6.1035156e-005], 
  [6885.1504, 11421.663, 3.0517578e-005], 
  [6893.6719, 11426.526, 0], 
  [6894.0791, 11424.277, -6.1035156e-005]
];

/*---------------------------------------------------------------------------
 Castle roof AI Unit Positions
---------------------------------------------------------------------------*/

P2AI_Castle_RoofAIPosList = [
  [6908.47, 11434,  32.0753],
  [6908.93, 11426.7,32.0183],
  [6913.22, 11426.9,32.1182],
  [6915.34, 11426.9,32.1937],
  [6917.91, 11427,  32.3832],
  [6919.29, 11431.4,32.6166],
  [6919.23, 11434.3,32.5514],
  [6908.68, 11429.6,32.0327]
];

if (isNil 'P2AI_Devils_Enabled') then {
  diag_log("ERROR: P2AI_Devils_Enabled was not set-up and has been set to false. No A.I will spawn at devils castle.");
  P2AI_Devils_Enabled = false;
};

private["_f","_d"]; _f = "Castle_Config"; _d = (P2AI_debugStatic);
if (_d) then { diag_log(format["[P2AI]:%1: DevilsCastleMission Config Loaded, P2AI_Devils_Enabled:  %2", _f, P2AI_Devils_Enabled]); };