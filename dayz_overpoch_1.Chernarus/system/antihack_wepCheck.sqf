/*---------------------------------------------------------------------------
p2 fired

parent function

Input:
 [unit, weapon, muzzle, mode, ammo, magazine, projectile]
---------------------------------------------------------------------------*/

p2_fired = {

	[_this select 1, _this select 4] call p2_infAmmoCheck;
};



/*---------------------------------------------------------------------------
AntiHack Weaponchecker
by Player2 for wwww.ZombZ.net

Description:

	Kicks and logs players for weapons / mags not in loot or trader lists
		Output nearby buildings and players
	Kicks and logs players for ammo being shot from weapons that dont support it
		Output player info

	Uses ticks to define runtime
	Replaces weapon fired eventhandler
	
---------------------------------------------------------------------------*/
/*_time = 0;
_endTime = 0;
_runTime = 0;
_currentWep = "";
_mags = [];
_currentAmmo = "";
_player = player;
_vehicle = (vehicle player);



while {5 == 5} do {

_time = diag_tickTime;

	


_endTime = diag_tickTime;
	
};
*/





/*---------------------------------------------------------------------------
Infinite ammo checker

	Checks current weapon fired, checks ammo left in clip
	If no change for 3 shots, kicks and log
---------------------------------------------------------------------------*/
P2DZ_blackMarkCount = 0;
P2DZ_LastShotInfo = ["","",0,0];
P2DZ_lastReload = diag_tickTime;

/* sub function...waits for a player to reload then logs the time they reloaded at */

[] spawn {
	while {true} do {
		waitUntil {inputAction "ReloadMagazine" > 0};  
		P2DZ_lastReload = diag_tickTime;
	};
};

p2_infAmmoCheck = {
	private ["_weapon","_ammo","_d","_lastWeapon","_lastAmmoLeft","_lastMagsLeft","_shotsFiredCount","_ammoLeft","_magsLeft","_magCapacity","_lastTime"];
	if (vehicle player != player) exitWith {};
	_weapon = _this select 0;
	_ammo = _this select 1;
	_d = true;
	_u = player;



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

		if (_shotsFiredCount > _magCapacity) then {
			P2DZ_blackMarkCount = P2DZ_blackMarkCount + 999;
		};

		if (_ammoLeft > _magCapacity) then {
			P2DZ_blackMarkCount = P2DZ_blackMarkCount + 999;
		};

		_shotsFiredCount = _shotsFiredCount + 1;
		P2DZ_LastShotInfo = [_weapon,_ammo,diag_tickTime,_ammoLeft,_shotsFiredCount];
	} else {
		P2DZ_LastShotInfo = [_weapon,_ammo,diag_tickTime,0,0];
	};

	if (P2DZ_blackMarkCount > 3) then {
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",name player, getPlayerUID player, 'p2_infAmmoCheck', ([P2DZ_LastShotInfo, P2DZ_blackMarkCount])];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};
};
