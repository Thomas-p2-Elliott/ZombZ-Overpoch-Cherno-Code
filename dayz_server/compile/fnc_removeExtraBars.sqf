private ["_object","_keep1Bar","_contents","_itemCount","_goldBarCount","_addBackCount","_itemType","_d","_arr2_1","_arr2_2","_arr2"];

/*---------------------------------------------------------------------------
If gold exists in objects cargo space, make sure there is only 1
if gold does not exist, add 1 gold bar item.
---------------------------------------------------------------------------*/
_d = false;							//true = enable debug log outputs, false = disable
_itemType = "ItemGoldBar10oz";

if (_d) then { diag_log("P2DEBUG: fnc_removeExtraBars Input: " + str _this); };

_object = _this select 0;		//object to process
_keep1Bar = _this select 1;		//whether or not to keep 1 bar in the object after processing
_contents = [];
_itemCount = 0;
_addBackCount = 0;
_goldBarCount = 0;
_contents = getMagazineCargo _object;

/* Count amount of gold bars in objects inventory */
{
	if (((_contents select 0) select _itemCount) == _itemType) then {
		_goldBarCount = (_contents select 1) select _itemCount;
	};
	_itemCount = _itemCount + 1;
} count (_contents select 0);

if (_goldBarCount > 0) then {


	if (_d) then { diag_log("P2DEBUG: Object Has " + str _goldBarCount + " " + str _itemType + " items inside! Removing all of them then adding 1 back" + str _itemType); };
	_arr2_1 = [];
	_arr2_2 = [];
	_arr2 = [];
	_itemCount = 0;

	if (_d) then { diag_log("P2DEBUG: Before: " + str _contents); };

	/* Build a magazine style array without any gold bar items */

	{
		if (((_contents select 0) select _itemCount) != _itemType) then {
			_arr2_1 = _arr2_1 + [(_contents select 0) select _itemCount];
			_arr2_2 = _arr2_2 + [(_contents select 1) select _itemCount];
		};
		_itemCount = _itemCount + 1;
	} count (_contents select 0);
	_arr2 = [_arr2_1,_arr2_2];

	if (_d) then { diag_log("P2DEBUG: WithoutGold: " + str _arr2); };

	/* Remove all magazine items from the object */

	clearMagazineCargoGlobal _object;

	/* add back each non-gold item, (for each item do: for each item amount, add 1 magazine) */
	{
	 	for "_i" from 0 to ((((_arr2 select 1) select _addBackCount)) -1) do {
	 		_object addMagazineCargoGlobal [_x, 1];
	 	};

	 	_addBackCount = _addBackCount + 1;
	} count (_arr2 select 0); 


	/* Add single gold bar item to object */
	if (_keep1Bar) then { _object addMagazineCargoGlobal [_itemType, 1]; };

} else {
	if (_keep1Bar) then { if (_d) then { 
		diag_log("P2DEBUG: Object Has no " + str _itemType + " items, adding 1!"); };
		_object addMagazineCargoGlobal [_itemType, 1]; 
	};
};

_contents = getMagazineCargo _object;
if (_d) then { diag_log("P2DEBUG: Object processed, contents now = " + str _contents); };

true