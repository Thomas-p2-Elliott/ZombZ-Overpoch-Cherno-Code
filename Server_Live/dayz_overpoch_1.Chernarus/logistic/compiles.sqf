if (!isDedicated) then {

	call compile preprocessFileLineNumbers "logistic\config.sqf";
	call compile preprocessFileLineNumbers format ["logistic\lang\%1_lang.sqf", LOG_CFG_lANG];

	MONI_OBJECT	= compile preprocessFileLineNumbers "logistic\monitor\monitor_object.sqf";
	MONI_ACTION	= compile preprocessFileLineNumbers "logistic\monitor\monitor_action.sqf";
	LOG_OBJ_INIT = compile preprocessFileLineNumbers "logistic\object\init.sqf";
	LOG_LIFT_INIT = compile preprocessFileLineNumbers "logistic\lift\init.sqf";
	LOG_TOW_INIT = compile preprocessFileLineNumbers "logistic\tow\init.sqf";
	
	LOG_FNCT_DETACH_AND_SAVE = {
			private ["_object"]; 
			_object = (_this select 0);
			_object setVelocity [0,0,0];
			detach _object;
			if (!isNil "dayz_zombieSpeak" && !isNil "dayz_HungerThirst" && !isNil "player_alertZombies" ) then {			
				PVDZE_veh_Update = [_object,"all"];
				publicVariableServer "PVDZE_veh_Update";
				[10,10] call dayz_HungerThirst;
				player playActionNow "Medic";
				[player,"repair",0,false,20] call dayz_zombieSpeak;
				[player,20,true,(getPosATL player)] spawn player_alertZombies;
			}else{
				player playActionNow "Medic";
			};
	};

	LOG_FNCT_LOCKED = { 
		private ["_return","_target"]; 
		_target = (_this select 0);
		_return = true; 
			if ( !(LOG_CFG_ALLOW_LOCKED) && (locked _target) ) then { 
				_return = false; 
			};
		_return
	};

	LOG_P2FNCT_PLOTNEAR = {
		private ["_return","_distance","_findNearestPoles","_findNearestPole","_IsNearPlot","_nearestPole","_ownerID","_friendlies","_playerID"];
		_target = (_this select 0);
		_return = true;
		_playerID = (getPlayerUID player);
		if !(P2LOG_CFG_ALLOW_FROMPLOT) then  { 	
			_pos = getPosASL _target;

			_distance = DZE_PlotPole select 0;
			
			// check for near plot
			_findNearestPoles = nearestObjects [_pos, ["Plastic_Pole_EP1_DZ"], _distance];
			_findNearestPole = [];

			{
				if (alive _x) then {
					_findNearestPole set [(count _findNearestPole),_x];
				};
			} count _findNearestPoles;

			_IsNearPlot = count (_findNearestPole);

			if(_IsNearPlot == 0) then {

				// its okay! no plots around
				//return true, they can tow or lift
				_return = true;

			} else {
				// Since there are plots nearby we check for ownership && then for friend status
				_return = false;
				// check nearby plots ownership && then for friend status
				_nearestPole = _findNearestPole select 0;

				// Find owner
				_ownerID = _nearestPole getVariable ["ownerPUID","0"];
 
				if(_playerID == _ownerID) then { 
					// owner can tow or lift here
					_return = true;
				} else {
					_friendlies		= player getVariable ["friendlyTo",[]];
					// check if friendly to owner
					if(_ownerID in _friendlies) then {
						//is friendly to owner, they can tow or lift
						_return = true;
					};
				};
			};
		} else {
			_return = true;
		};

		_return
	};
	
	LOG_FNCT_CHAINING = { 
		private ["_return","_target"];
		_target = (_this select 0);
		_return = true; 
		if !(LOG_CFG_ALLOW_CHAINING) then  { 	
			if ( ( (_this select 1) == 1 ) && !( isNull (_target getVariable "LOG_moves_by") || (!alive (_target getVariable "LOG_moves_by")) ) ) then {_return = false;};	
			if ( (_this select 1) == 2 && !isNull (_target getVariable "LOG_trailer") ) then { _return = false;};
		};
		_return 
	};
	
	LOG_FNCT_GETPOS = {
		private "_pos";
		if (isNil {_this select 0}) exitWith {[0,0,0]};
		_thingy = _this select 0;
		_pos = getPosASL _thingy;
		if !(surfaceIsWater _pos) then { _pos =  ASLToATL _pos;};
		_pos
	};
	
	LOG_OBJECT_MOVES = objNull;
	LOG_OBJECT_SELECTION = objNull;
	LOG_OBJECT_ADDACTION = objNull;
	LOG_INPROGRESS = false;
	LOG_LOAD_MOVES_VALID = false;
	LOG_LOAD_SELECTION_VALID = false;
	LOG_CONTENT_VALID = false;
	LOG_TRAILER_MOVE_VALID = false;
	LOG_TRAILER_SELECT_VALID = false;
	LOG_HELI_LIFT_VALID = false;
	LOG_HELI_DROP_VALID = false;
	LOG_OBJECT_TRAILER_VALID = false;
	LOG_DETACH_VALID = false;

	
	COLOR_DEFAULT = [(51/255),(181/255),(229/255),1];
	COLOR_SUCCESS = [(153/255),(204/255),0,1];
	COLOR_ERROR  = [1,(68/255),(68/255),1];
	
	SAM_SAYS = { 
				private ["_message","_color"];
				_message = _this select 0;
				_color = _this select 1;
				taskHint [format[_message], _color, "taskNew"];
				cutText [_message,"PLAIN",0];
				sleep 5;
				cutText ["","PLAIN",0];
			};
	
LOG_READY = true;
};