private ["_ctrlText","_len","_inout"];
disableSerialization;
waitUntil {ctrlShown ((findDisplay 106) displayCtrl 105)};
((findDisplay 106) displayCtrl 105) ctrlSetEventHandler ["LBSelChanged","private [""_dummy""]; _dummy = [_this,""onLBSelChanged""] execVM ""\z\addons\dayz_code\system\handleGear.sqf""; [] call ui_displayGold; _dummy;"];

_inout = {
	private["_in","_i","_arr","_out"];
		_in=_this select 0;
		_arr = toArray(_in);
		_out=[];
		for "_i" from 0 to (count _arr)-1 do {
			_out=_out+[toString([_arr select _i])];
		};
	_out
};

waitUntil {
	_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1101);
	_len=[_ctrlText] call {
		private["_in","_arr","_len"];
		_in=_this select 0;
		_arr=[_in] call _inout;
		_len=count (_arr);
		_len
	};
	_len > 3
};
waitUntil {
	_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1106);
	_len=[_ctrlText] call {
		private["_in","_arr","_len"];
		_in=_this select 0;
		_arr=[_in] call _inout;
		_len=count (_arr);
		_len
	};
	_len > 3
};
waitUntil {
	_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1104);
	_len=[_ctrlText] call {
		private["_in","_arr","_len"];
		_in=_this select 0;
		_arr=[_in] call _inout;
		_len=count (_arr);
		_len
	};
	_len > 3
};
[] call ui_displayGold;
uiSleep 0.1;
[] call ui_displayGold;
true