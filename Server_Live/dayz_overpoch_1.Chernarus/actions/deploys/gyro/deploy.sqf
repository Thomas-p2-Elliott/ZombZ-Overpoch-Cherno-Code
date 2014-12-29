
private ["_dis","_sfx","_object","_dir","_pos","_has1","_has2","_isInCombat"];
_isInCombat = player getVariable["startcombattimer",0]; if (_isInCombat == 1) then { 
    cutText [format["You are in Combat and cannot build a helicopter."], "PLAIN DOWN"];
	sleep 2;
	cutText [format["Make sure you build your helicopter somewhere safe and clear of objects."], "PLAIN DOWN"];
} else {

	_has1 = "PartEngine" in magazines player;
	_has2 = "PartVRotor" in magazines player;
	
	if (_has2 && _has1) then {
	
			//they're ready.
			player playActionNow "Medic";
			r_interrupt = false;
			player removeWeapon "ItemToolbox";
			player removeMagazine "PartEngine";
			player removeMagazine "PartVRotor";
			_dis=5;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
			
			sleep 10;
			
			_object = "CSJ_GyroC";
			_dir = getdir (vehicle player);
			_pos = getPos (vehicle player);
			_pos = [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
			PVDZ_OBJ_DEPLOY = [_pos,player,_object];
			publicVariableServer "PVDZ_OBJ_DEPLOY";

			
			cutText [format["You've built a helicopter!"], "PLAIN DOWN"];
			
			r_interrupt = false;
			player switchMove "";
			player playActionNow "stop";
			
			sleep 15;
						
			cutText [format["Warning: Spawned Choppers do Not Save after server restart!"], "PLAIN DOWN"];
			
		} else {
			cutText [format["You need an Engine and a Main Rotor to build this."], "PLAIN DOWN"];
			sleep 5;
			cutText [format["Make sure you build your helicopter somewhere safe and clear of objects."], "PLAIN DOWN"];
		};

};
//deploy gyro by Player2 - OpenDayz Release Coming Soon!