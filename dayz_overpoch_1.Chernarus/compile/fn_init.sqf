if(isDedicated) exitWith {};

[] spawn {
	waitUntil {!isNull player && player == player};
	waitUntil{!isNil "BIS_fnc_init"};
	waitUntil {!(isNull (findDisplay 46))};

	uiNamespace setVariable ["altiHudOpened",false];
};