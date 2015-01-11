private ["_long"];
_long = ;
cariEclick = {
	cariClick = 0;
	onMapSingleClick "";
	openMap [false,false];
	
	private ["_cariParac","_cariPos"];
	_cariPos = [_this select 0,_this select 1];
	
	_cariParac = format ["
		if (isDedicated) then {
			for '_i' from 0 to 50 do {
				_pos = [((%1) select 0)+random 100,((%1) select 1)+random 100];
				_cariVehicleItem = createVehicle ['ParachuteWest',[_pos select 0,_pos select 1],[],0,'FLY'];
				_cariVehicleItem2 = createVehicle ['%2',[_pos select 0,_pos select 1,150],[],0,'FORM']; 
				_cariVehicleItem2 attachTo [_cariVehicleItem,[0,0,0]];
				_uniqueid = str(round(random 999999));
				_cariVehicleItem setVariable ['CharacterID',_uniqueid,true];
				_cariVehicleItem setVariable ['ObjectID',_uniqueid,true];
				_cariVehicleItem setVariable ['ObjectUID',_uniqueid,true];
				_cariVehicleItem setVariable ['lastUpdate',time,true];
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem];};
				_cariVehicleItem2 setVariable ['CharacterID',_uniqueid,true];
				_cariVehicleItem2 setVariable ['ObjectID',_uniqueid,true];
				_cariVehicleItem2 setVariable ['ObjectUID',_uniqueid,true];
				_cariVehicleItem2 setVariable ['lastUpdate',time,true];
				if (!isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_cariVehicleItem2];};
				if (!isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_cariVehicleItem2];};
			};
		};
	",_cariPos,cariParav];
	[_cariParac] call cariRE;
	
	systemChat format ["Para dropped: %1s detonate 15s after landing",cariParav];
	
	if (cariParae) then {
		uiSleep 65;
		_cariKills = _cariPos nearEntities [cariParav,400];
		for "_i" from 0 to (count _cariKills)-1 do {
			_cariKill = _cariKills select _i;
			_pos = getPosATL _cariKill;
			_cariPart1 = "B";
			_cariPart2 = "o_";
			_cariPart3 = "FA";
			_cariPart4 = "B_2";
			_cariPart5 = "50";
			_cariWhole = format ["%1%2%3%4%5",_cariPart1,_cariPart2,_cariPart3,_cariPart4,_cariPart5];
			_cariWhole createVehicleLocal [_pos select 0,_pos select 1,_pos select 2];
		};
	};
};private ["_object","_qty"];if !("ItemMap" in items player) exitWith {
	systemChat "Map required! There is now one at your feet.";
	_object = createVehicle ["WeaponHolder",position player,[],0,"CAN_COLLIDE"];
	_object setVariable ["permaLoot",true];
	_qty=1;_object addWeaponCargoGlobal ["ItemMap",1];
};
if (isNil "cariClick") then {cariClick = 1;} else {cariClick = 1;};
openMap [true,false];
while {cariClick == 1} do {onMapSingleClick "[_pos select 0,_pos select 1,_pos select 2] spawn cariEclick;true";};