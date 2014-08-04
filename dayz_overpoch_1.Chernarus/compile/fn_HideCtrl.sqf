
private ["_display"];
disableSerialization;

_display = uiNamespace getVariable "ATM_Altimeter";

{ (_display displayCtrl _x) ctrlShow false; } forEach [
	5100,
	5101,
	5102,
	5103,
	5104,
	5105,
	5106,
	5107,
	5108,
	5109,
	5110
];
uiNamespace setVariable ['ATM_Altimeter', false];