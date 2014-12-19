/*
	A bandit hunting party has broken down
*/
private ["_missName", "_findPosRes", "_coords", "_dir", "_gps"];

//Name of the Mission
_missName = "Bandit Hunting Party";

//P2AIFindPos loops BIS_fnc_findSafePos until it gets a valid result
_findPosRes = ["Minor"] call P2AIFindPos;
_coords = _findPosRes select 0;
_dir = _findPosRes select 1;

_gps = mapGridPosition _coords;
P2DZ_mH = ["2", "A bandit hunting party has broken down!", _gps, "HMMWV_DZ"];
publicVariable "P2DZ_mH";

//P2AIAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] call P2AIAddMinMarker;

/*
	Ask the server to:	spawn in scenery & spawn in loot crates
*/
P2HC_mRq = 	[
				//Scenery Object Type & Pos & Amount (Pos gets replaced with bisFindSafePos version)
				[
					["UAZWreck",_coords,2]
				],						
				//Loot Table Type & Pos & Loot Item Amount (Pos gets replaced with bisFindSafePos version)
				[
					["Medical",_coords,10],
					["EasternWeapons",_coords,5]
				]	
			];

publicVariableServer "P2HC_mRq";

//Give server time to create objects before spawning AI (in-case we spawn the ai inside them)
uiSleep 10;

//P2AI_spawnAI spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[
	[(_coords select 0),(_coords select 1), 0],
	6,
	1,
	"P2AIUnitsMinor"
] spawn P2AI_spawnAI;

uiSleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"P2AIUnitsMinor"] call P2AIWaitMissionComp;

//Call P2AISaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.

//Let everyone know the mission is over
P2DZ_mH = ["2", "The bandit hunting party has been killed by survivors!", _gps, "HMMWV_DZ"];
publicVariable "P2DZ_mH";

diag_log text format["[P2AI]: Minor Mision Bandit Hunting Party has Ended."];
deleteMarker "P2AIMinMarker";
deleteMarker "P2AIMinDot";

//Let the timer know the mission is over
P2AIMinDone = true;