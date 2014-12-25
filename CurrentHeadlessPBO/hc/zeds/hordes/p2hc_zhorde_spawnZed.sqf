/*---------------------------------------------------------------------------
Horde Zed Spawner
---------------------------------------------------------------------------*/
private ["_null","_spawnPos", "_hordeNum", "_minDist", "_zedType", "_maxDist", "_unitTypes", "_loot", "_array", "_agent", "_method", "_radius", "_type", "_position", "_d", "_waypoint", "_lootType", "_index", "_weights", "_loot_count"];
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
_id = 			_agent addEventHandler ["local", { diag_log "Locality Event"; if(_this select 1) then {[(position (_this select 0)),(_this select 0),true] execFSM "zombzHC\addons\zeds\hordes\zombieHorde_agentHC.fsm" };}];
_agent setDir 	round(random 180);																	//Make zed face random direction instead of N

//set them to stand
_agent setUnitPos "UP";

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

_id = [_position,_agent] execFSM "zombzHC\addons\zeds\hordes\zombieHorde_agentHC.fsm";	//Start behavior (fsm ai)


//if (_d) then { diag_log(format["P2HC:HordeZedSpawns: P2DZ_HC_ZHorde_spawnZed: ZedSpawned, id: %1",_id]); };

_agent call player2_zedAntiStuck;

/*---------------------------------------------------------------------------
www.ZombZ.net - Player2
---------------------------------------------------------------------------*/
