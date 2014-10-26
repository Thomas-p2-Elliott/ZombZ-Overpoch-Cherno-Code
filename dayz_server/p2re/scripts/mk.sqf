private [ "_rExec" ];
_rExec = compile ("
waitUntil {!isNil ""dayz_gui""};

_bank1 = createMarker [""Police Checkpoint"", [4048.4211, 2613.1758, 2]];
_bank1 setMarkerText ""Police Checkpoint"";
_bank1 setMarkerType ""Defend"";
_bank1 setMarkerColor ""ColorRedAlpha"";
bank1 = _bank1;

_bank2 = createMarker [""Drozhina"", [3847.0142, 4787.8877, 1]];
_bank2 setMarkerText ""Ruins of Drozhina"";
_bank2 setMarkerType ""Defend"";
_bank2 setMarkerColor ""ColorRedAlpha"";
bank2 = _bank2;

_bank3 = createMarker [""Klen"", [11465.664, 11314.625, 2]];
_bank3 setMarkerText ""Free City Of Klen"";
_bank3 setMarkerType ""Defend"";
_bank3 setMarkerColor ""ColorRedAlpha"";
bank3 = _bank3;

_bank4 = createMarker [""ZombZ International"", [10153.31, 1710.7061, 1]];
_bank4 setMarkerText ""ZombZ International Airbase"";
_bank4 setMarkerType ""Defend"";
_bank4 setMarkerColor ""ColorRedAlpha"";
bank4 = _bank4;

_bank5 = createMarker [""Novy Lug"", [9577.7266, 11299.333, 1]];
_bank5 setMarkerText ""Smugglers Den"";
_bank5 setMarkerType ""Defend"";
_bank5 setMarkerColor ""ColorRedAlpha"";
bank5 = _bank5;

_bank6 = createMarker [""Survivors Den"", [4814.814, 10067.607, 1]];
_bank6 setMarkerText ""Survivors Den"";
_bank6 setMarkerType ""Defend"";
_bank6 setMarkerColor ""ColorRedAlpha"";
bank6 = _bank6;

_bank7 = createMarker [""Pulkovo"", [4861.4014, 5633.7153, 1]];
_bank7 setMarkerText ""Ruins of Pulkovo"";
_bank7 setMarkerType ""Defend"";
_bank7 setMarkerColor ""ColorRedAlpha"";
bank7 = _bank7;

_bank8 = createMarker [""Skalka"", [1902.0646, 11947.333, 1]];
_bank8 setMarkerText ""Winterfell"";
_bank8 setMarkerType ""Defend"";
_bank8 setMarkerColor ""ColorRedAlpha"";
bank8 = _bank8;

_bank9 = createMarker [""Skalka2"", [2282.0522, 10825.35, 1]];
_bank9 setMarkerText ""Ruins of Skalka"";
_bank9 setMarkerType ""Defend"";
_bank9 setMarkerColor ""ColorRedAlpha"";
bank9 = _bank9;

");

["ZombZ map markers",_rExec] call fnc_p2_RemoteExecute;