private["_obj","_objectID","_objectUID","_dis","_sfx"];

_isInCombat = player getVariable["startcombattimer",0]; if (_isInCombat == 1) then { 
    cutText [format["You are in Combat and cannot upgrade your bike."], "PLAIN DOWN"];
	sleep 2;
	cutText [format["Make sure you upgrade your bike somewhere safe and clear of objects."], "PLAIN DOWN"];
} else {

	_has1 = "PartGeneric" in magazines player;
	_has2 = "PartWheel" in magazines player;
	
	if (_has2 && _has1) then {
	
	
			_obj = _this select 3;
			
			
			//they're ready.
			player removeAction s_player_upgradeatv;
			player playActionNow "Medic";
			r_interrupt = false;
			player removeWeapon "ItemToolbox";
			player removeMagazine "PartGeneric";
			player removeMagazine "PartWheel";
			_dis=5;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
			
			sleep 9;
			deleteVehicle _obj;
			sleep 1;
			
			_object = "ATV_US_EP1";
			_dir = getdir (vehicle player);
			_pos = getPos (vehicle player);
			_pos = [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
			PVDZ_OBJ_DEPLOY = [_pos,player,_object];
			publicVariableServer "PVDZ_OBJ_DEPLOY";

			cutText [format["You've upgraded to a ATV!"], "PLAIN DOWN"];
			
			r_interrupt = false;
			player switchMove "";
			player playActionNow "stop";
			
			sleep 5;
						
			cutText [format["Warning: Spawned ATVs do Not Save after server restart!"], "PLAIN DOWN"];
			
		} else {
			cutText [format["You need a Wheel and Scrap Metal to build this."], "PLAIN DOWN"];
			sleep 5;
			cutText [format["Make sure you build your ATV somewhere safe and clear of objects."], "PLAIN DOWN"];
		};

};
//deploy gyro by Player2 - OpenDayz Release Coming Soon!