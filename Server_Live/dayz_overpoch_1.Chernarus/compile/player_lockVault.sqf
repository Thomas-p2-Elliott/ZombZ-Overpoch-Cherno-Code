/*
	DayZ Lock Safe
	Usage: [_obj] spawn player_unlockVault;
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/
private ["_r1","_r2","_r3","_combination","_combination2","_objectID","_objectUID","_obj","_ownerID","_objGold","_dir","_pos","_holder","_weapons","_magazines","_backpacks","_alreadyPacking","_lockedClass","_text","_playerNear","_characterID","_PlayerUID"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_10") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

player removeAction s_player_lockvault;
s_player_lockvault = 1;

_obj = _this;
_objType = typeOf _obj;

_lockedClass = getText (configFile >> "CfgVehicles" >> _objType >> "lockedClass");
_text = 	getText (configFile >> "CfgVehicles" >> _objType >> "displayName");

// Silently exit if object no longer exists
if(isNull _obj) exitWith { DZE_ActionInProgress = false; };
[1,1] call dayz_HungerThirst;
player playActionNow "Medic";
sleep 1;
[player,"tentpack",0,false] call dayz_zombieSpeak;
sleep 5;

_nearPlayers = _obj nearEntities ["Man", 9];
_playerNear = ({isPlayer _x} count _nearPlayers) > 1;
if(_playerNear) exitWith { DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_11") , "PLAIN DOWN"];  };

_characterID = _obj getVariable["CharacterID","0"];
_objectID 	= _obj getVariable["ObjectID","0"];
_objectUID	= _obj getVariable["ObjectUID","0"];
_ownerID =  _obj getVariable["ownerPUID", "0"];

if (DZE_APlotforLife) then {
	_PlayerUID = [player] call FNC_GetPlayerUID;
}else{
	_PlayerUID = dayz_characterID;
};

sleep 0.1;
_scrambledUid = nil; _scrambledUid = ""; _scrambled2CharId = nil; _scrambled2CharId = ""; _r2 = nil; _r3 = nil;
_scrambledUid = 	[_PlayerUID,1,true]		call KRON_Scramble;
//diag_log(format["P2Scramble:lockVault: Encrypting: UID Mode: 			%1, 				Output: %2",_PlayerUID,_scrambledUid]);

if (!isNil 'dayz_combination') then {
	if (dayz_combination != "") then {
		_r2 = [format["%1",dayz_combination]] call KRON_strLen;
		if (!isNil "_r2") then {
			_r3 = _r2 > 3;
			if (!isNil "_r3") then {
				if (_r3) then {
					_scrambled2CharId = [dayz_combination,1,false]	call KRON_Scramble;
					//diag_log(format["P2Scramble:lockVault: Encrypting: CID Mode: 			%1, 				Output: %2",dayz_combination,_scrambled2CharId]);
				};
			};
		};
	};
};


_objGold = 	[true,_obj] call p2_gv;
sleep 0.1;

if((_scrambled2CharId != _characterID) && (_scrambledUid != _ownerID)) exitWith {DZE_ActionInProgress = false; s_player_lockvault = -1; cutText [format[(localize "str_epoch_player_115"),_text], "PLAIN DOWN"]; };

_alreadyPacking = _obj getVariable["packing",0];
if (_alreadyPacking == 1) exitWith {DZE_ActionInProgress = false; s_player_lockvault = -1; cutText [format[(localize "str_epoch_player_116"),_text], "PLAIN DOWN"]};
_obj setVariable["packing",1];

_dir = direction _obj;
_pos = _obj getVariable["OEMPos",(getposATL _obj)];

if(!isNull _obj) then {

	//PVDZE_log_lockUnlock = [player, _obj,true];
	//publicVariableServer "PVDZE_log_lockUnlock";

	//place vault
	_holder = createVehicle [_lockedClass,_pos,[], 0, "CAN_COLLIDE"];
	PVDZE_log_lockUnlock = [player, _obj,true,_holder,_objGold];
	publicVariableServer "PVDZE_log_lockUnlock";
	diag_log(format["P2DEBUG: LockVault: %1", (str ([player, _obj,true,_holder,_objGold]))]);


	_holder setdir _dir;
	_holder setPosATL _pos;
	player reveal _holder;


	
	_holder setVariable["CharacterID",_characterID,true];
	_holder setVariable["ObjectID",_objectID,true];
	_holder setVariable["ObjectUID",_objectUID,true];
	_holder setVariable ["OEMPos", _pos, true];
	_holder setVariable ["ownerPUID", _ownerID , true];

	_weapons = 		getWeaponCargo _obj;
	_magazines = 	getMagazineCargo _obj;
	_backpacks = 	getBackpackCargo _obj;

	//sleep 1;

	// remove vault
	//deleteVehicle _obj;	//moved server side

	// Fill variables with loot
	_holder setVariable ["WeaponCargo", _weapons, true];
	_holder setVariable ["MagazineCargo", _magazines, true];
	_holder setVariable ["BackpackCargo", _backpacks, true];

	cutText [format[(localize "str_epoch_player_117"),_text], "PLAIN DOWN"];
};
s_player_lockvault = -1;
DZE_ActionInProgress = false;
