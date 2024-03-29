/*
	DayZ Base Building Upgrades
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/
private ["_location","_dir","_classname","_text","_object","_objectID","_objectUID","_newclassname","_refund","_obj","_upgrade","_objectCharacterID","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_distance","_needText","_findNearestPoles","_findNearestPole","_IsNearPlot","_i","_invResult","_itemOut","_countOut","_abortInvAdd","_addedItems","_playerUID"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_48") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

player removeAction s_player_downgrade_build;
s_player_downgrade_build = 1;

_distance = 30;
_needText = localize "str_epoch_player_246";

if (DZE_APlotforLife) then {
	_playerUID = [player] call FNC_GetPlayerUID;
}else{
	_playerUID = dayz_characterID;
};

// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

_canBuildOnPlot = false;

if(_IsNearPlot == 0) then {
	_canBuildOnPlot = true;
} else {

	// check nearby plots ownership && then for friend status
	_nearestPole = _findNearestPole select 0;

	// Find owner
	_ownerID = _nearestPole getVariable["ownerPUID","0"];

	// diag_log format["DEBUG BUILDING: %1 = %2", dayz_characterID, _ownerID];

	// check if friendly to owner
	if(_playerUID == _ownerID) then {
		_canBuildOnPlot = true;
	} else {
		_friendlies = _nearestPole getVariable ["plotfriends",[]];
		_fuid  = [];
		{
		      _friendUID = _x select 0;
		      _fuid  =  _fuid  + [_friendUID];
		} forEach _friendlies;
		_builder  = getPlayerUID player;
		// check if friendly to owner
		if(_builder in _fuid) then {
		    _canBuildOnPlot = true;
		}; 
	};
};

// exit if not allowed due to plot pole
if(!_canBuildOnPlot) exitWith {  DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_141"),_needText,_distance] , "PLAIN DOWN"]; };

// get cursortarget from addaction
_obj = _this select 3;

// Current charID
_objectCharacterID 	= _obj getVariable ["CharacterID","0"];
_ownerID = _obj getVariable["ownerPUID","0"];

if(DZE_Lock_Door != _objectCharacterID) exitWith {  DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_49") , "PLAIN DOWN"]; };

// Find objectID
_objectID 	= _obj getVariable ["ObjectID","0"];

// Find objectUID
_objectUID	= _obj getVariable ["ObjectUID","0"];

if(_objectID == "0" && _objectUID == "0") exitWith {DZE_ActionInProgress = false; s_player_upgrade_build = -1; cutText [(localize "str_epoch_player_50"), "PLAIN DOWN"];};

// Get classname
_classname = typeOf _obj;

// Find display name
_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");

// Find next upgrade
_upgrade = getArray (configFile >> "CfgVehicles" >> _classname >> "downgradeBuilding");

if ((count _upgrade) > 0) then {

	_newclassname = _upgrade select 0;

	_refund = _upgrade select 1;
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	[player,20,true,(getPosATL player)] spawn player_alertZombies;

	_invResult = false;
	_abortInvAdd = false;
	_i = 0;
	_addedItems = [];

	{
		_itemOut = _x select 0;
		_countOut = _x select 1;

		for "_x" from 1 to _countOut do {
			_invResult = [player,_itemOut] call BIS_fnc_invAdd;
			if(!_invResult) exitWith {
				_abortInvAdd = true;
			};
			if(_invResult) then {
				_i = _i + 1;
				_addedItems set [(count _addedItems),[_itemOut,1]];
			};
		};

		if (_abortInvAdd) exitWith {};

	} count _refund;

	// all parts added proceed
	if(_i != 0) then {

		// Get position
		_location	= _obj getVariable["OEMPos",(getposATL _obj)];

		// Get direction
		_dir = getDir _obj;

		// Reset the character ID on locked doors before they inherit the newclassname
		if (_classname in DZE_DoorsLocked) then {
			_obj setVariable ["CharacterID",dayz_characterID,true];
			_objectCharacterID = dayz_characterID;
		};

		_classname = _newclassname;

		// Create new object
		_object = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];

		// Set direction
		_object setDir _dir;

		// Set location
		_object setPosATL _location;

		// Set Owner.
		_object setVariable ["ownerPUID",_ownerID,true];

		//diag_log format["Player_buildingdowngrade: [newclassname: %1] [_ownerID: %2] [_objectCharacterID: %2]",_newclassname, _ownerID, _objectCharacterID];

		cutText [format[(localize "str_epoch_player_142"),_text], "PLAIN DOWN", 5];

		_playerUID = [player] call FNC_GetPlayerUID;
		PVDZE_obj_Swap = [_objectCharacterID,_object,[_dir,_location,_playerUID],_classname,_obj,player,p2pn + (random 10)];
		publicVariableServer "PVDZE_obj_Swap";

		player reveal _object;

	} else {
		cutText [format[(localize "str_epoch_player_143"), _i,(getText(configFile >> "CfgMagazines" >> _itemOut >> "displayName"))], "PLAIN DOWN"];
		{
			[player,(_x select 0),(_x select 1)] call BIS_fnc_invRemove;
		} count _addedItems;

	};

} else {
	cutText [(localize "str_epoch_player_51"), "PLAIN DOWN"];
};

DZE_ActionInProgress = false;
s_player_downgrade_build = -1;
