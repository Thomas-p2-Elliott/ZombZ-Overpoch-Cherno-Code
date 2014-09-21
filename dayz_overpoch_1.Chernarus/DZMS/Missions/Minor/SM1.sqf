/*
	Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_vehicle"];

//Name of the Mission
_missName = "Bandit Hunting Party";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

_gps = mapGridPosition _coords;
P2DZ_mH = ["2", "A bandit hunting party has been spotted!", _gps, "SUV_Armored_DZ"];
publicVariable "P2DZ_mH";

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//Create the vehicle as normal
_vehicle = createVehicle ["SUV_Armored_DZ",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 8, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM DZMSBoxSetup;
[_crate2] call DZMSProtectObj;

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

[_coords,2,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;
[_coords,2,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.

//Let everyone know the mission is over
P2DZ_mH = ["2", "The bandit hunting party has wiped out!", _gps, "SUV_Armored_DZ"];
publicVariable "P2DZ_mH";

diag_log text format["[DZMS]: Minor SM1 Hunting Party Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;