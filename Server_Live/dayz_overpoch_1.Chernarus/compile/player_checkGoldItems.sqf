private ["_timer","_goldVar","_unit","_goldCount","_result2","_mags","_backpack","_bcontents","_bitemCount","_bgoldBarCount"];
_timer = diag_tickTime;
_goldVar = 0;
//get players gold early
_goldVar = [false,player] call p2_gv;
_unit = player;
_goldCount = 0;
_result2 = "nochange0";
_mags = magazines _unit;
_goldCount = {"ItemGoldBar10oz" == _x} count _mags;

//count backpack gold
_bcontents = [];
_bitemCount = 0;
_bgoldBarCount = 0;
_backpack = unitBackpack player;
_bcontents = getMagazineCargo _backpack;
{
	if (((_bcontents select 0) select _bitemCount) == "ItemGoldBar10oz") then {
		_bgoldBarCount = (_bcontents select 1) select _bitemCount;
	};
	_bitemCount = _bitemCount + 1;
} count (_bcontents select 0);



if (!P2DZE_goldRunning) then {
	//If player has gold bar item
	if (_goldCount > 0 || _bgoldBarCount > 0) then {
		_result2 = "nochange";
		//if player did not have gold bar item prior
		if (!P2DZE_hasGold) then {
			P2DZE_hasGold = true;
			[] spawn player_pickupGold;
			_result2 = "HasGoldItem: Player did NOT have gold bar item prior, running player_pickupGold...";

		//if player did have gold bar item prior
		} else {

			//if player picked up another gold bar item
			if ((_goldCount + _bgoldBarCount) > 1) then {
				for "_x" from 1 to _goldCount do {
					_mags = magazines _unit;
					_goldCount = {"ItemGoldBar10oz" == _x} count _mags;
					_result2 = "HasGoldItem: player had 2 gold bar items, running player_pickupGold...";
					diag_log(_goldCount);
					if (_goldCount != 1) then {
						_unit removeMagazine "ItemGoldBar10oz";
						_result2 = "HasGoldItem: player had 2 or more gold bar items, running player_pickupGold & removing extra gold...";
						waitUntil{!P2DZE_goldRunning};
						P2DZE_goldRunning = true;
						[] spawn player_pickupGold;
					};
				};
				if (_bgoldBarCount > 0) then {
					P2DZE_plr_bpGold = _backpack; publicVariableServer "P2DZE_plr_bpGold";
					titleText ["Do not move your gold into your backpack!", "PLAIN", 0.5]; 
					if (P2DZ_enableGoldSystemChat) then {
						systemChat("Gold: Do not move your gold into your backpack!");
					};
					closeDialog 0;
					_result2 = "HasGoldItem: Player picked gold into backpack!";
				};
			};
		};
	//if player does not have gold bar item
	} else {
		_result2 = "nochange";
		//if player had gold bar item prior
		if (P2DZE_hasGold) then {
			_bcontents = [];
			_bitemCount = 0;
			_bgoldBarCount = 0;
			_backpack = unitBackpack player;
			_bcontents = getMagazineCargo _backpack;
			{
				if (((_bcontents select 0) select _bitemCount) == "ItemGoldBar10oz") then {
					_bgoldBarCount = (_bcontents select 1) select _bitemCount;
				};
				_bitemCount = _bitemCount + 1;
			} count (_bcontents select 0);
			//if player has gold in backpack
			if (_bgoldBarCount > 0) then {
				_unit addMagazine "ItemGoldBar10oz";
				P2DZE_plr_bpGold = _backpack; publicVariableServer "P2DZE_plr_bpGold";
				titleText ["Do not move your gold into your backpack!", "PLAIN", 0.5]; 
				if (P2DZ_enableGoldSystemChat) then {
					systemChat("Gold: Do not move your gold into your backpack!");
				};
				closeDialog 0;
				_result2 = "HasGoldItem: Player moved gold into backpack!";
			} else {
				[] spawn player_dropGold;
				_result2 = "HasNoGold: Player DID have gold bar item prior, running player_dropGold...";
			};

		//if player did not have gold bar item prior
		} else {
			if (!isNil '_goldVar') then {
				//if player should have gold bar item
				if ((_goldVar > 0) && (_goldCount < 1)) then {
					_unit addMagazine "ItemGoldBar10oz";
					P2DZE_hasGold = true;
					_result2 = "HasNoGold: player should have gold bar, giving item...";
				//if player has no gold
				} else {
					P2DZE_hasGold = false;
					if (_goldCount > 0) then {
						_result2 = "HasNoGold: Player shouldnt have gold bar, removing item...";
						_unit removeMagazine "ItemGoldBar10oz";
					} else {
						_result2 = "nochange";
					};
				};
			} else {
				_result2 = "Failed: goldVar is equal to nil!";
			};
		};
	};

	if (P2DZE_goldItemHandlingDebug) then {
		if !(_result2 == "nochange") then {
			diag_log("	  " + str _result2);
		};
	};
};
_timer = diag_tickTime - _timer;
[_timer,2]