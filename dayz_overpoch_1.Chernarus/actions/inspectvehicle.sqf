private ["_vehicle","_part","_hitpoint","_type","_selection","_array"];
disableSerialization;

_array	= _this select 3;
_vehicle	= _array select 0;
_hitpoints	= _array select 1;
_damage	= damage _vehicle;

_type = typeOf _vehicle;
_text = getText (missionConfigFile >> "CfgVehicles" >> _type >> "displayName");

//Engineering
{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
dayz_myCursorTarget = objNull;

createDialog "RscDisplayInspectVehicle";

_ctrlTitle = ((uiNamespace getVariable 'ZombZ_vehicleInspect') displayCtrl 6661);

_ctrlTitle ctrlSetText format["Vehicle Inspection: %1", _text];

_damageOverallPercent = round((1 - _damage) * 100);
_ctrlOverall = ((uiNamespace getVariable 'ZombZ_vehicleInspect') displayCtrl 6665);
_ctrlOverall ctrlSetText format["General Vehicle Health: %1%2", _damageOverallPercent, '%'];

_ctrlVehicleOut = ((uiNamespace getVariable 'ZombZ_vehicleInspect') displayCtrl 6663);
_ctrlVehicleOut ctrlSetText "img\inspection_skoda_outer.paa";

_ctrlVehicleIn = ((uiNamespace getVariable 'ZombZ_vehicleInspect') displayCtrl 6664);
_ctrlVehicleIn ctrlSetText "img\inspection_skoda_inner.paa";

if (_damage > 0.6) then {
	_ctrlVehicleIn ctrlSetTextColor [0.565, 0.000, 0.000, 1]; // Red
} else {
	if (_damage > 0.3) then {
		_ctrlVehicleIn ctrlSetTextColor [0.654, 0.557, 0.169, 1]; // Yellow
	} else {
		_ctrlVehicleIn ctrlSetTextColor [0.254, 0.635, 0.121, 1]; // Green
	};
};

_ctrlText = ((uiNamespace getVariable 'ZombZ_vehicleInspect') displayCtrl 6662);


//diag_log(format["PARTS FOR: %1", _text]);

_repairText = "";
{
	_damage = [_vehicle,_x] call object_getHit;
	_damagePercent = round((1 - _damage) * 100);

	_fullPartName = toArray _x;
	_humanPartName = [];
	for "_i" from 3 to ((count _fullPartName) - 1) do {_humanPartName set [count _humanPartName,(_fullPartName select _i)]};

	_humanPartNameString = toString _humanPartName;

	if (["HRotor",_x,false] call fnc_inString) then {
		_humanPartNameString = "Main Rotor Assembly";
	};

	if (["VRotor",_x,false] call fnc_inString) then {
		_humanPartNameString = "Rear Rotor Assembly";
	};

	if (["Wheel",_x,false] call fnc_inString) then {
		_partNoWheel = [];
		for "_i" from 0 to ((count _humanPartName) - 6) do {_partNoWheel set [count _partNoWheel,(_humanPartName select _i)]};
		_partNoWheelString = toString _partNoWheel;

		_partNoWheelString = switch (_partNoWheelString) do {
			default {_partNoWheelString};
			case "LF": {"Left Front"};
			case "RF": {"Right Front"};
			case "LF2": {"Left Front 2nd"};
			case "RF2": {"Right Front 2nd"};
			case "LB": {"Left Back"};
			case "RB": {"Right Back"};
			case "LM": {"Left Middle"};
			case "RM": {"Right Middle"};
			case "F": {"Front"};
			case "B": {"Back"};
		};

		_humanPartNameString = format["%1 Wheel", _partNoWheelString];
	};

	if ( _damagePercent < 100 ) then {
		_tmpText = format["%1%2%3 %4\n", _repairText, _damagePercent, '%', _humanPartNameString];
		_repairText = _tmpText;
	};
	//diag_log(format["PART: %1", _x]);
	
} forEach _hitpoints;

_ctrlText ctrlSetText _repairText;

if (P2DZE_deugVehIns) then {
	diag_log(format["P2DEBUG: ctrl 6661: %2 VehInspect: Vehicle Inspection: %1", _text, _ctrlTitle]);
	diag_log(format["P2DEBUG: ctrl 6665: %3 General Vehicle Health: %1%2", _damageOverallPercent, '%',_ctrlOverall]);
	diag_log(format["P2DEBUG: ctrl 6663: %1 img\inspection_skoda_outer.paa",_ctrlVehicleOut]);
	diag_log(format["P2DEBUG: ctrl 6664: %1 img\inspection_skoda_inner.paa",_ctrlVehicleIn]);
	diag_log(format["P2DEBUG: ctrl 6662: %1 _repairText: %2",_ctrlText, _repairText]);
};