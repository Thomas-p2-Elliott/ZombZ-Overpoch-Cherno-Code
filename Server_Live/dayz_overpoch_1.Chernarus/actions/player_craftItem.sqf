private ["_tradeComplete","_onLadder","_canDo","_selectedRecipeOutput","_proceed","_itemIn","_countIn","_missing","_missingQty","_qty","_itemOut","_countOut","_started","_finished","_animState","_isMedic","_removed","_tobe_removed_total","_textCreate","_textMissing","_selectedRecipeInput","_selectedRecipeInputStrict","_num_removed","_removed_total","_temp_removed_array","_abort","_waterLevel","_waterLevel_lowest","_reason","_isNear","_missingTools","_hastoolweapon","_selectedRecipeTools","_distance","_crafting","_needNear","_item","_baseClass","_num_removed_weapons","_outputWeapons","_inputWeapons","_randomOutput","_craft_doLoop","_selectedWeapon","_selectedMag","_sfx"];
if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_63") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;
_crafting = _this select 0;
_baseClass = _this select 1;
_item =  _this select 2;
_abort = false;
_distance = 12;
_reason = "";
_waterLevel = 0;
_outputWeapons = [];
_selectedRecipeOutput = [];
_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf && !r_player_unconscious && !_onLadder);
_needNear = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "neednearby");
if("fire" in _needNear) then {
	_isNear = 0;
	if (surfaceIsWater [(position player select 0), (position player select 1), 0]) then {
		_isNear = {inflamed _x} count (getPosASL player nearObjects _distance);
	} else {
		_isNear = {inflamed _x} count (getPosATL player nearObjects _distance);
	};
	if(_isNear == 0) then {
		_abort = true;
		_reason = "fire";
	};
};
if("workshop" in _needNear) then {
	_isNear = count (nearestObjects [player, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);
	if(_isNear == 0) then {
		_abort = true;
		_reason = "workshop";
	};
};

if(_abort) exitWith {
	cutText [format[(localize "str_epoch_player_149"),_reason,_distance], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};
if (_canDo) then {
	_selectedRecipeTools = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "requiretools");
	_selectedRecipeOutput = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "output");
	_selectedRecipeInput = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "input");
	_selectedRecipeInputStrict = if ((isNumber (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputstrict")) && (getNumber (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputstrict") > 0)) then {true} else {false};
	_outputWeapons = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "outputweapons");
	_inputWeapons = getArray (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "inputweapons");
	if (_item == "ItemPlotDeed") then {		_selectedRecipeInput = [["ItemPlotDeed",1],["PartGeneric",2]];	};

	_sfx = getText(configFile >> _baseClass >> _item >> "sfx");
	if(_sfx == "") then {
		_sfx = "repair";
	};
	_randomOutput = 0;
	if(isNumber (configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "randomOutput")) then {
		_randomOutput = getNumber(configFile >> _baseClass >> _item >> "ItemActions" >> _crafting >> "randomOutput");
	};
	_craft_doLoop = true;
	_tradeComplete = 0;
	while {_craft_doLoop} do {
		_temp_removed_array = [];
		_missing = "";
		_missingTools = false;
		{
			_hastoolweapon = _x in weapons player;
			if(!_hastoolweapon) exitWith { _craft_doLoop = false; _missingTools = true; _missing = _x; };
		} forEach _selectedRecipeTools;
		if(!_missingTools) then {
			_proceed = true;
			if (count _selectedRecipeInput > 0) then {
				{
					_itemIn = _x select 0;
					_countIn = _x select 1;
					_qty = { (_x == _itemIn) || (!_selectedRecipeInputStrict && configName(inheritsFrom(configFile >> "cfgMagazines" >> _x)) == _itemIn) } count magazines player;
					if(_qty < _countIn) exitWith { _missing = _itemIn; _missingQty = (_countIn - _qty); _proceed = false; };
				} forEach _selectedRecipeInput;
			};
			if (_proceed) then {
				cutText [(localize "str_epoch_player_62"), "PLAIN DOWN"];
				[1,1] call dayz_HungerThirst;
				player playActionNow "Medic";
				[player,_sfx,0,false] call dayz_zombieSpeak;
				[player,50,true,(getPosATL player)] spawn player_alertZombies;
				r_interrupt = false;
				_animState = animationState player;
				r_doLoop = true;
				_started = false;
				_finished = false;
				while {r_doLoop} do {
					_animState = animationState player;
					_isMedic = ["medic",_animState] call fnc_inString;
					if (_isMedic) then {
						_started = true;
					};
					if (_started && !_isMedic) then {
						r_doLoop = false;
						_finished = true;
					};
					if (r_interrupt) then {
						r_doLoop = false;
					};
					sleep 0.1;
				};
				r_doLoop = false;
				if (_finished) then {
					_removed_total = 0; 
					_tobe_removed_total = 0; 
					_waterLevel_lowest = 0; 
					{
						_removed = 0;
						_itemIn = _x select 0;
						_countIn = _x select 1;
						_tobe_removed_total = _tobe_removed_total + _countIn;
						{
							_configParent = configName(inheritsFrom(configFile >> "cfgMagazines" >> _x));
							if ((_x == _itemIn) || (!_selectedRecipeInputStrict && _configParent == _itemIn)) then {
								if ((_x == "ItemWaterbottle") ||( _configParent == "ItemWaterbottle")) then {
									_waterLevel = floor((getNumber(configFile >> "CfgMagazines" >> _x >> "wateroz")) - 1);
									if (_waterLevel_lowest == 0 || _waterLevel < _waterLevel_lowest) then {
										_waterLevel_lowest = _waterLevel;
									};
								};
							};
						} forEach magazines player;
						{
							_configParent = configName(inheritsFrom(configFile >> "cfgMagazines" >> _x));
							if( (_removed < _countIn) && ((_x == _itemIn) || (!_selectedRecipeInputStrict && _configParent == _itemIn))) then {
								if ((_waterLevel_lowest == 0) || ((_waterLevel_lowest > 0) && (getNumber(configFile >> "CfgMagazines" >> _x >> "wateroz") == _waterLevel_lowest))) then {
									_num_removed = ([player,_x] call BIS_fnc_invRemove);
								}
								else {
									_num_removed = 0;
								};
								_removed = _removed + _num_removed;
								_removed_total = _removed_total + _num_removed;
								if(_num_removed >= 1) then {
									if (_x == "ItemWaterbottle" || _configParent == "ItemWaterbottle") then {
										_waterLevel = floor((getNumber(configFile >> "CfgMagazines" >> _x >> "wateroz")) - 1);
									};
									_temp_removed_array set [count _temp_removed_array,_x];
								};
							};
						} forEach magazines player;
					} forEach _selectedRecipeInput;
					if(_removed_total == _tobe_removed_total) then {
						_num_removed_weapons = 0;
						{
							_num_removed_weapons = _num_removed_weapons + ([player,_x] call BIS_fnc_invRemove);
						} forEach _inputWeapons;
						if (_num_removed_weapons == (count _inputWeapons)) then {
							if(_randomOutput == 1) then {
								if (!isNil "_outputWeapons" && count _outputWeapons > 0) then {
									_selectedWeapon = _outputWeapons call BIS_fnc_selectRandom;
									_outputWeapons = [_selectedWeapon];
								};
								if (!isNil "_selectedRecipeOutput" && count _selectedRecipeOutput > 0) then {
									_selectedMag = _selectedRecipeOutput call BIS_fnc_selectRandom;
									_selectedRecipeOutput = [_selectedMag];
								};
								_craft_doLoop = false;
							};
							{
								player addWeapon _x;
							} forEach _outputWeapons;
							{
								_itemOut = _x select 0;
								_countOut = _x select 1;
								if (_itemOut == "ItemWaterbottleUnfilled") then {
									if (_waterLevel > 0) then {
										_itemOut = format["ItemWaterbottle%1oz",_waterLevel];
									};
								};
								for "_x" from 1 to _countOut do {
									player addMagazine _itemOut;
								};
								_textCreate = getText(configFile >> "CfgMagazines" >> _itemOut >> "displayName");
								cutText [format[(localize "str_epoch_player_150"),_textCreate,_countOut], "PLAIN DOWN"];
								sleep 1;
							} forEach _selectedRecipeOutput;
							_tradeComplete = _tradeComplete+1;
						};
					} else {
						{player addMagazine _x; } forEach _temp_removed_array;
						cutText [format[(localize "str_epoch_player_151"),_removed_total,_tobe_removed_total], "PLAIN DOWN"];
					};
				} else {
					r_interrupt = false;
					if (vehicle player == player) then {
						[objNull, player, rSwitchMove,""] call RE;
						player playActionNow "stop";
					};
					cutText [(localize "str_epoch_player_64"), "PLAIN DOWN"];
					_craft_doLoop = false;
				};
			} else {
				_textMissing = getText(configFile >> "CfgMagazines" >> _missing >> "displayName");
				cutText [format[(localize "str_epoch_player_152"),_missingQty, _textMissing,_tradeComplete], "PLAIN DOWN"];
				_craft_doLoop = false;
			};
		} else {
			_textMissing = getText(configFile >> "CfgWeapons" >> _missing >> "displayName");
			cutText [format[(localize "STR_EPOCH_PLAYER_137"),_textMissing], "PLAIN DOWN"];
			_craft_doLoop = false;
		};
	};
} else {
	cutText [(localize "str_epoch_player_64"), "PLAIN DOWN"];
};
DZE_ActionInProgress = false;