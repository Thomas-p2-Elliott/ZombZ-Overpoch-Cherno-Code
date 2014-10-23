P2DZ_decryptFunction = {
	private["_input","_index","_output"];
	_output = "Unknown Item";	
	_input = "";
	_index = 0;

	_input = _this;

	_input = [_input,"c",","] call KRON_Replace;

	_input = [_input,"""",""] call KRON_Replace;

	_input = call compile ("[" + _input + "]");
 
	{
		_input set [_index, ((_x - (count _input))) - 10];
 		_index = _index + 1;
	} count _input; 

	_output = toString(_input);
	_output = [_output," ",""] call KRON_Replace;

	_output
};

p2_gv = {
	if (typeName _this != typeName []) exitWith {
		0
	};
	if (((count _this) < 1) || ((str _this) == '[]')) exitWith {
		0
	};
	if ((typeName (_this select 0)) != typeName true) exitWith {
		0
	};
	if ((typeName (_this select 1)) != typeName objNull) exitWith {
		0
	};
	if (isNull (_this select 1)) exitWith {
		0
	};

	if (_this select 0) then {
		private['_zGold','_lastTime'];
		_zGold = ((_this select 1) getVariable ['ZombZGold', nil]);
		if (!isNil '_zGold') then {  
			_zGold
		} else {
			_lastTime = diag_tickTime;  
			waitUntil {
			  	if ((diag_tickTime - _lastTime) > 0.5) then { 
			  		_zGold = 0;
			  	};
			  	sleep 0.01;
		 		!isNil '_zGold'
			};
			_zGold 
		};
	} else {
		private['_zGold'];
		_zGold = ((_this select 1) getVariable ['ZombZGold', nil]);
		if (!isNil '_zGold') then {
			_zGold
		} else {
			0
		};
	};
};

p2_gc = {
	private['_input','_zGold'];	
	if (typeName _this != typeName []) exitWith {
		0
	};
	if (((count _this) < 1) || ((str _this) == '[]')) exitWith {
		0
	};

	if ((typeName (_this select 0)) != typeName objNull) exitWith {
		0
	};
	if ((typeName (_this select 1)) != typeName 0) exitWith {
		0
	};

	_zGold = [false,player] call p2_gv; 
	_input = _this;

	P2DZE_plr_giveChange = [_input select 0,_input select 1];
	publicVariableServer 'P2DZE_plr_giveChange';
};