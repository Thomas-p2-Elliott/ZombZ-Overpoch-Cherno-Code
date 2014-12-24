"Arma2Net.Unmanaged" callExtension "Load";

//Global Variable - Test Server Only
//ZombZ_Notif_File_Name = "notification_op1"; - Moved to server config

if (isNil "ZombZ_Notif_File_Name") then {
	ZombZ_Notif_File_Name = "notification_op5";
};

P2DZE_guiMsg = "";

notif_Loop = {
	private ["_rExec","_start","_end","_oldVal","_result","_logOutput"];
	diag_log("ZombZ Server: P2DEBUG: Starting Arma2Net Notification Retrieval Loop...");
	while {true} do 
	{
		_start = 'none';
		_end = 'none';
		_oldVal = P2DZE_guiMsg;
		_result = ("Arma2Net.Unmanaged" callExtension format ["p2Net1 ['readText','%3','%1','%2']", _start, _end, ZombZ_Notif_File_Name]);
		if (!isNil "_result") then {


		if (!(str(P2DZE_guiMsg) == str(_oldVal))) then {

			_logOutput = format ["[p2Re] P2DZE_guiMsg: %1", P2DZE_guiMsg];
			diag_log("ZombZ Notification Received: " + (_logOutput));
			_result = (call compile _result);
			if (!isNil "_result") then {	
				P2DZE_guiMsg = _result;
				publicVariable "P2DZE_guiMsg";
			};
		};

		};

		uiSleep 10; 
	};
	diag_log("ZombZ Server: P2DEBUG: Re-Starting Arma2Net Notification Retrieval Loop...");
	[] spawn notif_loop; //respawn it if it exits
};

[] spawn notif_Loop;