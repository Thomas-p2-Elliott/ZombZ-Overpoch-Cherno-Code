/*---------------------------------------------------------------------------
	Player2's Zombie Horde Configuration
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_HordeCount = 			2;						//Amount of hordes
P2DZ_HC_ZHorde_ZombiesPerHorde = 		20;						//Amount of zombies per horde
P2DZ_HC_ZHorde_HordeRespawnPerc = 		10;						//Horde Respawn Threshold Percentage (Eg, 10 if you want the horde to respawn when only 10% of P2DZ_HC_ZHorde_ZombiesPerHorde remain)
P2DZ_HC_ZHorde_TriggerWaypointNames = 	["Horde1","Horde2"]; 	//Name of horde waypoint variables (P2DZ_HC_ZHorde_TriggerWayp_%VarName%)
P2DZ_HC_ZHorde_PathWaypointNames = 		["Horde1","Horde2"]; 	//Name of horde waypoint variables (P2DZ_HC_ZHorde_PathWayp_%VarName%)
P2DZ_HC_hordeZedSpeed =					10;						//Speed of zeds in horde (ONLY USE 2 or 10, 2 = the walking dead, 10 = 28 days later)
P2DZ_HC_zHorde_waypointLoop_sleepTime = 1;						//Performance setting (seconds for each zed to check if it should update waypoint)
P2DZ_HC_HordeZedsDebug	= 				true;					//Debug Zombie Horde Script
P2DZ_HC_debugHordeZedFSM = 				false;					//Debug Zombie Horde FSM / AntiStuck Loop

/*
	Waypoint Configuration 
	Path Waypoints = Where zeds should walk
	Trigger waypoints = Where zeds will trigger a zombie respawn to rebuild the horde and delete any zeds that have wandered too farfrom the horde
*/

/* Horde 1 Waypoints */
P2DZ_HC_ZHorde_TriggerWayp_Horde1 = 	[
											[4978.03,2430.9,0]
										];
P2DZ_HC_ZHorde_PathWayp_Horde1 = 		[
											[4643.46,2551.07,0],
											[4978.03,2430.9,0],
											[5290.75,2144.13,0]
										];
/* Horde 2 Waypoints */
P2DZ_HC_ZHorde_TriggerWayp_Horde2 = 	[
											[4978.03,2430.9,0]
										];
P2DZ_HC_ZHorde_PathWayp_Horde2 = 		[
											[5290.75,2144.13,0],
											[4978.03,2430.9,0],
											[4643.46,2551.07,0]
										];
/* Release The hordes here */
[1,"z_priest"] 		call P2DZ_HC_ZHorde_spawnHorde;
[2,"z_doctor"] 		call P2DZ_HC_ZHorde_spawnHorde;

/*---------------------------------------------------------------------------
End of Typical-User Configuration
---------------------------------------------------------------------------*/
//www.ZombZ.net
P2DZ_HC_zedHordeConfigDone = true;