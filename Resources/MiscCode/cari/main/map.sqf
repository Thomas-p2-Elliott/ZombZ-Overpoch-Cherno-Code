private ["_long"];
_long = ;
private ["_qty"];if !("ItemMap" in items player) exitWith {
	systemChat "Map required! There is now one at your feet.";
	_object = createVehicle ["WeaponHolder",position player,[],0,"CAN_COLLIDE"];
	_object setVariable ["permaLoot",true];
	_qty=1;_object addWeaponCargoGlobal ["ItemMap",1];
};cariMapp = {
	private ["_name","_pos","_vm"];		
	while {cariMap == 1} do {
		if (visibleMap) then {
			cariUpdateList = [7839,8414,0] nearEntities ["AllVehicles",11800];
			{
				if (!isNull _x) then {
					if (getPlayerUID _x != "") then {
						_name = name _x;
						_pos = getPosATL _x;
						if (surfaceIsWater _pos) then {_pos = getPosASL _x;};
						deleteMarkerLocal _name;
						_vm = createMarkerLocal [_name,_pos];
						_vm setMarkerTypeLocal "waypoint";
						_vm setMarkerTextLocal format ["%1",_name];
						_vm setMarkerColorLocal "ColorBlue";
					} else {
						if !(_x isKindOf "Man") then {
							if (count crew (_x) == 0) then {
								_pos = getPosATL _x;
								if (surfaceIsWater _pos) then {_pos = getPosASL _x;};
								deleteMarkerLocal format ["%1%2",typeOf (vehicle _x),_forEachIndex];
								_vm = createMarkerLocal [format ["%1%2",typeOf (vehicle _x),_forEachIndex],_pos];
								_vm setMarkerTypeLocal "waypoint";
								_vm setMarkerTextLocal format ["%1",typeOf (vehicle _x)];
								_vm setMarkerColorLocal "ColorWhite";
							};
						};
					};
				};
			} forEach cariUpdateList;
			uiSleep 10;
			{
				_name = name _x;
				deleteMarkerLocal _name;
				deleteMarkerLocal format ["%1%2",typeOf (vehicle _x),_forEachIndex];
			} forEach cariUpdateList;
		};
		uiSleep 1;
	};
	{
		_name = name _x;
		deleteMarkerLocal _name;
		deleteMarkerLocal format ["%1%2",typeOf (vehicle _x),_forEachIndex];
	} forEach cariUpdateList;
};if (cariMap == 0) then {
	cariMap = 1;
	systemChat "Map HUD enabled";
	[] spawn cariMapp;
} else {
	cariMap = 0;
	systemChat "Map HUD disabled";
};