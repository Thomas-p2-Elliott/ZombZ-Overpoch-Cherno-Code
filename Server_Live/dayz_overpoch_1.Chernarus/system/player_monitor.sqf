if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
_id = [] execFSM "system\player_monitor.fsm";
