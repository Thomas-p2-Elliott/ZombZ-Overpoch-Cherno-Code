private ["_cTarget","_isOk","_display","_inVehicle","_dummy2"];
disableSerialization;

_dummy2 = {
	private["_tickStart"];
	_tickStart = diag_tickTime;
	disableSerialization;
	diag_log(format["P2DEBUG: Waiting for Gear listbox to be shown time: %1",diag_tickTime - _tickStart]);

	waitUntil {ctrlShown ((findDisplay 106) displayCtrl 105)};

	diag_log(format["P2DEBUG: Gear Menu listbox open: Adding Handler! time: %1",diag_tickTime - _tickStart]);

	((findDisplay 106) displayCtrl 105) ctrlSetEventHandler ["LBSelChanged","private [""_dummy""]; _dummy = [_this,""onLBSelChanged""] execVM ""system\handleGear.sqf""; [] call ui_displayGold; _dummy;"];
	
	diag_log(format["P2DEBUG: Waiting for itemname to be shown time: %1",diag_tickTime - _tickStart]);

	waitUntil {
		_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1101);
		_len=[_ctrlText] call {
			private["_in","_arr","_len"];
			_in=_this select 0;
			_arr=[_in] call {
				private["_in","_i","_arr","_out"];
				call compile toString [95, 105, 110, 61, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 48, 59, 10, 9, 9, 9, 9, 95, 97, 114, 114, 32, 61, 32, 116, 111, 65, 114, 114, 97, 121, 40, 95, 105, 110, 41, 59, 10, 9, 9, 9, 9, 95, 111, 117, 116, 61, 91, 93, 59, 10, 9, 9, 9, 9, 102, 111, 114, 32, 34, 95, 105, 34, 32, 102, 114, 111, 109, 32, 48, 32, 116, 111, 32, 40, 99, 111, 117, 110, 116, 32, 95, 97, 114, 114, 41, 45, 49, 32, 100, 111, 32, 123, 10, 9, 9, 9, 9, 9, 95, 111, 117, 116, 61, 95, 111, 117, 116, 43, 91, 116, 111, 83, 116, 114, 105, 110, 103, 40, 91, 95, 97, 114, 114, 32, 115, 101, 108, 101, 99, 116, 32, 95, 105, 93, 41, 93, 59, 10, 9, 9, 9, 9, 125, 59];
				_out
			};
			_len=count (_arr);
			_len
		};
		_len > 3
	};
	
	diag_log(format["P2DEBUG: 1101 shown! ",diag_tickTime - _tickStart]);


	waitUntil {
		_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1106);
		_len=[_ctrlText] call {
			private["_in","_arr","_len"];
			_in=_this select 0;
			_arr=[_in] call {
				private["_in","_i","_arr","_out"];
				call compile toString [95, 105, 110, 61, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 48, 59, 10, 9, 9, 9, 9, 95, 97, 114, 114, 32, 61, 32, 116, 111, 65, 114, 114, 97, 121, 40, 95, 105, 110, 41, 59, 10, 9, 9, 9, 9, 95, 111, 117, 116, 61, 91, 93, 59, 10, 9, 9, 9, 9, 102, 111, 114, 32, 34, 95, 105, 34, 32, 102, 114, 111, 109, 32, 48, 32, 116, 111, 32, 40, 99, 111, 117, 110, 116, 32, 95, 97, 114, 114, 41, 45, 49, 32, 100, 111, 32, 123, 10, 9, 9, 9, 9, 9, 95, 111, 117, 116, 61, 95, 111, 117, 116, 43, 91, 116, 111, 83, 116, 114, 105, 110, 103, 40, 91, 95, 97, 114, 114, 32, 115, 101, 108, 101, 99, 116, 32, 95, 105, 93, 41, 93, 59, 10, 9, 9, 9, 9, 125, 59];
				_out
			};
			_len=count (_arr);
			_len
		};
		_len > 3
	};

	diag_log(format["P2DEBUG: itemname shown! 1106 time: %1",diag_tickTime - _tickStart]);

	waitUntil {
		_ctrlText = ctrlText ((findDisplay 106) displayCtrl 1104);
		_len=[_ctrlText] call {
			private["_in","_arr","_len"];
			_in=_this select 0;
			_arr=[_in] call {
				private["_in","_i","_arr","_out"];
				call compile toString [95, 105, 110, 61, 95, 116, 104, 105, 115, 32, 115, 101, 108, 101, 99, 116, 32, 48, 59, 10, 9, 9, 9, 9, 95, 97, 114, 114, 32, 61, 32, 116, 111, 65, 114, 114, 97, 121, 40, 95, 105, 110, 41, 59, 10, 9, 9, 9, 9, 95, 111, 117, 116, 61, 91, 93, 59, 10, 9, 9, 9, 9, 102, 111, 114, 32, 34, 95, 105, 34, 32, 102, 114, 111, 109, 32, 48, 32, 116, 111, 32, 40, 99, 111, 117, 110, 116, 32, 95, 97, 114, 114, 41, 45, 49, 32, 100, 111, 32, 123, 10, 9, 9, 9, 9, 9, 95, 111, 117, 116, 61, 95, 111, 117, 116, 43, 91, 116, 111, 83, 116, 114, 105, 110, 103, 40, 91, 95, 97, 114, 114, 32, 115, 101, 108, 101, 99, 116, 32, 95, 105, 93, 41, 93, 59, 10, 9, 9, 9, 9, 125, 59];
				_out
			};
			_len=count (_arr);
			_len
		};
		_len > 3
	};

	diag_log(format["P2DEBUG: itemname shown! 1104 Calling ui_displayGold time: %1",diag_tickTime - _tickStart]);

	[] call ui_displayGold;

	diag_log(format["P2DEBUG: Done! time: %1",diag_tickTime - _tickStart]);
};

[] spawn _dummy2;

_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} count ["LandVehicle","Air", "Ship"];

if((locked _cTarget) && _isOk && (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};

_dummy2