_cariI = format ['%1',getPlayerUID player];cariAllowed = [_cariI,'0','0']; // UIDs to allow through skid scan
cariBtbuildings = false; // Destroy buildings after A-bomb detonates
cariBtmsg = 'Shhh no tears,\nOnly dreams now'; // A-bomb message
cariBtunits = true; // Kill players and vehicles after A-bomb detonates
cariBanned = false; // Spawn banned items in box, as50 etc
cariDanceMsg = 'LOLOLOLOLOLOLOLOLOLOLOLOL'; // Dance message
cariHudSize = 0.35; // HUD size 0.1 (smallest) - 0.99 (biggest)
cariHudDist = 15000; // HUD distance to show players (in meters)
cariHudCp = "#01A9DB"; // HUD color player
cariHudCv = "#DF7401"; // HUD color vehicle
cariLoopMessage = 'o hai there'; // Message for delayed kill everyone loop
cariMenuCp = [1,1,1,1]; // Menu color primary
cariMenuCs = [.56,.80,.82,1]; // Menu color secondary
cariMenuCt = [1,.05,.55,1]; // Menu color toggle
cariMorph = 'Pastor'; // Skin to morph players into (Animals will ban)
cariNamalsk = false; // Spawn Namalsk items in box
cariOverwatch = false; // Spawn Overwatch items in box
cariParae = true; // Explode after para drop?
cariParau = 'Cow01'; // Animal/unit to para drop
cariParav = 'Ikarus'; // Object/vehicle to para drop
cariRc = '\z\addons\dayz_server\init\AH.sqf'; // Server file to log
cariRcf = 'server_spawnCleanAnimals'; // Server function to log
if (!isNil "gearDialog_create") then {cariRcfc = gearDialog_create;}; // Client function to log
/* 
	Logged functions and files are output to:
	1. C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\debug_console_[timestamp].txt
	2. C:\Users\YourName\Documents\ArmA 2 Other Profiles\YourName\YourName.vars.ArmA2OAProfile
	3. C:\Users\YourName\AppData\Local\ArmA 2 OA\ArmA2OA.RPT
*//*
Default AH.sqf path:
\z\addons\dayz_server\init\AH.sqf
\z\addons\dayz_server\init\AHconfig.sqfAH files on dedi servers:
super_admins.sqf
normal_admins.sqf
low_admins.sqf
blacklist.sqfDefault server pbo paths:
@DayZ_Epoch_Server\addons\dayz_server.pbo
@DayzOverwatch_Server\Addons\dayz_server.pbo
@Hive\Addons\dayz_server.pbo
@Bliss\addons\dayz_server.pbo
@reality_1.chernarus\addons\dayz_server.pbo
@DayZ_Epoch_CHERNO\addons\dayz_server.pbo - JustChil
@DE1000_1\addons\dayz_server.pbo
@DE1000_2\addons\dayz_server.pboDefault config paths for rcon/database:
Epoch:
instance_1_takistan\config.cfg
instance_1_takistan\HiveExt.ini
instance_2_utes\config.cfg
instance_3_shapur_baf\config.cfg
instance_4_zargabad\config.cfg
instance_6_Dingor\config.cfg
instance_7_Lingor\config.cfg
instance_8_ProvingGrounds_PMC\config.cfg
instance_11_Chernarus\config.cfg
instance_12_duala\config.cfg
instance_13_tavi\config.cfg
instance_15_namalsk\config.cfg
instance_16_panthera\config.cfg
instance_18_sahrani\config.cfg
instance_19_poda\config.cfg
instance_20_fapovo\config.cfg
instance_21_caribou\config.cfg
instance_22_SMDsahrani\config.cfg
instance_24_Napf\config.cfg
instance_25_sauerland\config.cfg1.8.1:
cfgdayz\config.cfg
cfgdayz\server.cfgOverwatch:
dayz_overwatch\config_1234.cfg
/*