private [ "_rExec" ];
_rExec = compile ("
private [""_gorsybg"",""_gorsyfc"",""_gorsyd"",""_gorsyedit1""];
disableSerialization;

_gorsybg = [0.22, 0.22, 1, 0.5];
_gorsyfc = [1, 1, 1, 1];

_gorsyd = finddisplay 70; 

_gorsyedit1 =_gorsyd displayctrl 1001; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg; 
_gorsyedit1 ctrlSetFontHeight 0.10; 
_gorsyedit1 ctrlSetTextColor _gorsyfc; 
_gorsyedit1 ctrlsetText ""ZombZ Server (1,000,000 Vehicles) #1"";

_gorsyedit1 =_gorsyd displayctrl 1002; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""Join Our"";

_gorsyedit1 =_gorsyd displayctrl 101; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;

_gorsyedit1 =_gorsyd displayctrl 1004; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""Teamspeak 3 Server"";

_gorsyedit1 =_gorsyd displayctrl 103; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;

_gorsyedit1 =_gorsyd displayctrl 1003; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""Map:"";

_gorsyedit1 =_gorsyd displayctrl 102; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;

_gorsyedit1 =_gorsyd displayctrl 1005; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor [1, 1, 1, 1];
_gorsyedit1 ctrlsetText ""ts3.zombz.net:9172"";

_gorsyedit1 =_gorsyd displayctrl 1006; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""www.zombz.net - Expect Quality"";

_gorsyedit1 =_gorsyd displayctrl 1;
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""Game On"";

_gorsyedit1 =_gorsyd displayctrl 2; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""F This"";

_gorsyedit1 =_gorsyd displayctrl 104; 
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""ZombZerz"";

_gorsyedit1 =_gorsyd displayctrl 1012;
_gorsyedit1 ctrlSetBackgroundColor _gorsybg;
_gorsyedit1 ctrlSetFontHeight 0.05;
_gorsyedit1 ctrlSetTextColor _gorsyfc;
_gorsyedit1 ctrlsetText ""ZOMBZ.NET"";");

["ZombZ gorsy menu edit",_rExec] call fnc_p2_RemoteExecute;