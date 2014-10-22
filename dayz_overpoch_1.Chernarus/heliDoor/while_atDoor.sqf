_unit 			= _this select 0;
_vcl 			= _this select 1;
player setVariable ["NORRN_heliDoor", false, true];

if (!local _unit) exitWith {};

// Add key functions
onTop_KEY_pressed = compile preprocessfile "heliDoor\onTop_KEY_pressed.sqf";
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onTop_KEY_pressed"];

while {true} do
{
	if ((player getVariable "NORRN_heliDoor") || !alive player) exitWith 
	{	
		_unit moveInCargo _vcl;
		sleep 1;
		titletext ["","BLACK IN", 0.1];
		if (!alive player) then {detach player}; 
		_vcl setVariable ["NORRN_mountOn_vcl_pos0", false, true];
	};
	sleep 2;
};

if (true) exitWith {};