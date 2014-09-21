/*
	Medical Supply Camp by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Mission Format by Vampire
*/

private ["_missName","_coords","_base1","_base2","_base3","_base4","_base5","_base6","_base7","_base8","_base9","_base10","_base11","_base12","_base13","_base14","_base15","_base16","_base17","_vehicle","_crate"];

//Name of the Mission
_missName = "Bandit Medical Camp";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

_gps = mapGridPosition _coords;
P2DZ_mH = ["1", "A bandit medical camp has been spotted!", _gps, "US_WarfareBFieldhHospital_Base_EP1"];
publicVariable "P2DZ_mH";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//Create the scenery
_base1 = createVehicle ["Land_fort_artillery_nest",[(_coords select 0) - 5.939,(_coords select 1) + 10.0459,0],[], 0, "CAN_COLLIDE"];
_base1 setDir -31.158424;
[_base1] call DZMSProtectObj;
_base1 setVehicleLock "LOCKED";
_base1 setPos [(_coords select 0) - 5.939,(_coords select 1) + 10.0459,0];

_base2 = createVehicle ["Land_fort_artillery_nest",[(_coords select 0) + 6.3374, (_coords select 1) - 11.1944,0],[], 0, "CAN_COLLIDE"];
_base2 setDir -211.14516;
[_base2] call DZMSProtectObj;
_base2 setVehicleLock "LOCKED";
_base2 setPos [(_coords select 0) + 6.3374, (_coords select 1) - 11.1944,0];

_base3 = createVehicle ["Land_fort_rampart",[(_coords select 0) + 12.2456, (_coords select 1) + 6.249,0],[], 0, "CAN_COLLIDE"];
_base3 setDir -120.93051;
[_base3] call DZMSProtectObj;
_base3 setVehicleLock "LOCKED";
_base3 setPos [(_coords select 0) + 12.2456, (_coords select 1) + 6.249,0];

_base4 = createVehicle ["Land_fort_rampart",[(_coords select 0) - 11.4253, (_coords select 1) - 7.628,0],[], 0, "CAN_COLLIDE"];
_base4 setDir 59.42643;
[_base4] call DZMSProtectObj;
_base4 setVehicleLock "LOCKED";
_base4 setPos [(_coords select 0) - 11.4253, (_coords select 1) - 7.628,0];

_base5 = createVehicle ["MedBox0",[(_coords select 0) - 7.1519, (_coords select 1) + 1.8144,0],[], 0, "CAN_COLLIDE"];
_base5 setDir -29.851013;
[_base5] call DZMSProtectObj;


_base8 = createVehicle ["Land_CamoNetVar_EAST",[(_coords select 0) + 4.1738, (_coords select 1) - 7.9112],[], 0, "CAN_COLLIDE"];
_base8 setDir -27.004126;
[_base8] call DZMSProtectObj;
_base8 setVehicleLock "LOCKED";
_base8 setPos [(_coords select 0) + 4.1738, (_coords select 1) - 7.9112];

_base9 = createVehicle ["PowGen_Big",[(_coords select 0) - 0.8936, (_coords select 1) + 8.1582,0],[], 0, "CAN_COLLIDE"];
_base9 setDir -56.044361;
[_base9] call DZMSProtectObj;

//Create the vehicles
_vehicle = createVehicle ["HMMWV_DZ",[(_coords select 0) - 17.5078, (_coords select 1) + 5.2578,0],[], 0, "CAN_COLLIDE"];
[_vehicle] call DZMSSetupVehicle;

//Create the loot
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) - 6.8277, (_coords select 1) + 5.6748,0],[], 0, "CAN_COLLIDE"];
[_crate,"medical"] ExecVM DZMSBoxSetup;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate1,"industrial"] ExecVM DZMSBoxSetup;
[_crate1] call DZMSProtectObj;

_crate2 = createVehicle ["USLaunchersBox",[(_coords select 0) - 7.1718,(_coords select 1) + 1.6426,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM DZMSBoxSetup;
[_crate2] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) - 0.5635,(_coords select 1) + 0.3173,0],3,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.

//Let everyone know the mission is over
P2DZ_mH = ["1", "Survivors have taken control of the medical camp.", _gps, "US_WarfareBFieldhHospital_Base_EP1"];
publicVariable "P2DZ_mH";


diag_log text format["[DZMS]: Major SM3 Medical Camp Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;