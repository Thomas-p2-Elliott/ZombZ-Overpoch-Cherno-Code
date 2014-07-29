private["_obj","_objectID","_objectUID","_dis","_sfx"];

_isInCombat = player getVariable["startcombattimer",0]; if (_isInCombat == 1) then { 
    cutText [format["You are in Combat and cannot upgrade your BTR."], "PLAIN DOWN"];
	sleep 2;
	cutText [format["Make sure you upgrade your BTR somewhere safe and clear of objects."], "PLAIN DOWN"];
} else {

	_has1 = "PartGeneric" in magazines player;

	if (_has1) then {
	
			player removeMagazine "PartGeneric";
			sleep 0.5;
			_has2 = "PartGeneric" in magazines player;
			
			if (_has2) then {
			
				_obj = _this select 3;
				
				//they're ready.
				player removeAction s_player_upgradehumvee;
				player playActionNow "Medic";
				r_interrupt = false;
				player removeWeapon "ItemToolbox";
				player removeMagazine "PartGeneric";
				
				_dis=5;
				_sfx = "repair";
				[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
				[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
				
				sleep 9;
				deleteVehicle _obj;
				sleep 1;
				
				_object = "HMMWV_DZ";
				_dir = getdir (vehicle player);
				_pos = getPos (vehicle player);
				_pos = [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
				PVDZ_OBJ_DEPLOY = [_pos,player,_object];
				publicVariableServer "PVDZ_OBJ_DEPLOY";
				
				cutText [format["You've upgraded to a HMMWV!"], "PLAIN DOWN"];
				
				r_interrupt = false;
				player switchMove "";
				player playActionNow "stop";
				
				sleep 5;
								
				cutText [format["Warning: Spawned HMMWV do Not Save after server restart!"], "PLAIN DOWN"];
			
			} else {
				player addMagazine "PartGeneric";
				cutText [format["You need 2 Scrap Metal to build this."], "PLAIN DOWN"];
				sleep 5;
				cutText [format["Make sure you build your HMMWV somewhere safe and clear of objects."], "PLAIN DOWN"];
			};
		} else {
			cutText [format["You need 2 Scrap Metal to build this."], "PLAIN DOWN"];
			sleep 5;
			cutText [format["Make sure you build your HMMWV somewhere safe and clear of objects."], "PLAIN DOWN"];
		};

};
//deploy gyro by Player2 - OpenDayz Release Coming Soon!