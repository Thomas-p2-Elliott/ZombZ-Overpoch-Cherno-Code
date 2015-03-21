/*
	UN Camspite Overrun
*/

private ["_missName", "_findPosRes", "_coords", "_dir", "_gps", "_getPos", "_nearLocations", "_nearestLocation"];

//Name of the Mission
_missName = 	"UN campsite";

//P2AIFindPos loops BIS_fnc_findSafePos until it gets a valid result
_findPosRes = 	["Major"] call P2AIFindPos;
_coords =		_findPosRes select 0;
_dir = 			_findPosRes select 1;
_gps = 			mapGridPosition _coords;

P2DZE_guiMsg = [
	"Event Notification: Major Mission",
	format["Bandits have overrun a U.N. campsite at %1, kill them for humanity and their loot!", _gps],
	"p2_notifs\img\un.paa",
	5,
	0
];

publicVariable "P2DZE_guiMsg";


//P2AIAddMajMarker is a simple script that adds a marker to the location
[_coords,_missName] call P2AIAddMajMarker;

/*
	Ask the server to:	spawn in scenery & spawn in loot crates
*/
P2HC_mRq = 	[
				//Scenery Object Type & Pos & Amount (Pos gets replaced with bisFindSafePos version)
				[
					["MAP_A_tent",_coords,8],
					["Land_tent_east",_coords,1],
					["UralWreck",_coords,1]
				],						
				//Loot Table Type & Pos & Loot Item Amount (Pos gets replaced with bisFindSafePos version)
				[
					["WesternWeapons",_coords,6],
					["Medical",_coords,10],
					["EasternWeapons",_coords,3]
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
P2DZE_guiMsg = [
	"Event Notification: Major Mission",
	format["The bandits are defeated, the U.N. campsite at %1 is now under survivor control!", _gps],
	"p2_notifs\img\un.paa",
	5,
	0
];

publicVariable "P2DZE_guiMsg";

diag_log text format["[P2AI]: The UN campsite is under survivor control!"];
deleteMarker "P2AIMajMarker";
deleteMarker "P2AIMajDot";

//Let the timer know the mission is over
P2AIMajDone = true;