P2DZ_AHDecrypted = false;
P2DZ_decryptionDebug = true;

_this spawn {

	//_this call compile preprocessFileLineNumbers "_encrypted\functionChecks.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","functionChecks"]); };
	//_this call compile preprocessFileLineNumbers "_encrypted\antihack_loopedExecution.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack_loopedExecution"]); };
	
	P2DZ_AHDecrypted = true;

	_this call compile preprocessFileLineNumbers "_encrypted\p2_randomMags.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","p2_randomMags"]); };
	_this call compile preprocessFileLineNumbers "_encrypted\epoch_currencyFunctions.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","epoch_currencyFunctions"]); };
	_this call compile preprocessFileLineNumbers "_encrypted\player_pickupGold.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_pickupGold"]); };
	_this call compile preprocessFileLineNumbers "_encrypted\ui_goldDrop.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","ui_goldDrop"]); };
	_this call compile preprocessFileLineNumbers "_encrypted\maintain_areaSC.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","maintain_areaSC"]); };
	_this call compile preprocessFileLineNumbers "_encrypted\fnc_debugMon_ColourGUI.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","fnc_debugMon_ColourGUI"]); };
	_this call compile preprocessFileLineNumbers "_encrypted\vehicleColourPaint.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","vehicleColourPaint"]); };

};

waitUntil{uiSleep 0.5; P2DZ_postVars};

_this call compile preprocessFileLineNumbers "_encrypted\variables_modified.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","variables_modified"]); };
_this call compile preprocessFileLineNumbers "_encrypted\player_traderMenuConfigEncrypted.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_traderMenuConfigEncrypted"]); };
_this call compile preprocessFileLineNumbers "_encrypted\player_checkGoldItems.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_checkGoldItems"]); };	
_this call compile preprocessFileLineNumbers "_encrypted\ui_displayGold.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","ui_displayGold"]); };
_this call compile preprocessFileLineNumbers "_encrypted\fn_hintMsg.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","fn_hintMsg"]); };
_this call compile preprocessFileLineNumbers "_encrypted\player_dropGold.sqf"; if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","player_dropGold"]); };

P2DZ_postVarsDone = true;

//waitUntil{uiSleep 0.5; P2DZ_postCompiles};
//waitUntil{uiSleep 0.5; P2DZ_AHDecrypted};

//_this call compile preprocessFileLineNumbers "_encrypted\antihack.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack"]); };
//_this call compile preprocessFileLineNumbers "_encrypted\antihack_wepCheck.sqf";	if (P2DZ_decryptionDebug) then { diag_log(format["P2DecryptionDebug: Decrypted: %1","antihack_wepCheck"]); };

P2DZ_postCompilesDone = true;



		/*---------------------------------------------------------------------------
			Damage Handler / Fired Handler / Killed Handler
		---------------------------------------------------------------------------*/

		fnc_usec_damageHandle = {
			/*
			ASSIGN DAMAGE HANDLER TO A UNIT
			- Function
			- [unit] call fnc_usec_damageHandle;
			*/
			private ["_unit"];
			_unit = _this select 0;
			
			// Remove handle damage override
			// _unit removeEventHandler ["HandleDamage",temp_handler];

			mydamage_eh1 = _unit addeventhandler ["HandleDamage",{_this call fnc_usec_damageHandler; _this call DDOPP_taser_handleHit; } ];
			mydamage_eh2 = _unit addEventHandler ["Fired", {_this call player_fired; _this call p2_fired}];
			mydamage_eh3 = _unit addEventHandler ["Killed", {_id = [] spawn player_death;}];
		};

		/*---------------------------------------------------------------------------
		Player Fired Event: _this = [unit, weapon, muzzle, mode, ammo, magazine, projectile]
		---------------------------------------------------------------------------*/
		p2_fired = {
			//if local
			//if (_this select 0 == player || _this select 0 == (vehicle player)) then {
			//	[_this select 0, _this select 1,_this select 5, _this select 6,_this select 2] call p2_bulletCheck;
			//	[_this select 1, _this select 4, _this select 0] call p2_infAmmoCheck;
			//};
		};
