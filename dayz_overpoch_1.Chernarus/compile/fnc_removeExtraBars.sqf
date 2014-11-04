private["_timeSinceLast","_d"];

_d = true;						//enable debug output?

_timeSinceLast = diag_tickTime - P2DZE_removeExtra_lastRunTime;
P2DZE_removeExtra_lastRunTime = diag_tickTime;

if (_d) then { 
	diag_log("P2DEBUG: fnc_removeExtraBars: " + str __FILE__); 
	diag_log("P2DEBUG: fnc_removeExtraBars: _timeSinceLast: " + str _timeSinceLast); 
};

if (_timeSinceLast < 3) exitWith {
	if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: Exiting..."); };
};

if (_timeSinceLast > 2) exitWith {
	private ["_object","_zGold","_keep1Bar","_contents","_itemType","_goldBarCount"];

	_zGold = nil;
	_keep1Bar = false;
	_contents = [];
	_itemType = "ItemGoldBar10oz";
	_goldBarCount = 0;
	_object = player;
	_zGold = _this select 0;

	if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: " + str __FILE__); };
	if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: Input: " + str _this); };

	if (isNil "_zGold") exitWith {
		_zGold = [true,player] call p2_gv;
		
		if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: Past WaitUntil, Gold: " + str _zGold + " Line: " + str __LINE__); };

		[_zGold] spawn fnc_removeExtraBars;
	};

	if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: Past if isNil, Gold: " + str _zGold + " Line: " + str __LINE__); };

	if (_zGold > 0) then {
		_keep1Bar = true;
		P2DZE_hasGold = true;
	} else {
		P2DZE_hasGold = false;
	};

	_contents = magazines _object;
	if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: contents: " + str(_contents)); };

	_goldBarCount = {_itemType == _x} count (magazines _object);
	if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: Player Has " + str _goldBarCount + " " + str _itemType + " items! Keep one on them? " + str(_keep1Bar)); };
	if (_keep1Bar) then {

		if (_goldBarCount > 1) then {
			for "_i" from 1 to (_goldBarCount - 1) do {
				if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: _keep1Bar: Removed 1 gold bar."); };
				_object removeMagazine _itemType;
			};
			//new
			call player2_putGoldItemsAtTop;
		} else {
			if (_goldBarCount < 1) then {
				if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: _keep1Bar: Added 1 gold bar."); };
				_object addMagazine _itemType;
			};
			//new
			call player2_putGoldItemsAtTop;
		};

	} else {
		for "_i" from 1 to _goldBarCount do {
			if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: !_keep1Bar: Removed 1 gold bar."); };
			_object removeMagazine _itemType;
		};
	};

	if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars: post-process contents: " + str(_contents)); };
};