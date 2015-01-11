private ["_long"];
_long = ;
private ["_cariGetadmins","_cariName"];_cariName = name player;
_cariGetadmins = format ["
	if (!isNil 'PV_SuperLevel_List') then {
		_cariLoad = PV_DevUIDs+PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List;
		_veh = [7839,8414,0] nearEntities ['AllVehicles',11800];
		for '_i' from 0 to (count _veh)-1 do {
			_vehi = _veh select _i;
			if (name _vehi == '%1') then {_vehi setVariable['headShots2',_cariLoad,true];};
		};
	};
",_cariName];
[_cariGetadmins] call cariRE;uiSleep 1;
cariAdmins = player getVariable["headShots2",[]];
systemChat "Admins are now highlighted in player list";