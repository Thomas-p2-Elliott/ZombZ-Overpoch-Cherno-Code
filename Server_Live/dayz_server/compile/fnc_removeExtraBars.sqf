private ["_object","_keep1Bar","_contents","_itemCount","_goldBarCount","_itemType","_d","_isMan","_weps","_items","_bps"];

/*---------------------------------------------------------------------------
If gold exists in objects cargo space, make sure there is only 1
if gold does not exist, add 1 gold bar item.
---------------------------------------------------------------------------*/
_d = P2DZE_goldItemHandlingDebug;	//true = enable debug log outputs, false = disable
_itemType = "ItemGoldBar10oz";

if (_d) then { diag_log("remExtraBars: fnc_removeExtraBars Input: " + str _this); };

_object = 	_this select 0;		//object to process
_keep1Bar = _this select 1;		//whether or not to keep 1 bar in the object after processing
_contents = []; _weps = []; _items = []; _bps = [];
_itemCount = 0;
_goldBarCount = 0;
_isMan = _object isKindOf "Man";

//Create 'Currently Processing List' if its nil
if (isNil 'P2DZ_BatchGold') then { P2DZ_BatchGold = []; };
//Exit if already processing
if (_object in (P2DZ_BatchGold)) exitWith { if (_d) then { diag_log("remExtraBars: fnc_removeExtraBars Quit, Already Processing: " + str P2DZ_BatchGold); }; true };
//Add to 'Currently Processing List' so that objects don't get processed twice simultaneously
P2DZ_BatchGold = P2DZ_BatchGold + [_object];

if (_isMan) then {
	
	/* Count amount of gold bars in objects inventory */
	_contents = magazines _object;
	_goldBarCount = {"ItemGoldBar10oz" == _x} count _contents;

	if (_goldBarCount > 0) then {
		if (_goldBarCount > 1) then {
			_object removeMagazine _itemType;
		};
	} else {
		if (_keep1Bar) then {
			_object addMagazine _itemType;
		};
	};

} else {
	/* Count amount of gold bars in objects inventory */
	_contents = getMagazineCargo _object;

	{
		if (((_contents select 0) select _itemCount) == _itemType) then {
			_goldBarCount = (_contents select 1) select _itemCount;
		};
		_itemCount = _itemCount + 1;
	} count (_contents select 0);

	if (_goldBarCount > 0) then {

        if (_d) then { diag_log("remExtraBars: Object Has " + str _goldBarCount + " " + str _itemType + " items inside!"); };
		if (!isNull _object && {(_object isKindOf "WeaponHolder")}) then {
			_contents = getMagazineCargo _object;
			if (((str (_contents select 0)) == str ["ItemGoldBar10oz"]) || (str _contents == str [[],[]])) then {
				_weps = 	getWeaponCargo _object;
				if (str _weps == str [[],[]]) then {
					_bps = 		getBackpackCargo _object;
					if (str _bps == str [[],[]]) exitWith {
						if (_d) then { diag_log("remExtraBars: Object Empty: Deleted."); };
						deleteVehicle _object;
					};
				};
			};
		};

		if (isNull _object) exitWith { 	if (_d) then { diag_log("remExtraBars: Object Deleted/Null."); }; true };
		if (_keep1Bar) then { 
			[_object, _itemType, (_goldBarCount - 1)] call p2_removeMagCargoGlobal;
		} else {
			[_object, _itemType, 1 max (_goldBarCount)] call p2_removeMagCargoGlobal;
		};	

	} else {
		if (_keep1Bar) then { 
			if (_d) then { 	diag_log("remExtraBars: Object Has no " + str _itemType + " items, adding 1!"); };
			_object addMagazineCargoGlobal [_itemType, 1];
			_object addMagazine _itemType;
		};
	};

	_contents = getMagazineCargo _object;
	if (_d) then { diag_log("remExtraBars: Object processed, contents now = " + str _contents); };
};


P2DZ_BatchGold = P2DZ_BatchGold - [_object];

true