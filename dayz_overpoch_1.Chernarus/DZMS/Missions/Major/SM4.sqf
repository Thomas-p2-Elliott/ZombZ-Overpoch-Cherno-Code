/*
	Bandit Supply Heli Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
*/

private ["_missName","_coords","_ranChopper","_chopper","_truck","_trash","_trash2","_crate","_crate2"];

//Name of the Mission
_missName = "Bandit Helicopter";
_ranChopper = ["UH1H_DZ","Mi17_DZ"] call BIS_fnc_selectRandom;

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = [6870.81,11401.2,0.00128174];//call DZMSFindPos;

_gps = mapGridPosition _coords;
P2DZ_mH = ["1", "A Supply Helicopter has been Forced to Land!", _gps, _ranChopper];
publicVariable "P2DZ_mH";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//We create the vehicles like normal
_chopper = createVehicle [_ranChopper,_coords,[], 0, "NONE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_chopper] call DZMSSetupVehicle;
_chopper setDir -36.279881;

_truck = createVehicle ["HMMWV_DZ",[(_coords select 0) - 8.7802,(_coords select 1) + 6.874,0],[], 0, "CAN_COLLIDE"];
[_truck] call DZMSSetupVehicle;

//Lets add the scenery
_trash = createVehicle ["Body1",[(_coords select 0) - 3.0185,(_coords select 1) - 0.084,0],[], 0, "CAN_COLLIDE"];
_trash2 = createVehicle ["Body2",[(_coords select 0) + 1.9248,(_coords select 1) + 2.1201,0],[], 0, "CAN_COLLIDE"];
[_trash] call DZMSProtectObj;
[_trash2] call DZMSProtectObj;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6.1718,(_coords select 1) + 0.6426,0],[], 0, "CAN_COLLIDE"];
[_crate,"weapons"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate1,"industrial"] ExecVM DZMSBoxSetup;
[_crate1] call DZMSProtectObj;

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 7.1718,(_coords select 1) + 1.6426,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM DZMSBoxSetup;
[_crate2] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) - 8.4614,(_coords select 1) - 5.0527,0],60,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.


//Let everyone know the mission is over
P2DZ_mH = ["1", "The Helicopter has been Taken by Survivors!", _gps, _ranChopper];
publicVariable "P2DZ_mH";


diag_log text format["[DZMS]: Major SM4 Helicopter Landing Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;