/*---------------------------------------------------------------------------
Zombie Horde Respawner

Triggered by major waypoints;
Deletes & respawns any zombies that didn't make it within 200m of this waypoint
at the moment of it being triggered (aka by first zombie to make it there)
---------------------------------------------------------------------------*/
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
