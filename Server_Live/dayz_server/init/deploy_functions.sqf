//diag_log("Adding Deploy Functions/PubVar Handlers...");

//original code by dami modified by player2
"PVDZ_OBJ_DEPLOY" addPublicVariableEventHandler {
        _array = _this select 1;
        _positn = _array select 0;
        _player = _array select 1;
        _select = _array select 2;
        if (_select in ['Old_bike_TK_CIV_EP1','ATV_US_EP1','TT650_TK_CIV_EP1','350z_white','BTR40_TK_GUE_EP1','BTR40_MG_TK_GUE_EP1','HMMWV_DZ','HMMWV_Armored','CSJ_GyroC','AH6X_DZ','Mi17_Civilian_DZ','UH1H_TK_EP1']) then {
               
				//turn old bike to mountain bike
                if (_select == 'Old_bike_TK_CIV_EP1') then {	_select = "MMT_CIV" };

                _object = _select createVehicle _positn;
                _object setvelocity [0,0,1];

                _object setVariable ["ObjectID", "1", true];
                _object setVariable ["ObjectUID", "1", true];
                _object setVariable ["Deployed", true, true];
				_object setVariable ["LOG_disabled",false,true];

                _object call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

				clearWeaponCargoGlobal  	_object;
				clearMagazineCargoGlobal  	_object;
				_object setVehicleAmmo DZE_vehicleAmmo;

				_object call fnc_veh_ResetEH;
				PVDZE_veh_Init = _object;
				publicVariable "PVDZE_veh_Init";

             //   _log = format ["OBJECT DEPLOY LOG: %1 spanwed a %2 at %3.", name _player,_select,mapGridPosition _positn];
//                diag_log (_log);
        } else {
	         if (_select in ['ArmedLittlebird']) then {
	           	_object = "AH6J_EP1_DZE" createVehicle _positn;
	           	_object setvelocity [0,0,1];

	            _object setVariable ["ObjectID", "1", true];
	            _object setVariable ["ObjectUID", "1", true];
	            _object setVariable ["Deployed", true, true];
	            _object setVariable ["ArmedLittlebird", true, true];
	            _object setVariable ["LOG_disabled",false,true];

                _object call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

				_object addMagazine "2000Rnd_762x51_M134";
				clearWeaponCargoGlobal  _veh;
				clearMagazineCargoGlobal  _veh;
				_object setVehicleAmmo 0.05;

				_object call fnc_veh_ResetEH;
				PVDZE_veh_Init = _object;
				publicVariable "PVDZE_veh_Init";


	        //   	_log = format ["OBJECT DEPLOY LOG: %1 spanwed a %2 at %3.", name _player,_select,mapGridPosition _positn];
	         //   diag_log (_log);
	        } else {
	            _log = format ["OBJECT DEPLOY LOG: %1 tried to spawn %2 at %3.", name _player,_select,mapGridPosition _positn];
	            diag_log (_log);
	        };
        };
};

//added by player2
"PVDZ_OBJ_DEPLOY_PACK" addPublicVariableEventHandler {
        _array = _this select 1;
        _obj = _array select 0;
        _player = _array select 1;
        _objPos = getPos _obj;
        if (surfaceIsWater _objPos) then { _objPos = getPosASL _obj; } else { _objPos = getPosATL _obj; };
		_debug = getMarkerpos "respawn_west";
		_typeOf = typeOf _obj;
		//delete ze vehicle!
		deleteVehicle _obj;
		_bag = createVehicle ["WeaponHolder",_objPos,[], 1, "CAN_COLLIDE"];

		if (_typeOf == "MMT_CIV") then {
			_origMat = ["ItemToolbox"];
			{
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "ATV_US_EP1") then {
			_origMat = ["ItemToolbox","ItemToolbox","PartGeneric","PartWheel"];
			{
				
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};


			} forEach _origMat;
		};
		if (_typeOf == "TT650_TK_CIV_EP1") then {
			_origMat = ["ItemToolbox","ItemToolbox","PartGeneric","PartEngine"];
			{
				
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				


                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "350z_white") then {
			_origMat = ["ItemToolbox","ItemToolbox","ItemToolbox","PartGeneric","PartEngine","PartGeneric","PartWheel"];
			{
				
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "BTR40_TK_GUE_EP1") then {
			_origMat = ["ItemToolbox","ItemToolbox","ItemToolbox","PartGeneric","PartEngine","PartGeneric","PartEngine"];
			{
				
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "BTR40_MG_TK_GUE_EP1") then {
			_origMat =  ["ItemToolbox","ItemToolbox","ItemToolbox","ItemToolbox","PartGeneric","PartEngine","PartGeneric","PartEngine","Mk_48_DZ","100Rnd_762x51_M240"];
			{
				
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
			_tempclutter = createVehicle ["ClutterCutter_EP1",_objPos,[], 1, "CAN_COLLIDE"];
		};
		if (_typeOf == "HMMWV_DZ") then {
			_origMat = ["ItemToolbox","ItemToolbox","ItemToolbox","ItemToolbox","PartGeneric","PartEngine","PartGeneric","PartEngine","PartGeneric"];
			{
				
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "HMMWV_Armored_DZ") then {
			_origMat = ["ItemToolbox","ItemToolbox","ItemToolbox","ItemToolbox","PartGeneric","PartEngine","PartGeneric","PartEngine","PartGeneric","PartGeneric","Mk_48_DZ","100Rnd_762x51_M240"];
			{
				
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "CSJ_GyroC") then {
			_origMat = ["ItemToolbox","PartVrotor","PartEngine"];

			{
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "AH6X_DZ") then {
			_origMat = ["ItemToolbox","ItemToolbox","PartEngine","PartVrotor","PartEngine","PartGeneric"];
			
			{
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "AH6J_EP1_DZE") then {
			_origMat = ["ItemToolbox","ItemToolbox","PartEngine","PartVrotor","PartEngine","PartGeneric","PartGeneric","ItemToolbox"];	
			
			{
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "Mi17_Civilian_DZ") then {
			_origMat = ["ItemToolbox","ItemToolbox","ItemToolbox","PartEngine","PartVrotor","PartEngine","PartGeneric","PartEngine","PartGeneric"];
			
			{
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};
				_bag modelToWorld getPosATL _player;
				_bag setdir (getDir _player);
				

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};
		if (_typeOf == "UH1H_TK_EP1") then {
			_origMat = ["ItemToolbox","ItemToolbox","ItemToolbox","PartEngine","PartVrotor","PartEngine","PartGeneric","PartEngine","PartGeneric","PartGeneric"];
			
			{
				_bp = objNull; _freeBPSlots = 0;
				_bp = unitBackpack _player;
				_freeBPSlots = _bp call p2bpFreeSlotsCheck;

				if (_x == "ItemToolbox") then { 
					if (_freeBPSlots > 0) then {
						_bp addWeaponCargoGlobal [_x, 1];
					} else {
						_bag addWeaponCargoGlobal [_x, 1]; 
					};
				} else {
					if (_freeBPSlots > 0) then {
						_bp addMagazineCargoGlobal [_x, 1];
					} else {
						_bag addMagazineCargoGlobal [_x, 1] 
					};
				};

				_bag modelToWorld getPos player;
				_bag setdir (getDir player);
				player reveal _bag;

                _bag call {
				    _this setVariable [
				        uiNamespace getVariable (format ["hashIdVar%1", P2DZE_randHashVar]),
				        "hash_id" callExtension format [
				            "%1:%2",
				            netId _this,
				            typeOf _this
				        ]
				    ];
				};

			} forEach _origMat;
		};

	    _log = format ["OBJECT DEPLOY LOG: %1 packed up a %2 at %3.", name _player,str (_typeOf),mapGridPosition _player];
		diag_log (_log);

		_player reveal _bag; //give player gear option early
};


p2bpFreeSlotsCheck = {
	private ["_bp","_allowedItems", "_allowedMags", "_allowedWeapons", "_magazines", "_currentMags", "_currentWeps", "_weapons", "_wepCargo", "_itemName","_ad"];
	_bp = _this;
	_allowedItems = 0;
	if (isNil '_bp') exitWith { _allowedItems };
	if (isNull _bp) exitWith { _allowedItems };

	_allowedMags = 0;
	_allowedWeapons = 0;
	_magazines =[];
	_currentMags = 0;
	_currentWeps = 0;
	_weapons = [];
	_wepCargo = [[],[]];
	_itemName = "";
	_ad = false;

	_allowedMags = getNumber (configFile >> 'CfgVehicles' >> (typeOf _bp) >> 'transportMaxMagazines');
	_allowedWeapons = getNumber (configFile >> 'CfgVehicles' >> (typeOf _bp) >> 'transportMaxWeapons');
	 
	_magazines = getMagazineCargo _bp;
	{ _currentMags = _currentMags + (1 max (((getNumber (configFile >> "CfgMagazines" >> _x >> "type")) / 256)) * (((_magazines) select 1) select _foreachindex)); } forEach ((_magazines) select 0);

	_weapons = (getWeaponCargo _bp) select 1;
	{ _currentWeps = _currentWeps + _x } count _weapons;

	_wepCargo = (getWeaponCargo _bp);
	_allowedItems = ((_allowedMags - _currentMags) -1);

	{
		_ad = false;
		_itemName = (((_wepCargo) select 0) select _foreachindex);
		if (((getNumber (configFile >> "CfgWeapons" >> _itemName >> "type"))) == 131072) then {
			_allowedItems = _allowedItems - (_x * 1);
			_ad = true;
		};
		if (((getNumber (configFile >> "CfgWeapons" >> _itemName >> "type"))) == 2) then {
			_allowedItems = _allowedItems - (_x * 5);
			_ad = true;
		};
		if (!_ad) then {
			_allowedItems = _allowedItems - (_x * 10);
		};
	} forEach ((_wepCargo) select 1);

	_allowedItems
};