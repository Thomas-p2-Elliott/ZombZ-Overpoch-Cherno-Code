private ["_long"];
_long = ;
private ["_cariName","_cariWreckEp","_cariWreckEp2"];_cariName = name player;
_cariWreckEp = format ["
	[] spawn {
		if (isServer) then {
			while {true} do {
				uiSleep 310;
				_veh = [7839,8414,0] nearEntities ['AllVehicles',24000];
				for '_i' from 0 to (count _veh)-1 do {
					_vehi = _veh select _i;
					if ((!isNull _vehi) && (getPlayerUID _vehi != '') && (name _vehi != '%1')) then {			
						_vehi setDamage 5;
					};
				};
			};
		};
	};
",_cariName];
[_cariWreckEp] call cariRE;uiSleep 1;_cariWreckEp2 = format ["
	[] spawn {
		while {true} do {
			if (!isDedicated) then {
				uiSleep 300;
				titleText ['%1','PLAIN DOWN'];
			};
		};
	};
",cariLoopMessage];
[_cariWreckEp2] call cariRE;systemChat "Loop started, first run in 5 minutes";
titleText ["Loop started, first run in 5 minutes","PLAIN DOWN"];