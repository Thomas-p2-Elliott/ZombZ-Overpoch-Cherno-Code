private ["_brightness","_pos","_unit","_parachute","_dir","_alt","_para","_vel"];
scriptName "modules_e\Functions\objects\fn_HALO.sqf";
sleep 0.01;

//--- HALO -------------------------------------------------------------------------------------------------------------------------------------
if (typename _this == typename objnull) then {
	
	_unit = _this;
	
	waituntil {(vehicle _unit) iskindof "ParachuteBase" || !isnil {_unit getvariable "bis_fnc_halo_now"}};
	if (!local _unit) exitwith {};

	_parachute = vehicle _unit;
	if (_parachute != _unit) then {
		deletevehicle _parachute;
	}; 

	_dir = ([[0,0,0],velocity _unit] call bis_fnc_dirto);
	_unit setdir _dir;
	[objNull, player, rSwitchMove,"HaloFreeFall_non"] call RE;
	player switchmove "HaloFreeFall_non";

	if (_unit == player) then {

		_brightness = 0.99;
		_pos = position player;

		//bis_fnc_halo_soundLoop = time;	//removed sound testing as enhancement
		//playsound "BIS_HALO_Flapping";	//removed sound testing as enhancement

		bis_fnc_halo_action = _unit addaction [localize "STR_HALO_OPEN_CHUTE","compile\fn_halo.sqf",[],1,true,true,"Eject"];

		bis_fnc_halo_keydown = {
            private ["_key"];
            _key = _this select 1;
			if (_key in (actionkeys 'MoveForward')) then {
				if (bis_fnc_halo_vel < +bis_fnc_halo_velLimit) then {bis_fnc_halo_vel = bis_fnc_halo_vel + bis_fnc_halo_velAdd};
			};
			if (_key in (actionkeys 'MoveBack')) then {
				if (bis_fnc_halo_vel > -bis_fnc_halo_velLimit) then {bis_fnc_halo_vel = bis_fnc_halo_vel - bis_fnc_halo_velAdd};
			};
			if (_key in (actionkeys 'TurnLeft')) then {
				if (bis_fnc_halo_dir > -bis_fnc_halo_dirLimit) then {bis_fnc_halo_dir = bis_fnc_halo_dir - bis_fnc_halo_dirAdd};
			};
			if (_key in (actionkeys 'TurnRight')) then {
				if (bis_fnc_halo_dir < +bis_fnc_halo_dirLimit) then {bis_fnc_halo_dir = bis_fnc_halo_dir + bis_fnc_halo_dirAdd};
			};
		};
		bis_fnc_halo_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown","_this call bis_fnc_halo_keydown;"];

		bis_fnc_halo_vel = 0;
		bis_fnc_halo_velLimit = 0.2;
		bis_fnc_halo_velAdd = 0.03;
		bis_fnc_halo_dir = 0;
		bis_fnc_halo_dirLimit = 1;
		bis_fnc_halo_dirAdd = 0.06;

		[] spawn {
            private ["_vAnim","_hAnim","_anim","_fpsCoef","_time","_dir","_vel","_v","_h","_vLimit","_hLimit"];
            _time = time - 0.1;
			while {alive player && vehicle player == player && isnil {player getvariable "bis_fnc_halo_terminate"}} do {
			
				_fpsCoef = ((time - _time) * 60) / acctime; //Script is optimized for 60 FPS
				_time = time;
				
				bis_fnc_halo_velLimit = 0.2 * _fpsCoef;
				bis_fnc_halo_velAdd = 0.03 * _fpsCoef;
				bis_fnc_halo_dirLimit = 1 * _fpsCoef;
				bis_fnc_halo_dirAdd = 0.06 * _fpsCoef;

				bis_fnc_halo_dir = bis_fnc_halo_dir * 0.98;
				_dir = direction player + bis_fnc_halo_dir;
				player setdir _dir;

				_vel = velocity player;
				bis_fnc_halo_vel = bis_fnc_halo_vel * 0.96;
				player setvelocity [
					(_vel select 0) + (sin _dir * bis_fnc_halo_vel),
					(_vel select 1) + (cos _dir * bis_fnc_halo_vel),
					(_vel select 2)
				];

				_anim = "HaloFreeFall_non";
				_v = bis_fnc_halo_vel;
				_h = bis_fnc_halo_dir;

				_vLimit = 0.1;
				_hLimit = 0.3;
				if ((abs _v) > _vLimit || (abs _h) > _hLimit) then {
					_vAnim = "";
					if (_v > +_vLimit) then {_vAnim = "F"};
					if (_v < -_vLimit) then {_vAnim = "B"};
					_hAnim = "";
					if (_h > +_hLimit) then {_hAnim = "R"};
					if (_h < -_hLimit) then {_hAnim = "L"};
					_anim = "HaloFreeFall_" + _vAnim + _hAnim;
				};

				player playmovenow _anim;
				/*
					if ((time - bis_fnc_halo_soundLoop) > 4.5) then {
						playsound "BIS_HALO_Flapping";						//removed sound testing as enhancement
						bis_fnc_halo_soundLoop = time;
					};
				*/
				sleep 0.01;
			};
			//--- End
			player removeaction bis_fnc_halo_action;
			(finddisplay 46) displayremoveeventhandler ["keydown",bis_fnc_halo_keydown_eh];

			bis_fnc_halo_vel = nil;
			bis_fnc_halo_velLimit = nil;
			bis_fnc_halo_velAdd = nil;
			bis_fnc_halo_dir = nil;
			bis_fnc_halo_dirLimit = nil;
			bis_fnc_halo_dirAdd = nil;
			bis_fnc_halo_action = nil;
			bis_fnc_halo_keydown = nil;
			bis_fnc_halo_keydown_eh = nil;

			if (!alive player) then {
				[objNull, player, rSwitchMove,"adthppnemstpsraswrfldnon_1"] call RE;
				player switchmove "adthppnemstpsraswrfldnon_1";
				player setvelocity [0,0,0];
			};
		};
	} else {
		//--- Open
		[_unit] spawn bis_fnc_halo;
	};
};

//--- PARA -------------------------------------------------------------------------------------------------------------------------------------
if (typename _this == typename []) then {

	_unit = _this select 0;
	if (!local _unit) exitwith {};

	//--- Free fall
	if (count _this == 2) exitwith {
		_alt = 1500;
		_unit setpos [position _unit select 0,position _unit select 1,_alt];
		_unit setvariable ["bis_fnc_halo_now",true];
		_unit spawn bis_fnc_halo;
	};
	//-------------
	
	_para = objnull;
	_vel = [];
	_para = "ParachuteWest" createVehicle position _unit;
	_para setpos position _unit;
	_para setdir direction _unit;
	_vel = velocity _unit;
	_unit moveindriver _para;
	_para lock false;

	bis_fnc_halo_para_dirAbs = direction _para;

	if (_unit == player) then {
		_para setvelocity [(_vel select 0),(_vel select 1),(_vel select 2)*1];

		bis_fnc_halo_para_vel = 0;
		bis_fnc_halo_para_velLimit = 0.5;
		bis_fnc_halo_para_velAdd = 0.01;
		bis_fnc_halo_para_dir = 0;
		bis_fnc_halo_para_dirLimit = 1.5;
		bis_fnc_halo_para_dirAdd = 0.03;

		bis_fnc_halo_para_keydown = {
            private ["_key"];
            _key = _this select 1;

			if (_key in (actionkeys 'MoveForward')) then {
				if (bis_fnc_halo_para_vel < +bis_fnc_halo_para_velLimit) then {bis_fnc_halo_para_vel = bis_fnc_halo_para_vel + bis_fnc_halo_para_velAdd};
			};

			if (_key in (actionkeys 'MoveBack')) then {
				if (bis_fnc_halo_para_vel > -bis_fnc_halo_para_velLimit*0) then {bis_fnc_halo_para_vel = bis_fnc_halo_para_vel - bis_fnc_halo_para_velAdd};
			};

			if (_key in (actionkeys 'TurnLeft')) then {
				if (bis_fnc_halo_para_dir > -bis_fnc_halo_para_dirLimit) then {bis_fnc_halo_para_dir = bis_fnc_halo_para_dir - bis_fnc_halo_para_dirAdd};
			};

			if (_key in (actionkeys 'TurnRight')) then {
				if (bis_fnc_halo_para_dir < +bis_fnc_halo_para_dirLimit) then {bis_fnc_halo_para_dir = bis_fnc_halo_para_dir + bis_fnc_halo_para_dirAdd};
			};
		};
		bis_fnc_halo_para_loop_time = time - 0.1;
		bis_fnc_halo_para_velZ = velocity _para select 2;
		bis_fnc_halo_para_loop = {
            private ["_para","_fpsCoef","_dir"];
            if (!isnil {player getvariable "bis_fnc_halo_terminate"}) exitwith {};
				if (time == bis_fnc_halo_para_loop_time) exitwith {}; //--- FPS too high

				_para = vehicle player;

				_fpsCoef = ((time - bis_fnc_halo_para_loop_time) * 20) / acctime; //Script is optimized for 20 FPS
				bis_fnc_halo_para_loop_time = time;

				bis_fnc_halo_para_velLimit = 0.3 * _fpsCoef;
				bis_fnc_halo_para_velAdd = 0.002 * _fpsCoef;
				bis_fnc_halo_para_dirLimit = 1.5 * _fpsCoef;
				bis_fnc_halo_para_dirAdd = 0.03 * _fpsCoef;

				bis_fnc_halo_para_dir = bis_fnc_halo_para_dir * 0.98;
				bis_fnc_halo_para_dirAbs = bis_fnc_halo_para_dirAbs + bis_fnc_halo_para_dir;
				_para setdir bis_fnc_halo_para_dirAbs;
				_dir = direction _para;

				_para setposasl [
					(getposasl _para select 0) + (sin _dir * (0.1 + bis_fnc_halo_para_vel)),
					(getposasl _para select 1) + (cos _dir * (0.1 + bis_fnc_halo_para_vel)),
					(getposasl _para select 2) - 0.01 - 0.1 * abs bis_fnc_halo_para_vel
				];

				[
					_para,
					(-bis_fnc_halo_para_vel * 75) + 0.5*(sin (time * 180)),
					(+bis_fnc_halo_para_dir * 25) + 0.5*(cos (time * 180))
				] call bis_fnc_setpitchbank;
		};

		bis_fnc_halo_para_mousemoving_eh = (finddisplay 46) displayaddeventhandler ["mousemoving","_this call bis_fnc_halo_para_loop;"];
		bis_fnc_halo_para_mouseholding_eh = (finddisplay 46) displayaddeventhandler ["mouseholding","_this call bis_fnc_halo_para_loop;"];

		sleep 4;

		bis_fnc_halo_para_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown","_this call bis_fnc_halo_para_keydown;"];

		player setvariable ["bis_fnc_halo_terminate",nil];
		waituntil {(position vehicle player select 2) < 2 || !isnil {player getvariable "bis_fnc_halo_terminate"}};
		(finddisplay 46) displayremoveeventhandler ["keydown",bis_fnc_halo_para_keydown_eh];
		(finddisplay 46) displayremoveeventhandler ["mousemoving",bis_fnc_halo_para_mousemoving_eh];
		(finddisplay 46) displayremoveeventhandler ["mouseholding",bis_fnc_halo_para_mouseholding_eh];

		bis_fnc_halo_para_vel = nil;
		bis_fnc_halo_para_velLimit = nil;
		bis_fnc_halo_para_velAdd = nil;
		bis_fnc_halo_para_dir = nil;
		bis_fnc_halo_para_dirLimit = nil;
		bis_fnc_halo_para_dirAdd = nil;
		bis_fnc_halo_para_keydown = nil;
		bis_fnc_halo_para_loop = nil;
		bis_fnc_halo_para_keydown_eh = nil;
		bis_fnc_halo_para_mousemoving_eh = nil;
		bis_fnc_halo_para_mouseholding_eh = nil;
	};
};