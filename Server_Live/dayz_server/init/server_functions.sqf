waituntil {!isnil "bis_fnc_init"};

BIS_MPF_remoteExecutionServer = {
	private["_unit","_uid","_log"];
	_uid = nil; _unit = nil; _log = false;
	if ((_this select 1) select 2 == "JIPrequest") then {
		[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
	};
	if ((_this select 1) select 2 != "say") then {
		if ((_this select 1) select 2 != "switchmove") then {
			_log = true; _unit = ((_this select 1) select 1);
			if (!isNil '_unit') then {
				if (typeName _unit == 'OBJECT') then {
					if (!isNull _unit) then {
						if (isPlayer _unit) then {
							_uid = getPlayerUID _unit;
							if (!isNil '_uid') then {
								if (typeName _uid == 'STRING') then {
									diag_log(format['%1: %2: (%4):(%3)',diag_tickTime,'REXEC',_this,_uid]); _log = false;
								};
							};
						};
					};
				};
			} else {
				_unit = ((_this select 1) select 0);
				if (!isNil '_unit') then {
					if (typeName _unit == 'OBJECT') then {
						if (!isNull _unit) then {
							if (isPlayer _unit) then {
								_uid = getPlayerUID _unit;
								if (!isNil '_uid') then {
									if (typeName _uid == 'STRING') then {
										diag_log(format['%1: %2: (%4):(%3)',diag_tickTime,'REXEC',_this,_uid]); _log = false;
									};
								};
							};
						};
					};
				};
			};
		};
	};
	if (_log) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'REXEC',_this]); _log = false;
	};
};

/* Logging Functions */
p2net_log2 =	compile preprocessFileLineNumbers 	"\z\addons\dayz_server\init\p2net_logFunction.sqf";
p2net_log1 =	compile preprocessFileLineNumbers 	"\z\addons\dayz_server\init\p2net_logFunction.sqf";

/*---------------------------------------------------------------------------
P2REXEC
---------------------------------------------------------------------------*/
//debugging line
if (p2d_startup) then {
	diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: server_functions','Starting p2re_init.sqf']);
};

[] execvm 											"\z\addons\dayz_server\p2re\p2re_init.sqf";

/*Regular Functions */
BIS_Effects_Burn =				{};
server_playerLogin =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerLogin.sqf";
server_playerSetup =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSetup.sqf";
server_onPlayerDisconnect = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_onPlayerDisconnect.sqf";
server_updateObject =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateObject.sqf";
server_playerDied =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDied.sqf";

//Using p2pn publish security number only (player created vehicles - given hashid by server, p2pn checked to verify legitimacy)
server_publishVeh = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle.sqf";
server_publishFullObject = 		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishFullObject.sqf";
server_publishObj = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishObject.sqf";
server_deleteObj = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_deleteObj.sqf";

//Using hashid system security (server spawn only, no hashid added by publishing)
server_swapObject =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_swapObject.sqf"; 
server_publishVeh2 = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle2.sqf";
server_publishVeh3 = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle3.sqf";

server_tradeObj = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_tradeObject.sqf";
server_traders = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_traders.sqf";
server_playerSync =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSync.sqf";
server_spawnEvents =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnEvent.sqf";
fnc_plyrHit   =					compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_plyrHit.sqf";
server_deaths = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDeaths.sqf";
server_maintainArea = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_maintainArea.sqf";

//custom base damage handler with anti-ramming/kamikazee damage
server_baseDamage = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\baseDamageHandler.sqf";

//by player2 just for stats logging
server_onPlayerConnect = 		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_onPlayerConnect.sqf";

//Loot tables for heli crash sites and care packages and infected camp and any other server events
fnc_specialLoot = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_specialLoot.sqf";

//deejayCrazy crazy safezone cleaner
fn_SZclean = 					compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_SZClean.sqf";

//remove extra gold bars (p2)
fnc_removeExtraBars = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_removeExtraBars.sqf";

//PVP death messages
player2_deathMessage =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\player2_deathMessage.sqf";

//deletes mags from full objects
server_overfullObject = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_overfullObject.sqf";

//player2 stats logger compiles
call compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_statsLogger.sqf";

//remove weapon compiles
call compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\player2_removeVehicleWeapons.sqf";


/* PVS/PVC - Skaronator */
server_sendToClient =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_sendToClient.sqf";

onPlayerConnected 			{[_uid,_name] call server_onPlayerConnect;};
onPlayerDisconnected 		{[_uid,_name] call server_onPlayerDisconnect;};

/*---------------------------------------------------------------------------
Sends notification to player if they are out of sync with server
---------------------------------------------------------------------------*/
p2_syncCheck = {
	private["_u","_o"];
	_u = nil; _m = "";
	_u = 	_this;
	if (isNil '_u') exitWith { };
	if (typeName _u != "OBJECT") exitWith { };
	if (isNull _u) exitWith { };
	if (!alive _u) exitWith { };
	_o = owner _u;
	if (isNil '_o') exitWith { };
	if (typeName _o != "SCALAR") exitWith { };
	P2DZE_guiMsg = ["<t color='#F05032'>WARNING!</t>",("<t size='1.2' color='#F05032'>You will be kicked in 30 seconds.</t><t size='0.95'> This is to prevent possible gear/character loss. Your character has lost sync with the hive. </t>"),"p2_notifs\img\zz.paa",30,420]; 
	P2DZE_systemChat = [2,("WARNING: You will be kicked in 30 seconds. This is to prevent possible gear/character loss. Your character has lost sync with the hive.")];
	_o publicVariableClient "P2DZE_systemChat"; 
	_o publicVariableClient "P2DZE_guiMsg";
}; 

/*---------------------------------------------------------------------------
AI Attacker Fix for Kill Messages
---------------------------------------------------------------------------*/
p2aiCheck = {
	private ["_in","_v","_a","_w","_d","_m"];
	_in = 		_this;
	if (isNil '_in') exitWith {false};
	if (typeName _in != typeName []) exitWith {false};
	_v = 		_in select 0;
	_a = 		_in select 1;
	if (isNil '_v') exitWith {false};
	if (isNil '_a') exitWith {false};
	if (isNull _v) exitWith {false}; 
	if (isNull _a) exitWith {false};
	if (isPlayer _a) exitWith {false};
	if ((_a isKindOf "zZombie_Base")) exitWith {false};
	if (!(_a isKindOf "Man")) exitWith {false};

	_w = [];	_d = 100;	_m = "";
	
	_w = weaponState _a;
	if (_w select 0 == "Throw") then 
	{
		_w = _w select 3;
	}
	else
	{
		_w = _w select 0;
	};

	_d = _v distance _a;

	_v setVariable["AttackedBy", _a, true];
	_v setVariable["AttackedByName", "A.I.", true];
	_v setVariable["AttackedByWeapon", _w, true];
	_v setVariable["AttackedFromDistance", _d, true];

	_m = format[
		"%1(_GLS_)%2(_GLS_)%3(_GLS_)%4(_GLS_)%5(_GLS_)%6(_GLS_)%7",
		(getPlayerUID _a),(getPlayerUID _v),_w,(mapGridPosition _a),(mapGridPosition _v),_d,GORSYSERVERNUMBER
	];

	_m call stats_hits;

	true
};

/*---------------------------------------------------------------------------
Vehicle Painting
---------------------------------------------------------------------------*/
"PVDZE_veh_Colour" addPublicVariableEventHandler {
	private["_position","_worldspace","_fuel","_key","_colour","_colour2","_object","_objectID","_PUID","_clrinit","_clrinit2","_pname","_name"];
	_object = ((_this select 1) select 0);
	_colour = ((_this select 1) select 1);
	_colour2 = ((_this select 1) select 2);
	
	_clrinit = format ["#(argb,8,8,3)color(%1)",_colour];
	_clrinit2 = format ["#(argb,8,8,3)color(%1)",_colour2];
	_object setVehicleInit "this setObjectTexture [0,"+str _clrinit+"];";
	_object setVehicleInit "this setObjectTexture [1,"+str _clrinit2+"];";
	
	_object setVariable["Colour",_colour,true];
	_object setVariable["Colour2",_colour2,true];
	
	_name = getText(configFile >> "cfgVehicles" >> (typeOf _object) >> "displayName");
	_PUID = ((_this select 1) select 3);
	_pname = ((_this select 1) select 4);

/*	diag_log format [
		"VEHICLE PAINT DEBUG: _colour (%5) _colour2 = (%6) _clrinit (%1) _clrinit2 (%2) form _clrinit (%3) form _clrinit2 (%4)",
		_clrinit,
		_clrinit2,
		str("this setObjectTexture [0,"+str _clrinit+"];"),
		str("this setObjectTexture [1,"+str _clrinit2+"];"),
		_colour,
		_colour2
	];
*/

//	diag_log format ["VEHICLE PAINT: Player %1 (%2) has painted a %3!",_pname,_PUID,_name];
	
	_position = getPosATL _object;
	
	_worldspace = [
		round(direction _object),
		_position,
		_colour,
		_colour2
	];
	
	_fuel = 0;
	_fuel = fuel _object;
	
	_objectID =	_object getVariable ["ObjectID","0"];
	
	_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];
	_key call server_hiveWrite;

	processInitCommands;
};
/*---------------------------------------------------------------------------
---------------------------------------------------------------------------*/

server_updateNearbyObjects = {
	private["_pos"];
	_pos = _this select 0;
	{
		[_x, "gear"] call server_updateObject;
	} count nearestObjects [_pos, dayz_updateObjects, 10];
};

server_handleZedSpawn = {
	private["_zed"];
	_zed = _this select 0;
	_zed enableSimulation false;
};

zombie_findOwner = {
	private["_unit"];
	_unit = _this select 0;
	#ifdef DZE_SERVER_DEBUG
	diag_log ("CLEANUP: DELETE UNCONTROLLED ZOMBIE: " + (typeOf _unit) + " OF: " + str(_unit) );
	#endif
	deleteVehicle _unit;
};

vehicle_handleInteract = {
	private["_object"];
	_object = _this select 0;
	needUpdate_objects = needUpdate_objects - [_object];
	[_object, "all"] call server_updateObject;
};

array_reduceSizeReverse = {
	private["_array","_count","_num","_newarray","_startnum","_index"];
	_array = _this select 0;
	_newarray = [];
	_count = _this select 1;
	_num = count _array;
	if (_num > _count) then {
		_startnum = _num - 1;
		_index = _count - 1;
		for "_i" from 0 to _index do {
			_newarray set [(_index-_i),_array select (_startnum - _i)];
		};
		_array = _newarray;
	}; 
	_array
};

array_reduceSize = {
	private ["_array1","_array","_count","_num"];
	_array1 = _this select 0;
	_array = _array1 - ["Hatchet_Swing","Machete_Swing","Fishing_Swing","sledge_swing","crowbar_swing","CSGAS"];
	_count = _this select 1;
	_num = count _array;
	if (_num > _count) then {
		_array resize _count;
	};
	_array
};

object_handleServerKilled = {
	private["_unit","_objectID","_objectUID","_killer"];
	_unit = _this select 0;
	_killer = _this select 1;
	
	_objectID =	 _unit getVariable ["ObjectID","0"];
	_objectUID = _unit getVariable ["ObjectUID","0"];
		
	[_objectID,_objectUID,_killer,p2dn + (random 10)] call server_deleteObj;
	
	_unit removeAllMPEventHandlers "MPKilled";
	_unit removeAllEventHandlers "Killed";
	_unit removeAllEventHandlers "HandleDamage";
	_unit removeAllEventHandlers "GetIn";
	_unit removeAllEventHandlers "GetOut";
};

check_publishobject = {
	private["_allowed","_object","_playername"];

	_charID =		_this select 0;
	_object = 		_this select 1;
	_worldspace = 	_this select 2;
	_class = 		_this select 3;
	_playerUID = 	_this select 4;
	_allowed = false;

	if (isNil '_charID' || isNil '_worldspace' || isNil '_class' || isNil '_playerUID') exitWith {
		if (!isNull _object) then {
			0 = _object spawn KK_fnc_logFailed;
		} else {
			_publishLog = format ["Failed Spawn: %1",_this];
			_publishLog call stats_badPublishLog;
		};
		false
	};


	if ((typeOf _object) in dayz_allowedObjects) then {
			_publishLog = format ["%1/%2 Spawned: %3/%4 @ %5",_playerUID, _charID,_class,_object,_worldspace];
			_publishLog call stats_publishLog; 

		    _object call {
			    _this setVariable [
			        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
			        "hash_id" callExtension format [
			            "%1:%2",
			            netId _this,
			            typeOf _this
			        ]
			    ];
			};

			_allowed = true;
	};

    _allowed
};

//event Handlers
eh_localCleanup = {
	private ["_object"];
	_object = _this select 0;
	_object addEventHandler ["local", {
		if(_this select 1) then {
			private["_type","_unit"];
			_unit = _this select 0;
			_type = typeOf _unit;
			 _myGroupUnit = group _unit;
 			_unit removeAllMPEventHandlers "mpkilled";
 			_unit removeAllMPEventHandlers "mphit";
 			_unit removeAllMPEventHandlers "mprespawn";
 			_unit removeAllEventHandlers "FiredNear";
			_unit removeAllEventHandlers "HandleDamage";
			_unit removeAllEventHandlers "Killed";
			_unit removeAllEventHandlers "Fired";
			_unit removeAllEventHandlers "GetOut";
			_unit removeAllEventHandlers "GetIn";
			_unit removeAllEventHandlers "Local";
			clearVehicleInit _unit;
			deleteVehicle _unit;
			if ((count (units _myGroupUnit) == 0) && (_myGroupUnit != grpNull)) then {
				deleteGroup _myGroupUnit;
			};
			//_unit = nil;
			// diag_log ("CLEANUP: DELETED A " + str(_type) );
		};
	}];
};

server_hiveWrite = {
	private["_data"];
	_data = "HiveExt" callExtension _this;
};

server_hiveReadWrite = {
	private["_key","_resultArray","_data"];
	_key = _this;
	_data = "HiveExt" callExtension _key;
	_resultArray = call compile format ["%1",_data];
	_resultArray
};

server_hiveReadWriteLarge = {
	private["_key","_resultArray","_data"];
	_key = _this;
	_data = "HiveExt" callExtension _key;
	_resultArray = call compile _data;
	_resultArray
};

server_checkIfTowed = {
	private ["_vehicle","_player","_attached"];
	if (DZE_HeliLift) then {
		_vehicle = 	_this select 0;
		_player = 	_this select 2;
		_attached = _vehicle getVariable["attached",false];
		if (typeName _attached == "OBJECT") then {
			_player action ["eject", _vehicle];
			detach _vehicle;
			_vehicle setVariable["attached",false,true];
			_attached setVariable["hasAttached",false,true];
		};
	};
};

server_characterSync = {
	private ["_characterID","_playerPos","_playerGear","_playerBackp","_medical","_currentState","_currentModel","_key"];
	_characterID = 	_this select 0;	
	_playerPos =	_this select 1;
	_playerGear =	_this select 2;
	_playerBackp =	_this select 3;
	_medical = 		_this select 4;
	_currentState =	_this select 5;
	_currentModel = _this select 6;
	
	_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,false,false,0,0,0,0,_currentState,0,0,_currentModel,0];
	_key call server_hiveWrite;
//	diag_log("Ran character server_characterSync! (has no gold var, is it used? tell me if you see this message!");
};

if(isnil "dayz_MapArea") then {
	dayz_MapArea = 10000;
};
if(isnil "DynamicVehicleArea") then {
	DynamicVehicleArea = dayz_MapArea / 2;
};

// Get all buildings && roads only once TODO: set variables to nil after done if nessicary 
MarkerPosition = getMarkerPos "center";
RoadList = MarkerPosition nearRoads DynamicVehicleArea;

// Very taxing !!! but only on first startup
BuildingList = [];
{

	if (isClass (missionConfigFile >> "CfgBuildingLoot" >> (typeOf _x))) then
	{
			BuildingList set [count BuildingList,_x];
	};
	
} count (MarkerPosition nearObjects ["building",DynamicVehicleArea]);

spawn_vehicles = {
	private ["_random","_lastIndex","_weights","_index","_vehicle","_velimit","_qty","_isAir","_isShip","_position","_dir","_istoomany","_veh","_objPosition","_marker","_iClass","_itemTypes","_cntWeights","_itemType","_num","_allCfgLoots"];
	
	if (!isDedicated) exitWith { }; //Be sure the run this

	while {count AllowedVehiclesList > 0} do {
		// BIS_fnc_selectRandom replaced because the index may be needed to remove the element
		_index = floor random count AllowedVehiclesList;
		_random = AllowedVehiclesList select _index;

		_vehicle = _random select 0;
		_velimit = _random select 1;

		_qty = {_x == _vehicle} count serverVehicleCounter;

		// If under limit allow to proceed
		if (_qty <= _velimit) exitWith {};

		// vehicle limit reached, remove vehicle from list
		// since elements cannot be removed from an array, overwrite it with the last element && cut the last element of (as long as order is not important)
		_lastIndex = (count AllowedVehiclesList) - 1;
		if (_lastIndex != _index) then {
			AllowedVehiclesList set [_index, AllowedVehiclesList select _lastIndex];
		};
		AllowedVehiclesList resize _lastIndex;
	};

	if (count AllowedVehiclesList == 0) then {
		//diag_log("DEBUG: unable to find suitable vehicle to spawn");
	} else {

		// add vehicle to counter for next pass
		serverVehicleCounter set [count serverVehicleCounter,_vehicle];
	
		// Find Vehicle Type to better control spawns
		_isAir = _vehicle isKindOf "Air";
		_isShip = _vehicle isKindOf "Ship";
	
		if(_isShip || _isAir) then {
			if(_isShip) then {
				// Spawn anywhere on coast on water
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [MarkerPosition,0,DynamicVehicleArea,10,1,2000,1] call BIS_fnc_findSafePos;
				//diag_log("DEBUG: spawning boat near coast " + str(_position));
			} else {
				// Spawn air anywhere that is flat
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [MarkerPosition,0,DynamicVehicleArea,10,0,2000,0] call BIS_fnc_findSafePos;
				//diag_log("DEBUG: spawning air anywhere flat " + str(_position));
			};
		
		
		} else {
			// Spawn around buildings && 50% near roads
			if((random 1) > 0.5) then {
			
				waitUntil{!isNil "BIS_fnc_selectRandom"};
				_position = RoadList call BIS_fnc_selectRandom;
			
				_position = _position modelToWorld [0,0,0];
			
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [_position,0,10,10,0,2000,0] call BIS_fnc_findSafePos;
			
				//diag_log("DEBUG: spawning near road " + str(_position));
			
			} else {
			
				waitUntil{!isNil "BIS_fnc_selectRandom"};
				_position = BuildingList call BIS_fnc_selectRandom;
			
				_position = _position modelToWorld [0,0,0];
			
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [_position,0,40,5,0,2000,0] call BIS_fnc_findSafePos;
			
				//diag_log("DEBUG: spawning around buildings " + str(_position));
		
			};
		};
		// only proceed if two params otherwise BIS_fnc_findSafePos failed && may spawn in air
		if ((count _position) == 2) then { 
	
			_dir = round(random 180);
		
			_istoomany = _position nearObjects ["AllVehicles",50];
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many vehicles at " + str(_position)); };
		
			//place vehicle 
			_veh = createVehicle [_vehicle, _position, [], 0, "CAN_COLLIDE"];
			_veh setdir _dir;
			_veh setpos _position;

			_veh call {
			    _this setVariable [
			        (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])),
			        "hash_id" callExtension format [
			            "%1:%2",
			            netId _this,
			            typeOf _this
			        ]
			    ];
			};
		
			// Get position with ground
			_objPosition = getPosATL _veh;
		
			clearWeaponCargoGlobal  _veh;
			clearMagazineCargoGlobal  _veh;
			_veh setVehicleAmmo DZE_vehicleAmmo;

			// Add 0-3 loots to vehicle using random cfgloots 
			_num = floor(random 4);
			_allCfgLoots = ["trash","civilian","food","generic","medical","military","policeman","hunter","worker","clothes","militaryclothes","specialclothes","trash"];
			
			for "_x" from 1 to _num do {
				_iClass = _allCfgLoots call BIS_fnc_selectRandom;

				_itemTypes = [];
				{
					_itemTypes set[count _itemTypes, _x select 0]
				} count getArray(missionConfigFile >> "cfgLoot" >> _iClass);

				_index = dayz_CLBase find _iClass;
				_weights = dayz_CLChances select _index;
				_cntWeights = count _weights;
				
				_index = floor(random _cntWeights);
				_index = _weights select _index;
				_itemType = _itemTypes select _index;
				_veh addMagazineCargoGlobal [_itemType,1];
				//diag_log("DEBUG: spawed loot inside vehicle " + str(_itemType));
			};

			[_veh,[_dir,_objPosition],_vehicle,true,"0"] call server_publishVeh;
		};
	};
};

spawn_ammosupply = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];
	if (isDedicated) then {
		_WreckList = ["Supply_Crate_DZE"];
		waitUntil{!isNil "BIS_fnc_selectRandom"};
		_position = RoadList call BIS_fnc_selectRandom;
		_position = _position modelToWorld [0,0,0];
		waitUntil{!isNil "BIS_fnc_findSafePos"};
		_position = [_position,5,20,5,0,2000,0] call BIS_fnc_findSafePos;
		if ((count _position) == 2) then {

			_istoomany = _position nearObjects ["All",5];
			
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many at " + str(_position)); };
			
			_spawnveh = _WreckList call BIS_fnc_selectRandom;
		
			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];

			_veh call {
			    _this setVariable [
			        (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])),
			        "hash_id" callExtension format [
			            "%1:%2",
			            netId _this,
			            typeOf _this
			        ]
			    ];
			};	

			_veh enableSimulation false;
			_veh setDir round(random 360);
			_veh setpos _position;
			_veh setVariable ["ObjectID","1",true];
		};
	};
};

DZE_LocalRoadBlocks = [];

spawn_roadblocks = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];
	_WreckList = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];
	
	waitUntil{!isNil "BIS_fnc_selectRandom"};
	if (isDedicated) then {
	
		_position = RoadList call BIS_fnc_selectRandom;
		
		_position = _position modelToWorld [0,0,0];
		
		waitUntil{!isNil "BIS_fnc_findSafePos"};
		_position = [_position,0,10,5,0,2000,0] call BIS_fnc_findSafePos;
		
		if ((count _position) == 2) then {
			// Get position with ground
			
			_istoomany = _position nearObjects ["All",5];
		
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many at " + str(_position)); };
			
			waitUntil{!isNil "BIS_fnc_selectRandom"};
			_spawnveh = _WreckList call BIS_fnc_selectRandom;

			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;

			_veh call {
			    _this setVariable [
			        (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])),
			        "hash_id" callExtension format [
			            "%1:%2",
			            netId _this,
			            typeOf _this
			        ]
			    ];
			};	

			_veh setDir round(random 360); // Randomize placement a bit
			_veh setpos _position;

			_veh setVariable ["ObjectID","1",true];
		};
	
	};
	
};

spawn_mineveins = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_positions"];

	if (isDedicated) then {
		
		_position = [getMarkerPos "center",0,(HeliCrashArea*0.75),10,0,2000,0] call BIS_fnc_findSafePos;

		if ((count _position) == 2) then {
			
			_positions = selectBestPlaces [_position, 500, "(1 + forest) * (1 + hills) * (1 - houses) * (1 - sea)", 10, 5];

			_position = (_positions call BIS_fnc_selectRandom) select 0;

			// Get position with ground
			_istoomany = _position nearObjects ["All",10];
		
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many objects at " + str(_position)); };

			if(isOnRoad _position) exitWith { diag_log("DEBUG VEIN: on road " + str(_position)); };
			
			_spawnveh = ["Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Silver_Vein_DZE","Silver_Vein_DZE","Silver_Vein_DZE","Gold_Vein_DZE","Gold_Vein_DZE"] call BIS_fnc_selectRandom;

			//diag_log("DEBUG: Spawning a crashed " + _spawnveh + " with " + _spawnloot + " at " + str(_position));
			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;

			_veh call {
			    _this setVariable [
			        (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])),
			        "hash_id" callExtension format [
			            "%1:%2",
			            netId _this,
			            typeOf _this
			        ]
			    ];
			};

			// Randomize placement a bit
			_veh setDir round(random 360);
			_veh setpos _position;

			_veh setVariable ["ObjectID","1",true];

		
		};
	};
};

if(isnil "DynamicVehicleDamageLow") then {
	DynamicVehicleDamageLow = 0;
};
if(isnil "DynamicVehicleDamageHigh") then {
	DynamicVehicleDamageHigh = 100;
};

if(isnil "DynamicVehicleFuelLow") then {
	DynamicVehicleFuelLow = 0;
};
if(isnil "DynamicVehicleFuelHigh") then {
	DynamicVehicleFuelHigh = 100;
};

if(isnil "DZE_DiagFpsSlow") then {
	DZE_DiagFpsSlow = false;
};
if(isnil "DZE_DiagFpsFast") then {
	DZE_DiagFpsFast = false;
};
if(isnil "DZE_DiagVerbose") then {
	DZE_DiagVerbose = false;
};

dze_diag_fps = {
	if(DZE_DiagVerbose) then {
		diag_log format["DEBUG FPS : %1 OBJECTS: %2 : PLAYERS: %3", diag_fps,(count (allMissionObjects "")),(playersNumber west)];
	} else {
		diag_log format["DEBUG FPS : %1", diag_fps];
	};
};

// Damage generator function
generate_new_damage = {
	private ["_damage"];
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	_damage;
};

// Damage generator fuction
generate_exp_damage = {
	private ["_damage"];
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	
	// limit this to 85% since vehicle would blow up otherwise.
	//if(_damage >= 0.85) then {
	//	_damage = 0.85;
	//};
	_damage;
};

server_getDiff =	{
	private["_variable","_object","_vNew","_vOld","_result"];
	_variable = _this select 0;
	_object = 	_this select 1;
	_vNew = 	_object getVariable[_variable,0];
	_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
	_result = 	0;
	if (_vNew < _vOld) then {
		//JIP issues
		_vNew = _vNew + _vOld;
		_object getVariable[(_variable + "_CHK"),_vNew];
	} else {
		_result = _vNew - _vOld;
		_object setVariable[(_variable + "_CHK"),_vNew];
	};
	_result
};

server_getDiff2 =	{
	private["_variable","_object","_vNew","_vOld","_result"];
	_variable = _this select 0;
	_object = 	_this select 1;
	_vNew = 	_object getVariable[_variable,0];
	_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
	_result = _vNew - _vOld;
	_object setVariable[(_variable + "_CHK"),_vNew];
	_result
};

dayz_objectUID = {
	private["_position","_dir","_key","_object"];
	_object = _this;
	_position = getPosATL _object;
	_dir = direction _object;
	_key = [_dir,_position] call dayz_objectUID2;
    _key
};

dayz_objectUID2 = {
	private["_position","_dir","_key"];
	_dir = _this select 0;
	_key = "";
	_position = _this select 1;
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_key = _key + str(round(_x));
	} count _position;
	_key = _key + str(round(_dir));
	_key
};

dayz_objectUID3 = {
	private["_position","_dir","_key"];
	_dir = _this select 0;
	_key = "";
	_position = _this select 1;
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_key = _key + str(round(_x));
	} count _position;
	_key = _key + str(round(_dir + time));
	_key
};

dayz_recordLogin = {
	private["_key"];
	_key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
	_key call server_hiveWrite;
};

dayz_perform_purge = {
	if(!isNull(_this)) then {
		_group = group _this;
		_this removeAllMPEventHandlers "mpkilled";
		_this removeAllMPEventHandlers "mphit";
		_this removeAllMPEventHandlers "mprespawn";
		_this removeAllEventHandlers "FiredNear";
		_this removeAllEventHandlers "HandleDamage";
		_this removeAllEventHandlers "Killed";
		_this removeAllEventHandlers "Fired";
		_this removeAllEventHandlers "GetOut";
		_this removeAllEventHandlers "GetIn";
		_this removeAllEventHandlers "Local";
		clearVehicleInit _this;
		deleteVehicle _this;
		if ((count (units _group) == 0) && (_group != grpNull)) then {
			deleteGroup _group;
		};
	};
};

dayz_perform_purge_player = {

	private ["_zGold","_countr","_backpack","_backpackType","_backpackWpn","_backpackMag","_objWpnTypes","_objWpnQty","_location","_dir","_holder","_weapons","_magazines"];
    //diag_log ("Purging player: " + str(_this));	

	if(!isNull(_this)) then {

		//get object gold (if isnil we add it to _holder later)
		_zGold = nil;
		_zGold = _this getVariable ["ZombZGold", nil];

		_location = getPosATL _this;
		_dir = getDir _this;

		_holder = createVehicle ["GraveDZE", _location, [], 0, "CAN_COLLIDE"];

		_holder call {
		    _this setVariable [
		        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
		        "hash_id" callExtension format [
		            "%1:%2",
		            netId _this,
		            typeOf _this
		        ]
		    ];
		};

		_holder setDir _dir;
		_holder setPosATL _location;

		_holder enableSimulation false;

		_weapons = weapons _this;
		_magazines = magazines _this;

		// find backpack
		if(!(isNull unitBackpack _this)) then {
			_backpack = unitBackpack _this;
			_backpackType = typeOf _backpack;
			_backpackWpn = getWeaponCargo _backpack;
			_backpackMag = getMagazineCargo _backpack;

			_holder addBackpackCargoGlobal [_backpackType,1];

			// add items from backpack 
			_objWpnTypes = _backpackWpn select 0;
			_objWpnQty = _backpackWpn select 1;
			_countr = 0;
			{
				_holder addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} count _objWpnTypes;

			// add backpack magazine items
			_objWpnTypes = _backpackMag select 0;
			_objWpnQty = _backpackMag select 1;
			_countr = 0;
			{
				_holder addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} count _objWpnTypes;
		};
	};

	// add weapons
	{ 
		_holder addWeaponCargoGlobal [_x, 1];
	} count _weapons;

	// add mags
	{ 
		_holder addMagazineCargoGlobal [_x, 1];
	} count _magazines;

	//add gold to grave
	if (!isNil '_zGold') then {
		_holder setVariable ["ZombZGold", _zGold, true];
	};

	//purge object
	_group = group _this;
	_this removeAllMPEventHandlers "mpkilled";
	_this removeAllMPEventHandlers "mphit";
	_this removeAllMPEventHandlers "mprespawn";
	_this removeAllEventHandlers "FiredNear";
	_this removeAllEventHandlers "HandleDamage";
	_this removeAllEventHandlers "Killed";
	_this removeAllEventHandlers "Fired";
	_this removeAllEventHandlers "GetOut";
	_this removeAllEventHandlers "GetIn";
	_this removeAllEventHandlers "Local";
	clearVehicleInit _this;
	deleteVehicle _this;
	if ((count (units _group) == 0) && (_group != grpNull)) then {
		deleteGroup _group;
	};
	//  _this = nil;
};


dayz_removePlayerOnDisconnect = {
	if(!isNull(_this)) then {
		_group = group _this;
		_this removeAllMPEventHandlers "mphit";
		deleteVehicle _this;
		deleteGroup (group _this);
	};
};

server_timeSync = {
	//Send request
	private ["_hour","_minute","_date","_key","_result","_outcome"];
    //_key = "CHILD:307:";
	//_result = _key call server_hiveReadWrite;
	//_outcome = _result select 0;
	//if(_outcome == "PASS") then {
		//_date = _result select 1; 
		
		//if(dayz_fullMoonNights) then {
		//	_hour = _date select 3;
		//	_minute = _date select 4;
			//Force full moon nights
			_date = [2013,8,3,11,0];
		//};

		setDate _date;
		PVDZE_plr_SetDate = _date;
		//publicVariable "PVDZE_plr_SetDate";
		diag_log ("TIME SYNC: Server Time set to " + str(_date));	
	//};
};

// must spawn these 
server_spawncleanDead = {
	private ["_deathTime","_delQtyZ","_delQtyP","_qty","_allDead"];
	_allDead = allDead;
	_delQtyZ = 0;
	_delQtyP = 0;
	{
		if (local _x) then {
			if (_x isKindOf "zZombie_Base") then
			{
				_x call dayz_perform_purge;
				uiSleep 0.05;
				_delQtyZ = _delQtyZ + 1;
			} else {
				if (_x isKindOf "CAManBase") then {
					_deathTime = _x getVariable ["processedDeath", diag_tickTime];
					if (diag_tickTime - _deathTime > 1800) then {
						_x call dayz_perform_purge_player;
						uiSleep 0.025;
						_delQtyP = _delQtyP + 1;
					};
				};
			};
		};
		uiSleep 0.025;
	} count _allDead;
	if (_delQtyZ > 0 || _delQtyP > 0) then {
		_qty = count _allDead;
		diag_log (format["CLEANUP: Deleted %1 players && %2 zombies out of %3 dead",_delQtyP,_delQtyZ,_qty]);
	};
};
server_cleanupGroups = {
	if (DZE_DYN_AntiStuck3rd > 3) then { DZE_DYN_GroupCleanup = nil; DZE_DYN_AntiStuck3rd = 0; };
	if(!isNil "DZE_DYN_GroupCleanup") exitWith {  DZE_DYN_AntiStuck3rd = DZE_DYN_AntiStuck3rd + 1;};
	DZE_DYN_GroupCleanup = true;
	{
		if ((count (units _x) == 0) && (_x != grpNull)) then {
			deleteGroup _x;
		};
		uiSleep 0.001;
	} count allGroups;
	DZE_DYN_GroupCleanup = nil;
};


server_spawnCleanFire = {
	private ["_delQtyFP","_qty","_missionFires"];
	_missionFires = allMissionObjects "Land_Fire_DZ";
	_delQtyFP = 0;
	{
		if (local _x) then {
			deleteVehicle _x;
			uiSleep 0.025;
			_delQtyFP = _delQtyFP + 1;
		};
		uiSleep 0.001;
	} count _missionFires;
	if (_delQtyFP > 0) then {
		_qty = count _missionFires;
		diag_log (format["CLEANUP: Deleted %1 fireplaces out of %2",_delQtyFP,_qty]);
	};
};
server_spawnCleanLoot = {
	private ["_created","_delQty","_nearby","_age","_keep","_qty","_missionObjs","_dateNow"];
	if (DZE_DYN_AntiStuck > 3) then { DZE_DYN_cleanLoot = nil; DZE_DYN_AntiStuck = 0; };
	if(!isNil "DZE_DYN_cleanLoot") exitWith {  DZE_DYN_AntiStuck = DZE_DYN_AntiStuck + 1;};
	DZE_DYN_cleanLoot = true;

	_missionObjs =  allMissionObjects "ReammoBox";
	_delQty = 0;
	_dateNow = (DateToNumber date);
	{
		if (!isNull _x) then {
			_keep = _x getVariable["permaLoot", false];
			if (!_keep) then {
				_created = _x getVariable["created", -0.1];
				if (_created == -0.1) then{
					_x setVariable["created", _dateNow, false];
					_created = _dateNow;
				}
				else {
					_age = (_dateNow - _created) * 525948;
					if (_age > 20) then{
						_nearby = { (isPlayer _x) && (alive _x) } count(_x nearEntities[["CAManBase", "AllVehicles"], 130]);
						if (_nearby == 0) then{
							deleteVehicle _x;
							uiSleep 0.025;
							_delQty = _delQty + 1;
						};
					};
				};
			};
		};
		uiSleep 0.001;
	} count _missionObjs;
	if (_delQty > 0) then {
		_qty = count _missionObjs;
		diag_log (format["CLEANUP: Deleted %1 Loot Piles out of %2",_delQty,_qty]);
	};
	DZE_DYN_cleanLoot = nil;
};

server_spawnCleanAnimals = {
	private ["_pos","_delQtyAnimal","_qty","_missonAnimals","_nearby"];
	_missonAnimals = entities "CAAnimalBase";
	_delQtyAnimal = 0;
	{
		if (local _x) then {
			_x call dayz_perform_purge;
			uiSleep 0.05;
			_delQtyAnimal = _delQtyAnimal + 1;
		} else {
			if (!alive _x) then {
				_pos = getPosATL _x;
				if (count _pos > 0) then {
					_nearby = {(isPlayer _x) && (alive _x)} count (_pos nearEntities [["CAManBase","AllVehicles"], 130]);
					if (_nearby==0) then {
						_x call dayz_perform_purge;
						uiSleep 0.05;
						_delQtyAnimal = _delQtyAnimal + 1;
					};
				};
			};
		};
		uiSleep 0.001;
	} count _missonAnimals;
	if (_delQtyAnimal > 0) then {
		_qty = count _missonAnimals;
		diag_log (format["CLEANUP: Deleted %1 Animals out of %2",_delQtyAnimal,_qty]);
	};
};

server_logUnlockLockEvent = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_logUnlockLockEvent.sqf";

[] execVM 											"\z\addons\dayz_server\system\antihack_functions.sqf";
[] execvm 											"\z\addons\dayz_server\init\deploy_functions.sqf";
[] execvm 											"\z\addons\dayz_server\init\goldEventHandlers.sqf";
