/*---------------------------------------------------------------------------
Zombie Horde Waypoint Loop

Basic Description: Keeps zeds moving along their hordes waypoints

HowToUse:
Spawn all zombie hordes you want first, set their hordeZed_<HORDE_NUMBER> variable to true so
that the function P2DZ_HC_ZHorde_getAllZeds used in this loop will recognise which zeds to run code on
and which horde number them zeds are in, then run this loop once.
Then run call P2DZ_HC_ZHorde_waypointLoop once all zeds are spawned in.

Advanced Description/Code Map:
	For each horde configured it runs this:
		Get horde path waypoint and trigger waypoints using horde number
		Get all living zombies from that horde number on the map
		For Each alive zombie from each horde:
			Start a new thread to run on that zombie:
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
			end loop & exit thread if zombie dies (or if exit is called because thread was already running on that zed)
		exit for each after opening thread on each zombie


Warning: Never call for this loop more than once! It will auto adjust live
depending on how many hordes or zombies are in-game
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_waypointLoop = {
	private["_d"];
	_d = P2DZ_HC_HordeZedsDebug;
	if (_d) then {	diag_log("P2HC:HordeZedSpawns:WayPointLoop: Starting");	};

	//for 1 to amount of hordes, where _x = hordeNumber, so if 4 hordes _x would be 1, then 2, then 3, then 4.
	for "_x" from 1 to P2DZ_HC_ZHorde_HordeCount do {
		//vars specific to this horde
		private["_d","_hordeNum","_pathWaypoints","_pathVar","_triggerVar","_selectNum","_triggerWaypoints","_allZedsInHorde"];
		//Initialize variables (prevent undefined variable error)
		_allZedsInHorde = [];
		_triggerWaypoints = [];
		_pathWaypoints = [];
		_hordeNum = 0;
		_selectNum = 0;
		_pathVar = "";
		_triggerVar = "";
		_d = P2DZ_HC_HordeZedsDebug;

		//For each horde configured
	 	_hordeNum = _x;

		if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:WayPointLoop: Looking for Zeds in Horde: %1",_hordeNum]);	};

	 	//take 1 away for 0 based array since for starts at 1
		_selectNum = _hordeNum - 1;

		//Select horde path var name P2DZ_HC_ZHorde_PathWayp_%VarName%
		_pathVar = P2DZ_HC_ZHorde_PathWaypointNames select _selectNum;
		//Select horde trigger var name (P2DZ_HC_ZHorde_TriggerWayp_%VarName%)
		_triggerVar = P2DZ_HC_ZHorde_TriggerWaypointNames select _selectNum; 

		//Get path waypoints
		_pathWaypoints = call compile format["P2DZ_HC_ZHorde_PathWayp_%1",_pathVar];
		//Get trigger waypoints
		_triggerWaypoints = call compile format["P2DZ_HC_ZHorde_TriggerWayp_%1",_triggerVar];

		//Use horde number (_x) to get all zeds in horde as an array 
		_allZedsInHorde = _x call P2DZ_HC_ZHorde_getAllZeds;

		if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:WayPointLoop: allZedsInHorde: %1", _allZedsInHorde]);	};
		if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:WayPointLoop: PathWaypoints: %1", _pathWaypoints]);	};
		if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:WayPointLoop: TriggerWaypoints: %1", _triggerWaypoints]);	};

		//for each zombie in horde number _x
		{
			/*---------------------------------------------------------------------------
			Per-Zombie Thread

			Each zombie runs this code in a loop while it is alive to keep itself moving
			along the waypoints for its designated horde.
			---------------------------------------------------------------------------*/

			if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:WayPointLoop: Starting Thread for Zed: %1", (_x)]);	};

			//Warning, _x has changed to the zombie itself. It is no longer the hordeNum
			//Pass some variables into this code so the zombie knows what horde it is in and what waypoints it should be using
			[_x,_hordeNum,_pathWaypoints,_triggerWaypoints] spawn {
				//vars specific to this zed
				private ["_d","_hordeNum", "_pathWaypoints", "_triggerWaypoints", "_zed", "_sleepTime", "_plusOrMinus", "_zedPos", "_zedDest", "_bestDist", "_cDist", "_bDistNum", "_count", "_closestWaypoint", "_waypontNumber", "_currentWayPointNumber", "_lastWp", "_nextWaypoint"];				_zed = _this select 0;
				_zed = _this select 0;
				_hordeNum = _this select 1;
				_pathWaypoints = _this select 2;
				_triggerWaypoints = _this select 3;
				_d = P2DZ_HC_HordeZedsDebug;
				if (_d) then {	diag_log(format["P2HC:HordeZedSpawns:ZedThread: Start: Input: %1", (_this)]);	};

				//randomize this sleep time per zombie so code isn't all running at same time for headless on each update
				_sleepTime = P2DZ_HC_zHorde_waypointLoop_sleepTime + (ceil(random 10));

				//start plus or minus as a plus, so the default travel mode is from pos 0 to last pos through waypoint list
				_plusOrMinus = "+";

				/*---------------------------------------------------------------------------
				Check to make sure this code isn't already running on this zombie
				---------------------------------------------------------------------------*/
				if (_zed getVariable ["p2dz_hordeWaypointBrain", false]) exitWith {
					diag_log(format["P2Horde:WPThread:Z-ID:%1: Fatal Error: Waypoint thread already running on this zombie, why run it twice?",(netId _zed)]);
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
								[_hordeNum,_zedPos,_nextWaypoint] call P2DZ_HC_ZHorde_respawnHorde;
							};
						} count _triggerWaypoints;
					};

					//wait a while before checking again
					uiSleep _sleepTime;

					//end of while-zombie-alive loop
				};

				//end of individual-per-zombie-spawn-thread
			};

			//end of for each zombie in horde
		} forEach _allZedsInHorde;
		//end of for each horde
	};
//end of waypoint function
};

/*---------------------------------------------------------------------------
Get All Alive Zombies in Horde and return as array of zombie objects
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_getAllZeds = {
	private ["_hordeNum", "_returnArray", "_mn"];
	_hordeNum = _this;
	_returnArray = [];
	_mn = (getMarkerPos 'center') nearEntities ["CAManBase",25000]; 	//Count All Men on Map
	{
		//check if any of them men are living zombies that are part of this horde number
		if (_x isKindof "zZombie_Base" && alive _x && (_x getVariable [(format["hordeZed_%1",_hordeNum]), false])) then {
	 		_returnArray = _returnArray + [_x];
		}; 
	} foreach _mn;

	_returnArray;
};

/*---------------------------------------------------------------------------
Zombie Loiter Replacement
---------------------------------------------------------------------------*/
zombieHorde_loiterHC = {
	private ["_unit","_originalPos","_pos","_d"];
	_unit = 		_this select 0;
	_originalPos = 	_this select 1;
	_pos = 			getPosATL _unit;

	_d = 			P2DZ_HC_debugHordeZedFSM;
	if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:Loiter:Input: %1",_this]);	};

	if (count _this > 2) then {
		_pos = _this select 2;
	};

	if(isNull group _unit) then {
		_unit moveTo _pos;
	} else {
		_unit domove _pos;
	};

	_unit forceSpeed 2;
};


/*---------------------------------------------------------------------------
Zombie Horde Tracker

Tracks a horde after it is first spawned
  to make sure it fully respawns when most of the zeds die.
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_tracker = {
	private ["_hordeNum", "_zc", "_mn"];
	_hordeNum = _this;

	while {true} do {
		_zc = 0;	//reset z count
		_mn = (getMarkerPos 'center') nearEntities ["CAManBase",25000]; 	//Count All Men on Map
		//check if any of them men are living zombies that are part of this horde number
		{ if (_x isKindof "zZombie_Base" && alive _x && (_x getVariable [(format["hordeZed_%1",_hordeNum]), false])) then { _zc = _zc + 1;	}; } foreach _mn;

		//If less than 2 zombies left, respawn entire horde
		if (_zc < 2) then {
			//delete existing horde
			_hordeNum call P2DZ_HC_ZHorde_cleanupHorde;
			//spawn new horde
			_hordeNum call P2DZ_HC_ZHorde_spawnHorde;
		};

		//sleep 2 minutes between each check
		uiSleep 120;
	};
};

/*---------------------------------------------------------------------------
Zombie Horde Spawner 
	Called on horde startup / Horde death
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_spawnHorde = {
	private ["_hordeNum","_spawnPos","_waypoint","_pathVar","_pathWaypoints","_hordeType"];
	_hordeNum = _this select 0;
	_hordeType = _this select 1;

	if (isNil '_hordeType') then { _hordeType = "z_soldier" };

	//get path variable from horde number
	_pathVar = P2DZ_HC_ZHorde_PathWaypointNames select (_hordeNum - 1);

	//Get path waypoints
	_pathWaypoints = call compile format["P2DZ_HC_ZHorde_PathWayp_%1",_pathVar];

	//select first path waypoint as starting point
	_waypoint = _pathWaypoints select 0;

	//select spawnpos as somewhere near (75m) starting point
	_spawnPos = [_waypoint,5,75,0,0,0,0] call BIS_fnc_findSafePos;

	//spawn zeds up to (max per horde - zombies within 200m that are part of horde)
	for "_i" from 1 to (P2DZ_HC_ZHorde_ZombiesPerHorde) do {
		//SpawnPos,HordeNum,NextWaypoint,MinDistfromSpawnPos,MaxDistfromSpawnPos,ZedType
		[_spawnPos,_hordeNum,_waypoint,0,30,_hordeType] call P2DZ_HC_ZHorde_spawnZed;
	};

	//call waypoint adder to loop to all zeds spawned in horde that don't have it (GORSY: how does this work on each zombie its not in the zombie loop)
	call P2DZ_HC_ZHorde_waypointLoop;
};

/*---------------------------------------------------------------------------
Zombie Horde Respawner

Triggered by major waypoints;
Deletes & respawns any zombies that didn't make it within 200m of this waypoint
at the moment of it being triggered (aka by first zombie to make it there)
---------------------------------------------------------------------------*/

P2DZ_HC_ZHorde_respawnHorde = {
	private ["_hordeNum", "_waypoint", "_zedsInHorde", "_c", "_cpos"];
	_hordeNum = _this select 0;
	_cpos = 	_this select 1;
	_waypoint = _this select 2;

	//Get amount of living zeds in horde
	_zedsInHorde = _hordeNum call P2DZ_HC_ZHorde_getAllZeds;

	//Find out how many are within 200 meters of waypoint given
	_c = 0;
	{
		if (((position _x) distance _waypoint) < 200) then {
			//if zed is ~at waypoint, add 1 to count
			_c = _c + 1;
		} else {
			//if zed not ~at waypoint, delete it
			_x call P2DZ_HC_ZHorde_cleanupZed;
		};
	} count _zedsInHorde;
	//update horde count to just those within 200m of waypoint
	_zedsInHorde = _c;

	//spawn zeds up to (max per horde - zombies within 200m that are part of horde)
	for "_i" from 1 to (P2DZ_HC_ZHorde_ZombiesPerHorde - _zedsInHorde) do {
		//SpawnPos,HordeNum,NextWaypoint,MinDistfromSpawnPos,MaxDistfromSpawnPos,ZedType
		[_cpos,_hordeNum,_waypoint,0,30,"z_soldier"] call P2DZ_HC_ZHorde_spawnZed;
	};

	//call waypoint adder to loop to all zeds spawned in horde that don't have it
	call P2DZ_HC_ZHorde_waypointLoop;
};


/*---------------------------------------------------------------------------
Horde Zed Spawner
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_spawnZed = {
	private ["_spawnPos", "_hordeNum", "_minDist", "_zedType", "_maxDist", "_unitTypes", "_loot", "_array", "_agent", "_method", "_radius", "_type", "_position", "_d", "_waypoint", "_lootType", "_index", "_weights", "_loot_count"];
	_d = 	P2DZ_HC_HordeZedsDebug;																		//debugging

	//if (_d) then { diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: Input: %1",	_this]); };

	//Get input
	_spawnPos = 		_this select 0; 																//Input: Spawn Position
	_hordeNum = 		_this select 1;																	//Input: Horde Number
	_waypoint = 		_this select 2;																	//Input: Waypoint for zed to move to
	_minDist =			_this select 3;																	//Input: Min Dist from Player
	_maxDist =			_this select 4;																	//Input: Max Dist from Player
	_zedType =			_this select 5;																	//Input: Zed skin classname, can be set to 'random'

	//Make sure spawnpos is given and is an array
	if (isNil '_spawnPos' || {typeName _spawnPos != typeName []}) exitWith {	diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: FATAL INPUT ERROR (0): %1",	_this]);	};
	//Make sure hordeNum is given and is a number
	if (isNil '_hordeNum' || {typeName _hordeNum != typeName 1}) exitWith {		diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: FATAL INPUT ERROR (1): %1",	_this]);	};
	//Make sure _waypoint is given and is a array
	if (isNil '_waypoint' || {typeName _waypoint != typeName []}) exitWith {	diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: FATAL INPUT ERROR (2): %1",	_this]);	};	
	//if maxDist or minDist arent given set them to default of min 1 and max 50
	if (isNil '_maxDist') then 		{	_maxDist = 50;	};	if (isNil '_minDist') then 		{	_minDist = 1;	};
	//if zed type isnt given then set it to heavy z soldier as default
	if (isNil '_zedType') then 		{	_zedType = "z_soldier";	};

	//if zed type set to random then pick a random zed skin
	if (_zedType == "random") then {
		_unitTypes = []+ getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass"); 	//Get all zed types
		_zedType = 		_unitTypes call BIS_fnc_selectRandom;												//Pick random zed type
	};

	_agent = 		objNull;																			//Init agent as null object
	_method = 		"CAN_COLLIDE";																		//Spawn method with no collision detection
	_radius = 		2; 																					//Radius to spawn zeds within spawn pos
	_loot = 		"";																					//Init loot as empty string
	_array = 		[];																					//Init loot array as empty
	_type = 		_zedType;																			//set
	_position = 	[_spawnPos,_minDist,_maxDist,_radius,0,0,0] call BIS_fnc_findSafePos;				//Pick random spawn position
	_agent = 		createAgent [_type, _position, [], _radius, _method];								//Create the zombie
	_agent 			removeAllEventHandlers "local";														//Remove its handlers for local and add our own (below)
	_id = 			_agent addEventHandler ["local", { diag_log "Locality Event"; if(_this select 1) then {[(position (_this select 0)),(_this select 0),true] execFSM "HC\zeds\hordes\zombieHorde_agentHC.fsm" };}];
	_agent setDir 	round(random 180);																	//Make zed face random direction instead of N

	//If agent is null and failed to create, exit with error code
	if (isNull _agent) exitWith {	if (_d) then { diag_log ("P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: FATAL ERROR: _agent is Null!"); }; };

	if (_d) then { diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: Setting Zed Vars..."]); };												

	//get unit moving towards its first waypoint		 															
	_agent setVariable ["myDest",_waypoint];													
	_agent setVariable ["newDest",_waypoint];

	//set zombie horde number variables
	for "_i" from 1 to (P2DZ_HC_ZHorde_HordeCount) do {
		if (_i == _hordeNum) then {
			_agent setVariable [(format["hordeZed_%1",_i]),true];	
			if (_d) then { diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed:    Set ZedHordeNum to True:  %1",	_i]); };												
		} else {
			if (_d) then { diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed:    Set ZedHordeNum to False: %1",_i]); };												
			_agent setVariable [(format["hordeZed_%1",_i]),false];											
		};							
	};	

	if (_d) then { diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: ...Done Setting Vars"]); };												

	//Add some loot 
	_lootType = configFile >> "CfgVehicles" >> _type >> "zombieLoot";
	if (isText _lootType) then {
		_array = [];
		{
			_array set [count _array, _x select 0]
		} count getArray (missionConfigFile >> "cfgLoot" >> getText(_lootType));
		if (count _array > 0) then {
			_index = dayz_CLBase find getText(_lootType);
			_weights = dayz_CLChances select _index;
			_loot = _array select (_weights select (floor(random (count _weights))));
			if(!isNil "_array") then {
				_loot_count =   getNumber(configFile >> "CfgMagazines" >> _loot >> "count");
				if(_loot_count>1) then {
					_agent addMagazine [_loot, ceil(random _loot_count)];
				} else {
					_agent addMagazine _loot;
				};
			};
		};
	};

	_id = [_position,_agent] execFSM "HC\zeds\hordes\zombieHorde_agentHC.fsm";	//Start behavior (fsm ai)


	if (_d) then { diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: ZedSpawned, id: %1",_id]); };

	/*---------------------------------------------------------------------------
	HeadlessZed Anti-Stuck by Player2

	 Description:
	 	Spawn Loop to make sure zombie gets deleted
	 	if it doesnt move more than 10m in 2 checks...
	 	Each check runs on 60sec interval
	---------------------------------------------------------------------------*/
	[_agent] spawn {
		private["_agent","_pos","_lastPos","_notMoveCount","_d"];
		//Variable Initalization
		_agent = objNull; _pos = [];	_lastPos = []; _notMoveCount = 0;
		_agent = _this select 0;
		_lastPos = getPosATL _agent;
		_d = P2DZ_HC_debugHordeZedFSM;
		if (_d) then { diag_log(format["P2HC:HordeZedSpawns: ZedAntiStuck: Starting"]); };

		while {!isNull _agent && {alive _agent}} do {
			_pos = getPosATL _agent;
			if ((_lastPos distance _pos) < 10) then {
				_notMoveCount = _notMoveCount + 1;
			} else {
				_notMoveCount = 0;
			};

			if (_notMoveCount > 1) exitWith {
				if (_d) then { diag_log(format["P2HC:HordeZedSpawns: ZedAntiStuck: Zed Hasn't Moved More than 10m for %1 60 second interval checks...Deleting",_notMoveCount]); };
			};

			if (_d) then { diag_log(format["P2HC:HordeZedSpawns: ZedAntiStuck: Sleeping 60"]); };

			uiSleep 60;

		};

		if (!isNull _agent) then {
			if (_d) then { diag_log(format["P2HC:HordeZedSpawns: ZedAntiStuck: AgentDeleted"]); };
			_agent call P2DZ_HC_ZHorde_cleanupZed;
		};

		if (_d) then { diag_log(format["P2HC:HordeZedSpawns: ZedAntiStuck: Finished"]); };
	};

	/*---------------------------------------------------------------------------
	www.ZombZ.net - Player2
	---------------------------------------------------------------------------*/
};

/*---------------------------------------------------------------------------
delete each zombie in given horde number on map
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_cleanupHorde = {
	private ["_hordeNum", "_mn"];
	_hordeNum = _this select 0;
	_mn = [];
	_mn = (getMarkerPos 'center') nearEntities ["CAManBase",25000]; 	//Count All Men on Map
	{ 
		//check if any of them men are living zombies that are part of this horde number
		if (_x isKindof "zZombie_Base" && {(_x getVariable [(format["hordeZed_%1",_hordeNum]), false])}) then {
			_x call P2DZ_HC_ZHorde_cleanupZed;
		};
	} foreach _mn;
};

/*---------------------------------------------------------------------------
Delete any zombie passed into it
Makes sure zed isnt null & var passed in isnt nil
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_cleanupZed = {
	private["_zed"];
	_zed = _this;
	if (isNil '_zed') exitWith {		diag_log(format["P2DZ_HC_ZHorde_cleanupZed: ERROR: Object var (%1) passed in was nil",_zed]); };
	if (!isNull _zed) then {	
		if (_zed isKindof "zZombie_Base") exitWith {
			deleteVehicle _zed;	
		};
		diag_log(format["P2DZ_HC_ZHorde_cleanupZed: ERROR: Object (%1) passed in was not a zombie!",typeOf _zed]);
	};
};

//set functions done to true
P2DZ_HC_zedHordeFunctionsDone = true;