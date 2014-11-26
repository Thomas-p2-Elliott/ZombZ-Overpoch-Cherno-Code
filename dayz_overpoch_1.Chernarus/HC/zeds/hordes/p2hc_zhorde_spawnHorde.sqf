/*---------------------------------------------------------------------------
Zombie Horde Spawner 
	Called on horde startup / Horde death
---------------------------------------------------------------------------*/
private ["_hordeNum","_spawnPos","_waypoint","_pathVar","_pathWaypoints","_hordeType","_null"];
_hordeNum = _this select 0;
_hordeType = _this select 1;
_d = P2DZ_HC_HordeZedsDebug;

if (isNil '_hordeType') then { _hordeType = "z_soldier" };

if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:HordeSpawner:Spawning Horde! HordeNum: %1, HordePos: %2",(_hordeNum),(_hordeType)]);	};

//get path variable from horde number
_pathVar = P2DZ_HC_ZHorde_PathWaypointNames select (_hordeNum - 1);

//Get path waypoints
_pathWaypoints = call compile format["P2DZ_HC_ZHorde_PathWayp_%1",_pathVar];

//select first path waypoint as starting point
_waypoint = _pathWaypoints select 0;
//select first waypoint as default starting point if SafePos fails
_spawnPos = _waypoint;

//select spawnpos as somewhere near (75m) starting point
_spawnPos = [_waypoint,5,75,0,0,0,0] call BIS_fnc_findSafePos;

if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:HordeSpawner: HordeNum: %1, HordePath: %2, hordeSpawnPos: %3, firstWayPoint: %4",(_hordeNum),(_pathWaypoints),_spawnPos,_waypoint]);	};

//spawn zeds up to (max per horde - zombies within 200m that are part of horde)
for "_i" from 1 to (P2DZ_HC_ZHorde_ZombiesPerHorde) do {
	//SpawnPos,HordeNum,NextWaypoint,MinDistfromSpawnPos,MaxDistfromSpawnPos,ZedType
	[_spawnPos,_hordeNum,_waypoint,0,30,_hordeType] call P2DZ_HC_ZHorde_spawnZed;
};

uiSleep 5; //Give it a moment to spawn all the zeds in
if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:HordeSpawner: HordeNum: %1, Adding Horde Tracker",(_hordeNum)]);	};

_null = [_hordeNum,_hordeType] spawn P2DZ_HC_ZHorde_tracker;
if (_d) then {		diag_log(format["P2HC:HordeZedSpawns:HordeSpawner: HordeNum: %1, Adding Horde Waypoint Loop",(_hordeNum)]);	};

//call waypoint adder to loop to all zeds spawned in horde that don't have it (GORSY: how does this work on each zombie its not in the zombie loop)
call P2DZ_HC_ZHorde_waypointLoop;
