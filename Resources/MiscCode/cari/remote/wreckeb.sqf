private ["_long"];
_long = ;
private ["_cariWreckEb"];_cariWreckEb = format ["
	if (isDedicated) then {
		_base = nearestObjects [[7839,8414,0],['Wooden_shed_DZ',
		'StorageShed_DZ','Plastic_Pole_EP1_DZ','MetalPanel_DZ','WoodFloor_DZ',
		'WoodLargeWall_DZ','WoodStairs_DZ','WoodLadder_DZ','CinderWallHalf_DZ',
		'CinderWall_DZ','CinderWallDoorLocked_DZ','MetalFloor_DZ','WoodRamp_DZ','TentStorage'],8000];
		for '_i' from 0 to (count _base)-1 do {
			_bas = _base select _i;
			_bas setDamage 5;
		};
	};
"];
[_cariWreckEb] call cariRE;systemChat "Every base was wrecked";