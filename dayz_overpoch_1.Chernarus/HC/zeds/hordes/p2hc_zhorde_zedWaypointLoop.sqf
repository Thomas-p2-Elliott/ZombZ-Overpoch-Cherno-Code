/*---------------------------------------------------------------------------
Per-Zombie Thread

Each zombie runs this code in a loop while it is alive to keep itself moving
along the waypoints for its designated horde.
---------------------------------------------------------------------------*/
/*

Check to make sure that this waypoint thread isn't already running on the zombie, exit if it is
			use P2DZ_HC_zHorde_waypointLoop_sleepTime and add a random number between 1 and 10 to it
			(adding random number to it so each zombie has its own update timer offset to the other zombies to improve performance)
			Start a loop that runs while the zombie is alive with our randomised sleep timer:
				Get the zombies position
				Check which waypoint the zombie is closest to, and store it for later
				if the zombie has reached the destination set to it
					Find out which waypoint the zombie has set to it
					If it cant find the destination the zombie has reached in waypoint list, set its new destination to its closest waypoint
					If the zombies waypoint is in the path list
					check which direction zombie is currently travelling
					if waypoint is last in list, switch direction of travel
					if waypoint is major, trigger horde respawner using hordeNum and position
					get zombies next waypoint by doing current waypoint + or - 1
					set zombie to go to next waypoint
				else 
				  zombie has not reached its destination, do nothing
*/


//vars specific to this zed
private ["_d","_hordeNum", "_pathWaypoints", "_triggerWaypoints", "_zed", "_sleepTime", "_plusOrMinus", "_zedPos", "_zedDest", "_bestDist", "_cDist", "_bDistNum", "_count", "_closestWaypoint", "_waypontNumber", "_currentWayPointNumber", "_lastWp", "_nextWaypoint"];				_zed = _this select 0;
_zed = _this select 0;
_hordeNum = _this select 1;
_pathWaypoints = _this select 2;
_triggerWaypoints = _this select 3;
_d = P2DZ_HC_debugHordeZedFSM;
if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: Start: Input: %1", (_this)]);	};

//randomize this sleep time per zombie so code isn't all running at same time for headless on each update
_sleepTime = P2DZ_HC_zHorde_waypointLoop_sleepTime + (ceil(random 10));

//start plus or minus as a plus, so the default travel mode is from pos 0 to last pos through waypoint list
_plusOrMinus = "+";

/*---------------------------------------------------------------------------
Check to make sure this code isn't already running on this zombie
---------------------------------------------------------------------------*/
if (_zed getVariable ["p2dz_hordeWaypointBrain", false]) exitWith {
	if (_d) then { diag_log(format["P2Horde:WPThread:Z-ID:%1: Fatal Error: Waypoint thread already running on this zombie, why run it twice?",(netId _zed)]); };
};

/*---------------------------------------------------------------------------
Set variable on zombie to say that this code has been initialized
---------------------------------------------------------------------------*/
_zed setVariable ["p2dz_hordeWaypointBrain", true];

if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: p2dz_hordeWaypointBrain Set to True"]);	};


/*---------------------------------------------------------------------------
LOOP: While the zombie is alive
---------------------------------------------------------------------------*/
while {alive _zed} do {

	if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: While Alive Start"]);	};

	/*---------------------------------------------------------------------------
	Get Zombie position
	---------------------------------------------------------------------------*/
	_zedPos = position _zed;
	
	/*---------------------------------------------------------------------------
	Check zombies current destination
	---------------------------------------------------------------------------*/
	_zedDest = _zed getVariable ["myDest", nil];

	if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: Current myDest for Zed: %1",_zedDest]);	};

	/*---------------------------------------------------------------------------
	Find out which waypoint is closest to the zombie
	---------------------------------------------------------------------------*/
	_bestDist = 100000;
	_cDist = 	1000;
	_bDistNum = 0;
	_count = 	0;

	//check the distance from the zed to each waypoint in the list
	{ 
		//get zed distance from current waypoint in list (_x)
		_cDist = _zedPos distance _x;
		//if best distance found is bigger than current distance then current waypoint (_x) is closest
		if (_bestDist > _cDist) then {
			_bDistNum = _count; //using this to select from pathWaypoints array
			_bestDist = _cDist;
		};
		_count = _count + 1;
	} count _pathWaypoints;

	//get waypoint from bDistNum (_count at time of closest waypoint)
	_closestWaypoint = _pathWaypoints select _bDistNum;

	if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: ClosestWP for Zed: %1",_closestWaypoint]);	};

	/*---------------------------------------------------------------------------
	If Zombie has no Destination give it Closest waypoint
	---------------------------------------------------------------------------*/
	if (isNil '_zedDest') then {
		//set the zombies destination to its closest waypoint
		_zed setVariable ["myDest", _closestWaypoint];
		if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: Zed has no myDest set, setting to closestWaypoint: %1",_closestWaypoint]);	};
	};

	/*---------------------------------------------------------------------------
	Zombie has reached its destination
	---------------------------------------------------------------------------*/
	if (_zedPos distance _zedDest < 50) then {
		if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: Zed has reached its myDest: %1",_zedDest]);	};

		//find out which waypoint number they are at in the path list
		_waypontNumber = 0;
		_currentWayPointNumber = -1;
		{ 
			//if distance between the zombies set destination and the destination in path list is less than 50 we have our current destination
			if ((_zedDest distance _x) < 50) then { _currentWayPointNumber = _waypontNumber;  };   
			_waypontNumber = _waypontNumber + 1;
		} count _pathWaypoints;


		//if current waypoint number remains at -1 then either:
		// A: it cannot find which waypoint the zombie thinks it reached in the list
		// B: the zombie never had a vaild waypoint given to it from the list in the first place
		// C: act of arma
		// D: wait wait wait, does the zombie use myDest to chase a player?! ohh fuck...
		if (_currentWayPointNumber < 0) then {
			
			if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: CantFind waypoint, Sending to Closest: %1",_closestWaypoint]);	};
			
			//so send it to its closest waypoint
			_zed setVariable ["myDest", _closestWaypoint];
		} else {

			if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: Found waypoint, checking Travel Dir..."]);	};

			/*---------------------------------------------------------------------------
			Check zombies order of travel (forwards or backwards through waypoints)
			---------------------------------------------------------------------------*/
			if (_plusOrMinus == "+") then {
				//zombie is travelling forwards through waypoints
				//lastwaypoint is last in pathwaypoints
				_lastWp = _pathWaypoints select ((count _pathWaypoints) - 1);
				//if within 50m of last waypoint
				if (_lastWp distance _zedPos < 50) then	{
					//switch order of travel
					_plusOrMinus = "-";
				};
			} else {
				//Zombie is travelling backwards through waypoints
				//last waypoint is first in list
				_lastWp = _pathWaypoints select 0;
				//if within 50m of last waypoint
				if (_lastWp distance _zedPos < 50) then	{
					//switch order of travel
					_plusOrMinus = "+";
				};
			};

			if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: Travel Dir: %1, getting next Waypoint",_plusOrMinus]);	};

			/*---------------------------------------------------------------------------
			Give zombie the next waypoint to travel to
			---------------------------------------------------------------------------*/
			//get next waypoint by doing current waypoint +/- 1 (+/- depends on travel order)
			_nextWaypoint = [_pathWaypoints,_currentWayPointNumber] call compile (format["(_this select 0) select ((_this select 1) %1 1)",_plusOrMinus]);
			
			if (isNil '_nextWaypoint') then {

				if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: NextWaypoint not found, sending to closest: %1",_closestWaypoint]);	};

				//if next waypoint doesnt come through for some reason, send zed to its nearest waypoint
				_zed setVariable ["myDest", _closestWaypoint];
			} else {

				if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: NextWaypoint found, sending to: %1",_nextWaypoint]);	};

				//next waypoint came through ok, send zed to it
				_zed setVariable ["myDest", _nextWaypoint];
			};
		};

		/*---------------------------------------------------------------------------
		Check if zombie has reached a trigger waypoint
		---------------------------------------------------------------------------*/
		//for each respawn-trigger waypoint	
		{
			//if the distance between this trigger and the zombie less than 50
			if ((_x distance (_zedPos) < 50)) then {

				/*---------------------------------------------------------------------------
				Zombie HAS reached a horde-respawn trigger waypoint
				---------------------------------------------------------------------------*/

				if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: ZedReached a RespawnTrigger: %1",_x]);	};

				//respawn zombies in the horde and give them this zombies next waypoint as their waypoint
				//[_hordeNum,_zedPos,_nextWaypoint] call P2DZ_HC_ZHorde_respawnHorde;
			};
		} count _triggerWaypoints;
	};

	//wait a while before checking again
	uiSleep _sleepTime;

	//end of while-zombie-alive loop
};

//end of individual-per-zombie-spawn-thread
