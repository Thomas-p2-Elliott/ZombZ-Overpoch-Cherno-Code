/*
	Medical C-130 Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Modified to new format by Vampire
*/

private ["_missName","_coords","_wreck","_trash","_trash1","_trash2","_trash3","_trash4","_trash5","_vehicle","_vehicle1","_crate","_crate1"];

//Name of the Mission
_missName = "C130 Crash";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

_gps = mapGridPosition _coords;
P2DZ_mH = ["1", "A C130 Carrying Supplies has Crashed!", _gps, "C130J"];
publicVariable "P2DZ_mH";

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//We create the mission scenery
_wreck = createVehicle ["C130J",[(_coords select 0) - 8.8681, (_coords select 1) + 15.3554,0],[], 0, "NONE"];
_wreck setDir -30.165445;
[_wreck] call DZMSProtectObj;

//Lets open it up
_wreck animate ["ramp_top",1];
_wreck animate ["ramp_bottom",1];

//And lets keep people out
_wreck setHit ["motor", 1];
_wreck setVariable ["R3F_LOG_disabled",true,true];
_wreck setVariable ["BTC_Cannot_Lift",true,true];
_wreck removeAllEventHandlers "Killed";
_wreck removeAllEventHandlers "HandleDamage";
_wreck setVehicleLock "LOCKED";
_wreck removeAllEventHandlers "GetIn";
_wreck addEventHandler ["GetIn",{
	if (isPlayer (_this select 2)) then {
		(_this select 2) action ["getOut",(_this select 0)]; 
		(_this select 0) setVehicleLock "LOCKED";
		(_this select 0) removeAllEventHandlers "GetIn";
	};
}];


//We create the mission vehicles
_vehicle = createVehicle ["HMMWV_DZ",[(_coords select 0) + 14.1426, (_coords select 1) - 0.6202,0],[], 0, "CAN_COLLIDE"];

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 1.5547,(_coords select 1) + 2.3486,0],[], 0, "CAN_COLLIDE"];
[_crate,"industrial"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) + 0.3428,(_coords select 1) - 1.8985,0],[], 0, "CAN_COLLIDE"];
[_crate1,"medical"] ExecVM DZMSBoxSetup;
[_crate1] call DZMSProtectObj;

_crate2 = createVehicle ["USVehicleBox",[(_coords select 0) + 3.3428,(_coords select 1) - 1.8985,0],[], 0, "CAN_COLLIDE"];
[_crate2,"weapons"] ExecVM DZMSBoxSetup;
[_crate2] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel]
[[(_coords select 0) - 10.5005,(_coords select 1) - 2.6465,0],6,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;


P2DZ_mH = ["1", "A crashed C-130 is under attack!", _gps, "C130J"];
publicVariable "P2DZ_mH";

diag_log text format["[DZMS]: Major EM1 C130 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;