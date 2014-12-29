disableSerialization;


/*---------------------------------------------------------------------------
Executions
---------------------------------------------------------------------------*/
//init global arrays for Loot Chances
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\loot_init.sqf";

//init vehicle painting vars
call compile preprocessFileLineNumbers "init\variables_painting.sqf";

/*---------------------------------------------------------------------------
							Functions
---------------------------------------------------------------------------*/

/* KillzoneKid's More Accurate Distance Function 
Source: http://killzonekid.com/arma-scripting-tutorials-distance/	*/

KK_fnc_distanceASL = {
    private ["_v0","_v1"];
    _v0 = _this select 0;
    _v1 = _this select 1;
    sqrt (
        ((_v0 select 0) - (_v1 select 0)) ^ 2 + 
        ((_v0 select 1) - (_v1 select 1)) ^ 2 + 
        ((_v0 select 2) - (_v1 select 2)) ^ 2
    )
};

/*---------------------------------------------------------------------------
Function: Checks if a players skin should be upgraded/downgraded depending
on humanity. Only happens if player is wearing level-based clothing.

This prevents players from wearing these skins if they are not the appropriate
level or class.
---------------------------------------------------------------------------

Disabled for now

p2_fnc_skinLvlCheck = {
	private["_humanity","_model","_canChange","_sexy"];
	if !(p2_humanityLevelsEnabled) exitWith { };
	_model = _this select 0;
	_humanity = _this select 1;

	//diag_log("P2DEBUG: fnc_skinLvlCheck: " + str(_this));

	//	-	Check if player is in class-based clothing
	// Check if player is a man
	if (_model in p2_humanitySkinsMale) then {
		_canChange = true;
		_sexy = false;

	};

	// Check if player is a woman
	if (_model in p2_humanitySkinsFemale) then {
		_canChange = true;
		_sexy = true;
	};

	// If player is in class-based clothing
	if (_canChange) then {

			//level 1 hero
			if (_humanity > 5000) then 
			{
				if (_sexy) then {
					_model = "SurvivorW3_DZ";
				} else {
					_model = "Survivor3_DZ";
				};
			};

			//bandit level 1
			if (_humanity < -5000) then 
			{
				if (_sexy) then {
					_model = "BanditW2_DZ";
				} else {
					_model = "Bandit1_DZ";
				};
			};
			//bandit level 2
			if (_humanity < -10000) then 
			{
				_model = "Bandit2_DZ";
			};
			//bandit level 3
			if (_humanity < -15000) then 
			{
				_model = "TK_INS_Warlord_EP1_DZ";
			};
			//bandit level 4
			if (_humanity < -20000) then 
			{
				_model = "Ins_Soldier_GL_DZ";
			};
			//bandit level 5
			if (_humanity < -25000) then 
			{
				_model = "INS_Lopotev_DZ";
			};


		//diag_log("P2DEBUG: fnc_skinLvlCheck: finalModel: " + str(_model));

		// Set players skin
		_model spawn player_switchModel;
	};

};
*/