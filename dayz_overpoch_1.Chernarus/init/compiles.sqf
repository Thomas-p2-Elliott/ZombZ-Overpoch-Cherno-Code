/*
	FUNCTION COMPILES
*/
//Player only
if (!isDedicated) then {

	"filmic" setToneMappingParams [0.07, 0.31, 0.23, 0.37, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

	//modified
	fnc_usec_damageActions =		compile preprocessFileLineNumbers "compile\fn_damageActions.sqf";		//Checks which actions for nearby casualty
	fnc_usec_selfActions = 			compile preprocessFileLineNumbers "compile\fn_selfActions.sqf";  		//Checks which actions for self
	player_tentPitch =				compile preprocessFileLineNumbers "actions\tent_pitch.sqf";
	player_packTent =				compile preprocessFileLineNumbers "compile\player_packTent.sqf";
	player_vaultPitch =				compile preprocessFileLineNumbers "actions\vault_pitch.sqf";
	player_unlockVault =			compile preprocessFileLineNumbers "compile\player_unlockVault.sqf";
	player_lockVault =				compile preprocessFileLineNumbers "compile\player_lockVault.sqf";
	player_build =					compile preprocessFileLineNumbers "actions\player_build.sqf";
	player_removeObject =			compile preprocessFileLineNumbers "actions\remove.sqf";
	player_updateGui =				compile preprocessFileLineNumbers "compile\player_updateGui.sqf";
	dayz_spaceInterrupt =			compile preprocessFileLineNumbers "actions\dayz_spaceInterrupt.sqf";
	player_zombieCheck = 			compile preprocessFileLineNumbers "compile\player_zombieCheck.sqf";		
	player_zombieAttack = 			compile preprocessFileLineNumbers "compile\player_zombieAttack.sqf";	
	player_death =					compile preprocessFileLineNumbers "compile\player_death.sqf";
	player_checkStealth =			compile preprocessFileLineNumbers "compile\player_checkStealth.sqf";
	player_monitor =				compile preprocessFileLineNumbers "system\player_monitor.sqf";
	building_spawnLoot =			compile preprocessFileLineNumbers "compile\building_spawnLoot.sqf";
	player_fired =					compile preprocessFileLineNumbers "compile\player_fired.sqf";			//Runs when player fires. Alerts nearby Zeds depending on calibre && audial rating

	/*SideChat Disabler*/
	P2DZ_really_loud_sounds = 	{[60,15] call fnc_usec_pitchWhine;for "_i" from 1 to 15 do {playSound format ["%1",_this select 0];};};
	P2DZ_double_cut = 			{1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};

	/*Plot*/
	CurrencyName = "Gold Bars";
	PlotGetFriends =				compile preprocessFileLineNumbers "plotManagement\plotGetFriends.sqf";
	PlotNearbyHumans = 				compile preprocessFileLineNumbers "plotManagement\plotNearbyHumans.sqf";
	PlotAddFriend =					compile preprocessFileLineNumbers "plotManagement\plotAddFriend.sqf";
	PlotRemoveFriend = 				compile preprocessFileLineNumbers "plotManagement\plotRemoveFriend.sqf";
	MaintainPlot =					compile preprocessFileLineNumbers "plotManagement\maintain_areaSC.sqf";
	PlotPreview =					compile preprocessFileLineNumbers "plotManagement\plotToggleMarkers.sqf";
	PlotObjects = 					compile preprocessFileLineNumbers "plotManagement\plotObjects.sqf";
	/*Plot End*/

	/*DoorManagement Zupa*/
	DoorGetFriends 		=			compile preprocessFileLineNumbers "doorManagement\doorGetFriends.sqf";
	DoorNearbyHumans 	= 			compile preprocessFileLineNumbers "doorManagement\doorNearbyHumans.sqf";
	DoorAddFriend 		= 			compile preprocessFileLineNumbers "doorManagement\doorAddFriend.sqf";
	DoorRemoveFriend 	= 			compile preprocessFileLineNumbers "doorManagement\doorRemoveFriend.sqf";
	player_unlockDoor       = 		compile preprocessFileLineNumbers "doorManagement\player_unlockDoor.sqf";
	player_unlockDoorCode = 		compile preprocessFileLineNumbers "doorManagement\player_unlockDoorCode.sqf";
	player_manageDoor       = 		compile preprocessFileLineNumbers "doorManagement\initDoorManagement.sqf";
	player_enterCode       = 		compile preprocessFileLineNumbers "doorManagement\player_enterCode.sqf";
	player_changeCombo = 			compile preprocessFileLineNumbers "doorManagement\player_changeCombo.sqf"; 
	/*DoorManagement End*/

	/* Vehicle Painting */
	VehicleColourPaint =			compile preprocessFileLineNumbers "Paint\vehicleColourPaint.sqf";
	VehicleColourUpdate =			compile preprocessFileLineNumbers "Paint\VehicleColourUpdate.sqf";
	VehicleColourUpdate2 =			compile preprocessFileLineNumbers "Paint\VehicleColourUpdate2.sqf";
	player_paint =					compile preprocessFileLineNumbers "Paint\player_paint.sqf";
	/* End */

	/*	Gear Menu Compiles	*/
	[] execVM 						"init\gearMenuCompiles.sqf";

	/*Death Message Compile */
	[] execVM 						"compile\player_deathMessage.sqf";

	//unmodified
	player_throwObject = 			compile preprocessFileLineNumbers "compile\player_throwObject.sqf";
	player_traderCity = 			compile preprocessFileLineNumbers "compile\player_traderCity.sqf";
	ui_changeDisplay = 				compile preprocessFileLineNumbers "compile\ui_changeDisplay.sqf";
	player_selectSlot =				compile preprocessFileLineNumbers "compile\ui_selectSlot.sqf";
	player_wearClothes =			compile preprocessFileLineNumbers "actions\player_wearClothes.sqf";
	player_useMeds =				compile preprocessFileLineNumbers "actions\player_useMeds.sqf";

	//pure custom
	snap_build = 					compile preprocessFileLineNumbers "compile\snap_build.sqf";
	fnc_removeExtraBars =			compile preprocessFileLineNumbers "compile\fnc_removeExtraBars.sqf";
	p2_randomMags =					compile preprocessFileLineNumbers "compile\p2_randomMags.sqf";
	player2_haloSpawn =				compile preprocessFileLineNumbers "actions\player2_haloSpawn.sqf";
	call 							compile preprocessFileLineNumbers "compile\fn_hintMsg.sqf";
	call 							compile preprocessFileLineNumbers "compile\fnc_debugMon.sqf";
	[] 	execVM 						"compile\fn_deployActions.sqf";	

	BIS_Effects_Burn = 				compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
	player_zombieCheck = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";			//Run on a players computer, checks if the player is near a zombie
	player_zombieAttack = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieAttack.sqf";	//Run on a players computer, causes a nearby zombie to attack them
	fnc_inAngleSector =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_inAngleSector.sqf";		//Checks which actions for nearby casualty
	fnc_usec_unconscious =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	player_temp_calculation	=		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_temperatur.sqf";			//Temperatur System	//TeeChange
	player_weaponFiredNear =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_weaponFiredNear.sqf";
	player_animalCheck =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_animalCheck.sqf";
	player_spawnCheck = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_spawnCheck.sqf";
	player_dumpBackpack = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_dumpBackpack.sqf";
	building_spawnZombies =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\building_spawnZombies.sqf";
	player_harvest =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_harvest.sqf";
	player_packVault =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_packVault.sqf";
	player_humanityMorph =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_humanityMorph.sqf";
	player_switchModel =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_switchModel.sqf";

	player_removeNearby =    		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_removeNearby.sqf";

	player_removeTankTrap = {
		//Object Array, Range, Error Message (@Skaronator)
		[["Hedgehog_DZ"], 1,"STR_EPOCH_ACTIONS_14"] call player_removeNearby;
	};
	player_removeNet = {
		[["DesertCamoNet_DZ","DesertLargeCamoNet","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ"], 5,"str_epoch_player_8"] call player_removeNearby;
	};

	player_login = {
		private ["_unit","_detail","_PUID"];
		_unit = _this select 0;
		_detail = _this select 1;
		_PUID = [player] call FNC_GetPlayerUID;
		if(_unit == _PUID) then {
			player setVariable["publish",_detail];
		};
	};


	player_crossbowBolt =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_crossbowBolt.sqf";
	player_music = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_music.sqf";			//Used to generate ambient music

	world_sunRise =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_sunRise.sqf";
	world_surfaceNoise =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_surfaceNoise.sqf";
	player_alertZombies = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_alertZombies.sqf";
	player_fireMonitor = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\system\fire_monitor.sqf";

	//Objects
	object_roadFlare = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_roadFlare.sqf";
	object_setpitchbank	=		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_setpitchbank.sqf";

	local_roadDebris =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_roadDebris.sqf";

	//Zombies
	zombie_findTargetAgent = 	compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_findTargetAgent.sqf";
	zombie_loiter = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_loiter.sqf";			//Server compile, used for loiter behaviour
	zombie_generate = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_generate.sqf";			//Server compile, used for loiter behaviour
	wild_spawnZombies = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\wild_spawnZombies.sqf";			//Server compile, used for loiter behaviour

	dog_findTargetAgent = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\dog_findTargetAgent.sqf";

	//actions

	player_copyKey =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_copyKey.sqf";
	player_reloadMag =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_reloadMags.sqf";
	player_loadCrate =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_loadCrate.sqf";
	player_craftItem =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_craftItem.sqf";
	player_drink =				compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_drink.sqf";
	player_eat =				compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_eat.sqf";
	player_fillWater = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\water_fill.sqf";
	player_makeFire =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_makefire.sqf";
	player_harvestPlant =		compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_harvestPlant.sqf";
	player_goFishing =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_goFishing.sqf";
	
	if (DZE_modularBuild) then {
		player_build =				compile preprocessFileLineNumbers "actions\modular_build.sqf";
		player_build_countNearby =	compile preprocessFileLineNumbers "actions\player_build_countNearby.sqf";
		player_build_states =		compile preprocessFileLineNumbers "actions\player_build_states.sqf";
		player_build_needNearby =	compile preprocessFileLineNumbers "actions\player_build_needNearby.sqf";
		player_build_getConfig =	compile preprocessFileLineNumbers "actions\player_build_getConfig.sqf";
		player_build_plotCheck =	compile preprocessFileLineNumbers "actions\player_build_plotCheck.sqf";
		player_build_buildReq =		compile preprocessFileLineNumbers "actions\player_build_buildReq.sqf";
		player_build_create =		compile preprocessFileLineNumbers "actions\player_build_create.sqf";
		player_build_controls =		compile preprocessFileLineNumbers "actions\player_build_controls.sqf";
		player_build_publish =		compile preprocessFileLineNumbers "actions\player_build_publish.sqf";
		DZE_snap_build_file = 		"compile\snap_build.sqf"; // Set as a global variable as it is also referenced in snapbuild.sqf
		snap_build = 				compile preprocessFileLineNumbers DZE_snap_build_file;
	} else {
		player_build =				compile preprocessFileLineNumbers "actions\player_build.sqf";
	};

	FNC_check_owner =			compile preprocessFileLineNumbers "compile\fn_check_owner.sqf";

	object_pickup = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\object_pickup.sqf";
	player_flipvehicle = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_flipvehicle.sqf";
	player_sleep = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_sleep.sqf";
	player_antiWall =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_antiWall.sqf";
	player_deathBoard =			compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\list_playerDeathsAlt.sqf";

	player_plotPreview = 		compile preprocessFileLineNumbers "actions\object_showPlotRadius.sqf";
	player_upgradeVehicle =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_upgradeVehicle.sqf";


	//System
	player_spawn_1 =			compile preprocessFileLineNumbers "\z\addons\dayz_code\system\player_spawn_1.sqf";
	player_spawn_2 =			compile preprocessFileLineNumbers "\z\addons\dayz_code\system\player_spawn_2.sqf";
	onPreloadStarted 			"dayz_preloadFinished = false;";
	onPreloadFinished 			"dayz_preloadFinished = true;";

	// helper functions
	player_hasTools =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_hasTools.sqf";
	player_checkItems =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_checkItems.sqf";
	player_removeItems =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_removeItems.sqf";
	//Trader ["Trader City Name",false,"enter"] - Trader City Name | Show Message | "enter" || "leave"

	// combination of check && remove items
	player_checkAndRemoveItems = {
		private ["_items","_b"];
		_items = _this;
		_b = _items call player_checkItems;
		if (_b) then {
			_b = _items call player_removeItems;
		};
		_b
	};

	dayz_HungerThirst = {
		dayz_hunger = dayz_hunger + (_this select 0);
		dayz_thirst = dayz_thirst + (_this select 1);
	};

	epoch_itemCost = {
		_cost = 0;
		_cost = (_this select 0) select 1;
		diag_log format["DEBUG TRADER epoch_itemCost: _this 0-0 (%1) _this (%2)", _cost, _this];
		_cost
	};

	epoch_totalCurrency = {
		_total_currency = 0;
		_total_currency = player getVariable ["ZombZGold", 0];
		diag_log format["DEBUG TRADER epoch_totalCurrency: %1", _total_currency];
		_total_currency
	};

	epoch_returnChange = compile preprocessFileLineNumbers "compile\epoch_returnChange.sqf";
	// usage [["partinclassname",4]] call epoch_returnChange;


	// trader menu code
	if (DZE_ConfigTrader) then {
		call compile preprocessFileLineNumbers "compile\player_traderMenuConfig.sqf";
	}else{
		call compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_traderMenuHive.sqf";
	};
	// recent murders menu code
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_murderMenu.sqf";

	dayz_meleeMagazineCheck = {
                private["_meleeNum","_magType"];
                _magType =         ([] + getArray (configFile >> "CfgWeapons" >> _wpnType >> "magazines")) select 0;
                _meleeNum = ({_x == _magType} count magazines player);
                if (_meleeNum < 1) then {
                        player addMagazine _magType;
                };
        };

	dayz_originalPlayer = player;

	progressLoadingScreen 0.8;
};

/*---------------------------------------------------------------------------
Both Server & Client Side Scripts
---------------------------------------------------------------------------*/

	//modified
	spawn_loot =					compile preprocessFileLineNumbers "compile\spawn_loot.sqf";
	spawn_loot_small = 				compile preprocessFileLineNumbers "compile\spawn_loot_small.sqf";
	if (isServer) then {
		spawn_loot_server =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\spawn_loot_server.sqf";
	};
	
	BIS_fnc_halo =             		compile preprocessFileLineNumbers "compile\fn_halo.sqf";
	BIS_fnc_infoText =				compile preprocessFileLineNumbers "compile\fn_infoText.sqf";
	fnc_usec_damageHandler =		compile preprocessFileLineNumbers "compile\fn_damageHandler.sqf";			//Event handler run on damage

	//custom
	p2_lootCheck = 					compile preprocessFileLineNumbers "compile\p2_lootCheck.sqf";
	p2_checkWepBpSlot = 			compile preprocessFileLineNumbers "compile\p2_checkWepBpSlot.sqf"; 
	//towing and lifting
	call 							compile preprocessFileLineNumbers "logistic\init.sqf";
	
	//coming soon to epoch
	FNC_GetPlayerUID = {
		private ["_object","_version","_PID"];
		_object = _this select 0;
		_version = productVersion select 3;
		if (DayZ_UseSteamID) then {
			_PID = GetPlayerUID _object;
			if (_version >= 125548) then {
				_PID = call (compile "GetPlayerUIDOld _object");
			} else {
				_PID = GetPlayerUID _object;
				diag_log format["Your game version, %1, is less than the required for the old UID system; using Steam ID system instead. Update to 1.63.125548 (or latest steam beta)", _version];
			};
		};
		_PID;
	};


	//default
	BIS_fnc_selectRandom =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_selectRandom.sqf";
	BIS_fnc_vectorAdd =        			 compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_vectorAdd.sqf";

	BIS_fnc_findNestedElement =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_findNestedElement.sqf";
	BIS_fnc_param = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\BIS_fnc\fn_param.sqf";
	player_humanityChange =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_humanityChange.sqf";
	fnc_buildWeightedArray = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_buildWeightedArray.sqf";		//Checks which actions for nearby casualty
	fnc_usec_damageVehicle =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerVehicle.sqf";		//Event handler run on damage
	// object_vehicleKilled =		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_vehicleKilled.sqf";		//Event handler run on damage
	object_setHitServer =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_setHitServer.sqf";		//process the hit as a NORMAL damage (useful for persistent vehicles)
	object_setFixServer =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_setFixServer.sqf";		//process the hit as a NORMAL damage (useful for persistent vehicles)
	object_getHit =					compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_getHit.sqf";			//gets the hit value for a HitPoint (i.e. HitLegs) against the selection (i.e. "legs"), returns the value
	object_setHit =					compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_setHit.sqf";			//process the hit as a NORMAL damage (useful for persistent vehicles)
	object_processHit =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_processHit.sqf";			//process the hit in the REVO damage system (records && sets hit)
	object_delLocal =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_delLocal.sqf";
	// object_cargoCheck =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_cargoCheck.sqf";			//Run by the player || server to monitor changes in cargo contents
	fnc_veh_ResetEH = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\init\veh_ResetEH.sqf";				//Initialize vehicle
	// Vehicle damage fix
	vehicle_handleDamage    = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleDamage.sqf";
	vehicle_handleKilled    = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_handleKilled.sqf";
	//fnc_vehicleEventHandler = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\init\vehicle_init.sqf";				//Initialize vehicle
	fnc_inString = 					compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_inString.sqf";
	fnc_isInsideBuilding = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_isInsideBuilding.sqf";		//_isInside = [_unit,_building] call fnc_isInsideBuilding;
	fnc_isInsideBuilding2 = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_isInsideBuilding2.sqf";		//_isInside = [_unit,_building] call fnc_isInsideBuilding2;
	fnc_isInsideBuilding3 = 			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_isInsideBuilding3.sqf";		//_isInside = [_unit,_building] call fnc_isInsideBuilding3;
	dayz_zombieSpeak = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\object_speak.sqf";				//Used to generate random speech for a unit
	vehicle_getHitpoints =			compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\vehicle_getHitpoints.sqf";
	local_gutObject =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_gutObject.sqf";			//Generated on the server (|| local to unit) when gutting an object
	local_lockUnlock =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_lockUnlock.sqf";			//When vehicle is local to unit perform locking vehicle
	local_gutObjectZ =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_gutObjectZ.sqf";			//Generated on the server (|| local to unit) when gutting an object
	local_zombieDamage = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandlerZ.sqf";			//Generated by the client who created a zombie to track damage
	local_eventKill = 				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\local_eventKill.sqf";			//Generated when something is killed
	//player_weaponCheck =				compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_weaponCheck.sqf";			//Run by the player || server to monitor whether they have picked up a new weapon
	curTimeStr =					compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_curTimeStr.sqf";
	player_medBandage =				compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medBandaged.sqf";
	player_medInject =				compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medInject.sqf";
	player_medEpi =					compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medEpi.sqf";
	player_medTransfuse =			compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medTransfuse.sqf";
	player_medMorphine =			compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medMorphine.sqf";
	player_breaklegs =				compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medBreakLegs.sqf";
	player_medPainkiller =			compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\publicEH\medPainkiller.sqf";
	world_isDay = 				{if ((daytime < (24 - dayz_sunRise)) && (daytime > dayz_sunRise)) then {true} else {false}};

	// player_projectileNear = 		compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_projectileNear.sqf";
	FNC_GetPlayerUID = {
		private ["_object","_version","_PID"];
		_object = _this select 0;
		_version = productVersion select 3;
		if (DayZ_UseSteamID) then {
			_PID = GetPlayerUID _object;
		} else {
			if (_version >= 125548) then {
				_PID = call (compile "GetPlayerUIDOld _object");
			} else {
				_PID = GetPlayerUID _object;
				diag_log format["Your game version, %1, is less than the required for the old UID system; using Steam ID system instead. Update to 1.63.125548 (or latest steam beta)", _version];
			};
		};
		_PID
	};
	FNC_GetSetPos = { //DO NOT USE IF YOU NEED ANGLE COMPENSATION!!!!
		private "_pos";
		_thingy = _this select 0;
		_pos = getPosASL _thingy;
		if (surfaceIsWater _pos) then {
			_thingy setPosASL _pos;
		} else {
			_thingy setPosATL (ASLToATL _pos);
		};
	};
	FNC_GetPos = {
		private "_pos";
		if (isNil {_this select 0}) exitWith {[0,0,0]};
		_thingy = _this select 0;
		_pos = getPosASL _thingy;
		if !(surfaceIsWater _pos) then {
			_pos =  ASLToATL _pos;
		};
		_pos
	};
	local_setFuel =	{
		private["_qty","_vehicle"];
		_vehicle = _this select 0;
		_qty = _this select 1;
		_vehicle setFuel _qty;
	};
	zombie_initialize = {
		private ["_unit","_position"];
		_unit = _this select 0;
		if (isServer) then {
			_unit addEventHandler ["local", {_this call zombie_findOwner}];
		};
		_id = _unit addeventhandler["HandleDamage", { _this call local_zombieDamage }];
		_id = _unit addeventhandler["Killed", { [_this, "zombieKills"] call local_eventKill }];
	};

	dayz_EjectPlayer = {
		// check if player in vehicle
        private ["_noDriver","_vehicle","_inVehicle"];
        _vehicle = vehicle player;
		_inVehicle = (_vehicle != player);
		if(_inVehicle) then {
			_noDriver = ((_vehicle emptyPositions "driver") > 0);
			if (_noDriver && (speed _vehicle) != 0) then {
				player action [ "eject", _vehicle];
			};
		};
	};

	player_sumMedical = {
		private["_character","_wounds","_legs","_arms","_medical"];
		_character = 	_this;
		_wounds =		[];
		if (_character getVariable["USEC_injured",false]) then {
			{
				if (_character getVariable[_x,false]) then {
					_wounds set [count _wounds,_x];
				};
			} count USEC_typeOfWounds;
		};
		_legs = _character getVariable ["hit_legs",0];
		_arms = _character getVariable ["hit_arms",0];
		_medical = [
			_character getVariable["USEC_isDead",false],
			_character getVariable["NORRN_unconscious", false],
			_character getVariable["USEC_infected",false],
			_character getVariable["USEC_injured",false],
			_character getVariable["USEC_inPain",false],
			_character getVariable["USEC_isCardiac",false],
			_character getVariable["USEC_lowBlood",false],
			_character getVariable["USEC_BloodQty",12000],
			_wounds,
			[_legs,_arms],
			_character getVariable["unconsciousTime",0],
			_character getVariable["messing",[0,0]]
		];
		_medical
	};

	//Server Only
	if (isServer) then {
		call compile preprocessFileLineNumbers "\z\addons\dayz_server\init\server_functions.sqf";
	} else {
		eh_localCleanup = {};
	};

initialized = true;
