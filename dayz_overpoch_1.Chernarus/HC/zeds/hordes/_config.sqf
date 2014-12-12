/*---------------------------------------------------------------------------
	Player2's Zombie Horde Configuration
---------------------------------------------------------------------------*/
P2DZ_HC_ZHorde_HordeCount = 			2;						//Amount of hordes
P2DZ_HC_ZHorde_ZombiesPerHorde = 		50;						//Amount of zombies per horde
P2DZ_HC_ZHorde_HordeRespawnPerc = 		10;						//Horde Respawn Threshold Percentage (Eg, 10 if you want the horde to respawn when only 10% of P2DZ_HC_ZHorde_ZombiesPerHorde remain)
P2DZ_HC_ZHorde_TriggerWaypointNames = 	["Horde1","Horde2"]; 	//Name of horde waypoint variables (P2DZ_HC_ZHorde_TriggerWayp_%VarName%)
P2DZ_HC_ZHorde_PathWaypointNames = 		["Horde1","Horde2"]; 	//Name of horde waypoint variables (P2DZ_HC_ZHorde_PathWayp_%VarName%)
P2DZ_HC_hordeZedSpeed =					10;						//Speed of zeds in horde (ONLY USE 2 or 10, 2 = the walking dead, 10 = 28 days later)

P2DZ_HC_zHorde_regroupTime	=			60;						//time zeds are given to regroup at major waypoints

P2DZ_HC_zHorde_waypointLoop_sleepTime = 1;						//Performance setting (seconds for each zed to check if it should update waypoint)
P2DZ_HC_HordeZedsDebug	= 				true;					//Debug Zombie Horde Script
P2DZ_HC_debugHordeZedFSM = 				true;					//Debug Zombie Horde FSM / AntiStuck Loop

/*
	Waypoint Configuration 
	Path Waypoints = Where zeds should walk
	Trigger waypoints = Where zeds will trigger a zombie respawn to rebuild the horde and delete any zeds that have wandered too farfrom the horde
*/

/* Horde 1 Waypoints */
P2DZ_HC_ZHorde_TriggerWayp_Horde1 = 	[
											
											[1697.16,2351.48,0], //Kemenka
											[3395.23,2199.48,0], //komo
											[4288.91,2428.22,0], //balota
											[5287.27,2345.58,0], //balota airfield
											[6236.95,2438.14,0], //cherno
											[8370.58,3171.48,0], //prigordoki
											[9258.92,2146.55,0], //elektro
											[10599.9,2942.58,0], //elec sniper hill
											[11982.4,3529.29,0], //kamy town center
											[13323,5468.42,0], //three valleys
											[13377.5,6517.31,0], //kamy fuel station
											[12875.9,8213,0], //niznoye
											[12522.4,9617.87,0], //north side of bere
											[11738.3,12612.6,0]// north airfield
										];
P2DZ_HC_ZHorde_PathWayp_Horde1 = 		[
											
											[566.289,1840.15,0],
											[1140.39,2506.02,0],
											[1697.16,2351.48,0],
											[2071.05,2239.98,0],
											[2307.58,2130.19,0],
											[3395.23,2199.48,0],
											[3746.65,2335,0],
											[4288.91,2428.22,0],
											[4486.04,2596.02,0],
											[4766.8,2661.02,0],
											[4857.88,2341.95,0],
											[5287.27,2345.58,0],
											[6236.95,2438.14,0],
											[6940.73,2897.89,0],
											[7290.03,3450.01,0],
											[8370.58,3171.48,0],
											[9098.81,3151.06,0],
											[9258.92,2146.55,0],
											[10258.4,2346.48,0],
											[10521.4,2070.37,0],
											[10903.5,2946.77,0],
											[11106.7,3168.38,0],
											[11283.1,3427.01,0],
											[11982.4,3529.29,0],
											[12331.6,3553.86,0],
											[13108.7,5093.84,0],
											[12737.8,3669.67,0],
											[13406.9,4295.98,0],
											[13411.3,4883.78,0],
											[13323,5468.42,0],
											[13347.1,6067.47,0],
											[13377.5,6517.31,0],
											[13126.1,6979.94,0],
											[12962.5,7187.73,0],
											[12864.7,8006.79,0],
											[12875.9,8213,0],
											[12121.4,8923.95,0],
											[11835.8,9299.1,0],
											[12132.7,9621.28,0],
											[12522.4,9617.87,0],
											[12343.8,12383.1,0],
											[11738.3,12612.6,0],
											[11718.5,13128.2,0]
										];
/* Horde 2 Waypoints */
P2DZ_HC_ZHorde_TriggerWayp_Horde2 = 	[
										
											[1697.16,2351.48,0], //Kemenka
											[3395.23,2199.48,0], //komo
											[4288.91,2428.22,0], //balota
											[5287.27,2345.58,0], //balota airfield
											[6236.95,2438.14,0], //cherno
											[8370.58,3171.48,0], //prigordoki
											[9258.92,2146.55,0], //elektro
											[10599.9,2942.58,0], //elec sniper hill
											[11982.4,3529.29,0], //kamy town center
											[13323,5468.42,0], //three valleys
											[13377.5,6517.31,0], //kamy fuel station
											[12875.9,8213,0], //niznoye
											[12522.4,9617.87,0], //north side of bere
											[11738.3,12612.6,0]// north airfield
											
										];
P2DZ_HC_ZHorde_PathWayp_Horde2 = 		[
											[11718.5,13128.2,0]
											[11738.3,12612.6,0],
											[12343.8,12383.1,0],
											[12522.4,9617.87,0],
											[12132.7,9621.28,0],
											[11835.8,9299.1,0],
											[12121.4,8923.95,0],
											[12875.9,8213,0],
											[12864.7,8006.79,0],
											[12962.5,7187.73,0],
											[13126.1,6979.94,0],
											[13377.5,6517.31,0],
											[13347.1,6067.47,0],
											[13323,5468.42,0],
											[13411.3,4883.78,0],
											[13406.9,4295.98,0],
											[12737.8,3669.67,0],
											[13108.7,5093.84,0],
											[12331.6,3553.86,0],
											[11982.4,3529.29,0],
											[11283.1,3427.01,0],
											[11106.7,3168.38,0],
											[10903.5,2946.77,0],
											[10521.4,2070.37,0],
											[10258.4,2346.48,0],
											[9258.92,2146.55,0],
											[9098.81,3151.06,0],
											[8370.58,3171.48,0],
											[7290.03,3450.01,0],
											[6940.73,2897.89,0],
											[6236.95,2438.14,0],
											[5287.27,2345.58,0],
											[4857.88,2341.95,0],
											[4766.8,2661.02,0],
											[4486.04,2596.02,0],
											[4288.91,2428.22,0],
											[3746.65,2335,0],
											[3395.23,2199.48,0],
											[2307.58,2130.19,0],
											[2071.05,2239.98,0],
											[1697.16,2351.48,0],
											[1140.39,2506.02,0],
											[566.289,1840.15,0]
			
										];
/* Release The hordes here */
[1,"z_soldier_heavy"] 		call P2DZ_HC_ZHorde_spawnHorde;
[2,"z_soldier_heavy"] 		call P2DZ_HC_ZHorde_spawnHorde;

/*---------------------------------------------------------------------------
End of Typical-User Configuration
---------------------------------------------------------------------------*/
//www.ZombZ.net
P2DZ_HC_zedHordeConfigDone = true;