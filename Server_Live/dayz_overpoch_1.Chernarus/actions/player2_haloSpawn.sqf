/*---------------------------------------------------------------------------
Halo Spawn Function
By Player2 for www.zombz.net
---------------------------------------------------------------------------*/

private ["_position","_changed"];
P2DZE_paraOpened = false;
P2DZE_hasLanded = false;
P2DZ_dbCurMode = 1;
P2DZ_debugMonitor = false;

waitUntil{!isnil "bis_fnc_init"};
waitUntil{!isnil "bis_fnc_halo"};
_position = getPosATL player;
player setvariable ["bis_fnc_halo_now",true];
[player,1500] spawn bis_fnc_halo;

//set players view distance early for halo jumpers
setViewDistance P2DZ_dbViewDist;

_changed = false;
if (isNil 'P2DZ_dbViewDist') then { P2DZ_dbViewDist = 1000 };

//Raise View Distance to at least 1500
if (!isNil 'P2DZ_dbViewDist') then {

	if (typeName P2DZ_dbViewDist != typeName 1500) then {
		P2DZ_dbViewDist = 1000;
		setViewDistance P2DZ_dbViewDist;
	};

	if (P2DZ_dbViewDist < 1500) then {
		setViewDistance 1500;
		if (P2DZE_debugLogin) then { diag_log("P2DEBUG: ViewDistance Raised to 1500"); };
		_changed = true;
	};
};

//Prepare Halo Altimeter
disableSerialization;
uiNamespace setVariable ["altiHudOpened",false];

sleep 0.5;

[_changed] spawn {
	private["_position","_alt","_unit","_alt2","_position2","_parachute","_changed"];
	_changed = _this select 0;
	if (isNil '_changed') then { _changed = false; };
	while {
		_position = getPosATL player;
		_alt = _position select 2;
		_position2 = getPosASL player;
		_alt2 = _position2 select 2;
		sleep 0.5;
		_alt > 120 || _alt2 > 120
	} do {
		_unit = player;
		_parachute = vehicle player;
		_position = getPosATL player; _alt = _position select 2;
		_position2 = getPosASL player;
		_alt2 = _position2 select 2;
		//check if unit has opened parachute
		if (_parachute != _unit) then {
			P2DZE_paraOpened = true;
			if (_changed) then { setViewDistance P2DZ_dbViewDist; };
		} else {
			P2DZE_paraOpened = false;
		};

		P2DZE_hasLanded = false;
	};
	P2DZE_hasLanded = true;
	player setvariable ["bis_fnc_halo_now",false];
	if (_changed) then { setViewDistance P2DZ_dbViewDist; };
};

//Wait until player has chute open or is below 120 altitude
waitUntil{(P2DZE_paraOpened) || P2DZE_hasLanded};

//Lower View Distance if it was changed
if (_changed) then { setViewDistance P2DZ_dbViewDist; };

//enable debug monitor
P2DZ_debugMonitor = true;
P2DZ_dbCurMode = 2;