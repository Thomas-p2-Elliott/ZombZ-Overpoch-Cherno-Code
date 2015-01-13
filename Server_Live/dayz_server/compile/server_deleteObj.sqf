private["_id","_uid","_key","_num","_activatingPlayer"];
diag_log(format["Server Database Delete Object Called with Input: %1", _this]);
_id 	= _this select 0;
_uid 	= _this select 1;
_activatingPlayer 	= _this select 2;
_num = _this select 3;
if (isNil "_num") then { _num = 0; };
if (typeName _num != typeName 0) then { _num = 0; };
if ((_num) < (p2dn - 1)) exitWith {
	[_uid,"Invalid Security Number: Delete Object"] call kk_fnc_logBadNum; 
	[_activatingPlayer,"Invalid Security Number: Delete Object"] call kk_fnc_logBadNum;
};

if (isServer) then {
	if (parseNumber _id > 0) then {
		_key = format["CHILD:304:%1:",_id];
		_key call server_hiveWrite;
		diag_log(format["DELETE: %1 Deleted by ID: %2",_activatingPlayer,_id]);
	} else  {
		_key = format["CHILD:310:%1:",_uid];
		_key call server_hiveWrite;
		diag_log(format["DELETE: %1 Deleted by UID: %2",_activatingPlayer,_uid]);
	};
};