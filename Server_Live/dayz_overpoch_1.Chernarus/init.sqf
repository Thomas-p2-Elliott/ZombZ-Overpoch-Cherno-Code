disableSerialization;
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
call compile preprocessFileLineNumbers "_allConfig.sqf";
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

//leave false!
p2d_client = false;
p2d_server = false;
p2d_headless = false;

//debug server/client startup
p2d_startup = true;

//debugging line
if (p2d_startup) then {
	diag_log(format['%1: %2: %3: %4: %5',
					diag_tickTime,
					'P2STARTUP',
					'init',
					'Started...allConfig Loaded, LoadScreen Started, BlackFade Started',
					format["isServer: %1, isClient: %2, isHeadless: %3",
					(hasInterface && !isDedicated), (isDedicated && !hasInterface || isServer), (!hasInterface && !isDedicated && !isServer)]]);
};


//Custom Buildings/Map Objects Creation (Now Local)
//Includes P2LOS (Player2's Local Object System)
_nil2 = 					[] execVM "buildings\init_buildings.sqf";

/*--------------------------------------------------------------------------
Headless Client
---------------------------------------------------------------------------*/
if (!hasInterface && !isDedicated && !isServer) exitWith {
	p2d_headless = true;

	diag_log("Init.sqf: ZombZ Headless Client");

	//Make sure headless is in civillian slot
	[] spawn { waitUntil{ uiSleep 5; ((format["%1", (side player)]) != "UNKNOWN")}; if ((format["%1", (side player)]) != "CIV") then { endMission "END1"; }; };
	
	//Wait for BIS Functions to load	
  	waitUntil {!isNil "BIS_fnc_init"}; 

  	//Disable BIS Effects
  	BIS_Effects_Burn =					{};
  	BIS_Effects_AircraftVapour = 		{};
  	BIS_Effects_AirDestructionStage2 = 	{};
   	BIS_Effects_Secondaries = 			{};
   	BIS_Effects_AirDestruction = 		{};

   	//Load in Config
   	call compile preprocessFileLineNumbers "_hcConfig.sqf";

	/* Animated Heli Crash Sites by Player2 */
	if (P2DZ_HC_HeliCrashes) then {
		diag_log(format["P2DEBUG: %1 Executing AnimatedEvents: HeliCrashes!", (getPlayerUID player)]);
		[] execVM ("" + (P2HC_Path) + "AnimatedEvents\heliCrash_init.sqf");
	};

	/* HeadlessClient A.I. Missions by Player2 */
	if (P2DZ_HC_AI_Enabled) then {
		diag_log(format["P2DEBUG: %1 Executing AI Missions!", (getPlayerUID player)]);
		[] execVM ("" + (P2HC_Path) + "P2AI\init.sqf");
	};

	/* Extra Zeds System by Player2 */
	if (P2DZ_HC_extraZeds) then {
		diag_log(format["P2DEBUG: %1 Executing Extra Zeds!", (getPlayerUID player)]);
		P2DZ_HC_extraZeds_Done = false;
		[] execVM ("" + (P2HC_Path) + "zeds\init.sqf");
	};

	/* Zombie Hordes by Player2 */
	if (P2DZ_HC_extraZeds && {(P2DZ_HC_zedHordes)}) then {
		waitUntil{uiSleep 0.5; P2DZ_HC_extraZeds_Done}; //zhordes requires extrazeds
		diag_log(format["P2DEBUG: %1 Executing Zombie Hordes!", (getPlayerUID player)]);
		[] execVM ("" + (P2HC_Path) + "zeds\hordes\init.sqf");
	};

	/* ArmaServerMonitor */
	if (P2DZ_HC_ASM_Enabled) then {
		diag_log(format["P2DEBUG: %1 Executing ArmaServerMonitor!", (getPlayerUID player)]);
		["OverPoch_HeadlessClient"] execFSM  "\ASM\fn_ASM.fsm"
	};
};


/*---------------------------------------------------------------------------
Dedicated Server
---------------------------------------------------------------------------*/
if (isDedicated && !hasInterface || isServer) then {
	p2d_server = true;

	/* Animated Heli Crash Sites by Player2 */
	if (P2DZ_HC_HeliCrashes) then {
		//diag_log(format["P2DEBUG: %1 Executing AnimatedEvents: HeliCrashes!", (getPlayerUID player)]);
		[] execVM "HC\AnimatedEvents\heliCrash_init.sqf";
	};

	/* HeadlessClient A.I. Missions by Player2 */
	if (P2DZ_HC_AI_Enabled) then {
		//diag_log(format["P2DEBUG: %1 Executing AI Missions!", (getPlayerUID player)]);
		[] execVM "HC\P2AI\init.sqf";
	};

	//Server Variables & Config
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\_serverConfig.sqf";
	call compile preprocessFileLineNumbers 	"init\variables.sqf";
	call compile preprocessFileLineNumbers 	"\z\addons\dayz_server\init\variables_modified.sqf";

		
	/* ArmaServerMonitor */
	if (P2DZ_ASM_Enabled) then {
		diag_log(format 					["P2DEBUG: Server Executing ArmaServerMonitor!"]);
		["OverPoch_Server"] execFSM  		"\ASM\fn_ASM.fsm";
	};
};

/*---------------------------------------------------------------------------
Client / Player
---------------------------------------------------------------------------*/

if (hasInterface && !isDedicated) then {
	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','Starting Loading Screen Progression (0.1)']);
	};

	progressLoadingScreen 0.01;
	((uiNameSpace getVariable "BIS_loadingScreen") displayctrl 102) ctrlSetText "ZombZ: Please Wait - Receving Initial Data...";

	p2d_client = 	true;
	call compile preprocessFileLineNumbers "_clientConfig.sqf"; 
	call compile preprocessFileLineNumbers "init\variables.sqf";
	P2DZ_postVars = true;

	if (isNil 'P2DZ_loginCheck') then {	P2DZ_loginCheck = false; };
	[] spawn {
		private["_launchTime"];
		_launchTime = diag_tickTime;
		waitUntil{
			if ((diag_tickTime - _launchTime) > 10) then { 
				[] spawn {
					diag_log("KICK REASON: Server did not respond in time - Please Re-Connect!");
					for "_i" from 0 to 10 do {
						uiSleep 1;
						endLoadingScreen;
						closeDialog 0;
					 	systemChat("KICK REASON: Server did not respond in time - Please Re-Connect!");	
					}; 
					
					endMission "END1"; 
				};
			};
			P2DZ_loginCheck
		};
	};	
	waitUntil{	
		uiSleep 0.33;
		P2DZ_loginCheck
	};

	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','Past LoginCheck Var, waiting for postVarsDone, progress loading screen 0.15']);
	};

	waitUntil{uiSleep 0.5; P2DZ_postVarsDone};
	((uiNameSpace getVariable "BIS_loadingScreen") displayctrl 102) ctrlSetText "ZombZ: Please Wait - Compiling DayZ Epoch & Overwatch Code...";
	progressLoadingScreen 0.2;

	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','done waiting for postVarsDone, progress loading screen 0.3']);
	};
};

//debugging line
if (p2d_startup) then {
	diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','Starting publicEH, med functions, string functions, compiles, server traders, taser functions & loading buildings...']);
};

//Load in compiled functions
P2DZ_loadInitDone = true;
progressLoadingScreen 0.25;
call compile preprocessFileLineNumbers "init\publicEH.sqf";										//Initilize the publicVariable event handlers
call compile preprocessFileLineNumbers "init\setup_functions_med.sqf";							//Functions used by CLIENT for medical
call compile preprocessFileLineNumbers "compile\string_functions.sqf";							//Compile extra string functions
progressLoadingScreen 0.275;
call compile preprocessFileLineNumbers "init\compiles.sqf";										//Compile regular functions
call compile preprocessFileLineNumbers "server_traders.sqf";									//Compile trader configs
call compile preprocessFileLineNumbers "compile\fnc_server.sqf";
progressLoadingScreen 0.3;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

/*---------------------------------------------------------------------------
Dedicated Server
---------------------------------------------------------------------------*/
if (isServer) then {
	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','Calling dynamic_vehicle & static veh spawns, waiting for static veh spawns to finish']);
	};

	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	if (true) then {
		private "_handle";
		_handle = 				[] execVM "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnCompiles.sqf";
		waitUntil{scriptDone _handle};
	};

	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','Static veh spawns finished, loading mission, buildings & server mon (hive)']);
	};

	// Add trader citys & custom buildings
	_nil = 						[] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	//Execute server monitor
	_serverMonitor = 			[] execVM "\z\addons\dayz_server\system\server_monitor_preExec.sqf";
};

/*---------------------------------------------------------------------------
Client
---------------------------------------------------------------------------*/

if (!isDedicated) then {
	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','Compiles Finished, waiting for postCompiles']);
	};

	P2DZ_postCompiles = true;
	waitUntil {uiSleep 0.5; 				P2DZ_postCompilesDone};
	progressLoadingScreen 0.35;

	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','past postCompiles, starting login.sqf & waiting for dayz_loadScreenMsg']);
	};

	[] execVM 								"system\login.sqf";	
	0 fadeSound 0;
	waitUntil {!isNil 						"dayz_loadScreenMsg"};
	((uiNameSpace getVariable "BIS_loadingScreen") displayctrl 102) ctrlSetText "ZombZ: Please Wait - Connecting to Hive...";
	progressLoadingScreen 0.375;

	//debugging line
	if (p2d_startup) then {
		diag_log(format['%1: %2: %3',diag_tickTime,'P2STARTUP: init','Past loadScreenMsg wait, spawning player_monitor, deploy actions, notifs, safezone, & respawn handler, then check if player in headless slot']);
	};

	dayz_loadScreenMsg = 					("ZombZ: " + localize "STR_AUTHENTICATING");
	_id = player addEventHandler 			["Respawn", {_id = [] spawn player_death;}];
	progressLoadingScreen 0.4;
	_playerMonitor = [] execVM 				"system\player_monitor.sqf";	

	[] 	execVM 								"compile\fn_deployActions.sqf";	
	call compile preprocessFileLineNumbers 	"compile\fnc_debugMon.sqf";
	[] execVM 								"system\SafeZone.sqf";

	//Make sure player is not in civillian (headless) slot
	[] spawn { waitUntil{ uiSleep 5; ((format["%1", (side player)]) != "UNKNOWN")}; if ((format["%1", (side player)]) == "CIV") then { endMission "END1"; }; };
};

/*---------------------------------------------------------------------------
Player2's Notification System (Modular)
---------------------------------------------------------------------------*/
/* 		Server Side (Server PBO) 
	Files: 			
		ServerPBO\p2_notifs\server_init.sqf
		ServerPBO\p2_notifs\server_loop.sqf
	Configuration:
		ZombZ_Notif_File_Name = "file_name";
*/ if (isDedicated && !hasInterface || isServer) then { call compile preprocessFileLineNumbers "\z\addons\dayz_server\p2_notifs\server_init.sqf"; };
/* 		Client Side (Mission PBO) 
	Files: 
		MissionPBO\p2_notifs\client_init.sqf
		MissionPBO\p2_notifs\client_notif.sqf
		MissionPBO\p2_notifs\p2notif.h
		MissionPBO\p2_notifs\img\un.paa
		MissionPBO\p2_notifs\img\ru.paa
		MissionPBO\p2_notifs\img\zz.paa
	Configuration: 
		Add this to MissionPBO\description.ext:
			class RscTitles {  #include "p2_notifs\p2notif.h" };
*/ if (hasInterface && !isDedicated) then { 			call compile preprocessFileLineNumbers "p2_notifs\client_init.sqf"; };
/*--End of Notif System----------------------------------------------------*/

//Include BIS Effects
#include "system\BIS_Effects\init.sqf"
