private["_unit","_mags","_goldCount","_goldVar","_result2","_timer"];
_timer = diag_tickTime;
_goldVar = 0;
//get players gold early
_goldVar = (player getVariable ["ZombZGold", 0]);
_unit = player;
_goldCount = 0;
_result2 = "nochange";
_mags = magazines _unit;

_goldCount = {"ItemGoldBar10oz" == _x} count _mags;

if (!P2DZE_goldRunning) then {
	//If player has gold bar item
	if (_goldCount > 0) then {
		_result2 = "nochange";
		//if player did not have gold bar item prior
		if (!P2DZE_hasGold) then {
			P2DZE_hasGold = true;
			[] spawn player_pickupGold;
			_result2 = "HasGoldItem: Player did NOT have gold bar item prior, running player_pickupGold...";

		//if player did have gold bar item prior
		} else {

			//if player picked up another gold bar item
			if (_goldCount > 1) then {
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
			};
		};
	//if player does not have gold bar item
	} else {
		_result2 = "nochange";
		//if player had gold bar item prior
		if (P2DZE_hasGold) then {
			[] spawn player_dropGold;
			_result2 = "HasNoGold: Player DID have gold bar item prior, running player_dropGold...";

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
					_result2 = "nochange";
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