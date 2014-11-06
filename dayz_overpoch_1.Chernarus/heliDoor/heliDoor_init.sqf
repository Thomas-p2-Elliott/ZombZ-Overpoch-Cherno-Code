_vcl = _this select 0;
_typeOfVeh = typeOf _vcl;
_doneStuff = false;

if (isServer) then
{

	if (_typeOfVeh in ["MH60S","MH60S_DZ","MH60S_DZE","UH1Y","UH1Y_DZ","UH1Y_DZE"] && !(_doneStuff)) then {
		_vcl setVariable ["NORRN_mountOn_vcl_pos0", false, true]; //Right Door / Rear Door
		_vcl setVariable ["NORRN_mountOn_vcl_pos1", false, true]; //Left Door / Front Door
		_doneStuff = true;
	};

	if (_typeOfVeh in ["V3S_CIV"] && !(_doneStuff)) then {
		_vcl setVariable ["NORRN_mountOn_vcl_pos0", false, true]; 	//Front Right Kneeling
		_vcl setVariable ["NORRN_mountOn_vcl_pos1", false, true]; 	//Front Left Kneeling
		//_vcl setVariable ["NORRN_mountOn_vcl_pos2", false, true]; //Front Center Standing
		//_vcl setVariable ["NORRN_mountOn_vcl_pos3", false, true]; //Center Left Kneeling
		//_vcl setVariable ["NORRN_mountOn_vcl_pos4", false, true]; //Center Right Kneeling
		//_vcl setVariable ["NORRN_mountOn_vcl_pos5", false, true]; //Rear Left Kneeling
		//_vcl setVariable ["NORRN_mountOn_vcl_pos6", false, true]; //Rear Right Kneeling
		_doneStuff = true;
	};

	if (_typeOfVeh in ["MH6J_EP1"] && !(_doneStuff)) then {
		_vcl setVariable ["NORRN_mountOn_vcl_pos0", false, true]; 	//Left Front
		_vcl setVariable ["NORRN_mountOn_vcl_pos1", false, true]; 	//Right Front
		//_vcl setVariable ["NORRN_mountOn_vcl_pos2", false, true]; //Left Mid
		//_vcl setVariable ["NORRN_mountOn_vcl_pos3", false, true]; //Right Mid
		//_vcl setVariable ["NORRN_mountOn_vcl_pos4", false, true]; //Left Rear 
		//_vcl setVariable ["NORRN_mountOn_vcl_pos5", false, true]; //Right Rear
		_doneStuff = true;
	};

	if (_typeOfVeh in ["TT650_Ins","TT650_Gue","TT650_TK_EP1","TT650_TK_CIV_EP1","TT650_Civ"] && !(_doneStuff)) then {
		_vcl setVariable ["NORRN_mountOn_vcl_pos0", false, true]; 	//Reverse Fire Sitting
		_doneStuff = true;
	};

	sleep 2;
};

diag_log(format["P2DriveByDebug: HeliDoorInit - Vehicle: %1",_vcl]);

if (_typeOfVeh in ["TT650_Ins","TT650_Gue","TT650_TK_EP1","TT650_TK_CIV_EP1","TT650_Civ"]) then {
	_nul  = [_vcl] execVM "heliDoor\mount_vcl_init.sqf";

	diag_log(format["P2DriveByDebug: HeliDoorInit - Bike: %1",_vcl]);

} else {
	_nul  = [_vcl] execVM "heliDoor\mount_vcl_init.sqf";
	_nul  = [_vcl] execVM "heliDoor\mount_vcl_init1.sqf";
};

