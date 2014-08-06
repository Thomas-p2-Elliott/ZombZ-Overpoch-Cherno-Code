//enable ASM
ASM_Enabled = false;

//leave false!
p2d_client = false;
p2d_server = false;
p2d_headless = false;

//enable player2 custom hive dll debugging
P2D_H = true;
P2D_Hp = "P2DEBUG: HIVE DEBUG: ";

if (ASM_Enabled) then {
	diag_log("P2DEBUG: ASM_Enabled: " + str ASM_Enabled);
};

if (hasInterface && !isDedicated) then {
	p2d_client = true;
};

if (isDedicated && !hasInterface || isServer) then {
	p2d_server = true;
	if (ASM_Enabled) then {
		["OverPoch_Server"] execFSM  "\ASM\fn_ASM.fsm"
	};
};

if (!hasInterface && !isDedicated) then {
	p2d_headless = true;
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

//Enabble AntiHack on TestServer
if (isServer) then {
	AHe = false;
	//enable object streaming from db
	P2DZE_serverStreamObjsEnabled = true;
};

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
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";


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
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "system\player_monitor.sqf";	

	[] execVM "system\SafeZone.sqf";	
	//anti Hack
	[] execVM "system\antihack.sqf";
};

#include "\z\addons\dayz_code\system\REsec.sqf"
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"



