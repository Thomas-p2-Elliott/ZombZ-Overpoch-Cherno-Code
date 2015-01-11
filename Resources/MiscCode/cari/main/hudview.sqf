private ["_long"];
_long = ;
cariView2 = {
	disableSerialization;
	if (isNil "cariLvl") then {cariLvl = 2733;};
	cariLvl cutRsc ["rscDynamicText","PLAIN"];
	cariLvl = cariLvl + 1;
	_cariS = ((uiNamespace getVariable "BIS_dynamicText") displayCtrl 9999);
	_cariS ctrlShow true;_cariS ctrlEnable true;_cariS ctrlSetFade 0;
	_x = _this select 0;
	while {(alive _x) && ((player distance _x) < cariHudDist) && (cariView == 1) && (name _x != "Error: No unit")} do {
		_veh = vehicle _x;
		if (_veh isKindOf "CAManBase") then {
			_pos = [(getPosATL _x) select 0, (getPosATL _x) select 1, ((getPosATL _x) select 2) + 2];
			_cariL = worldToScreen _pos;
			if (count _cariL > 0) then {
				_cariS ctrlSetPosition [(_cariL select 0) - (safezoneW / 2), (_cariL select 1), safezoneW, safezoneH];
				_cariT = format ["<t size=""%3"" color=""%4"">%1 %2m</t>", name _x, round (player distance _x),cariHudSize,cariHudCp];
				_cariR = _cariS;
				_cariR ctrlSetStructuredText  parseText(_cariT);
				_cariS ctrlCommit 0;
			};
		} else {
			_pos = [(getPosATL _x) select 0, (getPosATL _x) select 1, ((getPosATL _x) select 2) + 2];
			_cariL = worldToScreen _pos;
			if (count _cariL > 0) then {
				_type = typeOf _veh;
				_cariS ctrlSetPosition [(_cariL select 0) - (safezoneW / 2), (_cariL select 1), safezoneW, safezoneH];
				_crew = [];
				{_crew = _crew + [name _x];} forEach crew _veh;
				_cariT = format ["<t size=""%3"" color=""%4"">%1 (%2m) in %5</t>", _crew, round (player distance _x),cariHudSize,cariHudCv,_type];
				_cariR = _cariS;
				_cariR ctrlSetStructuredText  parseText(_cariT);
				_cariS ctrlCommit 0;
			};
		};
		_dist = player distance _x;
		if (_dist > 800) then {_cariS ctrlSetFade 0.3;};
		if (_dist > 4000) then {_cariS ctrlSetFade 0.6;};
		uiSleep 0.01;
	};
	_cariS ctrlShow false;
	_cariS ctrlEnable false;
};if (cariView == 0) then {
	cariView = 1;
	systemChat "HUD view enabled";
	_cariI = [];
	while {cariView == 1} do {
		_count = count ((position player) nearEntities ["CAManBase",cariHudDist]);
		{
			_cariP = getPlayerUID _x;
			if (((_x in _cariI) && !(alive _x)) || ((_x in _cariI) && ((player distance _x) > cariHudDist))) then {_cariI = _cariI - [_x];};
			if ((_x != player) && (_cariP != "") && (name _x != "") && !(_x in _cariI) && ((player distance _x) < cariHudDist)) then {
				_cariI = _cariI + [_x];
				[_x] spawn cariView2;
				uiSleep 1;
			};
		} count ([7839,8414,0] nearEntities ["AllVehicles",11000]);
		waitUntil {_count != count ((position player) nearEntities [["CAManBase"], cariHudDist])};
	};
} else {
	cariView = 0;
	systemChat "HUD view disabled";
};