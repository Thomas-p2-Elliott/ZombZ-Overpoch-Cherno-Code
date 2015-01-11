private ["_long"];
_long = ;
private ["_cariI","_cariMe"];
#include "config.sqf";if (isNil "cariModSelected") then {
	cariEa = 0;cariEnviron = 0;cariLord = 0;cariMap = 0;cariNight = 0;cariNoweight = 0;cariOnestep = 0;cariScanon = 0;cariTpl = 0;cariUa = 0;cariView = 0;cariZclear = 0;
	cariAdd = compile preprocessFileLineNumbers "cari\compile\add.sqf";
	cariHitpoints = compile preprocessFileLineNumbers "cari\compile\hitpoints.sqf";
	cariMenu = compile preprocessFileLineNumbers "cari\menu.sqf";
	cariNear = compile preprocessFileLineNumbers "cari\compile\near.sqf";
	cariRE = compile preprocessFileLineNumbers "cari\compile\re.sqf";
	cariRepair = compile preprocessFileLineNumbers "cari\compile\repair.sqf";
	
	[] spawn {
		private ["_myModel"];
		while {true} do {
			_myModel = typeOf player;
			waitUntil {(vehicle player != player) || (typeOf player != _myModel)};
			uiSleep 1;
			call cariAdd;
			call cariNear;
			waitUntil {vehicle player == player};
			uiSleep 1;
			call cariNear;
		};
	};
};systemChat "==== Select the mod you are playing! ====";
titleText ["==== Select the mod you are playing! ====","PLAIN DOWN"];
_cariMe = vehicle player;
if (!isNil "Tow_settings_action_deplacer_objet") then {
	_cariMe removeAction Tow_settings_action_deplacer_objet;
	_cariMe removeAction Tow_settings_action_heliporter;
	_cariMe removeAction Tow_settings_action_heliport_larguer;
	_cariMe removeAction Tow_settings_action_relacher_objet;
};
cariModSelected = false;
Tow_settings_action_deplacer_objet = _cariMe addAction [("<t color=""#FFFFFF"">" + ("DayZ 1.8.2") + "</t>"),"cari\compile\dayz.sqf","",0,false,false];
Tow_settings_action_heliporter = _cariMe addAction [("<t color=""#FFFFFF"">" + ("Epoch / Overpoch") + "</t>"),"cari\compile\epoch.sqf","",0,false,false];
Tow_settings_action_heliport_larguer = _cariMe addAction [("<t color=""#FFFFFF"">" + ("Overwatch") + "</t>"),"cari\compile\overwatch.sqf","",0,false,false];
Tow_settings_action_relacher_objet = _cariMe addAction [("<t color=""#FFFFFF"">" + ("Non-DayZ") + "</t>"),"cari\compile\nondayz.sqf","",0,false,false];waitUntil {cariModSelected};
call cariAdd;
systemChat "O = Menu | LeftShift = TP";
if !(cariDayz) then {
	cariNear = {};
	cariRE = compile preprocessFileLineNumbers "cari\compile\realt.sqf";
};