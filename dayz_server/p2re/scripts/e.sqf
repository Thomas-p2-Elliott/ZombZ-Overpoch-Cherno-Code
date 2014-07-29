private [ "_rExec" ];
_rExec = compile ("
diag_log(""P2DEBUG: In Watermark File"");
_pic = ""img\y.paa"";
waitUntil {!isNil ""dayz_gui""};
diag_log(""P2DEBUG: WaitUntilFinished dayz_gui"");

['<img align=''left'' size=''1.0'' shadow=''1'' image='+(str(_pic))+' />',safeZoneX+0.027,safeZoneY+safeZoneH-0.1,99999,0,0,3390] spawn bis_fnc_dynamicText;
diag_log(""P2DEBUG: WaterMark Spawned"");
");

["ZombZ watermark",_rExec] call fnc_p2_RemoteExecute;