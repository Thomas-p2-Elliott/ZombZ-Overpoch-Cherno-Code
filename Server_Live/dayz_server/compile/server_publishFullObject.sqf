private ["_class","_uid","_charID","_object","_worldspace","_key","_allowed"];

_charID =		_this select 0;
_object = 		_this select 1;
_worldspace = 	_this select 2;
_class = 		_this select 3;
_inventory =	_this select 4;
_hitpoints =	_this select 5;
_damage =		_this select 6;
_fuel =			_this select 7;
_num = 			_this select 8;

if ((_num) < (p2pn - 1)) exitWith {
	0 = _object spawn KK_fnc_logFailed;
	_publishLog call stats_badPublishLog;
};

_allowed = [_charID, _object, _worldspace, _class, _charID] call check_publishobject;

if (!_allowed) exitWith { 
	0 = _object spawn KK_fnc_logFailed;
	_publishLog = format ["Failed Spawn: %1",_this];
	_publishLog call stats_badPublishLog;
};

//diag_log ("PUBLISH: Attempt " + str(_object));

//get UID
_uid = _worldspace call dayz_objectUID2;

//Send request
_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, _damage, _charID, _worldspace, _inventory, _hitpoints, _fuel,_uid];
//diag_log ("HIVE: WRITE: "+ str(_key));
_key call server_hiveWrite;

_object setVariable ["lastUpdate",time];
_object setVariable ["ObjectUID", _uid,true];
// _object setVariable ["CharacterID",_charID,true];

if (DZE_GodModeBase) then {
	_object addEventHandler ["HandleDamage", {false}];
}else{
	_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
	_object setVariable ["selections", []]; _object setVariable ["gethit", []];
	_object addEventHandler ["HandleDamage",{ _this call server_baseDamage}];
};
// Test disabling simulation server side on buildables only.
_object enableSimulation false;

PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];

//diag_log ("PUBLISH: Created " + (_class) + " with ID " + _uid);
