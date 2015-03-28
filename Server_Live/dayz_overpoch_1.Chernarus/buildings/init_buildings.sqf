/*---------------------------------------------------------------------------
Player2's Local Object System
---------------------------------------------------------------------------*/
/* How-To:
 Use P2LOS_createVeh to spawn in buildings
 Set P2LOS_finishedCreating to true after all buildings have been spawned in */

/* Global Vars */
P2DZ_customBuildingCount_Global = 0; P2DZ_customBuildingCount_Local = 0;
P2LOS_finishedCreating = false;

/* Functions */
P2LOS_createVeh = 	compile preprocessFileLineNumbers "P2LOS\createVeh.sqf";

/* Executions */
//OpenDoors for Local Objects (Client-side Loop)
call 				compile preprocessFileLineNumbers "P2LOS\OpenDoors.sqf";

/*---------------------------------------------------------------------------*/

call compile preprocessFileLineNumbers "buildings\Drozhino.sqf"; //Pos: [3847.0142, 4787.8877, 1.5258789e-005]
call compile preprocessFileLineNumbers "buildings\Drozhinoitem.sqf"; //Pos: [3841.5867, 4775.7349, -1.9062195]
call compile preprocessFileLineNumbers "buildings\Elektro2.sqf"; //Pos: [10286.419, 2084.4519, 0.17802812]
call compile preprocessFileLineNumbers "buildings\Elektro2item.sqf"; //Pos: [6603.0518, 2465.3159, 1.2874603e-005]
call compile preprocessFileLineNumbers "buildings\NEA.sqf"; //Pos: [10153.31, 1710.7061, -0.81663656]
call compile preprocessFileLineNumbers "buildings\NEAitem.sqf"; //Pos: [12174.332, 12746.813, 0.044486191]
call compile preprocessFileLineNumbers "buildings\Novylug.sqf"; //Pos: [9577.7266, 11299.333, 0.4098191]
call compile preprocessFileLineNumbers "buildings\Novylugitem.sqf"; //Pos: [9580.4238, 11308.442, 1.5258789e-005]
call compile preprocessFileLineNumbers "buildings\NWA.sqf"; //Pos: [4814.814, 10067.607, -6.1035156e-005]
call compile preprocessFileLineNumbers "buildings\NWAitem.sqf"; //Pos: [4819.8657, 10086.853, -3.0517578e-005]
call compile preprocessFileLineNumbers "buildings\Pulkovo.sqf"; //Pos: [4861.4014, 5633.7153, 0.1487579]
call compile preprocessFileLineNumbers "buildings\SkalkaTown.sqf"; //Pos: [1902.0646, 11947.333, -3.0517578e-005]
call compile preprocessFileLineNumbers "buildings\SkalkaTownitem.sqf"; //Pos: [1980.0703, 11913.91, 1.5258789e-005]
call compile preprocessFileLineNumbers "buildings\SkalkaOutpost.sqf"; //Pos: [2282.0522, 10825.35]
call compile preprocessFileLineNumbers "buildings\SkalkaOutpostitem.sqf"; //Pos: [2249.6692, 10832.145, -6.1035156e-005]
call compile preprocessFileLineNumbers "buildings\Balotaoutpost.sqf"; //Pos: [4048.4211, 2613.1758, 2.3841858e-006]
call compile preprocessFileLineNumbers "buildings\Balotaoutpostitems.sqf"; //Pos: [4040.615, 2602.0276, -2.3841858e-006]
call compile preprocessFileLineNumbers "buildings\Zelengorsk.sqf"; //Pos: [2501.8564, 5090.1445, 0.014888633]
call compile preprocessFileLineNumbers "buildings\Zelengorskitems.sqf"; //Pos: [2555.4353, 5040.814]
call compile preprocessFileLineNumbers "buildings\Elektro3.sqf"; //Pos: [11036.93, 2705.0854, -0.45178086]
call compile preprocessFileLineNumbers "buildings\Elektro3item.sqf"; //Pos: [10962.532, 2754.1912, 4.0054321e-005]
call compile preprocessFileLineNumbers "buildings\SurvivorCity_2.sqf"; //Pos: [5989.7915, 13910.804, -6.1035156e-005]
call compile preprocessFileLineNumbers "buildings\KumyrnaOutpost.sqf"; //Pos: [8355.7813, 5918.0068, 3.0517578e-005]
call compile preprocessFileLineNumbers "buildings\Mogilevka_Checkpoint.sqf"; //Pos: [8245.3574, 4897.6006, 3.0517578e-005]
call compile preprocessFileLineNumbers "buildings\Balota.sqf"; //Pos: [4898.2666, 2474.738, -1.9073486e-006]
call compile preprocessFileLineNumbers "buildings\Kamenka_tents.sqf"; //Pos: [1117.6555, 2455.2349, 2.2888184e-005]
call compile preprocessFileLineNumbers "buildings\Gorka.sqf"; //Pos: [9788.2813, 8763.2217, 1]
call compile preprocessFileLineNumbers "buildings\Berezino.sqf"; //Pos: [13065.543, 8346.4258, -0.13266796]
call compile preprocessFileLineNumbers "buildings\Elektro1.sqf"; //Pos: [11036.93, 2705.0854, -0.45178086]
call compile preprocessFileLineNumbers "buildings\KamyshovoRoadblock.sqf"; //Pos: [12985.606, 3800.031, -1.6689301e-005]
call compile preprocessFileLineNumbers "buildings\Kamenka.sqf"; //Pos: [1924.1563, 2186.6108, 6.6757202e-006]
call compile preprocessFileLineNumbers "buildings\PikKozlova_trainingGround.sqf"; //Pos: [8737.1816, 2335.4153, -1.4305115e-005]
call compile preprocessFileLineNumbers "buildings\PikKozlova_trainingGround_items.sqf"; //Pos: [8737.1816, 2335.4153, -1.4305115e-005]

/* ZombZ Flag - Pik Kozlova Training Ground */
private["_o2"];
_o2 = nil; _o2 = objNull;
_o2 = "FlagCarrierBIS_EP1" createVehicleLocal [8737.1816, 2335.4153, -1.4305115e-005];
_o2 setPos [8737.1816, 2335.4153, -1.4305115e-005];
_o2 setFlagTexture "img\logo.paa";

/* 	ZombZ Community Flags @ All Traders && Wholesalers */
{
	private["_o"];
	_o = nil; _o = objNull;
	_o = "FlagCarrierBIS_EP1" createVehicleLocal _x;
	_o setPos _x;
	_o setFlagTexture "img\logo.paa";
} count [[6321.55,7791.93,0.00411987],[11473.7,11365,0.00146484],[4056.55,11662.1,0.0017395],[12048.2,12649.3,0.00143433],[12943.2,12759.2,0.00134277],[1623.79,7798.52,0.00152588],[4361.21,2261.7,0.00143886],[8008.73,2905.32,0.00109911],[13434.3,5443.32,0.000936985],[13530,6356.39,0.00143886]];


/*---------------------------------------------------------------------------*/

P2LOS_finishedCreating = true;
diag_log(format['%1: %2: %3','P2DEBUG','Custom Map Objects Created (Local)',P2DZ_customBuildingCount_Local]);
diag_log(format['%1: %2: %3','P2DEBUG','Custom Map Objects Created (Global)',P2DZ_customBuildingCount_Global]);
