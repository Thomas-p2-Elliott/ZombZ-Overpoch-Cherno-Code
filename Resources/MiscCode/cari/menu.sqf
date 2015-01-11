private ["_long"];
_long = ;
private ["_bag","_bags","_bagType","_cfgMagazines","_cfgVehicles","_cfgWeapons","_entry","_final","_finalMag","_finalPlayer","_i","_mag","_magType","_magazines","_needsPlayer","_player","_resize","_cariList","_cariPart1","_cariPart2","_cariPart3","_cariPart4","_cariPart5","_cariPath","_cariPatht","_cariPathR","_cariPathRt","_cariSheep","_cariWhole","_weapons","_wepType","_script","_selection","_switchable","_tMag","_tVehicle","_vehicles","_vehicleL","_vehiclesL","_vehiclesS"];#define cariUsable ((getNumber (_mag >> "scope") == 0) || (getNumber (_mag >> "scope") == 2)) && (getText (_mag >> "picture") != "")
#include "config.sqf";
disableSerialization;
createGearDialog [player, "RscDisplayGear"];
_cariPart1 = "Rsc";
_cariPart2 = "Displa";
_cariPart3 = "yMulti";
_cariPart4 = "player";
_cariPart5 = "Setup";
_cariWhole = format ["%1%2%3%4%5",_cariPart1,_cariPart2,_cariPart3,_cariPart4,_cariPart5];
_i="createDialog";createDialog _cariWhole;titleText ["==== Loading please wait... ====","PLAIN DOWN"];titleFadeOut 4;
_entry = [];
_entry set [count _entry,["    ==== Main =====================","filler.sqf","0","4"]];
_entry set [count _entry,["    E. ammo","ea.sqf","0","1"]];
_entry set [count _entry,["    Environment sounds","environment.sqf","0","1"]];
_entry set [count _entry,["    God","god.sqf","0","1"]];
_entry set [count _entry,["    HUD view","hudview.sqf","0","1"]];
_entry set [count _entry,["    E__S__P","e_s_p.sqf","0","1"]];
_entry set [count _entry,["    E__S__P MAP","map_m.sqf","0","1"]];
_entry set [count _entry,["    Vehicle B00st","Fasty.sqf","0","1"]];
_entry set [count _entry,["    Map HUD view (for BHF disabled)","map.sqf","0","1"]];
_entry set [count _entry,["    Move vehicle to me","movevehicle.sqf","3","0"]];
_entry set [count _entry,["    No weight limit","noweightlimit.sqf","0","1"]];
if (cariEpoch) then {_entry set [count _entry,["    One step build, no limit, no plot","onestepbuild.sqf","0","1"]];};
if (cariDayz) then {_entry set [count _entry,["    TP","tp.sqf","0","0"]];};
_entry set [count _entry,["    TP with LeftShift","tpl.sqf","0","1"]];
_entry set [count _entry,["    U. ammo","ua.sqf","0","1"]];
if (cariDayz) then {_entry set [count _entry,["    Z clear","zclear.sqf","0","1"]];};
_entry set [count _entry,["    ==== Spawn ===================","filler.sqf","0","4"]];
_entry set [count _entry,["    Backpack (bad bags may ban)","bag.sqf","3","0"]];
_entry set [count _entry,["    Box local (taking bad items may ban)","boxl.sqf","0","0"]];
if (cariEpoch) then {
	_entry set [count _entry,["    Gold coins ccg","goldcoinsccg.sqf","0","0"]];
	_entry set [count _entry,["    Gold coins firecock","goldcoinsfirecock.sqf","0","0"]];
	_entry set [count _entry,["    Gold coins zupa","goldcoinszupa.sqf","0","0"]];
};
_entry set [count _entry,["    Item (bad items may ban)","item.sqf","3","0"]];
_entry set [count _entry,["    Money (wasteland)","moneyw.sqf","0","0"]];
_entry set [count _entry,["    Regen food and drink (wasteland)","fooddrinkw.sqf","0","0"]];
_entry set [count _entry,["    Vehicle local (bad vehs may be deleted and logged by AH)","vehiclel.sqf","3","0"]];
_entry set [count _entry,["    Weapon (bad weps may ban)","weapon.sqf","3","0"]];
_entry set [count _entry,["    ==== Target ===================","filler.sqf","0","4"]];
if (cariEpoch) then {
	_entry set [count _entry,["    Add gold coins ccg","goldcoinsccgt.sqf","1","0"]];
	_entry set [count _entry,["    Add gold coins firecock","goldcoinsfirecockt.sqf","1","0"]];
	_entry set [count _entry,["    Add gold coins zupa","goldcoinszupat.sqf","1","0"]];
};
if (cariDayz) then {_entry set [count _entry,["    Add humanity","addhumanity.sqf","1","0"]];};
_entry set [count _entry,["    Add money wasteland","addmoneyw.sqf","1","0"]];
_entry set [count _entry,["    Bomb","bomb.sqf","1","0"]];
if (cariDayz) then {_entry set [count _entry,["    Create zeds around","createzeds.sqf","1","0"]];};
_entry set [count _entry,["    Heal","heal.sqf","1","0"]];
if (cariDayz) then {_entry set [count _entry,["    Join vehicle","joint.sqf","1","0"]];};
if (cariDayz) then {_entry set [count _entry,["    Move to player","moveto.sqf","1","0"]];};
_entry set [count _entry,["    Repair vehicle","repair.sqf","1","0"]];
_entry set [count _entry,["    Spectate","spectate.sqf","1","0"]];
if (cariDayz) then {_entry set [count _entry,["    Subtract humanity","subtracthumanity.sqf","1","0"]];};
_entry set [count _entry,["    ==== Misc ======================","filler.sqf","0","4"]];
_entry set [count _entry,["    Daytime and view distance 1600m","view1600.sqf","0","0"]];
_entry set [count _entry,["    Daytime and view distance 3000m","view3000.sqf","0","0"]];
_entry set [count _entry,["    Flip near vehicle upright","flip.sqf","0","0"]];
_entry set [count _entry,["    Log client function","logfunction.sqf","0","0"]];
_entry set [count _entry,["    ==== Destruction ================","filler.sqf","0","4"]];
_entry set [count _entry,["    Bomb whole server","bomb.sqf","0","0"]];
_entry set [count _entry,["    Crash  server","crash.sqf","0","0"]];
_entry set [count _entry,["    Explode whole server","explode.sqf","0","0"]];
_entry set [count _entry,["    ==== Remote ====================","filler.sqf","0","4"]];
_entry set [count _entry,["    Not Paid Bill (Advanced)","buy.sqf","2","0"]];
_entry set [count _entry,["    Not Paid Bill (Basic)","buy1.sqf","2","0"]];
_entry set [count _entry,["    9-11","911.sqf","2","0"]];
_entry set [count _entry,["    A-bomb","abomb.sqf","2","0"]];
_entry set [count _entry,["    Ban every player","banep.sqf","2","0"]];
_entry set [count _entry,["    BattlEye kick every player","battleyekickep.sqf","2","0"]];
_entry set [count _entry,["    Box (taking bad items may ban)","boxr.sqf","2","0"]];
_entry set [count _entry,["    Delayed kill and message everyone loop","delayedloop.sqf","2","0"]];
_entry set [count _entry,["    Everyone dance","dance.sqf","2","0"]];
_entry set [count _entry,["    Highlight AH admins","getadmins.sqf","2","0"]];
_entry set [count _entry,["    Kill every player","wreckep.sqf","2","0"]];
_entry set [count _entry,["    Log server file","logfile.sqf","2","0"]];
_entry set [count _entry,["    Log server function","logfunction.sqf","2","0"]];
_entry set [count _entry,["    Message everyone","message.sqf","2","0"]];
if (cariDayz) then {_entry set [count _entry,["    Morph every player","morphep.sqf","2","0"]];};
_entry set [count _entry,["    Night","night.sqf","2","1"]];
_entry set [count _entry,["    Para animal/unit","parau.sqf","2","0"]];
_entry set [count _entry,["    Para object/vehicle","parav.sqf","2","0"]];
_entry set [count _entry,["    Remove gear of every player","removeall.sqf","2","0"]];
_entry set [count _entry,["    Skid scan","scan.sqf","2","1"]];
if (cariDayz) then {_entry set [count _entry,["    TP every player","tpep.sqf","2","0"]];};
if (cariDayz) then {_entry set [count _entry,["    Vehicle hive (bad vehs may be deleted and logged by AH)","vehicleh.sqf","3","0"]];};
_entry set [count _entry,["    Vehicle regular (bad vehs may be deleted and logged by AH)","vehicler.sqf","3","0"]];
_entry set [count _entry,["    Wreck every base","wreckeb.sqf","2","0"]];
_entry set [count _entry,["    Wreck every vehicle","wreckev.sqf","2","0"]];
_entry set [count _entry,["    ==== Remote Target ===============","filler.sqf","0","4"]];
_entry set [count _entry,["    Ban","bant.sqf","5","0"]];
_entry set [count _entry,["    BattlEye kick","battleyekickt.sqf","5","0"]];
_entry set [count _entry,["    Eject from vehicle","ejectt.sqf","5","0"]];
_entry set [count _entry,["    Heal","heal.sqf","5","0"]];
if (cariDayz) then {_entry set [count _entry,["    Infect","infect.sqf","5","0"]];};
_entry set [count _entry,["    Kill","killt.sqf","5","0"]];
_entry set [count _entry,["    Message","messaget.sqf","5","0"]];
if (cariDayz) then {_entry set [count _entry,["    Morph","morpht.sqf","5","0"]];};
_entry set [count _entry,["    Remove gear","removet.sqf","5","0"]];lbClear 109;
lbClear 114;
{
	lbAdd [109,format["%1",(_entry select _forEachIndex) select 0]];
	_script = _x select 1;
	_switchable = _x select 3;
	lbSetColor [109,_forEachIndex,cariMenuCp];
	if (_switchable != "0") then {
		switch _script do {
			case "ea.sqf": {if (cariEa == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "environment.sqf": {if (cariEnviron == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "god.sqf": {if (cariLord == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "map.sqf": {if (cariMap == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "night.sqf": {if (cariNight == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "noweightlimit.sqf": {if (cariNoweight == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "onestepbuild.sqf": {if (cariOnestep == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "scan.sqf": {if (cariScanon == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "tpl.sqf": {if (cariTpl == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "ua.sqf": {if (cariUa == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "hudview.sqf": {if (cariView == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "zclear.sqf": {if (cariZclear == 1) then {lbSetColor [109,_forEachIndex,cariMenuCt];};};
			case "filler.sqf": {lbSetColor [109,_forEachIndex,[1,.95,.76,1]];};
		};
	};
} forEach _entry;ctrlShow [1,false];
ctrlShow [2,false];
ctrlShow [101,false];
ctrlShow [102,false];
ctrlShow [103,false];
ctrlShow [105,false];
ctrlShow [107,false];
ctrlShow [116,false];
ctrlShow [117,false];
ctrlShow [118,false];
ctrlShow [125,false];
ctrlShow [126,false];
ctrlShow [127,false];
ctrlShow [128,false];
ctrlShow [1002,false];
ctrlShow [1003,false];
ctrlShow [1004,false];
ctrlShow [1012,false];
ctrlSetText [104,""];
ctrlSetText [106,""];
ctrlSetText [108,"1. Click script to run first"];
ctrlSetText [121,""];
ctrlSetText [1001,"Menu by wailord"];
ctrlSetText [1005,""];
ctrlSetText [1006,"2. Click target if needed second"];_cariList = [7839,8414,0] nearEntities ["AllVehicles",11800];
_cariSheep = [];
{
	if ((!isNull _x) && (getPlayerUID _x != "")) then {
		if (!isNil "cariAdmins") then {
			if ((getPlayerUID _x) in cariAdmins) then {
				lbAdd [114,format["ADMIN: %1 (%2)",name _x,typeOf (vehicle _x)]];
				lbSetColor [114,count _cariSheep,[1,0,0,1]];
			} else {
				lbAdd [114,format["%1 (%2)",name _x,typeOf (vehicle _x)]];
				if (_x isKindOf "Air") then {lbSetColor [114,count _cariSheep,cariMenuCt];};
				if (_x isKindOf "Ship") then {lbSetColor [114,count _cariSheep,cariMenuCs];};
			};
		} else {
			lbAdd [114,format["%1 (%2)",name _x,typeOf (vehicle _x)]];
			if (_x isKindOf "Air") then {lbSetColor [114,count _cariSheep,cariMenuCt];};
			if (_x isKindOf "Ship") then {lbSetColor [114,count _cariSheep,cariMenuCs];};
		};
		_cariSheep set [count _cariSheep,_x];
	};
} count _cariList;titleText ["\n\n==== Loading complete! ====","PLAIN DOWN"];titleFadeOut 4;_selection = lbCurSel 109;
waitUntil {(!dialog) || (_selection != (lbCurSel 109))};
if (!dialog) exitWith {};_final = lbCurSel 109;
if (_final == -1) exitWith {};
_selection = _entry select _final;
_script = _selection select 1;
_needsPlayer = _selection select 2;if (_script == "movevehicle.sqf") then {
	lbClear 114;
	_vehiclesS = [];
	_vehicles = [7839,8414,0] nearEntities [["Air","LandVehicle","Ship"],10000];
	{
		if (count crew (_x) == 0) then {
			if (_x isKindOf "Air") then {lbAdd [114,format["Air: %1",typeOf _x]];lbSetColor [114,count _vehiclesS,cariMenuCt];_vehiclesS set [count _vehiclesS,_x];};
			if (_x isKindOf "LandVehicle") then {lbAdd [114,format["Land: %1",typeOf _x]];_vehiclesS set [count _vehiclesS,_x];};
			if (_x isKindOf "Ship") then {lbAdd [114,format["Ship: %1",typeOf _x]];lbSetColor [114,count _vehiclesS,cariMenuCs];_vehiclesS set [count _vehiclesS,_x];};
		};
	} count _vehicles;
};if (_script in ["vehicleh.sqf","vehiclel.sqf","vehicler.sqf"]) then {
	lbClear 114;
	if (_script in ["vehicleh.sqf","vehicler.sqf"]) then {systemChat "Warning: bad vehicles may be deleted and logged by AH!";};
	titleText ["==== Loading please wait... ====","PLAIN DOWN"];
	_cfgVehicles = configFile >> "cfgVehicles";
	_vehiclesL = [];
	for "_i" from 0 to (count _cfgVehicles)-1 do {
		_vehicleL = _cfgVehicles select _i;
		if (isClass _vehicleL) then {
			_vehicleType = configName _vehicleL;
			if ((getNumber (_vehicleL >> "scope") == 2) && (getText (_vehicleL >> "picture") != "")) then {
				if (_vehicleType isKindOf "Air") then {lbAdd [114,format["Air: %1",_vehicleType]];lbSetColor [114,count _vehiclesL,cariMenuCt];_vehiclesL set [count _vehiclesL,_vehicleType];};
				if (_vehicleType isKindOf "LandVehicle") then {lbAdd [114,format["Land: %1",_vehicleType]];_vehiclesL set [count _vehiclesL,_vehicleType];};
				if (_vehicleType isKindOf "Ship") then {lbAdd [114,format["Ship: %1",_vehicleType]];lbSetColor [114,count _vehiclesL,cariMenuCs];_vehiclesL set [count _vehiclesL,_vehicleType];};
			};
		};
	};
	titleText ["\n\n==== Loading complete! ====","PLAIN DOWN"];titleFadeOut 4;
};if (_script == "bag.sqf") then {
	systemChat "Warning: bad backpacks may ban";
	lbClear 114;
	_cfgVehicles = configFile >> "CfgVehicles";
	_bags = [];
	for "_i" from 0 to (count _cfgVehicles)-1 do {
		_bag = _cfgVehicles select _i;		
		if (isClass _bag) then {
			_bagType = configName _bag;
			if ((getNumber (_bag >> "scope") >= 2) && (getText (_bag >> "picture") != "") && (getText (_bag >> "vehicleClass") == "Backpacks")) then {
				lbAdd [114,format["%1",_bagType]];lbSetColor [114,count _bags,cariMenuCs];_bags set [count _bags,_bagType];
			};
		};
	};
};if (_script == "item.sqf") then {
	systemChat "Warning: bad items may ban";
	lbClear 114;
	_cfgMagazines = configFile >> "CfgMagazines";
	_magazines = [];
	for "_i" from 0 to (count _cfgMagazines)-1 do {
		_mag = _cfgMagazines select _i;
		if (isClass _mag) then {
			_magType = configName _mag;
			if (cariUsable) then {lbAdd [114,format["%1",_magType]];lbSetColor [114,count _magazines,cariMenuCs];_magazines set [count _magazines,_magType];};
		};
	};
};if (_script == "weapon.sqf") then {
	systemChat "Warning: bad weapons may ban";
	lbClear 114;
	titleText ["==== Loading please wait... ====","PLAIN DOWN"];
	_cfgWeapons = configFile >> "cfgWeapons";
	_weapons = [];
	for "_i" from 0 to (count _cfgWeapons)-1 do {
		_mag = _cfgWeapons select _i;
		if (isClass _mag) then {
			_wepType = configName _mag;
			_resize = toArray _wepType;
			_resize resize 7;
			_resize;
			_resize = toString _resize;
			if ((_resize != "ItemKey") || (_wepType == "ItemKeyKit")) then {	
				if (cariUsable) then {lbAdd [114,format["%1",_wepType]];lbSetColor [114,count _weapons,cariMenuCs];_weapons set [count _weapons,_wepType];};
			};
		};
	};
	titleText ["\n\n==== Loading complete! ====","PLAIN DOWN"];titleFadeOut 4;
};_player = lbCurSel 114;
if (_needsPlayer in ["1","5"]) then {waitUntil {(!dialog) || (_player != (lbCurSel 114))};};
if (!dialog) exitWith {};_cariPath = "cari\main\";
_cariPatht = "cari\target\";
_cariPathR = "cari\remote\";
_cariPathRt = "cari\remotet\";if (_script in ["movevehicle.sqf","vehicleh.sqf","vehiclel.sqf","vehicler.sqf"]) then {
	_tVehicle = lbCurSel 114;
	waitUntil {(!dialog) || (_tVehicle != (lbCurSel 114))};
	if (!dialog) exitWith {};
	_finalVehicle = lbCurSel 114;
	if (_finalVehicle == -1) exitWith {};
	if (_script == "movevehicle.sqf") then {_tVehicle = _vehiclesS select _finalVehicle;} else {_tVehicle = _vehiclesL select _finalVehicle;};
	if (_script in ["movevehicle.sqf","vehiclel.sqf"]) exitWith {[_tVehicle] execVM format["%1%2",_cariPath,_script];};
	[_tVehicle] execVM format["%1%2",_cariPathR,_script];
};
if (_script in ["bag.sqf","item.sqf","weapon.sqf"]) then {
	_tMag = lbCurSel 114;
	waitUntil {(!dialog) || (_tMag != (lbCurSel 114))};
	if (!dialog) exitWith {};
	_finalMag = lbCurSel 114;
	if (_finalMag == -1) exitWith {};
	if (_script == "bag.sqf") then {_tMag = _bags select _finalMag;};
	if (_script == "item.sqf") then {_tMag = _magazines select _finalMag;};
	if (_script == "weapon.sqf") then {_tMag = _weapons select _finalMag;};
	[_tMag] execVM format["%1%2",_cariPath,_script];
};
if (!dialog) exitWith {};if (_needsPlayer == "2") then {execVM format["%1%2",_cariPathR,_script];};if (_needsPlayer in ["1","5"]) then {
	_finalPlayer = lbCurSel 114;
	if (_finalPlayer == -1) exitWith {};
	_player = _cariSheep select _finalPlayer;
	if (_needsPlayer == "1") then {[_player] execVM format["%1%2",_cariPatht,_script];};
	if (_needsPlayer == "5") then {[_player] execVM format["%1%2",_cariPathRt,_script];};
};if (_needsPlayer == "0") then {execVM format["%1%2",_cariPath,_script];};
closeDialog 0;
uiSleep .01;
closeDialog 0;