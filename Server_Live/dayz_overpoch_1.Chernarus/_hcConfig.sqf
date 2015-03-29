if (!hasInterface && !isDedicated && !isServer) exitWith {

	/*---------------------------------------------------------------------------
	Headless Client Settings
	---------------------------------------------------------------------------*/
		//Set Headless Folder Path
		P2HC_Path = "\zombzHC\addons\";
		//P2HC_Path = "HC\";

		//Set P2AI Folder Location
		P2AI_FileLocation = ("" + (P2HC_Path) + "P2AI");	//disclude last slash

		//enable arma server monitor for headlessClient
		P2DZ_HC_ASM_Enabled = false;

	/*---------------------------------------------------------------------------
	Zombie Settings
	---------------------------------------------------------------------------*/
		//enable headless client extra-zeds?
		P2DZ_HC_extraZeds = true;

		//enable zed hordes? (WARNING: Requires ExtraZeds)
		P2DZ_HC_zedHordes = true;

	/*---------------------------------------------------------------------------
	P2AI Settings
	---------------------------------------------------------------------------*/
	  	//enable/disable P2AI? Requires Global Server/HC setting; See: _allConfig.sqf

		//enable AI missions? (requires P2AI)
		P2AI_MissionsEnabled = true;
		diag_log(format['%1: %2: %3','[P2AI]:Events_Config','P2AI_MissionsEnabled',P2AI_MissionsEnabled]);

		//enable Devils Castle AI? (requires P2AI)
	  	P2AI_Devils_Enabled = true;

		//Enable 'Hunter' AI - AI That will move towards, flank, etc the enemy, leaving its waypoints
		P2AI_hunterAI = true; 
		//Percent of AI that should be hunters
		P2AI_hunterAIPercent = 15; 

		//P2AI Debugging Settings
		P2AI_debug = 		false;
		P2AI_debugEvents = 	false;
		P2AI_debugStatic = 	false;
		P2AI_debugAI = 		false;

		//Global vars used by code
		P2AIMajName = "";
		P2AIMinName = "";

	/*---------------------------------------------------------------------------
	HeliCrash Settings
	---------------------------------------------------------------------------*/
		//Enable/Disable/Modify? Requires Global Server/HC setting; See: _allConfig.sqf
};