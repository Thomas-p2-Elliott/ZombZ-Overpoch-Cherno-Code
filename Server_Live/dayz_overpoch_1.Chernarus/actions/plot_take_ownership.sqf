// Plot Take Ownership by RimBlock (http://epochmod.com/forum/index.php?/user/12612-rimblock/)
//
// This script allows Plot pole owners to take ownership of all allowed buildables on their plot except lockable storage and tents.
//
// Note:
// This code calls server_publishFullObject which also saves damage, inventory and fuel.  Hitpoints are assumed to be empty as this is for buildables only.

private ["_distance","_plotpole","_playerUID","_isowner", "_findNearestObjects","_classname","_objectID", "_objectUID", "_position", "_worldspace", "_object", "_key","_invW","_invM","_invB","_itemsExist","_charID","_inventory"];
_distance = (DZE_PlotPole select 0);
_plotpole = nearestobject [(vehicle player),"Plastic_Pole_EP1_DZ"];

_playerUID = [player] call FNC_GetPlayerUID;

// Check is owner of the plot pole.
_isowner = [player, _plotpole] call FNC_check_owner;
_itemsExist = false;

//declare or reset dis shit nigguhhh
p2plotItemsTaken = [];
p2plotItemsOwned = [];

if ((_isowner select 0 )) then {
	_findNearestObjects = nearestObjects [_plotpole, [], _distance];
	{
		_object = _x;
		_classname = typeOf _object;
		if (_classname in DZE_plotTakeOwnershipItems)then {
		
			_isowner = [player, _object] call FNC_check_owner;
			diag_log text "Plot Take Ownership: Object in DZE_plotTakeOwnershipItems";
		
			if !( _isowner select 0 ) then{
				diag_log text "Plot Take Ownership: Is not already the owner";
				
				_objectID 	= _object getVariable ["ObjectID","0"];
				_objectUID	= _object getVariable ["ObjectUID","0"];
				
				PVDZE_obj_Delete = [_objectID, _objectUID, player, p2dn + (random 10)];
				publicVariableServer "PVDZE_obj_Delete";
				
				if (_classname in DZE_DoorsLocked) then {
					_charID =		_object getVariable ["characterID",dayz_characterID];				
				}else{
					_charID =		dayz_characterID;
				};
				
				_position = 	getPosATL _object;
				_worldspace = 	[round(direction _object),_position,_playerUID];

				_invW = getWeaponCargo _object;
				{
					if ((count _x) != 0) then {_itemsExist = true;};
				}foreach _invW;
				
				_invM = getMagazineCargo _object;
				if !(_itemsExist) then{
					{
						if ((count _x) != 0) then {_itemsExist = true;};
					}foreach _invM;
				};
				
				_invB = getBackpackCargo _object;
				if !(_itemsExist) then{
					{
						if ((count _x) != 0) then {_itemsExist = true;};
					}foreach _invB;
				};
				
				if (_itemsExist) then{
					_inventory = format["[%1,%2,%3]", _invW, _invM, _invB];				
				}else{
					_inventory = "[]";
				};
				
				_hitpoints =	'[]';
				_damage =		damage _object;
				_fuel =			fuel _object;
				
				PVDZE_fullobj_Publish = [_charID,_object,_worldspace,_classname, _inventory, _hitpoints, _damage, _fuel, (p2pn + (random 10))];
				publicVariableServer "PVDZE_fullobj_Publish";

				//add type of object to dis shit so we can tell dem what dey done did liek
				p2plotItemsTaken = p2plotItemsTaken + [(typeOf _object)];
				
				if !(DZE_APlotforLife) then {
					_object setvariable["ownerPUID", dayz_characterID];
				}else{
					_object setvariable["ownerPUID", _playerUID];	
				};	
			} else {
				//add item type for display later n dat
				p2plotItemsOwned = p2plotItemsOwned + [(typeOf _object)];
			};
		};
	} count _findNearestObjects;
} else {
	cutText [format["You must be added to the plot pole before you can take ownership."], "PLAIN DOWN"];
};

if (!isNil "p2plotItemsTaken" && {(count p2plotItemsTaken > 0)}) then {
	cutText [(format["You have taken ownership of: %1",p2plotItemsTaken]), "PLAIN DOWN"];
} else {
	cutText [format["You have taken ownership of nothing."], "PLAIN DOWN"];
};

if (!isNil "p2plotItemsOwned" && {(count p2plotItemsOwned > 0)}) then {
	systemChat(format["ZombZ: Items you already owned in this plot: %1", p2plotItemsOwned]);
} else {
	systemChat("ZombZ: You own nothing in this plot.");	
};