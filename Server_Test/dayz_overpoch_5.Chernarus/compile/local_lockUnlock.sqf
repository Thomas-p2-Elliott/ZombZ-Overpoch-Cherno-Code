private ["_vehicle","_status"];
_vehicle = _this select 0;
_status = _this select 1;

if (local _vehicle) then {
	if(_status) then {
		_vehicle setVehicleLock "LOCKED";
		_vehicle setVariable ["LOG_disabled",true,true];
		diag_log("P2DEBUG: Towing disabled for vehicle...");
	} else {
		_vehicle setVehicleLock "UNLOCKED";
		_vehicle setVariable ["LOG_disabled",false,true];
		diag_log("P2DEBUG: Towing enabled for vehicle...");
	};
};