waitUntil {!isNil "BIS_fnc_init"};
waituntil{isNil "sm_done"};
/* ********************************************************************************* */
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ******************Copr. ©2012-2014 infiSTAR all rights reserved****************** */
/* ***credits to Monky who created and came up with the Anti-Hack in first place!*** */
/* ******credits to Hangender for some checks and updates he really is GOSU********* */
/* ****************may ONLY be sold by BlurGaming.com & infiSTAR.de***************** */
/* *********************************infiSTAR@ok.de********************************** */
/*  Key to open the menu  */ _OpenMenuKey = 0x3C;    /* http://community.bistudio.com/wiki/DIK_KeyCodes */
/*  AdminPassword         */ _AdminPassword = "doobies";

/*  USE ANTIHACK?         */ _UAH =  false;   /* true or false */
/*  Mod OverWatch ?       */ _MOW = true;   /* true or false */
/*  Mod EPOCH ?           */ _MEH = true;   /* true or false */

/*  LOW ADMIN HERE        */ PV_LowLevel_List = [];
/*  NORMAL ADMIN HERE     */ PV_NormalLevel_List = [];											//buttons,	jason,		hook      gklay			boolean (temp)  Chris, Frosty
/*  SUPER ADMIN HERE      */ PV_SuperLevel_List = ["76561198147422604","37314054","58434118","118450566","81239110","167100166","87062662","31572294","101151366","38064454","235015878","127158918"];
/*  BANNED PLAYER HERE    */ _BLOCKED = [];

/*  Top esc menu TXT      */ _TopOfESC = 'ZombZ Hive 4';
/*  Bottom esc menu TXT   */ _LowerTop = 'Come Back Soon!';
/*  Bottom esc menu TXT2  */ _LowerBottom = 'www.zombz.net';
/*  Color esc menu TXT    */ _EscColor = [0,0.85,0.8,1];
/*  DebugMonitor TXT      */ _BottomDebug = 'ZombZ Hived Servers';

/*  DebugMonitor ITEM     */ _Debugitem = false;    /* _Debugitem = 'your item choice';  or  _Debugitem = false; */

/*  DebugMonitor          */ _DMS =  false;   /* true or false */
/*  BLOCK ALL CMDMenus    */ _BCM =  false;   /* true or false */
/*  Check scrollmenu      */ _CSA =  false;   /* true or false */
/*  Use FileScan ?        */ _UFS =  false;   /* true or false */
/*  Use _AdminPassword ?  */ _APW = false;   /* true or false */
/*  Use cut-scene ?       */ _UCS = false;   /* true or false */
/*  Use SafeZones ?       */ _USZ = true;   /* true or false */
/*  Forbid VON Sidechat   */ _VON = false;   /* true or false */
/*  Use vehicle check?    */ _UVC = false;   /* true or false */
/*  Vehicle WHITELIST     */ _UVW = false;   /* true or false */

/*  ALLOWED  Vehicles     */ _ALLOWED_Vehicles = ['ALL IF _UVW = false'];
/*  FORBIDDEN Vehicles    */ _FORBIDDEN_Vehicles = ['infiSTAR_SpaceShuttle'];
/*  ALLOWED CMDMenus      */ _cMenu = ['','RscMainMenu','RscMoveHigh','#WATCH','#WATCH0','RscWatchDir','RscDisplayClassSelecter','RscDisplayGenderSelect','RscDisplaySpawnSelecter','RscWatchMoreDir','#GETIN','RscStatus','RscCallSupport','#ACTION','#CUSTOM_RADIO','RscRadio','RscGroupRootMenu'];
/*  FORBIDDEN Weapons     */ _ForbiddenWeapons = ['infiSTAR_RAILGUN','PoopGun'];
/* ********************************************************************************* */
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ******************Copr. ©2012-2014 infiSTAR all rights reserved****************** */
/* ***credits to Monky who created and came up with the Anti-Hack in first place!*** */
/* ******credits to Hangender for some checks and updates he really is GOSU********* */
/* ****************may ONLY be sold by BlurGaming.com & infiSTAR.de***************** */
/* ********************************************************************************* */
/* ******YOU ARE NOT ALLOWED TO SHOW, SHARE OR CHANGE ANYTHING BELOW THIS LINE****** */
/* ***************If you are p2 then we know who you are and where you live *********/
/**************************You do not have permission to use this********************/


loadFile = 'STRING';publicVariable 'loadFile';
rcallVarcode = 'STRING';publicVariable 'rcallVarcode';
createTeam = 'STRING';publicVariable 'createTeam';
addTeamMember = 'STRING';publicVariable 'addTeamMember';
removeTeamMember = 'STRING';publicVariable 'removeTeamMember';
saveStatus = 'STRING';publicVariable 'saveStatus';
loadStatus = 'STRING';publicVariable 'loadStatus';
saveVar = 'STRING';publicVariable 'saveVar';


_agent = createAgent ["Sheep", [0,0,0], [], 0, "FORM"];
_agent allowdamage false;
_agent disableAI "MOVE";
_agent disableAI "ANIM";


if ((preProcessFileLineNumbers ("low_admins.sqf")) != "") then {
	_tmpLA = call compile preProcessFileLineNumbers "low_admins.sqf";
	PV_LowLevel_List = PV_LowLevel_List + _tmpLA;
};
if ((preProcessFileLineNumbers ("normal_admins.sqf")) != "") then {
	_tmpNA = call compile preProcessFileLineNumbers "normal_admins.sqf";
	PV_NormalLevel_List = PV_NormalLevel_List + _tmpNA;
};
if ((preProcessFileLineNumbers ("super_admins.sqf")) != "") then {
	_tmpSA = call compile preProcessFileLineNumbers "super_admins.sqf";
	PV_SuperLevel_List = PV_SuperLevel_List + _tmpSA;
};
if ((preProcessFileLineNumbers ("blacklist.sqf")) != "") then {
	_tmpBL = call compile preProcessFileLineNumbers "blacklist.sqf";
	_BLOCKED = _BLOCKED + _tmpBL;
	_BLOCKED
};
publicVariable "PV_LowLevel_List";
publicVariable "PV_NormalLevel_List";
publicVariable "PV_SuperLevel_List";
_adminlist = PV_LowLevel_List + PV_NormalLevel_List + PV_SuperLevel_List;


_fnc_RandomGen =
{
	_arr = ["aaa","bbb","ccc","ddd","eee","fff","ggg","hhh","iii","jjj","kkk","lll","mmm","nnn","ooo","ppp","xxx","yyy","zzz","000","111","222","333","444","555","666","777","888","999"];
	_gen = "PV_";
	for "_i" from 1 to 6 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen
};
_randx0 = call _fnc_RandomGen;
_randx1 = call _fnc_RandomGen;
_randx2 = call _fnc_RandomGen;
_randx3 = call _fnc_RandomGen;
_randx4 = call _fnc_RandomGen;
_randx5 = call _fnc_RandomGen;
_randx6 = call _fnc_RandomGen;
_randx8 = call _fnc_RandomGen;
_randx9 = call _fnc_RandomGen;
_randx10 = call _fnc_RandomGen;
_randx12 = call _fnc_RandomGen;
_randx13 = call _fnc_RandomGen;
_randx19 = call _fnc_RandomGen;
_randx21 = call _fnc_RandomGen;
_randx22 = call _fnc_RandomGen;
_randx26 = call _fnc_RandomGen;
_randx27 = call _fnc_RandomGen;
_randx27a = call _fnc_RandomGen;
_randx28 = call _fnc_RandomGen;







/*
	AntiHack Part 1 - START
*/
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - AntiHack 1 Loading...");
_randx10 = 'PVAHR_'+(str (round(random 999999)));_randx12 = 'PVAHR_'+(str (round(random 999999)));PV_TMPBAN = ['',''];PublicVariable 'PV_TMPBAN';
PV_hackerL0og = [["  No -HackerLog- Entries",'','0','1','0','0',[]]]+[["--------------------",'','0','1','0','0',[]]];PublicVariable "PV_hackerL0og";
PV_SurveillanceLog = [["  No -SurveillanceLog- Entries",'','0','1','0','0',[]]]+[["--------------------",'','0','1','0','0',[]]];PublicVariable "PV_SurveillanceLog";
PV_writeAdmin_log_ARRAY = [["Admin Log"]];publicVariable "PV_writeAdmin_log_ARRAY";
PV_b0x_array = [];publicVariable "PV_b0x_array";
[_ALLOWED_Vehicles,_FORBIDDEN_Vehicles,_UVW,_UVC] spawn {
	_allowedVeh = _this select 0;
	_forbiddenVeh = _this select 1;
	_UVW = _this select 2;
	_vehicleCheck = _this select 3;
	_checked = [];
	PV_filluLog_arr = [];
	while {true} do {
		{
			_id = getPlayerUID _x;
			if (_id != '') then 
			{
				_name = name _x;
				if !(_id in PV_filluLog_arr) then 
				{
					_stime = time;
					_hours = (_stime/60/60);
					_hours = toArray (str _hours);
					_hours resize 1;
					_hours = toString _hours;
					_hours = compile _hours;
					_hours = call  _hours;
					_minutes = round(_stime/60);
					_minutes2 = _minutes - (_hours*60);
					PV_filluLog_arr = PV_filluLog_arr + [(_name),(_id),(format ['| %1h %2min',_hours,_minutes2])];
					publicVariable 'PV_filluLog_arr';
				};
			};
		} forEach ([0,0,0] nearEntities 1000000000);
		
		if (_vehicleCheck) then 
		{
			_veh = vehicles - _checked;
			{
				_checked = _checked + [_x];
				if ((_x iskindof "Air") or (_x iskindof "Ship") or (_x iskindof "LandVehicle")) then 
				{
					if ((!(typeOf _x in _allowedVeh) && (_UVW)) || (typeOf _x in _forbiddenVeh)) then {deleteVehicle _x;};
				};
			} forEach _veh;
		};
		sleep 5;
	};
};
[] spawn {
	_Persistent = str(BIS_MPF_ServerPersistentCallsArray);
	while {true} do {
		if (str(BIS_MPF_ServerPersistentCallsArray) != _Persistent) then {
			call compile format["BIS_MPF_ServerPersistentCallsArray = %1;",_Persistent];
		};
		sleep 1;
	}; 
};
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - AntiHack 1 Loaded!");
/*
	AntiHack Part 1 - END
*/


/*
	AntiHack Part 2 - START
*/
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - AntiHack 2 Loading...");
call compile ("
"+_randx1+" = {
	"+_randx27a+" = true;
	if ("+str _UAH+") then {
		[] spawn {
			if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [1];
			while {true} do 
			{
				if (str("+_randx26+") != str(getPlayerUID player)) then {failMission 'LOSER';};
				
				if (str(typename player) != str('OBJECT')) exitWith {
					"+_randx10+" = [str(name player),str(getPlayerUID player),(format['Type: %1 - Player load failure..',(str(typename player))])];
					publicVariableServer '"+_randx10+"';
					failMission 'LOSER';
				};
				
				if (str (true) != 'true') exitWith {
					"+_randx10+" = [name player, getPlayerUID player, toArray 'True Not True', toArray (str (true))];
					publicVariableServer '"+_randx10+"';
					[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
				};
				
				{
					call compile format ['if (typeName (%1) == ''STRING'') then 
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray ''TypeError'', toArray (str(typeName (%1)))];
						publicVariableServer ''"+_randx10+"'';
						[] spawn {sleep 2;failMission ''LOSER'';};[] spawn "+_randx8+";
					};',_x];
				} forEach ['closeDisplay','displayRemoveAllEventHandlers',
				'ctrlRemoveAllEventHandlers','groupIconsVisible','removeMagazine',
				'removeWeapon','removeAction','in','true','spawn',
				'do','displayCtrl','vehicle player','player',
				'select','exitWith','or','and','visibleMap'];
				sleep 2;
			};
			"+_randx10+" = [name player, getPlayerUID player, toArray 'TypeCheck', toArray 'Loop Exited'];
			publicVariableServer '"+_randx10+"';
			[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
		};
		[] spawn {
			if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [5];
			waitUntil {((!isNil 'BIS_MPF_remoteExecutionServer') && (!isNil 'RE'))};
			sleep 1;
			_tmpRES = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
			_tmpRE = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExWrite.sqf');
			RE = _tmpRE;
			while {true} do
			{
				XoO111XoXo = _tmpRES;
				RE = _tmpRE;
				BIS_MPF_remoteExecutionServer = {
					_input = (_this select 1) select 2;
					if (_input in ['switchmove','playmove','say','jipexec','execvm','spawn','titleCut','titleText']) then {_this call XoO111XoXo;};
				};
				'remExField' 	addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
				'remExFP' 		addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
				sleep 1;
			};
			"+_randx10+" = [name player, getPlayerUID player, toArray 'REChecks', toArray 'Loop Exited'];
			publicVariableServer '"+_randx10+"';
			[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
		};
		if !(getPlayerUID player in ("+(str _adminlist)+" + "+_randx0+")) then 
		{
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [2];
				_badDisplays = [8];
				while {true} do {
					sleep 0.5;
					if (!isNull (findDisplay 106)) then 
					{
						for '_i' from 0 to 300 do 
						{
							if ((_i != 0) && (_i != 12) && (_i != 18) && (_i != 24) && (_i != 46) && (_i != 49) && (_i != 70) && (_i != 106) && (_i != 55) && (_i != 63)) then 
							{
								if (!isNull (findDisplay _i)) then 
								{
									(findDisplay _i) closeDisplay 0;
									if !(_i in _badDisplays) then 
									{
										_badDisplays = _badDisplays + [_i];
										"+_randx10+" = [name player, getPlayerUID player,(format['_badDisplays: %1',_badDisplays])];
										publicVariableServer '"+_randx10+"';
									};
								};
							};
						};
						if (!isNull (findDisplay 843)) then {(findDisplay 843) closeDisplay 0;"+_randx10+" = [name player, getPlayerUID player, '843'];};
						if (!isNull (findDisplay 6902)) then {(findDisplay 6902) closeDisplay 0;"+_randx10+" = [name player, getPlayerUID player, '6902'];};
						{if (!isNull (findDisplay _x)) then {(findDisplay _x) closeDisplay 0;"+_randx10+" = [name player, getPlayerUID player, str _x];};} foreach _badDisplays;
					};
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'Display106Checks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [3];
				_spaceInterrupt = str(dayz_spaceInterrupt);
				while {true} do 
				{
					if (_spaceInterrupt != str(dayz_spaceInterrupt)) exitWith 
					{
						"+_randx10+" = [name player, getPlayerUID player, ('spaceInterrupt changed')];
						publicVariableServer '"+_randx10+"';
						failMission 'LOSER';
					};
					_grp = group player;_units = units _grp;_cnt = count _units;
					if (_cnt > 1) then {
						{
							if (getplayerUID _x == '') then {deletevehicle _x;};
						} foreach _units;
					};
					sleep 2;
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'SpcInterChecks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [4];
				if (isNil '"+_randx21+"') then {
					[] spawn {
					sleep 20;
						if (isNil '"+_randx21+"') then {
							"+_randx10+" = [player,('AntiHack OFF')];
							publicVariableServer '"+_randx10+"';
							failMission 'LOSER';
						};
					};
				};
				disableSerialization;
				while {true} do {
					"+_randx21+" = ((getPlayerUID player) in [('AntiHack OFF')]);
					
					if (!isNull (findDisplay 106)) then 
					{
						(findDisplay 106) displayRemoveAllEventHandlers 'KeyDown';
						(findDisplay 106) displayRemoveAllEventHandlers 'KeyUp';
					};
					if (!isNull (findDisplay 49)) then 
					{
						(findDisplay 49) displayRemoveAllEventHandlers 'KeyDown';
						(findDisplay 49) displayRemoveAllEventHandlers 'KeyUp';
					};
					if (!isNull (finddisplay 24)) then 
					{
						(findDisplay 24) displayRemoveAllEventHandlers 'KeyDown';
						(findDisplay 24) displayRemoveAllEventHandlers 'KeyUp';
					};
					((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
					((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
					
					if (isNil{player getVariable 'nameOfMAV'}) then {onMapSingleClick '';};
					if (((isNil{player getVariable 'nameOfMAV'}) && ("+str _MOW+")) || !("+str _MOW+")) then
					{
						for '_i' from 0 to 200 do 
						{
							if (!isNull (findDisplay _i)) then 
							{
								(findDisplay _i) displayRemoveAllEventHandlers 'KeyDown';
								(findDisplay _i) displayRemoveAllEventHandlers 'KeyUp';
							};
						};
						(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
						(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
						
						(findDisplay 46) displayAddEventHandler ['KeyDown','_this call dayz_spaceInterrupt','_this call bis_fnc_halo_keydown','_this call bis_fnc_halo_para_keydown'];
						(findDisplay 46) displayAddEventHandler ['KeyUp','_this call "+_randx6+"'];
						if ((vehicle player) iskindof 'ParachuteBase') then {
							bis_fnc_halo_keydown_eh = (finddisplay 46) displayaddeventhandler ['keydown','_this call bis_fnc_halo_keydown;','_this call bis_fnc_halo_keydown','_this call bis_fnc_halo_para_keydown'];
							bis_fnc_halo_para_mousemoving_eh = (finddisplay 46) displayaddeventhandler ['mousemoving','_this call bis_fnc_halo_para_loop;'];
							bis_fnc_halo_para_mouseholding_eh = (finddisplay 46) displayaddeventhandler ['mouseholding','_this call bis_fnc_halo_para_loop;'];
							bis_fnc_halo_para_keydown_eh = (finddisplay 46) displayaddeventhandler ['keydown','_this call bis_fnc_halo_para_keydown;','_this call bis_fnc_halo_keydown','_this call bis_fnc_halo_para_keydown'];
						};
					};
					
					if ((isNull (findDisplay 41144)) && (isNull (findDisplay 50666)) && (isNull (findDisplay 6902)) 
					&& (isNull (findDisplay 6903)) && (isNull (findDisplay 6904)) && (isNull (findDisplay 6905)) 
					&& (isNull (findDisplay 106)) && (isNull (findDisplay -1)) && !(ctrlEnabled 1900)) then {closeDialog 0;};
					sleep 0.5;
					if ((isNull (findDisplay 41144)) && (isNull (findDisplay 50666)) && (isNull (findDisplay 6902)) 
					&& (isNull (findDisplay 6903)) && (isNull (findDisplay 6904)) && (isNull (findDisplay 6905)) 
					&& (isNull (findDisplay 106)) && (isNull (findDisplay -1)) && !(ctrlEnabled 1900)) then {closeDialog 0;};
					
					if (str(typeName true) != str('BOOL')) then {
						"+_randx10+" = [(str (name player)), getPlayerUID player, toArray 'BadType', toArray (str(typeName true))];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if (!isNull (findDisplay 3030)) exitWith {
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Active Menu', toArray ('3030')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if (!isNull (findDisplay 2929)) exitWith {
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Active Menu', toArray ('2929')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if (!isNull (findDisplay 17)) exitWith {
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Active Menu', toArray ('17')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if (!isNull (findDisplay 162)) exitWith {
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Active Menu', toArray ('162')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if (!isNull (findDisplay 155)) exitWith {
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Active Menu', toArray ('155')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if (!isNull (findDisplay 64)) exitWith {
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Active Menu', toArray ('64')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if (!isNull (uiNamespace getVariable 'RscDisplayRemoteMissions')) exitWith {
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Active Menu', toArray ('RscDisplayRemoteMissions')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if !("+str _UCS+") then {
						_display = uinamespace getvariable 'BIS_dynamicText';
						if (str(_display) != 'No Display') exitWith {
							"+_randx10+" = [name player, getPlayerUID player, toArray 'BIS_dynamicText', toArray (str(_display))];
							publicVariableServer '"+_randx10+"';
							[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
						};
					};
					
					PV_LowLevel_List = [];PV_NormalLevel_List = [];PV_SuperLevel_List = [];
					PV_hackerL0og = nil;PV_SurveillanceLog = nil;PV_writeAdmin_log_ARRAY = nil;
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'DisplayChecks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			if ("+str _UFS+") then {
				[] spawn {
					waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_spawnCheck') || (!isNil 'dayz_locationCheck') || (!isNil 'dayz_slowCheck'))};
					sleep 10;
					preProcessFileLineNumbers 'Scan completed, bad content was';
					while {true} do 
					{
						{
							if ((preProcessFileLineNumbers _x) != '') exitWith
							{
								"+_randx10+" = [name player, getPlayerUID player, toArray 'BadFile', toArray (_x)];
								publicVariableServer '"+_randx10+"';
								[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
							};
							sleep 0.1;
						} forEach ['youtube.dll','Settings312.ini',
						'vg\Run.sqf','vg\Custommenu.sqf','vg\RunAH.sqf','vg\Startup.sqf',
						'scr\exec.sqf','scr\Run.sqf','scr\Custommenu.sqf','scr\RunAH.sqf',
						'scr\Startup.sqf','scr\ahbypass.sqf','cset.sqf',
						'Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf','Scripts\menu.sqf','crinkly\keymenu.sqf','ASM\startup.sqf',
						'RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf','wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf','yolo\startup.sqf',
						'xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf','infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','custom.sqf','WiglegHacks\mainmenu.sqf',
						'bowenisthebest.sqf','Scripts\Menu_Scripts\empty.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf',
						'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf','battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf',
						'infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf','TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','Scripts\startmenu.sqf',
						'Rustler v4\startup.sqf','Rustler v5\startup.sqf','Rustler v4\exec.sqf','Rustler v5\exec.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf',
						'Scripts\exec.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf','Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf',
						'infiSTAR_Confin3d_edit\infiSTAR.sqf','infiSTAR_Confin3d_edit\startup.sqf','RustlerV5\startup.sqf','Startup.sqf',
						'Rustlerv5\exec.sqf.sqf','Rustlerv4\startup.sqf','Rustlerv4\exec.sqf','YoloMenu Updated v6.sqf','Scripts\YoloMenu Updated v6.sqf',
						'ASM\_for_keybinds\mystuff.sqf','wookie_wuat\startup.sqf','gc_menu\starten.sqf','yolo\YoloMenu Updated v6.sqf',
						'gc_menu\uitvoeren.sqf','tm\starthack.sqf','scr_wasteland\menu\initmenu.sqf','scr_wasteland\exec.sqf',
						'infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf','infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf',
						'Demonic Menu\scr\startMenu.sqf','Demonic Menu\TM\STARTMENU.sqf','scr\scr\keybinds.sqf','DayZLegendZ Scripts\mah.sqf',
						'RustleSTAR_Menu\menu\initmenu.sqf','RustleSTAR_Menu\setup\startup.sqf','RustleSTAR_Menu\menu\initmenu.sqf',
						'Pickled Menu 3.0\Scripts\ajmenu.sqf','Pickled Menu 3.0\Scripts\exec.sqf','ShadowyFaze\exec.sqf','DayZLegendZ Scripts\Menu_Scripts\exec.sqf',
						'Scripts\mpghmenu.sqf','DevCon.pbo','DayZLegendZ Scripts\startMenu.sqf','DayZLegendZ Scripts\mah.sqf','EASYTM\start.sqf','Rustler v6\startup.sqf',
						'TotalInjector.exe','Rusterl.exe','drhack.dll','drhack.exe','DayZ-Injector cracked by vovanre.exe',
						'dayz-injector.sqf','DayZ-Injector.dll','HackMenu.exe','d3d199.dll','Scintilla.dll','DayZ-Injector.dll',
						'DayZ-Injector v0.4.exe','CFF-Hook.sqf','CFF-Hook.dll','skriptexecuter2.exe','PEWPEWPEWPEW.dll','Injector.exe',
						'RayHook.dll','@SPX\Spawn Weapon.sqf','@SPX\3b.sqf','MK\Scripts\startup.sqf','Obama Drone 0.5.2.1.exe',
						'NewDayZ.dll','ss3.dll','dll\MyHack.dll','Radar_NewR.exe','YoloHack.dll','BESecureJect.exe','YoloMenu.sqf',
						'hidden.exe','ssl3.dll','DayZNavigator.exe','Spawner.exe','EmptyDll.dll','yolo\startup.sqf',
						'script loader Warrock.exe','infiSTAR.sqf','VX DAYZ.exe','CE_Engine-v5.exe','kenhack\alltome.sqf',
						'kenhack\SM\AH6X_DZ.sqf','kenhack\veshi.sqf','skriptexecuter2.ini','lcc.exe','scripts\new.sqf','new.sqf',
						'Dayz Hack v 1.0.exe','dayz cheat\lcc.exe','Scripts\@Hak_script\1.GLAVNOYE\000.sqf','@Hak_script\1.GLAVNOYE\000.sqf',
						'cheater.sqf','scripts\2dmap.sqf','2dmap.sqf','scripts\addweapon.sqf','addweapon.sqf','scripts\ammo 2.sqf',
						'ammo 2.sqf','DayZ-Injector v.0.2.2.exe','DayZ AimJunkies.exe','CheatDayZUniversal.exe',
						'DayZ Private AIM,MAP,WH v1.2.exe','AimJunkies.exe','FABISDayZLauncher.exe',
						'@mHlopchik\Menu_Scripts\menu\keybind\funmenu','@mHlopchik\Menu_Scripts\exec.sqf','invisible.sqf',
						'gluemenu.sqf','DayZ Item spawner.exe','Dayz AIM ESP Shield.exe','Scripts\Menu_Scripts\ChernoNuke.sqf',
						'Menu_Scripts\ChernoNuke.sqf','ChernoNuke.sqf','Nuke.sqf','Scripts\Menu_Scripts\NWAFNuke.sqf','NWAFNuke.sqf',
						'Scripts\Menu_Scripts\newsbanner.sqf','newsbanner.sqf','Scripts\Menu_Scripts\ElektroNuke.sqf','ElektroNuke.sqf',
						'Scripts\Nuke.sqf','Scripts\different_AK\AKS-74 Kobra.sqf','Scripts\ESP\esp_TEST.sqf','ESP\esp_TEST.sqf',
						'esp_TEST.sqf','esp.sqf','Scripts\GodMode.sqf','GodMode.sqf','Scripts\God mode 1.sqf','God mode 1.sqf',
						'MapHack.sqf','infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf','@Hak_script\1.Teleport.sqf',
						'@Hak_script\3.Glom_Hits\6.Mass_?ill.sqf','Mass_?ill.sqf','TheBatmanHack v2.6.exe','X-ray.exe','Project1.exe',
						'Dayz injector-by vovan.exe','explode_all.sqf','explode.sqf','Ubu5Ukg3.sqf'];
						sleep 300;
					};
					"+_randx10+" = [name player, getPlayerUID player, toArray 'ScriptChecks', toArray 'Loop Exited'];
					publicVariableServer '"+_randx10+"';
					[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
				};
			};
			"+_randx4+" = {
				if (isNil '"+_randx5+"') then
				{
					"+_randx5+" = true;
					"+_randx10+" = [name player, getPlayerUID player, _this select 0];
					publicVariableServer '"+_randx10+"';
					sleep 1;
					"+_randx5+" = nil;
				};
			};
			"+_randx6+" = {
				_key = _this select 1;
				_shift = _this select 2;
				_ctrl = _this select 3;
				_alt = _this select 4;
				if (_key == 0xD2) then {['Key: Insert'] spawn "+_randx4+";};
				if (_key == 0xD3) then {['Key: Delete'] spawn "+_randx4+";};
				if (_key == 0xC7) then {['Key: Home'] spawn "+_randx4+";};		
				if (_key == 0x3B) then {['Key: F1'] spawn "+_randx4+";};
				if (_key == 0x3C) then {['Key: F2'] spawn "+_randx4+";};
				if (_key == 0x3D) then {['Key: F3'] spawn "+_randx4+";};
				if (_key == 0x42) then {['Key: F8 - tim0n'] spawn "+_randx4+";};
				if (_key == 0x27) then {['Key: ;'] spawn "+_randx4+";};
				if (_key == 0x58) then {['Key: F12'] spawn "+_randx4+";};
				if (_key == 0x29) then {['Key: VG(tild)'] spawn "+_randx4+";};
				if ((_key == 0x29) && _shift) then {['Key: VG(Shift + tild)'] spawn "+_randx4+";};
				if ((_key == 0x19) && _shift) then {['Key: Shift-P'] spawn "+_randx4+";};
				if ((_key == 0x3E) && _alt) then {['Key: Alt-F4'] spawn "+_randx4+";};
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [6];
				while {true} do 
				{
					{
						_WpnCargo = (getWeaponCargo _x) select 1;
						_MagCargo = (getMagazineCargo _x) select 1;
						_CntWpnCargo = count _WpnCargo;
						_CntMagCargo = count _MagCargo;
						_CntSum = (_CntWpnCargo+_CntMagCargo);
						_both = _WpnCargo+_MagCargo;
						_cnt = 0;
						for '_i' from 0 to (count _both)-1 do 
						{
							_cnt = _cnt + (_both select _i);
						};
						
						if ((_CntSum > 200) || (_cnt > 800) || (count ((weapons _x) + (magazines _x)) > 75)) then
						{
							if !(_x in PV_b0x_array) then 
							{
								[_x] spawn {
									_tmpBOX = _this select 0;
									sleep 5;
									if !(_tmpBOX in PV_b0x_array) then
									{
										deleteVehicle _tmpBOX;
										"+_randx10+" = [name player,getPlayerUID player,(format['DELETING HACKBOX: %1',_tmpBOX])];
										publicVariableServer '"+_randx10+"';
									};
								};
							}
							else
							{
								_x hideObject true;
								if (!isNull (findDisplay 106)) then {(findDisplay 106) closeDisplay 0;};
							};
						};
					} foreach (position player nearObjects 12);
					sleep 3;
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'CargoChecks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [7];
				while {true} do
				{
					_items = [currentWeapon player] + (weapons player) + (magazines player) + (items player);
					{
						if (_x in _items) then
						{
							player removeMagazines _x;player removeWeapon _x;
							[_x,_items] spawn
							{
								_current = _this select 0;
								_wpsmags = _this select 1;
								if (_current in ['Mine','MineE']) then 
								{
									for '_i' from 0 to ({_x == _current} count _wpsmags) do {player removeMagazines _current;};
								}
								else
								{
									for '_i' from 0 to ({_x == _current} count _wpsmags) do {player removeWeapon _current;};
								};
							};
							[] spawn {
								sleep 0.5;
								"+_randx10+" = [name player, getPlayerUID player, toArray 'Bad Item', toArray _x];
								publicVariableServer '"+_randx10+"';
							};
						};
					} forEach ("+(str _ForbiddenWeapons)+" + ['GAU8','2A14','2A38M','2A42','2A46M','2A46MRocket','2A70','2A70Rocket','2A72','2B14','57mmLauncher','57mmLauncher_128',
					'57mmLauncher_64','80mmLauncher','9M311Laucher','AALauncher_twice','AGS17','AGS30','AGS30_heli','AirBombLauncher',
					'AT10LauncherSingle','AT11LauncherSingle','AT13LauncherSingle','AT2Launcher','AT5Launcher','AT5LauncherSingle','AT6Launcher',
					'AT9Launcher','AZP85','BAF_GMG','BAF_L2A1','BAF_L7A2','BAF_L94A1','BAF_static_GMG','BikeHorn','BombLauncher','BombLauncherA10',
					'BombLauncherF35','CamelGrenades','CarHorn','Ch29Launcher','Ch29Launcher_Su34','CMFlareLauncher','CRV7_FAT','CRV7_HEPD','CRV7_PG','CTWS',
					'D10','D30','D81','DSHKM','DT_veh','FFARLauncher','FFARLauncher_14','FlareLauncher','GAU12','GRAD','GSh23L','GSh23L_L39','GSh301','GSh302',
					'HeliBombLauncher','HellfireLauncher','HellfireLauncher_AH6','Igla_twice','KORD','KPVT','Laserdesignator_mounted','M119','M120','M134','M134_2',
					'M168','M197','M2','M230','M240_veh','M240_veh_2','M240_veh_MG_Nest','M240BC_veh','M242','M242BC','M252','M256','M2BC','M32_heli','M3P','M621',
					'M68','MaverickLauncher','MiniCarHorn','MK19','MK19BC','Mk82BombLauncher','Mk82BombLauncher_6','MLRS','PKT','PKT_2','PKT_3','PKT_high_AI_dispersion',
					'PKT_high_AI_dispersion_tank','PKT_MG_Nest','PKT_veh','PKTBC','PKTBC_veh','R73Launcher','R73Launcher_2','S8Launcher','SEARCHLIGHT','SGMT',
					'SidewinderLaucher','SidewinderLaucher_AH1Z','SidewinderLaucher_AH64','SidewinderLaucher_F35','SmokeLauncher','SPG9','SportCarHorn','StingerLaucher',
					'StingerLaucher_4x','StingerLauncher_twice','TOWLauncher','TOWLauncherSingle','TruckHorn','TruckHorn2','TwinM134','TwinVickers','VikhrLauncher','YakB',
					'ZiS_S_53']);
					sleep 15;
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'WpnChecks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [8];
				disableSerialization;
				_BadTxt = 0;
				_XBadTxt = 0;
				_done = false;
				while {true} do {
					_chat = (findDisplay 24) displayCtrl 101;
					_txt = ctrlText _chat;
					_txtArray = toArray _txt;
					if (_done) exitWith {failMission 'LOSER';};
					if (count _txtArray > 2) then
					{
						if ((_txtArray select 0 == 47) && (_txtArray select 1 == 109) && (_txtArray select 2 == 59)) then
						{
							_done = true;
							"+_randx10+" = [name player, getPlayerUID player, toArray 'ChatMenu', toArray (_txt)];
							publicVariableServer '"+_randx10+"';
							_chat ctrlSetText '';(findDisplay 24) closeDisplay 0;
							[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
						};
					};
					if ((_txtArray select 0 == 47) && (count _txtArray > 3)) exitWith
					{
						_done = true;
						"+_randx10+" = [name player, getPlayerUID player, toArray 'ChatMenu', toArray (_txt)];
						publicVariableServer '"+_randx10+"';
						_chat ctrlSetText '';(findDisplay 24) closeDisplay 0;
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					if ((59 in _txtArray) && (count _txtArray > 23)) then
					{
						_XBadTxt = _XBadTxt + 1;
						if (_XBadTxt > 1) then {_BadTxt = 0;failMission 'LOSER';};
						"+_randx10+" = [name player, getPlayerUID player,(format['BadTxt: %1',_txt])];
						publicVariableServer '"+_randx10+"';
						_chat ctrlSetText '';
						(findDisplay 24) closeDisplay 0;
					};
					if (((124 in _txtArray) || (95 in _txtArray) || (92 in _txtArray) || (47 in _txtArray)) && (count _txtArray > 5)) then
					{
						_BadTxt = _BadTxt + 1;
						if (_BadTxt > 2) then {_BadTxt = 0;failMission 'LOSER';};
						"+_randx10+" = [name player, getPlayerUID player,(format['BadTxt: %1',_txt])];
						publicVariableServer '"+_randx10+"';
						_chat ctrlSetText '';
						(findDisplay 24) closeDisplay 0;
					};
					if ((str _txtArray == str [33,117,112]) || (str _txtArray == str [33,117,112,116])) then
					{
						_stime = servertime;
						_hours = (_stime/60/60);
						_hours = toArray (str _hours);
						_hours resize 1;
						_hours = toString _hours;
						_hours = compile _hours;
						_hours = call  _hours;
						_minutes = round(_stime/60);
						_minutes2 = _minutes - (_hours*60);
						systemchat ('SERVER UP FOR: '+str _hours+'h '+str _minutes2+'min');
						_chat ctrlSetText '';(findDisplay 24) closeDisplay 0;
					};
					if (!(commandingMenu in "+(str _cMenu)+") || ("+str _BCM+")) then {showCommandingMenu '';};
					sleep 0.25;
					if (_done) exitWith {failMission 'LOSER';};
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'BadTxtChecks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			if ("+str _CSA+") then {
				[] spawn {
					if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [9];
					while {true} do 
					{
						if (!(commandingMenu in "+(str _cMenu)+") || ("+str _BCM+")) then {showCommandingMenu '';};
						if (isNil 's_player_removeActions') then {s_player_removeActions = [];};
						if (isNil 's_player_repairActions') then {s_player_repairActions = [];};
						if (isNil 'r_player_actions2') then {r_player_actions2 = [];};
						if (isNil 'r_player_actions') then {r_player_actions = [];};
						if (isNil 's_player_parts') then {s_player_parts = [];};
						if (isNil 's_player_combi') then {s_player_combi = [];};
						if (isNil 's_player_lockunlock') then {s_player_lockunlock = [];};
						_tempRemoveAction = player addAction ['', '', [], 1, false, true, '', 'false'];
						_startRemove = _tempRemoveAction - 245;
						_endRemove = _tempRemoveAction + 255;
						for '_i' from _startRemove to _endRemove do
						{
							_dayzActions =
							([
								s_player_debug,s_player_calldog,s_player_speeddog,s_player_movedog,
								s_player_followdog,s_player_warndog,s_player_barkdog,s_player_trackdog,s_player_staydog,
								s_player_waterdog,s_player_feeddog,s_player_tamedog,s_player_repair_crtl,s_player_towing,
								s_player_fillgen,s_player_maint_build,s_player_fuelauto2,s_player_fuelauto,s_player_information,
								s_player_upgrade_build,s_player_packvault,s_player_unlockvault,s_player_checkGear,
								s_player_lockUnlock_crtl,s_player_deleteBuild,s_player_pzombiesfeed,s_player_pzombiesattack,
								s_player_pzombiesvision,s_player_callzombies,s_player_removeflare,s_player_grabflare,
								s_player_forceSave,s_player_fillfuel20,s_player_fillfuel5,s_player_lockvault,
								s_player_packFdp,s_player_otkdv,s_player_isCruse,s_player_cnbb,bis_fnc_halo_action,
								s_player_rest,s_player_flipvehiclelight,s_player_flipvehicleheavy,s_player_1bupd,
								s_halo_action,s_player_smelt_scrapmetal,s_player_grabflare,s_player_removeflare,
								s_player_smelt_engineparts,s_player_smelt_fueltank,s_player_smelt_windscreenglass,
								s_player_smelt_mainrotoraryparts,s_player_smelt_wheel,s_player_smelt_jerrycan,
								s_player_flipveh,s_player_fillfuel,s_player_dropflare,s_player_butcher,s_player_cook,
								s_player_boil,s_player_fireout,s_player_packtent,s_player_sleep,s_player_studybody,
								NORRN_dropAction,s_player_selfBloodbag,s_clothes,s_player_holderPickup,
								s_player_recipeMenu,s_player_deleteCamoNet,s_player_netCodeObject,s_player_codeRemoveNet,
								_handle,s_player_enterCode,s_player_codeObject,s_player_codeRemove,s_player_disarmBomb,
								unpackRavenAct,disassembleRavenAct,launchRavenAct,strobeRavenResetAct,strobeRavenTestAct,
								batteryLevelCheckRavenAct,batteryRechargeRavenAct,mavBaseStationActionName_00,mavBaseStationActionName_001,
								mavBaseStationActionName_01,mavBaseStationActionName_02,mavBaseStationActionName_03,mavBaseStationActionName_04,
								s_player_dance,s_player_igniteTent
							] + s_player_removeActions + s_player_repairActions + r_player_actions + r_player_actions2 + s_player_parts + s_player_combi + s_player_lockunlock);
							if !(_i in _dayzActions) then {player removeAction _i;vehicle player removeAction _i;};
						};
						sleep 0.2;
					};
					"+_randx10+" = [name player, getPlayerUID player, toArray 'ActionChecks', toArray 'Loop Exited'];
					publicVariableServer '"+_randx10+"';
					[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
				};
			}else{if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [9];};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [10];
				_object = (vehicle player);
				_oldpos = getPos _object;
				_dist = 0;
				_state = true;
				while {true} do 
				{
					_state = visibleMap;
					if (_state) then 
					{
						_object = (vehicle player);
						_oldpos = getPos _object;
					};
					sleep 1;
					if (_state) then 
					{
						_dist = _oldpos distance _object;
						if (_dist > 1111) then 
						{
							_object setPos _oldpos;
							"+_randx10+" = [(name player),(getPlayerUID player),(format['distance 1sec: %1',_dist])];
							publicVariableServer '"+_randx10+"';
						};
					};
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'AntiTP', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [11];
				waitUntil {sleep 1;((ctrlText ((findDisplay 24) displayCtrl 101)) == '.ban '+name player+' true;')};
				disableSerialization;((findDisplay 24) displayCtrl 101) ctrlSetText '';(findDisplay 24) closeDisplay 0;
				if (true) exitWith {"+_randx12+" = [getPlayerUID player];publicVariableServer '"+_randx12+"';sleep 0.5;failMission 'LOSER';};
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [12];
				while {true} do 
				{
					{
						if !(isNil _x) exitWith 
						{
							"+_randx10+" = [name player, getPlayerUID player, toArray 'BadVar', toArray _x];
							publicVariableServer '"+_randx10+"';
							[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
						};
					} forEach ['adminlite','adminlitez','antihacklite','AntihackScrollwheel','Admin_Lite_Menu','admingod','adminESPicons','adminicons',
					'adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','BIS_MPF_remoteExecutionServer4',
					'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','RustlerX_list','zeus_star','ZombieShield','igodokxtt','tmmenu','adminadd',
					'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','RustlerX_toggled',
					'fn_esp','aW5maVNUQVI_re_1','RustlerXadd','passcheck','thfile','isInSub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock',
					'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','exstr',
					'adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR',
					'HDIR','YOLO','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu',
					'p','fffffffffff','markPos','pos','marker','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15',
					'mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0',
					'omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve',
					'selecteditem','moptions','delaymenu','gluemenu','g0dmode','zeus','zeusmode','cargod','infiSTAR_fillHax','nuke','itemmenu','sandshrew',
					'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','infiSTAR_FILLPLAYER','whitelist',
					'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp',
					'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon',
					'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820',
					'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d',
					'shnmenu','xtags','pm','lmzsjgnas','vm','bowen','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp',
					'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','bowonky','Ruslter','aimbott','Admin_Layout','markeresp',
					'helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc',
					'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279',
					'tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7',
					'Rustler_RE','bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu',
					'yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia',
					'eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star',
					'PVAH_AdminRequest','PVAH_WriteLogRequest','PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras',
					'raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode',
					'vars','MENUTITLE','wierdo','fnc_allunits','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','firstrun','ohhpz','fn_genStrFront',
					'kickable','stop','possible','friendlies','take1','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep',
					'jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList',
					'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27',
					'ESPEnabled','wpnbox','admin_filllist_stored','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray'];
					sleep 12;
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'VariableChecks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [13];
				_name = name player;_puid = getPlayerUID player;
				{
					if (_name == _x) then 
					{
						"+_randx10+" = [_name,_puid, toArray 'BadName', toArray 'NoCake'];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
				} forEach ['','infiSTAR','Dami','DamiCC','Fonzy','Russypoo','Rustler Faggots','QuickShotzKeyz'];
			};
			[] spawn {
				if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [14];
				while {true} do
				{
					if ((groupIconsVisible select 0) || (groupIconsVisible select 1)) then
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray 'Group Icons', toArray (str groupIconsVisible)];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					
					if ((ctrlEnabled ((uiNamespace getvariable 'BIS_dynamicText') displayctrl 9999)) or (ctrlShown ((uiNamespace getvariable 'BIS_dynamicText') displayctrl 9999))) then
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray ('ESP'), toArray ('ON')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					
					if ((unitRecoilCoefficient player != 1) && ((!isNull player) && (alive player))) then
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray ('NoRecoil'), toArray (unitRecoilCoefficient player)];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					
					_time = str time;
					if ((_time == 'asdasggd') || (_time == 'celebi')) then
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray ('BadVar'), toArray (_time)];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
					
					sleep 2;
				};
				"+_randx10+" = [name player, getPlayerUID player, toArray 'E_S_P_Checks', toArray 'Loop Exited'];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			systemChat ('Successfully Loaded In.');
		};
	};
	"+_randx27+" = true;
	
	[] spawn {
		while {true} do {
			disableSerialization;
			_display = findDisplay 49;
			if (!isNull _display) then 
			{
				if (isNil 'save_gear_00') then 
				{
					save_gear_00 = true;
					if (!isNil 'player_gearSync') then {call player_gearSync;};
					if (!isNil 'dayz_forceSave') then {call dayz_forceSave;};
				};
				_btnTitle0 = _display displayCtrl 523;
				_btnTitle0 ctrlSetText "+(str _TopOfESC)+";
				_btnTitle0 ctrlSetTextColor "+(str _EscColor)+";
				
				_btnTitle1 = _display displayCtrl 121;
				_btnTitle1 ctrlSetText "+(str _LowerTop)+";
				_btnTitle1 ctrlSetTextColor "+(str _EscColor)+";
				
				_btnTitle2 = _display displayCtrl 120;
				_btnTitle2 ctrlSetText "+(str _LowerBottom)+";
				_btnTitle2 ctrlSetTextColor "+(str _EscColor)+";
			}
			else
			{
				save_gear_00 = nil;
			};
			canPickup = true;
			sleep 0.1;
		};
	};
	if ("+str _VON+") then {
		[] spawn {
			disableSerialization;
			_talked_in_side = 0;
			_talked_in_global = 0;
			while {true} do
			{
				_display1 = findDisplay 55;
				_display2 = findDisplay 63;
				if ((!isNull _display1) && (!isNull _display2)) then 
				{
					_txt1 = ctrlText ((findDisplay 55) displayCtrl 101);
					_txt2 = ctrlText ((findDisplay 63) displayCtrl 101);
					_txtchk1 = '\ca\ui\textures\mikrak.paa';
					_txtchk2 = 'Side channel';
					_txtchk3 = 'Global channel';
					if (_txt1 == _txtchk1) then 
					{						
						if (_txt2 == _txtchk2) then {
							hint ( 'Warning: Please do not use voice on Side!' );
							_talked_in_side = _talked_in_side + 1;
						}else{_talked_in_side = 0;};
						
						if (_txt2 == _txtchk3) then {
							hint ( 'Warning: Please do not use voice on Global!' );
							_talked_in_global = _talked_in_global + 1;
						}else{_talked_in_global = 0;};
						
						if (_talked_in_side > 3) then {failMission 'LOSER';};
						if (_talked_in_global > 3) then {failMission 'LOSER';};
					};
				}else{_talked_in_side = 0;_talked_in_global = 0;};
				sleep 0.75;
			};
		};
	};
	if ("+str _DMS+") then {
		[] spawn {
			_item = "+(str _Debugitem)+";
			_state = true;
			while {true} do
			{
				if (str(_item) == 'false') then
				{
					_state = true;
				}
				else
				{
					_state = _item in (magazines player +weapons player);
				};
				
				if (isNil 's_player_debug') then {s_player_debug = -1;};
				if (isNil 'unit_veh') then {unit_veh = vehicle player;};
				if ((s_player_debug == -1) && (_state)) then
				{
					s_player_debug = unit_veh addaction [('<t color=''#0066CC''>' + ('Debug') +'</t>'),'ca\modules\MP\data\scriptCommands\moveIn.sqf','Driver ([] spawn fnc_debugX0);',5,false,false,'',''];
				};
				if ((unit_veh != vehicle player) || !(_state)) then
				{
					unit_veh removeAction s_player_debug;
					unit_veh = nil;
					s_player_debug = -1;
				};
				sleep 1;
			};
		};
		fnc_debugX0 = {
			if (isNil 'debugMonitorX') then 
			{
				debugMonitorX = true;
				[] spawn fnc_debugX;
			}
			else
			{
				debugMonitorX = !debugMonitorX;
				hintSilent '';
				[] spawn fnc_debugX;
			};
		};	
		fnc_debugX = {
			_BottomDebug = "+(str _BottomDebug)+";
			_item = "+(str _Debugitem)+";
			_state = true;
			while {debugMonitorX} do
			{
				if (str(_item) == 'false') then
				{
					_state = true;
				}
				else
				{
					_state = _item in (magazines player +weapons player);
				};
				if !(_state) then {debugMonitorX = false;hintSilent '';};
				
				_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
				if (player == vehicle player) then {_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
				}else{_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));};
				
				_txt = '';
				_txt = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));
				
				_stime = servertime;
				_hours = (_stime/60/60);
				_hours = toArray (str _hours);
				_hours resize 1;
				_hours = toString _hours;
				_hours = compile _hours;
				_hours = call  _hours;
				_minutes = round(_stime/60);
				_minutes2 = _minutes - (_hours*60);
				
				hintSilent parseText format [""
				<t size='1' font='Bitstream' align='Center' >[%1]</t><br/>
				<img size='4.75' image='%4'/><br/>
				<t size='1' font='Bitstream' align='left' color='#CC0000'>Blood: </t><t size='1' font='Bitstream' align='right'>%2</t><br/>
				<t size='1' font='Bitstream' align='left' color='#0066CC'>Humanity: </t><t size='1' font='Bitstream' align='right'>%3</t><br/>
				<br/>
				<t size='1' font='Bitstream' align='left' color='#FFBF00'>UPTIME: </t><t size='1' font='Bitstream' align='right'>%5h %6min</t><br/>
				<t size='1' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='1' font='Bitstream' align='right'>%8</t><br/>
				<t size='1' font='Bitstream' align='Center' color='#CC0000'>%7</t>
				"",
				_txt,
				(r_player_blood),
				round (player getVariable['humanity', 0]),
				_pic,
				_hours,
				_minutes2,
				_BottomDebug,
				(round diag_fps)
				];
				sleep 1;
			};
		};
		[] spawn fnc_debugX0;
	};
};
"+_randx9+" = {
	if ("+str _UAH+") then {
		if (isNil '"+_randx22+"') then {"+_randx22+" = [];};"+_randx22+" = "+_randx22+" + [15];
		[] spawn {
			sleep 15;
			{
				if !(_x in "+_randx22+") then 
				{
					"+_randx10+" = [name player, getPlayerUID player, toArray ('AH Load Error'), toArray (_x)];
					publicVariableServer '"+_randx10+"';
					[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
				};
			} forEach [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
		};
		while {true} do {
			if !("+str _UCS+") then {
				bis_fnc_dynamicText = {
					"+_randx10+" = [name player, getPlayerUID player, toArray ('dynamicText'), toArray (_this select 0)];
					publicVariableServer '"+_randx10+"';
					[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
				};
			};
			BIS_fnc_invAdd = 
			{
				"+_randx10+" = [name player, getPlayerUID player, (_this select 1)];
				publicVariableServer '"+_randx10+"';
				_fnc_invAdd = compile preprocessFileLineNumbers 'ca\modules\functions\inventory\fn_invAdd.sqf';
				_state = [player,(_this select 1)] call _fnc_invAdd;
				_state
			};
			BIS_fnc_spawnCrew = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('spawnCrew'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_spawnGroup = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('spawnGroup'), toArray (str missionStart)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_help = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('help'), toArray (str missionStart)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_3Dcredits = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('3Dcredits'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_crows = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('crows'), toArray (str missionStart)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_customGPSvideo = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('customGPSvideo'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_customGPS = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('customGPS'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_destroyCity = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('destroyCity'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_dirIndicator = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('dirIndicator'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_playVideo = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('playVideo'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_spawnvehicle = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('spawnvehicle'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_spawnEnemy = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('spawnEnemy'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_AAN = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('AAN'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_taskPatrol = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('taskPatrol'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			bis_fnc_taskDefend = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('taskDefend'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_taskAttack = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('taskAttack'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_supplydrop = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('supplydrop'), toArray (_this select 1)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_spotter = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('spotter'), toArray (_this select 0)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			BIS_fnc_listPlayers = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('listPlayers'), toArray (str missionStart)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			
			PV_AdminMenuCode = {
				"+_randx10+" = [name player, getPlayerUID player, toArray ('PV_AdminMenuCode'), toArray (str PV_AdminMenuCode)];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			
			_puid = getPlayerUID player;
			if ((_puid in PV_LowLevel_List) || (_puid in PV_NormalLevel_List) || (_puid in PV_SuperLevel_List) || (_puid in PV_TMPBAN)) then 
			{
				"+_randx10+" = [name player, getPlayerUID player, toArray (str player), toArray ('BLOCKED')];
				publicVariableServer '"+_randx10+"';
				[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
			};
			
			addGroupIcon = 'STRING';
			setGroupIconParams = 'STRING';
			createDiaryRecord = 'STRING';
			createTask = 'STRING';
			createSimpleTask = 'STRING';
			buttonSetAction = 'STRING';
			processDiaryLink = 'STRING';
			createDiaryLink = 'STRING';
			lbSetData = 'STRING';
			profileNamespace = 'STRING';
			exec = 'STRING';
			createTeam = 'STRING';
			saveStatus = 'STRING';
			loadStatus = 'STRING';
			saveVar = 'STRING';
			loadFile = 'STRING';
			markerText = 'STRING';
			rcallVarcode = 'STRING';
			setMarkerAlpha = 'STRING';
			setMarkerBrush = 'STRING';
			setMarkerColor = 'STRING';
			setMarkerDir = 'STRING';
			setMarkerPos = 'STRING';
			setMarkerShape = 'STRING';
			setMarkerSize = 'STRING';
			setMarkerText = 'STRING';
			setMarkerType = 'STRING';
			addWeaponCargo = 'STRING';
			addMagazineCargo = 'STRING';
			setVehicleAmmo = 'STRING';
			setVehicleAmmoDef = 'STRING';
			setWeaponReloadingTime = 'STRING';
			setVehicleInit = 'STRING';
			processInitCommands = 'STRING';
			addMPEventHandler = 'STRING';
			BattleFieldClearance = 'STRING';
			createVehicleLocal = 'STRING';
			setWaypointStatements = 'STRING';
			addWaypoint = 'STRING';
			toLower = 'STRING';
			toUpper = 'STRING';
			if !("+str _MOW+") then {
				openMap = 'STRING';
				onMapSingleClick = 'STRING';
				setMarkerDirLocal = 'STRING';
				setMarkerAlphaLocal = 'STRING';
				setMarkerPosLocal = 'STRING';
				setMarkerTextLocal = 'STRING';
				setMarkerTypeLocal = 'STRING';
				setMarkerColorLocal = 'STRING';
				setMarkerBrushLocal = 'STRING';
				setMarkerSizeLocal = 'STRING';
				setMarkerShapeLocal = 'STRING';
				createMarkerLocal = 'STRING';
			};
			playableUnits = [player,player,player];
			allUnits = [player,player,player];
			vehicles = [player,player,player];
			entities = [player,player,player];
			allMissionObjects = [player,player,player];
			player allowDamage true;
			(vehicle player) allowDamage true;
			
			if (!("+str _USZ+") && !("+str _MEH+")) then 
			{
				if (!isNil 'fnc_usec_damageHandler') then 
				{
					if (str (fnc_usec_damageHandler) == '{}') then 
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray 'fnc_usec_damageHandler', toArray ('{}')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
				};
				if (!isNil 'fnc_usec_unconscious') then 
				{
					if (str (fnc_usec_unconscious) == '{}') then 
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray 'fnc_usec_unconscious', toArray ('{}')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
				};
				if (!isNil 'player_zombieCheck') then 
				{
					if (isNil 'orig_player_zombieCheck') then 
					{
						orig_player_zombieCheck = str(player_zombieCheck);
					};
				};
				if (!isNil 'orig_player_zombieCheck') then 
				{
					if (str(player_zombieCheck) != orig_player_zombieCheck) exitWith 
					{
						"+_randx10+" = [name player, getPlayerUID player, toArray 'player_zombieCheck', toArray ('NotOriginal')];
						publicVariableServer '"+_randx10+"';
						[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
					};
				};
			};
			
			sleep 5;
		};
		"+_randx10+" = [name player, getPlayerUID player, toArray 'FunctionChecks', toArray 'Loop Exited'];
		publicVariableServer '"+_randx10+"';
		[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";
	};
};
"+_randx8+" = {
	_txt1 = ('credits: monky (original maker), hangender (some updates), Blur (dealing with support & sales) and infiSTAR');
	_txt2 = ('by infiSTAR.de');
	for '_i' from 1 to 10 do 
	{
		startLoadingScreen [('ANTIHACK KICK'),('RscDisplayLoadCustom')];
		disableSerialization;
		_display = uiNameSpace getVariable 'BIS_loadingScreen';
		_control1 = _display displayctrl 8400;
		_control2 = _display displayctrl 102;
		_control1 ctrlSetText _txt1;
		_control2 ctrlSetText _txt2;
		progressLoadingScreen (_i/10);
		sleep 0.5;
		if (_i == 10) then 
		{
			failMission 'LOSER';
			for '_j' from 0 to 99 do {(findDisplay _j) closeDisplay 0;};
		};
	};
};
"+_randx3+" = {
	if ((_this select 1) select 2 == 'JIPrequest') then
	{
		_playerObj = (_this select 1) select 0;
		_id = getPlayerUID _playerObj;
		
		_code = 'if !(isServer) then
		{
			[] spawn {
				[] execVM ""ca\Modules\Functions\init.sqf"";
				DZE_teleport = [50000,2000,500,50000,50000];
				waitUntil {((str(typeName(getPlayerUID player)) == str(""STRING"")) && (str(getPlayerUID player) != str("""")))};
				if (getPlayerUID player == ('+str _id+')) then
				{
					waitUntil {(!isNil """+_randx19+""")};
					if (!isNil """+_randx26+""") exitWith {systemchat ""Loaded."";};
					"+_randx26+" = getPlayerUID player;
					[] spawn "+_randx19+";
				};
			};
		};';
		_playerObj setVehicleInit _code;
		processInitCommands;
		clearVehicleInit _playerObj;
	};
};
BIS_MPF_remoteExecutionServer = {'AntiHack BLOCKED'};
[] spawn {
	_"+_randx3+" = str("+_randx3+");
	_BIS_MPF_remoteExecutionServer = str(BIS_MPF_remoteExecutionServer);
	while {true} do 
	{
		if (str("+_randx3+") != _"+_randx3+") then 
		{
			call compile format["""+_randx3+" = %1;"",_"+_randx3+"];
			"+_randx10+" = [('SERVER'), ('randx3 modified!'), (str serverTime)];
			publicVariableServer '"+_randx10+"';
		};
		if (str(BIS_MPF_remoteExecutionServer) != _BIS_MPF_remoteExecutionServer) then 
		{
			call compile format[""BIS_MPF_remoteExecutionServer = %1;"",_BIS_MPF_remoteExecutionServer];
			"+_randx10+" = [('SERVER'), ('remExServer modified!'), (str serverTime)];
			publicVariableServer '"+_randx10+"';
		};
		'remExField' 	addPublicVariableEventHandler {_this call "+_randx3+";};
		'remExFP' 		addPublicVariableEventHandler {_this call "+_randx3+";};
		sleep 1;
	};
};
'"+_randx10+"' addPublicVariableEventHandler
{
	_array = _this select 1;
	_cnt = count _array;
	if ((count PV_hackerL0og) > 100) then
	{
		for '_i' from 0 to 49 do
		{
			PV_hackerL0og = PV_hackerL0og - [PV_hackerL0og select 0];
		};
	};
	if ((count PV_SurveillanceLog) > 100) then
	{
		for '_i' from 0 to 49 do
		{
			PV_SurveillanceLog = PV_SurveillanceLog - [PV_SurveillanceLog select 0];
		};
	};
	if (_cnt == 2) then
	{
		_player = _array select 0;
		_uid = getPlayerUID _player;
		_log = format ['AntiHack Kick: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|', name _player, _uid, 'AntiHack OFF', format ['Time: %1', str (round time)], dayZ_instance];
		diag_log (_log);
		'HackLog' callExtension (_log);
		
		_log2 = format ['Kicked: %1 (%2) REASON: AntiHack OFF', name _player, _uid];
		PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
		
		"+_randx13+" = format ['Kicked: %1 (%2) REASON: AntiHack OFF', name _player, _uid];
		publicVariable '"+_randx13+"';
	};
	if (_cnt == 3) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = _array select 2;
		_log = format ['%1 (%2) | %3 |DayZ Instance: %4|',_name,_uid,_save,dayZ_instance];
		diag_log (_log);
		'SurveillanceLog' callExtension (_log);
		
		_log2 = format ['%1 (%2) | %3 | %4',_name,_uid,round(diag_tickTime),_save];
		PV_SurveillanceLog = PV_SurveillanceLog + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_SurveillanceLog';
	};
	if (_cnt == 4) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_reason = toString (_array select 2);
		_field = toString (_array select 3);
		
		if !(_uid in PV_TMPBAN) then 
		{
			_log = format ['AntiHack TempBan: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|', _name, _uid, _reason, _field, dayZ_instance];
			diag_log (_log);
			'HackLog' callExtension (_log);
			
			_log2 = format ['TempBan: %1 (%2) REASON: %3 (%4)', _name, _uid, _reason, _field];
			PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
			publicVariable 'PV_hackerL0og';
			
			"+_randx13+" = format ['TempBan: %1  Reason: %2 (%3)', _name, _reason, _field];
			publicVariable '"+_randx13+"';
			
			PV_TMPBAN = PV_TMPBAN + [_uid,_name];
			publicVariable 'PV_TMPBAN';
		};
	};
};
if (isNil '"+_randx2+"') then {"+_randx2+" = [];};
if (isNil '"+_randx0+"') then {"+_randx0+" = [];publicVariable '"+_randx0+"';};
'"+_randx12+"' addPublicVariableEventHandler
{
	_array = _this select 1;
	_option = _array select 0;
	"+_randx2+" = "+_randx2+" + [_option];
	"+_randx0+" = "+_randx0+" + [_option];publicVariable '"+_randx0+"';
};
[] spawn {
	while {true} do {
		sleep 15;
		if (str("+_randx0+") != str("+_randx2+")) then 
		{
			{
				_puid = getPlayerUID _x;
				if ((_puid in "+_randx0+") && !(_puid in "+_randx2+")) then 
				{
					_cnt0 = count ("+_randx0+");
					_cnt2 = count ("+_randx2+");
					"+_randx10+" = [name _x,_puid, toArray (_cnt0), toArray (_cnt2)];
					publicVariableServer '"+_randx10+"';
				};
			} forEach playableUnits;
		};
	};
};
"+_randx19+" = {
	waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_spawnCheck') || (!isNil 'dayz_locationCheck') || (!isNil 'dayz_slowCheck'))};
	
	if ("+str _MEH+") then {MOD_EPOCH = true;}else{MOD_EPOCH = false;};
	
	
	_id = [] spawn "+_randx1+";
	if ((isNil '"+_randx27+"') || (isNil '"+_randx27a+"')) then {[] spawn {sleep 10;if (isNil '"+_randx27a+"') then {systemchat ('Loading..');[] spawn "+_randx1+";};};};
	
	
	_puid = getPlayerUID player;
	if ((_puid in "+(str _BLOCKED)+") || (_puid in PV_TMPBAN)) then {[] spawn {sleep 2;failMission 'LOSER';};[] spawn "+_randx8+";};
	if (_puid in ("+(str _adminlist)+" + "+_randx0+")) then
	{
		[] spawn PV_AdminMenuCode;
		'"+_randx13+"' addPublicVariableEventHandler {
			if (!isNil 'admin_announce') then {
				if (admin_announce) then {taskHint [(_this select 1), [1,0,0.1,1], 'taskNew'];};
			};
		};
		(findDisplay 46) displayAddEventHandler ['KeyDown','
		_keyDown = _this select 1;
		if ((_keyDown == 0x57) && (_this select 4)) then {call compile preprocessFileLineNumbers ''admin_start.sqf'';};
		if (_keyDown == 0x42) then {closeDialog 0;};
		if (_keyDown == 0x06) then {call admin_tpdirection;};
		if (_keyDown == 0x17) then {
			if (!isNull cursorTarget) then {
				_ownerID = cursorTarget getVariable[''CharacterID'',''0''];
				cutText [str _ownerID, ''PLAIN DOWN''];
			};
		};
		if (_keyDown == ("+str _OpenMenuKey+")) then {call admin_init;};
		if (_keyDown == 0x44) then {[] call remove_spec_000;};
		if (_keyDown == 0x43) then {closeDialog 0;sleep 0.1;createGearDialog [(waitForGearRequest), ''RscDisplayGear''];};'];
		if (_puid in "+_randx0+") exitWith {systemChat str ("+_randx0+");waitUntil {(!isNull (findDisplay 3030))};
		if (isNil 'AdminLoadOK') then {failMission 'LOSER';};};
		(findDisplay 46) displayAddEventHandler ['KeyUp','
		_keyUp = _this select 1;
		if (_keyUp == 0xD3) then {call adminDelete;};'];
		if ("+str _APW+") then {
		diag_log 'infiSTAR.de ProPlan by infiSTAR.de - Loading Password Login';diag_log str("+str _AdminPassword+");
			if (isNil '"+_randx28+"') then {
				[] spawn {
					while {true} do {
						sleep 0.2;
						if (!isNil '"+_randx28+"') exitWith {(findDisplay 64) closeDisplay 0;cutText ['', 'PLAIN'];};
						disableSerialization;
						waitUntil {sleep 0.2;(isNull (findDisplay 64))};
						if (!dialog) then {createDialog 'RscDisplayPassword';};
						ctrlSetText [1001,'Please Enter The Admin Password'];
						ctrlSetText [1002,'Password Here:'];
						ctrlshow [2,false];
						_display = findDisplay 64;
						_btnCopy2 = _display displayctrl 1;
						_btnCopy2 ctrlSetText 'OK';
						_btnCopy2 buttonSetAction 'call 
						{
							disableSerialization;
							
							_display = findDisplay 64;
							_textCode = _display displayctrl 101;
							_pw = ("+str _AdminPassword+");
							if (ctrlText 101 != _pw) exitWith 
							{
								hint ''WRONG PASSWORD'';
								cutText [''WRONG PASSWORD'', ''BLACK FADED''];
								PVAH_WriteLogRequest = [name player, getPlayerUID player, ''Wrong Password'', ctrlText 101];
								publicVariableServer ''PVAH_WriteLogRequest'';
								sleep 0.1;
								failMission ''LOSER'';
							};
							if (ctrlText 101 == _pw) exitWith 
							{
								cutText [''PASSWORD ACCEPTED'', ''PLAIN''];
								hintsilent ''PASSWORD ACCEPTED'';
								"+_randx28+" = true;
								(findDisplay 64) closeDisplay 0;
								[] spawn {sleep 0.1;(findDisplay 64) closeDisplay 0;};
								systemChat (''Admin - Successfully Loaded In.'');
							};
						};';
						sleep 0.2;
						if (!isNil '"+_randx28+"') exitWith {(findDisplay 64) closeDisplay 0;cutText ['', 'PLAIN'];};
					};
				};
			};
		};
	}
	else
	{
		[] spawn "+_randx9+";
		[] spawn {sleep 15;if (isNil '"+_randx4+"') then {failMission 'LOSER';};};
	};
	if (isNil '"+_randx27+"') then {[] spawn {sleep 25;if (isNil '"+_randx27+"') then {failMission 'LOSER';};};};
	[] spawn {sleep 10;diag_log format['infiSTAR.de ProPlan by infiSTAR.de - %1',("+_randx22+")];};
};
publicVariable """+_randx1+""";
publicVariable """+_randx8+""";
publicVariable """+_randx9+""";
publicVariable """+_randx19+""";
");
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - AntiHack 2 Loaded!");
/*
	AntiHack Part 2 - END
*/





/*
	Admin Menu - START
*/
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - CREATING AdminMenu");
PV_AdminMenuCode = {
	waitUntil {sleep 0.5;!isNull (findDisplay 46)};
	[] spawn {
		while {true} do {
			{
				_id = getPlayerUID _x;
				if (_id != '') then 
				{
					_name = name _x;
					if (_id in PV_TMPBAN) then {
						_do = format["if (name player == '%1') then {failMission 'LOSER';};",_name];
						[_do] spawn admin_d0;
					};
				};
			} forEach ([0,0,0] nearEntities 1000000000);
			sleep 10;
		};
	};	
	inSub = false;
	getControl = {(findDisplay 3030) displayCtrl _this;};
	if (isNil "admin_toggled") then {admin_toggled = [];};
	if (isNil "MOD_EPOCH") then {MOD_EPOCH = false;};
	admin_fillsubsss = 
	{
		adminadd = adminadd + ["Main Menu","MainMenu","0","0","1","0",[0,0.8,0.76,1]];
		adminadd = adminadd + ["Hacker Log","hackerLog","0","0","1","0",[0,0.8,0.76,1]];
		adminadd = adminadd + ["Surveillance Log","SurveillanceLog","0","0","1","0",[0,0.8,0.76,1]];
		adminadd = adminadd + ["View PlayerUIDs","uidLog","0","0","1","0",[0,0.8,0.76,1]];
		adminadd = adminadd + ["View TempBanned","tempbanned","0","0","1","0",[0,0.8,0.76,1]];
		adminadd = adminadd + ["Write Log","WriteLog","0","0","1","0",[0,0.8,0.76,1]];
		if (getPlayerUID player in PV_SuperLevel_List) then 
		{
			adminadd = adminadd + ["WeatherLord ","Weather","0","0","1","0",[0,0.8,0.76,1]];
			adminadd = adminadd + ["TimeLord ","AAATime","0","0","1","0",[0,0.8,0.76,1]];
			adminadd = adminadd + ["  Spawn Vehicle","Vehicles","0","0","1","0",[0,0.8,0.76,1]];
			adminadd = adminadd + ["  Spawn Buildings & Objects","Objects","0","0","1","0",[0,0.8,0.76,1]];
			adminadd = adminadd + ["  Spawn Weapons & Items","Weaponz","0","0","1","0",[0,0.8,0.76,1]];
			adminadd = adminadd + ["  Spawn Player Morph","Skinz","0","0","1","0",[0,0.8,0.76,1]];
			adminadd = adminadd + ["  Spawn Box",admincrate,"0","0","0","0",[]];
			if (MOD_EPOCH) then
			{
				adminadd = adminadd + ["  Spawn Epoch-Box",admincrateEpoch,"0","0","0","0",[]];
			};
		};
	};
	admin_keybinds = {
		adminadd = adminadd + ["BINDINGS:","","0","1","0","0",[]];
		adminadd = adminadd + ["  5 - TP LookingDirection","","0","1","0","0",[]];
		adminadd = adminadd + ["  Delete -> Delete CursorTarget","","0","1","0","0",[]];
		adminadd = adminadd + ["  F9 - ShowGear Target","","0","1","0","0",[]];
		adminadd = adminadd + ["  F10 - UnSpectate Target","","0","1","0","0",[]];
		adminadd = adminadd + ["README:","","0","1","0","0",[]];
		adminadd = adminadd + ["  DoubleClick Player To Spectate","","0","1","0","0",[]];
	};
	SuperAdmin_MENU =
	{
		adminadd = adminadd + ["  Teleport Player To Me",admint2me,"0","0","0","1",[]];
		adminadd = adminadd + ["  Teleport To Player",admintele,"0","0","0","1",[]];
		adminadd = adminadd + ["  Activate [ALT+LeftmouseButton] Map to TP",adminaltteleport,"1","0","0","0",[]];
		adminadd = adminadd + ["  Enable TP Direction Keybind",admin_tpdirection_on,"1","0","0","0",[]];
		adminadd = adminadd + ["  Disable Announcements",admin_show_announcements,"1","0","0","0",[]];
		adminadd = adminadd + ["Markers","","0","1","0","0",[]];
		adminadd = adminadd + ["  Map Player Markers",adminmark,"1","0","0","0",[]];
		adminadd = adminadd + ["  Map Vehicle Markers",adminmarkveh,"1","0","0","0",[]];
		adminadd = adminadd + ["  Map Corpse Markers",adminDEAD,"1","0","0","0",[]];
		adminadd = adminadd + ["  Map Wreck Markers",adminwreck,"1","0","0","0",[]];
		adminadd = adminadd + ["  Map Tent Markers",admintent,"1","0","0","0",[]];
		adminadd = adminadd + ["Icons","","0","1","0","0",[]];
		adminadd = adminadd + ["  Map Icons",adminicons,"1","0","0","0",[]];
		adminadd = adminadd + ["  ESP Icons",adminESPicons,"1","0","0","0",[]];
		adminadd = adminadd + ["Misc","","0","1","0","0",[]];
		adminadd = adminadd + ["  VehicleBoost",admin_vehicleboost,"1","0","0","0",[]];
		adminadd = adminadd + ["  Car God",adminCarGod,"1","0","0","0",[]];
		adminadd = adminadd + ["  Infinite Ammo & No Recoil",adminammo_recoil,"1","0","0","0",[]];
		adminadd = adminadd + ["  Lower Terrain",admin_low_terrain,"1","0","0","0",[]];
		adminadd = adminadd + ["  God",admingod,"1","0","0","0",[]];
		adminadd = adminadd + ["  No Zed Aggro",adminAntiAggro,"1","0","0","0",[]];
		adminadd = adminadd + ["  ZedShield",adminZedshld,"1","0","0","0",[]];
		adminadd = adminadd + ["  Wardrobe",adminskin,"1","0","0","0",[]];
		adminadd = adminadd + ["  Stealth",admininvis,"1","0","0","0",[]];
		adminadd = adminadd + ["  Debug",admin_debug,"1","0","0","0",[]];
		adminadd = adminadd + ["  Admin Lite Menu <3",adminlite,"1","0","0","0",[]];
		
		adminadd = adminadd + ["  Repair Vehicle",adminrepair,"0","0","0","0",[]];
		adminadd = adminadd + ["  Force Disconnect (Self)",{failMission "LOSER";},"0","0","0","0",[]];
		
		
		adminadd = adminadd + ["Targeted Friendly","","0","1","0","0",[]];
		adminadd = adminadd + ["  Spectate Target",adminspec,"0","0","0","1",[]];
		adminadd = adminadd + ["  Show Gear Target",admin_spec_gear,"0","0","0","1",[]];
		adminadd = adminadd + ["  Give Ammo Target",admin_give_ammo,"0","0","0","1",[]];
		adminadd = adminadd + ["  Heal Target",adminheal,"0","0","0","1",[]];
		adminadd = adminadd + ["  Give Target +2500 Humanity",adminHumanityPlus,"0","0","0","1",[]];
		adminadd = adminadd + ["  Give Target -2500 Humanity",adminHumanityMinus,"0","0","0","1",[]];
		adminadd = adminadd + ["  GiveGod Target",{[_this select 0, 1] call adminGiveGod;},"0","0","0","1",[]];
		
		adminadd = adminadd + ["Targeted EVIL","","0","1","0","0",[]];
		adminadd = adminadd + ["  RemoveGod Target",{[_this select 0, 0] call adminGiveGod;},"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Break Target's Legs",adminbreakleg,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  RemoveGear Target",adminremovegear,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Slap Target",adminSlap,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Knockout Target",adminUncon,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Suicide Target",adminSuicide,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Kill Target",adminkill,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Force Disconnect Target",adminFDisconnect,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Kick",adminkick,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Ban",adminban,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Drug Target",adminDrug,"0","0","0","1",[1,0.5,0,1]];
		adminadd = adminadd + ["  Control Target",adminControl,"0","0","0","1",[1,0.5,0,1]];
		
		adminadd = adminadd + ["Change Layout","","0","1","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Medium",{Admin_Layout = 0;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Big",{Admin_Layout = 1;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Center",{Admin_Layout = 2;call admin_init;},"0","0","0","0",[]];
		
		adminadd = adminadd + ["Server Management","","0","1","0","0",[]];
		adminadd = adminadd + ["  Mass Message",adminmsg,"0","0","0","0",[]];
		adminadd = adminadd + ["  Clear Ban List",adminClearBan,"0","0","0","0",[]];
		//adminadd = adminadd + ["  Fix Servers FPS",fixfps,"0","0","0","0",[]];
		//adminadd = adminadd + ["  Delete Boxes",admin_del_bxs,"0","0","0","0",[]];
		adminadd = adminadd + ["  Bypass Anti-TP",adminx_aatp,"0","0","0","0",[]];
		
		call admin_keybinds;
	};
	NormalAdmin_Menu =
	{
		adminadd = adminadd + ["  Teleport Player To Me",admint2me,"0","0","0","1",[]];
		//adminadd = adminadd + ["  Teleport To Player",admintele,"0","0","0","1",[]];
		//adminadd = adminadd + ["  Activate [ALT+LeftmouseButton] Map to TP",adminaltteleport,"1","0","0","0",[]];
		adminadd = adminadd + ["  Disable Announcements",admin_show_announcements,"1","0","0","0",[]];
		adminadd = adminadd + ["Change Layout","","0","1","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Medium",{Admin_Layout = 0;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Big",{Admin_Layout = 1;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Center",{Admin_Layout = 2;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["Toggleable Scripts","","0","1","0","0",[]];
		adminadd = adminadd + ["  Map Player Markers",adminmark,"1","0","0","0",[]];
		adminadd = adminadd + ["  Map Vehicle Markers",adminmarkveh,"1","0","0","0",[]];
		//adminadd = adminadd + ["  God",admingod,"1","0","0","0",[]];
		adminadd = adminadd + ["  Stealth",admininvis,"1","0","0","0",[]];
		adminadd = adminadd + ["Targeted Scripts","","0","1","0","0",[]];
		adminadd = adminadd + ["  Spectate Target",adminspec,"0","0","0","1",[]];
		adminadd = adminadd + ["  Show Gear Target",admin_spec_gear,"0","0","0","1",[]];
		adminadd = adminadd + ["  Break Target's Legs",adminbreakleg,"0","0","0","1",[]];
		adminadd = adminadd + ["  Kill Target",adminkill,"0","0","0","1",[]];
		
		call admin_keybinds;
	};
	LowAdmin_MENU =
	{
		//adminadd = adminadd + ["  Activate [ALT+LeftmouseButton] Map to TP",adminaltteleport,"1","0","0","0",[]];
		adminadd = adminadd + ["  Disable Announcements",admin_show_announcements,"1","0","0","0",[]];
		adminadd = adminadd + ["Change Layout","","0","1","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Medium",{Admin_Layout = 0;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Big",{Admin_Layout = 1;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Menu Layout Center",{Admin_Layout = 2;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["Toggleable Scripts","","0","1","0","0",[]];
		adminadd = adminadd + ["  Map Player Markers",adminmark,"1","0","0","0",[]];
		adminadd = adminadd + ["  Map Vehicle Markers",adminmarkveh,"1","0","0","0",[]];
		adminadd = adminadd + ["Targeted Scripts","","0","1","0","0",[]];
		adminadd = adminadd + ["  Spectate Target",adminspec,"0","0","0","1",[]];
		adminadd = adminadd + ["  Show Gear Target",admin_spec_gear,"0","0","0","1",[]];
		adminadd = adminadd + ["  Break Target's Legs",adminbreakleg,"0","0","0","1",[]];
		adminadd = adminadd + ["  Kill Target",adminkill,"0","0","0","1",[]];
		
		call admin_keybinds;
	};
	admin_tgfnc =
	{
		_toggle = _this select 0;
		if !(_toggle in admin_toggled) then
		{
			lbSetColor [2, _toggle, [0, 1, 0, 1]];
			admin_toggled = admin_toggled + [_toggle];
		}
		else
		{
			lbSetColor [2, _toggle, [1, 0, 0, 1]];
			admin_toggled = admin_toggled - [_toggle];
		};
	};
	admin_dbclick_2 = 
	{
		call compile format ["[""%1""] spawn adminspec;", lbtext [1, (lbCurSel 1)]];
	};
	admin_dbclick =
	{
		_isran = false;
		_code = adminadd select ((lbCurSel 2))*7+1;
		_istoggle = adminadd select ((lbCurSel 2))*7+2;
		_istitle = adminadd select ((lbCurSel 2))*7+3;
		_issubmenu = adminadd select ((lbCurSel 2))*7+4;
		_isplayer = adminadd select ((lbCurSel 2))*7+5;
		if (_istitle == "1") exitWith {};
		if (_issubmenu == "1") then
		{
			if (_code == "Vehicles") exitWith {["normal"] call admin_fillveh};
			if (_code == "Objects") exitWith {call admin_fillobj};
			if (_code == "Weaponz") exitWith {call admin_fillwpn};
			if (_code == "hackerLog") exitWith {call admin_fillhlog};
			if (_code == "WriteLog") exitWith {call admin_fill_writelog};
			if (_code == "SurveillanceLog") exitWith {call admin_fillklog};
			if (_code == "MainMenu") exitWith {call admin_filllist};
			if (_code == "Skinz") exitWith {call admin_fillSkinz};
			if (_code == "uidLog") exitWith {call admin_filluLog};
			if (_code == "tempbanned") exitWith {call admin_filltmpban};
			if (_code == "Weather") exitWith {call admin_weather};
			if (_code == "AAATime") exitWith {call admin_time};
		};
		if (inSub) then
		{
			call compile _code;
			_isran = true;
		};
		if (_istoggle == "1") then
		{
			[] spawn _code;
			[lbCurSel 2] call admin_tgfnc;
			_isran = true;
		};
		if (_isplayer == "1") then
		{
			if ((lbCurSel 1) >= 0) then
			{
				[lbtext [1, (lbCurSel 1)]] spawn _code;
				_isran = true;
			}
			else
			{
				hint "Select a player!";
				_isran = true;
			};
		};
		if ((_isplayer == "0") && !_isran && (typeName _code != "STRING")) then {[] spawn _code;};
	};
	admin__FILL_MENUS = 
	{
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_index = _ctrl lbAdd format["%1", adminadd select _num];
			_togglable = adminadd select (_num+2);
			_istitle = adminadd select (_num+3);
			_issubmenu = adminadd select (_num+4);
			_thcolor = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
			if (_togglable == "1") then
			{
				if (_index in admin_toggled) then
				{
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				} else {_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 0, 0, 1]];};
			};
			if (_istitle == "1") then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0.2, 0.4, 1, 1]];};
			if ((_issubmenu == "1") && (count _thcolor == 0)) then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.8,0.76,1]];};
			if (_isWep__i_n_f_i_S_T_A_R) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (adminadd select _num) >> "picture"))];};
			if (_isVehicle__i_n_f_i_S_T_A_R) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgVehicles" >> (adminadd select _num) >> "picture"))];};
		};
		_isWep__i_n_f_i_S_T_A_R = nil;
		_isVehicle__i_n_f_i_S_T_A_R = nil;
	};
	Admin_Fill_filler = 
	{
		adminadd = adminadd + 
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] +  
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]];
	};
	admin_show_announcements = {
		if (isNil "admin_announce") then {admin_announce = true;} else {admin_announce = !admin_announce;};
		if (admin_announce) then {cutText ["AntiHack Announcements Enabled", "PLAIN"];}else{cutText ["AntiHack Announcements Disabled", "PLAIN"];};
	};
	admin_skin_change = {
		_name = _this select 0;
		_skin = _this select 1;
		if ((_name == name player) or (_name == "")) then 
		{
			closedialog 0;cutText ['','PLAIN',0];Titletext ['','PLAIN',0];endLoadingScreen;0 fadeSound 1;disableUserInput false;
			if (_skin isKindOf 'CAAnimalBase') then {removeAllWeapons player;removeAllItems player;removeBackpack player;};
			[getPlayerUID player, dayz_characterID, _skin] spawn player_humanityMorph;
			waitUntil {typeof player == _skin};
			sleep 0.1;
			vehicle player switchCamera 'EXTERNAL';
		}
		else
		{
			_morph = format ["if (name player == '%1') then
			{
				closedialog 0;cutText ['','PLAIN',0];Titletext ['','PLAIN',0];endLoadingScreen;0 fadeSound 1;disableUserInput false;
				_skin = '%2';
				if (_skin isKindOf 'CAAnimalBase') then {removeAllWeapons player;removeAllItems player;removeBackpack player;};
				[getPlayerUID player, dayz_characterID, _skin] spawn player_humanityMorph;
				waitUntil {typeof player == _skin};
				sleep 0.1;
				vehicle player switchCamera 'EXTERNAL';
			};", _name, _skin];
			[_morph] call admin_d0;
		};
	};
	Admin_fillSkinz = 
	{
		if (isnil "adminaddxxxxx") then {adminaddxxxxx = compile ('
			adminaddmen = [" Player Skins","","0","0","0","0",[0,0.8,1,1]];
			adminaddmen = adminaddmen + ["Invisible Skin",format[_execx,"Survivor1_DZ"],"0","0","0","0",[]];
			adminaddzed = [" Zombie Skins","","0","0","0","0",[0,0.65,0,1]];
			adminaddanimal = [" Animal Skins","","0","0","0","0",[0.5,0,0.2,1]];
			_cfgvehicles = configFile >> "cfgVehicles";
			for "_i" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _i;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Man") && !(_veh_type isKindOf "zZombie_Base") && !(_veh_type == "Survivor1_DZ")) then
					{
						adminaddmen = adminaddmen + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0,0.8,1,1]];
					};
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && !(_veh_type == "zZombie_Base") && (_veh_type isKindOf "zZombie_Base")) then
					{
						adminaddzed = adminaddzed + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0,0.65,0,1]];
					};
					if ((getNumber (_vehicle >> "scope") == 2) && (_veh_type isKindOf "CAAnimalBase") && !(_veh_type == "Cock")) then
					{
						adminaddanimal = adminaddanimal + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0.5,0,0.2,1]];
					};
				};
			};adminadd = adminadd + adminaddmen + adminaddzed + adminaddanimal;');
		};	
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_execx = "[lbtext [1, (lbCurSel 1)],'%1'] spawn admin_skin_change";
		adminadd = [];
		call admin_fillsubsss;
		call adminaddxxxxx;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	adminskin =
	{
		if (isNil "adminskinz") then {adminskinz = 0;};
		if (adminskinz == 0) then
		{
			_formatLine = "[getPlayerUID player,dayz_characterID,'%1'] call player_humanityMorph;
			adminSkin_wardrobe = player addaction [(""<t color=""""#ff8810"""">"" + (""Wardrobe"") +""</t>""),""ca\modules\MP\data\scriptCommands\moveIn.sqf"",
			""Driver (call adminSkin_helper);"",5,false,false,"""",""""];";
			wardrobe =
			[
				["",true],
					["DayZ Clothing", [2], "#USER:WardrobeDayZ", -5, [["expression", ""]], "1", "1"],
					["Custom Clothing", [3], "#USER:WardrobeCustom", -5, [["expression", ""]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			WardrobeCustom =
			[
				["",true],
					["Rocket Uniform", [2],  "", -5, [["expression", format[_formatLine,"Rocket_DZ"]]], "1", "1"],
					["Desert Rocket Uniform", [3],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_Officer_DDPM"]]], "1", "1"],
					["Desert Camo Clothing", [4],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_L_DDPM"]]], "1", "1"],
					["Desert Soldier Uniform", [5],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_DDPM"]]], "1", "1"],
					["Desert Green Uniform", [6],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_MTP"]]], "1", "1"],
					["US Soldier Uniform", [7],  "", -5, [["expression", format[_formatLine,"US_Soldier_EP1"]]], "1", "1"],
					["Czech Soldier Uniform", [8],  "", -5, [["expression", format[_formatLine,"CZ_Soldier_DES_EP1"]]], "1", "1"],
					["Invisible Skin", [9],  "", -5, [["expression", format[_formatLine,"Survivor1_DZ"]]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			WardrobeDayZ =
			[
				["",true],
					["Male Suvivor", [2],  "", -5, [["expression", format[_formatLine,"Survivor2_DZ"]]], "1", "1"],
					["Female Suvivor", [3],  "", -5, [["expression", format[_formatLine,"SurvivorW2_DZ"]]], "1", "1"],
					["Male Bandit", [4],  "", -5, [["expression", format[_formatLine,"Bandit1_DZ"]]], "1", "1"],
					["Female Bandit", [5],  "", -5, [["expression", format[_formatLine,"BanditW1_DZ"]]], "1", "1"],
					["Camo Clothing", [6],  "", -5, [["expression", format[_formatLine,"Camo1_DZ"]]], "1", "1"],
					["Ghillie Suit", [7],  "", -5, [["expression", format[_formatLine,"Sniper1_DZ"]]], "1", "1"],
					["Soldier Uniform", [8],  "", -5, [["expression", format[_formatLine,"Soldier1_DZ"]]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			adminskinz = 1;
			adminSkin_wardrobe = player addaction [("<t color=""#ff8810"">" + ("Wardrobe") +"</t>"),"ca\modules\MP\data\scriptCommands\moveIn.sqf",
			"Driver (call adminSkin_helper);",5,false,false,"",""];
			adminSkin_helper = {showCommandingMenu "#USER:wardrobe";};
		}
		else
		{
			player removeAction adminSkin_wardrobe;
			adminskinz = 0;
		};
	};
	adminlite =
	{
		if (isNil "adminlitez") then {adminlitez = 0;};
		if (adminlitez == 0) then
		{
			antihacklite =
			[
				["",true],
					["Tools", [0], "#USER:AntihackScrollwheel", -5, [["expression", ""]], "1", "1"],
					["Spawn Hake Box", [0],  "", -5, [["expression", "[] spawn admincrate"]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			AntihackScrollwheel =
			[
				["",true],
					["Toggle God Mode", [0],  "", -5, [["expression", "[] spawn admingod"]], "1", "1"],
					["Toggle ESP", [0],  "", -5, [["expression", "[] spawn adminESPicons"]], "1", "1"],
					["Toggle Map Markers", [0],  "", -5, [["expression", "[] spawn adminicons"]], "1", "1"],
					["Toggle Zed Shield", [0],  "", -5, [["expression", "[] spawn adminZedshld"]], "1", "1"],
					["Toggle No Zed Aggro", [0],  "", -5, [["expression", "[] spawn adminAntiAggro"]], "1", "1"],
					["Toggle Vehicle Boost", [0],  "", -5, [["expression", "[] spawn admin_vehicleboost"]], "1", "1"],
					["Toggle Lower Terrain", [0],  "", -5, [["expression", "[] spawn admin_low_terrain"]], "1", "1"],
					["Toggle Admin Debug", [0],  "", -5, [["expression" ,"[] spawn admin_debug"]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Exit", [0], "", -3, [["expression", ""]], "1", "1"]	
			];
			adminlitez = 1;
			Admin_Lite_Menu = player addaction [("<t color=""#6b4ebc"">" + ("Blur's Admin Menu <3") +"</t>"),"ca\modules\MP\data\scriptCommands\moveIn.sqf",
			"Driver (call adminLite_helper);",5,false,false,"",""];
			adminLite_helper = {showCommandingMenu "#USER:antihacklite";};
		}
		else
		{
			player removeAction Admin_Lite_Menu;
			adminlitez = 0;
		};
	};
	admin_filllist =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		if (isNil "admin_filllist_stored") then 
		{
			adminadd = [];
			call admin_fillsubsss;
			if (getPlayerUID player in PV_LowLevel_List) then {call LowAdmin_MENU;};
			if (getPlayerUID player in PV_NormalLevel_List) then {call NormalAdmin_Menu;};
			if (getPlayerUID player in PV_SuperLevel_List) then {call SuperAdmin_MENU;};
			call Admin_Fill_filler;
			admin_filllist_stored = adminadd;
		};
		adminadd = admin_filllist_stored;
		call admin__FILL_MENUS;
	};
	admin_fill_writelog =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		call admin__FILL_MENUS;
		_num = if (count PV_writeAdmin_log_ARRAY > 100) then {(count PV_writeAdmin_log_ARRAY)-100;} else {0;};
		for "_i" from (count PV_writeAdmin_log_ARRAY)-1 to _num step -1 do
		{
			_ctrl lbAdd format["%1", (PV_writeAdmin_log_ARRAY select _i)select 0];
			_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
		};
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
	};
	admin_fillplr =
	{
		disableSerialization;
		_ctrl = 1 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		
		
		_unsorted = playableUnits;
		_sorted = [];
		_pos = position vehicle player;
		{
			  _closest = _unsorted select 0;
			  {if ((position _x distance _pos) < (position _closest distance _pos)) then {_closest = _x}} forEach _unsorted;
			  _sorted = _sorted + [_closest];
			  _unsorted = _unsorted - [_closest]
		} forEach _unsorted;
		_sorted;
		
		_ctrl lbAdd format ["Player: %1",count _unsorted];
		
		_ctrl lbAdd "      Master Admins";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			_puid = getPlayerUID _x;
			if (_puid in PV_SuperLevel_List) then 
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				if (vehicle _x == _x) then 
				{
					_plrpic = "\ca\ca_e\data\flag_blufor_co.paa";
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				}
				else
				{
					_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				};
			};
		} forEach _sorted;
		
		
		_ctrl lbAdd "      Higher Admins";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			_puid = getPlayerUID _x;
			if (_puid in PV_NormalLevel_List) then 
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				if (vehicle _x == _x) then 
				{
					_plrpic = "\ca\ca_e\data\flag_blufor_co.paa";
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				}
				else
				{
					_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				};
			};
		} forEach _sorted;
		
		
		_ctrl lbAdd "      Admins";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			_puid = getPlayerUID _x;
			if (_puid in PV_LowLevel_List) then 
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				if (vehicle _x == _x) then 
				{
					_plrpic = "\ca\ca_e\data\flag_blufor_co.paa";
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				}
				else
				{
					_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				};
			};
		} forEach _sorted;
		
		
		_ctrl lbAdd "";
		
		_ctrl lbAdd "      Normal Player";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			_puid = getPlayerUID _x;
			if ((vehicle _x == _x) && !(_puid in PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
				_plrpic = "\ca\ca_e\data\flag_blufor_co.paa";
				if (side _x == west) then {_plrpic = "\ca\ca_e\data\flag_blufor_co.paa";};
				if (side _x == east) then {_plrpic = "\ca\ca_e\data\flag_opfor_co.paa";};
				if (side _x == resistance) then {_plrpic = "\ca\ca_e\data\flag_indfor_co.paa";};
				if (side _x == civilian) then {_plrpic = "\ca\ca_e\data\flag_white_co.paa";};
				_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
			};
		} forEach _sorted;
		
		_ctrl lbAdd "      In Vehicle";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			if (vehicle _x != _x) then 
			{
				if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then 
				{
					if !(getPlayerUID _x in (PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then
					{
						{
							_ctrl lbAdd format ["%1",name _x];
							_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
							_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
							_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
							_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
						} forEach crew _x;
					};
				};
			};
		} forEach _sorted;
		
		
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
		_ctrl lbAdd "";
	};
	admin_fillveh =
	{
		_state = _this select 0;
		inSub = true;
		_isVehicle__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		_ctrl ctrlSetFont "TahomaB";
		lbclear _ctrl;
		_spwx = "['%1'] call adminsveh;";
		if (_state == "normal") then {_spwx = "['%1'] call adminsveh;";};
		
		if (isNil "Vehicles_in_fi_ST_AR") then 
		{
			adminadd = [];
			call admin_fillsubsss;
			_cfgvehicles = configFile >> "cfgVehicles";
			adminadd = adminadd + ["Air","","0","1","0","0",[]];
			for "_i" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _i;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Air") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
					{
						adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
					};
				};
			};
			adminadd = adminadd + ["Land","","0","1","0","0",[]];
			for "_i" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _i;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
					{
						adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
					};
				};
			};
			adminadd = adminadd + ["Ship","","0","1","0","0",[]];
			for "_i" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _i;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Ship") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
					{
						adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
					};
				};
			};
			Vehicles_in_fi_ST_AR = adminadd;
		};
		adminadd = Vehicles_in_fi_ST_AR;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillobj =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] call adminsobj;";
		adminadd = [];
		call admin_fillsubsss;
		_cfgobjects = configFile >> "cfgVehicles";
		for "_i" from 0 to (count _cfgobjects)-1 do
		{
			_object = _cfgobjects select _i;
			if (isClass _object) then
			{
				_obj_type = configName _object;
				if ((getNumber (_object >> "scope") == 2) && (getText (_object >> "picture") != "") && !((_obj_type isKindOf "ParachuteBase") or (_obj_type isKindOf "BIS_Steerable_Parachute")) && (_obj_type isKindOf "Building")) then
				{
					adminadd = adminadd + ["     "+_obj_type,format[_spwx,_obj_type],"0","0","0","0",[]];
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	ammo_current_wpn_admin = 
	{
		_pWep = currentWeapon player;
		_mags = getArray(configfile >> 'cfgWeapons' >> _pWep >> 'magazines');
		_config = _mags select 0;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		player selectWeapon _item;
		reload player;
		
		_savelog = format['%1 mags for %2',name player,_pWep];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer 'PVAH_WriteLogRequest';
	};
	admin_fillwpn =
	{
		inSub = true;
		_isWep__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] spawn adminweapon;";
		if (isNil "weapons_in_fi_ST_AR") then 
		{
			adminadd = [];
			call admin_fillsubsss;
			adminadd = adminadd + ["--- Ammo Current Wep",ammo_current_wpn_admin,"0","0","0","0",[0,0.8,1,1]];
			_cfgweapons = configFile >> 'cfgWeapons';
			for "_i" from 0 to (count _cfgweapons)-1 do
			{
				_weapon = _cfgweapons select _i;
				if (isClass _weapon) then
				{
					_wpn_type = configName _weapon;
					_plx = toArray _wpn_type;
					_plx resize 7;
					_plx;
					_plx = toString _plx;
					if (_plx != "ItemKey") then {
						if (((getNumber (_weapon >> "scope") == 0) or (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "")) then {
							adminadd = adminadd + [_wpn_type,format[_spwx,_wpn_type],"0","0","0","0",[]];
						};
					};
				};
			};
			weapons_in_fi_ST_AR = adminadd;
		};
		adminadd = weapons_in_fi_ST_AR;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillhlog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_hackerL0og > 100) then {(count PV_hackerL0og)-100;} else {0;};
		for "_i" from (count PV_hackerL0og)-1 to _num step -1 do
		{
			adminadd = adminadd + (PV_hackerL0og select _i);
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillklog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_SurveillanceLog > 100) then {(count PV_SurveillanceLog)-100;} else {0;};
		for "_i" from (count PV_SurveillanceLog)-1 to _num step -1 do
		{
			adminadd = adminadd + (PV_SurveillanceLog select _i);
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_filluLog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		if (isNil "PV_filluLog_arr") then {PV_filluLog_arr = [];};
		for "_i" from 0 to ((count PV_filluLog_arr)-1) do 
		{
			_name = (PV_filluLog_arr select _i);
			_pid = (PV_filluLog_arr select (_i+1));
			_field = (PV_filluLog_arr select (_i+2));
			_log = format["%1 (%2) | %3",_name,_pid,_field];
			adminadd = adminadd + [_log,"","0","1","0","0",[]];
			_i = _i + 2;
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	adminsbando = 
	{
		_selectedID = _this select 0;
		_id = PV_TMPBAN find (_selectedID);
		_name = PV_TMPBAN select (_id+1);
		[_selectedID,_name] call adminUnBan;
	};
	admin_filltmpban = 
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_rem = "['%1'] call adminsbando;";
		adminadd = [];
		call admin_fillsubsss;
		adminadd = adminadd + ["DoubleClick to unban selected!","","0","1","0","0",[]];
		for "_i" from 0 to (count PV_TMPBAN)-1 do 
		{
			_uid = PV_TMPBAN select _i;
			_name = PV_TMPBAN select (_i+1);
			_show = "UID: "+_uid+"  NAME: "+_name;
			adminadd = adminadd + [_show,format[_rem,_uid],"0","0","0","0",[]];
			_i = _i + 1;
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_weather =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;

		adminadd = adminadd + ["     View Distance ","","0","1","0","0",[]];
		adminadd = adminadd + ["      1",{hint "Changing distance to 1";PVAH_AdminRequest = [19,player,1,1];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      500",{hint "Changing distance to 500";PVAH_AdminRequest = [19,player,1,500];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      1000",{hint "Changing distance to 1000";PVAH_AdminRequest = [19,player,1,1000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      2000",{hint "Changing distance to 2000";PVAH_AdminRequest = [19,player,1,2000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      3000",{hint "Changing distance to 3000";PVAH_AdminRequest = [19,player,1,3000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      5000",{hint "Changing distance to 5000";PVAH_AdminRequest = [19,player,1,5000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      7500",{hint "Changing distance to 7500";PVAH_AdminRequest = [19,player,1,7500];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      10000",{hint "Changing distance to 10000";PVAH_AdminRequest = [19,player,1,10000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      12500",{hint "Changing distance to 12500";PVAH_AdminRequest = [19,player,1,12500];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      15000",{hint "Changing distance to 15000";PVAH_AdminRequest = [19,player,1,15000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      20000",{hint "Changing distance to 20000";PVAH_AdminRequest = [19,player,1,20000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["     Overcast ","","0","1","0","0",[]];
		adminadd = adminadd + ["      Clear",{hint "Clear Weather";PVAH_AdminRequest = [19,player,2,0];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      Partly Sunny",{hint "Partly Sunny";PVAH_AdminRequest = [19,player,2,0.2];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      Cloudy",{hint "Cloudy";PVAH_AdminRequest = [19,player,2,0.4];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      Rain",{hint "Rain";PVAH_AdminRequest = [19,player,2,0.6];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      Heavy Rain",{hint "Heavy Rain";PVAH_AdminRequest = [19,player,2,0.8];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      Storm",{hint "Storm";PVAH_AdminRequest = [19,player,2,1];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		call admin__FILL_MENUS;
	};
	admin_time =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;

		adminadd = adminadd + ["     Time Selection ","","0","1","0","0",[]];
		adminadd = adminadd + ["      12 AM",{hint "Changing time to 12AM";PVAH_AdminRequest = [20,player,date,0];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      1 AM",{hint "Changing time to 1AM";PVAH_AdminRequest = [20,player,date,1];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      3 AM",{hint "Changing time to 3AM";PVAH_AdminRequest = [20,player,date,3];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      5 AM",{hint "Changing time to 5AM";PVAH_AdminRequest = [20,player,date,5];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      7 AM",{hint "Changing time to 7AM";PVAH_AdminRequest = [20,player,date,7];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      9 AM",{hint "Changing time to 9AM";PVAH_AdminRequest = [20,player,date,9];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      11 AM",{hint "Changing time to 11AM";PVAH_AdminRequest = [20,player,date,11];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      13 PM",{hint "Changing time to 13PM";PVAH_AdminRequest = [20,player,date,13];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      15 PM",{hint "Changing time to 15PM";PVAH_AdminRequest = [20,player,date,15];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      17 PM",{hint "Changing time to 17PM";PVAH_AdminRequest = [20,player,date,17];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      19 PM",{hint "Changing time to 19PM";PVAH_AdminRequest = [20,player,date,19];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      21 PM",{hint "Changing time to 21PM";PVAH_AdminRequest = [20,player,date,21];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["      23 PM",{hint "Changing time to 23PM";PVAH_AdminRequest = [20,player,date,23];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		call admin__FILL_MENUS;
	};
	admin_init = 
	{
		_stime = servertime;
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = round(_stime/60);
		_minutes2 = _minutes - (_hours*60);
		
		if (isNil "commit_time") then {commit_time = 0;};
		if (isNil "Admin_Layout") then {Admin_Layout = 0;};
		if (isNil "old_Admin_Layout") then {old_Admin_Layout = Admin_Layout;};
		if (Admin_Layout == old_Admin_Layout) then {commit_time = 0;}else{commit_time = 1;old_Admin_Layout = Admin_Layout;};
		
		if !(dialog) then {createDialog "RscConfigEditor_Main";};
		disableSerialization;
		
		if (Admin_Layout == 0) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0.2, 0.2, 0.23, 1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.2, 0.2, 1, 1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["Higher Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["Master Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.485 + 0.02, safezoneY + 0.07, (safezoneWAbs - 0.485 - 0.03)*0.6, (safeZoneH - 0.07 - 0.03)*0.75];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, (0.485)*0.75, (safeZoneH - 0.07 - 0.03)*0.75];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 1) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0.2, 0.2, 0.23, 1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.2, 0.2, 1, 1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["Higher Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["Master Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.485 + 0.02, safezoneY + 0.07, (safezoneWAbs - 0.485 - 0.03)*0.55, (safeZoneH - 0.07 - 0.03)*0.65];
			_ctrl ctrlSetScale 1.55;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, (0.485)*0.65, (safeZoneH - 0.07 - 0.03)*0.65];
			_ctrl ctrlSetScale 1.55;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 2) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0.2, 0.2, 0.23, 1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.2, 0.2, 1, 1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["Higher Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["Master Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min",count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetPosition [safezoneX*0.01, safezoneY + 0.05, 0.38, safezoneH - 0.5];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*-0.7, safezoneY + 0.05, 0.38, safezoneH - 0.5];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*0.01, safezoneY + 0.05, safeZoneW - 1.41, safezoneH - 0.055];
			_ctrl ctrlCommit commit_time;
		};
	};
	admin_give_ammo =
	{
		_name = _this select 0;
		_do = format["if (name player == '%1') then
		{
			_pWep = currentWeapon player;
			_mags = getArray(configfile >> 'cfgWeapons' >> _pWep >> 'magazines');
			_config = _mags select 0;
			_isOK = [player,_config] call BIS_fnc_invAdd;
			_isOK = [player,_config] call BIS_fnc_invAdd;
			_isOK = [player,_config] call BIS_fnc_invAdd;
			reload player;
		};",_name];
		[_do] call R3m0te_RATSifni;
		
		_savelog = format["%1 AdminGiveAmmo %2",name player,_name];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminheal =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [5,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Healing %1", _this select 0];
				
				_savelog = format["%1 AdminHeal %2",name player,name _x];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminrepair =
	{
		_vehicle = vehicle player;
		_vehicle setdamage 0;
		_vehicle setfuel 1;
		(vehicle cursorTarget) setdamage 0;
		(vehicle cursorTarget) setfuel 1;
		hint "Repairing..";
		
		_savelog = format["%1 used admin repair",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	admincrate =
	{
		PVAH_AdminRequest = [6,player];
		publicVariableServer "PVAH_AdminRequest";
		
		_savelog = format["%1 - BOX at %2",name player,mapGridPosition getPos player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	admincrateEpoch =
	{
		PVAH_AdminRequest = [61,player];
		publicVariableServer "PVAH_AdminRequest";
		
		_savelog = format["%1 - EPOCH-BOX at %2",name player,mapGridPosition getPos player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminESPicons = 
	{
		if !("ItemMap" in items player) then 
		{
			_config = ["ItemMap"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		setGroupIconsVisible [true, true];
		_color_list = [0, 1, 0, 1];
		_color_white = [1, 1, 1, 1];
		_color_orange = [1,0.3,0,1];
		_color_red = [1,0,0,1];
		_color_blue = [0, 0, 1, 1];
		_color_yellow  =   [0.85, 0.85, 0, 1];
		
		_color_bluefor_plr = 	[0.047, 0.502, 1, 1];
		_color_opfor_plr =		[1, 0.17, 0.17, 1];
		_color_resistance_plr = [0, 0.65, 0, 1];
		_color_civilian_plr = 	[1, 1, 1, 1];
		
		if (isnil "wpm_adminxxx_") then {wpm_adminxxx_ = 0;};
		if (wpm_adminxxx_ == 0) then 
		{
			wpm_adminxxx_ = 1;
			hint "GroupIcons ON";
			
			_savelog = format["%1 E_S_P Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		} 
		else 
		{
			wpm_adminxxx_ = 0;
			hint "GroupIcons OFF";
			
			_savelog = format["%1 E_S_P Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
		
		while {wpm_adminxxx_ == 1} do
		{
			{
				_side = side _x;
				if !(vehicle _x != _x) then
				{
					clearGroupIcons group _x;
					group _x addGroupIcon ["x_art"];
					
					_clr = _color_bluefor_plr;
					if (_side == west) then {_clr = _color_bluefor_plr};
					if (_side == east) then {_clr = _color_opfor_plr};
					if (_side == resistance) then {_clr = _color_resistance_plr};
					if (_side == civilian) then {_clr = _color_civilian_plr};
					if (getPlayerUID _x in (PV_LowLevel_List + PV_NormalLevel_List + PV_SuperLevel_List)) then {_clr = [0,1,0,1];};
					group _x setGroupIconParams [_clr, format ["%1 --%3-%2m",name _x,round(_x distance player),_side], 1, true];
				};
				if (vehicle _x != _x) then
				{
					_crewnames = [];
					{
						_crewnames = _crewnames + [name _x];
					} forEach crew (vehicle _x);
					clearGroupIcons group _x;
					group _x addGroupIcon ["b_inf"];
					
					_clr = _color_red;
					if (_side == west) then {_clr = _color_bluefor_plr};
					if (_side == east) then {_clr = _color_opfor_plr};
					if (_side == resistance) then {_clr = _color_resistance_plr};
					if (_side == civilian) then {_clr = _color_civilian_plr};
					if (getPlayerUID _x in (PV_LowLevel_List + PV_NormalLevel_List + PV_SuperLevel_List)) then {_clr = [0,1,0,1];};
					group _x setGroupIconParams [_clr, format ["%1 ---[%2]--%4-%3m",
					_crewnames,
					(gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "displayName")),
					round(_x distance player),
					_side], 1, true];
				};
			} forEach playableUnits;
		sleep 1;
		};
		{clearGroupIcons group _x;} forEach playableUnits;
	};
	adminicons = 
	{
		if !("ItemMap" in items player) then 
		{
			_config = ["ItemMap"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		disableSerialization;
		_minimap = (uinamespace getvariable "BIS_RscMiniMap") displayCtrl 101;
		if (isnil "adminx__icons") then 
		{
			adminx__icons = true;
			_map = (findDisplay 12) displayCtrl 51;
			_mapdraw = _map ctrlSetEventHandler ["Draw", "_this call Draw_adminx__icons;"];
			_minimapdraw = _minimap ctrlSetEventHandler ["Draw", "_this call Draw_adminx__icons;"];
			cutText ["Icons Added","PLAIN DOWN"];
			
			_savelog = format["%1 Icons Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		} 
		else 
		{
			adminx__icons = nil;
			_map ctrlremoveeventhandler ["Draw", _mapdraw];
			cutText ["Icons Removed","PLAIN DOWN"];
			
			_savelog = format["%1 Icons Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
		
		Draw_adminx__icons = 
		{
			if (!isnil "adminx__icons") then 
			{
				private["_ctrl"];
				_ctrl =  _this select 0;
				_iscale = (1 - ctrlMapScale _ctrl) max .2;
				_irad = 30;
				_color = [0, 0, 0, 1];
				_icon = "\ca\ui\data\icon_zora_ca.paa";
				
				_objects = vehicles;
				{
					_type = typeOf _x;
					if !((getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName') == 'Wreck') || (_type in ["ClutterCutter_small_2_EP1","UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck_DZ"])) then 
					{
						_icon = getText(configFile >> "CfgVehicles" >> typeOf _x >> "icon");
						_irad = 30;
						
						if ((_x iskindof "Air") or (_x iskindof "Tank")) then 
						{
							_irad = 35;
							_ctrl drawIcon [_icon, [1, 0, 1, 1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
						} 
						else 
						{
							if (_x iskindof "house") then 
							{
								_irad = 30;
								_ctrl drawIcon [_icon, [0,0.4,0.6,1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 0.2];
							}
							else
							{
								_irad = 30;
								_ctrl drawIcon [_icon, [0,0,0.4,1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
							};
						};
					};
				} forEach _objects;
				
				{
					if ((!isnull _x) and !(vehicle _x != _x)) then 
					{
						if (_x == player) then 
						{
							_color = [0, 0, 0, 1];
						} 
						else 
						{
							_color = [1, 0, 0, 1];
						};
						_ctrl drawIcon ["\ca\ui\data\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1];
					};
				} forEach playableUnits;
			};
		};		
	};
	adminwreck =
	{
		if !("ItemMap" in items player) then 
		{
			_config = ["ItemMap"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminwrecks =
		{
			while {markadwreck == 1} do
			{
				_objects = allMissionObjects "SpawnableWreck";
				_objects = _objects + vehicles;
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("adminwrecks" + (str _i));
					
					_selected = _objects select _i;
					_type = typeOf _selected;
					if ((getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName') == 'Wreck') or (_type in ["UH60Wreck_DZ","UH1Wreck_DZ","UH60_NAVY_Wreck_DZ","UH60_ARMY_Wreck_DZ","UH60_NAVY_Wreck_burned_DZ","UH60_ARMY_Wreck_burned_DZ","Misc_cargo_cont_net1","Misc_cargo_cont_net2","Misc_cargo_cont_net3","HMMWVWreck","UralWreck"])) then 
					{
						deleteMarkerLocal ("adminwrecks" + (str _i));
						_vm = createMarkerLocal [("adminwrecks" + (str _i)), getPos _selected];
						_vm setMarkerTypeLocal "SupplyVehicle";
						_vm setMarkerSizeLocal [0.8, 0.8];
						_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName')];
						_vm setMarkerColorLocal ("ColorYellow");
					};
				};
				sleep 2;
			};
			_objects = allMissionObjects "SpawnableWreck";
			_objects = _objects + vehicles;
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminwrecks" + (str _i));};
		};
		if (isNil "markadwreck") then {markadwreck = 0;};
		if (markadwreck == 0) then
		{
			markadwreck = 1;
			hint "2D Map WRECK Markers Activated";
			[] spawn adminwrecks;
			
			_savelog = format["%1 WRECK Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markadwreck = 0;
			hint "2D Map WRECK Markers Disabled";
			
			_objects = allMissionObjects "SpawnableWreck";
			_objects = _objects + vehicles;
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminwrecks" + (str _i));};
			
			_savelog = format["%1 WRECK Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	admintent =
	{
		if !("ItemMap" in items player) then 
		{
			_config = ["ItemMap"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		admintents =
		{
			while {markadtent == 1} do
			{
				_objects = (nearestObjects [player,["TentStorage","StashSmall","StashMedium"], 10000]);
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("admintents" + (str _i));
					
					_selected = _objects select _i;
					_type = typeOf _selected;
					deleteMarkerLocal ("admintents" + (str _i));
					_vm = createMarkerLocal [("admintents" + (str _i)), getPos _selected];
					_vm setMarkerTypeLocal "Camp";
					_vm setMarkerSizeLocal [0.8, 0.8];
					_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName')];
					_vm setMarkerColorLocal ("ColorGreen");
				};
				sleep 2;
			};
			_objects = (nearestObjects [player,["TentStorage","StashSmall","StashMedium"], 10000]);
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("admintents" + (str _i));};
		};
		if (isNil "markadtent") then {markadtent = 0;};
		if (markadtent == 0) then
		{
			markadtent = 1;
			hint "2D Map Tent Markers Activated";
			[] spawn admintents;
			
			_savelog = format["%1 TentMarker Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markadtent = 0;
			hint "2D Map Tent Markers Disabled";
			
			_objects = (nearestObjects [player,["TentStorage","StashSmall","StashMedium"], 10000]);
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("admintents" + (str _i));};
			
			_savelog = format["%1 TentMarker Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminDEAD =
	{
		if !("ItemMap" in items player) then 
		{
			_config = ["ItemMap"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		adminDEADs =
		{
			while {markadDEAD == 1} do
			{
				if !(markadDEAD == 1) exitWith {
					_objects = allDead;
					for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
				};
				_objects = allDead;
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("adminDEADs" + (str _i));
					_selected = _objects select _i;
					
					_name = (_selected getVariable["bodyName", name _selected]);
					if ((_name != "Error: No unit") && (_selected isKindOf "CAManBase")) then
					{
						_vm = createMarkerLocal [("adminDEADs" + (str _i)), position _selected];
						_vm setMarkerTypeLocal "Camp";
						_vm setMarkerSizeLocal [0.4, 0.4];
						_vm setMarkerTextLocal format["%1",_name];
						_vm setMarkerColorLocal ("ColorRED");
					};
				};
				sleep 5;
			};
			_objects = allDead;
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
		};
		if (isNil "markadDEAD") then {markadDEAD = 0;};
		if (markadDEAD == 0) then
		{
			markadDEAD = 1;
			hint "2D Map DEAD Markers Activated";
			[] call adminDEADs;
		}
		else
		{
			markadDEAD = 0;
			hint "2D Map DEAD Markers Disabled";
			
			_objects = allDead;
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
		};
	};
	adminmark =
	{
		if !("ItemMap" in items player) then 
		{
			_config = ["ItemMap"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminpmark =
		{
			while {mark == 1} do
			{
				_playableUnits = playableUnits;
				for "_i" from 0 to (count _playableUnits)-1 do
				{
					deleteMarkerLocal ("adminpmark" + (str _i));
					if ((_playableUnits select _i) == vehicle (_playableUnits select _i)) then 
					{
						deleteMarkerLocal ("adminpmark" + (str _i));
						_pm = createMarkerLocal [("adminpmark" + (str _i)), getPos (_playableUnits select _i)];
						_pm setMarkerTypeLocal "destroyedvehicle";
						_pm setMarkerSizeLocal [0.8, 0.8];
						_pm setMarkerTextLocal format ["%1", name (_playableUnits select _i)];
						_pm setMarkerColorLocal ("ColorBlue");
					};
				};
				sleep 2;
			};
			for "_i" from 0 to (count playableUnits)-1 do {deleteMarkerLocal ("adminpmark" + (str _i));};
		};
		if (isNil "mark") then {mark = 0;};
		if (mark == 0) then
		{
			mark = 1;
			hint "2D Map PLAYER Markers Activated";
			[] spawn adminpmark;
			
			_savelog = format["%1 PlayerMarkers Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			mark = 0;
			hint "2D Map PLAYER Markers Disabled";
			
			for "_i" from 0 to (count playableUnits)-1 do {deleteMarkerLocal ("adminpmark" + (str _i));};
			
			_savelog = format["%1 PlayerMarkers Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminmarkveh =
	{
		if !("ItemMap" in items player) then 
		{
			_config = ["ItemMap"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminvmark =
		{
			while {markveh == 1} do
			{
				_vehicles = vehicles;
				for "_i" from 0 to (count _vehicles)-1 do
				{
					deleteMarkerLocal ("adminvmark" + (str _i));
					
					if (((_vehicles select _i) isKindOf "LandVehicle") or ((_vehicles select _i) isKindOf "Air") or ((_vehicles select _i) isKindOf "Ship")) then 
					{
						if (count crew (_vehicles select _i) != 0) then 
						{
							_crewnames = [];
							{
								_crewnames = _crewnames + [name _x];
							} forEach crew (_vehicles select _i);
							
							deleteMarkerLocal ("adminvmark" + (str _i));
							_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_vehicles select _i)];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1 in %2", _crewnames,getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorRed");
						}
						else
						{
							deleteMarkerLocal ("adminvmark" + (str _i));
							_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_vehicles select _i)];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorBrown");
						};
					};
				};
				sleep 2;
			};
			for "_i" from 0 to (count vehicles)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
		};
		if (isNil "markveh") then {markveh = 0;};
		if (markveh == 0) then
		{
			markveh = 1;
			hint "2D Map VEHICLE Markers Activated";
			[] spawn adminvmark;
			
			_savelog = format["%1 VEHICLEMarkers Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markveh = 0;
			hint "2D Map VEHICLE Markers Disabled";
			
			for "_i" from 0 to (count vehicles)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
			
			_savelog = format["%1 VEHICLEMarkers Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminAntiAggro = {
		if (isnil "adminAntiAggro_zxeds") then {adminAntiAggro_zxeds = false;};
		if (!adminAntiAggro_zxeds) then
		{
			adminAntiAggro_zxeds = true;
			
			hint "No Zed Aggro - Enabled";
			cutText [format["No Zed Aggro - Enabled"], "PLAIN DOWN"];
			_savelog = format["%1 No Zed Aggro - Enabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			if (isNil "old_player_zombieCheck") then {old_player_zombieCheck = player_zombieCheck;};
			player_zombieCheck = {};
		}
		else
		{
			adminAntiAggro_zxeds = false;
			
			hint "No Zed Aggro - Disabled";
			cutText [format["No Zed Aggro - Disabled"], "PLAIN DOWN"];
			_savelog = format["%1 No Zed Aggro - Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			player_zombieCheck = old_player_zombieCheck;
		};
	};
	admin_vehicleboost = {
		if (isnil("vehboost_infiSTAR")) then {vehboost_infiSTAR = 0;};
		if (vehboost_infiSTAR == 0) then 
		{
			vehboost_infiSTAR = 1;
			hint "Vehboost 1 - left shift or E to go fast and space for brakes!";
			cutText [format["Vehboost 1 - left shift or E to go fast and space for brakes!"], "PLAIN DOWN"];
			_savelog = format["%1 Vehboost Enabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			waituntil {!isnull (finddisplay 46)};
			booostkey_KI_0 = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call booostkey_FNC_spd_0;false;"];
			booostkey_FNC_spd_0 = 
			{
				_vehicle_player = vehicle player;
				if(_vehicle_player == player)exitwith{};
				
				if(isEngineOn _vehicle_player) then 
				{
					switch (_this) do 
					{
						case 18: /* KEY E */
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 1.05, (velocity _vehicle_player select 1) *1.05, (velocity _vehicle_player select 2) * 0.99];
						};
						case 42: /* KEY SHIFTL */
						{
							_vehicle_player setVelocity [(velocity _vehicle_player select 0) * 1.025, (velocity _vehicle_player select 1) * 1.025, (velocity _vehicle_player select 2) * 0.99];
						};
						case 57: /* space */
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 0.95, (velocity _vehicle_player select 1) *0.95, (velocity _vehicle_player select 2) * 0.99];
						};
					};
				};
			};
		}
		else
		{
			vehboost_infiSTAR = 0;
			hint "Vehboost 0";
			cutText [format["Vehboost 0"], "PLAIN DOWN"];
			_savelog = format["%1 Vehboost Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", booostkey_KI_0];
			_vehicle_player = nil;
		};
	};
	adminZedshld = 
	{
		if (isNil "zoombiieshieldd") then {zoombiieshieldd = true;} 
		else 
		{
			zoombiieshieldd = !zoombiieshieldd;
			if (zoombiieshieldd) then 
			{	
				cutText [format["ZedShield ON for 50m"],"PLAIN DOWN"];
				
				_savelog = format["%1 ZedShield Activated",name player];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			} 
			else 
			{
				cutText ["ZedShield OFF","PLAIN DOWN"];
				
				_savelog = format["%1 ZedShield Disabled",name player];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		};
		while {zoombiieshieldd} do 
		{
			_pos = getPos player;
			_zombies = _pos nearEntities ["zZombie_Base",50];
			_count = count _zombies;
			for "_i" from 0 to (_count -1) do
			{
				_zombie = _zombies select _i;
				deleteVehicle _zombie;
			};
			sleep 0.5;
		};
	};
	adminammo_recoil = {
		if (isnil ("admin_loop1")) then {admin_loop1 = 0;};
		if (admin_loop1==0) then 
		{
			admin_loop1=1;
			cutText [format["Infinite AMMO and No Recoil ON"], "PLAIN DOWN"];
			hint "Infinite AMMO and No Recoil ON";
			
			_savelog = format["%1 adminammo_recoil ON",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			admin_loop1=0;
			cutText [format["Infinite AMMO and No Recoil OFF"], "PLAIN DOWN"];
			hint "Infinite AMMO and No Recoil OFF";
			
			_savelog = format["%1 adminammo_recoil OFF",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};

		while {admin_loop1==1} do 
		{
			(vehicle player) setVehicleAmmo 1;
			(vehicle player) setUnitRecoilCoefficient 0;
		sleep 0.01;
		};
	};
	admin_low_terrain = {
		if (isNil "admin_terrain") then {admin_terrain = true;} else {admin_terrain = !admin_terrain};
		if (admin_terrain) then {
		setTerrainGrid 50;
		hint "Terrain Low";
		cutText [format["Terrain Low"], "PLAIN DOWN"];
		_savelog = format["%1 Terrain Low",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
		} else {
		setTerrainGrid 25;
		hint "Terrain Normal";
		cutText [format["Terrain Normal"], "PLAIN DOWN"];
		_savelog = format["%1 Terrain Normal",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	admingod =
	{
		if (isNil "gmdadmin") then {gmdadmin = 0;};
		if (gmdadmin == 0) then
		{
			gmdadmin = 1;
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			_object = player;
			_object allowDamage false;
			hint "God Activated";
			
			_savelog = format["%1 G_o_d Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			gmdadmin = 0;
			fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
			fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
			_object = player;
			_object allowDamage true;
			hint "God Disabled";
			
			_savelog = format["%1 G_o_d Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminHumanityPlus =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity+2500,true];
				hint format ["Gave %1 +2500 Humanity!",_this select 0];
				
				_savelog = format["%1 +2500 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminHumanityMinus =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity-2500,true];
				hint format ["Gave %1 -2500 Humanity!",_this select 0];
				
				_savelog = format["%1 -2500 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	fixfps =
	{
		_list = ((allMissionObjects "Land_Fire_DZ")+(allMissionObjects "MedBox0")+(allMissionObjects "wire_cat1")
		+(allMissionObjects "Hedgehog_DZ")+(allMissionObjects "Sandbag1_DZ")+(allMissionObjects "BearTrap_DZ")
		+(allMissionObjects "WeaponHolder")+(allMissionObjects "WeaponHolderBase")+(allMissionObjects "DZ_Patrol_Pack_EP1")
		+(allMissionObjects "ReammoBox")+(allMissionObjects "Sound_Flies")+allDead);
		
		if (count _list > 0) then 
		{
			tmpList = [];
			{
				hintsilent str _x;
				if (!isNull _x) then 
				{
					_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 555]);
					_keep = _x getVariable ["permaLoot",false];
					if ((_nearby == 0) && (!_keep) && !(_x in alldead) && (!isNull _x)) then 
					{
						tmpList = tmpList + [_x];
					};
					_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 250]);
					if ((_nearby == 0) && (_x in alldead) && (_x isKindOf "zZombie_Base") && (!isNull _x)) then 
					{
						deleteVehicle _x;
					};
				};
			} foreach _list;
		};
		
		disableSerialization;
		waitUntil {(isNull (findDisplay 64))};
		if (!dialog) then {createDialog 'RscDisplayPassword';};
		ctrlSetText [1001,(format['Delete %1 items?',(count tmpList)])];
		ctrlSetText [1002,''];
		ctrlshow [1,true];
		ctrlshow [2,true];
		ctrlshow [101,false];
		_display = findDisplay 64;
		_btnCopy1 = _display displayctrl 1;
		_btnCopy1 ctrlSetText 'OK';
		_btnCopy1 buttonSetAction '{deleteVehicle _x;} foreach tmpList;';
		_btnCopy2 = _display displayctrl 2;
		_btnCopy2 ctrlSetText 'Nope';
		_btnCopy2 buttonSetAction 'systemchat ''No items deleted.'';';
		
		_savelog = format["%1 - FixFps Script",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminControl =
	{
		{
			if (name _x == _this select 0) then
			{
				_x switchCamera "INTERNAL";
				selectPlayer _x;
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 110000000]);
		
		_savelog = format["%1 adminControl %2",name player,_this select 0];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminCarGod =
	{
		if (isNil "adminCarGodToggle") then {adminCarGodToggle = 0;};
		if (adminCarGodToggle == 0) then
		{
			adminCarGodToggle = 1;
			hint "Car God Enabled";
			while {adminCarGodToggle==1} do
			{
				if ((vehicle player) != player) then { (vehicle player) setDamage 0; (vehicle player) setFuel 1; };
				sleep 0.1;
			};
		}
		else
		{
			adminCarGodToggle = 0;
			hint "Car God Disabled";
		};
		
		_savelog = format["%1 adminCarGod %2",name player,adminCarGodToggle];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	admininvis =
	{
		if (isNil 'inv1') then {inv1 = 0;};
		if (inv1 == 0) then
		{
			PVAH_AdminRequest = [3,player,1];
			publicVariableServer "PVAH_AdminRequest";
			inv1 = 1;
			hint "Invisibility Activated";
			
			_savelog = format["%1 Invisibility Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			PVAH_AdminRequest = [3,player,0];
			publicVariableServer "PVAH_AdminRequest";
			inv1 = 0;
			hint "Invisibility Disabled";
			
			_savelog = format["%1 Invisibility Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	admin_debug = 
	{
		if (isNil "admindebug_colorful") then {admindebug_colorful = true;} else {admindebug_colorful = !admindebug_colorful;};
		while {admindebug_colorful} do 
		{
			if (isNil "custom_monitor") then {custom_monitor = false;custom_monitor = nil;};
			_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
			if (player == vehicle player) then 
			{
				_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
			}
			else
			{
				_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
			};
			
			hintSilent parseText format["
			<t size='1.2'font='TahomaB'align='left' color='#14fb06'>Player Online:</t><t size='1.2'font='TahomaB'align='right'color='#14fb06'>%5</t><br/>
			<t size='1.2'font='TahomaB'align='left' color='#13ee67'>Player in 500m:</t><t size='1.2'font='TahomaB'align='right'color='#13ee67'>%6</t><br/>
			<t size='1.2'font='TahomaB'align='left' color='#13ee67'>Viewdistance:</t><t size='1.2'font='TahomaB'align='right'color='#13ee67'>%12</t><br/>
			<br/>
			<t size='1.2'font='TahomaB'align='left'color='#13eedb'>Vehicles:</t><t size='1.2' font='TahomaB'align='right'color='#13eedb'>%8(%10)</t><br/>
			<t size='1.2'font='TahomaB'align='left'color='#13b4ee'>Air:</t><t size='1.2' font='TahomaB'align='right'color='#13b4ee'>%9</t><br/>
			<t size='1.2'font='TahomaB'align='left'color='#1367ee'>Tank:</t><t size='1.2' font='TahomaB'align='right'color='#1367ee'>%7</t><br/>
			<t size='1.2'font='TahomaB'align='left'color='#6d13ee'>Car:</t><t size='1.2' font='TahomaB'align='right'color='#6d13ee'>%11</t><br/>
			<br/>
			<t font='TahomaB' align='Center' size='1.2' color='#FFBF00'>[%3]</t><br/>
			<img size='5.5' image='%4'/><br/>
			<t size='1.2'font='TahomaB'align='left' color='#3fa77d'>Humanity:</t><t color='#3fa77d' size='1.2'font='TahomaB'align='right'>%14</t><br/>
			<t size='1.2'font='TahomaB'align='left' color='#3fa77d'>Blood:</t><t color='#3fa77d' size='1.2'font='TahomaB'align='right'>%13</t><br/>
			<t size='1.2'font='TahomaB'align='left' color='#3fa77d'>Name:</t><t color='#3fa77d' size='1.2'font='TahomaB'align='right'>%1</t><br/>
			<t size='1.2'font='TahomaB'align='center'color='#2ECCFA'>Fps: %2</t><br/>",
			(player getVariable['bodyName', name player]),
			(round diag_fps),
			(gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName')),
			_pic,
			(count playableUnits),
			(({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'], 500]))-1),
			(count([6800, 9200, 0] nearEntities [['Tank'],25000])),
			(count([6800, 9200, 0] nearEntities [['StaticWeapon','Car','Motorcycle','Tank','Air','Ship'],25000])),
			(count([6800, 9200, 0] nearEntities [['Air'],25000])),
			count vehicles,
			(count([6800, 9200, 0] nearEntities [['Car'],25000])),
			viewdistance,
			r_player_blood,
			(player getVariable['humanity', 0])];
			
			sleep 1;
		};
		if (!admindebug_colorful) then {hintSilent parseText format ["<t size='1'font='TahomaB'align='center'>DEBUG OFF</t>"];};
	};
	adminx_aatp = 
	{
		_tempTime = time;
		time = "thxmonky";
		sleep 3;
		while {true} do {
			time = _tempTime;
			_tempTime = _tempTime + 1;
			sleep 1;
		};
	};
	admin_tpdirection_on = 
	{
		// [] spawn adminx_aatp;
		
		if (isNil "admin_tpdirection_0n") then {admin_tpdirection_0n = true;} else {admin_tpdirection_0n = !admin_tpdirection_0n;};
		sleep 0.1;
		if (admin_tpdirection_0n) then 
		{
			hint "TP infront of you ON";
			cutText ["TP infront of you ON", "PLAIN DOWN"];
			
			_savelog = format["%1 TP infront of you ON",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			hint "TP infront of you OFF";
			cutText ["TP infront of you OFF", "PLAIN DOWN"];
			
			_savelog = format["%1 TP infront of you OFF",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	admin_tpdirection = 
	{
		if (isNil "admin_tpdirection_0n") exitWith {};
		if (!admin_tpdirection_0n) exitWith {};
		
		_distance = 10;
		_object = (vehicle player);
		_dir = getdir _object;
		_pos = getPosATL _object;
		if (_object isKindOf "Air") then
		{
			if (count(crew _object)>1) then 
			{ 
				_distance = 10;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)+100];
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			} 
			else
			{
				_distance = 50;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
				if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
				if ((getpos _object) select 2 > 6) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)+0.1]};
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			};
		}
		else
		{
			_distance = 10;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
			if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
			if ((getpos _object) select 2 > 3) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)];};
			if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
		};
	};
	adminaltteleport = 
	{
		// [] spawn adminx_aatp;
		if (isNil "adminaltteleport_toggle") then {adminaltteleport_toggle = true;} else {adminaltteleport_toggle = !adminaltteleport_toggle;};
		if (adminaltteleport_toggle) then 
		{
			if !("ItemMap" in items player) then 
			{
				_config = ["ItemMap"];
				_isOK = [player,_config] call BIS_fnc_invAdd;
			};
			
			(findDisplay 46) displayAddEventHandler ["KeyDown", "altstate_Admin = _this select 4"];
			((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", "if (((_this select 1) == 0) && altstate_Admin) then
			{
				PVAH_AdminRequest = [1, player, ((_this select 0) posScreenToWorld [_this select 2, _this select 3])];
				publicVariableServer 'PVAH_AdminRequest';
			};"];
			hint "ALT TELEPORT ACTIVATED";
			cutText ["ALT TELEPORT ACTIVATED", "PLAIN"];
		}
		else
		{
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "MouseButtonDown";
			hint "ALT TELEPORT DISABLED";
			cutText ["ALT TELEPORT DISABLED", "PLAIN"];
		};
	};
	adminbreakleg =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [2,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Breaking %1's legs", _this select 0];
				
				_savelog = format["%1 Break Legs %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminspec = {
		_name = _this select 0;
		
		hintSilent format ["Spectating %1, F10 to cancel - F9 Show Gear",_name];
		cutText [format["Spectating %1, F10 to cancel - F9 Show Gear",_name], "PLAIN DOWN"];
		
		remove_spec_000 = {
			['',-0.6,safezoneY+0.2,1,0,0,3031] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3032] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3033] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3034] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3035] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3036] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3037] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3038] spawn bis_fnc_dynamicText;
			['',-0.6,safezoneY+0.2,1,0,0,3039] spawn bis_fnc_dynamicText;
			waitForGearRequest = nil;
			spectating_x0x0 = nil;
			vehicle player switchCamera 'EXTERNAL';
		};
		[] call remove_spec_000;
		
		
		if (_name != name waitForGearRequest) then {waitForGearRequest = nil;};
		if (_name == name waitForGearRequest) exitWith {};
		
		[_name] call 
		{
			{
				_name = _this select 0;
				
				if (name _x == _name) then
				{
					waitForGearRequest = nil;
					waitForGearRequest = _x;
					vehicle waitForGearRequest switchCamera "External";
					if (isNil "spectating_x0x0") then {spectating_x0x0 = true;};
					while {(!isNil "spectating_x0x0")} do 
					{
						if (isNil "spectating_x0x0") exitWith {[] call remove_spec_000;};
						_name = name waitForGearRequest;
						_uid = getPlayerUid waitForGearRequest;
						_blood = waitForGearRequest getVariable['USEC_BloodQty',12000];
						_humanity = waitForGearRequest getVariable['humanity', 0];
						_wep = currentWeapon waitForGearRequest;
						_ammo = waitForGearRequest ammo _wep;
						
						['<t size=''0.55''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+_name+' ('+_uid+')</t>',-0.7,safezoneY+0.25,999999,0,0,3031] spawn bis_fnc_dynamicText;
						['<t size=''0.55''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>Blood: '+str _blood+'   Humanity '+str _humanity+'</t>',-0.7,safezoneY+0.3,999999,0,0,3032] spawn bis_fnc_dynamicText;
						_log = format['Name: %1 --- Wep: %2(%3)',_name,_wep,_ammo];
						['<t size=''0.45''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+_log+'</t>',-0.7,safezoneY+0.36,999999,0,0,3033] spawn bis_fnc_dynamicText;
						
						
						_unsorted = playableUnits;
						_sorted = [];
						_pos = position vehicle waitForGearRequest;
						{
							  _closest = _unsorted select 0;
							  {if ((position _x distance _pos) < (position _closest distance _pos)) then {_closest = _x}} forEach _unsorted;
							  _sorted = _sorted + [_closest];
							  _unsorted = _unsorted - [_closest]
						} forEach _unsorted;
						_sorted;
						
						_nearguys = [];
						{
							_dist = round(waitForGearRequest distance _x);
							if ((_dist < 500) && (name _x != name waitForGearRequest) && (getPlayerUid _x != '')) then 
							{
								_nameX = name _x;
								_primWepX = CurrentWeapon _x;
								_ammoX = _x ammo _primWepX;
								_bloodX = _x getVariable['USEC_BloodQty',12000];
								
								_log = format['Name: %1 (%2m) --- Wep: %3(%4) --- Blood: %5',_nameX,_dist,_primWepX,_ammoX,_bloodX];
								_nearguys = _nearguys + [_log];
							};
						} forEach _sorted;
						
						['<t size=''0.45''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+(_nearguys select 0)+'</t>',-0.7,safezoneY+0.39,999999,0,0,3034] spawn bis_fnc_dynamicText;
						['<t size=''0.45''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+(_nearguys select 1)+'</t>',-0.7,safezoneY+0.42,999999,0,0,3035] spawn bis_fnc_dynamicText;
						['<t size=''0.45''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+(_nearguys select 2)+'</t>',-0.7,safezoneY+0.45,999999,0,0,3036] spawn bis_fnc_dynamicText;
						['<t size=''0.45''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+(_nearguys select 3)+'</t>',-0.7,safezoneY+0.48,999999,0,0,3037] spawn bis_fnc_dynamicText;
						['<t size=''0.45''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+(_nearguys select 4)+'</t>',-0.7,safezoneY+0.51,999999,0,0,3038] spawn bis_fnc_dynamicText;
						['<t size=''0.45''color=''#00ff40''font=''EtelkaNarrowMediumPro''align=''left''>'+(_nearguys select 5)+'</t>',-0.7,safezoneY+0.54,999999,0,0,3039] spawn bis_fnc_dynamicText;
						sleep 1;
					};
				};
			} forEach playableUnits;
		};
	};
	admin_spec_gear = 
	{
		{
			if (name _x == _this select 0) then
			{
				waitUntil {sleep 0.5;count weapons _x > 0};
				sleep 0.5;
				createGearDialog [(_x), "RscDisplayGear"];
				hint format ["Show Gear of %1", name _x];
			};
		} forEach playableUnits;
	};
	adminkill =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [4,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Killing %1", _this select 0];
				
				_savelog = format["%1 Adminkilled %2",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminSlap = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [21,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Slap %1", _this select 0];
				
				_savelog = format["%1 Slaps %2",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminFDisconnect =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [10,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Disconnect %1", _this select 0];
				
				_savelog = format["%1 Disconnected %2",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminremovegear = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [8,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["%1 Gear Removed", _this select 0];
				
				_savelog = format["%1 Removes %2 Gear",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminmsg =
	{
		createDialog "RscDisplayPassword";
		ctrlSetText [1001,"BroadCast Message Plugin"];
		ctrlSetText [101,""];
		ctrlshow [1002,false];
		buttonSetAction [1,"PVAH_AdminRequest = [9, player, toArray(ctrlText 101)]; publicVariableServer ""PVAH_AdminRequest"";"];
	};
	admint2me =
	{
		{
			if (name _x == _this select 0) then
			{
				_bolt = vehicle _x;
				_hitObject = vehicle player;
				_val = [0,+1,0];
				_hitMemoryPt = "";
				_bolt attachTo [_hitObject,_val,_hitMemoryPt];
				hint format ["%2 Moved to %1",name player, name _x];
				sleep 1;
				detach _bolt;
				
				_savelog = format["%2 Moved to %1",name player, name _x];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admintele =
	{
		{
			if (name _x == _this select 0) then
			{
				_bolt = vehicle player;
				_hitObject = vehicle _x;
				_val = [0,-1,0];
				_hitMemoryPt = "";
				_bolt attachTo [_hitObject,_val,_hitMemoryPt];
				hint format ["Moving to %1", _this select 0];
				sleep 1;
				detach _bolt;
				
				_savelog = format["%1 Moving to %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminweapon =
	{
		_pWep = currentWeapon player;
		player removeWeapon _pWep;
		_item = _this select 0;
		_config = [_item];
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_mags = getArray(configfile >> 'cfgWeapons' >> _item >> 'magazines');
		_config = _mags select 0;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		player selectWeapon _item;
		reload player;
		
		_savelog = format['%1 - %2',name player,_this select 0];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer 'PVAH_WriteLogRequest';
	};
	adminsveh =
	{
		_dir = getdir vehicle player;
		_pos = getPos vehicle player;
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		PVAH_AdminRequest = [0, player, _this select 0, _pos];
		publicVariableServer "PVAH_AdminRequest";
	};
	adminsobj =
	{
		_dir = getdir vehicle player;
		_pos = getPos vehicle player;
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		PVAH_AdminRequest = [0, player, _this select 0, _pos];
		publicVariableServer "PVAH_AdminRequest";
		
		_savelog = format["%1 - %2 at %3",name player,_this select 0, mapGridPosition getPos player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminUncon =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [11,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Putting %1 to sleep...", _this select 0];
				
				_savelog = format["%1 Putting %2 to sleep...",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admin_d0 =
	{
		deleteMarker "rspawn_east";
		_tmp = createMarker ["rspawn_east", [0,0,0]];
		_tmp setMarkerText (_this select 0);
		PVAH_AdminRequest = [69];
		publicVariableServer "PVAH_AdminRequest";
	};
	admin_del_bxs =
	{
		PVAH_AdminRequest = [14];
		publicVariableServer "PVAH_AdminRequest";
		
		hint "deleting boxes..";
		
		_savelog = format["%1 deleted boxes",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminDrug = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [15,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Drugging %1...", _this select 0];
				
				_savelog = format["%1 drugged %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminSuicide =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [22,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Suiciding %1", _this select 0];
				
				_savelog = format["%1 Suiciding %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminClearBan =
	{
		PVAH_AdminRequest = [16,player];
		publicVariableServer "PVAH_AdminRequest";
		hint "Bans cleared!";
		
		_savelog = format["%1 cleared Bans",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminKick =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [17,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Kicked %1...", _this select 0];
				
				_savelog = format["%1 Kicked %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};	
	adminBan =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [18,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Banned %1...", _this select 0];
				
				_savelog = format["%1 Banned %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminUnBan =
	{
		_uid = _this select 0;
		_name = _this select 1;
		
		PVAH_AdminRequest = [182,_uid,_name];
		publicVariableServer "PVAH_AdminRequest";
		hint format ["UnBanned %1 (%2)",_name,_uid];
		
		_savelog = format["%1 UnBanned %2 (%3)",name player,_name,_uid];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminGiveGod =
	{
		if ((_this select 1) == 1) then {
			{
				if (name _x == _this select 0) then
				{
					PVAH_AdminRequest = [12,player,_x];
					publicVariableServer "PVAH_AdminRequest";
					hint format ["Giving %1 G_O_D...", _this select 0];
					cutText [format["Giving %1 G_O_D...", _this select 0], "PLAIN DOWN"];
					
					_savelog = format["%1 G_O_D %2",name player,_this select 0];
					PVAH_WriteLogRequest = [_savelog];
					publicVariableServer "PVAH_WriteLogRequest";
				};
			} forEach playableUnits;
		}
		else
		{
			{
				if (name _x == _this select 0) then
				{
					PVAH_AdminRequest = [13,player,_x];
					publicVariableServer "PVAH_AdminRequest";
					hint format ["Taking %1's G_O_D...", _this select 0];
					cutText [format["Taking %1's G_O_D...", _this select 0], "PLAIN DOWN"];
					
					_savelog = format["%1 UN_G_O_D %2",name player,_this select 0];
					PVAH_WriteLogRequest = [_savelog];
					publicVariableServer "PVAH_WriteLogRequest";
				};
			} forEach playableUnits;
		};
	};
	adminDelete = 
	{
		_delete = cursorTarget;
		if (isNull _delete) exitWith {hint "target doesn't exist";cutText ["target doesn't exist", "PLAIN"];};
		hint format["deleting %1...", _delete];
		cutText [format["deleting %1...", _delete], "PLAIN DOWN"];
		deleteVehicle _delete;
	};
	if (isNil 'admin_announce') then {admin_announce = true;};
};
publicVariable "PV_AdminMenuCode";
/*
	Admin Menu - END
*/






/*
	PublicVariableEventHandlers - START
*/
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - ADDING PublicVariableEventHandlers");
"PVAH_WriteLogRequest" addPublicVariableEventHandler
{
	_array = _this select 1;
	
	PV_writeAdmin_log_ARRAY = PV_writeAdmin_log_ARRAY + [_array];
	publicVariable "PV_writeAdmin_log_ARRAY";
};
SERVER_RE = {
	if (count _this < 3) exitWith {};
	if (isNil "remExField") then {remExField = [];};
	if (isNil "remExFP") then {remExFP = [];};
	_field = _this;
	_callerObject = _field select 0;
	if (_callerObject != "server") exitWith {};
	remExField = _field;
	publicVariable "remExField";
};
"PVAH_AdminRequest" addPublicVariableEventHandler
{
	_array = _this select 1;
	_option = _array select 0;
	if (_option == 70) then
	{
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
		_do = (MarkerText "rspawn_east");
		_unit addMPEventHandler ["MPKilled", _do];
		_unit setDamage 2;
		deleteVehicle _unit;
	};
	if (_option == 69) then
	{
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
		_do = (MarkerText "rspawn_east");
		_unit setVehicleInit _do;
		processInitCommands;
		deleteVehicle _unit;
	};
	if (_option == 0) then
	{
		_savelog = format["%1 (%2) spawned %2 at %3",name (_array select 1),getPlayerUID (_array select 1),(_array select 2), mapGridPosition getPos (_array select 1)];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
		
		[(_array select 2),(_array select 3),(_array select 1)] spawn
		{
			_type = _this select 0;
			_pos = _this select 1;
			_player = _this select 2;
			_dirPlr = getDir _player;
			_object = _type createVehicle _pos;
			_uniqueid = str(round(random 999999));
			_object setVariable ["ObjectID", _uniqueid, true];
			_object setVariable ["ObjectUID", _uniqueid, true];
			_object setDir _dirPlr;
			dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];
		};
	};
	if (_option == 1) then
	{
		_unit = (_array select 1);
		_pos = (_array select 2);
		
		vehicle _unit setPosATL _pos;
		
		_savelog = format["%1 TP to %2",name _unit, mapGridPosition _pos];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	if (_option == 2) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			_unit = player;
			_selection = ""legs"";
			_damage = 1;
			_unit setHit[_selection,_damage];
		};", getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 3) then
	{
		_unit = _array select 1;
		_run = _array select 2;
		if (_run == 1) then
		{
			["server", nil, rSPAWN, _unit, { _this hideObject true; }] call SERVER_RE;
		}
		else
		{
			["server", nil, rSPAWN, _unit, { _this hideObject false; }] call SERVER_RE;
		};
	};
	if (_option == 4) then
	{
		_vehicle = vehicle (_array select 2);
		_unit = (_array select 2);
		if (true) then 
		{
			_unit setDamage 2;
			[_vehicle,_unit] spawn 
			{
				_vehicle = _this select 0;
				_unit = _this select 1;
				sleep 2;
				if (alive _unit) then {_vehicle setDamage 2;_unit setDamage 2};
			};
		};
	};
	if (_option == 5) then
	{
		_unit = _array select 2;
		_do = format ["if (getPlayerUID player == '%1') then
		{
			disableSerialization;
			dayz_sourceBleeding = objNull;
			r_player_blood = r_player_bloodTotal;
			r_player_inpain = false;
			r_player_infected = false;
			r_player_injured = false;
			dayz_hunger = 0;
			dayz_thirst = 0;
			dayz_temperatur = 40;
			r_fracture_legs = false;
			r_fracture_arms = false;
			r_player_dead = false;
			r_player_unconscious = false;
			r_player_loaded = false;
			r_player_cardiac = false;
			r_player_lowblood = false;
			r_player_timeout = 0;
			r_handlercount = 0;
			r_interrupt = false;
			r_doLoop = false;
			r_drag_sqf = false;
			r_self = false;
			r_action = false;
			r_action_unload = false;
			r_player_handler = false;
			r_player_handler1 = false;
			disableUserInput false;
			""dynamicBlur"" ppEffectAdjust [0];
			""dynamicBlur"" ppEffectCommit 5;
			_unit = player;
			_selection = ""legs"";
			_damage = 0;
			_unit setHit[_selection,_damage];
			player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
			player setVariable ['USEC_BloodQty',r_player_blood,true];
			player setVariable ['medForceUpdate',true];
			player setVariable ['hit_legs',0,true];
			player setVariable ['hit_hands',0,true];
			player setVariable ['USEC_injured',false,true];
			player setVariable ['USEC_inPain',false,true];
			player setVariable ['USEC_lowBlood',false,true];
			_display = uiNamespace getVariable 'DAYZ_GUI_display';
			_control = 	_display displayCtrl  1303;
			_control ctrlShow false;
			_display = uiNamespace getVariable 'DAYZ_GUI_display';
			_control = _display displayCtrl 1203;
			_control ctrlShow false;
			_unit setdamage 0;
			0 fadeSound 1;
		};", getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 6) then 
	{
		_dir = getdir (_array select 1);
		_pos = getPos (_array select 1);
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		[_dir,_pos] spawn {
			_dir = _this select 0;
			_pos = _this select 1;
			_b0x = "Foodbox0" createVehicle _pos;
			clearWeaponCargoGlobal _b0x;
			clearmagazinecargoGlobal _b0x;
			
			PV_b0x_array = PV_b0x_array + [_b0x];
			publicVariable "PV_b0x_array";
			
			_b0x_wpnlist = 
			['AK_107_GL_Kobra','AK_107_Kobra','AK_107_PSO','AK_47_M',
			'AK_47_S','AK_74','AK_74_GL','AK_74_GL_Kobra','AKS_74','AKS_74_Kobra',
			'AKS_74_PSO','AKS_74_U','AKS_74_UN_Kobra','AKS_GOLD','BAF_AS50_scoped',
			'BAF_AS50_TWS','BAF_L110A1_Aim','BAF_L7A2_GPMG','BAF_L85A2_RIS_ACOG',
			'BAF_L85A2_RIS_CWS','BAF_L85A2_RIS_Holo','BAF_L85A2_RIS_SUSAT',
			'BAF_L85A2_UGL_ACOG','BAF_L85A2_UGL_Holo','BAF_L85A2_UGL_SUSAT',
			'BAF_L86A2_ACOG','BAF_LRR_scoped','BAF_LRR_scoped_W','bizon','bizon_silenced',
			'Colt1911','Crossbow','DMR','G36_C_SD_camo','G36_C_SD_eotech','G36a',
			'G36A_camo','G36C','G36C_camo','G36K','G36K_camo','FN_FAL','FN_FAL_ANPVS4',
			'glock17_EP1','Huntingrifle','ksvk','LeeEnfield','M1014','m107_DZ',
			'M14_EP1','M16A2','M16A2GL','m16a4','m16a4_acg','M16A4_ACG_GL','M16A4_GL',
			'M24','M24_des_EP1','M240','m240_scoped_EP1','M249','M249_EP1','M249_m145_EP1',
			'M40A3','M4A1','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo','M4A1_HWS_GL',
			'M4A1_HWS_GL_camo','M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A3_CCO_EP1',
			'M4A3_RCO_GL_EP1','M4SPR','M60A4_EP1','M9','M9SD','Makarov','MakarovSD',
			'MeleeHatchet','MeleeCrowbar','MG36','Mk_48_DES_EP1','Mk_48_DZ','MP5A5',
			'MP5SD','MR43','Pecheneg','PK','Remington870_lamp','revolver_EP1',
			'revolver_gold_EP1','RPK_74','Sa61_EP1','Saiga12K','SVD','SVD_CAMO',
			'SVD_des_EP1','SVD_NSPU_EP1','UZI_EP1','UZI_SD_EP1','Winchester1866',
			'Binocular','Binocular_Vector','ItemCompass','ItemEtool','ItemFlashlight',
			'ItemFlashlightRed','ItemGPS','ItemHatchet','ItemKnife','ItemMap',
			'ItemMatchbox','ItemRadio','ItemToolbox','ItemWatch','Laserdesignator',
			'NVGoggles'];
			_b0x_maglist = 
			['2Rnd_shotgun_74Slug','2Rnd_shotgun_74Pellets','5Rnd_127x108_KSVK',
			'5Rnd_127x99_as50','5Rnd_762x51_M24','5Rnd_86x70_L115A1','5x_22_LR_17_HMR',
			'6Rnd_45ACP','7Rnd_45ACP_1911','8Rnd_9x18_Makarov','8Rnd_9x18_MakarovSD',
			'8Rnd_B_Beneli_74Slug','8Rnd_B_Beneli_Pellets','8Rnd_B_Saiga12_74Slug',
			'8Rnd_B_Saiga12_Pellets','10Rnd_127x99_M107','10Rnd_762x54_SVD',
			'10x_303','15Rnd_9x19_M9','15Rnd_9x19_M9SD','15Rnd_W1866_Slug',
			'15Rnd_W1866_Pellet','17Rnd_9x19_glock17','20Rnd_556x45_Stanag',
			'20Rnd_762x51_DMR','20Rnd_762x51_FNFAL','20Rnd_B_765x17_Ball',
			'30Rnd_545x39_AK','30Rnd_545x39_AKSD','30Rnd_556x45_G36','30Rnd_556x45_G36SD',
			'30Rnd_556x45_Stanag','30Rnd_556x45_StanagSD','30Rnd_762x39_AK47',
			'30Rnd_9x19_MP5','30Rnd_9x19_MP5SD','30Rnd_9x19_UZI','30Rnd_9x19_UZI_SD',
			'50Rnd_127x108_KORD','64Rnd_9x19_Bizon','64Rnd_9x19_SD_Bizon','75Rnd_545x39_RPK',
			'100Rnd_762x51_M240','100Rnd_762x54_PK','100Rnd_556x45_BetaCMag','100Rnd_556x45_M249',
			'200Rnd_556x45_L110A1','200Rnd_556x45_M249','BoltSteel','1Rnd_HE_GP25',
			'1Rnd_HE_M203','1Rnd_Smoke_GP25','1Rnd_SmokeGreen_GP25','1Rnd_SmokeRed_GP25',
			'1Rnd_SmokeYellow_GP25','1Rnd_Smoke_M203','1Rnd_SmokeGreen_M203',
			'1Rnd_SmokeRed_M203','1Rnd_SmokeYellow_M203','6Rnd_HE_M203','BAF_ied_v1',
			'FlareGreen_GP25','FlareRed_GP25','FlareWhite_GP25','FlareYellow_GP25',
			'FlareGreen_M203','FlareRed_M203','FlareWhite_M203','FlareYellow_M203',
			'HandGrenade_East','HandGrenade_West','M136','SmokeShell','SmokeShellBlue',
			'SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed',
			'SmokeShellYellow','PipeBomb','FoodCanBakedBeans','FoodCanFrankBeans',
			'FoodCanPasta','FoodCanSardines','FoodSteakCooked','FoodSteakRaw',
			'HandChemBlue','HandChemGreen','HandChemRed','HandRoadFlare','ItemAntibiotic',
			'ItemBandage','ItemBloodbag','ItemEpinephrine','ItemHeatPack','ItemJerrycan',
			'ItemJerrycanEmpty','ItemMorphine','ItemPainkiller','ItemSandbag','ItemSodaCoke',
			'ItemSodaEmpty','ItemSodaMdew','ItemSodaPepsi','ItemTankTrap','ItemTent',
			'ItemWire','ItemWaterbottle','ItemWaterbottleUnfilled','PartEngine',
			'PartFueltank','PartGeneric','PartGlass','PartWheel','PartWoodPile',
			'PartVRotor','TrapBear','TrashTinCan','TrashJackDaniels','Skin_Camo1_DZ',
			'Skin_Soldier1_DZ','Skin_Sniper1_DZ','Skin_Survivor2_DZ'];
			_b0x addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];
			
			{_b0x addWeaponCargoGlobal [_x, 5];} forEach _b0x_wpnlist;
			{_b0x addMagazineCargoGlobal [_x, 20];} forEach _b0x_maglist;
			_b0x addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
		};
	};
	if (_option == 61) then 
	{
		_dir = getdir (_array select 1);
		_pos = getPos (_array select 1);
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		[_dir,_pos] spawn {
			_dir = _this select 0;
			_pos = _this select 1;
			_b0x = "Foodbox0" createVehicle _pos;
			clearWeaponCargoGlobal _b0x;
			clearmagazinecargoGlobal _b0x;
			
			PV_b0x_array = PV_b0x_array + [_b0x];
			publicVariable "PV_b0x_array";
			
			{_b0x addMagazineCargoGlobal [_x, 20];} forEach ["ItemWoodWallGarageDoor","ItemWoodWallGarageDoorLocked",
			"ItemWoodFloorHalf","ItemWoodWallDoorLg","ItemWoodWallWithDoorLgLocked","ItemWoodWallLg",
			"ItemWoodWallWindowLg","ItemWoodFloorQuarter","ItemWoodWallDoor","ItemWoodWallWithDoorLocked",
			"ItemWoodWall","ItemWoodWallWindow","ItemWoodWallThird","ItemWoodLadder","ItemWoodFloor","ItemWoodStairs",
			"ItemWoodStairsSupport","ItemWoodStairsSupports","ItemTentDomed2","ItemTentDomed","ItemTent","ItemTankTrap",
			"ItemSandbagLarge","ItemSandbag","ItemPole","ItemCorrugated","ItemCanvas","ItemBurlap","PartWoodLumber",
			"PartWoodPlywood","bulk_empty","wooden_shed_kit","wood_shack_kit","workbench_kit","stick_fence_kit",
			"sandbag_nest_kit","sun_shade_kit","rusty_gate_kit","outhouse_kit","storage_shed_kit","light_pole_kit",
			"ItemLightBulb","desert_net_kit","forest_net_kit","desert_large_net_kit","forest_large_net_kit","deer_stand_kit",
			"metal_panel_kit","ItemToolbox","ItemEtool","ItemComboLock","FoodMRE"];
			{_b0x addWeaponCargoGlobal [_x, 20];} forEach ["ItemKeyKit"];
		};
	};
	if (_option == 8) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
		};", getPlayerUID (_array select 1)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 9) then
	{
		_msg = _array select 2;
		["server", nil, rTitleText, toString(_msg), "PLAIN"] call SERVER_RE;
	};
	if (_option == 10) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			failMission 'LOSER';
		};", getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 11) then
	{
		_do = format ['if (getPlayerUID player == "%1") then
		{
			_unit = player;
			if (_unit == player) then
			{
				r_player_timeout = 30;
				r_player_unconscious = true;
				player setVariable ["medForceUpdate",true,true];
				player setVariable ["unconsciousTime", r_player_timeout, true];
			};
			if (vehicle _unit != _unit) then
			{
				_unit spawn {
					private["_veh","_unit"];
					_veh = vehicle _this;
					_unit = _this;
					waitUntil{(((position _veh select 2 < 1) and (speed _veh < 1)) or (!r_player_unconscious))};
					if (r_player_unconscious) then {
						_unit action ["eject", _veh];
						waitUntil{((vehicle _this) != _this)};
						sleep 1;
						_unit setVariable ["NORRN_unconscious", true, true];
						_unit playActionNow "Die";
					};
				};
			}
			else
			{
				_unit setVariable ["NORRN_unconscious", true, true];
				_unit playActionNow "Die";
			};
		};', getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 12) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			_object = player;
			_object allowDamage false;
		};", getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 13) then
	{
		_do = format ['if (getPlayerUID player == "%1") then
		{
			fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
			fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
			_object = player;
			_object allowDamage true;
		};', getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 14) then 
	{
		{
			if (((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 50) then
			{
				deleteVehicle _x;
			};
		} forEach allmissionobjects "Foodbox0";
		{
			if ((((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 200) or (count ([currentWeapon _x] + (weapons _x) + (magazines _x)) > 40)) then 
			{
				deleteVehicle _x;
			};
		} forEach allmissionobjects "ALL";
	};
	if (_option == 15) then
	{
		_do = format ['if (getPlayerUID player == "%1") then
		{
			[] spawn {
				hint "You took drugs YOLOLOLO";
				if (isNil "druggedbiatch") then {druggedbiatch = true;} else {druggedbiatch = !druggedbiatch;};
				while {druggedbiatch} do 
				{
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;
					sleep random(1);
					wetdist1 = ppEffectCreate ["wetDistortion", 2006];
					wetdist1 ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
					wetdist1 ppEffectEnable true;
					wetdist1 ppEffectCommit 0;
					ppe = ppEffectCreate ["colorCorrections", 1555]; 
					ppe ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]]; 
					ppe ppEffectCommit 1;
					ppe ppEffectEnable true; 
					ppe2 = ppEffectCreate ["chromAberration", 1555]; 
					ppe2 ppEffectAdjust [0.01,0.01,true];
					ppe2 ppEffectCommit 1;
					ppe2 ppEffectEnable true;
					ppe3 = ppEffectCreate ["radialBlur", 1555]; 
					ppe3 ppEffectEnable true;
					ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
					ppe3 ppEffectCommit 1;
					sleep random(1);
					wetdist1 = ppEffectCreate ["wetDistortion", 2006];
					wetdist1 ppEffectAdjust [1, 1.16, 0.32, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
					wetdist1 ppEffectEnable true;
					wetdist1 ppEffectCommit 0;
					sleep random(1);
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 2.5, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;
					sleep random(1);
				};
			};
		};', getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 16) then
	{
		_unit = _array select 1;
		PV_TMPBAN = [];
		publicVariable 'PV_TMPBAN';
	};
	if (_option == 17) then
	{
		_unit = _array select 2;
		["server", nil, rSPAWN, _unit, {if !(local _this) exitWith {};
		_PS = "#particlesource" createVehicleLocal getPos vehicle player;
		_PS setParticleCircle [0, [0, 0, 0]];
		_PS setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
		_PS setParticleParams [["\Ca\Data\flag_usa_co.paa", 8, 3, 1],
		"", "SpaceObject", 1, 10, [0, 0, 30], [0, 0, -2], 1, 10, 1, 0.2, [5, 5], 
		[[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 1], 1, 0, "", "", vehicle player];
		_PS setDropInterval 0.04;}] call SERVER_RE;
	};
	if (_option == 18) then
	{
		_unit = _array select 1;
		PV_TMPBAN = PV_TMPBAN + [getPlayerUID _unit] + [name _unit];
		publicVariable 'PV_TMPBAN';
		
		["server", nil, rSPAWN, _unit, {if !(local _this) exitWith {};
		_PS = "#particlesource" createVehicleLocal getPos vehicle player;
		_PS setParticleCircle [0, [0, 0, 0]];
		_PS setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
		_PS setParticleParams [["\Ca\Data\flag_usa_co.paa", 8, 3, 1],
		"", "SpaceObject", 1, 10, [0, 0, 30], [0, 0, -2], 1, 10, 1, 0.2, [5, 5], 
		[[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 1], 1, 0, "", "", vehicle player];
		_PS setDropInterval 0.04;}] call SERVER_RE;
	};
	if (_option == 182) then
	{
		_uid = _array select 1;
		_name = _array select 2;
		PV_TMPBAN = PV_TMPBAN - [_uid] - [_name];
		publicVariable 'PV_TMPBAN';
	};
	if (_option == 19) then 
	{
		_selection = _array select 2;
		_intensity = _array select 3;
		switch (_selection) do {
			case 1:
			{
				["server", nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {}; setViewDistance _this; }] call SERVER_RE;
				
				_savelog = format["%1 Viewdistance %2",name (_array select 1),_intensity];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
			case 2:
			{
				["server", nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {}; 8 setOvercast _this; }] call SERVER_RE;
				
				_savelog = format["%1 Weather %2",name (_array select 1),_intensity];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
			case 3:
			{
				["server", nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {}; 5 setRain _this; }] call SERVER_RE;
				
				_savelog = format["%1 Rain %2",name (_array select 1),_intensity];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		};
	};
	if (_option == 20) then 
	{
		_date = _array select 2;
		_offset = _array select 3;
		_date set [3,_offset];
		["server", nil, rSPAWN, _date, { setDate _this; }] call SERVER_RE;
		
		_savelog = format["%1 Time to %2",name (_array select 1),_date];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	if (_option == 21) then 
	{
		_do = format ['if (getPlayerUID player == "%1") then
		{
			[] spawn
			{
				_vehicle_player = vehicle player;
				playsound "Ivn_notscared";
				playsound "Ivn_notscared";
				sleep 2;
				playSound "Gul_youshouldbe";
				playSound "Gul_youshouldbe";
				sleep 4;
				playSound "beat04";playSound "beat04";
				playSound "beat04";playSound "beat04";
				_vehicle_player SetVelocity [5 + (random 8), 5 + (random 8), random 4];
				sleep 1.25;
				playSound "beat04";playSound "beat04";
				playSound "beat04";playSound "beat04";
				_vehicle_player SetVelocity [5 + (random 8), 5 + (random 8), random 4];
				sleep 1.25;
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				sleep 2.25;
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				
				cutText ["You Got Punished By An Admin", "PLAIN"];
			};
		};', getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 22) then 
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			removeAllWeapons player; 
			player addEventHandler ['fired', {if (alive player) then { player SetDamage 2;};}];
			_config = 'glock17_EP1';_isOK = [player,_config, true] call BIS_fnc_invAdd;
			_config = '17Rnd_9x19_glock17';_isOK = [player,_config, true] call BIS_fnc_invAdd;
			player selectWeapon 'glock17_EP1';
			reload player;
			sleep 1.5;
			player switchMove 'ActsPercMstpSnonWpstDnon_suicide1B';
			sleep 3.9;
			player fire (currentWeapon player);
		};", getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
};
/*
	PublicVariableEventHandlers - END
*/




diag_log ("infiSTAR.de ProPlan by infiSTAR.de - FULLY LOADED");