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