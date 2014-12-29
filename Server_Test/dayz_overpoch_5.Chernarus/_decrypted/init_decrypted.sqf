P2DZ_AHDecrypted = false;
P2DZ_decryptionDebug = true;
P2DZ_postVarsDone_Thread1 = false;
P2DZ_postVarsDone_Thread2 = false;

_this spawn {

	_this call compile preprocessFileLineNumbers "_decrypted\functionChecks.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","functionChecks"]); };
	_this call compile preprocessFileLineNumbers "_decrypted\antihack_loopedExecution.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack_loopedExecution"]); };
	
	P2DZ_AHDecrypted = true;

	_this call compile preprocessFileLineNumbers "_decrypted\p2_randomMags.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","p2_randomMags"]); };
	_this call compile preprocessFileLineNumbers "_decrypted\fnc_debugMon_ColourGUI.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","fnc_debugMon_ColourGUI"]); };
};

waitUntil{uiSleep 0.1; P2DZ_postVars};

_this spawn {
	_this call compile preprocessFileLineNumbers "_decrypted\player_traderMenuConfigEncrypted.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_traderMenuConfigEncrypted"]); };
	P2DZ_postVarsDone_Thread1 = true;
};

_this spawn {
	_this call compile preprocessFileLineNumbers "_decrypted\variables_modified.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","variables_modified"]); };
	_this call compile preprocessFileLineNumbers "_decrypted\fn_hintMsg.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","fn_hintMsg"]); };
	P2DZ_postVarsDone_Thread2 = true;
};

waitUntil{uiSleep 0.1; P2DZ_postVarsDone_Thread1};
waitUntil{uiSleep 0.1; P2DZ_postVarsDone_Thread2};

P2DZ_postVarsDone = true;

waitUntil{uiSleep 0.1; P2DZ_postCompiles};
waitUntil{uiSleep 0.1; P2DZ_AHDecrypted};

_this call compile preprocessFileLineNumbers "_decrypted\antihack.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack"]); };

P2DZ_postCompilesDone = true;