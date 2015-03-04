private ["_obj","_keep1","_inv","_iCnt","_gCnt","_g","_d","_isMan","_weps","_bps"];

/*---------------------------------------------------------------------------
If gold exists in objects cargo space, make sure there is only 1
if gold does not exist, add 1 gold bar item.
---------------------------------------------------------------------------*/
_d = P2DZE_goldItemHandlingDebug;	//true = enable debug log outputs, false = disable
_g = "ItemGoldBar10oz";

if (_d) then { diag_log("remExtraBars: fnc_removeExtraBars Input: " + str _this); };

_obj = 	_this select 0;		//object to process
_keep1 = _this select 1;		//whether or not to keep 1 bar in the object after processing
_inv = []; _weps = []; _bps = []; //inv array of obj
_iCnt = 0; //itemcount
_gCnt = 0; //goldbarcount
_isMan = _obj isKindOf "Man";

//Create 'Currently Processing List' if its nil
if (isNil 'P2DZ_BatchGold') then { P2DZ_BatchGold = []; };
//Exit if already processing
if (_obj in (P2DZ_BatchGold)) exitWith { if (_d) then { diag_log("remExtraBars: fnc_removeExtraBars Quit, Already Processing: " + str P2DZ_BatchGold); }; true };
//Add to 'Currently Processing List' so that objects don't get processed twice simultaneously IF object is not null or nil

if (!isNil '_obj') then  {
	if (!isNull _obj) then {
		P2DZ_BatchGold = P2DZ_BatchGold + [_obj];
	} else {
		if (_obj in P2DZ_BatchGold) then {
			P2DZ_BatchGold = P2DZ_BatchGold - [_obj];
		};
	};
};

if (_isMan) then {
	
	/* Count amount of gold bars in objects inventory */
	_inv = magazines _obj;
	_gCnt = {_g == _x} count _inv;

	if (_gCnt > 0) then {
		if (_gCnt > 1) then {
			_obj removeMagazine _g;
		};
	} else {
		if (_keep1) then {
			_obj addMagazine _g;
		};
	};

} else {
	/* Count amount of gold bars in objects inventory */
	_inv = getMagazineCargo _obj;

	{
		if (((_inv select 0) select _iCnt) == _g) then {
			_gCnt = (_inv select 1) select _iCnt;
		};
		_iCnt = _iCnt + 1;
	} count (_inv select 0);

	if (_gCnt > 0) then {

        if (_d) then { diag_log("remExtraBars: Object Has " + str _gCnt + " " + str _g + " items inside!"); };
		if (!isNull _obj && {(_obj isKindOf "WeaponHolder")}) then {
			_inv = getMagazineCargo _obj;
			if (((str (_inv select 0)) == str [_g]) || (str _inv == str [[],[]])) then {
				_weps = 	getWeaponCargo _obj;
				if (str _weps == str [[],[]]) then {
					_bps = 		getBackpackCargo _obj;
					if (str _bps == str [[],[]]) exitWith {
						if (_d) then { diag_log("remExtraBars: Object Empty: Deleted."); };
						deleteVehicle _obj;
					};
				};
			};
		};

		if (isNull _obj) exitWith { 	if (_d) then { diag_log("remExtraBars: Object Deleted/Null."); }; true };

		if (_obj isKindOf "WeaponHolder") then {
			
			//Invisible Weapon Holders / Ground Items

			if (_keep1) then { 
				[_obj, _g, (_gCnt - 1)] call p2_remMag_WepHolder;
				if (_d) then { diag_log(format['%1: %2: %3','remExtraBars','Keeping 1 bar, 	calling p2_remMag_WepHolder with:	',[_obj, _g, (_gCnt - 1)]]); };
			} else {
				[_obj, _g, 1 max (_gCnt)] call p2_remMag_WepHolder;
				if (_d) then { diag_log(format['%1: %2: %3','remExtraBars','Removing all bars, calling p2_remMag_WepHolder with:	',[_obj, _g, 1 max (_gCnt)]]); };
			};	

		} else {

			//Normal Objects / Vehicles / Safes

			if (_keep1) then { 
				[_obj, _g, (_gCnt - 1)] call p2_remMag;
				if (_d) then { diag_log(format['%1: %2: %3','remExtraBars','Keeping 1 bar, 	calling p2_remMag with:	',[_obj, _g, (_gCnt - 1)]]); };
			} else {
				[_obj, _g, 1 max (_gCnt)] call p2_remMag;
				if (_d) then { diag_log(format['%1: %2: %3','remExtraBars','Removing all bars, calling p2_remMag with:	',[_obj, _g, 1 max (_gCnt)]]); };
			};	
		};

	} else {
		if (_keep1) then { 
			if (_d) then { 	diag_log("remExtraBars: Object Has no " + str _g + " items, adding 1!"); };
			_obj addMagazineCargoGlobal [_g, 1];
			_obj addMagazine _g;
		};
	};

	_inv = getMagazineCargo _obj;
	if (_d) then { diag_log("remExtraBars: Object processed, contents now = " + str _inv); };
};


P2DZ_BatchGold = P2DZ_BatchGold - [_obj];

true