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
private ["_eventType","_eventSubType","_itemTypes","_lootTable","_itemChance"];

_eventType = _this select 0;
_eventSubType = _this select 1;
_itemTypes = []; _itemChance = []; _lootTable = []; 
//diag_log("fnc_specialLoot: " + str(_this));
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
							//Crashsite Specific Weapons
							["ScarHighWeaps", "custom_weapon"],		
							["RiflesMedWeaps", "custom_weapon"],		
							["ACRHighWeaps", "custom_weapon"],		
							["HK417Weaps", "custom_weapon"],
							//Global Weapons		
							["PistolTopWeaps", "custom_weapon"],			
							["HMGWeaps", "custom_weapon"],					
							["SniperMedWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],							
							["SniperTopWeaps", "custom_weapon"],
							["UltraWeaps", "custom_weapon"],														
							["TWSWeaps", "custom_weapon"],						
							//Misc Loot
							["MedBox0", "object"],						
							["AmmoBoxSmall_762", "object"],							
							["AmmoBoxSmall_556", "object"],								
							["Binocular_Vector", "weapon"],	
							["hospital","hospital"],
							["militaryammo","militaryammo"],
							["militarypilot","militarypilot"],
							["policeman","policeman"],
							//Backpacks
							["militarybackpacks","militarybackpacks"],
							//Skins
							["militaryclothes", "militaryclothes"]
				];

				_itemChance = [ 
								//Weapons = 45%
								//Main Spawners (20%)
								0.05,  //ScarHighWeaps
								0.05,  //Medium Power Rifles
								0.05,  //High Power ACRs
								0.05,  //HK417Weaps
								//Global crash site spawners (25%) -> WARNING: Modified for this Class ONLY! (Rocket,TopSnip,Launch Changes)
								0.10, //Top Pistols
								0.04,  //Heavy Machine Guns
								0.04, //Mid Snipers
								0.01, //Launcher Weaps
								0.02, //Rocket Weaps
								0.02, //Top Snipers 
								0.01, //Ultra Weapons = 1%  (Gets Reduced to 40% of this later, with 90% of time swapping to MediumSnipers)
								0.01, //TWS Weapons = 1% (Gets Reduced to 10% of this later, with 90% of time swapping to MediumSnipers)

							    ///Misc. Loot = 45%
							    0.02,
							    0.01,
							    0.02,
							    0.02,
							    0.09,
							    0.01,
							    0.20,
							    0.08,

							    //Backpacks = 5%
							    0.05,

							    //Skins Total = 5%
							    0.05
				];
 				
 				_lootTable = [_itemTypes,_itemChance]; 
 			};

 			/* Navy Heli Crash
 				Description: US Navy Crash (Navy MH60 Wreck - Img: http://tinyurl.com/pvv2cot)
 				LootTable:	Best of the best with High Powered HK417s and ACRs being the common rifles and western skin packages
 				*/
			case 2: 				{ 
				_itemTypes = [
							//Crashsite Specific Weapons
							["ACRHighWeaps", "custom_weapon"],	
							["HK417Weaps", "custom_weapon"],
							//Global Weapons		
							["HMGWeaps", "custom_weapon"],		
							["PistolTopWeaps", "custom_weapon"],						
							["SniperMedWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],							
							["SniperTopWeaps", "custom_weapon"],
							["UltraWeaps", "custom_weapon"],														
							["TWSWeaps", "custom_weapon"],						
							//Misc Loot
							["MedBox0", "object"],						
							["AmmoBoxSmall_762", "object"],							
							["AmmoBoxSmall_556", "object"],								
							["Binocular_Vector", "weapon"],	
							["hospital","hospital"],
							["militaryammo","militaryammo"],
							["militarypilot","militarypilot"],
							["policeman","policeman"],
							//Backpacks
							["militarybackpacks","militarybackpacks"],
							//Skins
							["militaryclothes", "militaryclothes"]
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
								0.01, //Top Snipers 
								0.01, //Ultra Weapons = 1%  (Gets Reduced to 40% of this later, with 90% of time swapping to MediumSnipers)
								0.01, //TWS Weapons = 1% (Gets Reduced to 10% of this later, with 90% of time swapping to MediumSnipers)

							    ///Misc. Loot = 45%
							    0.02,
							    0.01,
							    0.02,
							    0.02,
							    0.09,
							    0.01,
							    0.20,
							    0.08,

							    //Backpacks = 5%
							    0.05,

							    //Skins Total = 5%
							    0.05
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
							//Crashsite Specific Weapons
							["ScarLowWeaps", "custom_weapon"],	
							["ScarHighWeaps", "custom_weapon"],
							//Global Weapons		
							["HMGWeaps", "custom_weapon"],		
							["PistolTopWeaps", "custom_weapon"],						
							["SniperMedWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],							
							["SniperTopWeaps", "custom_weapon"],
							["UltraWeaps", "custom_weapon"],														
							["TWSWeaps", "custom_weapon"],						
							//Misc Loot
							["MedBox0", "object"],						
							["AmmoBoxSmall_762", "object"],							
							["AmmoBoxSmall_556", "object"],								
							["Binocular_Vector", "weapon"],	
							["hospital","hospital"],
							["militaryammo","militaryammo"],
							["militarypilot","militarypilot"],
							["policeman","policeman"],
							//Backpacks
							["militarybackpacks","militarybackpacks"],
							//Skins
							["militaryclothes", "militaryclothes"]
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
								0.01, //Top Snipers 
								0.01, //Ultra Weapons = 1%  (Gets Reduced to 40% of this later, with 90% of time swapping to MediumSnipers)
								0.01, //TWS Weapons = 1% (Gets Reduced to 10% of this later, with 90% of time swapping to MediumSnipers)

							    ///Misc. Loot = 45%
							    0.02,
							    0.01,
							    0.02,
							    0.02,
							    0.09,
							    0.04,
							    0.17,
							    0.08,

							    //Backpacks = 5%
							    0.05,

							    //Skins Total = 5%
							    0.05
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
							//Pistols (10%)
							["PistolMilWeaps", "custom_weapon"],
							["PistolTopWeaps", "custom_weapon"],
							//Good Low Power Rifles (9%)
							["AKHighWeaps", "custom_weapon"],									
							["ScarLowWeaps", "custom_weapon"],		
							["HK416Weaps", "custom_weapon"],
							//Decent Rifles (6%) 
							["RiflesMedWeaps", "custom_weapon"],		
							["ACRHighWeaps", "custom_weapon"],		
							["LMGWeaps", "custom_weapon"],
							//Low Power Rifles (12%)
							["L85Weaps", "custom_weapon"],		
							["M4Weaps", "custom_weapon"],	
							["M8Weaps", "custom_weapon"],					
							["G36Weaps", "custom_weapon"],					
							["MasWeaps", "custom_weapon"],	
							["SVDWeaps", "custom_weapon"],
							//High Power, Top Rifles (8%)
							["HMGWeaps", "custom_weapon"],					
							["ScarHighWeaps", "custom_weapon"],					
							["HK417Weaps", "custom_weapon"],					
							["SniperTopWeaps", "custom_weapon"],	
							["LauncherWeaps", "custom_weapon"],						
							["RocketWeaps", "custom_weapon"],
							//Misc Loot (45%)
							["MedBox0", "object"],						
							["AmmoBoxSmall_762", "object"],							
							["AmmoBoxSmall_556", "object"],								
							["Binocular_Vector", "weapon"],	
							["hospital","hospital"],
							["militaryammo","militaryammo"],
							["militarypilot","militarypilot"],
							["policeman","policeman"],
							//Backpacks (5%)
							["militarybackpacks","militarybackpacks"],
							//Skins (5%)
							["militaryclothes", "militaryclothes"]
				];

				_itemChance = [ 
							//Weapons = 45%
							//Pistols (10%)
							0.08, //PistolsMilWeaps
							0.02, //PistolsTopWeaps
							//Good Low Power Rifles (9%) ((19%))
							0.03, //AKHighWeaps
							0.03, //ScarLowWeaps
							0.03, //HK416Weaps
							//Decent Rifles (6%) ((25%))
							0.02, //RiflesMedWeaps
							0.02, //ACRHighWeaps
							0.02, //LMGWeaps
							//Low Power Rifles (12%) ((37%))
							0.02, //L85Weaps
							0.02, //M4Weaps
							0.02, //M8Weaps
							0.02, //G36Weaps
							0.02, //MasWeaps
							0.02, //SVDWeaps
							//High Power, Top Rifles (8%) ((%45))
							0.03, //HMG Weaps
							0.02, //ScarHighWeaps
							0.03, //HK417Weaps
							0.01, //SniperTopWeaps
							0.02, //LauncherWeaps
							0.02, //RocketWeaps
							///Misc. Loot = 45% (90%)
							0.02, //MedBox
							0.01, //AmmoBox (762)
							0.01, //AmmoBox (556)
							0.02, //RangeFinders
							0.08, //Hospital Loot
							0.06, //Military Ammo Pile
							0.17, //Military Pilot Loot Pile
							0.08, //Policeman Loot Pile
							//Backpacks = 5% (95%)
							0.05, //MilitaryBackpacks
							//Skins Total = 5% (100%)
							//MilitaryClothes
							0.05
				];
 				
 				_lootTable = [_itemTypes,_itemChance]; 
 			};

			/*
				Medical Care Package
			*/
			case 2: 				{ 
				_itemTypes = [
					["", "medical"],						//40%
					["", "hospital"],						//35%
					["FoodBox0", "object"],					//12%
					["MedBox0", "object"],					//8%
					["AmmoBoxSmall_556", "object"],			//2%
					["AmmoBoxSmall_762", "object"],			//2%
					["DZ_CivilBackpack_EP1", "object"]		//1%
				];

				_itemChance = [
					0.40,
					0.35,
					0.12,
					0.08,
					0.02,
					0.02,
					0.01
				];  
				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			

 			/*
				Industrial Care Package
			*/
			case 3: 				{ 
				_itemTypes = [
					//Vehicle Parts (30%)
					["partGeneric", "magazine"],
					["PartWheel", "magazine"],
					["PartGlass", "magazine"],
					["PartEngine", "magazine"],
					["PartFueltank", "magazine"],
					["PartVRotor", "magazine"],
					//Vanilla Industrial (20%)
					["ItemSandbag", "magazine"],
					["ItemWire", "magazine"],
					["ItemCanvas", "magazine"],
					["", "industrial"],
					//Building Supplies (20%) 
					["", "industrial"],
					["CinderBlocks", "magazine"],
					["MortarBucket", "magazine"],
					["ItemTankTrap", "magazine"],
					["PartWoodPlywood", "magazine"],
					["PartWoodLumber", "magazine"],
					["", "industrial"],
					//Components, Rare Comonents (15%)
					["ItemMixOil","magazine"],		
					["ItemJerryCanEmpty","magazine"],	
					["ItemFuelBarrelEmpty","magazine"],					
					["ItemJerryCan","magazine"],					
					["ItemFuelBarrel","magazine"],
					//Tools (10%)
					["ItemMatchbox_DZE","weapon"],					
					["ItemHatchet_DZE","weapon"],					
					["ItemShovel","weapon"],					
					["ItemFishingPole","weapon"],	
					["ItemSledge","weapon"],						
					["ItemCrowbar","weapon"],
					["ItemKeyKit","weapon"],
					//Backpacks (5%)
					["militarybackpacks", "militarybackpacks"]
				];

				_itemChance = [ 
					//Vehicle Parts = (30%) ((20%))
					0.07, //Scrap
					0.05, //Wheel
					0.04, //Glass
					0.06, //Engine
					0.03, //Fueltank
					0.05, //Rotor
					//Vanilla Industrial (20%) ((50%))
					0.04, //Sandbag
					0.04, //Wire
					0.03, //Canvas
					0.09, //Industrial
					//Building Supplies (20%) ((70%))
					0.02, //Industrial
					0.02, //CinderBlocks
					0.02, //MortarBucket
					0.02, //TankTrap
					0.05, //Plywood
					0.05, //Lumber
					0.02, //Industrial
					//Components (11%) ((81%))
					0.03, //Oil
					0.04, //JerryCanEmpty
					0.04, //FuelBarrelEmpty
					//Rare Components (4%) ((85%))
					0.02, //JerryCan Full
					0.02, //FuelBarrel Full
					//Tools (10%) ((95%))
					0.02, //Matchbox
					0.02, //Hatchet
					0.01, //Shovel
					0.02, //Fishing Pole
					0.01, //Sledge
					0.02, //KeyKit
					///Backpacks (5%) ((100%))
					//MilitaryBackpacks
					0.05 
				];
 				_lootTable = [_itemTypes,_itemChance]; 
 			};
 			/*
 				Base Building Care Package
 			*/
			case 4: 				{ 
				_itemTypes = [
					//Minor Items (50%)
					["CinderBlocks", "magazine"],
					["MortarBucket", "magazine"],
					["PartWoodLumber", "magazine"],
					["PartWoodPlywood", "magazine"],
					["ItemTankTrap", "magazine"],
					["PartPlankPack", "magazine"],
					["PartPlywoodPack", "magazine"],
					["ItemCorrugated", "magazine"],
					["ItemBurlap", "magazine"],
					["ItemCanvas", "magazine"],
					["ItemSandbagExLarge", "magazine"],
					["ItemWoodLadder", "magazine"],
					["ItemWoodLadder", "magazine"],
					["ItemWoodStairsSupport", "magazine"],
					["ItemTankTrap", "magazine"],
					//Kits (25%) ((75%))
					["ItemScaffoldingKit", "magazine"],
					["m240_nest_kit", "magazine"],
					["fuel_pump_kit", "magazine"],
					["park_bench_kit", "magazine"],
					["sun_shade_kit", "magazine"],
					["forest_net_kit", "magazine"],
					["ItemFireBarrel_kit", "magazine"],
					["rusty_gate_kit", "magazine"],
					["sandbag_nest_kit", "magazine"],
					["forest_large_net_kit", "magazine"],
					["workbench_kit", "magazine"],
					["m240_nest_kit", "magazine"],
					["deer_stand_kit", "magazine"],
					["BagFenceRound_DZ_kit", "magazine"],
					//Major Items  (10%) ((85%))
					["ItemPole", "magazine"],
					["ItemLockbox", "magazine"],
					["bulk_PartGenericHalf", "magazine"],
					["bulk_ItemWireHalf", "magazine"],
					["bulk_ItemTankTrapHalf", "magazine"],
					["bulk_ItemSandbag", "magazine"],
					["ItemSandbagExLarge5x", "magazine"],
					["ItemOilBarrel", "magazine"],
					["ItemFuelBarrel", "magazine"],
					//Rare  (6%) ((96%))
					["cinder_wall_kit", "magazine"],
					["ItemVault", "magazine"],
					["ItemPlotDeed", "magazine"],
					//Backpacks (2%) ((98%))
					["militarybackpacks", "militarybackpacks"],
					//Super Rare  (2%)
					["ItemComboLock", "magazine"],
					["metal_floor_kit", "magazine"]
				];
				_itemChance = [ 
					//Minor Items (40%)
						0.05,
						0.04,
						0.04,
						0.04,
						0.04,
						0.04,
						0.04,
						0.04,
						0.04,
						0.04,
						0.03,
						0.03,
						0.03,
						//Kits (25%) ((75%))
						0.01,
						0.03,
						0.03,
						0.01,
						0.01,
						0.03,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.02,
						0.02,
						0.01,
						0.01,
						0.02,
						//Major Items  (10%) ((85%))
						0.02,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						0.01,
						//Rare  (6%) ((96%))
						0.02,
						0.02,
						0.02,
						//Backpacks (2%) ((98%))
						0.02,
						//Super Rare  (2%) ((100%))
						0.01,
						0.01
				]; 

				_lootTable = [_itemTypes,_itemChance]; 
 			};
		}; 
	};

};


/*---------------------------------------------------------------------------
Chance Reduction Section

Think 1/100 is too damn high?! Reduce it here!

Both TWS & UltraWeaps reduced by 90% and have random selection put in their place
---------------------------------------------------------------------------*/

_itemTypes = _itemTypes call {
	private["_reitemTypes","_c"];
	_reitemTypes = _this;
	if ((round(random 100)) > 10) exitWith {
		_c = 0;
		{	
 			if ((_x select 0) == "TWSWeaps") exitWith {
				_reitemTypes set [_c,(["PistolTopWeaps", "custom_weapon"])];
				_reitemTypes set [_c,(_reitemTypes call BIS_fnc_selectRandom)];
				_reitemTypes;
			};
			_c = _c + 1;
		} count _reitemTypes;
		_reitemTypes
	};
	_reitemTypes
};


_itemTypes = _itemTypes call {
	private["_reitemTypes","_c"];
	_reitemTypes = _this;
	if ((round(random 100)) > 10) exitWith {
		_c = 0;
		{	
			if ((_x select 0) == "UltraWeaps") exitWith {
				_reitemTypes set [_c,(["PistolTopWeaps", "custom_weapon"])];
				_reitemTypes set [_c,(_reitemTypes call BIS_fnc_selectRandom)];
				_reitemTypes;
			};
			_c = _c + 1;
		} count _reitemTypes;
		_reitemTypes
	};
	_reitemTypes
};
	
_lootTable = [_itemTypes,_itemChance];
_lootTable