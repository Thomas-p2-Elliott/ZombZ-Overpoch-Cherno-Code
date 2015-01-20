private ["_playerPos", "_minDist", "_maxDist", "_unitTypes", "_loot", "_array", "_agent", "_method", "_radius", "_type", "_position", "_d", "_myDest", "_newDest", "_rnd", "_lootType", "_index", "_weights", "_loot_count"];
_d = 	P2DZ_HC_ExtraZedsDebug;																		//debugging

//if (_d) then { diag_log(format["P2HC:ZedSpawns: player2_spawnZedsHC: Input: %1",	_this]); };

//Exit if max zombie count has been reached
if (P2DZ_HC_currentGlobalZeds > P2DZ_HC_globalMaxZeds) exitWith {
	if (_d) then {
		diag_log(format["P2HC:ZedSpawns: player2_spawnZedsHC: Exit: P2DZ_HC_currentGlobalZeds (%1) > (%2) P2DZ_HC_globalMaxZeds",P2DZ_HC_currentGlobalZeds,P2DZ_HC_globalMaxZeds]);
	};
};

//Get input
_playerPos = 		_this select 0; 																//Input: Player Object
_minDist =			_this select 1;																	//Input: Min Dist from Player
_maxDist =			_this select 2;																	//Input: Max Dist from Player

_unitTypes = []+ getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass"); 	//Get all zed types
_agent = 		objNull;																			//Init agent as null object
_method = 		"CAN_COLLIDE";																		//Spawn method with no collision detection
_radius = 		2; 																					//Radius to spawn zeds within spawn pos
_loot = 		"";																					//Init loot as empty string
_array = 		[];																					//Init loot array as empty
_type = 		_unitTypes call BIS_fnc_selectRandom;												//Pick random zed type
_position = 	[_playerPos,_minDist,_maxDist,_radius,0,0,0] call BIS_fnc_findSafePos;				//Pick random spawn position
_agent = 		createAgent [_type, _position, [], _radius, _method];								//Create the zombie
_agent 			removeAllEventHandlers "local";														//Remove its handlers for local and add our own (below)
_id = 			_agent addEventHandler ["local", { diag_log "Locality Event"; if(_this select 1) then {[(position (_this select 0)),(_this select 0),true] execFSM ("" + (P2HC_Path) + "zeds\zombie_agentHC.fsm") };}];
_agent setDir 	round(random 180);																	//Make zed face random direction instead of N

//30% Chance of crawler zombies
if (random 1 > 0.7) then {
	_agent setUnitPos "Middle"; //Make zed a crawler
};

//If agent is null and failed to create, exit with error code
if (isNull _agent) exitWith {	if (_d) then { diag_log ("P2HC:ZedSpawns: player2_spawnZedsHC: FATAL ERROR: _agent is Null!"); }; };

_myDest = getPosATL _agent; 			 															//get agents position
_newDest = getPosATL _agent; 			 															//get agents position
_agent setVariable ["myDest",_myDest]; 																//tell agent where it is 		(used by fsm)
_agent setVariable ["newDest",_newDest]; 															//tell agent to go to itself 	(used by fsm)

//Add some loot 
_loot = "";
_array = [];
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

_id = [_position,_agent] execFSM ("" + (P2HC_Path) + "zeds\zombie_agentHC.fsm");										//Start behavior (fsm ai)

if (_d) then { diag_log(format["P2HC:ZedSpawns: player2_spawnZedsHC: ZedSpawned, _agent: %1",_agent]); };

_agent call player2_zedAntiStuck;

/*---------------------------------------------------------------------------
www.ZombZ.net - Player2
---------------------------------------------------------------------------*/