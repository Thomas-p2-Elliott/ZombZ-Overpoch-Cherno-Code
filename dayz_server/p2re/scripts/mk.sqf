private [ "_rExec" ];
_rExec = compile ("
waitUntil {!isNil ""dayz_gui""};

_bank1 = createMarker [""Drozhina"", [3847.0142, 4787.8877, 1.5258789e-005]];
_bank1 setMarkerText ""Ruins of Drozlovka"";
_bank1 setMarkerType ""Defend"";
_bank1 setMarkerColor ""ColorGreenAlpha"";
bank1 = _bank1;

_bank2 = createMarker [""NEA"", [12199.364, 12736.952, 0.22427459]];
_bank2 setMarkerText ""ZombZ East International Airport"";
_bank2 setMarkerType ""Defend"";
_bank2 setMarkerColor ""ColorRedAlpha"";
bank2 = _bank2;

_bank3 = createMarker [""NovyLug"", [9577.7266, 11299.333, 0.4098191]];
_bank3 setMarkerText ""Novylug Outpost"";
_bank3 setMarkerType ""Defend"";
_bank3 setMarkerColor ""ColorRedAlpha"";
bank3 = _bank3;

_bank4 = createMarker [""NWA"", [4874.4219, 9974.2324, 0.11848836]];
_bank4 setMarkerText ""ZombZ West International Airport"";
_bank4 setMarkerType ""Defend"";
_bank4 setMarkerColor ""ColorRedAlpha"";
bank4 = _bank4;

_bank5 = createMarker [""Skalka Town"", [1902.0646, 11947.333, 2]];
_bank5 setMarkerText ""Winterfell"";
_bank5 setMarkerType ""Defend"";
_bank5 setMarkerColor ""ColorGreenAlpha"";
bank5 = _bank5;

_bank6 = createMarker [""Skalka Outpost"", [2282.0522, 10825.35, 1]];
_bank6 setMarkerText ""Winterfell Outpost"";
_bank6 setMarkerType ""Defend"";
_bank6 setMarkerColor ""ColorRedAlpha"";
bank6 = _bank6;

_bank7 = createMarker [""Balota Outpost"", [4048.4211, 2613.1758, 2]];
_bank7 setMarkerText ""Abandoned US Armory"";
_bank7 setMarkerType ""Faction_US"";
_bank7 setMarkerColor ""ColorRedAlpha"";
bank7 = _bank7;

_bank8 = createMarker [""Zelengorsk"", [2501.8564, 5090.1445, 0.014888633]];
_bank8 setMarkerText ""Zelengorsk General Hospital"";
_bank8 setMarkerType ""Defend"";
_bank8 setMarkerColor ""ColorGreenAlpha"";
bank8 = _bank8;

_bank9 = createMarker [""SurvivorCity"", [6549.8652, 14154.829, 0.16039793]];
_bank9 setMarkerText ""Smugglers Airfield"";
_bank9 setMarkerType ""Attack"";
_bank9 setMarkerColor ""ColorBlue"";
bank9 = _bank9;

_bank9 = createMarker [""KumyrnaOutpost"", [8355.7813, 5918.0068, 3.0517578e-005]];
_bank9 setMarkerText ""Ruins of Kumyrna"";
_bank9 setMarkerType ""Defend"";
_bank9 setMarkerColor ""ColorGreenAlpha"";
bank9 = _bank9;

_bank10 = createMarker [""MogilevkaCheckpoint"", [8245.3574, 4897.6006, 3.0517578e-005]];
_bank10 setMarkerText ""Abandoned Checkpoint"";
_bank10 setMarkerType ""Defend"";
_bank10 setMarkerColor ""ColorGreenAlpha"";
bank10 = _bank10;

_bank11 = createMarker [""KamenkaTents"", [1117.6555, 2455.2349, 2.2888184e-005]];
_bank11 setMarkerText ""Survivor Camp"";
_bank11 setMarkerType ""Defend"";
_bank11 setMarkerColor ""ColorGreenAlpha"";
bank11 = _bank11;

_bank12 = createMarker [""Gorka"", [9788.2813, 8763.2217, 1]];
_bank12 setMarkerText ""Gorka Defence Force HQ"";
_bank12 setMarkerType ""Defend"";
_bank12 setMarkerColor ""ColorRedAlpha"";
bank12 = _bank12;

_bank13 = createMarker [""KamyshovoRoadblock"", [12985.606, 3800.031, -1.6689301e-005]];
_bank13 setMarkerText ""Abandoned Roadblock"";
_bank13 setMarkerType ""Defend"";
_bank13 setMarkerColor ""ColorRedAlpha"";
bank13 = _bank13;
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