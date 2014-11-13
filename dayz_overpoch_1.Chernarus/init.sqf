startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

//enable ASM
ASM_Enabled = false;

//leave false!
p2d_client = false;
p2d_server = false;
p2d_headless = false;

//Sets text in escape menu
P2DZ_serverName = "Test";

/*---------------------------------------------------------------------------
UID WhiteLists - Door Management, Plot Management, Client-Side AntiHack
---------------------------------------------------------------------------*/
testServer_AdminMenuList = 			["76561198147422604","76561197994454413","76561198143011904"];
P2DZ_clientAHWhiteListUIDs = 		["76561198147422604","76561197994454413","76561198143011904"];
P2DZ_plotManagerUIDs = 				["007"]; 
P2DZ_DoorAdminList =   				["007"];

/*---------------------------------------------------------------------------
Headless Client
---------------------------------------------------------------------------*/

if (!hasInterface && !isDedicated && !isServer) exitWith {
	p2d_headless = true;

	//enable headless client ai missions
	DZMS_HC_Enabled = true;

	//startup wait for dzms
	P2DZMS_startWait = 5;

	if (DZMS_HC_Enabled) then {
		diag_log(format["P2DEBUG: %1 Executing AI Missions!", name player]);
		[] execVM "DZMS\DZMSInit.sqf";
	};

	if (ASM_Enabled) then {
		["OverPoch_HeadlessClient"] execFSM  "\ASM\fn_ASM.fsm"
	};
};


/*---------------------------------------------------------------------------
Dedicated Server
---------------------------------------------------------------------------*/

if (isDedicated && !hasInterface || isServer) then {
	p2d_server = true;

	//enable antihack on test server?
	AHe = false;
	//enable object streaming from db?
	P2DZE_serverStreamObjsEnabled = false;

	//enable custom hive dll debugging
	P2D_H = false;
	P2D_Hp = "P2DEBUG: HIVE DEBUG: ";

	call compile preprocessFileLineNumbers "init\variables.sqf";
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\init\variables_modified.sqf";
		
	//asm performance testing setting
	if (ASM_Enabled) then {
		diag_log("P2DEBUG: ASM_Enabled: " + str ASM_Enabled);
		["OverPoch_Server"] execFSM  "\ASM\fn_ASM.fsm";
	};
};

/*---------------------------------------------------------------------------
Client / Player
---------------------------------------------------------------------------*/

if (hasInterface && !isDedicated) then {
	p2d_client = true;
	
	P2DZ_clientAHWhitelistEnabled = 	false;
	P2DZ_AHDebug = 						false;

	//[] execVM "_decrypted\init.sqf";

	call compile preprocessFileLineNumbers "init\variables.sqf";	

	P2DZ_postVars = true;

	waitUntil{uiSleep 0.5; P2DZ_postVarsDone};
};


diag_log("P2DEBUG: Is Player Client: 	" + str p2d_client);
diag_log("P2DEBUG: Is Dedicatd Server: 	" + str p2d_server);
diag_log("P2DEBUG: Is Headless Client: 	" + str p2d_headless);

//Load in compiled functions
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "init\publicEH.sqf";										//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "init\setup_functions_med.sqf";							//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "compile\string_functions.sqf";							//Compile extra string functions
call compile preprocessFileLineNumbers "init\compiles.sqf";										//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";									//Compile trader configs
call compile preprocessFileLineNumbers "compile\fnc_server.sqf";
progressLoadingScreen 1.0;
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

[] execVM "\ddopp_taserpack\scripts\init_taser.sqf";
// Set effects control to player
player setVariable 	["isTazed", false, true];

if (isServer) then {
	_null = [] execVM "\z\addons\dayz_server\hashId.sqf";

	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";

	if (true) then {
		private "_handle";
		_handle = [] execVM "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnCompiles.sqf";
		waitUntil{scriptDone _handle};
	};

	// Add trader citys
	_nil = 	[] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_nil2 = [] execVM "buildings\init_buildings.sqf";

	//Execute server monitor
	_serverMonitor = 	[] execVM "\z\addons\dayz_server\system\server_monitor_preExec.sqf";
};

if (!isDedicated) then {
	P2DZ_postCompiles = true;

	/* Client Performannce Settings */

	setViewdistance 1500;
	setTerraingrid 45;
	0 setovercast 0;
	0 setFog 0;

	/* --------- */

	waitUntil {uiSleep 0.5; P2DZ_postCompilesDone};

	[] execVM "system\login.sqf";	

	

	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = ("ZombZ: " + localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "system\player_monitor.sqf";	

	[] 	execVM 						"compile\fn_deployActions.sqf";	
	call compile preprocessFileLineNumbers "compile\fnc_debugMon.sqf";

	[] execVM 						"system\safezone.sqf";

};

//#define RESEC_VERBOSE
//#include "\z\addons\dayz_code\system\REsec.sqf"
#include "system\BIS_Effects\init.sqf"

