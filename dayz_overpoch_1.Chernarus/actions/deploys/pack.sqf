private ["_debug","_nearby","_count","_inCombat","_timeout","_txt","_obj","_objPos","_sfx","_origMat","_bag"];

_nearby = {isPlayer _x} count (nearestObjects [player, ["CAManBase"], 5]);
_count = (_nearby - 1);

if (_count > 0) exitWith {
	_txt = "You can't pack vehicles when a player is within 5m of you!";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Anti-Hack: "+str _txt+"");
};

_obj = _this select 3;
if (((damage _obj) > 0.8) || !(canMove _obj)) exitWith {
	cutText ["This "+typeOf _obj+" is too damaged to pack.","PLAIN DOWN"];
	systemChat ("This "+typeOf _obj+" is too damaged to pack.");
};

player removeAction s_player_packOBJ;
r_interrupt = false;
player playActionNow "Medic";
sleep 1;

_sfx = "repair";
[player,_sfx,0,false,5] call dayz_zombieSpeak;
sleep 1;

PVDZ_OBJ_DEPLOY_PACK = [_obj,player];
publicVariableServer "PVDZ_OBJ_DEPLOY_PACK";

systemChat ("You have packed the " + typeOf _obj);
systemChat ("Look on the ground for your materials!");
