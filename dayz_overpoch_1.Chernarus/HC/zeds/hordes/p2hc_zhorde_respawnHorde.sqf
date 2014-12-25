/*---------------------------------------------------------------------------
Zombie Horde Respawner

Triggered by major waypoints;
Deletes & respawns any zombies that didn't make it within 200m of this waypoint
at the moment of it being triggered (aka by first zombie to make it there)
---------------------------------------------------------------------------*/
private ["_hordeNum", "_zedsSpawned", "_zedPos", "_currentWaypoint", "_plusOrMinus", "_zed", "_zedType", "_zedsInHorde", "_c", "_zeds2Respawn","_masterThread"];
_hordeNum = 		_this select 0;
_zedPos = 			_this select 1;
_currentWaypoint = 	_this select 2;
_plusOrMinus	 = 	_this select 3;
_zedType =			_this select 4;


if (isNil '_plusOrMinus') then {
	_plusOrMinus = "+";
};


if (str((P2DHZ_HC_zHorde_respawnTracker select (_hordeNum - 1)) select 1) == str _currentWaypoint) exitWith {
	//diag_log("Waypoint already triggered!");
};

//set waypoint in hordetracker
P2DHZ_HC_zHorde_respawnTracker set [(_hordeNum -1), [_hordeNum, _currentWaypoint]];


/*---------------------------------------------------------------------------
Respawn Any Zeds more than 1km away
---------------------------------------------------------------------------*/

//Get amount of living zeds in horde
_zedsInHorde = _hordeNum call P2DZ_HC_ZHorde_getAllZeds;

//used later
_zedsSpawned = false;

//Find out how many are within 1000m meters of waypoint given
_c = 0;
{
	//if we've lost our zedtype somehow then get it from here
	if (isNil '_zedType') then {	_zedType = typeOf(_x); };

	if (((position _x) distance _currentWaypoint) < 500) then {
		//if zed is ~at waypoint, add 1 to count
		_c = _c + 1;
	} else {
		//if zed not ~at waypoint, delete it
		_x call P2DZ_HC_ZHorde_cleanupZed;
	};
} count _zedsInHorde;
_zedsInHorde = _c;
_zeds2Respawn = P2DZ_HC_ZHorde_ZombiesPerHorde - _zedsInHorde;
//spawn zeds up to (max per horde - zombies within 1000m that are part of horde)
for "_i" from 1 to (_zeds2Respawn) do {
	//SpawnPos,HordeNum,NextWaypoint,MinDistfromSpawnPos,MaxDistfromSpawnPos,ZedType
	[_currentWaypoint,_hordeNum,_currentWaypoint,150,300,_zedType] call P2DZ_HC_ZHorde_spawnZed;
	_zedsSpawned = true;
};

//call waypoint adder to loop to all zeds spawned in horde that don't have it
if (_zedsSpawned) then { [_hordeNum,_plusOrMinus] call P2DZ_HC_ZHorde_waypointLoop; };


/*---------------------------------------------------------------------------
Start Regrouping Zeds Thread
---------------------------------------------------------------------------*/

_masterThread = [_hordeNum,_currentWaypoint,_plusOrMinus,_zedType] spawn {
	private ["_hordeNum", "_plusOrMinus","_zedsSpawned", "_currentWaypoint", "_timeSlept", "_time2Sleep", "_zedsInHorde", "_c", "_zeds2Respawn", "_zedType"];
	_hordeNum = 		_this select 0;
	_currentWaypoint = 	_this select 1;
	_plusOrMinus = 		_this select 2;
	_zedType =			_this select 3;
	//Tell zeds to wait around the waypoint
	[_hordeNum,_currentWaypoint] call P2DZ_HC_zHorde_standBy;

	//reset
	_timeSlept = 0;
	//get how long to let zeds regroup for from config
	_time2Sleep = P2DZ_HC_zHorde_regroupTime;

	//wait until regroup sleep timer is up
	while {_timeSlept = _timeSlept + 30; uiSleep 30; _timeSlept < _time2Sleep} do {

		/*---------------------------------------------------------------------------
			give regroup timer chance to exit early 
				IF all zeds from horde are alive and within 50m of currentwaypoint
		---------------------------------------------------------------------------*/
		_zedsInHorde = [];
		_zedCount = 0;
		_inRange = 0;

		_zedsInHorde = _hordeNum call P2DZ_HC_ZHorde_getAllZeds;
		_zedCount = count _zedsInHorde;

		{
			if ((_x distance _currentWaypoint) < 50) then {
				_inRange = _inRange + 1;
			};
		} forEach _zedsInHorde;

		if (_inRange == _zedCount) exitWith {
			diag_log("AllZeds in Range, no need to keep regrouping, exiting...");
		};
	};

	//Regroup timer finished

	/*---------------------------------------------------------------------------
	respawn any zeds that have got over 200m from regroup-zone
	---------------------------------------------------------------------------*/

	//Get amount of living zeds in horde
	_zedsInHorde = _hordeNum call P2DZ_HC_ZHorde_getAllZeds;

	//Find out how many are within 200 meters of waypoint given
	_c = 0;
	{
		//if we've lost our zedtype somehow then get it from here
		if (isNil '_zedType') then {	_zedType = typeOf(_x); };
		if (((position _x) distance _currentWaypoint) < 200) then {
			//if zed is ~at waypoint, add 1 to count
			_c = _c + 1;
		} else {
			//if zed not ~at waypoint, delete it
			_x call P2DZ_HC_ZHorde_cleanupZed;
		};
	} count _zedsInHorde;

	_zedsInHorde = _c;

	_zeds2Respawn = P2DZ_HC_ZHorde_ZombiesPerHorde - _zedsInHorde;

	//used later
	_zedsSpawned = false;

	//spawn zeds up to (max per horde - zombies within 200m that are part of horde)
	for "_i" from 1 to (_zeds2Respawn) do {
		//SpawnPos,HordeNum,NextWaypoint,MinDistfromSpawnPos,MaxDistfromSpawnPos,ZedType
		[_currentWaypoint,_hordeNum,_currentWaypoint,150,300,_zedType] call P2DZ_HC_ZHorde_spawnZed;
		_zedsSpawned = true;
	};

	//call waypoint adder to loop to all zeds spawned in horde that don't have it
	if (_zedsSpawned) then { [_hordeNum,_plusOrMinus] call P2DZ_HC_ZHorde_waypointLoop; };

	/*---------------------------------------------------------------------------
	Tell zeds to carry on to next waypoint in 45 seconds (give zeds up to 300m away a chance to catch up)
	---------------------------------------------------------------------------*/
	uiSleep 45;

	_hordeNum call P2DZ_HC_zHorde_carryOn;
};



/*---------------------------------------------------------------------------

Zeds Reach Trigger

respawn zeds that r dead or more than 1000m away

_storage = all zeds alive


_MasterThread = 

	tell all zeds in horde to stop (interrupt/regroup mode), hammer time.

	wait 300 seconds

	tell zeds to carry on moving (exit interrupt/regroup mode), quit master thread


Interrupt Zed (Regroup Mode):


	If More than 200m from waypoint and have aggro - switch to loiter-run mode & ignore aggro until within 200m zone of waypoint
	If within 200m of waypoint and no aggro - circle pit motherfucker!
	If within 200m of waypoint and aggro - normal aggro/attacking



---------------------------------------------------------------------------*/