_isInCombat = player getVariable["startcombattimer",0]; if (_isInCombat == 1) then { 
    cutText [format["You are in Combat and cannot build a bike."], "PLAIN DOWN"];
} else {
	player playActionNow "Medic";
	r_interrupt = false;
	player removeWeapon "ItemToolbox";
	_dis=10;
	_sfx = "repair";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	
	sleep 6;
	
	_object = "Old_bike_TK_CIV_EP1";
	_dir = getdir (vehicle player);
	_pos = getPos (vehicle player);
	_pos = [(_pos select 0)+4*sin(_dir),(_pos select 1)+4*cos(_dir),0];
	PVDZ_OBJ_DEPLOY = [_pos,player,_object];
	publicVariableServer "PVDZ_OBJ_DEPLOY";
	
	cutText [format["ZombZ: You've used your toolbox to build a bike! How magical!"], "PLAIN DOWN"];
	
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
	
	sleep 10;
	
	cutText [format["Warning: Spawned Bikes do Not Save after server restart!"], "PLAIN DOWN"];
	
};
//bike deploy script by Player2 - OpenDayz Release Coming Soon!