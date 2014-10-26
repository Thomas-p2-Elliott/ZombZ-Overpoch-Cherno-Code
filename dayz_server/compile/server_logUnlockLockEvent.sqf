//server_logUnlockLockEvent.sqf by player2
P2DZ_debugLockUnlock = true;


private["_player", "_obj", "_objectID", "_objectUID", "_statusText", "_PUID", "_status","_log","_objGold","_gold"];
_player = 		_this select 0;
_obj = 			_this select 1;
_status = 		_this select 2;
_newObject = 	_this select 3;
_objGold = 		_this select 4;
_gold = 		0;

if (P2DZ_debugLockUnlock) then { diag_log(format["server_logUnlockLockEvent: _this: %1", str _this]); };

if (!isNull(_obj)) then {
	_objectID = _obj getVariable["ObjectID", "0"];
	_objectUID = _obj getVariable["ObjectUID", "0"];
	_objGoldServer = _obj getVariable["ZombZGold", nil];

	_obj call {
	    _this setVariable [
	        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
	        "hash_id" callExtension format [
	            "%1:%2",
	            netId _this,
	            typeOf _this
	        ]
	    ];
	};

	if (isNil '_objGold') then {

		if (P2DZ_debugLockUnlock) then { diag_log("isNil: _objGold:"); };

		if (!isNil '_objGoldServer') then {

			if (P2DZ_debugLockUnlock) then { diag_log(format["!isNil: _objGoldServer: %1", _objGoldServer]); };
			_gold = _objGoldServer;

		} else {

			if (P2DZ_debugLockUnlock) then { diag_log("isNil: _objGoldServer: 0"); };
			_gold = 0;

		};

	} else {

		if (P2DZ_debugLockUnlock) then { diag_log(format["!isNil: _objGold: %1", _objGold]); };
		_gold = _objGold;

	};

	if (!isNull(_newObject)) then {
		_newObject setVariable ["ZombZGold", _gold, true];
	};
	
	_obj setVariable ["ZombZGold", _gold, true];

	if (P2DZ_debugLockUnlock) then { diag_log(format["server_logUnlockLockEvent: GoldSet: %1", _gold]); };

	_statusText = "UNLOCKED";
	if (_status) then {
		[_obj, "gear"] call server_updateObject;
		_statusText = "LOCKED";
	};
	_PUID = [_player] call FNC_GetPlayerUID;

} else {

	if (!isNull(_newObject)) then {

		if (isNil '_objGold') then {

			if (P2DZ_debugLockUnlock) then { diag_log("2isNil: _objGold:"); };

			if (!isNil '_objGoldServer') then {

				if (P2DZ_debugLockUnlock) then { diag_log(format["2!isNil: _objGoldServer: %1", _objGoldServer]); };
				_gold = _objGoldServer;

			} else {

				if (P2DZ_debugLockUnlock) then { diag_log("2isNil: _objGoldServer: 0"); };
				_gold = 0;

			};

		} else {

			if (P2DZ_debugLockUnlock) then { diag_log(format["2!isNil: _objGold: %1", _objGold]); };
			_gold = _objGold;

		};

		_newObject setVariable ["ZombZGold", _gold, true];
	} else {
		diag_log("server_logUnlockLockEvent: ERROR: " + str _this);
	};
};

if (!isNull(_newObject)) then {
	_newObject call {
	    _this setVariable [
	        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
	        "hash_id" callExtension format [
	            "%1:%2",
	            netId _this,
	            typeOf _this
	        ]
	    ];
	};
} else {
	diag_log("server_logUnlockLockEvent: ERROR: " + str _this);
};

_log = format["%1", str _this];
[format["%1_%2",P2DZ_serverName,"lockUnlockLog"],
_log] call p2net_log1; 

deleteVehicle _obj;