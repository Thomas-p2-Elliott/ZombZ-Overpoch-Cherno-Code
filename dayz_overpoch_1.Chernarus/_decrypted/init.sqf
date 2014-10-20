P2DZ_AHDecrypted = false;
P2DZ_decryptionDebug = true;

[] spawn {

	[] call compile preprocessFileLineNumbers "_decrypted\functionChecks.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","functionChecks"]); };
	[] call compile preprocessFileLineNumbers "_decrypted\antihack_loopedExecution.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack_loopedExecution"]); };
	
	P2DZ_AHDecrypted = true;

	[] call compile preprocessFileLineNumbers "_decrypted\p2_randomMags.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","p2_randomMags"]); };
	[] call compile preprocessFileLineNumbers "_decrypted\epoch_currencyFunctions.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","epoch_currencyFunctions"]); };
	[] call compile preprocessFileLineNumbers "_decrypted\player_pickupGold.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_pickupGold"]); };
	[] call compile preprocessFileLineNumbers "_decrypted\ui_goldDrop.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","ui_goldDrop"]); };
	[] call compile preprocessFileLineNumbers "_decrypted\maintain_areaSC.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","maintain_areaSC"]); };
	[] call compile preprocessFileLineNumbers "_decrypted\fnc_debugMon_ColourGUI.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","fnc_debugMon_ColourGUI"]); };
	[] call compile preprocessFileLineNumbers "_decrypted\vehicleColourPaint.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","vehicleColourPaint"]); };

};

waitUntil{uiSleep 0.5; P2DZ_postVars};

[] call compile preprocessFileLineNumbers "_decrypted\variables_modified.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","variables_modified"]); };
[] call compile preprocessFileLineNumbers "_decrypted\player_traderMenuConfigEncrypted.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_traderMenuConfigEncrypted"]); };
[] call compile preprocessFileLineNumbers "_decrypted\player_checkGoldItems.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_checkGoldItems"]); };	
[] call compile preprocessFileLineNumbers "_decrypted\ui_displayGold.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","ui_displayGold"]); };
[] call compile preprocessFileLineNumbers "_decrypted\fn_hintMsg.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","fn_hintMsg"]); };
[] call compile preprocessFileLineNumbers "_decrypted\player_dropGold.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_dropGold"]); };

P2DZ_postVarsDone = true;

waitUntil{uiSleep 0.5; P2DZ_postCompiles};
waitUntil{uiSleep 0.5; P2DZ_AHDecrypted};

[] call compile preprocessFileLineNumbers "_decrypted\antihack.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack"]); };
[] call compile preprocessFileLineNumbers "_decrypted\antihack_wepCheck.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack_wepCheck"]); };

P2DZ_postCompilesDone = true;



