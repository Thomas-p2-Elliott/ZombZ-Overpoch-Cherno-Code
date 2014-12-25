/////////////////////////////////////////////////////////////////////////////////////////////
// The Minumum time in seconds before a minor mission will run.
// At least this much time will pass between major missions. Default = 650 (10.8 Minutes)
P2AIMajorMin = 900; //200

// Maximum time in seconds before a major mission will run.
// A major mission will always run before this much time has passed. Default = 2000 (33.33 Minutes)
P2AIMajorMax = 1200; //400

// Time in seconds before a minor mission will run.
// At least this much time will pass between minor missions. Default = 600 (10 Minutes)
P2AIMinorMin = 600; //200

// Maximum time in seconds before a minor mission will run.
// A minor mission will always run before this much time has passed. Default = 990 (16.5 Minutes)
P2AIMinorMax = 900; //400

//Wait time before launching P2AI
P2AI_startWait = 120;

// Do you want your players to gain humanity from killing mission AI?
P2AIMissHumanity = true;

// How Much Humanity?
P2AICntHumanity = 100;

// Do you want AI kills to count as bandit kills?
P2AICntBanditKls = true;

// Do you want AI to disappear instantly when killed?
P2AICleanDeath = false;

// Do you want AI that players run over to not have gear?
// (If P2AICleanDeath is true, this doesn't matter)
P2AIRunGear = false;

// How long before bodies disappear? (in seconds) (default = 2400)
P2AIBodyTime = 900;

// Percentage of AI that must be dead before mission completes (default = 0)
//( 0 is 0% of AI / 0.50 is 50% / 1 is 100% )
P2AIRequiredKillPercent = 0.50;


/*---------------------------------------------------------------------------
Minor Mission Co-Ordinate List
---------------------------------------------------------------------------*/

P2AI_MinorLocs = [
  [[7143.0352, 7209.0063, -3.0517578e-005],0],
  [[9991.2637, 12358.043],0],
  [[5267.0698, 11725.927],0],
  [[5295.1411, 9639.2891, 0],0],
  [[4825.2813, 10786.549],0],
  [[12068.737, 5884.4365, 6.1035156e-005],0],
  [[6719.5049, 5021.0469, 0],0],
  [[4552.0649, 3417.5769, -2.2888184e-005],0],
  [[2358.7024, 3672.6147],0],
  [[5807.0044, 6050.1514, -1.5258789e-005],0],
  [[7394.5854, 6512.0566, 1.5258789e-005],0],
  [[7631.8462, 6671.0298, 3.0517578e-005],0]
];

/*---------------------------------------------------------------------------
Major Mission Co-Ordinate List
---------------------------------------------------------------------------*/

 P2AI_MajorLocs = [
   [[8871.6924, 8759.8994, -3.0517578e-005],80.434326],
   [[9179.6484, 9642.6465, 0.00015258789],75.727646],
   [[9770.8359, 10999.466, 7.6293945e-005],-19.917055],
   [[7168.6616, 10378.236, 3.0517578e-005],-28.090256],
   [[3874.012, 12074.601, -6.1035156e-005],72.242897],
   [[2246.4185, 11197.324, 0.00012207031],-19.7178],
   [[11628.901, 4702.979, 4.5776367e-005],72.720222],
   [[8435.8506, 4414.5776, -9.1552734e-005],-44.591637],
   [[5385.2637, 5052.3374, 0.00021362305],-90.845604],
   [[9186.5449, 7151.8335, 3.0517578e-005],-105.95911],
   [[5197.8809, 6910.9766, 6.1035156e-005],130.14383],
   [[5935.0542, 5355.3545, 1.5258789e-005],8.4347715],
   [[11256.908, 9892.2734, -3.8146973e-006],-57.994545],
   [[13317.989, 12723.604, 1.5258789e-005],24.11187]
 ];

P2AIMajorArray = ["UN_Convoy","UN_FieldHospital","UN_Campsite"];
P2AIMinorArray = ["RU_Convoy","RU_Outpost","RU_HuntingParty"];

//End of Configuration!

/*---------------------------------------------------------------------------
Debug Logging
---------------------------------------------------------------------------*/
private["_f","_d"]; _f = "Events_Config"; _d = (P2AI_debugEvents); private["_f","_d"];
/*---------------------------------------------------------------------------
Check Map Type
---------------------------------------------------------------------------*/
// Lets get the map name for mission location purposes
P2AIWorldName = toLower format ["%1", worldName];
if (_d) then { diag_log(format["[P2AI]:%1: P2AIWorldName: %2", _f, P2AIWorldName]); };
/*---------------------------------------------------------------------------
Check if Epoch
---------------------------------------------------------------------------*/
// We need to detect Epoch to change the loot
private["_modVariant"];
_modVariant = toLower( getText (configFile >> "CfgMods" >> "DayZ" >> "dir"));
if (_modVariant == "@dayz_epoch") then {P2AIEpoch = true;} else { P2AIEpoch = false; };
if (_d) then { diag_log(format["[P2AI]:%1: _modVariant: %2 P2AIEpoch: %3", _f, _modVariant, P2AIEpoch]); };
