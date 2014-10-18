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
	p2SpT = false;

	//epoch debugging
	DZEdebug = TRUE;

	//define rate of fps deugging
	DZE_DiagFpsSlow = false;
	DZE_DiagFpsFast = false;
	//enable full FPS output
	DZE_DiagVerbose = false;

	//epoch damage debugging
	DZE_Debug_Damage = false;

	//fn_selfActions.sqf
	P2DZE_debugSelfActions = false;

	P2DZE_debugLogin = true;

	//vehicleinspect.sqf
	P2DZE_deugVehIns = false;

	//fn_lootCheck.sqf
	P2DZ_lootCheck_debug = false;	

	//fnc_debugMon.sqf
	P2DZE_debugColoutput = false;

	P2DZE_debugLoot = false;

	P2DZE_debugHumanity = true;

	//debug freshspawn loadouts
	P2DZE_loadoutsDebug = false;

	P2DZE_goldItemHandlingDebug = false; 

	if(isServer) then {
		//debug server player sync
		P2DZE_debugServerPlayerSync = true;

		//debug safe zone cleanup
		P2DZE_safeZoneCleanupDebug = false;

		//debug crashsites
		P2DZE_debugCrashSites = false;
	};

/*---------------------------------------------------------------------------
Player/Spawn Settings
---------------------------------------------------------------------------*/

	// DayZ Epoch config
	spawnShoremode = 1; // Default = 1 (on shore)
	dayz_spawnselection = 1; // Spawn selection screen
	spawnArea= 1500; // Default = 1500

	//parachute spawn (keep disabled, deprecated)
	dayz_paraSpawn = false;

	//nametag distance
	DZE_HumanityTargetDistance = 0;

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
		//use dark ui?
		Dayz_Dark_UI = false;

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
		DZE_ForceNameTagsOff = true;

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
Building Settings
---------------------------------------------------------------------------*/
	DayZ_UseSteamID = true;
	DZE_modularBuild = true;
	DZE_snapExtraRange = 5;
	DZE_APlotforLife = true;
	DZE_PlotOwnership = true;
	DZE_checkNearbyRadius = 30;
	DZE_plotTakeOwnershipItems = dayz_allowedObjects - (DZE_LockableStorage + ["Plastic_Pole_EP1_DZ","TentStorage","TentStorageDomed","TentStorageDomed2"]);

	/**DoorManagement Config**/
	AllowManualCode = true;// 2 reason| 1: Allows breaking codes (if 2nd config = false and code = 3 digits) | 2: Friends can access access not owned doors until owner gets on.
	HarderPenalty = true;// Cen's Penalty: Flashes screen white. And kicks player to lobby if failed more then (random number between 4 and 14) times.
	// AllowUncrackableCode = false; // in next release: if set to true, player can change code to more then 4 digits, The manualCode will always fail when he does. THIS is for AntiCodeCrack servers that allow Manual Code for people that like that system.
	// in next release. AllowManualCode will allow players to change the code in the DoorManagement Menu.
	/**DoorManagement Config END**/
	DZE_DoorsLocked = ["Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallDoorLocked_DZ","CinderWallDoorSmallLocked_DZ"];


/*---------------------------------------------------------------------------
Loot & Zombie & Animal Settings
---------------------------------------------------------------------------*/
	P2DZ_lootCheck_centerPoint = [0,0,0];	//Center point for where the 'improved' loot should spawn (type: position array)
	P2DZ_lootCheck_radius = 10000;			//Radius for this dome for the size of the imrpoved loot zone (type: number, meters)
	P2DZ_lootCheck_enabled = false;
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
	p2_zEyeAngle = 15;

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

	//plot dimensions / plot radius, plot exclusion zone for other plots
	DZE_PlotPole = [55,65];

	//plot maintenance area effect dimensions
	DZE_maintainRange = ((DZE_PlotPole select 0)+20);

	//damage needed before maint option appears
	DZE_DamageBeforeMaint = 0.09;


/*---------------------------------------------------------------------------
Trader Settings
---------------------------------------------------------------------------*/

	//trader config mode, true = non-database method!
	DZE_ConfigTrader = true;

	//trader sell distances
	dayz_sellDistance_vehicle = 10;
	dayz_sellDistance_boat = 30;
	dayz_sellDistance_air = 40;

	//spawn purchased vehicle in with parachute?
	DZE_TRADER_SPAWNMODE = false;

/*---------------------------------------------------------------------------
Gold Settings
---------------------------------------------------------------------------*/
	P2DZE_Gold_MaxPickup = 	(500 * 1000);	//max gold pickup (500k)
	P2DZE_goldRunning = false;
	P2DZE_hasGold = false;			// - gets modified by checkGoldItems & pickupgold & dropgold
	P2DZE_gearOnContainer = false; // - gets modified in object_monitorGear.sqf
	P2DZE_gearOnWeaponHolder = false; // - gets modified in object_monitorGear.sqf
	s_player_takeGold = -1;
/*---------------------------------------------------------------------------
Misc Settings
---------------------------------------------------------------------------*/
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

	P2DZ_debugMonSleep = 0.667;
	P2DZ_debugSliderRange = 100;
	P2DZ_dbCurMode = 1;
	P2DZ_debugMonitor = false;
	//leave as false
	P2DZE_hasLanded = false;
	P2DZE_paraOpened = false;
	//leave as -1
	P2DZE_HaloReSpawnAction = -1;
	P2DZE_removeExtra_lastRunTime = 0;
	P2DZE_goldDropUIFirstRun = true;
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
Painting Settings
---------------------------------------------------------------------------*/
ColourVehicles = [
	//Air Vehicles
	"Mi17_Ins",
	"Mi17_Civilian",
	"Mi17_CDF",
	"UH60M_EP1_DZE",
	"GNT_C185C",
	"GNT_C185T",
	"Mi17_medevac_Ins",
	"GNT_C185E",
	"GNT_C185F",
	"GNT_C185U",
	"GNT_C185R",
	"GNT_C185",
	"ori_pragaCopter_green",
	"ori_pragaCopter_yellow",
	"Mi17_medevac_CDF",
	"UH60M_EP1_DZ",
	"Mi17_Ins",
	"Mi17_Civilian",
	"Mi17_CDF",
	"UH60M_EP1_DZE",
	"GNT_C185C",
	"GNT_C185T",
	"Mi17_medevac_Ins",
	"GNT_C185E",
	"GNT_C185F",
	"GNT_C185U",
	"GNT_C185R",
	"GNT_C185",
	"ori_pragaCopter_green",
	"ori_pragaCopter_yellow",
	"Mi17_medevac_CDF",
	"UH60M_EP1_DZ",
	"UH60M_EP1_DZ",
	"C130J_US_EP1_DZ",
	"AH6X_DZ",
	"MH6J_DZ",
	"Mi17_Civilian_DZ",
	"UH60M_EP1_DZE",
	"AH6J_EP1_DZE",
	"AH6J_EP1_DZ",
	"An2_2_TK_CIV_EP1",
	"Su39",
	"AH6X_EP1",
	"Ka52Black",
	"MH6J_EP1",
	"An2_1_TK_CIV_EP1",
	"C130J",
	"Su25_Ins",
	"Ka52",
	"AH6J_EP1",
	"Mi17_UN_CDF_EP1",
	"UH60M_MEV_EP1",
	"UH60M_EP1",
	"UH1H_TK_EP1",
	"Mi171Sh_rockets_CZ_EP1",
	"Mi17_TK_EP1",
	"pook_H13_civ_white",
	"pook_H13_civ_ru_white",
	"pook_H13_medevac_CDF",
	"pook_H13_medevac_INS",
	"pook_H13_medevac_GUE",
	"pook_H13_amphib",
	"pook_H13_amphib_GUE",
	"pook_H13_amphib_CIV",
	"pook_H13_gunship_CDF",
	"pook_H13_gunship_GUE",
	"pook_H13_transport_GUE",
	"pook_H13_civ_black",
	"pook_H13_medevac_CIV",
	"pook_H13_amphib_CIV_RU",
	"pook_H13_gunship_UNO",
	"pook_H13_transport_TAK",
	"pook_H13_transport_INS",
	"pook_H13_civ_yellow",
	"pook_H13_transport",
	"pook_H13_civ",
	"pook_H13_civ_ru_slate",
	"pook_H13_transport_CDF",
	"pook_H13_transport_UNO",
	"pook_H13_amphib_UNO",
	"pook_H13_amphib_TAK",
	"pook_H13_amphib_PMC",
	"pook_H13_civ_ru_yellow",
	"pook_H13_gunship",
	"pook_H13_gunship_TAK",
	"pook_H13_medevac",
	"pook_H13_medevac_UNO",
	"pook_H13_medevac_TAK",
	"pook_H13_medevac_CIV_RU",
	"pook_H13_medevac_PMC",
	"pook_H13_amphib_CDF",
	"pook_H13_amphib_INS",
	"pook_H13_gunship_PMC",
	"pook_H13_gunship_INS",
	"pook_H13_transport_PMC",
	"pook_H13_civ_slate",
	"pook_H13_civ_ru",
	"pook_H13_civ_ru_black",
	//Land Vehicles
	"ZSU_INS",
	"BMP2_Ambul_CDF",
	"BMP2_HQ_INS",
	"BMP2_HQ_CDF",
	"BMP2_Ambul_INS",
	"BMP2_CDF",
	"BMP2_Gue",
	"BMP2_INS",
	"car_sedan",
	"Ural_ZU23_INS",
	"Ural_ZU23_Gue",
	"UralRefuel_INS",
	"BRDM2_Gue",
	"BRDM2_ATGM_CDF",
	"UAZ_INS",
	"UAZ_RU",
	"car_hatchback",
	"GLT_M300_LT",
	"GLT_M300_ST",
	"ori_ScrapBuggy",
	"Ural_ZU23_CDF",
	"Ural_INS",
	"Ural_CDF",
	"UralOpen_CDF",
	"UralOpen_INS",
	"UralCivil",
	"UralCivil2",
	"UralRefuel_CDF",
	"UralRepair_CDF",
	"UralRepair_INS",
	"UralReammo_CDF",
	"UralReammo_INS",
	"BRDM2_HQ_Gue",
	"BRDM2_CDF",
	"BRDM2_INS",
	"BRDM2_ATGM_INS",
	"HMMWV",
	"HMMWV_M2",
	"HMMWV_TOW",
	"HMMWV_MK19",
	"UAZ_CDF",
	"Offroad_DSHKM_INS",
	"Pickup_PK_GUE",
	"UAZ_MG_CDF",
	"UAZ_MG_INS",
	"UAZ_AGS30_RU",
	"UAZ_AGS30_CDF",
	"UAZ_AGS30_INS",
	"hilux1_civil_1_open",
	"Offroad_SPG9_Gue",
	"datsun1_civil_1_open",
	"UAZ_SPG9_INS",
	"Skoda",
	"Pickup_PK_INS",
	"Offroad_DSHKM_Gue",
	"HMMWV_Ambulance_DES_EP1",
	"UralSalvage_TK_EP1",
	"Offroad_DSHKM_TK_GUE_EP1",
	"Offroad_SPG9_TK_GUE_EP1",
	"HMMWV_MK19_DES_EP1",
	"TT650_TK_CIV_EP1",
	"MtvrReammo_DES_EP1",
	"UAZ_AGS30_TK_EP1",
	"UAZ_Unarmed_UN_EP1",
	"Ural_UN_EP1",
	"UralRepair_TK_EP1",
	"HMMWV_Ambulance_CZ_DES_EP1",
	"HMMWV_Avenger_DES_EP1",
	"M1030_US_DES_EP1",
	"MtvrSupply_DES_EP1",
	"Lada1_TK_CIV_EP1",
	"AAV",
	"Ikarus",
	"Ural_ZU23_TK_EP1",
	"Ural_ZU23_TK_GUE_EP1",
	"LAV25_HQ",
	"V3S_Gue",
	"V3S_Civ",
	"Kamaz",
	"HMMWV_Avenger",
	"Ural_TK_CIV_EP1",
	"UralSupply_TK_EP1",
	"MTVR",
	"LAV25",
	"KamazReammo",
	"KamazRepair",
	"KamazRefuel",
	"UralRefuel_TK_EP1",
	"UralReammo_TK_EP1",
	"MtvrRefuel",
	"MtvrReammo",
	"MtvrRepair",
	"HMMWV_Armored",
	"UAZ_Unarmed_TK_CIV_EP1",
	"UAZ_Unarmed_TK_EP1",
	"HMMWV_Ambulance",
	"Pickup_PK_TK_GUE_EP1",
	"UAZ_MG_TK_EP1",
	"Lada2",
	"VWGolf",
	"M1030",
	"TT650_TK_EP1",
	"TT650_Gue",
	"TT650_Civ",
	"TT650_Ins",
	"MMT_Civ",
	"MtvrRepair_DES_EP1",
	"MtvrSalvage_DES_EP1",
	"HMMWV_DES_EP1",
	"MTVR_DES_EP1",
	"MtvrRefuel_DES_EP1",
	"Lada2_TK_CIV_EP1",
	"Pickup_PK_INS_DZE4",
	"Pickup_PK_INS_DZE2",
	"Offroad_DSHKM_Gue_DZE",
	"Offroad_DSHKM_Gue_DZE2",
	"M1126_ICV_mk19_EP1",
	"M1130_CV_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZ",
	"SUV_TK_CIV_EP1",
	"SUV_TK_EP1",
	"BTR40_MG_TK_INS_EP1",
	"Offroad_DSHKM_Gue_DZ",
	"Offroad_DSHKM_Gue_DZE3",
	"ori_transit",
	"Pickup_PK_INS_DZE1",
	"Pickup_PK_GUE_DZE4",
	"Pickup_PK_GUE_DZE",
	"Pickup_PK_TK_GUE_EP1_DZE",
	"VolhaLimo_TK_CIV_EP1",
	"ori_poldek",
	"ori_titanic",
	"ori_survivorBus",
	"Ikarus_TK_CIV_EP1",
	"M1126_ICV_M2_EP1",
	"M1129_MC_EP1",
	"M1128_MGS_EP1",
	"GRAD_TK_EP1",
	"BRDM2_HQ_TK_GUE_EP1",
	"BRDM2_TK_EP1",
	"BRDM2_TK_GUE_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
	"BRDM2_ATGM_TK_EP1",
	"HMMWV_M998A2_SOV_DES_EP1_DZE",
	"SUV_PMC",
	"SUV_UN_EP1",
	"BTR40_MG_TK_GUE_EP1",
	"BTR40_TK_INS_EP1",
	"BTR40_TK_GUE_EP1",
	"Pickup_PK_INS_DZE3",
	"Pickup_PK_TK_GUE_EP1_DZE4",
	"Pickup_PK_GUE_DZ",
	"Pickup_PK_TK_GUE_EP1_DZE2",
	"HMMWV_M1035_DES_EP1",
	"hilux1_civil_3_open_EP1",
	"S1203_ambulance_EP1",
	"S1203_TK_CIV_EP1",
	"ori_vil_lada_2105_rust",
	"ori_poldek_black",
	"Old_moto_TK_Civ_EP1",
	"ATV_US_EP1",
	"ATV_CZ_EP1",
	"Old_bike_TK_INS_EP1",
	"HMMWV_M998A2_SOV_DES_EP1_DZ",
	"UAZ_MG_TK_EP1_DZE",
	"Pickup_PK_TK_GUE_EP1_DZ",
	"Pickup_PK_TK_GUE_EP1_DZE1",
	"Pickup_PK_GUE_DZE2",
	"Offroad_DSHKM_Gue_DZE1",
	"M1135_ATGMV_EP1",
	"M1133_MEV_EP1",
	"ori_vil_originsmod_truck_civ",
	"HMMWV_DZ",
	"SUV_Special",
	"Offroad_DSHKM_Gue_DZE4",
	"ori_vil_originsmod_lublin_truck",
	"Pickup_PK_INS_DZ",
	"Pickup_PK_GUE_DZE1",
	"Pickup_PK_GUE_DZE3",
	"Pickup_PK_TK_GUE_EP1_DZE3",
	"UAZ_MG_TK_EP1_DZ",
	"Volha_2_TK_CIV_EP1",
	"BTR90_DZE",
	"UralCivil2_DZE",
	"LAV25_DZE",
	"LAV25_DZ",
	"UAZ_RU_DZE3",
	"UAZ_INS_DZE3",
	"UAZ_CDF_DZE2",
	"UAZ_RU_DZE1",
	"UAZ_CDF_DZE1",
	"hilux1_civil_1_open_DZE3",
	"hilux1_civil_1_open_DZE2",
	"hilux1_civil_1_open_DZE",
	"car_sedan_DZE1",
	"car_sedan_DZE2",
	"datsun1_civil_1_open_DZE2",
	"datsun1_civil_1_open_DZE4",
	"car_hatchback_DZE3",
	"Lada2_DZE2",
	"Lada2_DZE1",
	"Lada2_TK_CIV_EP1_DZE2",
	"Lada2_TK_CIV_EP1_DZE4",
	"VolhaLimo_TK_CIV_EP1_DZE3",
	"VolhaLimo_TK_CIV_EP1_DZE4",
	"VWGolf_DZE1",
	"Skoda_DZE2",
	"BTR90_HQ_DZ",
	"BTR90_HQ_DZE",
	"LAV25_HQ_DZ",
	"BTR90_DZ",
	"UralCivil_DZE",
	"V3S_RA_TK_GUE_EP1_DZE",
	"MtvrRefuel_DES_EP1_DZ",
	"UAZ_Unarmed_TK_EP1_DZE3",
	"UAZ_INS_DZE1",
	"UAZ_Unarmed_UN_EP1_DZE4",
	"UAZ_Unarmed_TK_CIV_EP1_DZE4",
	"UAZ_Unarmed_TK_CIV_EP1_DZE3",
	"UAZ_Unarmed_TK_EP1_DZE1",
	"UAZ_RU_DZE4",
	"UAZ_INS_DZE2",
	"UAZ_Unarmed_TK_CIV_EP1_DZE1",
	"hilux1_civil_1_open_DZE1",
	"car_sedan_DZE4",
	"datsun1_civil_1_open_DZE3",
	"datsun1_civil_1_open_DZE",
	"car_hatchback_DZE1",
	"car_hatchback_DZE3",
	"Lada2_DZE4",
	"Volha_2_TK_CIV_EP1_DZE2",
	"Volha_2_TK_CIV_EP1_DZE3",
	"Volha_2_TK_CIV_EP1_DZE1",
	"Skoda_DZE1",
	"KamazOpen_DZE",
	"V3S_Refuel_TK_GUE_EP1",
	"UAZ_Unarmed_TK_EP1_DZE4",
	"UAZ_Unarmed_UN_EP1_DZE3",
	"UAZ_INS_DZE4",
	"UAZ_CDF_DZE4",
	"UAZ_Unarmed_UN_EP1_DZE2",
	"UAZ_Unarmed_TK_EP1_DZE2",
	"car_hatchback_DZE2",
	"Lada1_TK_CIV_EP1_DZE4",
	"Lada1_TK_CIV_EP1_DZE1",
	"Lada2_TK_CIV_EP1_DZE3",
	"Lada2_DZE3",
	"VolhaLimo_TK_CIV_EP1_DZE3",
	"VolhaLimo_TK_CIV_EP1_DZE2",
	"VWGolf_DZE3",
	"Skoda_DZE3",
	"LAV25_HQ_DZE",
	"UAZ_Unarmed_UN_EP1_DZE2",
	"UAZ_Unarmed_UN_EP1_DZE1",
	"UAZ_CDF_DZE3",
	"UAZ_RU_DZE2",
	"hilux1_civil_1_open_DZE4",
	"car_sedan_DZE3",
	"datsun1_civil_1_open_DZE1",
	"car_hatchback_DZE4",
	"Lada2_TK_CIV_EP1_DZE1",
	"Lada1_TK_CIV_EP1_DZE2",
	"Lada1_TK_CIV_EP1_DZE3",
	"VolhaLimo_TK_CIV_EP1_DZE1",
	"Volha_2_TK_CIV_EP1_DZE4",
	"VWGolf_DZE2",
	"VWGolf_DZE4",
	"Skoda_DZE4",
	"M1A2_US_TUSK_MG_EP1",
	"WarfareSalvageTruck_RU",
	"WarfareRepairTruck_Gue",
	"V3S_TK_GUE_EP1",
	"BMP2_UN_EP1",
	"WarfareSalvageTruck_Gue",
	"WarfareSalvageTruck_USMC",
	"WarfareReammoTruck_CDF",
	"M113_UN_EP1_DZ",
	"M113_TK_EP1",
	"M113Ambul_UN_EP1",
	"SUV_Orange_DZE1",
	"SUV_Red_DZE2",
	"SUV_Yellow",
	"SUV_Charcoal_DZE3",
	"SUV_Camo",
	"SUV_White_DZE4",
	"SUV_Silver_DZE4",
	"SUV_TK_CIV_EP1_DZE2",
	"SUV_Charcoal_DZE2",
	"SUV_Yellow_DZE1",
	"SUV_Green_DZE1",
	"SUV_Camo_DZE1",
	"SUV_Orange",
	"SUV_Pink",
	"SUV_White",
	"SUV_Red",
	"SUV_Yellow_DZE3",
	"SUV_Orange_DZE2",
	"SUV_Silver_DZE2",
	"SUV_PMC_BAF",
	"SUV_TK_CIV_EP1_DZE3",
	"SUV_Silver_DZE3",
	"BAF_ATV_D",
	"T72_TK_EP1",
	"T34_TK_EP1",
	"WarfareSupplyTruck_CDF",
	"WarfareSupplyTruck_Gue",
	"WarfareSalvageTruck_INS",
	"WarfareReammoTruck_RU",
	"V3S_Salvage_TK_GUE_EP1",
	"WarfareReammoTruck_USMC",
	"SUV_Green_DZE2",
	"SUV_TK_CIV_EP1_DZE4",
	"SUV_Red_DZE3",
	"SUV_White_DZE2",
	"SUV_Pink_DZE4",
	"SUV_Green_DZE4",
	"SUV_Pink_DZE1",
	"SUV_White_DZE1",
	"SUV_Blue_DZE4",
	"BMP2_HQ_TK_EP1",
	"M1A1_US_DES_EP1",
	"BMP2_TK_EP1",
	"WarfareSupplyTruck_RU",
	"WarfareSupplyTruck_INS",
	"WarfareSupplyTruck_USMC",
	"V3S_Reammo_TK_GUE_EP1",
	"M113_UN_EP1",
	"M113_UN_EP1_DZE",
	"M113_TK_EP1_DZ",
	"SUV_Camo_DZE4",
	"SUV_Red_DZE4",
	"SUV_Pink_DZE3",
	"SUV_Green_DZE3",
	"SUV_Orange_DZE4",
	"SUV_Red_DZE1",
	"SUV_Camo_DZE3",
	"SUV_Blue_DZE2",
	"SUV_Camo_DZE2",
	"SUV_Charcoal_DZE1",
	"SUV_White_DZE3",
	"SUV_TK_CIV_EP1_DZE1",
	"SUV_Silver",
	"SUV_Charcoal",
	"SUV_Green",
	"SUV_Blue",
	"T55_TK_GUE_EP1",
	"V3S_Open_TK_CIV_EP1",
	"V3S_TK_GUE_EP1",
	"V3S_Supply_TK_GUE_EP1",
	"WarfareSalvageTruck_CDF",
	"WarfareReammoTruck_Gue",
	"WarfareReammoTruck_INS",
	"M113_UN_EP1_DZE",
	"M113_TK_EP1_DZE",
	"M113Ambul_TK_EP1",
	"SUV_Orange_DZE3",
	"SUV_Charcoal_DZE4",
	"SUV_Blue_DZE3",
	"SUV_Pink_DZE2",
	"SUV_Yellow_DZE2",
	"SUV_Silver_DZE1",
	"SUV_Blue_DZE1",
	"SUV_Yellow_DZE4",
	"BAF_ATV_W" ,
	//Sea Vehicles
	"JetSkiYanahui_Yellow",
	"JetSkiYanahui_Red",
	"JetSkiYanahui_Blue",
	"JetSkiYanahui_Green"
];


/*---------------------------------------------------------------------------
Executions
---------------------------------------------------------------------------*/
//init global arrays for Loot Chances
call compile preprocessFileLineNumbers "init\loot_init.sqf";

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

	//diag_log("P2DEBUG: fnc_skinLvlCheck: " + str(_this));

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


		//diag_log("P2DEBUG: fnc_skinLvlCheck: finalModel: " + str(_model));

		// Set players skin
		_model spawn player_switchModel;
	};

};
