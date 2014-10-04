private ["_position","_num","_config","_itemType","_weights","_index","_crashModel","_lootTable","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_crashName","_nearby","_itemTypes","_cntWeights","_fadeFire"];

//_crashModel	= _this select 0;
//_lootTable	= _this select 1;
_guaranteedLoot = _this select 0;
_randomizedLoot = _this select 1;
_frequency	= _this select 2;
_variance	= _this select 3;
_spawnChance	= _this select 4;
_spawnMarker	= _this select 5;
_spawnRadius	= _this select 6;
_spawnFire	= _this select 7;
_fadeFire	= _this select 8;
_d = P2DZE_debugCrashSites;

if (_d) then { diag_log("CRASHSPAWNER: Starting spawn logic for Crash Spawner"); };

while {1 == 1} do {
	private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos"];
	// Allows the variance to act as +/- from the spawn frequency timer
    _timeAdjust = round((random(_variance * 2)) - _variance);
	_timeToSpawn = time + _frequency + _timeAdjust;

	//Adding some Random systems
	_crashModel = ["UH60Wreck_DZ","UH1Wreck_DZ","UH60_NAVY_Wreck_DZ","UH60_ARMY_Wreck_DZ","UH60_NAVY_Wreck_burned_DZ","UH60_ARMY_Wreck_burned_DZ"] call BIS_fnc_selectRandom;


	switch (_crashModel) do {
		default 							{ _lootTable = [1,1] call fnc_specialLoot; };
		case "UH60Wreck_DZ": 				{ _lootTable = [1,1] call fnc_specialLoot; };
		case "UH1Wreck_DZ": 				{ _lootTable = [1,1] call fnc_specialLoot; };
		case "UH60_NAVY_Wreck_DZ": 			{ _lootTable = [1,2] call fnc_specialLoot; };
		case "UH60_NAVY_Wreck_burned_DZ": 	{ _lootTable = [1,2] call fnc_specialLoot; };
		case "UH60_ARMY_Wreck_DZ": 			{ _lootTable = [1,3] call fnc_specialLoot; };
		case "UH60_ARMY_Wreck_burned_DZ": 	{ _lootTable = [1,3] call fnc_specialLoot; };
	};

	_crashName	= getText (configFile >> "CfgVehicles" >> _crashModel >> "displayName");

	if (_d) then { diag_log(format["CRASHSPAWNER: %1%2 chance to spawn '%3' with loot table '%4' in %5 seconds", round(_spawnChance * 100), '%', _crashName, _crashModel, _timeToSpawn]); };

	// Apprehensive about using one giant long sleep here given server time variances over the life of the server daemon
	while {time < _timeToSpawn} do {
		sleep 5;
	};

	_spawnRoll = random 1;

	// Percentage roll
	if (_spawnRoll <= _spawnChance) then {

		_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;

		if (_d) then { diag_log(format["CRASHSPAWNER: Spawning '%1' with loot table '%2' NOW! (%3) at: %4", _crashName, _lootTable, time, str(_position)]); };

		_crash = createVehicle [_crashModel,_position, [], 0, "CAN_COLLIDE"];
		// Randomize the direction the wreck is facing
		_crash setDir round(random 360);

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
		_adjustedPos = [(_position select 0), (_position select 1), _newHeight];
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
			//Create loot
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			if (_index > 0) then {
				_index = _index - 1;
			};
			_itemType = _itemTypes select _index;
			_lootPos = [_position, ((random 2) + (sizeOf(_crashModel) * _lootRadius)), random 360] call BIS_fnc_relPos;

			[_itemType select 0, _itemType select 1, _lootPos, 2] call spawn_loot_server;

			if (_d) then { if (_d) then { diag_log(format["P2DEBUG: CRASHSPAWNER: Loot spawn at '%1' with loot table '%2' and chance array '%3'", _crashName, _lootTable select 0, _lootTable select 1]); };

			// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 && other such items.
			_nearby = _position nearObjects ["ReammoBox", sizeOf(_crashModel)];
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
			} count _nearBy;
		};

	};
};
