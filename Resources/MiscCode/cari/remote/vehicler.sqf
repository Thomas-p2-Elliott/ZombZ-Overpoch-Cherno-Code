private ["_long"];
_long = ;
private ["_pos","_cariVehic","_cariVehicleClass","_cariVehiclePos"];_cariVehicleClass = _this select 0;
_pos = getPosATL player;
_cariVehiclePos = [(_pos select 0)+7,(_pos select 1)+7,_pos select 2];_cariVehic = format ["
	if (isDedicated) then {
		_cariVehicleItem = createVehicle ['%1',%2,[],10,'NONE'];
		_uniqueid = str(round(random 999999));
		_cariVehicleItem setVariable ['CharacterID',_uniqueid,true];
		_cariVehicleItem setVariable ['ObjectID',_uniqueid,true];
		_cariVehicleItem setVariable ['ObjectUID',_uniqueid,true];
		_cariVehicleItem setVariable ['lastUpdate',time,true];
		_cariVehicleItem setVehicleLock 'UNLOCKED';
		if (%3) then {
			if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem];};
			if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem];};
		};
	};
",_cariVehicleClass,_cariVehiclePos,cariDayz];
[_cariVehic] call cariRE;systemChat format ["Creating %1..",_cariVehicleClass];
systemChat "Warning: Using some vehicle weapons may cause BE createVehicle kicks!";