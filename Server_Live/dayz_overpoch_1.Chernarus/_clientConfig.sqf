/*---------------------------------------------------------------------------
Client Settings
---------------------------------------------------------------------------*/
if (hasInterface && !isDedicated) then {
	
	//Enable client antihack debug?
	P2DZ_AHDebug = 						false;

	//enable gold notifs in system chat
	P2DZ_enableGoldSystemChat = true;

	//self bloodbabg enabbled?
	DZE_SelfTransfuse = true;

	//player as zed enabled?
	DZE_PlayerZed = false;

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

	//how often should we ask the server to save the char
	DZE_SaveTime = 240;

	//debug client login (FSM and login.sqf)?
	P2DZE_debugLogin = true;

	//default debug monitor colour - gets overwritten by hivedll but still needs to be declared!
	P2DZE_debugCol = [0,0,0,0.2];

	//Devs only
	P2_REF = true;

	//Loadscreen Timeout Length (Seconds) (Default: 120)
	P2DZ_LoadingTimeOut = 120;

	/* Default Client Performance/Visual Settings */

	setViewdistance 1000;	//ViewDist
	0 setovercast 0;		//Sky
	0 setFog 0;				//Fog
	setTerrainGrid 40;		//Terrain Detail


	P2DZ_debugMonSleep = 0.4; //Debug Mon Refresh-Rate

	/* --------- */

	//loot and zed spawn delay settings
	dayz_spawnDelay =		120;
	dayz_spawnWait =		-120;
	dayz_lootDelay =		3;
	dayz_lootWait =			-300;

	//Max global zeds
	dayz_maxGlobalZeds = 400;

	//Maximum zeds (client-side)
	dayz_maxLocalZombies = 15;

	// max quantity of Z controlled by local gameclient, used by player_spawnCheck. Below this limit we can spawn Z
	dayz_maxNearByZombies = 15; 

	//Maximum global zombies per 400m
	dayz_maxGlobalZombiesInit = 15;

	//Increase global zombies by this much for each additional player within 400m 
	dayz_maxGlobalZombiesIncrease = 5;

	//Do zeds attack vehicles?
	dayz_zedsAttackVehicles = true;

	//how many zombies should we spawn for people in vehicles?
	dayz_zedSpawnVehCount = dayz_maxLocalZombies / 2;

	//how many zombies for people in air vehicles?
	dayz_spawnAirCount = 0;

	//Unused Settings or Default GlobalVar Values - Leave as they are
	P2DZE_goldRunning = false;
	P2DZE_hasGold = false;			// - gets modified by checkGoldItems & pickupgold & dropgold
	P2DZE_gearOnContainer = false; // - gets modified in object_monitorGear.sqf
	P2DZE_gearOnWeaponHolder = false; // - gets modified in object_monitorGear.sqf
	P2DZE_LRR = 0; //last removal request
	P2DZE_LGR = 0; //last give request
	s_player_takeGold = -1;
	P2DZ_debugSliderRange = 100;
	P2DZ_dbCurMode = 1;
	P2DZ_dbViewDist = 1000;
	P2DZ_debugOff = false;
	P2DZE_traderListLoading = false;
	P2DZ_debugMonitor = false;
	//leave as false
	P2DZE_hasLanded = false;
	P2DZE_paraOpened = false;
	//leave as -1
	P2DZE_HaloReSpawnAction = -1;
	P2DZE_removeExtra_lastRunTime = 0;
	P2DZE_goldDropUIFirstRun = true;

	Dayz_Dark_UI = false;
	//deprecated
	DZE_selfTransfuse_Values = [12000, 5, 120];

	//LoadScreen Message Handlers
	P2DZ_load6 = 	false;
	P2DZ_load7 = 	false;
	P2DZ_load8 = 	false;
	P2DZ_load9 = 	false;
	P2DZ_load10 =	false;
	dayz_DisplayGenderSelect = true;

	//Map Markers
	[] spawn {
		waitUntil {!isNil "dayz_gui"};

		_bank1 = createMarker ["Drozhina", [3847.0142, 4787.8877, 1.5258789e-005]];
		_bank1 setMarkerText "Drozlovka Town";
		_bank1 setMarkerType "Defend";
		_bank1 setMarkerColor "ColorGreenAlpha";
		bank1 = _bank1;

		_bank2 = createMarker ["NEA", [12199.364, 12736.952, 0.22427459]];
		_bank2 setMarkerText "International Airport";
		_bank2 setMarkerType "Defend";
		_bank2 setMarkerColor "ColorRedAlpha";
		bank2 = _bank2;

		_bank3 = createMarker ["NovyLug", [9577.7266, 11299.333, 0.4098191]];
		_bank3 setMarkerText "Novy Lug Outpost";
		_bank3 setMarkerType "Defend";
		_bank3 setMarkerColor "ColorRedAlpha";
		bank3 = _bank3;

		_bank4 = createMarker ["NWA", [4874.4219, 9974.2324, 0.11848836]];
		_bank4 setMarkerText "Military Airbase";
		_bank4 setMarkerType "Defend";
		_bank4 setMarkerColor "ColorRedAlpha";
		bank4 = _bank4;

		_bank5 = createMarker ["Skalka Town", [1902.0646, 11947.333, 2]];
		_bank5 setMarkerText "Winterfell City";
		_bank5 setMarkerType "Defend";
		_bank5 setMarkerColor "ColorGreenAlpha";
		bank5 = _bank5;

		_bank6 = createMarker ["Skalka Outpost", [2282.0522, 10825.35, 1]];
		_bank6 setMarkerText "Winterfell Outpost";
		_bank6 setMarkerType "Defend";
		_bank6 setMarkerColor "ColorRedAlpha";
		bank6 = _bank6;

		_bank7 = createMarker ["Balota Outpost", [4048.4211, 2613.1758, 2]];
		_bank7 setMarkerText "Abandoned US Armory";
		_bank7 setMarkerType "Faction_US";
		_bank7 setMarkerColor "ColorRedAlpha";
		bank7 = _bank7;

		_bank8 = createMarker ["Zelengorsk", [2501.8564, 5090.1445, 0.014888633]];
		_bank8 setMarkerText "Zelengorsk Hospital";
		_bank8 setMarkerType "Defend";
		_bank8 setMarkerColor "ColorGreenAlpha";
		bank8 = _bank8;

		_bank9 = createMarker ["SurvivorCity", [6549.8652, 14154.829, 0.16039793]];
		_bank9 setMarkerText "Smugglers Airfield";
		_bank9 setMarkerType "Attack";
		_bank9 setMarkerColor "ColorBlue";
		bank9 = _bank9;

		_bank9 = createMarker ["KumyrnaOutpost", [8355.7813, 5918.0068, 3.0517578e-005]];
		_bank9 setMarkerText "Ruins of Kumyrna";
		_bank9 setMarkerType "Defend";
		_bank9 setMarkerColor "ColorGreenAlpha";
		bank9 = _bank9;

		_bank10 = createMarker ["MogilevkaCheckpoint", [8245.3574, 4897.6006, 3.0517578e-005]];
		_bank10 setMarkerText "Abandoned Checkpoint";
		_bank10 setMarkerType "Defend";
		_bank10 setMarkerColor "ColorRedAlpha";
		bank10 = _bank10;

		_bank11 = createMarker ["KamenkaTents", [1117.6555, 2455.2349, 2.2888184e-005]];
		_bank11 setMarkerText "Abandoned Camp";
		_bank11 setMarkerType "Defend";
		_bank11 setMarkerColor "ColorGreenAlpha";
		bank11 = _bank11;

		_bank12 = createMarker ["Gorka", [9788.2813, 8763.2217, 1]];
		_bank12 setMarkerText "Gorka Defence Force HQ";
		_bank12 setMarkerType "Defend";
		_bank12 setMarkerColor "ColorRedAlpha";
		bank12 = _bank12;

		_bank13 = createMarker ["KamyshovoRoadblock", [12985.606, 3800.031, -1.6689301e-005]];
		_bank13 setMarkerText "Abandoned Roadblock";
		_bank13 setMarkerType "Defend";
		_bank13 setMarkerColor "ColorGreenAlpha";
		bank13 = _bank13;

		_bank14 = createMarker ["Devils Castle AI", [6888.728, 11427.035, 1]];
		_bank14 setMarkerText "Bandit Fortress";
		_bank14 setMarkerShape "ELLIPSE";
		_bank14 setMarkerType "Flag";
		_bank14 setMarkerColor "ColorBlue";
		_bank14 setMarkerBrush "Grid";
		_bank14 setMarkerSize [300, 300];
		bank14 = _bank14;
	

	};

};

/*---------------------------------------------------------------------------
---------------------------------------------------------------------------*/