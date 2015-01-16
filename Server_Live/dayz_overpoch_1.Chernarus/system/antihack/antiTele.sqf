/* anti-teleport */
private ["_isWater","_puid","_pname","_mPos","_debug","_lastpos","_lastheight","_lasttime","_lastVehicle","_v","_h","_topv","_toph","_isHalo","_curpos","_distance","_curtime","_difftime","_acceptableDistance","_curheight","_speed","_topSpeed","_terrainHeight","_safetyVehicle","_PUID","_curPos"];
_pname = _this select 0; _puid = _this select 1; _mPos = _this select 2;

while {11250 == 11250} do {
	_debug = _mPos;
	_lastpos = getPosATL (vehicle player);
	_lastheight = (ATLtoASL _lastpos) select 2;
	_lasttime = diag_ticktime;
	_lastVehicle = vehicle player;

	// freefall detection:
	_v = 0;
	_h = 0;
	_topv = 0;
	_toph = 0;
	_isHalo = false;

	while {((typeName player == "OBJECT") && {((player in playableUnits) || {(alive player)})})} do {
		_curpos = getPosATL (vehicle player);
		_distance = _lastpos distance _curpos;
		_curtime = diag_ticktime;
		_difftime = _curtime - _lasttime;
		_acceptableDistance = if (_lastVehicle isKindOf "Plane") then { 25; } else { 20; };
		_isHalo = player getVariable ["bis_fnc_halo_now", false];
		_isWater = surfaceIsWater [(position player) select 0, (position player) select 1, 0];
		if ((_distance > _acceptableDistance) || {(_difftime > 1)}) then {
			_curheight = (ATLtoASL _curpos) select 2;
			_speed = _distance / _difftime;
			_topSpeed = if (_acceptableDistance == 15) then { 25; } else { 20; };
			if (vehicle player != player) then {
				if (_acceptableDistance == 15) then {
					_topSpeed = (getNumber (configFile >> "CfgVehicles" >> typeOf (vehicle player) >> "maxSpeed")) max 500;
				} else {
					_topSpeed = (getNumber (configFile >> "CfgVehicles" >> typeOf (vehicle player) >> "maxSpeed")) min 500;
				};
			};
			_terrainHeight = getTerrainHeightASL [_curpos select 0, _curpos select 1];
			_safetyVehicle = vehicle player;
			if (_lastVehicle == vehicle player) then {
				if ((_speed > _topSpeed) 
					&& (alive player) 
					&& !(_lastVehicle in ["ParachuteWest","ParachuteC"])
					&& ((driver (vehicle player) == player) || (isNull (driver (vehicle player)))) 
					&& (_debug distance _lastpos > 3000) 
					&& (_debug distance _curpos > 3000)
					&& (((getPos (vehicle player)) distance [-7239.02,19538.6,0]) > 3000)
					&& (((getPos (vehicle player)) distance [0,0,0]) > 3000)
					&& !((vehicle player == player) 
					&& (_curheight < _lastheight) 
					&& ((_curheight - _terrainHeight) > 1))
					&& !(_isWater)
					&& !(_isHalo)) then {
						(vehicle player) setposATL  _lastpos;
						_PUID = [player] call FNC_GetPlayerUID;
						P2DZ_fire = format["TELEPORT REVERT: player (%6) UID (%1) to %2 from %3, %4 meters, now at %5", _PUID, _lastpos, _curPos, round(_lastpos distance _curpos), getPosATL player, name player];
						publicVariableServer "P2DZ_fire";
				} else {
					_lastpos = (getPos (vehicle player));
					_lastheight = _curheight;
				};
				_lasttime = _curtime;
			};
			if (_safetyVehicle == vehicle player) then {
				_lastVehicle = vehicle player;
			};

		};
		uisleep 0.25;
	};
	uisleep 0.1;
};

P2DZ_fire = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, 'AntiTeleport', 'Loop Exited'];
publicVariableServer 'P2DZ_fire';
[] spawn P2DZ_AHKick;

