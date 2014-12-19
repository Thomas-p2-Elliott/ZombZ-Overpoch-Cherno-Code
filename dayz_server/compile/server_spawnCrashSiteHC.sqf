/*---------------------------------------------------------------------------
Player2's Headless Client Crash Receiver/Spawner
---------------------------------------------------------------------------*/
private ["_lootTable","_spawnChance","_timeToSpawn","_spawnArr","_spawnPos","_newHeight","_index","_item2","_weights","_cntWeights","_itemType","_itemTypes","_itemChance","_iClass","_iType","_lootPos","_cookie","_guaranteedLoot","_randomizedLoot","_spawnPos","_spawnFire","_fadeFire","_d","_crashModel","_crashName","_crash","_config","_hasAdjustment","_adjustedPos","_num","_lootRadius","_radiusMultiplier","_nearBy"];


//_d = P2DZE_debugCrashSites;
_d = true;

if (_d) then { diag_log(format["SpawnCrashSiteHC: Input (%1)",_this]); };

_guaranteedLoot = _this select 0;
_randomizedLoot = _this select 1;
_spawnArr = _this select 2;
_spawnPos = _spawnArr select 0;
_spawnDir = _spawnArr select 1;
_spawnFire	= _this select 3;
_fadeFire	= _this select 4;

//Adding some Random systems
_crashModel = ["UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck","UH60_NAVY_Wreck_DZ","UH60_ARMY_Wreck_DZ","UH60_NAVY_Wreck_burned_DZ","UH60_ARMY_Wreck_burned_DZ"] call BIS_fnc_selectRandom;

if (_d) then { diag_log(format["SpawnCrashSiteHC: _crashModel (%1)",_crashModel]); };


switch (_crashModel) do {
	default 							{ _lootTable = [1,1] call fnc_specialLoot; };
	case "UH60Wreck_DZ": 				{ _lootTable = [1,1] call fnc_specialLoot; };
	case "UH1Wreck_DZ": 				{ _lootTable = [1,1] call fnc_specialLoot; };
	case "Mi8Wreck":					{ _lootTable = [1,1] call fnc_specialLoot; };
	case "UH60_NAVY_Wreck_DZ": 			{ _lootTable = [1,2] call fnc_specialLoot; };
	case "UH60_NAVY_Wreck_burned_DZ": 	{ _lootTable = [1,2] call fnc_specialLoot; };
	case "UH60_ARMY_Wreck_DZ": 			{ _lootTable = [1,3] call fnc_specialLoot; };
	case "UH60_ARMY_Wreck_burned_DZ": 	{ _lootTable = [1,3] call fnc_specialLoot; };
};

_crashName	= getText (configFile >> "CfgVehicles" >> _crashModel >> "displayName");

if (_d) then { 	diag_log(format["---- Heli Crash: %1 / %2 --- Pos: %3 --- Loot: %4", _crashModel, _crashName, _spawnPos, _lootTable]); };

_crash = createVehicle [_crashModel,_spawnPos, [], 0, "CAN_COLLIDE"];
// Randomize the direction the wreck is facing
_crash setDir _spawnDir;

_crash call {
    _this setVariable [
        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
        "hash_id" callExtension format [
            "%1:%2",
            netId _this,
            typeOf _this
        ]
    ];
};

// Using "custom" wrecks (using the destruction model of a vehicle vs. a prepared wreck model) will result
// in the model spawning halfway in the ground.  To combat this, an OPTIONAL configuration can be tied to
// the CfgVehicles class you've created for the custom wreck to define how high above the ground it should
// spawn.  This is optional.
_config = configFile >> "CfgVehicles" >> _crashModel >> "heightAdjustment";
_hasAdjustment =  isNumber(_config);
_newHeight = 0;
if (_hasAdjustment) then {
	_newHeight = getNumber(_config);
	//if (_d) then { diag_log(format["DIAG: ADJUSTMENT FOUND FOR %1, IT IS: %2", _crashName, _newHeight]); };
};

// Must setPos after a setDir otherwise the wreck won't level itself with the terrain
_adjustedPos = [(_spawnPos select 0), (_spawnPos select 1), _newHeight];
//if (_d) then { diag_log(format["DIAG: Designated Position: %1", str(_adjustedPos)]); };
_crash setPos _adjustedPos;

_crash setVariable ["ObjectID","1",true];

// Disable simulation server side
_crash enableSimulation false;

_num = (round(random _randomizedLoot)) + _guaranteedLoot;

if (_spawnFire) then {
	//["PVDZE_obj_Fire",[_crash,2,time,false,_fadeFire]] call broadcastRpcCallAll;
	PVDZE_obj_Fire = [_crash,2,time,false,_fadeFire];
	publicVariable "PVDZE_obj_Fire";
	_crash setvariable ["fadeFire",_fadeFire,true];
};



_itemTypes =	_lootTable select 0;
_itemChance =	_lootTable select 1;
_weights = [_itemTypes,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;

_lootRadius = 0.45;
_radiusMultiplier = 12;

for "_x" from 1 to _num do {
	_index = floor(random _cntWeights);
	_index = _weights select _index;
	if (_index > _cntWeights) then {
		_index = _index - 1 ;
	};
	_itemType = _itemTypes select _index;
	_iClass = _itemType select 0;
	_iType = _itemType select 1; 

	if (_iType == "custom_weapon") then {
		_itemTypes = [];
		{
			_itemTypes set [count _itemTypes, _x select 0]
		} count getArray (missionConfigFile >> "cfgLoot" >> _iClass);

		_index = -1;
		_weights = [];
		_cntWeights = -1;
		_item2 = "M9SD";
		_index = dayz_CLBase find _iClass;
		if (_index > 0) then {
			_weights = dayz_CLChances select _index;
			_cntWeights = count _weights;
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_item2 = _itemTypes select _index;

			if ((_item2 != "") && (isClass(configFile >> "CfgWeapons" >> _item2))) then {

				if (_iClass == "MeleeWeaps") then {

					if (_item2 == "Chainsaw") then {
						_item2 = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
					};
				};
			};
			_itemType = [_item2,"weapon"];
		};

		//reset to normal crash site loot table for next go around, 
		//otherwise it'd get stuck on the last custom weapon

		_itemTypes =	_lootTable select 0;
		_itemChance =	_lootTable select 1;
		_weights = [_itemTypes,_itemChance] call fnc_buildWeightedArray;
		_cntWeights = count _weights;
		_index = _weights call BIS_fnc_selectRandom;
	};

	if (_d) then { diag_log format["%1", _itemType]; };	

	_lootPos = [_spawnPos, ((random 2) + (sizeOf(_crashModel) * _lootRadius)), random 360] call BIS_fnc_relPos;

	[_itemType select 0, _itemType select 1, _lootPos, 2] call spawn_loot_server;

};

diag_log("---------------------------------------------");

// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 && other such items.
_nearBy = _spawnPos nearObjects ["ReammoBox", sizeOf(_crashModel) + 15];
{
	_x setVariable ["permaLoot",true];
	_x call {
	    _this setVariable [
	        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
	        "hash_id" callExtension format [
	            "%1:%2",
	            netId _this,
	            typeOf _this
	        ]
	    ];
	};

	//Grass Cutter Loot
	_cookie = "ClutterCutter_small_2_EP1" createVehicle (getPosATL _x);
	_cookie setPosATL (getPosATL _x);
	_cookie = objNull;

} count _nearBy;