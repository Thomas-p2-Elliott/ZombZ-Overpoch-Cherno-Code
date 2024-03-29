disableSerialization;
gear_done = false;
//Cooking
meatraw = [
	"FoodSteakRaw",
	"FoodmeatRaw",
	"FoodbeefRaw",
	"FoodmuttonRaw",
	"FoodchickenRaw",
	"FoodrabbitRaw",
	"FoodbaconRaw",
	"ItemTrout",
	"ItemSeaBass",
	"ItemTuna"
];
exceptionsraw = ["ItemTuna"];
meatcooked = [
	"FoodSteakCooked",
	"FoodmeatCooked",
	"FoodbeefCooked",
	"FoodmuttonCooked",
	"FoodchickenCooked",
	"FoodrabbitCooked",
	"FoodbaconCooked",
	"ItemTroutCooked",
	"ItemSeaBassCooked",
	"ItemTunaCooked"
];
//Eating
no_output_food = ["FoodMRE", "FoodPistachio", "FoodNutmix","FoodBioMeat"]+meatcooked+meatraw;

// Food with increased chance for infection.
badfood = ["FoodBioMeat","FoodCanUnlabeled"];

food_with_output=[
	"FoodCanBakedBeans",
	"FoodCanSardines",
	"FoodCanFrankBeans",
	"FoodCanPasta",
	"FoodCanGriff",
	"FoodCanBadguy",
	"FoodCanBoneboy",
	"FoodCanCorn",
	"FoodCanCurgon",
	"FoodCanDemon",
	"FoodCanFraggleos",
	"FoodCanHerpy",
	"FoodCanOrlok",
	"FoodCanPowell",
	"FoodCanTylers",
	"FoodCanUnlabeled"
];

food_output = [
	"TrashTinCan",
	"TrashTinCan",
	"TrashTinCan",
	"TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty"
];
//Drinking
no_output_drink = ["ItemWaterbottle", "ItemWaterbottleBoiled"];
drink_with_output = [
	"ItemSoda",  //just to define item for ItemSodaEmpty
	"ItemSodaRbull",
	"ItemSodaOrangeSherbet",
	"ItemSodaCoke",
	"ItemSodaPepsi",
	"ItemSodaMdew",
	"ItemSodaMtngreen",
	"ItemSodaR4z0r",
	"ItemSodaClays",
	"ItemSodaSmasht",
	"ItemSodaDrwaste",
	"ItemSodaLemonade",
	"ItemSodaLvg",
	"ItemSodaMzly",
	"ItemSodaRabbit"
];
drink_output = [
	"ItemSodaEmpty",
	"ItemSodaEmpty",
	"ItemSodaEmpty",
	"ItemSodaCokeEmpty",
	"ItemSodaPepsiEmpty",
	"ItemSodaMdewEmpty",
	"ItemSodaMtngreenEmpty",
	"ItemSodaR4z0rEmpty",
	"ItemSodaClaysEmpty",
	"ItemSodaSmashtEmpty",
	"ItemSodaDrwasteEmpty",
	"ItemSodaLemonadeEmpty",
	"ItemSodaLvgEmpty",
	"ItemSodaMzlyEmpty",
	"ItemSodaRabbitEmpty"
];
boil_tin_cans = [
	"TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty",
	"ItemSodaEmpty",
	"ItemSodaCokeEmpty",
	"ItemSodaPepsiEmpty",
	"ItemSodaMdewEmpty",
	"ItemSodaMtngreenEmpty",
	"ItemSodaR4z0rEmpty",
	"ItemSodaClaysEmpty",
	"ItemSodaSmashtEmpty",
	"ItemSodaDrwasteEmpty",
	"ItemSodaLemonadeEmpty",
	"ItemSodaLvgEmpty",
	"ItemSodaMzlyEmpty",
	"ItemSodaRabbitEmpty"
];

dayz_combination = "";
dayz_humanitytarget = "";
dayz_combatLog = "";
canRoll = true;

canbuild = true;

//Hunting Variables
dayZ_partClasses = [
	"PartFueltank",
	"PartWheel",
	//"PartGeneric",	//No need to add, it is default for everything
	"PartEngine"
];
dayZ_explosiveParts = [
	"palivo",
	"motor"
];
//Survival Variables
SleepFood =				2160; //minutes (48 hours)
SleepWater =			1440; //minutes (24 hours)
SleepTemperatur	= 		90 / 100;	//Firs Value = Minutes untill Player reaches the coldest Point at night (without other effects! night factor expected to be -1)			//TeeChange

//Server Variables
allowConnection = 		false;
isSinglePlayer =		false;
PVDZE_serverObjectMonitor = [];
PlayerDeaths = [];

//Streaming Variables (player only)
dayz_Locations = [];
dayz_locationsActive = [];

//GUI
Dayz_GUI_R = 0.38; // 0.7
Dayz_GUI_G = 0.63; // -0.63
Dayz_GUI_B = 0.26; // -0.26

//Player self-action handles
dayz_resetSelfActions = {
	s_player_fire =			-1;
	s_player_cook =			-1;
	s_player_boil =			-1;
	s_player_fireout =		-1;
	s_player_butcher =		-1;
	s_player_packtent = 	-1;
	s_player_packvault = 	-1;
	s_player_lockvault = 	-1;
	s_player_unlockvault = 	-1;
	s_player_fillwater =	-1;
	s_player_fillwater2 = 	-1;
	s_player_fillfuel = 	-1;
	s_player_grabflare = 	-1;
	s_player_dropflare =	-1;
	s_player_callzombies = 	-1;
	s_player_showname = 	-1;
	s_player_debuglootpos = 	-1;
	s_player_pzombiesattack = 	-1;
	s_player_pzombiesvision =	-1;
	s_player_pzombiesfeed = 	-1;
	s_player_removeflare = 	-1;
	s_player_painkiller =	-1;
	s_player_studybody = 	-1;
	s_player_tamedog =		-1;
	s_player_madsci_crtl =	-1;
	s_player_parts_crtl =	-1;
	s_build_Sandbag1_DZ = 	-1;
	s_build_Hedgehog_DZ =	-1;
	s_build_Wire_cat1 =		-1;
	s_player_deleteBuild =	-1;
	s_player_checkBuild =	-1;
	s_player_forceSave = 	-1;
	s_player_checkGear = 	-1;
	s_player_flipveh = 		-1;
	s_player_stats =		-1;
	s_player_sleep =		-1;
	s_player_movedog =		-1;
	s_player_speeddog =		-1;
	s_player_calldog = 		-1;
	s_player_feeddog = 		-1;
	s_player_waterdog = 	-1;
	s_player_staydog = 		-1;
	s_player_trackdog = 	-1;
	s_player_barkdog = 		-1;
	s_player_warndog = 		-1;
	s_player_followdog = 	-1;
	s_player_repair_crtl =  -1;
	s_player_information =  -1;
	s_player_fuelauto    =  -1;
	s_player_fuelauto2    =  -1;
	s_player_fillgen	 =  -1;
	s_player_upgrade_build	 =  -1;
	s_player_maint_build	 =  -1;
	s_player_downgrade_build	 =  -1;
	s_halo_action =         -1;
	s_player_SurrenderedGear = -1;
	s_player_maintain_area = -1;
	s_player_maintain_area_preview = -1;
	s_player_heli_lift = -1;
	s_player_heli_detach = -1;
	s_player_lockUnlock_crtl = -1;
	s_player_toggleSnap = -1;
    s_player_toggleSnapSelect = -1;
    s_player_toggleSnapSelectPoint=[];
    snapActions = -1;
	s_player_plot_boundary_on = -1;
	s_player_plot_boundary_off = -1;
	s_player_plot_take_ownership = -1;
	s_player_plotManagement = -1;
	s_player_manageDoor = -1;
	s_player_takeGold = -1;
	s_player_paint = -1;
	mv22_fold = -1;
	mv22_unfold = -1;
	mv22_open = -1;
	mv22_close = -1;
	suv_close = -1;
	suv_open = -1;
	uh1y_fold = -1;
	uh1y_unfold = -1;
};
call dayz_resetSelfActions;

//Engineering variables
s_player_lastTarget =	[objNull,objNull,objNull,objNull,objNull];
s_player_repairActions = [];
s_player_lockunlock = [];

// Custom
s_player_madsci 		= 	[];
s_player_parts 			= 	[];
s_player_combi 			= 	[];

//Modular player_build
snapGizmos = [];
snapGizmosNearby = [];

//Initialize Medical Variables
r_interrupt = 			false;
r_doLoop = 				false;
r_self = 				false;
r_self_actions = 		[];
r_drag_sqf = 			false;
r_action = 				false;
r_action_unload = 		false;
r_player_handler = 		false;
r_player_handler1 = 	false;
r_player_dead = 		false;
r_player_unconscious = 	false;
r_player_infected =		false;
r_player_injured = 		false;
r_player_inpain = 		false;
r_player_loaded = 		false;
r_player_cardiac = 		false;
r_fracture_legs =		false;
r_fracture_arms =		false;
r_player_vehicle =		player;
r_player_blood = 		12000;
r_player_lowblood = 	false;
r_player_timeout =		0;
r_player_bloodTotal = 	r_player_blood;
r_public_blood =		r_player_blood;
r_player_bloodDanger =	r_player_bloodTotal * 0.2;
r_player_actions = 		[];
r_handlerCount = 		0;
r_action_repair = 		false;
r_action_targets = 		[];
r_pitchWhine = 			false;
r_isBandit =			false;
isInTraderCity =		false;

NORRN_dropAction =		-1;
DZE_PROTOBOX = objNull;
zombzsafezone = 0;

//ammo routine
r_player_actions2 = [];
r_action2 = false;
r_player_lastVehicle = objNull;
r_player_lastSeat = [];
r_player_removeActions2 = {
	if (!isNull r_player_lastVehicle) then {
		{
			r_player_lastVehicle removeAction _x;
		} count r_player_actions2;
		r_player_actions2 = [];
		r_action2 = false;
	};
};

USEC_woundHit 	= [
	"",
	"body",
	"hands",
	"legs",
	"head_hit"
];
DAYZ_woundHit 	= [
	[
		"body",
		"hands",
		"legs",
		"head_hit"
	],
	[ 0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,3]
];
DAYZ_woundHit_ok = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,0,0,0,1,1,1,2,2]
];
DAYZ_woundHit_dog = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2]
];
USEC_MinorWounds 	= [
	"hands",
	"legs"
];
USEC_woundPoint	= [
	["Pelvis","aimpoint"],
	["aimpoint"], //,"RightShoulder","LeftShoulder"
	["lelbow","relbow"],
	["RightFoot","LeftFoot"],
	["neck","pilot"]
];
USEC_typeOfWounds = [
	"Pelvis",
	"aimpoint",
	"lelbow","relbow",
	"RightFoot","LeftFoot",
	"neck","pilot"
];

DZE_vehicleZwounds = [
	"sklo predni L",
	"sklo predni P",
	"sklo zadni",
	"sklo zadni L",
	"sklo zadni P",
	"sklo P",
	"Glass1",
	"Glass2",
	"Glass3",
	"Glass4",
	"Glass5",
	"Glass6"
];

DZE_HeliAllowTowFrom = [
	"CH_47F_EP1_DZE",
	"CH_47F_EP1_DZ",
	"CH_47F_BAF",
	"CH_47F_EP1",
	"BAF_Merlin_DZE",
	"CH53_DZE"
];

DZE_HeliAllowToTow = [
	"hilux1_civil_1_open",
	"HMMWV_Base",
	"Lada_base",
	"Offroad_DSHKM_base",
	"Pickup_PK_base",
	"SkodaBase",
	"tractor",
	"VWGolf",
	"Volha_TK_CIV_Base_EP1",
	"S1203_TK_CIV_EP1",
	"SUV_Base_EP1",
	"ArmoredSUV_Base_PMC",
	"UAZ_Base",
	"LandRover_Base",
	"Ship"
];

PVDZE_plr_Hit = [];
PVDZE_obj_Publish = [];		//used for eventhandler to spawn a mirror of players tent
PVDZE_plr_HideBody = objNull;
dayz_selectedVault = objNull;
dayz_selectedDoor = objNull;

PVDZE_veh_Publish = [];		// for vehicle traders
PVDZE_obj_Trade = [];		// For all traders increment qty
PVDZE_plr_TradeMenu = [];  		// For all traders
PVDZE_plr_DeathB = [];
P2DZE_cachedTraders = [];

dayz_cantseeDist = 150; // distance from which we can spawn a Z in front of any player without ray-tracing && angle checks
dayz_cantseefov = 70; // half player field-of-view. Visible Z won't be spawned in front of any near players


if(isNil "timezoneswitch") then {
	timezoneswitch = 0;
};

if (isNil "helperDetach") then {
	helperDetach = false;
};

DZE_snap_build_file = "compile\snap_build.sqf";

DZE_REPLACE_WEAPONS = [["Crossbow","ItemMatchbox","ItemHatchet"],["Crossbow_DZ","ItemMatchbox_DZE","ItemHatchet_DZE"]];

// update objects
dayz_updateObjects = ["Plane","Tank","Car", "Helicopter", "Motorcycle", "Ship", "TentStorage", "VaultStorage","LockboxStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ","Scaffolding_DZ"];
dayz_disallowedVault = ["TentStorage", "BuiltItems","ModularItems","DZE_Base_Object"];
dayz_reveal = ["AllVehicles","WeaponHolder","Land_A_tent","BuiltItems","ModularItems","DZE_Base_Object"];

DZE_LockableStorage = ["VaultStorage","VaultStorageLocked","LockboxStorageLocked","LockboxStorage"];
DZE_LockedStorage = ["VaultStorageLocked","LockboxStorageLocked"];
DZE_UnLockedStorage = ["VaultStorage","LockboxStorage"];
DZE_maintainClasses = ["ModularItems","DZE_Housebase","LightPole_DZ","BuiltItems","Plastic_Pole_EP1_DZ","Fence_corrugated_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","StickFence_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","DeerStand_DZ","Scaffolding_DZ","FireBarrel_DZ"];

// List of removable items that require crowbar
DZE_isRemovable = ["OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ","MetalGate_DZ","DeerStand_DZ","StickFence_DZ","Fence_corrugated_DZ","M240Nest_DZ","ParkBench_DZ","Plastic_Pole_EP1_DZ","FireBarrel_DZ","Scaffolding_DZ"];
DZE_isWreck = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];
DZE_isWreckBuilding = ["Land_wreck_cinder","Land_wood_wreck_quarter","Land_wood_wreck_floor","Land_wood_wreck_third","Land_wood_wreck_frame","Land_iron_vein_wreck","Land_silver_vein_wreck","Land_gold_vein_wreck","Land_ammo_supply_wreck"];
DZE_isNewStorage = ["VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ"];

// These work with just a running generator
dayz_fuelpumparray = ["FuelPump_DZ","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","FuelStation","Land_ibr_FuelStation_Feed","Land_fuelstation_army","Land_fuelstation","land_fuelstation_w","Land_benzina_schnell"];
DZE_fueltruckarray = ["KamazRefuel_DZ","UralRefuel_TK_EP1_DZ","MtvrRefuel_DES_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ","MtvrRefuel_DZ","KamazRefuel_DZE","UralRefuel_TK_EP1_DZE","MtvrRefuel_DES_EP1_DZE","V3S_Refuel_TK_GUE_EP1_DZE","MtvrRefuel_DZE"];

// Standard Fuel sources
dayz_fuelsources = ["Land_Ind_TankSmall","Land_fuel_tank_big","Land_fuel_tank_stairs","Land_fuel_tank_stairs_ep1","Land_wagon_tanker","Land_fuelstation","Land_fuelstation_army","land_fuelstation_w","Land_benzina_schnell"];

DZE_Lock_Door = "";

if(isServer) then {
	dayz_players = [];
	dead_bodyCleanup = [];
	needUpdate_objects = [];

	DZE_DYN_AntiStuck = 0;
	DZE_DYN_AntiStuck2nd = 0;
	DZE_DYN_AntiStuck3rd = 0;

	PDZE_Hash_AS = 0;
	PDZE_Hash_2AS = 0;
	PDZE_Hash_3AS = 0;

	if(isNil "EpochEvents") then {
		EpochEvents = [];
	};

	if(isNil "DZE_CleanNull") then {
		DZE_CleanNull = false;
	};

};

if(!isDedicated) then {

	dayz_spawnPos = getPosATL player;

	dayz_buildingMonitor = [];	//Buildings to check
	dayz_bodyMonitor = [];

	// weather control var
	zeroPreviousWeather = [0,0,[0,0],0];
	zeroCurrentWeather = [0,0,[0,0],0];

	dayz_baseTypes = 		getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");

	//temperature variables
	dayz_temperatur 		= 	36;		//TeeChange
	dayz_temperaturnormal 	= 	36;		//TeeChange
	dayz_temperaturmax 		= 	42;		//TeeChange
	dayz_temperaturmin 		= 	27;		//TeeChange

	//player special variables
	dayZ_lastPlayerUpdate = 0;
	dayZ_everyonesTents =	[];
	dayz_hunger	=			0;
	dayz_thirst = 			0;
	dayz_combat =			0;
	dayz_preloadFinished = 	false;
	dayz_statusArray =		[1,1];
	dayz_disAudial =		0;
	dayz_disVisual =		0;
	dayz_firedCooldown = 	0;
	dayz_DeathActioned =	false;
	dayz_canDisconnect = 	true;
	dayz_damageCounter =	time;
	dayz_lastSave =			time;
	dayz_isSwimming	=		true;
	dayz_isKneeling	=		false;
	dayz_isCrawling	=		false;
	dayz_PreviousTown =		"Wilderness";
	dayz_currentDay = 		0;
	dayz_hasLight = 		false;
	dayz_surfaceNoise =		0;
	dayz_surfaceType =		"None";
	dayz_noPenalty = 		[];
	dayz_heavenCooldown =	0;
	deathHandled = 			false;
	dayz_lastHumanity =		0;
	dayz_guiHumanity =		-90000;
	dayz_firstGroup = 		group player;
	dayz_originalPlayer = 	player;
	dayz_sourceBleeding =	objNull;
	dayz_clientPreload = 	false;
	dayz_authed = 			false;
	dayz_panicCooldown = 	0;
	dayz_areaAffect =		2.5;
	dayz_heartBeat = 		false;
	dayzClickTime =			0;
	//Current local
	dayz_spawnZombies = 0;
	dayz_swarmSpawnZombies = 0;
	//Current NearBy
	dayz_CurrentNearByZombies = 0;
	//Current total
	dayz_currentGlobalZombies = 0;
	//Max global zeds.
	//used to count global zeds around players
	dayz_CurrentZombies = 0;
	//Used to limit overall zed counts
	dayz_tickTimeOffset = 0;
	dayz_currentWeaponHolders = 0;
	dayz_maxMaxWeaponHolders = 120;
	dayz_maxCurrentZeds = 	0;
	dayz_inVehicle =		false;
	dayz_Magazines = 		[];
	dayzGearSave = 			false;
	dayz_unsaved =			false;
	dayz_scaleLight = 		0;
	dayzDebug = false;
	dayzState = -1;
	//uiNamespace setVariable ['DAYZ_GUI_display',displayNull];
	//if (uiNamespace getVariable ['DZ_displayUI', 0] == 2) then {
	//	dayzDebug = true;
	//};

	DZE_ActionInProgress =		false;

	// DayZ Epoch Client only variables
	if(isNil "DZE_AllowForceSave") then {
		DZE_AllowForceSave = false;
	};
	if(isNil "DZE_AllowCargoCheck") then {
		DZE_AllowCargoCheck = true;
	};
	if(isNil "DZE_ForceNameTags") then {
		DZE_ForceNameTags = false;
	};
	if(isNil "DZE_ForceNameTagsOff") then {
		DZE_ForceNameTagsOff = false;
	};
	if(isNil "DZE_ForceNameTagsInTrader") then {
		DZE_ForceNameTagsInTrader = true;
	};
	if(isNil "DZE_HaloJump") then {
		DZE_HaloJump = true;
	};

	if(isNil "DZE_AntiWallLimit") then {
		DZE_AntiWallLimit = 3;
	};
	if(isNil "DZE_requireplot") then {
		DZE_requireplot = 1;
	};
	if(isNil "DZE_R3F_WEIGHT") then {
		DZE_R3F_WEIGHT = true;
	};

	DZE_AntiWallCounter = 0;
	DZE_FreshSpawn = false;

	DZE_myHaloVehicle = objNull;
	dayz_myLiftVehicle = objNull;

	DZE_Friends = [];
	DZE_CanPickup = true;

	DZE_Q = false;
	DZE_Z = false;

	DZE_Q_alt = false;
	DZE_Z_alt = false;
	DZE_Q_ctrl = false;
	DZE_Z_ctrl = false;

	DZE_5 = false;
	DZE_4 = false;
	DZE_6 = false;
	DZE_F = false;

	DZE_cancelBuilding = false;
	DZE_PZATTACK = false;

	DZE_trees = ["t_picea2s_snow.p3d","b_corylus.p3d","t_quercus3s.p3d","t_larix3s.p3d","t_pyrus2s.p3d","str_briza_kriva.p3d","dd_borovice.p3d","les_singlestrom_b.p3d","les_singlestrom.p3d","smrk_velky.p3d","smrk_siroky.p3d","smrk_maly.p3d","les_buk.p3d","str krovisko vysoke.p3d","str_fikovnik_ker.p3d","str_fikovnik.p3d","str vrba.p3d","hrusen2.p3d","str dub jiny.p3d","str lipa.p3d","str briza.p3d","p_akat02s.p3d","jablon.p3d","p_buk.p3d","str_topol.p3d","str_topol2.p3d","p_osika.p3d","t_picea3f.p3d","t_picea2s.p3d","t_picea1s.p3d","t_fagus2w.p3d","t_fagus2s.p3d","t_fagus2f.p3d","t_betula1f.p3d","t_betula2f.p3d","t_betula2s.p3d","t_betula2w.p3d","t_alnus2s.p3d","t_acer2s.p3d","t_populus3s.p3d","t_quercus2f.p3d","t_sorbus2s.p3d","t_malus1s.p3d","t_salix2s.p3d","t_picea1s_w.p3d","t_picea2s_w.p3d","t_ficusb2s_ep1.p3d","t_populusb2s_ep1.p3d","t_populusf2s_ep1.p3d","t_amygdalusc2s_ep1.p3d","t_pistacial2s_ep1.p3d","t_pinuse2s_ep1.p3d","t_pinuss3s_ep1.p3d","t_prunuss2s_ep1.p3d","t_pinusn2s.p3d","t_pinusn1s.p3d","t_pinuss2f.p3d","t_poplar2f_dead_pmc.p3d","misc_torzotree_pmc.p3d","misc_burnspruce_pmc.p3d","brg_cocunutpalm8.p3d","brg_umbrella_acacia01b.p3d","brg_jungle_tree_canopy_1.p3d","brg_jungle_tree_canopy_2.p3d","brg_cocunutpalm4.p3d","brg_cocunutpalm3.p3d","palm_01.p3d","palm_02.p3d","palm_03.p3d","palm_04.p3d","palm_09.p3d","palm_10.p3d","brg_cocunutpalm2.p3d","brg_jungle_tree_antiaris.p3d","brg_cocunutpalm1.p3d","str habr.p3d"];
	DZE_TEMP_treedmg = 1;

	DZE_Surrender = false;
	DZE_Quarantine = false;
	DZE_InRadiationZone = false;
};


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

call compile preprocessFileLineNumbers "init\variables_painting.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\loot_init.sqf";


//call compile preprocessFileLineNumbers "init\variables_modified.sqf";
