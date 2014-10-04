//enable ASM
ASM_Enabled = false;

//leave false!
p2d_client = false;
p2d_server = false;
p2d_headless = false;

//enable player2 custom hive dll debugging
P2D_H = true;
P2D_Hp = "P2DEBUG: HIVE DEBUG: ";

if (hasInterface && !isDedicated) then {
	p2d_client = true;

	//enable uid whitelist
	P2DZE_clientAHWhitelistEnabled = true;
};

if (isDedicated && !hasInterface || isServer) then {
	p2d_server = true;

	#include "configs\debug_console.hpp";
	conBeep();
	conFileTime("Server Started");
	diag_log ("debug_console" callExtension ("i"));

	//enable antihack on test server?
	AHe = true;
	//enable object streaming from db?
	P2DZE_serverStreamObjsEnabled = false;

	//asm performance testing setting
	if (ASM_Enabled) then {
		diag_log("P2DEBUG: ASM_Enabled: " + str ASM_Enabled);
		["OverPoch_Server"] execFSM  "\ASM\fn_ASM.fsm";
	};

	//generate hash for vehicles
	P2DZE_randHashVar = "hash_id" callExtension "id";
	P2DZE_randHashVar = ("_" + P2DZE_randHashVar);
    "debug_console" callExtension (format["Random Hash Variable: (%1)",P2DZE_randHashVar]);

	call compile ("
		with uiNamespace do {
		    if (isNil 'hashIdVar" + P2DZE_randHashVar + "') then {
		        uiNamespace setVariable ['hashIdVar" + P2DZE_randHashVar + "', 'hash_id' callExtension 'rID'];
    			'debug_console' callExtension (format['Hash Generated (rID): (%1)', hashIdVar" + P2DZE_randHashVar + "]);
		    };
		};
	");
};


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

diag_log("P2DEBUG: Is Player Client: 	" + str p2d_client);
diag_log("P2DEBUG: Is Dedicatd Server: 	" + str p2d_server);
diag_log("P2DEBUG: Is Headless Client: 	" + str p2d_headless);

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

/* Client Performannce Settings */

setViewdistance 1500;
setTerraingrid 45;
0 setovercast 0;
0 setFog 0;

/* --------- */

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

//Load in compiled functions
call compile preprocessFileLineNumbers "init\variables.sqf";									//Initilize the Variables (IMPORTANT: Must happen very early)
[] execVM "loadouts.sqf";																		//newspawn loadout variables
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "init\publicEH.sqf";										//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "init\compiles.sqf";										//Compile regular functions
call compile preprocessFileLineNumbers "compile\string_functions.sqf";							//Compile extra string functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";									//Compile trader configs
call compile preprocessFileLineNumbers "compile\fnc_server.sqf";
progressLoadingScreen 1.0;
[] execVM "R3F_ARTY_AND_LOG\init.sqf";
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

[] execVM "\ddopp_taserpack\scripts\init_taser.sqf";
// Set effects control to player
player setVariable ["isTazed", false, true];
player addEventHandler ["HandleDamage",{_this call DDOPP_taser_handleHit}];

if (isServer) then {

	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";

	if (true) then {
		private "_handle";
		_handle = [] execVM "\z\addons\dayz_server\FS_SpawnVehicles\FS_StaticVehicleSpawnCompiles.sqf";
		waitUntil{scriptDone _handle};
	};

	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";

	//Execute server monitor
	_serverMonitor = 	[] execVM "\z\addons\dayz_server\system\server_monitor_preExec.sqf";
};

if (!isDedicated) then {
	[] execVM "system\login.sqf";	
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = ("ZombZ: " + localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "system\player_monitor.sqf";	

	[] execVM "system\SafeZone.sqf";	
	//anti Hack
	[] execVM "system\antihack.sqf"; //requires re-work before re-enable due to setdamage issue! diagnose by commenting out sections.
};
#define RESEC_VERBOSE
#include "\z\addons\dayz_code\system\REsec.sqf"
#include "system\BIS_Effects\init.sqf"

//fnc_crypt =		compile preprocessFileLineNumbers "system\fnc_crypt.sqf";
//[] execVM "cryptTest.sqf";
//diag_log("P2DEBUG: " + str CRYPT_KEY);