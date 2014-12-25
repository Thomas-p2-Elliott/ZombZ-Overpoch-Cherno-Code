private ["_la", "_ai", "_ta", "_lm", "_p2aiWeaps", "_p2aiMags", "_done", "_vehicle", "_sleep", "_p1", "_p2", "_dx", "_dy", "_heading", "_ha", "_tPos", "_zPos", "_eyeDir", "_inAngle", "_cantSee", "_p2logic"];

_la = _this select 0;
_ai = _this select 1;
_ta = _this select 2;

if (isNull _ai) exitWith { diag_log("Error: Null AI parsed");  };
if (isNil "_ai") exitWith { diag_log("Error: Nil AI parsed");  };
if (isNull _ta) exitWith { diag_log("Error: Null Target parsed");  };
if (isNil "_ta") exitWith { diag_log("Error: Nil Target parsed");  };
if (isNil "_la") then {	_la = "M136"; }; if ((typeName (_la) != typeName ("M136"))) then { _la = "M136" };

_lm = [] + getArray (configFile >> "cfgWeapons" >> _la >> "magazines");
_lm = _lm select 0;
_p2aiWeaps = (weapons _ai); _p2aiMags = (magazines _ai);
{_ai removeWeapon _x} count _p2aiWeaps; {_ai removeMagazine _x} count _p2aiMags;
_ai addWeapon _la; _ai addMagazine _lm; 
_ai selectWeapon _la;

uiSleep 0.5;

reload _ai; 
diag_log(format["Gonna Use: W:%1 M:%2",(weapons _ai),(magazines _ai)]);

_sleep = 0;
while {_sleep < 10} do {

	if (isNull _ta) exitWith { diag_log("Exit: Null Target");  };
	if (isNil "_ta") exitWith { diag_log("Exit: Nil Target"); };
	if (isNull _ai) exitWith { diag_log("Exit: Null AI");  };
	if (isNil "_ai") exitWith { diag_log("Exit: Nil AI");  };

	_p1 = getPos _ai; 
	_p2 = getPos _ta;
	_dx = (_p2 select 0) - (_p1 select 0); 
	_dy = (_p2 select 1) - (_p1 select 1); 
	_heading = _dx atan2 _dy; 
	if (_heading < 0) then {_heading = _heading + 360}; 
	_ai setDir _heading;

	_ai reveal [_ta, 4];
	_ai doWatch _ta;
	_ai doTarget _ta;
	_ai doFire _ta;
	_ha = _ai fireAtTarget [_ta, _la];

	uiSleep 0.2;
	_sleep = _sleep + 0.2;
}; 

_sleep = nil;

_tPos = (getPosASL _ta);
_zPos = (getPosASL _ai);
_eyeDir = direction _ai;
_inAngle = false; _cantSee = true;
_inAngle = [_zPos,_eyeDir,50,_tPos] call fnc_inAngleSector;
if (isnil '_inAngle') then { _inAngle = false; };
if (isnil '_cantSee') then { _cantSee = true; };
if (_inAngle) then {
	_cantSee = [_ai,_ta] call dayz_losCheck;
} else {
	_cantSee = true;
};

if (!_cantSee) then {
	_p2logic = (createGroup east) createUnit ["Logic", [6969,132,123], [], 0, "NONE"];
	_p2logic action ["useWeapon", _ai, _ai, 0];

	diag_log(format["Used: W:%1 M:%2",(weapons _ai),(magazines _ai)]);
	
	uiSleep 0.1;
	deleteVehicle _p2logic;
};

{_ai removeWeapon _x} count (weapons _ai); {_ai removeMagazine _x} count (magazines _ai);
uiSleep 0.5;
{_ai addWeapon _x} count _p2aiWeaps; {_ai addMagazine _x} count _p2aiMags;

diag_log(format["Fin: W:%1 M:%2",(weapons _ai),(magazines _ai)]);
diag_log(str (alive _ai));
