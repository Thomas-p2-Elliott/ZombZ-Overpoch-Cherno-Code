diag_log("ZombZ Server: P2DEBUG: zombz_notifications.sqf");

//isnil critical var check
if (isNil 'ZombZ_Notif_File_Name') then {
	diag_log("ERROR: ZombZ_Notif_File_Name not set up! No notifications will load except from notification_op5.txt!");
	ZombZ_Notif_File_Name = "notification_op5";
};

//setup as nil
notifLoopHandle = nil;
notif_Loop = compile preprocessFileLineNumbers "\z\addons\dayz_server\p2_notifs\server_loop.sqf";
//start it
notifLoopHandle = [] spawn notif_Loop;