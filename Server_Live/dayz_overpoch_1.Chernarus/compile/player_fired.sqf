private ["_unit","_ammo","_audible","_distance","_listTalk","_weapon","_group","_targets","_i","_projectile","_id","_caliber","_shouldBeSilenced"];
_unit = 		_this select 0;
_weapon = 		_this select 1;
_ammo = 		_this select 4;
_projectile = 	_this select 6;
_audible = getNumber (configFile >> "CfgAmmo" >> _ammo >> "audibleFire");
_caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
_distance = round(_audible * 20 * _caliber);
_shouldBeSilenced = ["RH_m1911sd","RH_hk417sd","RH_hk417sdaim","RH_hk417sdeotech","RH_hk417sdacog","RH_20Rnd_762x51_SD_hk417","USSR_cheytacM200_sd","FHQ_MSR_SD_DESERT","FHQ_XM2010_SD_DESERT","vil_SR25SD","vil_M110sd","RH_mk22sd","RH_mk22vsd","RH_g18","RH_uspsd","RH_mk2","RH_m9sd","RH_m9csd","RH_g17sd","M9SD","FHQ_MSR_NV_SD_DESERT","FHQ_MSR_SD_BASE","FHQ_MSR_TWS_SD_DESERT","Makarov","FHQ_RSASS_SD_BASE","FHQ_RSASS_SD_TAN","FHQ_RSASS_TWS_SD_TAN","FHQ_XM2010_TWS_SD_DESERT","FHQ_XM2010_NV_SD_DESERT","FHQ_XM2010_SD_BASE","vil_apssd","vil_SV_98_SD","vil_USP45SD","vil_Groza_SD","vil_AKMSB","vil_uzimini_SD","vil_uzi_SD"];
if (_weapon in _shouldBeSilenced) then {
	_distance = 0;
};

dayz_disAudial = _distance;
dayz_firedCooldown = time;
dayz_combat = 1;

if (_ammo isKindOf "Melee") exitWith {
	
	if(!(_ammo isKindOf "Chainsaw_Swing_Ammo")) then {
		_unit playActionNow "GestureSwing";
		[1,1] call dayz_HungerThirst;
	};

	_this call player_harvest;
};
if (_ammo isKindOf "SmokeShell") then {
	_i = 0;
	_projectile = nearestObject [_unit, _ammo];
	_listTalk = (getPosATL _projectile) nearEntities ["zZombie_Base",300];
	{
		_group = group _x;
		if (isNull group _x) then {
			_group = _x;
		};
		_x reveal [_projectile,4];
		_targets = _group getVariable ["targets",[]];
		if (!(_projectile in _targets)) then {
			_targets set [count _targets,_projectile];
			_group setVariable ["targets",_targets,true];
		};
		_i = _i + 1;
	} count _listTalk;
} else {
	[_unit,_distance,true,(getPosATL player)] spawn player_alertZombies;
	//Check if need to place arrow
	if (_ammo isKindOf "Bolt") then {
		_id = _this spawn player_crossbowBolt;
	};
	if (_ammo isKindOf "GrenadeHand") then {
		
		if (_ammo isKindOf "ThrownObjects") then {
			_id = _this spawn player_throwObject;
		};
		if (_ammo isKindOf "RoadFlare") then {
			_projectile = nearestObject [_unit, "RoadFlare"];
			_id = [_projectile,0] spawn object_roadFlare;
		
			/* PVS/PVC - Skaronator */
			_pos = getPosATL player;
			_inRange = _pos nearEntities ["CAManBase",1250];
			{
				if(isPlayer _x && _x != player) then {
					PVDZE_send = [_x,"RoadFlare",[_projectile,0]];
					publicVariableServer "PVDZE_send";
				};
			} count _inRange;
			
			_id = _this spawn player_throwObject;
		};
		if (_ammo isKindOf "ChemLight") then {
			_projectile = nearestObject [_unit, "ChemLight"];
			_id = [_projectile,1] spawn object_roadFlare;
			
			_pos = getPosATL player;
			_inRange = _pos nearEntities ["CAManBase",1250];
			{
				if(isPlayer _x && _x != player) then {
					PVDZE_send = [_x,"RoadFlare",[_projectile,1]];
					publicVariableServer "PVDZE_send";
				}
			} count _inRange;
			
			_id = _this spawn player_throwObject;
		};
	};	
};