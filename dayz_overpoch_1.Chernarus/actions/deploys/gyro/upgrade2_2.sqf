private["_obj","_objectID","_objectUID","_dis","_sfx"];

_isInCombat = player getVariable["startcombattimer",0]; if (_isInCombat == 1) then { 
    cutText [format["You are in Combat and cannot upgrade your Littlebird."], "PLAIN DOWN"];
	sleep 2;
	cutText [format["Make sure you upgrade your Littlebird somewhere safe and clear of objects."], "PLAIN DOWN"];
} else {

	_pwep = primaryWeapon player;
	_mags = getArray(configfile >> 'cfgWeapons' >> _pwep >> 'magazines');
	_magtype = _mags select 0;

	_mammo = ["100Rnd_762x54_PK","200Rnd_556x45_M249","100Rnd_762x51_M240","100Rnd_556x45_M249","100Rnd_556x45_BetaCMag","vil_75Rnd_762x39_AK47","vil_100Rnd_762x39_RPD","vil_45Rnd_545x39_AK","vil_60Rnd_545x39_AK","Vil_50Rnd_556x45_G","100Rnd_556x45_BetaCMag","75Rnd_545x39_RPK","200Rnd_762x54_GPMG","100Rnd_127x99_M2"];
	
	_has1 = "PartGeneric" in magazines player;
	_has2 = _magtype in _mammo;	
	
	if (_has2 && _has1) then {
	
	
			_obj = _this select 3;
			
			
			//they're ready.
			player removeAction s_player_upgradeLittlebird2;
			player playActionNow "Medic";
			r_interrupt = false;
			player removeMagazine "PartGeneric";
			player removeWeapon _pwep;
			_dis=5;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
			
			sleep 9;
			deleteVehicle _obj;
			sleep 1;
			
			_object = "ArmedLittlebird";
			_dir = getdir (vehicle player);
			_pos = getPos (vehicle player);
			_pos = [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
			PVDZ_OBJ_DEPLOY = [_pos,player,_object];
			publicVariableServer "PVDZ_OBJ_DEPLOY";

			
			cutText [format["You've upgraded to an armed littlebiord!"], "PLAIN DOWN"];
			
			r_interrupt = false;
			player switchMove "";
			player playActionNow "stop";
			
			sleep 5;
						
			cutText [format["Warning: Spawned Hueys do Not Save after server restart!"], "PLAIN DOWN"];
			
		} else {
			cutText [format["You need Scrap Metal and a Machine Gun (e.g. M240) to upgrade this."], "PLAIN DOWN"];
			sleep 5;
			cutText [format["Make sure you upgrade your Littlebird somewhere safe and clear of objects."], "PLAIN DOWN"];
		};

};
//deploys by Player2 