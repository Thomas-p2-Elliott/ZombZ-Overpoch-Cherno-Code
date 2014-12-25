private ["_cz","_playerObj","_zedCount","_maxZeds","_zeds2Spawn","_position","_inVehicle","_nearby","_nearbyCount","_d","_minDist","_maxDist"];
_playerObj = _this select 0;
_zedCount = _this select 1;
_maxZeds = _this select 2;
_nearbyCount = 0;
_position = [];
_nearby = [];
_inVehicle = false;
_minDist = 80;
_maxDist = 250;
_cz = 0; //used for debugging diag log

_d = P2DZ_HC_ExtraZedsDebug;
_zeds2Spawn = _maxZeds - _zedCount;
_zeds2Spawn = floor(_zeds2Spawn);


//If zeds 2 spawn plus amount of current zombies is greater than the maximum allowed,
// then reduce it to 1/3 of the remaining allowance for zeds
if ((_zeds2Spawn + P2DZ_HC_currentGlobalZeds) > P2DZ_HC_globalMaxZeds) then {
	_zeds2Spawn = P2DZ_HC_globalMaxZeds - P2DZ_HC_currentGlobalZeds;
	_zeds2Spawn = _zeds2Spawn * 0.3;
	_zeds2Spawn = ceil(_zeds2Spawn);
};

if (_d) then { diag_log(format["P2HC:ZedSpawns: P2DZ_HC_spawnZeds: Input: %1",_this]); };

if (_zeds2Spawn < 1) exitWith {
	if (_d) then {
		diag_log(format["P2HC:ZedSpawns: P2DZ_HC_spawnZeds: FATAL INPUT ERROR (0 zeds to spawn): %1",_this]);
	};
};

//Exit if max zombie count has been reached
if (P2DZ_HC_currentGlobalZeds > P2DZ_HC_globalMaxZeds) exitWith {
	if (_d) then {
		diag_log(format["P2HC:ZedSpawns: player2_spawnZedsHC: Exit: P2DZ_HC_currentGlobalZeds (%1) > (%2) P2DZ_HC_globalMaxZeds",P2DZ_HC_currentGlobalZeds,P2DZ_HC_globalMaxZeds]);
	};
};


_position = position _playerObj;
if (vehicle _playerObj != _playerObj) then {
	_inVehicle = true;
} else {
	_inVehicle = false;
};
_nearby = _position nearObjects ["building",P2DZ_HC_playerZedRadius];
_nearbyCount = count _nearby;

//If less than 15 buildings nearby
if (_nearbyCount < 15) then
{
	//Set min zed spawn distance from player to 100m
	_minDist = 100;
	//Set max zed spawn distance from player to 300m
	_maxDist = 300;

	/* testing settings: */  
	//_minDist = 10; _maxDist = 50; diag_log("P2DEBUG: player2_spawnZedsHC.sqf: Warning: Test Settings Enabled!");

	if (_d) then {
		diag_log(format["P2HC:ZedSpawns: P2DZ_HC_spawnZeds (Wild): Input: %1, Zeds2Spawn: %2",_this,(ceil(_maxZeds * 0.33))]);
		diag_log(format["P2HC:ZedSpawns: P2DZ_HC_spawnZeds (Wild): SpawnZeds: %1, InVehicle: %2 (Vehicle:%5\Player:%6), MaxZeds: %3, ZedCount: %4",((_zedCount < (ceil(_maxZeds * 0.3))) && !_inVehicle),_inVehicle,_maxZeds,_zedCount,typeOf(vehicle _playerObj),typeOf(_playerObj)]); //0 < 100 && not in vehicle
	};

	_cz = 0; //used for debugging diag log

	//If current zed count is less than the max zed counts divided by 3 and the player is not in a vehicle
	if ((_zedCount < (ceil(_maxZeds * 0.3))) && !_inVehicle)  then {	
		//for 1 up to the maxZed Count
		for "_i" from 1 to (ceil(_zeds2Spawn * 0.3)) do {
			//10% chance
			if (random 1 > 0.9) then {
				if (_d) then {
					_cz = _cz + 1;
					diag_log(format["P2HC:ZedSpawns: P2DZ_HC_spawnZeds (Wild): Spawning Zed %1 of %2",_cz,(ceil(_zeds2Spawn * 0.3))]);
				};

				[_position,_minDist,_maxDist] call player2_spawnZombieHC; //Spawn a zombie
			};
		};
	};
} else {
//Buildings are nearby

	//Set min zed spawn distance from player 
	_minDist = 30;
	//Set max zed spawn distance from player 
	_maxDist = 100;

	/* testing settings: */ 
	// _minDist = 10; _maxDist = 50; diag_log("P2DEBUG: player2_spawnZedsHC.sqf: Warning: Test Settings Enabled!");

	if (_d) then {
		diag_log(format["P2HC:ZedSpawns: P2DZ_HC_spawnZeds (City): Input: %1, Zeds2Spawn: %2",_this,_zeds2Spawn]);
	};

	_cz = 0; //used for debugging diag log

	if (_zedCount < (_maxZeds))  then {	

		//for 1 up to the maxZed Count
		for "_i" from 1 to (_zeds2Spawn) do {
			//30% chance
			if (random 1 > 0.6) then {
				if (_d) then {
					_cz = _cz + 1;
					diag_log(format["P2HC:ZedSpawns: P2DZ_HC_spawnZeds (City): Spawning Zed %1 of %2",_cz,_zeds2Spawn]);
				};

				[_position,_minDist,_maxDist] call player2_spawnZombieHC;	//Spawn a zombie
			};
		};
	};
};

/*---------------------------------------------------------------------------
www.ZombZ.net - Player2
---------------------------------------------------------------------------*/