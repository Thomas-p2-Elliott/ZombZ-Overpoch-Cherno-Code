private ["_class","_uid","_charID","_object","_worldspace","_key","_allowed"];
//[dayz_characterID,_tent,[_dir,_location],"TentStorage"]
_charID =		_this select 0;
_object = 		_this select 1;
_worldspace = 	_this select 2;
_class = 		_this select 3;
_playerUID = 	_worldspace select 2;
_num = 			_this select 4;
if (isNil "_num") then { _num = 0; };
if (typeName _num != typeName 0) then { _num = 0; };
//diag_log ("PUBLISH: Attempt " + str(_this));


if ((_num) < (p2pn - 1)) exitWith {
	0 = _object spawn KK_fnc_logFailed;
	_publishLog call stats_badPublishLog;
	[_playerUID,"Invalid Security Number: Publish Object"] call kk_fnc_logBadNum;
};

/*  	dayz_characterID,	_object,			_worldspace,		_class,						_playerUID*/
_allowed = [(_this select 0),(_this select 1),(_this select 2),(_this select 3),((_this select 2) select 2)] call check_publishobject;

if (!_allowed) exitWith {
	0 = _object spawn KK_fnc_logFailed;
	_publishLog = format ["Failed Spawn: %1",_this];
	_publishLog call stats_badPublishLog;
};

//diag_log(diag_log ("PUBLISH: Success " + str(_this)));

//get UID
_uid = [random(100),_worldspace select 1] call dayz_objectUID2;

//Send request
_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _charID, _worldspace, [], [], 0,_uid];
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

//diag_log ("PUBLISH: Created " + (_class) + " with ID " + _uid);
