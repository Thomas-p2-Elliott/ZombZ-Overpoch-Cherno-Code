
/*---------------------------------------------------------------------------
Bullet Check
		Player Fired Event: _this = [unit, weapon, muzzle, mode, ammo, magazine, projectile]

---------------------------------------------------------------------------*/
p2_bulletCheck = {
	private ["_unit", "_weapon", "_magazine", "_projectile", "_muzzle", "_currentBulletSpeed", "_maxBulletSpeed", "_projectileType", "_magAmmoText", "_wepMagText"];	if (vehicle player != player) exitWith {};
	_unit = _this select 0;
	_weapon = _this select 1;
	_magazine = _this select 2;
	_projectile = _this select 3;
	_muzzle = _this select 4;

	//Check the speed the velocity is currently travelling
	_currentBulletSpeed = velocity _projectile;

	//Check the max velocity this projectile should be travelling
	_maxBulletSpeed = (getNumber (configFile >> 'CfgMagazines' >> _magazine >> 'initSpeed'));

	{
		if (_x > (_maxBulletSpeed + 50)) then {
			P2DZ_fire = [name _unit, getPlayerUID _unit, 'Bullet Check: Velocity too High.', (format['Fired Bullet Speed: %1,  Max Bullet Speed: %2', str _currentBulletSpeed, str _maxBulletSpeed])];
			publicVariableServer 'P2DZ_fire';
			[] spawn P2DZ_AHKick;
		};
	} count _currentBulletSpeed;

	//Get the projectile type
	_projectileType = (typeOf (_projectile));
	//Check if the magazine supports that projectile type
	_magAmmoText = (getText (configFile >> 'CfgMagazines' >> _magazine >> 'ammo'));

	if ({_x == _magAmmoText} count [_projectileType] < 1) exitWith {	
		P2DZ_fire = [name _unit, getPlayerUID _unit, 'Bullet Check: Bullet Doesnt Match Magazine', (format['Magazine: %1, Bullet: %2', str _magAmmoText, str _projectileType])];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};

	//Check if the gun supports that magazine
	_wepMagText = (getArray (configFile >> 'CfgWeapons' >> _weapon >> 'magazines'));

	if ({_x == _magazine} count _wepMagText < 1 && !(count (getArray (configFile >> 'cfgWeapons' >> _weapon >> 'muzzles')) > 1)) exitWith {	
		P2DZ_fire = [name _unit, getPlayerUID _unit, 'Bullet Check: Magazine Does not Match Weapon', (format['Magazine: %1, Weapons Supported Mags: %2', str _magazine, str _wepMagText])];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
};

p2_infAmmoCheck = { true };

/*---------------------------------------------------------------------------
Infinite ammo checker

	Checks current weapon fired, checks ammo left in clip
	If no change for 3 shots, kicks and log
---------------------------------------------------------------------------*/
/*
p2_infAmmoCheck = {
	private ["_weapon","_ammo","_d","_lastWeapon","_lastAmmoLeft","_lastMagsLeft","_shotsFiredCount","_ammoLeft","_magsLeft","_magCapacity","_lastTime"];
	if (vehicle player != player) exitWith {};
	_weapon = _this select 0;
	_ammo = _this select 1;
	_u = _this select 2;
	_d = false;



	if (_d) then { diag_log(format["%1: Input (_this): %2","p2_infAmmoCheck",_this]);
	 diag_log(format["%1: Input (weapon): %2, (ammo): %3","p2_infAmmoCheck",_weapon,_ammo]); 
	 diag_log(format["%1: P2DZ_LastShotInfo: %2","p2_infAmmoCheck",P2DZ_LastShotInfo]);
	};

	_lastWeapon = P2DZ_LastShotInfo select 0;
	_lastAmmo = P2DZ_lastShotInfo select 1;
	_lastTime = P2DZ_lastShotInfo select 2;

	_reloadedBetween = (P2DZ_lastReload > _lastTime);

	if (_weapon == _lastWeapon && _ammo == _lastAmmo && !_reloadedBetween) then {
		_lastAmmoLeft = P2DZ_LastShotInfo select 3;
		_shotsFiredCount = P2DZ_LastShotInfo select 4;

		_ammoLeft = _u ammo _weapon;
		_magCapacity = 	(getNumber (configFile >> "CfgMagazines" >> (currentMagazine _u) >> "count"));

		if (_ammoLeft == _lastAmmoLeft) then {
			P2DZ_blackMarkCount = P2DZ_blackMarkCount + 1;
		};

		//if (_shotsFiredCount > _magCapacity) then {
		//	P2DZ_blackMarkCount = P2DZ_blackMarkCount + 1;
		//};

		///if (_ammoLeft > _magCapacity) then {
		//	P2DZ_blackMarkCount = P2DZ_blackMarkCount + 999;
		//};

		_shotsFiredCount = _shotsFiredCount + 1;
		P2DZ_LastShotInfo = [_weapon,_ammo,diag_tickTime,_ammoLeft,_shotsFiredCount];
	} else {
		P2DZ_LastShotInfo = [_weapon,_ammo,diag_tickTime,0,0];
	};

	if (P2DZ_blackMarkCount > 3) then {
		P2DZ_fire = [name _unit, getPlayerUID _unit, 'p2_infAmmoCheck', ([P2DZ_LastShotInfo, P2DZ_blackMarkCount])];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};
};
*/
