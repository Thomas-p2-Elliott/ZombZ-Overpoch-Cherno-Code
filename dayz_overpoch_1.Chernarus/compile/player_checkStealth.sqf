private ["_vel","_speed","_pos","_scalePose","_scaleMvmt","_scaleLight","_anim","_anim4","_initial","_scaleSound","_nearFlare","_scaler","_nearLight","_nearFire","_building","_isPlayerInside","_audial","_isWater","_isPZombie"];
_vel = velocity (vehicle player);
_speed = (_vel distance [0,0,0]);
_pos = getPosATL player;
_scalePose = 0.7;
_scaleMvmt = 0.2;
_scaleLight = 0.5;

_anim = animationState player;
_anim4 = toArray _anim;
_anim4 resize 4;
_anim4 = toString _anim4;

dayz_isKneeling = false;
dayz_isCrawling = false;

if (["pknl",_anim] call fnc_inString) then {
	_scaleMvmt = 0.1;	
	_scalePose = 0.4;
	dayz_isKneeling = true;
} else {
	if (["ppne",_anim] call fnc_inString) then {
		_scaleMvmt = 0.1;
		_scalePose = 0.1;
		dayz_isCrawling = true;
	};
};

if (_anim4 == "aswm") then {
	_scaleMvmt = 0.3;
	dayz_isSwimming = true;
	_isWater = surfaceIsWater _pos;
	if(!_isWater) then {
		if (vehicle player == player) then {
			[objNull, player, rSwitchMove,""] call RE;
			player playActionNow "stop";
		};
		sleep 10;
		dayz_isSwimming = false;
	};
} else {
	dayz_isSwimming = false;
};

_initial = 60;
_scaleLight = 1; //2 = daylight
dayz_scaleLight = _scaleLight;
_scaleSound = 0.3; //1 = normal sound
_scaleLight = _scaleLight max 0;

if (["grass",dayz_surfaceType] call fnc_inString) then {
	_initial = _initial * 0.75;
	_scaleMvmt = _scaleMvmt - 0.05;
} else {
	if (["forest",dayz_surfaceType] call fnc_inString) then {
		_initial = _initial * 0.5;
		_scaleMvmt = _scaleMvmt - 0.1;
	} else {
		if (["concrete",dayz_surfaceType] call fnc_inString) then {
			_initial = _initial * 1.2;
			_scaleMvmt = _scaleMvmt + 0.1;
		} else {
			if (["rock",dayz_surfaceType] call fnc_inString) then {
				_initial = _initial * 1.1;
				_scaleMvmt = _scaleMvmt + 0.05;
			};
		};
	};
};

if (isOnRoad _pos) then {
	_initial = _initial * 1.3;
	_scaleMvmt = _scaleMvmt + 0.2;
};

_building = nearestObject [(vehicle player), "Building"];
_isPlayerInside = [(vehicle player),_building] call fnc_isInsideBuilding;
if (_isPlayerInside) then {
	_initial = 5;
};

_audial = 			round(_speed * dayz_surfaceNoise * _scaleMvmt * _scaleSound);
if ((_audial > DAYZ_disAudial) || ((time - dayz_firedCooldown) > 0.3)) then {
	DAYZ_disAudial = _audial;
};

DAYZ_disVisual = 	(round((_initial + (_speed * 3)) * _scalePose * _scaleLight));
