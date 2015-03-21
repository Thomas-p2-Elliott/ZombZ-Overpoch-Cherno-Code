private ["_ranChopper","_chopper","_truck","_truck2","_crate","_crate1","_crate2"];

/*---------------------------------------------------------------------------
Devils Castle AI Mission by Player2 & Gorsy for www.ZombZ.net

	Configure in P2AIConfig.sqf
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
Spawn Gear Creates (2x Med (10 Items), 3x Western Guns (12 Items))
---------------------------------------------------------------------------*/


P2HC_mRq =  [
                //Scenery Object Type & Pos & Amount to Spawn (pos gets replaced with bisFindSafePos version)
                [
                    ["Body1",[6884.3755, 11416.529],6],
                    ["Body2",[6884.3755, 11416.529],6],                   
                    ["Rubbish3",[6884.3755, 11416.529],3],
                    ["Rubbish4",[6884.3755, 11416.529],3]
                    
                ],     
                //Loot Table Type & Pos & Loot Item Amount (Pos gets replaced with bisFindSafePos version)
                [
                    ["WesternWeapons",[6884.3755, 11416.529],4],
                    ["WesternWeapons",[6884.3755, 11416.529],4],
                    ["WesternWeapons",[6884.3755, 11416.529],4],
                    ["WesternWeapons",[6884.3755, 11416.529],4],
                    ["EasternWeapons",[6884.3755, 11416.529],4],
                    ["Medical",[6884.3755, 11416.529],10],
                    ["Medical",[6884.3755, 11416.529],10]
                ]   
            ];

publicVariableServer "P2HC_mRq";


/*---------------------------------------------------------------------------
Spawn AI Units

	P2AI_spawnAI spawns AI to the mission.
	Usage: [P2AI_DC_COORDS, count, skillLevel]
---------------------------------------------------------------------------*/

//Split the AI into 5 evenly split groups.

sleep 5;
[[(P2AI_DC_COORDS select 0),(P2AI_DC_COORDS select 1),0],round(P2AI_DcAI_Amount * 0.2),1,"P2AIUnitsDevilsCastle"] spawn P2AI_spawnAI;
sleep 5;
[[(P2AI_DC_COORDS select 0),(P2AI_DC_COORDS select 1),0],round(P2AI_DcAI_Amount * 0.2),1,"P2AIUnitsDevilsCastle"] spawn P2AI_spawnAI;
sleep 5;
[[(P2AI_DC_COORDS select 0),(P2AI_DC_COORDS select 1),0],round(P2AI_DcAI_Amount * 0.2),1,"P2AIUnitsDevilsCastle"] spawn P2AI_spawnAI;
sleep 5;
[[(P2AI_DC_COORDS select 0),(P2AI_DC_COORDS select 1),0],round(P2AI_DcAI_Amount * 0.2),1,"P2AIUnitsDevilsCastle"] spawn P2AI_spawnAI;
sleep 5;
[[(P2AI_DC_COORDS select 0),(P2AI_DC_COORDS select 1),0],round(P2AI_DcAI_Amount * 0.2),1,"P2AIUnitsDevilsCastle"] spawn P2AI_spawnAI;


P2DZE_guiMsg = [
    "Event Notification: Special Mission",
    "Bandits have fortified Devils Castle and stashed stolen U.N. special forces weapons inside! Kill them and take the loot!",
    "p2_notifs\img\ru.paa",
    10,
    0
];

publicVariable "P2DZE_guiMsg";

/*---------------------------------------------------------------------------
Create AI Delayed Respawn Function - Disabled for now

respawn ai function
spawns 2 ai at a time...takes 2 inputs:
the amount to spawn and the time to wait between spawning each 2 
this prevents lots spawning at once and raping someone...
---------------------------------------------------------------------------*/
/*
P2AI_respawnAI = {
private["_amount","_sleepBetween"];
	diag_log("[P2AI]Castle: P2DEBUG: AI RESPAWN FUNC ");
	_amount = _this select 0;
	_sleepBetween =  _this select 1;	
	
	for "_i" from 0 to (_amount / 2) do {
		[[(P2AI_DC_COORDS select 0) - 8.4614,(P2AI_DC_COORDS select 1) - 5.0527,0],2,1,"P2AIUnitsDevilsCastle"] spawn P2AI_spawnAI;
		sleep _sleepBetween;
	};
};
*/
/*---------------------------------------------------------------------------
AI Respawn Loop - Runs every X minutes to respawn dead AI
---------------------------------------------------------------------------*/
/*
//Run this in a new thread
[] spawn {
private["_amount"];
    //loop this every X (P2AI_DC_resSleep) minutes
    while {true} do {
        //reset the AI count for each check
        P2AI_AILeft = 0;
        //reset player count
        P2AI_PlayersInArea = 0;
        //for each object within 150 meters
        {
            //if the object is AI and alive add 1 to the ai counter
            if ((_x getVariable ["P2AIAI",false]) && alive _x) then {
               P2AI_AILeft = P2AI_AILeft + 1;
            } else {
                if (alive _x && isPlayer _x) then {
                    P2AI_PlayersInArea = P2AI_PlayersInArea + 1;
                };
            };
        } forEach (P2AI_DC_COORDS nearObjects 300);

        //if amount of AI left is less than 50% of the starting amount rounded up (P2AIRequiredKillPercent = 0.5) and players is less than 3
        if ((P2AI_AILeft < ceil(P2AI_DcAI_Amount * P2AIRequiredKillPercent)) && P2AI_PlayersInArea < 3) then {
            //amount of ai to spawn = Starting Amount - Remaining AI (eg 25 left, 30 - 25 = 5 to spawn)
            _amount = P2AI_DcAI_Amount - P2AI_AILeft;
           
            //spawn our P2AI_respawnAI function in a new thread
            //[amount to spawn, time to wait between each new ai being spawned] spawn P2AI_respawnAI;
            [_amount, 60] spawn P2AI_respawnAI;
        };

        //respawn gear crates
        {
          deleteVehicle _x;
          [] call P2AI_CastleLoot;
        } forEach P2AICastleCrates;

        //log the amount of ai and players in area
        diag_log("[P2AI]Castle: P2DEBUG: AI RESPAWN LOOP, P2AI_AILeft = " + str(P2AI_AILeft) + ", P2AI_PlayersInArea = " + str(P2AI_PlayersInArea) + ", AI left needs to be: " + str(P2AI_DcAI_Amount * P2AIRequiredKillPercent)  + ", Players left needs to be 2 or less.");

        //wait default 45 mins
        uiSleep (P2AI_DC_resSleep * 60);
    };
};*/