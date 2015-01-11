private ["_long"];
_long = ;
private ["_pos","_cariA","_cariM","_cariR","_cariZ","_target"];_target = _this select 0;
_pos = getPosATL _target;
_cariZ = ["z_hunter","z_suit2","z_teacher","z_villager1","z_villager2","z_villager3","z_worker1","z_worker2","z_worker3","zZombie_Base"];for "_i" from 0 to 5 do {
	_cariR = _cariZ call BIS_fnc_selectRandom;
	_cariA = createAgent [_cariR,_pos,[],5,"NONE"];
	_cariM = getPosATL _cariA;
	[_cariM,_cariA] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";
};systemChat format ["Created zeds around %1",name _target];