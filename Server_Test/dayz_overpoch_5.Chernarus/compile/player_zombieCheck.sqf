private ["_listTalk","_eyeDir","_attacked","_continue","_type","_chance","_last","_refObj","_inAngle","_tPos","_zPos","_cantSee","_entHeight","_delta","_targets","_pHeight","_lowBlood","_dist"];
_refObj = vehicle player;
_listTalk = ([_refObj] call FNC_GetPos) nearEntities ["zZombie_Base",80];
_pHeight = (getPosATL _refObj) select 2;
_attacked = false;
{
	_continue = true;
	_type = "zombie";

	if (alive _x && _continue) then {


			
		_dist = (_x distance _refObj);
			
		_chance = 1;
		if ((_dist < dayz_areaAffect) && !(animationState _x == "ZombieFeed")) then {

			[_x,"attack",(_chance),true] call dayz_zombieSpeak;
			_last = _x getVariable["lastAttack",0];
			_entHeight = (getPosATL _x) select 2;
			_delta = _pHeight - _entHeight;
			//1 = default zed attackspeed, 2 = p2mod
			//
			if ( ((time - _last) > p2_zAttackSpeed) && ((_delta < 1.5) && (_delta > -1.5)) ) then
			{
				[_x, _type] spawn player_zombieAttack;
				_x setVariable["lastAttack",time];
			};
			_attacked = true;
		} else {
			if (speed _x < 4) then {
				[_x,"idle",(_chance + 4),true] call dayz_zombieSpeak;
			} else {
				[_x,"chase",(_chance + 3),true] call dayz_zombieSpeak;
			};
		};
		//Noise Activation
		_targets = _x getVariable ["targets",[]];
		if (!(_refObj in _targets) && !isNull _refObj) then {
			if (_dist < DAYZ_disAudial) then {
				if (DAYZ_disAudial > 80) then {
					
					_targets set [count _targets, (driver _refObj)];
					_x setVariable ["targets",_targets,true];										
				} else {
					_cantSee = [_x,_refObj] call dayz_losCheck;
					if (!_cantSee) then
					{
						_targets set [count _targets,(driver _refObj)];
						_x setVariable ["targets",_targets,true];
					}
					else
					{
						if (_dist < (DAYZ_disAudial / 2)) then
						{
							_targets set [count _targets,(driver _refObj)];
							_x setVariable ["targets",_targets,true];
						};
					};
				};
			};
		};
		//Sight Activation
		_targets = _x getVariable ["targets",[]];
		if (!(_refObj in _targets) && !isNull _refObj) then {
			if (_dist < DAYZ_disVisual) then {
						
				_tPos = (getPosASL _refObj);
				_zPos = (getPosASL _x);
				_eyeDir = direction _x;
				_inAngle = [_zPos,_eyeDir,p2_zEyeAngle,_tPos] call fnc_inAngleSector;
				if (_inAngle) then {
					_cantSee = [_x,_refObj] call dayz_losCheck;
					if (!_cantSee) then {
						_targets set [count _targets,(driver _refObj)];
						_x setVariable ["targets",_targets,true];
					};
				};
			};
		};
	};
} count _listTalk;

if (_attacked) then {
	if (r_player_unconscious) then {
		[_refObj,"scream",3,false] call dayz_zombieSpeak;
	} else {
		_lowBlood = (r_player_blood / r_player_bloodTotal) < 0.5;
		if (_lowBlood) then {
			dayz_panicCooldown = time;
			[_refObj,"panic",3,false] call dayz_zombieSpeak;
		};
	};
};