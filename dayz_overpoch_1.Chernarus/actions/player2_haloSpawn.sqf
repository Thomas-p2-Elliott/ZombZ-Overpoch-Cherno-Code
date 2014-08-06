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
diag_log("SpawnPos: " + str(_position select 0) + ", " + str(_position select 1) + ", 2500");
player setPosATL [_position select 0,_position select 1,2500];
player setvariable ["bis_fnc_halo_now",true];
[player,2500] spawn bis_fnc_halo;
//Spawn Halo Altimeter
disableSerialization;
showWatch false;
666 cutRsc ['ATM_Altimeter', 'PLAIN'];
uiNamespace setVariable ["altiHudOpened",true];


[] spawn {
	while {
		_position = getPosATL player;
		_alt = _position select 2;
		_position2 = getPosASL player;
		_alt2 = _position2 select 2;
		sleep 0.5;
		_alt > 120 || _alt2 > 120
	} do {
		setViewdistance 2750;
		_unit = player;
		_parachute = vehicle player;
		_position = getPosATL player; _alt = _position select 2;
		_position2 = getPosASL player;
		_alt2 = _position2 select 2;
		//check if unit has opened parachute
		if (_parachute != _unit) then {
			P2DZE_paraOpened = true;
			diag_log("Parachute open!");
		} else {
			P2DZE_paraOpened = false;
			diag_log("Halo Falling...");
		};

		P2DZE_hasLanded = false;
	};
	diag_log("Landed...");
	P2DZE_hasLanded = true;
	player setvariable ["bis_fnc_halo_now",false];
};

//Wait until player has chute open or is below 120 altitude
waitUntil{(P2DZE_paraOpened) || P2DZE_hasLanded};

//hide halo altimeter
[] call ALTIMETER_fnc_HideCtrl;
666 cutText ["","PLAIN"];
uiNamespace setVariable ["altiHudOpened",false];

//enable debug monitor
P2DZ_debugMonitor = true;
P2DZ_dbCurMode = 2;