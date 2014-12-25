private ["_d", "_position", "_doLoiter", "_unitTypes", "_agent", "_isNoone", "_type", "_radius", "_method", "_nearByPlayer", "_myDest", "_newDest", "_loot", "_array", "_rnd", "_lootType", "_index", "_weights", "_loot_count"];_d = 	P2DZ_HC_debug;
if (_d) then {
	//diag_log(format["P2HC:ZedSpawns: zombie_generateHC: Input: %1",	_this]);
};

//Input
_position = 	_this select 0;
_doLoiter = 	_this select 1;
_unitTypes = 	_this select 2;
_agent = 	objNull;	//Var init
_loot = "";	//loot var init
_array = []; //loot var init
_isNoone = 	{isPlayer _x} count (_position nearEntities [["AllVehicles","CAManBase"],10]) == 0; //Check for nearby players (10m)

//Exit if a player is nearby
if (!_isNoone) exitWith {
	if (_d) then {
		diag_log(format["P2HC:ZedSpawns: zombie_generateHC: Exit: Player Nearby (10m)"]);
	};
};

//Exit if max zombie count has been reached
if (P2DZ_HC_currentGlobalZeds > P2DZ_HC_globalMaxZeds) exitWith {
	if (_d) then {
		diag_log(format["P2HC:ZedSpawns: zombie_generateHC: Exit: P2DZ_HC_currentGlobalZeds (%1) > (%2) P2DZ_HC_globalMaxZeds",P2DZ_HC_currentGlobalZeds,P2DZ_HC_globalMaxZeds]);
	};
};

//If no unit types given via input
if (count _unitTypes == 0) then {
	_unitTypes = 	[]+ getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass"); 	//Set unit types to entire class
};

_type = _unitTypes call BIS_fnc_selectRandom; 					//Pick random zed type
_radius = 0; 													//Set spawn radius to 0
_method = "CAN_COLLIDE"; 										//Set can collide spawn method (means zed can spawn inside-other objects aka no-collision checks)

//If loitering zombies set radius to 40 and method to none
if (_doLoiter) then {
	_radius = 40;												//Zeds will spawn up to 40m from where we designate
	_method = "NONE";											//Zeds collision check prior to spawning
};

if (_d) then { diag_log ("P2HC:ZedSpawns: zombie_generateHC: SpawnedZed: " + str([_type, _position, [], _radius, _method])); };
_agent = createAgent [_type, _position, [], _radius, _method]; 	//Crete Zombie
_agent removeAllEventHandlers "local";  						//Remove local handler and Add our own local handler (below)
_agent addEventHandler ["local", { diag_log "Locality Event"; if(_this select 1) then {[(position (_this select 0)),(_this select 0),true] execFSM "zombzHC\addonszeds\zombie_agentHC.fsm" };}];
PVDZE_zed_Spawn = [_agent];										//Set up var to send to server
publicVariableServer "PVDZE_zed_Spawn";							//Tell server we spawned a zed, sending zed obj

//If doLoiter enabled
if (_doLoiter) then {
	_agent setDir round(random 180); 							//Face zombie random direction
	_agent setPosATL _position; 								//Reset zombie pos
	_agent setvelocity [0, 0, 1]; 								//Push zombie forward
} else {
	//If doLoiter disabled
	_agent setVariable ["doLoiter",false,true]; 				//set doLoiter on zed (used by fsm)
};

_position = getPosATL _agent;									//get zed position
_nearByPlayer = ({isPlayer _x} count (_position nearEntities [["AllVehicles","CAManBase"],10]) > 0); //boolean, if nearby player count > 0

//if player within 10m of freshly spawned zed then delete
if (_nearByPlayer) exitWith {
	deleteVehicle _agent;										//delete zed
	if (_d) then { diag_log ("P2HC:ZedSpawns: zombie_generateHC: Zed Deleted (PlayerNear): " + str([_type, _position])); };
};

//30% Chance 
if (random 1 > 0.7) then {
	_agent setUnitPos "Middle"; 								//Make zed a crawler
};

_myDest = getPosATL _agent; 			 						//get agents position
_newDest = getPosATL _agent; 									//get agents position
_agent setVariable ["myDest",_myDest]; 	 						//tell agent where it is 		(used by fsm)
_agent setVariable ["newDest",_newDest]; 						//tell agent to go to itself 	(used by fsm)

//Add some loot
_loot = "";
_array = [];
_rnd = random 1;
if (_rnd < 0.2) then {
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
};

//Start behavior
_id = [_position,_agent] execFSM "zombzHC\addonszeds\zombie_agentHC.fsm";

if (P2DZ_HC_ExtraZedsDebug) then {
	diag_log(format["P2HC:ZedSpawns: zombie_generateHC: SpawnedZed, id: %1",_id]);
};

/*---------------------------------------------------------------------------
www.ZombZ.net - Player2
---------------------------------------------------------------------------*/