diag_log("ZombZ Server: P2DEBUG: zombz_notifications.sqf");

"Arma2Net.Unmanaged" callExtension "Load";

if (isNil "ZombZ_Notif_File_Name") then {
	ZombZ_Notif_File_Name = "notification_op5";
};

//setup as nil
notifLoopHandle = nil;

notif_Loop = {
	private ["_rExec","_start","_end","_oldVal","_result","_logOutput","_gotMsg"];
	diag_log("ZombZ Server: P2DEBUG: Starting Arma2Net Notification Retrieval Loop...");
	_gotMsg = "";
	P2DZE_guiMsg = [];
	P2DZE_OldGuiMsg = [];
	while {true} do 
	{
		_start = 'none';
		_end = 'none';
		_oldVal = P2DZE_guiMsg;
		_result = ("Arma2Net.Unmanaged" callExtension format ["p2Net1 ['readText','%3','%1','%2']", _start, _end, ZombZ_Notif_File_Name]);
		_gotMsg = (call compile _result);
		if (isNil "_gotMsg") then {
			P2DZE_OldGuiMsg = [];
			_gotMsg = P2DZE_OldGuiMsg;
		};

		if (!(str(_gotMsg) == str(P2DZE_OldGuiMsg))) then {
			P2DZE_OldGuiMsg = _gotMsg;
			P2DZE_guiMsg = _gotMsg;
			_logOutput = format ["[ZombZ Notification Received]: 		(%1) 		Previous Message: 		(%2)", P2DZE_guiMsg, P2DZE_OldGuiMsg];
			diag_log(_logOutput);

			publicVariable "P2DZE_guiMsg";
		};

		uiSleep 10; 
	};

	diag_log("ZombZ Server: P2DEBUG: Re-Starting Arma2Net Notification Retrieval Loop...");
	notifLoopHandle = [] spawn notif_loop; //respawn if it quits somehow
};

//start it
notifLoopHandle = [] spawn notif_Loop;