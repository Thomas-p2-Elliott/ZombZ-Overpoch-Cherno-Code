/*
[_object,_type] spawn server_updateObject;
*/
private ["_object_gold","_null","_object","_type","_objectID","_uid","_lastUpdate","_needUpdate","_object_position","_object_inventory","_object_damage","_isNotOk","_parachuteWest","_firstTime","_object_killed","_object_repair","_isbuildable"];

_object = 	_this select 0;

if(isNull(_object)) exitWith {
//	diag_log format["Skipping Null Object: %1", _object];
};

_type = 	_this select 1;
_parachuteWest = ((typeOf _object == "ParachuteWest") || (typeOf _object == "ParachuteC"));
_isbuildable = (typeOf _object) in dayz_allowedObjects;
_isNotOk = false;
_firstTime = false;

_objectID =	_object getVariable ["ObjectID","0"];
_uid = 		_object getVariable ["ObjectUID","0"];

if ((typeName _objectID != "string") || (typeName _uid != "string")) then
{ 
   // diag_log(format["Non-string Object: ID %1 UID %2", _objectID, _uid]);
    //force fail
    _objectID = "0";
    _uid = "0";
};
if (!_parachuteWest && !(locked _object)) then {
	if (_objectID == "0" && _uid == "0") then
	{
		_object_position = getPosATL _object;
    	_isNotOk = true;
	};
};

// do not update if buildable && not ok
if (_isNotOk && _isbuildable) exitWith {  };

// delete if still not ok
if (_isNotOk) exitWith { 
	deleteVehicle _object; 
	//diag_log(format["Deleting object %1 with invalid ID at pos [%2,%3,%4]",typeOf _object,_object_position select 0,_object_position select 1, _object_position select 2]); 
};


_lastUpdate = _object getVariable ["lastUpdate",time];
_needUpdate = _object in needUpdate_objects;

_object_position = {
private["_position","_worldspace","_fuel","_key","_colour","_colour2"];
	_position = getPosATL _object;
	if (_object isKindOf "AllVehicles") then {
		_colour = _object getVariable ["Colour","0"];
		_colour2 = _object getVariable ["Colour2","0"];
		_worldspace = [
			round(direction _object),
			_position,
			_colour,
			_colour2
		];
		_fuel = fuel _object;
	} else {
		_worldspace = [
			round(direction _object),
			_position
		];
		_fuel = 0;
	};
	_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];
	//diag_log ("HIVE: WRITE: "+ str(_key));
	_key call server_hiveWrite;
};

_object_inventory = {
	private["_inventory","_previous","_key"];
		_isNormal = true;
		if (typeOf (_object) == "Plastic_Pole_EP1_DZ") then{
		    _isNormal = false;
		    _inventory = _object getVariable ["plotfriends", []]; //We're replacing the inventory with UIDs for this item
		}; 
		if (typeOf (_object)in DZE_DoorsLocked) then{
		    _isNormal = false;
			_inventory = _object getVariable ["doorfriends", []]; //We're replacing the inventory with UIDs for this item
		};

		if(_isNormal)then {
		    _inventory = [
		    getWeaponCargo _object,
		    getMagazineCargo _object,
		    getBackpackCargo _object
		    ];
		};
		_previous = str(_object getVariable["lastInventory",[]]);
		if (str(_inventory) != _previous) then {
			_object setVariable["lastInventory",_inventory];
			if (_objectID == "0") then {
				_key = format["CHILD:309:%1:%2:",_uid,_inventory];
			} else {
				_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
			};
			//diag_log ("HIVE: WRITE: "+ str(_key));
			_key call server_hiveWrite;
		};
};

_object_damage = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage"];
		_hitpoints = _object call vehicle_getHitpoints;
		_damage = damage _object;
		if (_damage >= 1) exitWith { 
			_null = _object spawn {
				uiSleep 15;
				deleteVehicle _this; 
				true
			}; 
		};  
		_array = [];
		{
			_hit = [_object,_x] call object_getHit;
			_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
			if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
			_object setHit ["_selection", _hit];
		} count _hitpoints;
	
		_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
		//diag_log ("HIVE: WRITE: "+ str(_key));
		_key call server_hiveWrite;
	_object setVariable ["needUpdate",false,true];
};

_object_killed = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage","_log"];
	_hitpoints = _object call vehicle_getHitpoints;
	//_damage = damage _object;
	_damage = 1;
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		_hit = 1;
		_object setHit ["_selection", _hit];
	} count _hitpoints;
	
	if (_objectID == "0") then {
		_key = format["CHILD:306:%1:%2:%3:",_uid,_array,_damage];
	} else {
		_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
	};
	
	//diag_log ("HIVE: WRITE: "+ str(_key));
	_key call server_hiveWrite;
	_object setVariable ["needUpdate",false,true];
	if ((count _this) > 2) then {
		_killer = _this select 2;
		_charID = _object getVariable ['CharacterID','0'];
		_objID 	= _object getVariable['ObjectID','0'];
		_objUID	= _object getVariable['ObjectUID','0'];
		_worldSpace = getPosATL _object;
		if (getPlayerUID _killer != "") then {
			if (alive _killer) then { _name = name _killer; } else { _name = format["OBJECT %1", _killer]; };
			_log = format["Vehicle killed: Vehicle %1 (TYPE: %2), CharacterID: %3, ObjectID: %4, ObjectUID: %5, Position: %6, Killer: %7 (UID: %8)", _object, (typeOf _object), _charID, _objID, _objUID, _worldSpace, _name, (getPlayerUID _killer)];
			_log call stats_vehicleKills;

		} else {
			_log = format["Vehicle killed: Vehicle %1 (TYPE: %2), CharacterID: %3, ObjectID: %4, ObjectUID: %5, Position: %6", _object, (typeOf _object), _charID, _objID, _objUID, _worldSpace];
			_log call stats_vehicleKills; 
		};
	};
};

_object_repair = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage"];
	_hitpoints = _object call vehicle_getHitpoints;
	_damage = damage _object;
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		_object setHit ["_selection", _hit];
	} count _hitpoints;
	
	_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
	//diag_log ("HIVE: WRITE: "+ str(_key));
	_key call server_hiveWrite;
	_object setVariable ["needUpdate",false,true];
};



_object_gold = {
	private["_objGoldVar","_key","_d","_p2q","_p2a"];
	_d = P2D_H;

	_objGoldVar = _object getVariable ["ZombZGold", 0];
	if (isNil "_objGoldVar") then { _objGoldVar = 0; };
	if (!(typeName _objGoldVar == typeName 0)) then { _objGoldVar = 0; };
	_p2q = nil; _p2q = false;
	
	//if (_d) then { diag_log(format["HIVE:	P2H_LGSR@Start:	%1 ", (P2H_LGSR)]); };

	{
	 	 if (_x select 1 == _object) then {
			if ((_x select 2) == _objGoldVar && ((diag_tickTime - (_x select 0)) < 120)) then {
				_p2q = true;
				//if (_d) then { diag_log("HIVE: Data Ignored (Data Same as Recent(120s) send):_x: " + str _x); };
			};
		};
	} forEach P2H_LGSR;

	//will exit here if cache detects it as recent data
	if (_p2q) exitWith { _p2q = nil; }; _p2q = nil;

	//last gold save request array: [[diag_tickTime, Object, LastSavedObjectGold],...]
	_p2a = false;

	{
	 	 if (_x select 1 == _object) then {
			_p2a = true;
			P2H_LGSR set [_foreachindex, [diag_tickTime,_object,_objGoldVar]];
			//if (_d) then { diag_log(format["HIVE:	P2H_LGSR@UdateExisting:	%1 ", (P2H_LGSR)]); };
		};
		if (((diag_tickTime - (_x select 0)) > 120)) then {
			P2H_LGSR set [_foreachindex, -1];
			P2H_LGSR = P2H_LGSR - [-1];
			//if (_d) then { diag_log(format["HIVE:	P2H_LGSR@RemoveOld:	%1 ", (P2H_LGSR)]); };
		};
	} forEach P2H_LGSR;

	if (!_p2a) then {
		P2H_LGSR set [count P2H_LGSR, [diag_tickTime,_object,_objGoldVar]];
		//if (_d) then { diag_log(format["HIVE:	P2H_LGSR@AddNew:	%1 ", (P2H_LGSR)]); };
	};

	//if (_d) then { diag_log(format["HIVE:	P2H_LGSR@End:	%1 ", (P2H_LGSR)]); };

	//0 to be used in future for...something...ATMs? LocalBoxes?! What?!
	_objGoldVar = [_objGoldVar,0]; 

	if (_objectID == "0") then {
		_key = format["CHILD:323:%1:%2:",_uid,_objGoldVar];
		//diag_log("P2DEBUG: _object_gold by UID");
		if (_d) then { diag_log("HIVE:byUID: Data Sent:" + str _key); };
	} else {
		_key = format["CHILD:322:%1:%2:",_objectID,_objGoldVar];
		//diag_log("P2DEBUG: _object_gold by objectID");
		if (_d) then { diag_log("HIVE:byID: Data Sent:" + str _key); };
	};

	_key call server_hiveWrite;
};


// TODO ----------------------

_object setVariable ["lastUpdate",time,true];
switch (_type) do {
	case "all": {
		call _object_position;
		call _object_inventory;
		call _object_damage;
		call _object_gold;
	};
	case "position": {
		if (!(_object in needUpdate_objects)) then {
			//diag_log format["DEBUG Position: Added to NeedUpdate=%1",_object];
			needUpdate_objects set [count needUpdate_objects, _object];
			call _object_gold;
		};
	};
	case "gear": {
		call _object_inventory;
		call _object_gold;
	};
	case "damage": {
		if ( (time - _lastUpdate) > 5) then {
			call _object_damage;
		} else {
			if (!(_object in needUpdate_objects)) then {
				//diag_log format["DEBUG Damage: Added to NeedUpdate=%1",_object];
				needUpdate_objects set [count needUpdate_objects, _object];
			};
		};
	};
	case "killed": {
		call _object_killed;
	};
	case "repair": {
		call _object_damage;
	};
};
