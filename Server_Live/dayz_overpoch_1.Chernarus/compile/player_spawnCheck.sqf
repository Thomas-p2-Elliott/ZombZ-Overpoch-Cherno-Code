private ["_type","_inVehicle","_dateNow","_maxWildZombies","_age","_radius","_position","_markerstr","_markerstr1","_markerstr2","_markerstr3","_nearByObj","_handle","_looted","_cleared","_zombied","_config","_canLoot","_dis","_players","_nearby","_nearbyCount","_onTheMove","_soundLimit"];
//_t1 = diag_tickTime;

_type = _this select 0;
_inVehicle = (vehicle player != player);
_onTheMove = (speed (vehicle player) > 35);
_dateNow = (DateToNumber date);
_maxWildZombies = 3;
_age = -1;
_radius = 200;
_position = getPosATL player;

dayz_spawnZombies = 0;
dayz_CurrentZombies = 0;

// experiment with adding fly sounds locally for both zombies && players.
_soundLimit = 2;
{
	if (!alive _x) then {
		if (!(_x isKindOf "zZombie_Base")) then {
			[player,"flysound",1,true] call dayz_zombieSpeak;
			_soundLimit = _soundLimit - 1;
		};
	};
	if (_soundLimit == 0) exitWith {};
} count (nearestObjects [player, ["CAManBase"], 8]);

_players = _position nearEntities ["CAManBase",_radius+200];
dayz_maxGlobalZombies = dayz_maxGlobalZombiesInit;
{
	if(isPlayer _x) then {
		dayz_maxGlobalZombies = dayz_maxGlobalZombies + dayz_maxGlobalZombiesIncrease;
	} else {
		if (_x isKindOf "zZombie_Base") then {
			if (local _x) then {
				dayz_spawnZombies = dayz_spawnZombies + 1;
			};
			dayz_CurrentZombies = dayz_CurrentZombies + 1;
		};
	};
} count _players;

_nearby = _position nearObjects ["building",_radius];
_nearbyCount = count _nearby;
if (_nearbyCount < 1) exitwith
{
	if ((dayz_spawnZombies < _maxWildZombies) && !_inVehicle)  then {
		[_position] call wild_spawnZombies;
	};
};

{
	_type = typeOf _x;
	_config = missionConfigFile >> "CfgBuildingLoot" >> _type;
	_canLoot = 		isClass (_config);

	if(_canLoot) then {

		_dis = _x distance player;

		//Loot -						-> was !inVehicle
		if ((_dis < 120) && (_dis > 5) && !_onTheMove) then {
			_looted = (_x getVariable ["looted",-0.1]);
			_cleared = (_x getVariable ["cleared",true]);
			_dateNow = (DateToNumber date);
			_age = (_dateNow - _looted) * 525948;
			//diag_log ("SPAWN LOOT: " + _type + " Building is " + str(_age) + " old" );
			if ((_age > DZE_LootSpawnTimer) && (!_cleared)) then {
				_nearByObj = nearestObjects [(getPosATL _x), ["WeaponHolder","WeaponHolderBase"],((sizeOf _type)+5)];
				{deleteVehicle _x} count _nearByObj;
				_x setVariable ["cleared",true,true];
				_x setVariable ["looted",_dateNow,true];
			};
			if ((_age > DZE_LootSpawnTimer) && (_cleared)) then {
				//Register
				_x setVariable ["looted",_dateNow,true];
				//cleanup
				_x call building_spawnLoot;
			};
		};

		// do not spawn zeds if player is moving faster then 30kmh
		if (!_onTheMove) then {
			//Zeds
			if ((time - dayz_spawnWait) > dayz_spawnDelay) then {
				if (dayz_maxCurrentZeds < dayz_maxZeds) then {
					if (dayz_CurrentZombies < dayz_maxGlobalZombies) then {
						if (dayz_spawnZombies < dayz_maxLocalZombies) then {
								_zombied = (_x getVariable ["zombieSpawn",-0.1]);
								_dateNow = (DateToNumber date);
								_age = (_dateNow - _zombied) * 525948;
								if (_age > 3) then {
									_x setVariable ["zombieSpawn",_dateNow,true];
									[_x] call building_spawnZombies;
								};
						} else {
							dayz_spawnWait = time;
						};
					};
				};
			};
		};
	};
} count _nearby;
