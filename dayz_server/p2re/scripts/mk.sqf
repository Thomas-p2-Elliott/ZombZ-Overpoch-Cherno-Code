private [ "_rExec" ];
_rExec = compile ("
diag_log(""INFILE: MK.SQF"");

waitUntil {!isNil ""dayz_gui""};

_bank1 = createMarker [""skalka main outpost"", [2241.4453, 10803.656]];
_bank1 setMarkerText ""Winterfell Outpost"";
_bank1 setMarkerType ""Defend"";
_bank1 setMarkerColor ""ColorGreenAlpha"";
bank1 = _bank1;

_bank2 = createMarker [""checkpoint"", [8245.3574, 4897.6006]];
_bank2 setMarkerText ""Abandoned Checkpoint"";
_bank2 setMarkerType ""Defend"";
_bank2 setMarkerColor ""ColorRedAlpha"";
bank2 = _bank2;

_bank3 = createMarker [""NovyLug"", [9577.7266, 11299.333]];
_bank3 setMarkerText ""Novylug Outpost"";
_bank3 setMarkerType ""Defend"";
_bank3 setMarkerColor ""ColorRedAlpha"";
bank3 = _bank3;

_bank4 = createMarker [""c130Crash"", [12720.771, 9520.5762, 3.8146973e-006]];
_bank4 setMarkerText ""Flight 1337 Wreckage"";
_bank4 setMarkerType ""Defend"";
_bank4 setMarkerColor ""ColorRedAlpha"";
bank4 = _bank4;

_bank5 = createMarker [""Dead Forest"", [8374.1084, 2992.9797]];
_bank5 setMarkerText ""Dead Forest"";
_bank5 setMarkerType ""Defend"";
_bank5 setMarkerColor ""ColorRedAlpha"";
bank5 = _bank5;

_bank6 = createMarker [""Devils Farm"", [1942.1244, 11712.463]];
_bank6 setMarkerText ""Devils Farm"";
_bank6 setMarkerType ""Defend"";
_bank6 setMarkerColor ""ColorRedAlpha"";
bank6 = _bank6;

_bank7 = createMarker [""Roadblock"", [11719.48, 3440.4539]];
_bank7 setMarkerText ""UN Roadblock"";
_bank7 setMarkerType ""Defend"";
_bank7 setMarkerColor ""ColorRedAlpha"";
bank7 = _bank7;

_bank8 = createMarker [""Deadmans Airfield"", [3825.3159, 10108.598]];
_bank8 setMarkerText ""Deadmans Airfield"";
_bank8 setMarkerType ""Defend"";
_bank8 setMarkerColor ""ColorRedAlpha"";
bank8 = _bank8;

_bank9 = createMarker [""south checkpoint"", [4048.4211, 2613.1758]];
_bank9 setMarkerText ""Southern US Outpost"";
_bank9 setMarkerType ""Defend"";
_bank9 setMarkerColor ""ColorRedAlpha"";
bank9 = _bank9;

_bank9 = createMarker [""Zelengorsk"", [2577.5076, 5050.4619]];
_bank9 setMarkerText ""Free City of Zelenogorsk"";
_bank9 setMarkerType ""Defend"";
_bank9 setMarkerColor ""ColorRedAlpha"";
bank9 = _bank9;

_bank10 = createMarker [""Klen"", [11467.045, 11315.559]];
_bank10 setMarkerText ""Klen Outpost"";
_bank10 setMarkerType ""Defend"";
_bank10 setMarkerColor ""ColorRedAlpha"";
bank10 = _bank10;

_bank11 = createMarker [""skalka city"", [1943.7556, 11980.035]];
_bank11 setMarkerText ""Winterfell"";
_bank11 setMarkerType ""Defend"";
_bank11 setMarkerColor ""ColorRedAlpha"";
bank11 = _bank11;



diag_log(""FILEDONE: MK.SQF"");


 ");

["ZombZ map markers",_rExec] call fnc_p2_RemoteExecute;




//


// _bank16 = createMarker [""Skalka"", [1231.9579, 13489.006]];
//_bank16 setMarkerText ""Winterfell"";
//_bank16 setMarkerType ""Headquaters"";
//_bank16 setMarkerColor ""ColorGreenAlpha"";
 //bank16 = _bank16;
//
  //_bank17 = createMarker [""zugaddition"", [6611.0601, 5565.5273]];/
//_bank17 setMarkerText ""US Checkpoint"";
//_bank16 setMarkerType ""Camp"";
//_bank16 setMarkerColor ""ColorGreenAlpha"";
 //bank16 = _bank16;
//