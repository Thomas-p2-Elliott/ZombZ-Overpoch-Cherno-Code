private ["_long"];
_long = ;
private ["_cariMe"];_cariMe = vehicle player;
if (!isNil "Tow_settings_action_deplacer_objet") then {
	_cariMe removeAction Tow_settings_action_deplacer_objet;
	_cariMe removeAction Tow_settings_action_heliporter;
	_cariMe removeAction Tow_settings_action_heliport_larguer;
	_cariMe removeAction Tow_settings_action_relacher_objet;
};
Tow_settings_action_deplacer_objet = _cariMe addAction [("<t color=""#FFFFFF"">" + ("Menu") + "</t>"),"cari\menu.sqf","",0,false,false,"Watch"];
Tow_settings_action_heliporter = _cariMe addAction [("<t color=""#FFFFFF"">" + ("Delete") + "</t>"),"cari\target\delete.sqf","",0,false,false];
Tow_settings_action_heliport_larguer = _cariMe addAction [("<t color=""#FFFFFF"">" + ("Unlock / GetOut") + "</t>"),"cari\target\unlock.sqf","",0,false,false];
Tow_settings_action_relacher_objet = _cariMe addAction [("<t color=""#FFFFFF"">" + ("TP") + "</t>"),"cari\target\tp.sqf","",0,false,false,"VehicleTurbo"];
if (cariEpoch) then {player setVariable["DZE_display_name",false,true];};
