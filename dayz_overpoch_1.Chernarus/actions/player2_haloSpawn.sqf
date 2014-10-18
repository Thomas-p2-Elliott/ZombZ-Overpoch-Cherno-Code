/*---------------------------------------------------------------------------
Halo Spawn Function
By Player2 for www.zombz.net
---------------------------------------------------------------------------*/

private ["_position"];
P2DZE_paraOpened = false;
P2DZE_hasLanded = false;
P2DZ_dbCurMode = 1;
P2DZ_debugMonitor = false;

waitUntil{!isnil "bis_fnc_init"};
waitUntil{!isnil "bis_fnc_halo"};
_position = getPosATL player;
player setvariable ["bis_fnc_halo_now",true];
[player,1500] spawn bis_fnc_halo;

//Prepare Halo Altimeter
disableSerialization;
uiNamespace setVariable ["altiHudOpened",false];

sleep 0.5;

[] spawn {
	while {
		_position = getPosATL player;
		_alt = _position select 2;
		_position2 = getPosASL player;
		_alt2 = _position2 select 2;
		sleep 0.5;
		_alt > 120 || _alt2 > 120
	} do {
		setViewdistance 1500;
		_unit = player;
		_parachute = vehicle player;
		_position = getPosATL player; _alt = _position select 2;
		_position2 = getPosASL player;
		_alt2 = _position2 select 2;
		//check if unit has opened parachute
		if (_parachute != _unit) then {
			P2DZE_paraOpened = true;
		} else {
			P2DZE_paraOpened = false;
		};

		P2DZE_hasLanded = false;
	};
	P2DZE_hasLanded = true;
	player setvariable ["bis_fnc_halo_now",false];
};

//Wait until player has chute open or is below 120 altitude
waitUntil{(P2DZE_paraOpened) || P2DZE_hasLanded};

//enable debug monitor
P2DZ_debugMonitor = true;
P2DZ_dbCurMode = 2;