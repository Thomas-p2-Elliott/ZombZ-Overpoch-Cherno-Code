/*---------------------------------------------------------------------------------------
File:		 fnc_specialLoot.sqf
Author: 	 Player2
Website:	 www.ZombZ.net

Description: Sets up and provides configuration for server event loot.

Parameters:

	_this select 0 - Type of Event, 1 = Heli Crash, 2 = Care Package, 3 = Infected Camp
	_this select 1 - Sub Type of Event, see below.
-----------------------------------------------------------------------------------------
Heli Crash Subtypes:

	1 = UH60Wreck_DZ, UH1Wreck_DZ
	2 = UH60_NAVY_Wreck_DZ, UH60_NAVY_Wreck_burned_DZ
	3 = UH60_ARMY_Wreck_DZ, UH60_ARMY_Wreck_burned_DZ

Care Package Subtypes:

	1 = Military
	2 = Medical
	3 = Industrial
	4 = Base Building

Infected Camp Subtypes: 
	1 = Default
---------------------------------------------------------------------------------------*/
private["_eventType","_eventSubType","_itemTypes","_lootTable","_itemChance"];

_eventType = _this select 0;
_eventSubType = _this select 1;
_itemTypes = []; _itemChance = []; _lootTable = []; 
diag_log("fnc_specialLoot: " + str(_this));
_lootTable = [_itemTypes,_itemChance];
switch (_eventType) do {
	default 				{ diag_log("Error undefined _eventType: Default: " + __FILE__); };
	case 1: { 
	//Heli Crashsite Loot
		switch (_eventSubType) do {
 				
 				/* Normal Heli Crash
 				Description: Standard / Classic UH1Y/UH60 ( http://tinyurl.com/q4zses4 / http://tinyurl.com/ljgw3yu) Wreck Model 
 				LootTable:	Best of the best with L85's, LMGs, MedRifles, And ACRs
 				*/
				case 1: 				{ 
				_itemTypes = [
							//Weapons
							["L85Weaps", "custom_weapon"],		
							["RiflesMedWeaps", "custom_weapon"],		
							["ACRHighWeaps", "custom_weapon"],		
							["LMGWeaps", "custom_weapon"],		

							["PistolTopWeaps", "custom_weapon"],			
							["HMGWeaps", "custom_weapon"],					
							["SniperMedWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],							
							["SniperTopWeaps", "custom_weapon"],
							["UltraWeaps", "custom_weapon"],														
							["TWSWeaps", "custom_weapon"],						
							//Misc Loot
							["MedBox0", "object"],										//Misc. Loot
							["AmmoBoxSmall_762", "object"],								//Misc. Loot
							["AmmoBoxSmall_556", "object"],								//Misc. Loot
							["Binocular_Vector", "weapon"],								//Misc. Loot
							//Skins
							["Skin_RU_Soldier_Crew_DZ", "magazine"],					//Crewman
							["Skin_Sniper1_DZ", "magazine"]	,	     					//Ghillie Suit
							["Skin_CZ_Soldier_Sniper_EP1_DZ", "magazine"],				//Desert Ghillie
							["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", "magazine"],   	//Special Forces 
							["Skin_Soldier1_DZ", "magazine"],							//Soldier Clothing
							["Skin_Rocket_DZ", "magazine"],	     						//Officer Suit
							["Skin_Drake_Light_DZ", "magazine"]	,						//Desert Camo 
							["Skin_FR_Rodriguez_DZ", "magazine"],						//Gunner Outfit
							["Skin_Graves_Light_DZ", "magazine"],						//Urban Camo
							["Skin_Soldier_TL_PMC_DZ", "magazine"],						//Team Leader
							["Skin_Soldier_Sniper_PMC_DZ", "magazine"]					//Marksman 
				];

				_itemChance = [ 
								//Weapons = 45%
								//Main Spawners (20%)
								0.05,  //L85's
								0.05,  //Medium Power Rifles
								0.05,  //High Power ACRs
								0.05,  //Light Machine Guns
								//Global crash site spawners (25%) -> WARNING: Modified for this Class ONLY! (Rocket,TopSnip,Launch Changes)
								0.10, //Top Pistols
								0.04,  //Heavy Machine Guns
								0.04, //Mid Snipers
								0.01, //Launcher Weaps
								0.02, //Rocket Weaps
								0.02, //Top Snipers (Ends up as +0.019% thanks to TWS weapons swapping down to it 90% of the time)
								0.01, //Ultra Weapons = 1%
								0.01, //TWS Weapons = 1% (Gets Reduced to 10% of this later, with 90% of time swapping to topSnipers)

							    ///Misc. Loot = 20%
							    0.06,
							    0.06,
							    0.07,
							    0.01,

							    //Skins Total == 20% (Ghillie Suit Sniper1 given 1% boost for this crashsite ONLY)
							    0.02, 
							    0.02,   
							    0.01,  
							    0.01, 
							    0.02, 
							    0.02,   
							    0.02, 
							    0.02, 
							    0.02, 
							    0.02,   
							    0.02
				];
 				
 				_lootTable = [_itemTypes,_itemChance]; 
 			};

 			/* Navy Heli Crash
 				Description: US Navy Crash (Navy MH60 Wreck - Img: http://tinyurl.com/pvv2cot)
 				LootTable:	Best of the best with High Powered HK417s and ACRs being the common rifles and western skin packages
 				*/
			case 2: 				{ 
				_itemTypes = [
							//Weapons
							["ACRHighWeaps", "custom_weapon"],	
							["HK417Weaps", "custom_weapon"],

							["HMGWeaps", "custom_weapon"],		
							["PistolTopWeaps", "custom_weapon"],						
							["SniperMedWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],							
							["SniperTopWeaps", "custom_weapon"],
							["UltraWeaps", "custom_weapon"],														
							["TWSWeaps", "custom_weapon"],						
							//Misc Loot
							["MedBox0", "object"],										//Misc. Loot
							["AmmoBoxSmall_762", "object"],								//Misc. Loot
							["AmmoBoxSmall_556", "object"],								//Misc. Loot
							["Binocular_Vector", "weapon"],								//Misc. Loot
							//Skins
							["Skin_RU_Soldier_Crew_DZ", "magazine"],					//Crewman
							["Skin_Sniper1_DZ", "magazine"]	,	     					//Ghillie Suit
							["Skin_CZ_Soldier_Sniper_EP1_DZ", "magazine"],				//Desert Ghillie
							["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", "magazine"],   	//Special Forces 
							["Skin_Soldier1_DZ", "magazine"],							//Soldier Clothing
							["Skin_Rocket_DZ", "magazine"],	     						//Officer Suit
							["Skin_Drake_Light_DZ", "magazine"]	,						//Desert Camo 
							["Skin_FR_Rodriguez_DZ", "magazine"],						//Gunner Outfit
							["Skin_Graves_Light_DZ", "magazine"],						//Urban Camo
							["Skin_Soldier_TL_PMC_DZ", "magazine"],						//Team Leader
							["Skin_Soldier_Sniper_PMC_DZ", "magazine"]					//Marksman 
				];

				_itemChance = [ 
								//Weapons = 45%
								//Main Spawners: (20%)
								0.15,  //High Powered HK417
								0.05,  //High Powered ACRs
								//Global crash site spawners (25%)
								0.10, //Top Pistols
								0.04,  //Heavy Machine Guns
								0.04, //Mid Snipers
								0.03, //Launcher Weaps
								0.01, //Rocket Weaps
								0.01, //Top Snipers (Ends up as 0.019% thanks to TWS weapons swapping down to it 90% of the time)
								0.01, //Ultra Weapons = 1%
								0.01, //TWS Weapons = 1% (Gets Reduced to 10% of this later, remainder is set to TopSnipers, so actually ends up as 0.1% (1/1000) with 0.009% added to TopSniper Spawns)

							    ///Misc. Loot = 20%
							    0.06,
							    0.06,
							    0.07,
							    0.01,

							    //Skins Total == 20% 
							    0.03, 
							    0.01,   
							    0.01,  
							    0.01, 
							    0.02, 
							    0.02,   
							    0.02, 
							    0.02, 
							    0.02, 
							    0.02,   
							    0.02
							 ];
 				
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			//Army Heli Crash http://tinyurl.com/owegeg6
 			 /* Army Heli Crash
 				Description: US Army Crash (Army MH60 Wreck - Img: http://tinyurl.com/owegeg6
 				LootTable:	Best of the best with High Powered Scars being the common rifles and western skin packages
 			*/
			case 3: 				{ 
				_itemTypes = [
							//Weapons
							["ScarLowWeaps", "custom_weapon"],	
							["ScarHighWeaps", "custom_weapon"],

							["HMGWeaps", "custom_weapon"],		
							["PistolTopWeaps", "custom_weapon"],						
							["SniperMedWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],							
							["SniperTopWeaps", "custom_weapon"],
							["UltraWeaps", "custom_weapon"],														
							["TWSWeaps", "custom_weapon"],						
							//Misc Loot
							["MedBox0", "object"],										//Misc. Loot
							["AmmoBoxSmall_762", "object"],								//Misc. Loot
							["AmmoBoxSmall_556", "object"],								//Misc. Loot
							["Binocular_Vector", "weapon"],								//Misc. Loot
							//Skins
							["Skin_RU_Soldier_Crew_DZ", "magazine"],					//Crewman
							["Skin_Sniper1_DZ", "magazine"]	,	     					//Ghillie Suit
							["Skin_CZ_Soldier_Sniper_EP1_DZ", "magazine"],				//Desert Ghillie
							["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", "magazine"],   	//Special Forces 
							["Skin_Soldier1_DZ", "magazine"],							//Soldier Clothing
							["Skin_Rocket_DZ", "magazine"],	     						//Officer Suit
							["Skin_Drake_Light_DZ", "magazine"]	,						//Desert Camo 
							["Skin_FR_Rodriguez_DZ", "magazine"],						//Gunner Outfit
							["Skin_Graves_Light_DZ", "magazine"],						//Urban Camo
							["Skin_Soldier_TL_PMC_DZ", "magazine"],						//Team Leader
							["Skin_Soldier_Sniper_PMC_DZ", "magazine"]					//Marksman 
				];

				_itemChance = [ 
								//Weapons = 45%
								
								//Main Spawners: (20% overall, 50% of gun spawns.)
								0.05,  //Low Powered Scars  (Mk16's)
								0.15,  //High Powered Scars (mk17's)
								//Global crash site spawners (25%)
								0.10, //Top Pistols
								0.04,  //Heavy Machine Guns
								0.04, //Mid Snipers
								0.03, //Launcher Weaps
								0.01, //Rocket Weaps
								0.01, //Top Snipers (Ends up as 0.019% thanks to TWS weapons swapping down to it 90% of the time)
								0.01, //Ultra Weapons = 1%
								0.01, //TWS Weapons = 1% (Gets Reduced to 10% of this later, remainder is set to TopSnipers, so actually ends up as 0.001% (1/1000) with 0.009% added to TopSniper Spawns)

							    ///Misc. Loot = 20%
							    0.06,
							    0.06,
							    0.07,
							    0.01,

							    //Skins Total == 20% 
							    0.03, 
							    0.01,   
							    0.01,  
							    0.01, 
							    0.02, 
							    0.02,   
							    0.02, 
							    0.02, 
							    0.02, 
							    0.02,   
							    0.02
				];
 				
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
		}; 
	};
	case 2: { 
	//Care Package Loot
		switch (_eventSubType) do {
			/*
				Military Care Package
			*/
			case 1: 				{ 
				_itemTypes = [
							//Weapons
							["PistolMilWeaps", "custom_weapon"],
							["PistolTopWeaps", "custom_weapon"],			
							["AKHighWeaps", "custom_weapon"],									
							["ScarLowWeaps", "custom_weapon"],		
							["HK416Weaps", "custom_weapon"],
							["RiflesMedWeaps", "custom_weapon"],		
							["ACRHighWeaps", "custom_weapon"],		
							["LMGWeaps", "custom_weapon"],	
							["L85Weaps", "custom_weapon"],		
							["LMGWeaps", "custom_weapon"],		
							["M4Weaps", "custom_weapon"],	
							["M8Weaps", "custom_weapon"],					
							["G36Weaps", "custom_weapon"],					
							["MasWeaps", "custom_weapon"],	
							["SVDWeaps", "custom_weapon"],					
							["HMGWeaps", "custom_weapon"],					
							["ScarHighWeaps", "custom_weapon"],					
							["HK417Weaps", "custom_weapon"],					
							["SniperMedWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],	
							//Misc Loot
							["MedBox0", "object"],										//Misc. Loot
							["AmmoBoxSmall_762", "object"],								//Misc. Loot
							["AmmoBoxSmall_556", "object"],								//Misc. Loot
							["Binocular_Vector", "weapon"],								//Misc. Loot

							//Skins
							["Skin_RU_Soldier_Crew_DZ", "magazine"],					//Crewman
							["Skin_Sniper1_DZ", "magazine"]	,	     					//Ghillie Suit
							["Skin_CZ_Soldier_Sniper_EP1_DZ", "magazine"],				//Desert Ghillie
							["Skin_CZ_Special_Forces_GL_DES_EP1_DZ", "magazine"],   	//Special Forces 
							["Skin_Soldier1_DZ", "magazine"],							//Soldier Clothing
							["Skin_Rocket_DZ", "magazine"],	     						//Officer Suit
							["Skin_Drake_Light_DZ", "magazine"]	,						//Desert Camo 
							["Skin_FR_Rodriguez_DZ", "magazine"],						//Gunner Outfit
							["Skin_Graves_Light_DZ", "magazine"],						//Urban Camo
							["Skin_Soldier_TL_PMC_DZ", "magazine"],						//Team Leader
							["Skin_Soldier_Sniper_PMC_DZ", "magazine"]					//Marksman 
				];

				_itemChance = [ 
								//Weapons = 45%
								//Pistols (10%)
								0.05,
								0.05,
								//Good Low Power Rifles (9%) ((19%))
								0.03,
								0.03,
								0.03,
								//Decent Rifles (6%) ((25%))
								0.02,
								0.02,
								0.02,
								//Low Power Rifles (12%) ((37%))
								0.02,
								0.02,
								0.02,
								0.02,
								0.02,
								0.02,
								//High Power, Top Rifles (8%) ((%45))
								0.03,
								0.02,
								0.02,
								0.02,
								0.02,
								0.02,
								0.02,

							    ///Misc. Loot = 20%
							    0.06,
							    0.06,
							    0.07,
							    0.01,

							    //Skins Total == 20% (Ghillie Suit Sniper1 given 1% boost for this crashsite ONLY)
							    0.02, 
							    0.02,   
							    0.01,  
							    0.01, 
							    0.02, 
							    0.02,   
							    0.02, 
							    0.02, 
							    0.02, 
							    0.02,   
							    0.02
				];
 				
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			//Medical Care Package
			case 2: 				{ 
				_itemTypes = [["MedBox0", "object"],["AmmoBoxSmall_556", "object"],["AmmoBoxSmall_762", "object"],["FoodBox0", "object"],["", "hospital"],["DZ_CivilBackpack_EP1", "object"],["", "medical"]];
				_itemChance = [0.09,0.01,0.01,0.06,0.06,0.01,0.06];  
				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			

 			//Industrial Care Package
			
			case 3: 				{		
		 		_itemTypes = [
		 		["PartFueltank","magazine"],
				["PartWheel", "magazine"],
				["PartGeneric", "magazine"], 
				["PartEngine", "magazine"],
				["PartWoodPile", "magazine"],
				["PartVRotor", "magazine"],
				["PartGlass", "magazine"],
				["ItemJerrycanEmpty", "magazine"],
				["ItemJerrycan", "magazine"],
				["ItemGenerator", "magazine"],
				["ItemSandbag", "magazine"],
				["ItemTankTrap", "magazine"],
				["ItemWire", "magazine"],
				["ItemMixOil", "magazine"],
				["CSGAS", "magazine"],
				["ItemJerryMixed", "magazine"],
				["ItemJerryMixed4", "magazine"],
				["ItemJerryMixed3", "magazine"],
				["ItemJerryMixed2", "magazine"],
				["ItemJerryMixed1", "magazine"],
				["ItemOilBarrel", "magazine"],
				["ItemFuelBarrel", "magazine"],
				["ItemFuelBarrelEmpty", "magazine"],
				["CinderBlocks", "magazine"],
				["MortarBucket", "magazine"],
				["ItemLightBulb", "magazine"],
				["ItemHotwireKit", "magazine"]
		 		];
            	
            	_itemChance = [

						0.2,
						0.2,
						0.2,
						0.2,
						0.02,
						0.02,
						0.2,
						0.08,
						0.03,
						0.02,
						0.02,
						0.02,
						0.02,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.02,
						0.03,
						0.02,
						0.02,
						0.02
						 
							];   
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			


 			//Base Building Care Package
			
			case 4: 				{ 
				_itemTypes = [
					["ChainSaw", "weapon"],         			//Super Rare like rare as hell fucking mega silly rare
					["metal_floor_kit", "magazine"],  			//SuperFuckingRare
					["cinder_door_kit", "magazine"],        	//Rare
					["ItemPlotDeed", "magazine"],    			//Rare
					["CinderWall_DZ", "magazine"],          	//Rare
					["CinderWallDoorway_DZ", "magazine"],   	//Rare
					["WoodLargeWall_DZ", "magazine"],       	//Rare
					["Fence_corrugated_DZ", "magazine"],    	//Rare
					["30m_plot_kit","magazine"],  				//Uncommon
					["Land_HBarrier_large", "building"],		//Uncommon
					["OutHouse_DZ", "magazine"],     			//Uncommon
					["cinder_wall_kit", "magazine"],        	//Uncommon
					["ItemWoodWallWithDoor", "magazine"],  		//Uncommon
					["Land_HBarrier1", "building"],         	//Uncommon
					["ItemComboLock", "magazine"],    			//Uncommon
					["WoodFloor_DZ", "magazine"],    			//Uncommon
					["WoodLadder_DZ", "magazine"],          	//Uncommon
					["WeaponHolder_MeleeCrowbar", "weapon"],  	//Uncommon
					["ParLumbertWood", "magazine"],     		//Common
					["PartWoodPlywood", "magazine"],        	//Common
					["ItemTankTrap", "magazine"],           	//Common
					["CinderBlocks", "magazine"],    			//Common
					["MortarBucket", "magazine"]            	//Common
				];
				_itemChance = [ 
					0.01,
					0.02,
					0.03,
					0.03,
					0.03,
					0.03,
					0.03,
					0.03,
					0.04,
					0.04,
					0.04,
					0.04,
					0.04,
					0.04,
					0.04,
					0.04,
					0.04,
					0.05,
					0.08,
					0.08,
					0.08,
					0.07,
					0.07
				]; 

				_lootTable = [_itemTypes,_itemChance]; 
 			};
		}; 
	};
	

	case 3: { 
	

	//Infected Camp Loot
		switch (_eventSubType) do {
 			//Default
			case 1: 				{ 	
				_itemTypes = [["DMR_DZ", "weapon"],["BAF_LRR_scoped", "object"],["BAF_LRR_scoped_W", "weapon"],["MedBox0", "object"],["AmmoBoxSmall_762", "object"],["Skin_Soldier1_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["M136", "weapon"],["Skin_Camo27_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["M136", "weapon"],["Skin_Camo25_DZ", "magazine"],["M136", "weapon"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo25_DZ", "magazine"],["Skin_Camo26_DZ", "magazine"],["Skin_Camo27_DZ", "magazine"],["Skin_Camo18_DZ", "magazine"],["Skin_Camo19_DZ", "magazine"],["DZ_CivilBackpack_EP1", "object"],["DZ_CivilBackpack_EP1", "object"],["DZ_CivilBackpack_EP1", "object"],["Skin_Camo23_DZ", "magazine"],["M136", "weapon"],["Skin_Sniper1_DZ", "magazine"],["Skin_Sniper2_DZ", "magazine"],["Skin_Sniper3_DZ", "magazine"],["Skin_Sniper4_DZ", "magazine"],["Skin_Sniper5_DZ", "magazine"],["Skin_Sniper6_DZ", "magazine"],["vil_USP45SD", "weapon"],["vil_uzi_SD", "weapon"],["vil_uzimini_SD", "weapon"],["vil_apssd", "weapon"],["RH_m9csd", "weapon"],["RH_uspsd", "weapon"],["RH_mk22sd", "weapon"],["RH_deagle", "weapon"],["RH_Deagles", "weapon"],["RH_Deaglem", "weapon"],["RH_Deaglemz", "weapon"],["RH_Deaglemzb", "weapon"],["RH_anac", "weapon"],["RH_anacg", "weapon"],["RH_bull", "weapon"],["RH_python", "weapon"],["AK_107_pso", "weapon"],["RH_hk417sdaim", "weapon"],["RH_hk417sdeotech", "weapon"],["RH_hk417sdacog", "weapon"],["RH_hk417sdsp", "weapon"],["RH_massdaim", "weapon"],["RH_massdeotech", "weapon"],["RH_massdacog", "weapon"],["RH_masbsdaim", "weapon"],["RH_masbsdeotech", "weapon"],["RH_masbsdacog", "weapon"],["RH_acrbglacog", "weapon"],["RH_m14eot", "weapon"],["RH_m21", "weapon"],["RH_sc2eot", "weapon"],["RH_sc2shd", "weapon"],["RH_sc2sp", "weapon"],["RH_m1seot", "weapon"],["RH_m1sshd", "weapon"],["RH_m1ssp", "weapon"],["m8_sharpshooter", "weapon"],["m8_SAW", "weapon"],["SCAR_H_STD_EGLM_Spect", "weapon"],["SCAR_H_LNG_Sniper", "weapon"],["SCAR_H_LNG_Sniper_SD", "weapon"],["SCAR_L_STD_EGLM_RCO", "weapon"],["M136", "weapon"],["SCAR_L_CQC_CCO_SD", "weapon"],["SCAR_H_CQC_CCO_SD", "weapon"],["FHQ_ACR_WDL_HAMR_SD", "weapon"],["FHQ_ACR_WDL_RCO_SD", "weapon"],["FHQ_ACR_BLK_HAMR_SD", "weapon"],["FHQ_ACR_BLK_RCO_SD", "weapon"],["FHQ_ACR_TAN_RCO_SD", "weapon"],["FHQ_ACR_TAN_HAMR_SD", "weapon"],["FHQ_ACR_SNW_RCO_GL_SD", "weapon"],["FHQ_ACR_SNW_HAMR_SD", "weapon"],["vil_RPD", "weapon"],["vil_AK_74m_EOT_FSB_60", "weapon"],["vil_Minimi", "weapon"],["vil_Mg3", "weapon"],["vil_M4_EOT", "weapon"],["VSS_vintorez", "weapon"],["USSR_cheytacM200", "weapon"],["DZ_CivilBackpack_EP1", "object"],["FHQ_MSR_DESERT", "weapon"],["FHQ_RSASS_TAN", "weapon"],["FHQ_XM2010_DESERT", "weapon"],["DZ_CivilBackpack_EP1", "object"]];
 				_itemChance = [0.01,0.02,0.01,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.03,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.03,0.01,0.01,0.01,0.01,0.01,0.01];
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
		}; 
	};
};


_lootTable = [_itemTypes,_itemChance];
_lootTable