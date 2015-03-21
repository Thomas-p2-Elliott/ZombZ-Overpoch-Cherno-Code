/*---------------------------------------------------------------------------
Damaged Objects Cache

Cache of objects that have had their damage property changed since
the server started up.

Cache is an array with chunks of data stored in arrays within it.
Each chunk of data looks like this:

Object Name 	Object Damage   Aware Client IDs
-----------		--------------  ----------------
["balota_100",		0.1,			[1,23,32,55]]

---------------------------------------------------------------------------*/


P2LOS_S_Cache = [];

P2LOS_S_Cache_Update = {
	private ["_d", "_in", "_inObj", "_inDmg", "_p2u", "_cacheData", "_cacheObj", "_cacheDmg"];
	_d = P2LOS_Debug_Server_Cache;
	_in = _this;
	_inObj = _in select 0;
	_inDmg = _in select 1;
	_inPlyr = _in select 2;

	if (_d) then {
		diag_log("P2LOS_S_Cache_Update: Input: " + str _this);
	};

	_p2u = nil; _p2u = false;
	{
		_cacheData = _x;
		_cacheObj = _cacheData select 0;
		_cacheDmg = _cacheData select 1;

		if (_cacheObj == _inObj) then {
			if (_cacheDmg != _inDmg) then {

				_p2u = true;
				P2LOS_S_Cache set [_foreachindex, _in];
				
				if (_d) then {
					diag_log("P2LOS_S_Cache_Update: Item Damage Updated: " + str _in);
				};


			};
		};
	} forEach P2LOS_S_Cache;


	if (_p2u) exitWith {
		//Item already exists & up to date
	};

	P2LOS_S_Cache set [count P2LOS_S_Cache, _this];
	if (_d) then {
		diag_log("P2LOS_S_Cache_Update: Item Added: " + str _in);
	};

};



/*---------------------------------------------------------------------------
End of Damaged Objects Cache
---------------------------------------------------------------------------*/








P2LOS_S_SendDmg = {
	diag_log(format["P2LOS_S_SendDmg: Input: %1", _this]);
	[_this select 1, _this select 0, _this select 2] call P2LOS_S_Cache_Update;

	{
		diag_log(format["P2LOS_S_SendDmg Player: %1, Distance from Obj: %2", _x,_x distance (_this select 2)]);

		if (_x distance (_this select 2) < 300) then {
			P2LOS_NetDmg = [_this select 1, _this select 0];
			(owner _x) publicVariableClient "P2LOS_NetDmg";
			diag_log(format["P2LOS_S_SendDmg: %1 SentPubVar: %2", (owner _x), P2LOS_NetDmg]);
		};
	} forEach playableUnits;
};

P2LOS_S_SendKill = {
	private["_obj","_src","_localObj"];
	_this spawn {
		_obj = _this select 0;
		if (!(local (call compile (format["%1", _obj])))) exitWith {};
		_src = _this select 1;
		_d = true;
		_localObj = call compile ("if (local " + format["%1", _obj] + ") then { "+format["%1", _obj]+" } else { nil };");
		diag_log(format["P2LOS_S_SendKill: _localObj: %1", _localObj]);

		if (!isNil '_localObj') then {
			if (typeName _localObj == "OBJECT") then {
				if (!isNull _localObj) then {
					if (local _localObj) then {
						if (_d) then {
							diag_log('P2LOS_S_SendKill: Object Killed:' + str _localObj);
						};
						if (alive _localObj) then {
							[1.420, format["%1",_obj], position _localObj] call P2LOS_S_SendDmg;				
						};
					};
				};
			};
		};
	};

};

P2LOS_S_recDmg = {
	private["_obj","_dmg","_localObj"];
	_obj = _this select 0;
	_dmg = _this select 1;
	_localObj = call compile ("if (local " + format["%1", _obj] + ") then { "+format["%1", _obj]+" } else { nil };");
		diag_log(format["P2LOS_S_recDmg: _localObj: %1", _localObj]);

	_d = true;
	if (!isNil '_localObj') then {
		if (typeName _localObj == "OBJECT") then {
			if (!isNull _localObj) then {
				if (local _localObj) then {
					if (_d) then {
						diag_log('P2LOS_S_recDmg: Object Damage:' + str _localObj + ", Damage: " + str _dmg);
					};
					if (_dmg > 1) then {
						[_dmg, format["%1",_obj], position _localObj] call P2LOS_S_SendDmg;
					} else {
						_localObj setDamage _dmg;
						[_dmg, format["%1",_obj], position _localObj] call P2LOS_S_SendDmg;
					};
				};
			};
		};
	};
};

P2LOS_S_dmgCacheCheck = {
	diag_log(format['%1: %2: %3','P2LOS_S_dmgCacheCheck','Input',_this]);

	private["_obj"];
	{
		_obj = nil; obj = objNull;
		_obj = nearestObjects [_this select 0, [], 5];
		if (isNil '_obj') then { _obj = -1; };
		if (typeName _obj == "ARRAY") then {
			_obj = _obj select 0;
			if (isNil '_obj') then { _obj = -1;  };
			if (typeName _obj == "OBJECT") then {
				diag_log(format['%1: %2: %3','P2LOS_S_dmgCacheCheck','_obj',_obj]);
				diag_log(format['%1: %2: %3','P2LOS_S_dmgCacheCheck','_x select 0',(call compile format["%1", _x select 0])]);

				if ((call compile format["%1", _x select 0]) == _obj) then {
					P2LOS_NetDmg = [_x select 0, _x select 1];
					(_this select 1) publicVariableClient "P2LOS_NetDmg";
					diag_log(format["P2LOS_S_dmgCacheCheck: P2LOS_NetDmg: %1 SentPubVar: %2", (_this select 1), P2LOS_NetDmg]);
				};
			};
		};

	} forEach P2LOS_S_Cache;
};

"P2LOS_dmgCheck" addPublicVariableEventHandler {
	diag_log format [
		"P2LOS_dmgCheck: _this 0 %1: _this 1-0 %2: owner _this 1-1: %3",
		(_this select 0),
		(_this select 1) select 0,
		owner ((_this select 1) select 1)		
	];
	[(_this select 1) select 0, owner ((_this select 1) select 1)] call P2LOS_S_dmgCacheCheck;
};

"P2LOS_objKill" addPublicVariableEventHandler {
	diag_log format [
		"%1: %2: 	Killer: %3",
		(_this select 0),
		(_this select 1) select 0,
		(_this select 1) select 1		
	];
	(_this select 1) call P2LOS_S_SendKill;
};

"P2LOS_objHit" addPublicVariableEventHandler {
	diag_log format [
		"%1: %2: 	Damage: %3,	 From: %4,	Using: %5",
		(_this select 0),
		(_this select 1)  select 0,
		(_this select 1)  select 1,
		(_this select 1)  select 2,
		(_this select 1)  select 3
	];
	([(_this select 1)  select 0,(_this select 1)  select 1]) call P2LOS_S_recDmg;
};  