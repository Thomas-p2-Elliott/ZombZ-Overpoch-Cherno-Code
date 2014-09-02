disableSerialization;

/*---------------------------------------------------------------------------
Security Settings
---------------------------------------------------------------------------*/

if(isServer) then {
	DZE_safeVehicle = ["ParachuteWest","ParachuteC"];
};

//Model Variables
Bandit1_DZ = 	"Bandit1_DZ";
Bandit2_DZ = 	"Bandit2_DZ";
BanditW1_DZ = 	"BanditW1_DZ";
BanditW2_DZ = 	"BanditW2_DZ";
Survivor1_DZ = 	"Survivor2_DZ";
Survivor2_DZ = 	"Survivor2_DZ";
SurvivorW2_DZ = "SurvivorW2_DZ";
SurvivorW3_DZ = "SurvivorW2_DZ";
Sniper1_DZ = 	"Sniper1_DZ";
Camo1_DZ = 		"Camo1_DZ";
Soldier1_DZ = 	"Soldier1_DZ";
Rocket_DZ = 	"Rocket_DZ";

AllPlayers = ["Survivor2_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWsequishaD_DZ","SurvivorWsequisha_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","SurvivorW2_DZ","Bandit1_DZ","Bandit2_DZ","BanditW1_DZ","BanditW2_DZ","Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","Priest_DZ","Functionary1_EP1_DZ","GUE_Commander_DZ","Ins_Soldier_GL_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ","pz_policeman","pz_suit1","pz_suit2","pz_worker1","pz_worker2","pz_worker3","pz_doctor","pz_teacher","pz_hunter","pz_villager1","pz_villager2","pz_villager3","pz_priest","Soldier_TL_PMC_DZ","Soldier_Sniper_PMC_DZ","Soldier_Bodyguard_AA12_PMC_DZ","Drake_Light_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_CO_DZ","GUE_Soldier_2_DZ","TK_Special_Forces_MG_EP1_DZ","TK_Soldier_Sniper_EP1_DZ","TK_Commander_EP1_DZ","RU_Soldier_Crew_DZ","INS_Lopotev_DZ","INS_Soldier_AR_DZ","INS_Soldier_CO_DZ","INS_Bardak_DZ","INS_Worker2_DZ"];

/* Epoch Vars */

DayZ_UseSteamID = true;


/*---------------------------------------------------------------------------
Debugging Settings
---------------------------------------------------------------------------*/
	
	//player2's debugging (speed)
	p2SpT = true;

	//epoch debugging
	DZEdebug = true;

	//define rate of fps deugging
	DZE_DiagFpsSlow = true;
	DZE_DiagFpsFast = false;
	//enable full FPS output
	DZE_DiagVerbose = true;

	//epoch damage debugging
	DZE_Debug_Damage = false;

	//fn_selfActions.sqf
	P2DZE_debugSelfActions = false;

	//vehicleinspect.sqf
	P2DZE_deugVehIns = true;

	//fn_lootCheck.sqf
	P2DZ_lootCheck_debug = false;			//Toggles debugging logs (type: boolean)

	//fnc_debugMon.sqf
	P2DZE_debugColoutput = false;

/*---------------------------------------------------------------------------
Player/Spawn Settings
---------------------------------------------------------------------------*/

	// DayZ Epoch config
	spawnShoremode = 1; // Default = 1 (on shore)
	dayz_spawnselection = 1; // Spawn selection screen
	spawnArea= 1500; // Default = 1500

	//parachute spawn (keep disabled, deprecated)
	dayz_paraSpawn = false;

	//debug freshspawn loadouts
	P2DZE_loadoutsDebug = true;

	//nametag distance
	DZE_HumanityTargetDistance = 25;

	//backpack gaurd, wipes backpack if you log out near another player (anti-duping measure)
	if(isServer) then {
		//enable backpack gaurd
		DZE_BackpackGuard = true;

		//enable static veh spawns
		DZE_FS_UseStaticVehicleSpawn = true;

		//enable debug output for static vehicle spawns?
		P2DZ_Debug_StaticVehSpawns = false;

		//Static vehicle spawns duplicate vehicle distance check (meters)
		P2DZ_StaticVehSpawns_DupeDistanceCheck = 7.5;
	};

	if(!isDedicated || hasInterface) then {

		//default debug monitor colour
		P2DZE_debugCol = [0,0,1,0.1];

		//player as zed enabled?
		DZE_PlayerZed = false;

		//self bloodbabg enabbled?
		DZE_SelfTransfuse = true;
		//deprecated
		DZE_selfTransfuse_Values = [12000, 5, 120];

		//Loadscreen Timeout Length (Seconds) (Default: 120)
		P2DZ_LoadingTimeOut = 30;

		//Allow force save option
		DZE_AllowForceSave = false;

		//Allow cargo check option
		DZE_AllowCargoCheck = true;

		//Force name tags on?
		DZE_ForceNameTags = false;

		//force name tags off?
		DZE_ForceNameTagsOff = false;

		//force name tags in trader?
		DZE_ForceNameTagsInTrader = false;

		//enable halo jump from heli?
		DZE_HaloJump = true;

		//enable gear weight system?
		DZE_R3F_WEIGHT = false;

		//how often should we save the char
		DZE_SaveTime = 30;

	};

/*---------------------------------------------------------------------------
Loot & Zombie & Animal Settings
---------------------------------------------------------------------------*/
	P2DZ_lootCheck_centerPoint = [0,0,0];	//Center point for where the 'improved' loot should spawn (type: position array)
	P2DZ_lootCheck_radius = 10000;			//Radius for this dome for the size of the imrpoved loot zone (type: number, meters)

	//Pistols List (Pistols listed here will spawn 4 - 8 mags)
	P2DZ_pistolList = ["Makarov","MakarovSD","M9","Colt1911","revolver_EP1","revolver_gold_EP1","glock17_EP1","M9SD","MakarovSD","Sa61_EP1","UZI_EP1","UZI_SD_EP1"];

	//how long after a building has bbeen looted can it respawn loot?
	DZE_LootSpawnTimer = 10;

	//use loot tables from mission file?
	DZE_MissionLootTable = true;

	// max quantity of Man models (player || Z, dead || alive) around players. Below this limit we can spawn Z 
	// max quantity of loot piles around players. Below this limit we can spawn some loot
	dayz_maxMaxModels = 120; 

	// radius around player where we can spawn loot & Z
	dayz_spawnArea = 200; 

	// Z & loot, further than this distance from its "owner", will be deleted
	dayz_canDelete = 300; 

	//Maximum zeds 
	dayz_maxZeds = 200;

	//Zombie target distance settings
	dayz_zombieTargetList = [
		["SoldierWB",35],
		["Air",200],
		["LandVehicle",100]
	];

	//tame dogs
	dayz_tameDogs = true;

	//Distance around players where we can spawn animals
	dayz_animalDistance = 200;

	//Distance around player where we can spawn zeds
	dayz_zSpawnDistance = 300;

	//Max animals on client
	dayz_maxAnimals = 1;

	//Zombie eye vision angle
	p2_zEyeAngle = 10;

	//Zombie attack speed, 1 = default (fast)
	p2_zAttackSpeed = 1;

	if(!isDedicated || hasInterface) then {

		//loot and zed spawn delay settings
		dayz_spawnDelay =		120;
		dayz_spawnWait =		-120;
		dayz_lootDelay =		3;
		dayz_lootWait =			-300;

		//Max global zeds
		dayz_maxGlobalZeds = 3000;

		//Maximum zeds (client-side)
		dayz_maxLocalZombies = 15;

		// max quantity of Z controlled by local gameclient, used by player_spawnCheck. Below this limit we can spawn Z
		dayz_maxNearByZombies = 60; 

		//Maximum global zombies per 400m
		dayz_maxGlobalZombiesInit = 15;

		//Increase global zombies by this much for each additional player within 400m 
		dayz_maxGlobalZombiesIncrease = 5;

		//Do zeds attack vehicles?
		dayz_zedsAttackVehicles = false;

		//how many zombies should we spawn for people in vehicles?
		dayz_zedSpawnVehCount = dayz_maxLocalZombies / 2;

		//how many zombies for people in air vehicles?
		dayz_spawnAirCount = 0;
	};

/*---------------------------------------------------------------------------
Base Settings
---------------------------------------------------------------------------*/

	//per player built item limit
	DZE_BuildingLimit = 300;

	//How fast can people build things? lower = faster, integers only
	DZE_StaticConstructionCount = 1;

	//enable god mode at plot poles
	DZE_GodModeBase = false;

	//allow friendly tagged players to build, and also save last 5 tagged players with char
	DZE_FriendlySaving = true;

	//allow building on roads with true, disallow with false
	DZE_BuildOnRoads = false;

	//plot dimensions, plot radius, plot exclusion zone for other plots
	DZE_PlotPole = [55,65];

	//plot maintenance area effect dimensions
	DZE_maintainRange = ((DZE_PlotPole select 0)+20);

	//damage needed before maint option appears
	DZE_DamageBeforeMaint = 0.09;


/*---------------------------------------------------------------------------
Trader Settings
---------------------------------------------------------------------------*/

	//trader config mode, true = non-database method!
	DZE_ConfigTrader = false;

	//trader sell distances
	dayz_sellDistance_vehicle = 10;
	dayz_sellDistance_boat = 30;
	dayz_sellDistance_air = 40;

	//spawn purchased vehicle in with parachute?
	DZE_TRADER_SPAWNMODE = false;

/*---------------------------------------------------------------------------
Gold Settings
---------------------------------------------------------------------------*/
P2DZE_goldItemHandlingDebug = true; 	//enable debug messages
P2DZE_Gold_MaxPickup = 	(500 * 1000);	//max gold pickup (500k)
P2DZE_goldRunning = false;
/*---------------------------------------------------------------------------
Misc Settings
---------------------------------------------------------------------------*/
	P2DZE_hasGold = false;			// - gets modified by checkGoldItems & pickupgold & dropgold
	P2DZE_gearOnContainer = false; // - gets modified in object_monitorGear.sqf
	P2DZE_gearOnWeaponHolder = false; // - gets modified in object_monitorGear.sqf

	s_player_takeGold = -1;
	MaxVehicleLimit = 5000; // Default = 50
	MaxDynamicDebris = 50; // Default = 100

	DynamicVehicleDamageLow = 		0; // Default: 0
	DynamicVehicleDamageHigh = 		0; // Default: 100
	DynamicVehicleFuelHigh	= 		15;
	DynamicVehicleFuelLow =			0;
	MaxAmmoBoxes = 100;
	MaxMineVeins = 25;

	// epoch Heli lifting
	DZE_HeliLift = false;

	//Map size for saving to database
	dayz_minpos = -1; 
	dayz_maxpos = 16000;
	dayz_MapArea = 14000; // Default = 10000

	//DayZ settings
	dayz_dawn = 6;
	dayz_dusk = 18;

	if(isServer && !hasInterface) then {
		//full moon nights
		dayz_fullMoonNights = false;
		//dayz epoch death messages
		DZE_DeathMsgGlobal = false;
		DZE_DeathMsgTitleText = false;
		DZE_DeathMsgSide = false;
		OldHeliCrash = true;
	};


	P2DZ_dbCurMode = 1;
	P2DZ_debugMonitor = false;
	//leave as false
	P2DZE_hasLanded = false;
	P2DZE_paraOpened = false;
	//leave as -1
	P2DZE_HaloReSpawnAction = -1;

/*---------------------------------------------------------------------------
							Skin Level Configuration
---------------------------------------------------------------------------*/

//survivor skin list (picks at random for freshspawns)
p2_survivorSkins_male = ["Survivor2_DZ"];
p2_survivorSkins_female = ["SurvivorW3_DZ","SurvivorW2_DZ","SurvivorWpink_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ"];

//enable humanity based skins?
p2_humanityLevelsEnabled = true;

//list of all skins used by humanity system for male/female characters
p2_humanitySkinsMale = ["Survivor2_DZ","Bandit1_DZ","Bandit2_DZ","Survivor3_DZ","TK_INS_Warlord_EP1_DZ","Ins_Soldier_GL_DZ","INS_Lopotev_DZ"];
p2_humanitySkinsFemale = ["SurvivorW2_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","BanditW1_DZ","BanditW2_DZ"];


/*---------------------------------------------------------------------------
							Functions
---------------------------------------------------------------------------*/

/* KillzoneKid's More Accurate Distance Function 
Source: http://killzonekid.com/arma-scripting-tutorials-distance/	*/

KK_fnc_distanceASL = {
    private ["_v0","_v1"];
    _v0 = _this select 0;
    _v1 = _this select 1;
    sqrt (
        ((_v0 select 0) - (_v1 select 0)) ^ 2 + 
        ((_v0 select 1) - (_v1 select 1)) ^ 2 + 
        ((_v0 select 2) - (_v1 select 2)) ^ 2
    )
};

/*---------------------------------------------------------------------------
Function: Checks if a players skin should be upgraded/downgraded depending
on humanity. Only happens if player is wearing level-based clothing.

This prevents players from wearing these skins if they are not the appropriate
level or class.
---------------------------------------------------------------------------*/
p2_fnc_skinLvlCheck = {
	private["_humanity","_model","_canChange","_sexy"];
	if !(p2_humanityLevelsEnabled) exitWith { };
	_model = _this select 0;
	_humanity = _this select 1;

	diag_log("P2DEBUG: fnc_skinLvlCheck: " + str(_this));

	//	-	Check if player is in class-based clothing
	// Check if player is a man
	if (_model in p2_humanitySkinsMale) then {
		_canChange = true;
		_sexy = false;

	};

	// Check if player is a woman
	if (_model in p2_humanitySkinsFemale) then {
		_canChange = true;
		_sexy = true;
	};

	// If player is in class-based clothing
	if (_canChange) then {

			//level 1 hero
			if (_humanity > 5000) then 
			{
				if (_sexy) then {
					_model = "SurvivorW3_DZ";
				} else {
					_model = "Survivor3_DZ";
				};
			};

			//bandit level 1
			if (_humanity < -5000) then 
			{
				if (_sexy) then {
					_model = "BanditW2_DZ";
				} else {
					_model = "Bandit1_DZ";
				};
			};
			//bandit level 2
			if (_humanity < -10000) then 
			{
				_model = "Bandit2_DZ";
			};
			//bandit level 3
			if (_humanity < -15000) then 
			{
				_model = "TK_INS_Warlord_EP1_DZ";
			};
			//bandit level 4
			if (_humanity < -20000) then 
			{
				_model = "Ins_Soldier_GL_DZ";
			};
			//bandit level 5
			if (_humanity < -25000) then 
			{
				_model = "INS_Lopotev_DZ";
			};


		diag_log("P2DEBUG: fnc_skinLvlCheck: finalModel: " + str(_model));

		// Set players skin
		_model spawn player_switchModel;
	};

};
