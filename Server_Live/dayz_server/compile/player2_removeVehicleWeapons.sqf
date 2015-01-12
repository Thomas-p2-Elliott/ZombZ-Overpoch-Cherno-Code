P2DZ_safeVehWeaps = ["Horn","M240","M134","Smoke","m32","m203","PKT","Vickers","Grenade","FFAR","762","556","pook","127x107","DShKM","127x99","M2","40mm","MK19"];
if (isNil "DZE_vehicleAmmo") then { DZE_vehicleAmmo = 0; };

//add m134 cannon back on removal?
P2DZ_addNewWeaponsOnRemoval = true;

P2DZ_debugWepRemovals = false;

//To Use:
// _obj call player2_removeVehicleWeapons;



player2_outputVehicleWeapons = {
	private ["_vehicleObject","_vehicle"];

	_vehicleObject = _this;
	_vehicle = (typeOf _vehicleObject);

	//diag_log("P2DEBUG: player2_outputVehicleWeapons");

	//note, does not output main turret, get in vehicle to properly check this....
	//diag_log("Vehicle Weapons Now:" + str (weapons _this));
	//diag_log("Vehicle Magazines Now:" + str (magazines _this));
};


player2_checkIfVehWeaponSafe = {
	private["_inCount","_result"];
	_inCount = 0;
	for "_i" from 0 to ((count P2DZ_safeVehWeaps) - 1) do {

		if (([(_this),(P2DZ_safeVehWeaps select _i)] call KRON_strInStr)) then {
			if !(_this == "M230") then {
				_inCount = _inCount + 1; 
			};
		};
	};

	if (_inCount > 0) then {
		_result = true;
	} else {
		_result = false;
	};

	_result
};


player2_removeVehicleWeapons = {
	private ["_vehicleObject","_vehicle","_mainWeapons","_answer","_mainMagazines","_dn","_cfg","_tc","_mtc","_mt","_st","_stc","_weaps","_mags","_stp"];
	_vehicleObject = _this;


	_mainRemoved = false;
	_turretsRemoved = [];

	_vehicle = (typeOf _vehicleObject);

	if (P2DZ_debugWepRemovals) then { diag_log("player2_removeVehicleWeapons: " + str _vehicle); };


	if ((isArray (configFile >> "CfgVehicles" >> _vehicle >> "weapons"))) then {
			_mainWeapons = (getArray (configFile >> "CfgVehicles" >> _vehicle >> "weapons"));

			{
				_answer = _x call player2_checkIfVehWeaponSafe;
				if (_answer) then {
 					//diag_log("Main Weapon Skipped: " + str _x);
				} else {
 					if (P2DZ_debugWepRemovals) then { diag_log("Main Weapon Removed: " + str _x); };
 					_vehicleObject removeWeapon _x;
					if ((_x != "CMFlareLauncher")) then { _mainRemoved = true; };
				};
			  
			} forEach _mainWeapons;

			if ((isArray (configFile >> "CfgVehicles" >> _vehicle >> "magazines"))) then {
				_mainMagazines = (getArray (configFile >> "CfgVehicles" >> _vehicle >> "magazines"));

				{
					_answer = _x call player2_checkIfVehWeaponSafe;
					if (_answer) then {
	 					//diag_log("Main Mag Skipped: " + str _x);
					} else {
	 					if (P2DZ_debugWepRemovals) then { diag_log("Main Mag Removed: " + str _x); };
				 		_vehicleObject removeMagazineTurret [_x,[-1]];
					};

				} forEach _mainMagazines;

			};
 
		};

		_dn = getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName");
			
		_cfg = configFile >> "CfgVehicles" >> _vehicle >> "turrets";
		_tc = count _cfg;
		if (_tc>0) then {
			_mtc = count _cfg; 
			
			for "_mti" from 0 to _mtc-1 do {
				_mt = (_cfg select _mti);
				_st = _mt >> "turrets";
				_stc = count _st; 
				
				_weaps = getArray(_mt >> "weapons");
				{

					_answer = _x call player2_checkIfVehWeaponSafe;
					if (_answer) then {
					 	//diag_log("Turret #" + str(_mti) + " Weapon Skipped: " + str _x);
					} else {
					 	if (P2DZ_debugWepRemovals) then { diag_log("Turret #" + str(_mti) + " Weapon Removed: " + str _x); };
	 					_vehicleObject removeWeapon _x;
 					if !(_mti in _turretsRemoved) then {
						_turretsRemoved = _turretsRemoved + [_mti];
					};
 			};


				} forEach _weaps;

				_mags = getArray(_mt >> "magazines");

				{
					_answer = _x call player2_checkIfVehWeaponSafe;
					if (_answer) then {
				 		//diag_log("Turret #" + str(_mti) + " Magazine Skipped: " + str _x);
					} else {
				  		if (P2DZ_debugWepRemovals) then { diag_log("Turret #" + str(_mti) + " Magazine Removed: " + str _x); };
				 	 	_vehicleObject removeMagazineTurret [_x,[_mti]];
					};

				} forEach _mags;

				for "_sti" from 0 to _stc-1 do {
					_stp = (_st select _sti);
					_weaps = getArray(_stp >> "weapons");
					
					{
						_answer = _x call player2_checkIfVehWeaponSafe;
						if (_answer) then {
						 	//diag_log("Turret #" + str(_sti) + " Weapon Skipped: " + str _x);
						} else {
						 	if (P2DZ_debugWepRemovals) then { diag_log("Turret #" + str(_sti) + " Weapon Removed: " + str _x); };
		 					_vehicleObject removeWeapon _x;
	 					if !(_sti in _turretsRemoved) then {
							_turretsRemoved = _turretsRemoved + [_sti];
						};
					};

					} forEach _weaps;

					_mags = getArray(_stp >> "magazines");
					{

					_answer = _x call player2_checkIfVehWeaponSafe;
					if (_answer) then {
				 		//diag_log("Turret #" + str(_sti) + " Magazine Skipped: " + str _x);
					} else {
				  		if (P2DZ_debugWepRemovals) then { diag_log("Turret #" + str(_sti) + " Magazine Removed: " + str _x); };
					 	_vehicleObject removeMagazineTurret [_x,[_sti]];
					};

					} forEach _mags;

				};
			};
		}; 

	if (P2DZ_addNewWeaponsOnRemoval) then {
		if (((count _turretsRemoved) > 0) || _mainRemoved) then {
			_vehicleObject addMagazine "2000Rnd_762x51_M134";
			_vehicleObject addWeapon "M134";
			_vehicleObject setVehicleAmmo DZE_vehicleAmmo;
			if (P2DZ_debugWepRemovals) then { diag_log("P2DEBUG: M134 with 400 Rounds Added to: " + (typeOf _vehicleObject)); };
		};
	};
	//_this call player2_outputVehicleWeapons; 
};
