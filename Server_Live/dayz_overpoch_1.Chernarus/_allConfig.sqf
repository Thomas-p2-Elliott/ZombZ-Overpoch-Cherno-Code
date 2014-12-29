/*---------------------------------------------------------------------------
Global Settings - Client, Server, and Headless Client
---------------------------------------------------------------------------*/

//Instance Number used by the database
dayZ_instance =	11;		

//Set the server number - Used for gold logs
GORSYSERVERNUMBER = 1;

//Sets text in escape menu & Any non-gold Server Logs
P2DZ_serverName = "Test";

//Server notification file name
ZombZ_Notif_File_Name = "notification_op1";

//Spawn Location Settings
spawnShoremode = 1; 		// Default = 1 (on shore)
dayz_spawnselection = 1; 	// Enable Spawn selection screen
spawnArea= 750; 			// Default = 1500

//Map size for saving to database
dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_MapArea = 14000; // Default = 10000

//DayZ settings
dayz_dawn = 6;
dayz_dusk = 18;

//Amount of ammo for vehicles to have
DZE_vehicleAmmo = 0.2;

P2DZ_postVars = false; //early var

//Enable client antihack whitelist (development only, not for live use!)
P2DZ_clientAHWhitelistEnabled = 	false;

//Bad plot places
P2DZE_badPlotPlaces = [
	[6897.4219, 11429.939, 0], 
	[5935.0542, 5355.3545, 1.5258789e-005],
	[11256.908, 9892.2734, -3.8146973e-006],
	[13317.989, 12723.604, 1.5258789e-005],
	[7143.0352, 7209.0063, -3.0517578e-005], 
	[8871.6924, 8759.8994, -3.0517578e-005],
	[9179.6484, 9642.6465, 0.00015258789],
	[9770.8359, 10999.466, 7.6293945e-005],
	[9991.2637, 12358.043, 0],
	[7168.6616, 10378.236, 3.0517578e-005],
	[5267.0698, 11725.927, 0],
	[3874.012, 12074.601, -6.1035156e-005],
	[2246.4185, 11197.324, 0.00012207031],
	[5295.1411, 9639.2891, 0],
	[4825.2813, 10786.549, 0],
	[9186.5449, 7151.8335, 3.0517578e-005],
	[12068.737, 5884.4365, 6.1035156e-005],
	[11628.901, 4702.979, 4.5776367e-005],
	[8435.8506, 4414.5776, -9.1552734e-005],
	[6719.5049, 5021.0469, 0],
	[5385.2637, 5052.3374, 0.00021362305],
	[4552.0649, 3417.5769, -2.2888184e-005],
	[2358.7024, 3672.6147, 0],
	[5197.8809, 6910.9766, 6.1035156e-005],
	[5807.0044, 6050.1514, -1.5258789e-005],
	[7394.5854, 6512.0566, 1.5258789e-005],
	[7631.8462, 6671.0298, 3.0517578e-005]
];


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

//trader config mode, true = non-database method aka our method :D!
DZE_ConfigTrader = true;

//trader sell distances
dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

//spawn purchased vehicle in with parachute?
DZE_TRADER_SPAWNMODE = false;

/*---------------------------------------------------------------------------
Loot & Zombie & Animal Settings
---------------------------------------------------------------------------*/
P2DZ_lootCheck_centerPoint = [2677,11891,0];	//Center point for where the 'improved' loot should spawn (type: position array)
P2DZ_lootCheck_radius = 6100;			//Radius for this dome for the size of the imrpoved loot zone (type: number, meters)
P2DZ_lootCheck_enabled = true;	//enable lootcheck balancing system
//Pistols List (Pistols listed here will spawn 4 - 8 mags)
P2DZ_pistolList = ["Makarov","MakarovSD","M9","Colt1911","revolver_EP1","revolver_gold_EP1","glock17_EP1","M9SD","MakarovSD","Sa61_EP1","UZI_EP1","UZI_SD_EP1"];
MeleeWeapons = ["MeleeFishingPole","MeleeCrowbar","MeleeBaseBallBatNails","MeleeBaseBallBatBarbed","MeleeBaseBallBat","Crossbow_DZ","MeleeSledge","MeleeMachete","MeleeHatchet_DZE"];
MeleeWeaps = ["MeleeFishingPole","MeleeCrowbar","MeleeBaseBallBatNails","MeleeBaseBallBatBarbed","MeleeBaseBallBat","Crossbow_DZ","MeleeSledge","MeleeMachete","MeleeHatchet_DZE"];

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
dayz_tameDogs = false;

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


/*---------------------------------------------------------------------------
Both Headless Client & Sever Settings
---------------------------------------------------------------------------*/
if ((!hasInterface && !isDedicated && !isServer) || (isDedicated && !hasInterface || isServer)) then {

	//enable headless client heli crashes?
	P2DZ_HC_HeliCrashes = true;

	//enable headless client ai missions
	P2DZ_HC_AIMissions_Enabled = true;
};

/*---------------------------------------------------------------------------
Global Debugging Settings
---------------------------------------------------------------------------*/

//speed debugging
p2SpT = false;

//epoch debugging
DZEdebug = false;

//define rate of fps deugging
DZE_DiagFpsSlow = false;
DZE_DiagFpsFast = false;
//enable full FPS output
DZE_DiagVerbose = false;

//epoch damage debugging
DZE_Debug_Damage = false;

//fn_selfActions.sqf
P2DZE_debugSelfActions = false;

P2DZE_debugLogin = false;

//vehicleinspect.sqf
P2DZE_deugVehIns = false;

//fn_lootCheck.sqf
P2DZ_lootCheck_debug = false;	

//fnc_debugMon.sqf
P2DZE_debugColoutput = false;

P2DZE_debugLoot = false;

P2DZE_debugHumanity = false;

//debug freshspawn loadouts
P2DZE_loadoutsDebug = false;

//gold debugging
P2DZE_goldItemHandlingDebug = false; 


/*---------------------------------------------------------------------------
Misc Global Settings
---------------------------------------------------------------------------*/

//announcement default var
P2DZ_announcementInProgress = false;

/*---------------------------------------------------------------------------
Building Settings
---------------------------------------------------------------------------*/

DayZ_UseSteamID = true;
DZE_modularBuild = true;
DZE_snapExtraRange = 5;
DZE_APlotforLife = true;
DZE_PlotOwnership = true;
DZE_checkNearbyRadius = 30;
DZE_LockableStorage = ["VaultStorage","VaultStorageLocked","LockboxStorageLocked","LockboxStorage"];
DZE_DoorsLocked = ["Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallDoorLocked_DZ","CinderWallDoorSmallLocked_DZ"];
dayz_allowedObjects = ["TentStorage","TentStorageDomed","TentStorageDomed2", "VaultStorageLocked", "Hedgehog_DZ", "Sandbag1_DZ","BagFenceRound_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Land_HBarrier5_DZ","Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ","LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ","WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","WoodSmallWallDoor_DZ","LockboxStorageLocked","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ","WoodStairsRails_DZ","WoodSmallWallThird_DZ","WoodLadder_DZ","Land_DZE_GarageWoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_WoodDoor","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","MetalFloor_DZ","WoodRamp_DZ","GunRack_DZ","FireBarrel_DZ","WoodCrate_DZ","Scaffolding_DZ"];
DZE_plotTakeOwnershipItems = dayz_allowedObjects - (DZE_LockableStorage + ["Plastic_Pole_EP1_DZ","TentStorage","TentStorageDomed","TentStorageDomed2"]);

AllowManualCode = true; // 2 reason| 1: Allows breaking codes (if 2nd config = false and code = 3 digits) | 2: Friends can access access not owned doors until owner gets on.
HarderPenalty = true; // Cen's Penalty: Flashes screen white. And kicks player to lobby if failed more then (random number between 4 and 14) times.

//keep true
DayZ_UseSteamID = true;

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

//parachute spawn (keep disabled, deprecated)
dayz_paraSpawn = false;

//nametag humanity distance
DZE_HumanityTargetDistance = 25;

MaxVehicleLimit = 5000; // Default = 50

// epoch Heli lifting
DZE_HeliLift = false;

//survivor skin list (picks at random for freshspawns)
p2_survivorSkins_male = ["Survivor2_DZ"];
p2_survivorSkins_female = ["SurvivorW3_DZ","SurvivorW2_DZ","SurvivorWpink_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ"];

//enable humanity based skins?
p2_humanityLevelsEnabled = false;

//list of all skins used by humanity system for male/female characters
p2_humanitySkinsMale = ["Survivor2_DZ","Bandit1_DZ","Bandit2_DZ","Survivor3_DZ","TK_INS_Warlord_EP1_DZ","Ins_Soldier_GL_DZ","INS_Lopotev_DZ"];
p2_humanitySkinsFemale = ["SurvivorW2_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","BanditW1_DZ","BanditW2_DZ"];

