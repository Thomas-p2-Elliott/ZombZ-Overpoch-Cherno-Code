/*---------------------------------------------------------------------------
Local Buildings Animation Fixes by Player2

Theory: Local object animations don't get sent across network, so player closing firestation doors for cover will not get cover
as the enemy will not see the door close...

Solution:
Force all doors open for all objects with doors at all times on all players


How? For each object created call a check to see if it has doors that can be opened
if it has doors add it to a list with all the open door animations it has available
then play them open door animations in a constant loop
---------------------------------------------------------------------------*/
/*Important: For this to work you MUST include: OBJECT call P2LOS_OpenDoors_CheckObject per object on its creation*/
P2DZ_customBuildingCount_Global = 0; P2DZ_customBuildingCount_Local = 0;
P2LOS_createVeh = compile preprocessFileLineNumbers "P2LOS\createVeh.sqf";
call compile preprocessFileLineNumbers "P2LOS\OpenDoors.sqf";
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

diag_log(format['%1: %2: %3','P2DEBUG','Custom Map Objects Created (Local)',P2DZ_customBuildingCount_Local]);
diag_log(format['%1: %2: %3','P2DEBUG','Custom Map Objects Created (Global)',P2DZ_customBuildingCount_Global]);

/* 		
	ZombZ Community Flags by Player2
	Added to All Traders
*/

private ["_f1", "_f2", "_f3", "_f4", "_f5", "_f6", "_f7", "_f8", "_f9", "_f10"];
// Starry Trader
_f1 =  "FlagCarrierBIS_EP1" createVehicleLocal [6321.55,7791.93,0.00411987];
_f1 setFlagTexture 'img\logo.paa';  
_f1 setPos [6321.55,7791.93,0.00411987];

//Klen Trader 
_f2 =  "FlagCarrierBIS_EP1" createVehicleLocal [11473.7,11365,0.00146484];
_f2 setFlagTexture 'img\logo.paa';  
_f2 setPos [11473.7,11365,0.00146484];

//Bash Trader
_f3 =  "FlagCarrierBIS_EP1" createVehicleLocal [4056.55,11662.1,0.0017395];
_f3 setFlagTexture 'img\logo.paa';  
_f3 setPos [4056.55,11662.1,0.0017395];

//NEAF Aircraft Dealer
_f4 =  "FlagCarrierBIS_EP1" createVehicleLocal [12048.2,12649.3,0.00143433];
_f4 setFlagTexture 'img\logo.paa';  
_f4 setPos [12048.2,12649.3,0.00143433];

//Hero Trader
_f5 =  "FlagCarrierBIS_EP1" createVehicleLocal [12943.2,12759.2,0.00134277];
_f5 setFlagTexture 'img\logo.paa';  
_f5 setPos [12943.2,12759.2,0.00134277];

//Bandit Trader
_f6 =  "FlagCarrierBIS_EP1" createVehicleLocal [1623.79,7798.52,0.00152588];
_f6 setFlagTexture 'img\logo.paa';  
_f6 setPos [1623.79,7798.52,0.00152588];

//Balota Wholesaler
_f7 =  "FlagCarrierBIS_EP1" createVehicleLocal [4361.21,2261.7,0.00143886];
_f7 setFlagTexture 'img\logo.paa';  
_f7 setPos [4361.21,2261.7,0.00143886];

//Cherno Boat Dealer
_f8 =  "FlagCarrierBIS_EP1" createVehicleLocal [8008.73,2905.32,0.00109911];
_f8 setFlagTexture 'img\logo.paa';  
_f8 setPos [8008.73,2905.32,0.00109911];

//Solnichy Boat Dealer
_f9 =  "FlagCarrierBIS_EP1" createVehicleLocal [13434.3,5443.32,0.000936985];
_f9 setFlagTexture 'img\logo.paa';  
_f9 setPos [13434.3,5443.32,0.000936985];

//Solnichy Wholesaler
_f10 =  "FlagCarrierBIS_EP1" createVehicleLocal [13530,6356.39,0.00143886];
_f10 setFlagTexture 'img\logo.paa';  
_f10 setPos [13530,6356.39,0.00143886];