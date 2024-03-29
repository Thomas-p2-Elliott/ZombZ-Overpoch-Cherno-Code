/*---------------------------------------------------------------------------
Server Settings
---------------------------------------------------------------------------*/
if (isDedicated && !hasInterface || isServer) then {
	//enable antihack on test server?
	AHe = 									false;
	//enable object streaming from db?
	P2DZE_serverStreamObjsEnabled = 		true;

	//enable custom hive dll debugging
	P2D_H = 								false;
	P2D_Hp = 								"P2DEBUG: HIVE DEBUG: ";

	//enable ASM for Server
	P2DZ_ASM_Enabled = false;

	//enable backpack gaurd
	DZE_BackpackGuard = true;

	//enable static veh spawns
	DZE_FS_UseStaticVehicleSpawn = true;

	//gold settings
	P2DZ_giveNewSpawnsGold = true;		//server side var - give freshspawns gold? true/false
	P2DZ_newSpawnGoldAmount = 5;		//new spawn gold amount
	P2DZE_Gold_MaxPickup = 	(500 * 1000);	//max gold pickup (500k) - UNUSED FOR NOW

	//Misc Map Spawn Settings
	MaxDynamicDebris = 50;
	MaxAmmoBoxes = 0;
	MaxMineVeins = 0;

	//Vehicle Spawn Damage & Fuel Settings
	DynamicVehicleDamageLow = 		0; // Default: 0
	DynamicVehicleDamageHigh = 		0; // Default: 100
	DynamicVehicleFuelHigh	= 		15;
	DynamicVehicleFuelLow =			0;

	//debug server player sync
	P2DZE_debugServerPlayerSync = false;

	//debug safe zone cleanup
	P2DZE_safeZoneCleanupDebug = false;

	//debug crashsites
	P2DZE_debugCrashSites = false;

	//enable debug output for static vehicle spawns?
	P2DZ_Debug_StaticVehSpawns = false;

	//enable mapp markers for static veh spawned (only first player in can see)
	P2DZ_staticSpawnMarkers = false;

	//Static vehicle spawns duplicate vehicle distance check (meters)
	P2DZ_StaticVehSpawns_DupeDistanceCheck = 7.5;

	//Static vehicle spawns - max failures at spawning each vehicle at random pos
	P2DZ_maxVehSpawnAttempts = 10;

	AllPlayers = ["Survivor2_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWsequishaD_DZ","SurvivorWsequisha_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","SurvivorW2_DZ","Bandit1_DZ","Bandit2_DZ","BanditW1_DZ","BanditW2_DZ","Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","Priest_DZ","Functionary1_EP1_DZ","GUE_Commander_DZ","Ins_Soldier_GL_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ","pz_policeman","pz_suit1","pz_suit2","pz_worker1","pz_worker2","pz_worker3","pz_doctor","pz_teacher","pz_hunter","pz_villager1","pz_villager2","pz_villager3","pz_priest","Soldier_TL_PMC_DZ","Soldier_Sniper_PMC_DZ","Soldier_Bodyguard_AA12_PMC_DZ","Drake_Light_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_CO_DZ","GUE_Soldier_2_DZ","TK_Special_Forces_MG_EP1_DZ","TK_Soldier_Sniper_EP1_DZ","TK_Commander_EP1_DZ","RU_Soldier_Crew_DZ","INS_Lopotev_DZ","INS_Soldier_AR_DZ","INS_Soldier_CO_DZ","INS_Bardak_DZ","INS_Worker2_DZ"];

	DZE_safeVehicle = ["ParachuteWest","ParachuteC"];

	//full moon nights
	dayz_fullMoonNights = false;
	//dayz epoch death messages
	DZE_DeathMsgGlobal = false;
	DZE_DeathMsgTitleText = false;
	DZE_DeathMsgSide = false;
	OldHeliCrash = true;

	//HashId System
	_null = [] execVM "\z\addons\dayz_server\hashId.sqf";

	P2DZ_newSpawnsNeedingGold = [];
};

