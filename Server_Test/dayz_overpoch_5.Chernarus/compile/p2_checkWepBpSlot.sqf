/*---------------------------------------------------------------------------
p2_checkWepBpSlot

Description:
Checks if a weapon with given classname uses the backpack slot of a unit

Input: Weapon classname (string)
Output: True if weapon takes backpack slot, 
false if weapon does not take backpack slot

Useage Instructions:

	Add this line in your init.sqf or wherever:

	p2_checkWepBpSlot = compile preprocessFileLineNumbers 'compile\p2_checkWepBpSlot.sqf'; 

	Then Call it like this for example:

	_gun = 'M4A1';
	_result = [_gun] call p2_checkWepBpslot;
	if (_result) then {
		diag_log('Warning: Gun ' + str(_gun) + ' takes backpack slot!');
	} else {
		diag_log('Gun does not take backpackslot!');
	};

Author: Player2 (www.ZombZ.net)
---------------------------------------------------------------------------*/


private ['_result','_weapon_classname','_weapon_config_typeValue'];
_result = false;
_weapon_classname = _this select 0;
if (!isNil '_weapon_classname') then {
	_weapon_config_typeValue = getNumber (configFile >> 'CfgWeapons' >> _weapon_classname >> 'type');
	if (!isNil '_weapon_config_typeValue') then {
		if (_weapon_config_typeValue == 5) then {
			_result = true;
		} else {
			_result = false;
		};
	};
};

_result