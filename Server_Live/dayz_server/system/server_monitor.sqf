private ["_sa","_goldArray","_gold","_nul","_result","_pos","_wsDone","_dir","_isOK","_countr","_objWpnTypes","_objWpnQty","_dam","_selection","_totalvehicles","_object","_idKey","_type","_ownerID","_worldspace","_inventory","_hitPoints","_fuel","_damage","_key","_vehLimit","_hiveResponse","_objectCount","_codeCount","_data","_status","_val","_traderid","_retrader","_traderData","_id","_lockable","_debugMarkerPosition","_vehicle_0","_bQty","_vQty","_BuildingQueue","_objectQueue","_superkey","_shutdown","_res","_hiveLoaded","_ownerPUID","_contents","_itemCount","_goldBarCount","_itemType","_addBackCount"];

dayz_versionNo = 		getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");

_hiveLoaded = false;

waitUntil{initialized}; //means all the functions are now defined

diag_log "HIVE: Starting";

waituntil{isNil "sm_done"}; // prevent server_monitor be called twice (bug during login of the first player)
	
// Custom Configs
if(isnil "MaxVehicleLimit") then {
	MaxVehicleLimit = 600;
};

if(isnil "MaxDynamicDebris") then {
	MaxDynamicDebris = 50;
};
if(isnil "MaxAmmoBoxes") then {
	MaxAmmoBoxes = 0;
};
if(isnil "MaxMineVeins") then {
	MaxMineVeins = 0;
};
// Custon Configs End

if (isServer && isNil "sm_done") then {

	serverVehicleCounter = [];
	_hiveResponse = [];

	for "_i" from 1 to 5 do {
		diag_log "HIVE: trying to get objects:";
		_key = format["CHILD:302:%1:", dayZ_instance];
		_hiveResponse = _key call server_hiveReadWrite;  
		if ((((isnil "_hiveResponse") || {(typeName _hiveResponse != "ARRAY")}) || {((typeName (_hiveResponse select 1)) != "SCALAR")})) then {
			if ((_hiveResponse select 1) == "Instance already initialized") then {
				_superkey = profileNamespace getVariable "SUPERKEY";
				_shutdown = format["CHILD:400:%1:", _superkey];
				_res = _shutdown call server_hiveReadWrite;
				diag_log ("HIVE: attempt to kill.. HiveExt response:"+str(_res));
			} else {
				diag_log ("HIVE: connection problem... HiveExt response:"+str(_hiveResponse));
			};
			_hiveResponse = ["",0];
		} 
		else {
			if (P2DZE_serverStreamObjsEnabled) then {
				diag_log ("HIVE: found "+str(_hiveResponse select 1)+" objects" );
				_i = 99; // break
			};
		};
	};
	
	_BuildingQueue = [];
	_objectQueue = [];
	
	if ((_hiveResponse select 0) == "ObjectStreamStart") then {
	
		// save superkey
		profileNamespace setVariable ["SUPERKEY",(_hiveResponse select 2)];
		
		_hiveLoaded = true;
	
		diag_log ("HIVE: Commence Object Streaming...");
		_key = format["CHILD:302:%1:", dayZ_instance];
		_objectCount = _hiveResponse select 1;
		_bQty = 0;
		_vQty = 0;
		for "_i" from 1 to _objectCount do {
			_hiveResponse = _key call server_hiveReadWriteLarge;
			diag_log (format["HIVE: Loading Objects:	Contents: ((%1):%2)", typeName _hiveResponse, _hiveResponse]);
			if ((_hiveResponse select 2) isKindOf "ModularItems") then {
				_BuildingQueue set [_bQty,_hiveResponse];
				_bQty = _bQty + 1;
			} else {
				_objectQueue set [_vQty,_hiveResponse];
				_vQty = _vQty + 1;
			};
		};
		diag_log ("HIVE: got " + str(_bQty) + " Epoch Objects and " + str(_vQty) + " Vehicles");
	};

	//p2serverMonStartTime = diag_tickTime;
	//diag_log format["P2DEBUG: Server_monitor: Loop Start Time:							 %1", diag_tickTime];
	
	// # NOW SPAWN OBJECTS #
	_totalvehicles = 0;
	{
		_idKey = 			_x select 1;
		_type =				_x select 2;
		_ownerID = 			_x select 3;
		_worldspace = 		_x select 4;
		_inventory =		_x select 5;
		_hitPoints =		_x select 6;
		_fuel =				_x select 7;
		_damage = 			_x select 8;
		_goldArray = 		_x select 9;
		_gold =				_goldArray select 0;

		p2serverMonObjStartTime = diag_tickTime;
		//diag_log format["P2DEBUG: Server_monitor: (Obj Read) Start Time:						 %1, 	objID: %2", diag_tickTime - p2serverMonStartTime, _idKey];

		_dir = 0;
		_pos = [0,0,0];
		_wsDone = false;
		if (count _worldspace >= 2) then
		{
			_dir = _worldspace select 0;
			if (count (_worldspace select 1) == 3) then {
				_pos = _worldspace select 1;
				_wsDone = true;
			}
		};			
		
		if (!_wsDone) then {
			if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
			_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
			if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
			//diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
		};
		
		// Realign characterID to OwnerPUID - need to force save though.
		
		if (DZE_APlotforLife) then {
			if (count _worldspace < 3) then
			{
				_worldspace set [count _worldspace, "0"];
			};		
			_ownerPUID = _worldspace select 2;
		} else {
			_ownerPUID = _ownerID;
		};
		
		//diag_log format["Server_monitor: [ObjectID = %1]  [ClassID = %2] [_ownerPUID = %3]", _idKey, _type, _ownerPUID];

		if (_damage < 1) then {
			//diag_log format["OBJ: %1 - %2", _idKey,_type];
			
			//Create it
			_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];

			_object call {
			    _this setVariable [
			        (uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar])),
			        "hash_id" callExtension format [
			            "%1:%2",
			            netId _this,
			            typeOf _this
			        ]
			    ];
			};

			_object call player2_removeVehicleWeapons;

			if ((_gold) < 1) then {
				_gold = 0;
				//make sure there no gold item in the object
				[_object,false] call fnc_removeExtraBars;
			} else {
				//make sure there is only one gold item in the object
				[_object,true] call fnc_removeExtraBars;
			};

			//comment out if statement to see ALL objects gold as they spawn
			if (_gold > 500000) then {
				private["_log"];
				_log = format[str(typeOf _object) + "(_GLS_)" + str _gold + "(_GLS_)" + str(position _object)];
				_log call stats_highGoldObjects;
			};

			_object setVariable ["ZombZGold", _gold, true];

			_object setVariable ["lastUpdate",time];
			_object setVariable ["ObjectID", _idKey, true];

			if (typeOf (_object) in  DZE_DoorsLocked) then {
    			_object setVariable ["doorfriends", _inventory, true];
			};

			if (typeOf (_object) == "Plastic_Pole_EP1_DZ") then {
				_object setVariable ["plotfriends", _inventory, true];
			};

			_lockable = 0;
			if(isNumber (configFile >> "CfgVehicles" >> _type >> "lockable")) then {
				_lockable = getNumber(configFile >> "CfgVehicles" >> _type >> "lockable");
			};

			_sa = true;
			// fix for leading zero issues on safe codes after restart
			if (_lockable == 4) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 3) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 2) then {
					_ownerID = format["00%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["000%1", _ownerID];
				};

				_scrambleChar = nil; _scrambleChar = ""; _scrambleUID = nil; _scrambleUID = "";
				_scrambleUID = 		[_ownerPUID,1,true]		call KRON_Scramble;
				_scrambleChar = 	[_ownerID,1,false]		call KRON_Scramble;

				//diag_log(format["P2Scramble:ServerMon: Encrypting: UID Mode: 				%1, 				Output: 	%2",_ownerPUID,	_scrambleUID]);
				//diag_log(format["P2Scramble:ServerMon: Encrypting: CID Mode:  				%1, 				Output: 	%2",_ownerID,	_scrambleChar]);

				if (!isNil '_scrambleUID') then {
					if (!isNil '_scrambleChar') then {
						_sa = false;
						_object setVariable ["CharacterID", _scrambleChar, true];
						_object setVariable ["OwnerPUID", 	_scrambleUID, true];
					};
				};
			};

			if (_lockable == 3) then {
				_codeCount = (count (toArray _ownerID));
				if(_codeCount == 2) then {
					_ownerID = format["0%1", _ownerID];
				};
				if(_codeCount == 1) then {
					_ownerID = format["00%1", _ownerID];
				};
			};

			if (_sa) then {
				_object setVariable ["CharacterID", _ownerID, true];
				_object setVariable ["OwnerPUID", _ownerPUID, true];
			};

			clearWeaponCargoGlobal  _object;
			clearMagazineCargoGlobal  _object;
			_object setVehicleAmmo DZE_vehicleAmmo;
			
			_object setdir _dir;
			_object setposATL _pos;
			_object setDamage _damage;
			
			if ((typeOf _object) in dayz_allowedObjects) then {
				if (DZE_GodModeBase) then {
					_object addEventHandler ["HandleDamage", {false}];
				} else {
					_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
					_object setVariable ["selections", []]; _object setVariable ["gethit", []];
					_object addEventHandler ["HandleDamage",{ _this call server_baseDamage}];
				};
				// Test disabling simulation server side on buildables only.
				_object enableSimulation false;
				// used for inplace upgrades && lock/unlock of safe
				_object setVariable ["OEMPos", _pos, true];
				
			};

			if ((count _inventory > 0) && !(typeOf( _object) == "Plastic_Pole_EP1_DZ") && !(typeOf( _object) in  DZE_DoorsLocked)) then {
				if (_type in DZE_LockedStorage) then {
					// Fill variables with loot
					_object setVariable ["WeaponCargo", (_inventory select 0),true];
					_object setVariable ["MagazineCargo", (_inventory select 1),true];
					_object setVariable ["BackpackCargo", (_inventory select 2),true];
				} else {

					//Add weapons
					_objWpnTypes = (_inventory select 0) select 0;
					_objWpnQty = (_inventory select 0) select 1;
					_countr = 0;					
					{
						if(_x in (DZE_REPLACE_WEAPONS select 0)) then {
							_x = (DZE_REPLACE_WEAPONS select 1) select ((DZE_REPLACE_WEAPONS select 0) find _x);
						};
						_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
						if (_isOK) then {
							_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes; 
				
					//Add Magazines
					_objWpnTypes = (_inventory select 1) select 0;
					_objWpnQty = (_inventory select 1) select 1;
					_countr = 0;
					{
						if (_x == "BoltSteel") then { _x = "WoodenArrow" }; // Convert BoltSteel to WoodenArrow
						if (_x == "ItemTent") then { _x = "ItemTentOld" };
						_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
						if (_isOK) then {
							_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;

					//Add Backpacks
					_objWpnTypes = (_inventory select 2) select 0;
					_objWpnQty = (_inventory select 2) select 1;
					_countr = 0;
					{
						_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
						if (_isOK) then {
							_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
						};
						_countr = _countr + 1;
					} count _objWpnTypes;
				};
			};	


			if (_object isKindOf "AllVehicles") then {
				/*---------------------------------------------------------------------------
				Shoot From Vehicles - UH1Y & MH60S & MH6J & V3S - Disabled
				---------------------------------------------------------------------------*/
				//if ((typeOf _object) in P2DZ_DriveByVehicles) then {
				//	_object setVehicleInit "[this] execVM ""heliDoor\heliDoor_init.sqf"";";
				//};
				

				/*---------------------------------------------------------------------------
				Vehicle Painting
				---------------------------------------------------------------------------*/
				private ["_colour","_colour2","_clrinit","_clrinit2","_marker"];

				{
					_selection = _x select 0;
					_dam = _x select 1;
					if (_selection in dayZ_explosiveParts && _dam > 0.8) then {_dam = 0.8};
					[_object,_selection,_dam] call object_setFixServer;
				} count _hitpoints;


				if(count _worldspace >= 4) then{	
				        if (((typeName(_worldspace select 2)) == "STRING") and ((typeName(_worldspace select 3)) == "STRING")) then {
						_colour = _worldspace select 2;
						_colour2 = _worldspace select 3;
									
						if (_colour != "0") then {
							_object setVariable ["Colour",_colour,true];
							_clrinit = format ["#(argb,8,8,3)color(%1)",_colour];
							_object setVehicleInit "this setObjectTexture [0,"+str _clrinit+"];";
						};
						if (_colour2 != "0") then {			
							_object setVariable ["Colour2",_colour2,true];
							_clrinit2 = format ["#(argb,8,8,3)color(%1)",_colour2];
							_object setVehicleInit "this setObjectTexture [1,"+str _clrinit2+"];";
						};
					};
				};
				
				_object setFuel _fuel;

				if (!((typeOf _object) in dayz_allowedObjects)) then {
					
					//_object setvelocity [0,0,1];
					_object call fnc_veh_ResetEH;		
					
					if(_ownerID != "0" && !(_object isKindOf "Bicycle")) then {
						_object setvehiclelock "locked";
					} else {
						if (P2DZ_staticSpawnMarkers) then {
							_marker = createMarker [str(_pos) , _pos];
							_marker setMarkerShape "ICON";
							_marker setMarkerType "DOT";
							_marker setMarkerText str(_type);
						};
					};
					
					_totalvehicles = _totalvehicles + 1;

					// total each vehicle
					serverVehicleCounter set [count serverVehicleCounter,_type];
				};
				[_object] call fn_SZclean;

				processInitCommands;
			};
		};

		if ((diag_tickTime - p2serverMonObjStartTime) > 0.1) then {
			diag_log format["P2DEBUG: Run Time:							 %1", diag_tickTime - p2serverMonObjStartTime];
			diag_log format[">	objID: %1, objType: %2, objGold: %3", _idKey, _type, _goldArray];
		};

	} forEach (_BuildingQueue + _objectQueue);
	// # END SPAWN OBJECTS #

	// preload server traders menu data into cache
	if !(DZE_ConfigTrader) then {
		{
			// get tids
			_traderData = call compile format["menu_%1;",_x];
			if(!isNil "_traderData") then {
				{
					_traderid = _x select 1;

					_retrader = [];

					_key = format["CHILD:399:%1:",_traderid];
					_data = "HiveEXT" callExtension _key;

					//diag_log "HIVE: Request sent";
			
					//Process result
					_result = call compile format ["%1",_data];
					_status = _result select 0;
			
					if (_status == "ObjectStreamStart") then {
						_val = _result select 1;
						//Stream Objects
						//diag_log ("HIVE: Commence Menu Streaming...");
						call compile format["ServerTcache_%1 = [];",_traderid];
						for "_i" from 1 to _val do {
							_data = "HiveEXT" callExtension _key;
							_result = call compile format ["%1",_data];
							call compile format["ServerTcache_%1 set [count ServerTcache_%1,%2]",_traderid,_result];
							_retrader set [count _retrader,_result];
						};
						//diag_log ("HIVE: Streamed " + str(_val) + " objects");
					};

				} forEach (_traderData select 0);
			};
		} forEach serverTraders;
	};

	if (_hiveLoaded) then {
		if (DZE_FS_UseStaticVehicleSpawn) then {
			_vehLimit = 1000;
			diag_log ("HIVE: Spawning Vehicles Using Static Vehicle Spawn System by Player2");
			[_vehLimit] spawn fs_spawnVehicles;
		} else {
			_vehLimit = 100;
			//diag_log ("HIVE: Spawning Vehicles Using defualt Epoch System, Amount to Spawn: " + str (_vehLimit));
			for "_x" from 1 to _vehLimit do {
				//[] spawn spawn_vehicles;
			};
		};
	} else {
		diag_log "HIVE: Cannot Spawn Vehicles, Hive Not loaded!";
	};
	
	//  spawn_roadblocks
	//diag_log ("HIVE: Spawning # of Debris: " + str(MaxDynamicDebris));
	for "_x" from 1 to MaxDynamicDebris do {
		[] spawn spawn_roadblocks;
	};
	//  spawn_ammosupply at server start 1% of roadblocks
	//diag_log ("HIVE: Spawning # of Ammo Boxes: " + str(MaxAmmoBoxes));
	for "_x" from 1 to MaxAmmoBoxes do {
		[] spawn spawn_ammosupply;
	};
	// call spawning mining veins
	//diag_log ("HIVE: Spawning # of Veins: " + str(MaxMineVeins));
	for "_x" from 1 to MaxMineVeins do {
		[] spawn spawn_mineveins;
	};

 	if (P2DZ_HC_HeliCrashes) then {
 		diag_log("P2DEBUG: HeliCrashes Running On Headless Client instead of Server!");
 		dayz_MapArea = 11000;					//Size of map
		HeliCrashArea = dayz_MapArea / 2;		//Size of heli crashsite area (7km for Chernarus)
        P2DZ_heliCrashSites_guaranteedLoot =    8;              
        P2DZ_heliCrashSites_randomizedLoot =    4;              
        P2DZ_heliCrashSites_spawnFire =         true;          
        P2DZ_heliCrashSites_fadeFire =          false;          
        server_spawnCrashSite  =      compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSiteHC.sqf";

 	} else {

		server_spawnCrashSite  =    	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSite.sqf";

		/* Live Server Settings: 3 Hour restart

		Description: 
			Spawns are given a 75% chance of appearing between 4 and 8 times per restart
			At Intervals between 22 mins 30 seconds and 37 mins 30 seconds
			Each crash site will spawn 6 garantueed loot items with up to 3 additional items
		*/
		P2DZ_heliCrashSites_guaranteedLoot = 	6; 				//How many loot piles will Spawn
	 	P2DZ_heliCrashSites_randomizedLoot =  	3; 				//How many possible (randomized) additional loot piles could spawn
	 	P2DZ_heliCrashSites_frequency =			(22.5 * 60); 	//How often they should be given a chance to spawn in secs, eg 60sec for 1 every 1min
	 	P2DZ_heliCrashSites_variance = 			(15 * 60); 		//How much  possible additional randomized time to add to the frequency time for each spawn chance in secs
	 	P2DZ_heliCrashSites_spawnChacne =		0.75; 			//Chance between 0-1 of crashsite spawning when it gets a chance to
	 	P2DZ_heliCrashSites_spawnMarker =		'center';		//Center point of spawn radius
	 	P2DZ_heliCrashSites_spawnRadius =   	HeliCrashArea; 	//Size of radius where they can spawn
	 	P2DZ_heliCrashSites_spawnFire =			true; 			//Add smoke to them?
	 	P2DZ_heliCrashSites_fadeFire =			false; 			//Fade smoke over time?
		
	 	/*	Test Server Settings: !!!!!!!!!!!! 1 every 10 Minutes!!!!!!!!!! WARNING !!!!!!!! 8 Loot piles garantueed.
	 	*/ /*
	  	P2DZ_heliCrashSites_guaranteedLoot = 	8; 				//How many loot piles will Spawn
	 	P2DZ_heliCrashSites_randomizedLoot =  	0; 				//How many extra loot piles could spawn
	 	P2DZ_heliCrashSites_frequency =			(1 * 60); 		//How often they should be given a chance to spawn in secs, eg 60sec for 1 every 1min
	 	P2DZ_heliCrashSites_variance = 			(0 * 60); 		//How much randomized time to add to the frequency time for each spawn chance in secs
	 	P2DZ_heliCrashSites_spawnChance =		1; 				//Chance between 0-1 of crashsite spawning when it gets a chance to
	 	P2DZ_heliCrashSites_spawnMarker =		'center';		//Center point of spawn radius
	 	P2DZ_heliCrashSites_spawnRadius =   	HeliCrashArea; 	//Size of radius where they can spawn
	 	P2DZ_heliCrashSites_spawnFire =			true; 			//Add smoke to them?
	 	P2DZ_heliCrashSites_fadeFire =			false; 			//Fade smoke over time?
		
		 */

		//Spawn Server CrashSites:
		_nul = 	[P2DZ_heliCrashSites_guaranteedLoot,
				P2DZ_heliCrashSites_randomizedLoot,
				P2DZ_heliCrashSites_frequency,
				P2DZ_heliCrashSites_variance,
				P2DZ_heliCrashSites_spawnChance,
				P2DZ_heliCrashSites_spawnMarker,
				P2DZ_heliCrashSites_spawnRadius,
				P2DZ_heliCrashSites_spawnFire,
				P2DZ_heliCrashSites_fadeFire] spawn server_spawnCrashSite;
 	};

	if (isDedicated) then {
		// Epoch Events
		_id = [] spawn server_spawnEvents;
		// server cleanup
		[] spawn {
			private ["_id"];
			uiSleep 60; //Sleep Lootcleanup, don't need directly cleanup on startup + fix some performance issues on serverstart
			waitUntil {!isNil "server_spawnCleanAnimals"};
			_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
		};

		// spawn debug box
		_debugMarkerPosition = getMarkerPos "respawn_west";
		_debugMarkerPosition = [(_debugMarkerPosition select 0),(_debugMarkerPosition select 1),1];
		_vehicle_0 = createVehicle ["DebugBox_DZ", _debugMarkerPosition, [], 0, "CAN_COLLIDE"];
		
		_vehicle_0 call {
		    _this setVariable [
		        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
		        "hash_id" callExtension format [
		            "%1:%2",
		            netId _this,
		            typeOf _this
		        ]
		    ];
		};

		_vehicle_0 setPos _debugMarkerPosition;
		_vehicle_0 setVariable ["ObjectID","1",true];

		// max number of spawn markers
		if(isnil "spawnMarkerCount") then {
			spawnMarkerCount = 10;
		};
		actualSpawnMarkerCount = 0;
		// count valid spawn marker positions
		for "_i" from 0 to spawnMarkerCount do {
			if (!([(getMarkerPos format["spawn%1", _i]), [0,0,0]] call BIS_fnc_areEqual)) then {
				actualSpawnMarkerCount = actualSpawnMarkerCount + 1;
			} else {
				// exit since we did not find any further markers
				_i = spawnMarkerCount + 99;
			};
			
		};
		diag_log format["Total Number of player spawn locations %1", actualSpawnMarkerCount];
		
		endLoadingScreen;
	};

	allowConnection = true;	
	sm_done = true;
	publicVariable "sm_done";



/*

    //Bases
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base1.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base2.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base3.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base4.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base5.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base6.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base7.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base8.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base9.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base10.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base11.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base12.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base13.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base14.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base15.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base16.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base17.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base18.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base19.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base20.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base21.sqf"; 
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base22.sqf"; 
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base23.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base24.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base25.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base26.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base27.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base28.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base29.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base30.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base31.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base32.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base33.sqf";
	call compile preProcessFileLineNumbers "\z\addons\dayz_server\buildings\bases\base34.sqf";
*/

	//Buildings
	//	Moved to MPMissions\.\buildings\init_buildings.sqf
	//
	//	InFile Changes/Replacements (ReGex must be enabled in sublime/npp++ replace! < = Start, > = End):
	//		<_this;\n> -> <_this;\n   _this setVariable [uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),"hash_id" callExtension format ["%1:%2",netId _this,typeOf _this]];\n>

};
