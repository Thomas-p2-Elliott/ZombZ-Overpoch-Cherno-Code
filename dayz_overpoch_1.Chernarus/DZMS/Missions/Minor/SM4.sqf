/*
	Bandit Heli Down! by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crash","_crate"];

//Name of the Mission
_missName = "Bandit Helicopter";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

_gps = mapGridPosition _coords;
P2DZ_mH = ["2", "A bandit helicopter has landed!", _gps, "UH1H_DZ"];
publicVariable "P2DZ_mH";

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//Add the scenery
_crash = createVehicle ["UH1H_DZ", _coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//We create and fill the crates
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[_coords,3,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[_coords,3,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
P2DZ_mH = ["2", "The bandit helicopter has been taken!", _gps, "UH1H_DZ"];
publicVariable "P2DZ_mH";

diag_log text format["[DZMS]: Minor SM4 Crash Site Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;