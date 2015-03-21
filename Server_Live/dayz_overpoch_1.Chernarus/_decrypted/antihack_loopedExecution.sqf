/*---------------------------------------------------------------------------
Variable Init
---------------------------------------------------------------------------*/

P2DZ_AH_loopTimeLast = 1;
P2DZ_AH_loopTimeLast_100 = 1;
P2DZ_AH_loopTimeLast_500 = 1;

/*===========================================================================
	Looped Executions
===========================================================================*/
P2DZ_AHLoop = {
	private ["_puid","_pname","_mPos"];
	_pname = _this select 0; _puid = _this select 1; _mPos = _this select 2;
	if (P2DZ_AHDebug) then {
		diag_log(format["P2AntiHackDebug: %1", "P2DZ_AHLoop"]);
	};

	waitUntil {uiSleep 0.05;!isNil 'dayzPlayerLogin'};
	waitUntil {uiSleep 0.05;str dayzPlayerLogin != '[]'};
	waitUntil {uiSleep 0.05;!isNil 'dayzPlayerLogin2'};
	waitUntil {uiSleep 0.05;str dayzPlayerLogin2 != '[]'};
	waitUntil {uiSleep 0.05;!isNil 'dayz_playerName'};
	waitUntil {uiSleep 0.05;str dayz_playerName != ''};
	waitUntil {uiSleep 0.05;!isNil 'dayz_characterID'};
	waitUntil {uiSleep 0.05;str dayz_characterID != '0'};
	waitUntil {uiSleep 0.05;!isNil 'dayz_gui'};

	while {true} do {
		[_pname,_puid,_mPos] call P2DZ_AHLoop_Calls;
	};

	P2DZ_fire = [(_pname), (_puid), 'P2DZ_AHLoop Exited', '{true} broken'];
	publicVariableServer 'P2DZ_fire';
	[] spawn P2DZ_AHKick;
};

P2DZ_AHLoop_Calls = {
	private ["_puid","_pname","_mPos"];
	_pname = _this select 0; _puid = _this select 1; _mPos = _this select 2;
	if ((diag_tickTime - P2DZ_AH_loopTimeLast) > 0) exitWith {

		/*

			0.1 Second

		*/
		if ( (diag_tickTime - P2DZ_AH_loopTimeLast_100) > 0.1 ) then { 	
			//Code Executions:
			[] 									call P2DZ_disableSideChat;
			[] 									call P2DZ_chatCommands;

			//Timer
			P2DZ_AH_loopTimeLast_100 = diag_tickTime; 
		};
		/*

			10 Second

		*/	
		if ( (diag_tickTime - P2DZ_AH_loopTimeLast_500) > 10 ) then { 	
			//Code Executions:
			[_pname,_puid,dayz_characterID,_mPos] 	call P2DZ_AH_PlayerChecks;
			[_pname,_puid] 							call P2DZ_AH_FunctionChecks;
			[_pname,_puid] 							call P2DZ_AH_BannedCommands;
			[_pname,_puid]							call P2DZ_AH_MenuChecks;

			//Timer
			P2DZ_AH_loopTimeLast_500 = diag_tickTime; 
		};

		P2DZ_AH_loopTimeLast = diag_tickTime;
	};
};