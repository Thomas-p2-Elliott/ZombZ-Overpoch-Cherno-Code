/*---------------------------------------------------------------------------
P2HC_spawnMission

Description:
	Spawn Mission Scenery & Loot at Given Positions with Given Loot Table Types

Triggered By:
	AI Missions being spawned

Input Example:
	[[SceneryArray],[LootArray]]
	eg:
	[
		//Scenery Object Type & Pos & Amount (Pos gets replaced with bisFindSafePos version)
		[
			["UralWreck",_coords,1],
			["CampingTent",_coords,5],
		],						
		//Loot Table Type & Pos & Gear Amount (Pos gets replaced with bisFindSafePos version)
		[
			["Medical",_coords,8],
			["WesternWeapons",_coords,5]
		]	
	];

---------------------------------------------------------------------------*/
private ["_in", "_objs", "_loot", "_lootCrateCount"];

//input values
_in = _this;
_objs = _in select 0;
_loot = _in select 1;
_lootCrateCount = 0;

diag_log(format["[P2AI]:SpawnMission: Input: %1",_in]);

//foreach loot object
{
	private ["_lType", "_lPos", "_amnt", "_lTable", "_lChance", "_boxType", "_crate", "_itemTypes", "_itemChance", "_weights", "_cntWeights", "_index", "_itemType", "_iClass", "_iType", "_item2"];
	//get input for this object
	_lType = _x select 0;
	_lPos = _x select 1;
	_amnt = _x select 2;

	//use this to offset crate positions
	_lootCrateCount = _lootCrateCount + 1;

	if (isNil '_amnt') then { _amnt = 5; };
	if (_amnt < 0) then { _amnt = 5; };

	//diag_log(format["[P2AI]:SpawnMission:LootCrate: Input: %1",_x]);

	_lTable = []; _lChance = []; //init as empty
	_boxType = "USBasicAmmunitionBox"; //init as medical box type

	//if more than 1 crate we need to offset spawn pos from center
	if (_lootCrateCount > 1) then {
		//50% chance of offsetting spanw pos on X axis, 50% of Y
		if (random 1 < 0.5) then {
			if (random 1 < 0.5) then {
				_lPos = [((_lPos select 0) + (_lootCrateCount + 2)), (_lPos select 1), 0];
			} else {
				_lPos = [((_lPos select 0) - (_lootCrateCount + 2)), (_lPos select 1), 0];
			};
		} else {
			if (random 1 < 0.5) then {
				_lPos = [(_lPos select 0), ((_lPos select 1) + (_lootCrateCount + 2)), 0];
			} else {
				_lPos = [(_lPos select 0), ((_lPos select 1) - (_lootCrateCount + 2)), 0];
			};
		};
	};

	//diag_log(format["[P2AI]:SpawnMission:LootCrate:%1: BuiltPos: %2",_lootCrateCount,_lPos]);


	//generate loot from type given
	switch (_lType) do {
		default { 
			_lTable = [
				["ItemBandage",		"magazine"],
				["ItemPainkiller",	"magazine"],
				["ItemMorphine",	"magazine"],
				["ItemEpinephrine",	"magazine"],
				["ItemAntibiotic",	"magazine"],
				["ItemBloodbag",	"magazine"]
			];

			_lChance = [
				0.33,
				0.16,
				0.13,
				0.09,
				0.12,
				0.17	
			];

			_boxType = "USBasicAmmunitionBox"; 
		};
		case "Medical": 	
		{
			_lTable = [
				["ItemBandage",		"magazine"],
				["ItemPainkiller",	"magazine"],
				["ItemMorphine",	"magazine"],
				["ItemEpinephrine",	"magazine"],
				["ItemAntibiotic",	"magazine"],
				["ItemBloodbag",	"magazine"]
			];

			_lChance = [
				0.33,
				0.16,
				0.13,
				0.09,
				0.12,
				0.17	
			];		 	

			_boxType = "USBasicAmmunitionBox";
		};
		case "WesternWeapons": 	
		{
			_lTable = [
				["ScarHighWeaps", 	"custom_weapon"],		
				["RiflesMedWeaps", 	"custom_weapon"],		
				["ACRHighWeaps", 	"custom_weapon"],
				["PistolMilWeaps", 	"custom_weapon"],		
				["HK417Weaps", 		"custom_weapon"]
			];

			_lChance = [
				0.20,
				0.20,
				0.20,
				0.30,
				0.10
			];		 	

			_boxType = "USBasicWeaponsBox";
		};
		case "EasternWeapons": 	
		{
			_lTable = [
				["SVDWeaps", 		"custom_weapon"],					
				["RiflesMedWeaps", 	"custom_weapon"],
				["PistolMilWeaps", 	"custom_weapon"],
				["AKHighWeaps", 	"custom_weapon"],
				["SniperMedWeaps", 	"custom_weapon"]
			];

			_lChance = [
				0.10,
				0.20,
				0.30,
				0.30,
				0.10
			];		 	

			_boxType = "RUBasicWeaponsBox";
		};
	};

	//was boxtype - not working though?? da fuck...
	//create object
	_crate = "RUBasicWeaponsBox" createVehicle _lPos;

	//secure object against cleanup
  	_crate call {
	    _this setVariable [
	        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
	        "hash_id" callExtension format [
	            "%1:%2",
	            netId _this,
	            typeOf _this
	        ]
	    ];
	};

	//set pos of crate
	_crate setPosATL _lPos;

	//align object with terrain
	_crate setVectorUp surfaceNormal position _crate;

	//empty object
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;

	/*---------------------------------------------------------------------------
	Add Loot to Crates
	---------------------------------------------------------------------------*/

	//diag_log(format["[P2AI]:SpawnMission:LootCrate: LootTable: %1", _lTable]);

	//generate random loot items to add to crate from loot table
	_itemTypes =	_lTable;
	_itemChance =	_lChance;
	_weights = [_itemTypes,_itemChance] call fnc_buildWeightedArray;
	_cntWeights = count _weights;
	_index = _weights call BIS_fnc_selectRandom;

	for "_x" from 1 to _amnt do {
		//diag_log(format["[P2AI]:SpawnMission:LootCrate: Adding Item %1 of %2", _x, _amnt]);
		//diag_log("[P2AI]:SpawnMission:LootCrate: ");

		_index = floor(random _cntWeights);
		_index = _weights select _index;
		if (_index > _cntWeights) then {
			_index = _index - 1 ;
		};
		_itemType = _itemTypes select _index;
		_iClass = _itemType select 0;
		_iType = _itemType select 1; 

		//diag_log(format["[P2AI]:SpawnMission:LootCrate: Selected: %1", _itemType]);

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
			_itemTypes =	_lTable;
			_itemChance =	_lChance;
			_weights = [_itemTypes,_itemChance] call fnc_buildWeightedArray;
			_cntWeights = count _weights;
			_index = _weights call BIS_fnc_selectRandom;
		};

		[_itemType select 0, _itemType select 1, _crate] call {
			private ["_iItem", "_iClass", "_itemTypes", "_qty", "_max", "_index", "_weights", "_cntWeights", "_item2", "_crate", "_mags", "_canType"];
			_iItem = _this select 0;
			_iClass = _this select 1;
			_crate = _this select 2;

			//diag_log(format["[P2AI]:SpawnMission:LootCrate: AddLoot: Item: %1, Class: %2", _iItem, _iClass]);


			switch (_iClass) do {
				default {
					_itemTypes = [];

					{
						_itemTypes set [count _itemTypes, _x select 0]
					} count getArray (missionConfigFile >> "cfgLoot" >> _iClass);
				
					_qty = 0;
					_max = ceil(random 2) + 1;
					// diag_log format["DEBUG dayz_CLBase: %1", dayz_CLBase];
					_index = dayz_CLBase find _iClass;
					if (_index > 0) then {
						_weights = dayz_CLChances select _index;
						//diag_log format["DEBUG dayz_CLChances: %1", dayz_CLChances];
						_cntWeights = count _weights;
						_index = floor(random _cntWeights);
						_index = _weights select _index;
						_item2 = _itemTypes select _index;
						if ((_item2 != "") && (isClass(configFile >> "CfgWeapons" >> _item2))) then{
							_crate addWeaponCargoGlobal[_item2, 1];
						//	diag_log(format["[P2AI]:SpawnMission:LootCrate: Weapon Added: %1", _item2]);

							if ((count _mags) > 0) then{
								if (_mags select 0 == "20Rnd_556x45_Stanag") then{ _mags set[0, "30Rnd_556x45_Stanag"] };
								if (_mags select 0 == "30Rnd_556x45_G36") then{ _mags set[0, "30Rnd_556x45_Stanag"] };
								if (_mags select 0 == "30Rnd_556x45_G36SD") then{ _mags set[0, "30Rnd_556x45_StanagSD"] };
								if (!(_item2 in MeleeWeapons)) then{
									_crate addMagazineCargoGlobal[(_mags select 0), (ceil(random 2) + 2)];
								//	diag_log(format["[P2AI]:SpawnMission:LootCrate: Weapon Magazines Added: %1", _item2]);
								};
							};
						};
						if ((_item2 != "") && (isClass(configFile >> "CfgMagazines" >> _item2))) then{
							_crate addMagazineCargoGlobal[_item2, 1];
						//	diag_log(format["[P2AI]:SpawnMission:LootCrate: Magazine Added: %1", _item2]);
						};
						if ((_item2 != "") && (isClass(configFile >> "CfgVehicles" >> _item2))) then{
							_crate addWeaponCargoGlobal[_item2, 1];
						//	diag_log(format["[P2AI]:SpawnMission:LootCrate: Weapon Added: %1", _item2]);
						};
					};
					
				};
				case "single":
				{
					_itemTypes = [];
					{
						_itemTypes set[count _itemTypes, _x select 0]
					} count getArray(missionConfigFile >> "cfgLoot" >> _iItem);
				
					_index = dayz_CLBase find _iItem;
					_weights = dayz_CLChances select _index;
					_cntWeights = count _weights;
						
				    _index = floor(random _cntWeights);
					_index = _weights select _index;
					_canType = _itemTypes select _index;
					_crate addMagazineCargoGlobal [_canType,1];

				//	diag_log(format["[P2AI]:SpawnMission:LootCrate: Magazine Added: %1", _canType]);
				};
				case "cfglootweapon":
				{
					_itemTypes = [];
					{
						_itemTypes set[count _itemTypes, _x select 0]
					} count getArray(missionConfigFile >> "cfgLoot" >> _iItem);
				
					_index = dayz_CLBase find _iItem;
					_weights = dayz_CLChances select _index;
					_cntWeights = count _weights;
						
				    _index = floor(random _cntWeights);
					_index = _weights select _index;
					_iItem = _itemTypes select _index;

					if (_iItem == "Chainsaw") then {
						_iItem = ["ChainSaw","ChainSawB","ChainSawG","ChainSawP","ChainSawR"] call BIS_fnc_selectRandom;
					};

					//Item is a weapon, add it && a random quantity of magazines
					_crate addWeaponCargoGlobal [_iItem,1];

					//diag_log(format["[P2AI]:SpawnMission:LootCrate: Weapon Added: %1", _iItem]);

					_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
					if ((count _mags) > 0) then
					{
						if (_mags select 0 == "Quiver") then { _mags set [0, "WoodenArrow"] }; // Prevent spawning a Quiver
						if (_mags select 0 == "20Rnd_556x45_Stanag") then { _mags set [0, "30Rnd_556x45_Stanag"] };
						if (_mags select 0 == "30Rnd_556x45_G36") then { _mags set [0, "30Rnd_556x45_Stanag"] };
						if (_mags select 0 == "30Rnd_556x45_G36SD") then { _mags set [0, "30Rnd_556x45_StanagSD"] };
						_crate addMagazineCargoGlobal [(_mags select 0), (round(random 2))];

						//diag_log(format["[P2AI]:SpawnMission:LootCrate: Weapon Magazines Added: %1", (_mags select 0)]);
					};
					
				};
				case "weapon":
				{
					_crate addWeaponCargoGlobal [_iItem,1];
					//diag_log(format["[P2AI]:SpawnMission:LootCrate: Weapon Added: %1", _iItem]);

					_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
					if ((count _mags) > 0) then
					{
						if (_mags select 0 == "Quiver") then { _mags set [0, "WoodenArrow"] }; // Prevent spawning a Quiver
						if (_mags select 0 == "20Rnd_556x45_Stanag") then { _mags set [0, "30Rnd_556x45_Stanag"] };
						if (_mags select 0 == "30Rnd_556x45_G36") then { _mags set [0, "30Rnd_556x45_Stanag"] };
						if (_mags select 0 == "30Rnd_556x45_G36SD") then { _mags set [0, "30Rnd_556x45_StanagSD"] };
						if (!(_iItem in MeleeWeapons)) then {
							_crate addMagazineCargoGlobal [(_mags select 0), (ceil(random 2) + 2)];

							//diag_log(format["[P2AI]:SpawnMission:LootCrate: Weapon Magazines Added: %1", (_mags select 0)]);
						};
					};
				};
				case "magazine":
				{
					_crate addMagazineCargoGlobal [_iItem,1];
					//diag_log(format["[P2AI]:SpawnMission:LootCrate: Magazine Added: %1", _iItem]);
				};
			};
		};

	};
} forEach _loot;


//foreach scenery object
{
	private ["_oType", "_oPos", "_amnt", "_rad", "_obj","_loopC","_safePos"];
	//get input for this object
	_oType = _x select 0;
	_oPos = _x select 1;
	_amnt = _x select 2;

	if (isNil '_amnt') then { _amnt = 1; };
	if (_amnt < 0) then { _amnt = 1; };

	for "_i" from 1 to _amnt do {
		_rad = 45; //default safePos radius

		//create object
		_obj = _oType createVehicle _oPos;

		//secure object against cleanup
	  	_obj call {
		    _this setVariable [
		        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
		        "hash_id" callExtension format [
		            "%1:%2",
		            netId _this,
		            typeOf _this
		        ]
		    ];
		};

		//diag_log(format["[P2AI]:SpawnMission:Scenery: Obj: %3 SpawnPos: %1, objSize*1.5: %2",_oPos,((sizeOf (typeOf _obj)) * 0.3), (typeOf _obj)]);

		//find safe pos to create object within 15m/30m of pos given
		_safePos = [_oPos,5,_rad,((sizeOf (typeOf _obj))),0,2000,0] call BIS_fnc_findSafePos;
		//diag_log(format["[P2AI]:SpawnMission:Scenery: SafePos: %1",_safePos]);

		_loopC = 0;

		while {((_safePos select 0 == 7100) && (_safePos select 1 == 7750) && (_safePos select 2 == 300))} do {
			if (_loopC > 9) exitWith {
				diag_log("[P2AI]:SpawnMission:Scenery: Could not find pos for object!");
			};

			_safePos = [_oPos,5,(_rad + (_loopC * 5)),((sizeOf (typeOf _obj))),0,2000,0] call BIS_fnc_findSafePos;
			_loopC = _loopC + 1;

			//diag_log(format["[P2AI]:SpawnMission:Scenery: FindPosLoop: _safePos: %1, loopCount: %2, Rad: %3",_safePos, _loopC, (_rad + (_loopC * 5))]);
		};

		//diag_log(format["[P2AI]:SpawnMission:Scenery: FinalPos: %1",_safePos]);

		//set object pos to safePos
		_obj setPos _safePos;

		//set random obj direction
		_obj setDir (random 360);

		//align object with terrain
		_obj setVectorUp surfaceNormal position _obj;

		//delete scenery that spawns at invalid pos
		if ((_safePos select 0 == 7100) && (_safePos select 1 == 7750) && (_safePos select 2 == 300)) then {
			//diag_log("[P2AI]:SpawnMission:Scenery: Deleting Obj: " + (typeOf _obj));
			deleteVehicle _obj;
		};
	};
} forEach _objs;

