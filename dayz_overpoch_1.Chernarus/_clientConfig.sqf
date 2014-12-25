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
	DZE_SaveTime = 90;

	//default debug monitor colour - gets overwritten by hivedll but still needs to be declared!
	P2DZE_debugCol = [0,0,0,0.2];

	//Loadscreen Timeout Length (Seconds) (Default: 120)
	P2DZ_LoadingTimeOut = 45;

	/* Default Client Performance/Visual Settings */

	setViewdistance 1250;	//ViewDist
	setTerraingrid 49;		//Grass, 50 = off
	0 setovercast 0;		//Sky
	0 setFog 0;				//Fog


	P2DZ_debugMonSleep = 0.4; //Debug Mon Refresh-Rate

	/* --------- */

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
	dayz_maxNearByZombies = 50; 

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
	s_player_takeGold = -1;
	P2DZ_debugSliderRange = 100;
	P2DZ_dbCurMode = 1;
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

	//Map Markers
	[] spawn {
		waitUntil {!isNil "dayz_gui"};

		_marker1 = createMarker ["Drozhina", [3847.0142, 4787.8877, 1.5258789e-005]];
		_marker1 setMarkerText "Drozlovka Town";
		_marker1 setMarkerType "Defend";
		_marker1 setMarkerColor "ColorGreenAlpha";
		marker1 = _marker1;

		_marker2 = createMarker ["NEA", [12199.364, 12736.952, 0.22427459]];
		_marker2 setMarkerText "International Airport";
		_marker2 setMarkerType "Defend";
		_marker2 setMarkerColor "ColorRedAlpha";
		marker2 = _marker2;

		_marker3 = createMarker ["NovyLug", [9577.7266, 11299.333, 0.4098191]];
		_marker3 setMarkerText "Novy Lug Outpost";
		_marker3 setMarkerType "Defend";
		_marker3 setMarkerColor "ColorRedAlpha";
		marker3 = _marker3;

		_marker4 = createMarker ["NWA", [4874.4219, 9974.2324, 0.11848836]];
		_marker4 setMarkerText "Military Airbase";
		_marker4 setMarkerType "Defend";
		_marker4 setMarkerColor "ColorRedAlpha";
		marker4 = _marker4;

		_marker5 = createMarker ["Skalka Town", [1902.0646, 11947.333, 2]];
		_marker5 setMarkerText "Winterfell City";
		_marker5 setMarkerType "Defend";
		_marker5 setMarkerColor "ColorGreenAlpha";
		marker5 = _marker5;

		_marker6 = createMarker ["Skalka Outpost", [2282.0522, 10825.35, 1]];
		_marker6 setMarkerText "Winterfell Outpost";
		_marker6 setMarkerType "Defend";
		_marker6 setMarkerColor "ColorRedAlpha";
		marker6 = _marker6;

		_marker7 = createMarker ["Balota Outpost", [4048.4211, 2613.1758, 2]];
		_marker7 setMarkerText "Abandoned US Armory";
		_marker7 setMarkerType "Faction_US";
		_marker7 setMarkerColor "ColorRedAlpha";
		marker7 = _marker7;

		_marker8 = createMarker ["Zelengorsk", [2501.8564, 5090.1445, 0.014888633]];
		_marker8 setMarkerText "Zelengorsk Hospital";
		_marker8 setMarkerType "Defend";
		_marker8 setMarkerColor "ColorGreenAlpha";
		marker8 = _marker8;

		_marker9 = createMarker ["SurvivorCity", [6549.8652, 14154.829, 0.16039793]];
		_marker9 setMarkerText "Smugglers Airfield";
		_marker9 setMarkerType "Attack";
		_marker9 setMarkerColor "ColorBlue";
		marker9 = _marker9;

		_marker9 = createMarker ["KumyrnaOutpost", [8355.7813, 5918.0068, 3.0517578e-005]];
		_marker9 setMarkerText "Ruins of Kumyrna";
		_marker9 setMarkerType "Defend";
		_marker9 setMarkerColor "ColorGreenAlpha";
		marker9 = _marker9;

		_marker10 = createMarker ["MogilevkaCheckpoint", [8245.3574, 4897.6006, 3.0517578e-005]];
		_marker10 setMarkerText "Abandoned Checkpoint";
		_marker10 setMarkerType "Defend";
		_marker10 setMarkerColor "ColorRedAlpha";
		marker10 = _marker10;

		_marker11 = createMarker ["KamenkaTents", [1117.6555, 2455.2349, 2.2888184e-005]];
		_marker11 setMarkerText "Abandoned Camp";
		_marker11 setMarkerType "Defend";
		_marker11 setMarkerColor "ColorGreenAlpha";
		marker11 = _marker11;

		_marker12 = createMarker ["Gorka", [9788.2813, 8763.2217, 1]];
		_marker12 setMarkerText "Gorka Defence Force HQ";
		_marker12 setMarkerType "Defend";
		_marker12 setMarkerColor "ColorRedAlpha";
		marker12 = _marker12;

		_marker13 = createMarker ["KamyshovoRoadblock", [12985.606, 3800.031, -1.6689301e-005]];
		_marker13 setMarkerText "Abandoned Roadblock";
		_marker13 setMarkerType "Defend";
		_marker13 setMarkerColor "ColorGreenAlpha";
		marker13 = _marker13;

		_marker14 = createMarker ["Devils Castle AI", [6888.728, 11427.035]];
		_marker14 setMarkerText "Bandit Fortress";
		_marker14 setMarkerType "Flag";
		_marker14 setMarkerColor "ColorBlue";
		_marker14 setMarkerShape "ELLIPSE";
		_marker14 setMarkerBrush "Grid";
		_marker14 setMarkerSize [300,300];
		marker14 = _marker14;

		_marker15 = createMarker ["Devils Castle AI Map Text", [6898.5972, 11431.343]];
		_marker15 setMarkerText "Bandit Fortress";
		_marker15 setMarkerType "selector_selectedEnemy";
		_marker15 setMarkerColor "ColorYellow";
		_marker15 setMarkerBrush "Solid";
		marker15 = _marker15;

		};

};

/*---------------------------------------------------------------------------
-------------------sensi--------------------------------------------------------*/