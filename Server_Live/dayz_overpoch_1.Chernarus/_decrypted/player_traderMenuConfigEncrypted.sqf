P2DZ_decryptFunction = {
	private["_in","_id","_o"];

	_id = 0;

	_in = _this;

	_in = [_in,"c",","] call {	private["_str","_old","_new","_out","_tmp","_jm","_la","_lo","_ln","_i"];
	_str=_this select 0;
	_arr=toArray(_str);
	_la=count _arr;
	_old=_this select 1;
	_new=_this select 2;
	_na=[_new] call {
		private["_in","_i","_arr","_out"];
		_in=_this select 0;
		_arr = toArray(_in);
		_out=[];
		for "_i" from 0 to (count _arr)-1 do {
			_out=_out+[toString([_arr select _i])];
		};
		_out
	};
	_lo=[_old] call {	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out};
	_len=count (_arr);
	_len};
	_ln=[_new] call {	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out};
	_len=count (_arr);
	_len};
	_out="";
	for "_i" from 0 to (count _arr)-1 do {
		_tmp="";
		if (_i <= _la-_lo) then {
			for "_j" from _i to (_i+_lo-1) do {
				_tmp=_tmp + toString([_arr select _j]);
			};
		};
		if (_tmp==_old) then {
			_out=_out+_new;
			_i=_i+_lo-1;
		} else {
			_out=_out+toString([_arr select _i]);
		};
	};
	_out};

	_in = call compile ("[" + _in + "]");
  
	{
		_in set [_id, ((_x - (count _in))) - 10];
 		_id = _id + 1;
	} count _in; 

	_o = toString(_in);
	_o
};

z_getWeaponName = {
	private["_input","_index","_output"];
	_output = "Unknown Item";	
	_input = "";
	_index = 0;
	_input = _this;
	_input = toArray(_input);
	{
		_input set [_index, ((_x + (count _input))) + 10];
		_index = _index + 1;
	} count _input;
	_input = str _input;
	_input = [_input,"[",""""] call {
	private["_str","_old","_new","_out","_tmp","_jm","_la","_lo","_ln","_i"];
	_str=_this select 0;
	_arr=toArray(_str);
	_la=count _arr;
	_old=_this select 1;
	_new=_this select 2;
	_na=[_new] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_lo=[_old] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_ln=[_new] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_out="";
	for "_i" from 0 to (count _arr)-1 do {
		_tmp="";
		if (_i <= _la-_lo) then {
			for "_j" from _i to (_i+_lo-1) do {
				_tmp=_tmp + toString([_arr select _j]);
			};
		};
		if (_tmp==_old) then {
			_out=_out+_new;
			_i=_i+_lo-1;
		} else {
			_out=_out+toString([_arr select _i]);
		};
	};
	_out
};
	_input = [_input,"]",""""] call {
	private["_str","_old","_new","_out","_tmp","_jm","_la","_lo","_ln","_i"];
	_str=_this select 0;
	_arr=toArray(_str);
	_la=count _arr;
	_old=_this select 1;
	_new=_this select 2;
	_na=[_new] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_lo=[_old] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_ln=[_new] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_out="";
	for "_i" from 0 to (count _arr)-1 do {
		_tmp="";
		if (_i <= _la-_lo) then {
			for "_j" from _i to (_i+_lo-1) do {
				_tmp=_tmp + toString([_arr select _j]);
			};
		};
		if (_tmp==_old) then {
			_out=_out+_new;
			_i=_i+_lo-1;
		} else {
			_out=_out+toString([_arr select _i]);
		};
	};
	_out
};
	_input = [_input,"""",""] call {
	private["_str","_old","_new","_out","_tmp","_jm","_la","_lo","_ln","_i"];
	_str=_this select 0;
	_arr=toArray(_str);
	_la=count _arr;
	_old=_this select 1;
	_new=_this select 2;
	_na=[_new] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_lo=[_old] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_ln=[_new] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_out="";
	for "_i" from 0 to (count _arr)-1 do {
		_tmp="";
		if (_i <= _la-_lo) then {
			for "_j" from _i to (_i+_lo-1) do {
				_tmp=_tmp + toString([_arr select _j]);
			};
		};
		if (_tmp==_old) then {
			_out=_out+_new;
			_i=_i+_lo-1;
		} else {
			_out=_out+toString([_arr select _i]);
		};
	};
	_out
};
	_output = [_input,",","c"] call {
	private["_str","_old","_new","_out","_tmp","_jm","_la","_lo","_ln","_i"];
	_str=_this select 0;
	_arr=toArray(_str);
	_la=count _arr;
	_old=_this select 1;
	_new=_this select 2;
	_na=[_new] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_lo=[_old] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_ln=[_new] call {
	private["_in","_arr","_len"];
	_in=_this select 0;
	_arr=[_in] call {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};
	_len=count (_arr);
	_len
};
	_out="";
	for "_i" from 0 to (count _arr)-1 do {
		_tmp="";
		if (_i <= _la-_lo) then {
			for "_j" from _i to (_i+_lo-1) do {
				_tmp=_tmp + toString([_arr select _j]);
			};
		};
		if (_tmp==_old) then {
			_out=_out+_new;
			_i=_i+_lo-1;
		} else {
			_out=_out+toString([_arr select _i]);
		};
	};
	_out
};
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