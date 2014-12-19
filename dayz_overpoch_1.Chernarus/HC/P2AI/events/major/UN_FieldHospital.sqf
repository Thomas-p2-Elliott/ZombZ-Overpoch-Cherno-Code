/*
	UN Field Hospital Overrun
*/

private ["_missName", "_findPosRes", "_coords", "_dir", "_gps"];

//Name of the Mission
_missName = 	"UN Field Hospital";

//P2AIFindPos loops BIS_fnc_findSafePos until it gets a valid result
_findPosRes = 	["Major"] call P2AIFindPos;
_coords =		_findPosRes select 0;
_dir = 			_findPosRes select 1;
_gps = 			mapGridPosition _coords;

P2DZ_mH = 		["1", "Bandits have overrun a UN field hospital!", _gps, "US_WarfareBFieldhHospital_Base_EP1"];
publicVariable 	"P2DZ_mH";

//P2AIAddMajMarker is a simple script that adds a marker to the location
[_coords,_missName] call P2AIAddMajMarker;

/*
	Ask the server to:	spawn in scenery & spawn in loot crates
*/
P2HC_mRq = 	[
				//Scenery Object Type & Pos & Amount (Pos gets replaced with bisFindSafePos version)
				[
					["MASH_EP1",_coords,2],
					["UAZWreck",_coords,1]
				],						
				//Loot Table Type & Pos & Loot Item Amount (Pos gets replaced with bisFindSafePos version)
				[
					["Medical",_coords,16],
					["EasternWeapons",_coords,4],
					["WesternWeapons",_coords,4]
				]	
			];

publicVariableServer "P2HC_mRq";

//Give server time to create objects before spawning AI (in-case we spawn the ai inside them)
uiSleep 10;

//P2AI_spawnAI spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[
	[(_coords select 0),(_coords select 1), 0],
	10,
	1,
	"P2AIUnitsMajor"
] spawn P2AI_spawnAI;

uiSleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"P2AIUnitsMajor"] call P2AIWaitMissionComp;

//Let everyone know the mission is over
P2DZ_mH = 		["1", "The UN field hospital is under survivor control!", _gps, "US_WarfareBFieldhHospital_Base_EP1"];
publicVariable 	"P2DZ_mH";

diag_log text format["[P2AI]: The UN field hospital is under survivor control!"];
deleteMarker "P2AIMajMarker";
deleteMarker "P2AIMajDot";

//Let the timer know the mission is over
P2AIMajDone = true;