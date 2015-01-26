Z_filleTradeTitle = {
	private["_text"];
	_text = _this select 0;
	ctrlSetText [7408, _text];
};

Z_clearLists = {
	lbClear 7401;
	lbClear 7402;
};

Z_clearBuyList = {
  lbClear 7421;
};

Z_clearBuyingList = {
  lbClear 7422;
};


Z_getContainer = {
	private ["_dialog", "_lbIndex", "_ctrltext", "_canBuyInVehicle"];
	_dialog = findDisplay 711197;
	(_dialog displayCtrl 7404) ctrlSetText format["Free Slots: 0 / 0 / 0"];
	Z_clearBuyingList;
	Z_clearLists;
	Z_SellableArray = [];
	Z_SellArray = [];
	Z_BuyingArray = [];
	
	_lbIndex= _this select 0;

	if(Z_Selling)then{
		switch (_lbIndex) do {
			case 0: { 
				["Selling from backpack."] call Z_filleTradeTitle;
				Z_SellingFrom = 0;
				call Z_getBackpackItems; 
			};
			case 1: { 
				["Selling from vehicle."] call Z_filleTradeTitle;
				Z_SellingFrom = 1;
				call Z_getVehicleItems; 
			};
			case 2: { 
				["Selling from gear."] call Z_filleTradeTitle;
				Z_SellingFrom = 2;
				call Z_getGearItems; 
			};
		};
	}else{
		_ctrltext = format[" "];
		ctrlSetText [7413, _ctrltext];
		
		_ctrltext = format["These are all the items I'm selling!"];
		ctrlSetText [7412, _ctrltext];
		switch (_lbIndex) do {
		
			case 0: { 
				Z_SellingFrom = 0;
				["Buying in backpack."] call Z_filleTradeTitle;
				[0] call Z_calculateFreeSpace;
			};
			case 1: { 
				Z_SellingFrom = 1;
				["Buying in vehicle."] call Z_filleTradeTitle;
				_canBuyInVehicle = call Z_CheckCloseVehicle;
				if(_canBuyInVehicle)then{
					[1] call Z_calculateFreeSpace; 
				}else{
					systemChat format["[Trader] Get in driver seat to be able to trade to your vehicle."];						
					(_dialog displayCtrl 7404) ctrlSetText format["Free Slots: %1 / %2 / %3",0,0,0];
				};
			};
			case 2: {
				Z_SellingFrom = 2;				
				["Buying in gear."] call Z_filleTradeTitle;
				[2] call Z_calculateFreeSpace;
			};
		};
	};
};

Z_getBackpackItems = {
	private ["_backpack", "_mags", "_weaps", "_normalMags", "_normalWeaps", "_kinds", "_ammmounts", "_counter", "_kinds2", "_ammmounts2", "_ctrltext"];
	call Z_clearLists;
	Z_SellableArray = [];
	Z_SellArray = [];
	_backpack = unitBackpack player;
	if (!isNil "_backpack") then {    				
		_mags = getMagazineCargo _backpack;
		_weaps = getWeaponCargo _backpack;		
		_normalMags = [];
		_normalWeaps = [];			
		_kinds = _mags select 0;
		_ammmounts = _mags select 1;
		{
			_counter = 0 ;
			while{	_counter < ( 	_ammmounts select _forEachIndex)}do{
			_normalMags set [count(_normalMags),_x];
			_counter = _counter + 1;
			};
		}forEach _kinds;
		
		_kinds2 = _weaps select 0;
		_ammmounts2 = _weaps select 1;
		{
			_counter = 0 ;
			while{	_counter < ( 	_ammmounts2 select _forEachIndex)}do{
			_normalWeaps set [count(_normalWeaps),_x];
			_counter = _counter + 1;
			};
		}forEach _kinds2;
	
		[_normalMags,_normalWeaps, typeOf _backpack] call	Z_checkArrayInConfig;	
	}else{
		_ctrltext = format["I'm not stupid."];
		ctrlSetText [7413, _ctrltext];
		
		_ctrltext = format["You are not wearing a backpack."];
		ctrlSetText [7412, _ctrltext];
	};
};

Z_getVehicleItems = {
	private ["_vehicle", "_list", "_mags", "_weaps", "_normalMags", "_normalWeaps", "_kinds", "_ammmounts", "_counter", "_kinds2", "_ammmounts2", "_ctrltext"];
	Z_vehicle = objNull;
	call Z_clearLists;
	Z_SellableArray = [];
	Z_SellArray = [];
	_vehicle = objNull;
	
	_list = nearestObjects [(getPosATL player), ["AllVehicles"], Z_VehicleDistance];	
	{	
		if(!isNull _x && local _x && !isPlayer _x && alive _x && !(_x isKindOf "zZombie_base"))then{
			systemChat format["[Trader] Selected %1",typeOf _x];
			_vehicle = _x;
		};
	}count _list;
	
	if(!isNull _vehicle)then{
		Z_vehicle = _vehicle;
		_mags = getMagazineCargo _vehicle;
		_weaps = getWeaponCargo _vehicle;
		
		_normalMags = [];
		_normalWeaps = [];
		
		_kinds = _mags select 0;
		_ammmounts = _mags select 1;
		{
			_counter = 0 ;
			while{	_counter < ( 	_ammmounts select _forEachIndex)}do{
			_normalMags set [count(_normalMags),_x];
					_counter = _counter + 1;
			};
		}forEach _kinds;
		
		_kinds2 = _weaps select 0;
		_ammmounts2 = _weaps select 1;
		{
			_counter = 0 ;
			while{	_counter < ( 	_ammmounts2 select _forEachIndex)}do{
				_normalWeaps set [count(_normalWeaps),_x];
				_counter = _counter + 1;
			};
		}forEach _kinds2;
		
		
		[_normalWeaps,_normalMags, typeOf _vehicle] call Z_checkArrayInConfig;
	}else{
		_ctrltext = format["Get in driver seat first!"];
		ctrlSetText [7413, _ctrltext];
		
		_ctrltext = format["I do not see any vehicle."];
		ctrlSetText [7412, _ctrltext];
	};	
};

Z_getGearItems = {
	private ["_mags", "_weaps"];
	call Z_clearLists;
	Z_SellArray = [];
	Z_SellableArray = [];
	 _mags = magazines player;
	 _weaps = weapons player;
	[_weaps,_mags,"your gear"] call	Z_checkArrayInConfig;			
};

Z_calcPrice = {
	private ["_sellPrice", "_ctrltext"];
	_sellPrice = 0;
	if(Z_Selling)then{	
		{  		
			_sellPrice = _sellPrice +  (_x select 2);
		}count Z_SellArray;
	}else{
		{
			_sellPrice = _sellPrice +  ((_x select 2) * (_x select 5));
		}count Z_BuyingArray;
	};
	_ctrltext = format["%1 %2", _sellPrice , CurrencyName];
	ctrlSetText [7410, _ctrltext];	
};

Z_fillSellList = {
	private ["_index"];
	{
		_index = lbAdd [7401,  _x select 3];
		lbSetPicture [7401, _index, _x select 4 ];
	}count Z_SellableArray;
};

Z_fillSellingList = {
	private ["_index"];
	{  		
		_index = lbAdd [7402, _x select 3];
		lbSetPicture [7402, _index,  _x select 4];
	}count Z_SellArray;
};

Z_pushItemToList = {
	private ["_index","_index2","_temp"];
	_index = _this select 0;
	if(!isNil"_index" && _index > -1)then {
		lbDelete [7401, _index];
		_temp = Z_SellableArray select _index;
		//_item = [_temp select 0,_temp select 1 ,_temp select 2,_temp select 3, _temp select 4  ];
		Z_SellArray set [count(Z_SellArray),_temp];
		Z_SellableArray set [_index,"deleted"];
		Z_SellableArray = Z_SellableArray - ["deleted"];
		_index2 = lbAdd [7402, _temp select 3];
		lbSetPicture [7402, _index2, _temp select 4];
		call Z_calcPrice;
	};
};

Z_removeItemFromList = {
	private ["_index", "_temp", "_item", "_index2"];
	_index = _this select 0;
	if(!isNil"_index" && _index > -1)then {
		lbDelete [7402, _index];
		_temp = Z_SellArray select _index;
		_item = [_temp select 0,_temp select 1 ,_temp select 2,_temp select 3, _temp select 4  ];
		Z_SellableArray set [count(Z_SellableArray),_item];
		Z_SellArray set [_index,"deleted"];
		Z_SellArray = Z_SellArray - ["deleted"];
		_index2 = lbAdd [7401,  _item select 3];
		lbSetPicture [7401, _index2, _item select 4];
		call Z_calcPrice;	
	};
};

Z_pushAllToList = {
	Z_SellArray = Z_SellArray + Z_SellableArray;
	Z_SellableArray = [];
	call Z_clearLists;
	call Z_fillSellList;
	call Z_fillSellingList;
	call Z_calcPrice;
};

Z_removeAllToList = {
	Z_SellableArray = Z_SellableArray + Z_SellArray;
	Z_SellArray = [];
	call Z_clearLists;
	call Z_fillSellList;
	call Z_fillSellingList;
	call Z_calcPrice;
};

Z_SellItems = {
	private ["_index", "_tempArray", "_outcome", "_weaponsArray", "_itemsArray", "_bpArray", "_bpCheckArray", "_weaponsCheckArray", "_itemsCheckArray", "_p2ic", "_p2s", "_p", "_type", "_wA", "_mA", "_localResult", "_total_currency_dry", "_money"];	_index = count (Z_SellArray) - 1;	
	_tempArray = Z_SellArray;
	if(_index > -1)then{
		systemChat "[Trader] Selling items.";	
		closeDialog 2;
		_outcome = [];
		_weaponsArray = [];
		_itemsArray = [];	
		_bpArray = [];	
		_bpCheckArray = [];
		_weaponsCheckArray = [];
		_itemsCheckArray = [];
		
		_p2ic = 0; _p2s = [[],[],[]]; _p = 0;

		{ 		
			_type = _x select 1;
			_name = _x select 0;
			_p = _x select 2;					

			switch (true) do {
				case (_type == "trade_items") :
				{
					_itemsArray set [count(_itemsArray),_name];
					_itemsCheckArray set [count(_itemsCheckArray),_x select 2];
					if (!(_name in (_p2s select 0))) then {
						(_p2s select 0) set [count(_p2s select 0),_name];
						(_p2s select 1) set [count(_p2s select 1),1];
						(_p2s select 2) set [count(_p2s select 2),_p];
					} else {
						_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
						(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + 1];
					};
				};
				case (_type == "trade_weapons") :
				{
					_weaponsArray set [count(_weaponsArray),_name];
					_weaponsCheckArray set [count(_weaponsCheckArray),_x select 2];

					if (!(_name in (_p2s select 0))) then {
						(_p2s select 0) set [count(_p2s select 0),_name];
						(_p2s select 1) set [count(_p2s select 1),1];
						(_p2s select 2) set [count(_p2s select 2),_p];
					} else {
						_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
						(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + 1];
					};
				};
				case (_type == "trade_backpacks") :
				{
					_bpArray set [count(_bpArray),_name];
					_bpCheckArray set [count(_bpCheckArray),_x select 2];

					if (!(_name in (_p2s select 0))) then {
						(_p2s select 0) set [count(_p2s select 0),_name];
						(_p2s select 1) set [count(_p2s select 1),1];
						(_p2s select 2) set [count(_p2s select 2),_p];
					} else {
						_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
						(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + 1];
					};
				};
			};

		}count Z_SellArray;

		PVDZE_obj_Trade = [player,0,1,"ZombZ",inTraderCity,"ItemGoldBar10oz","ZombZ",true,_p2s];
		publicVariableServer  "PVDZE_obj_Trade";
				 
		if(Z_SellingFrom == 0)then{
			_outcome = [unitBackpack player,_itemsArray,_weaponsArray] call ZUPA_fnc_removeWeaponsAndMagazinesCargo;
		};
		if(Z_SellingFrom == 1)then{	
			_outcome = [Z_vehicle,_itemsArray,_weaponsArray,_bpArray] call ZUPA_fnc_removeWeaponsAndMagazinesCargo;		
		};
							
		if(Z_SellingFrom == 2)then{
			_wA = [];
			_mA = [];
			{
				_localResult = [player,(_x select 0),1] call BIS_fnc_invRemove;
				if( _localResult != 1)then{
					if(_x select 1 == "trade_items")then{
						_mA set [count(_mA),0];
					}else{
						_wA set [count(_wA),0];
					};
				}else{
					if(_x select 1 == "trade_items")then{
						_mA set [count(_mA),1];
					}else{
						_wA set [count(_wA),1];
					};
				};
				
			}count Z_SellArray;
				
			_outcome set [0,_mA];	
			_outcome set [1,_wA];
			_outcome set [2,[]];					
		};
		_total_currency_dry = 0; _money = 0;		
		{
			_money = _money + ( ((_itemsCheckArray select _forEachIndex)) * _x);
		}forEach (_outcome select 0);
		{
			_money = _money + ( ((_weaponsCheckArray select _forEachIndex)) * _x);
		}forEach (_outcome select 1);
		
		{
			_money = _money + ( ( (_bpCheckArray select _forEachIndex) ) * _x);
		}forEach (_outcome select 2);
		
		if(typeName _money  == "SCALAR")then{
			_total_currency_dry = call epoch_totalCurrency;
			[player,(_total_currency_dry + _money)] call p2_gc;

			systemChat format["[Trader] Received %1 %2", _money , CurrencyName];			
		}else{
			systemChat format["[Trader] The Money Value is not a number. Something went wrong. Sorry about that."];			
		};									
	}else{
		systemChat format["[Trader] No Items to Sell"];
	};						
};

Z_BuyItems = {	
	private ["_magazinesToBuy", "_weaponsToBuy", "_backpacksToBuy", "_priceToBuy", "_p2ic", "_p2wc", "_p2s", "_p", "_can", "_canBuy", "_count", "_total_currency_dry"];
	_magazinesToBuy = 0;
	_weaponsToBuy = 0;
	_backpacksToBuy = 0;
	_priceToBuy = 0;

	_p2ic = 0; _p2wc = 0; _p2s = [[],[],[]]; _p = 0;

	{

		if( _x select 1 == "trade_weapons")then{
			_weaponsToBuy = _weaponsToBuy + (_x select 5) ;
			_priceToBuy	= _priceToBuy + ((_x select 5)*(_x select 2));			
		};
		if( _x select 1 == "trade_items")then{
			_magazinesToBuy = _magazinesToBuy + (_x select 5) ;
			_priceToBuy	= _priceToBuy + ((_x select 2)*(_x select 5));
		};
		if( _x select 1 == "trade_backpacks")then{
			_backpacksToBuy = _backpacksToBuy + (_x select 5) ;
			_priceToBuy	= _priceToBuy + ((_x select 2)*(_x select 5));
		};	
	} count Z_BuyingArray;

	_can = [false,player] call p2_gv;
	_canBuy = [_weaponsToBuy,_magazinesToBuy,_backpacksToBuy] call Z_allowBuying;

	if(_can >= _priceToBuy)then{
		if(_canBuy)then{	
		systemChat format["[Trader] Start Buying for %1 %2",_priceToBuy,CurrencyName];
		
		closeDialog 2;
		
			if(Z_SellingFrom == 0)then{
				_p2ic = 0; _p2s = [[],[],[]]; _p = 0; _name = "NoName";

				systemChat format["[Trader] Adding %1 Items in backpack",count (Z_BuyingArray)];
				{
					_name = _x select 0;
					_p = _x select 2;
					if( _x select 1 == "trade_weapons")then{
						(unitBackpack player) addWeaponCargoGlobal [_x select 0, _x select 5];
						if (!(_name in (_p2s select 0))) then {
							(_p2s select 0) set [count(_p2s select 0),_name];
							(_p2s select 1) set [count(_p2s select 1),(_x select 5)];
							(_p2s select 2) set [count(_p2s select 2),_p];
						} else {
							_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
							(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + (_x select 5)];
						};
					};
					if( _x select 1 == "trade_items")then{
						(unitBackpack player) addMagazineCargoGlobal  [_x select 0, _x select 5];
						if (!(_name in (_p2s select 0))) then {
							(_p2s select 0) set [count(_p2s select 0),_name];
							(_p2s select 1) set [count(_p2s select 1),(_x select 5)];
							(_p2s select 2) set [count(_p2s select 2),_p];
						} else {
							_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
							(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + (_x select 5)];
						};
					};					
				} count Z_BuyingArray;			
			};
			
			if(Z_SellingFrom == 1)then{
				_p2ic = 0; _p2s = [[],[],[]]; _p = 0; _name = "NoName";

				{
					_name = _x select 0;
					_p = _x select 2;
					systemChat format["[Trader] Adding %1 Items in %2",count (Z_BuyingArray), typeOf Z_vehicle];
					if( _x select 1 == "trade_weapons")then{
						Z_vehicle addWeaponCargoGlobal [_x select 0, _x select 5];
						if (!(_name in (_p2s select 0))) then {
							(_p2s select 0) set [count(_p2s select 0),_name];
							(_p2s select 1) set [count(_p2s select 1),(_x select 5)];
							(_p2s select 2) set [count(_p2s select 2),_p];
						} else {
							_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
							(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + (_x select 5)];
						};
					};
					if( _x select 1 == "trade_items")then{
						Z_vehicle addMagazineCargoGlobal [_x select 0, _x select 5];
						if (!(_name in (_p2s select 0))) then {
							(_p2s select 0) set [count(_p2s select 0),_name];
							(_p2s select 1) set [count(_p2s select 1),(_x select 5)];
							(_p2s select 2) set [count(_p2s select 2),_p];
						} else {
							_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
							(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + (_x select 5)];
						};
					};	
					if( _x select 1 == "trade_backpacks")then{
						Z_vehicle addBackpackCargoGlobal [_x select 0, _x select 5];
						if (!(_name in (_p2s select 0))) then {
							(_p2s select 0) set [count(_p2s select 0),_name];
							(_p2s select 1) set [count(_p2s select 1),(_x select 5)];
							(_p2s select 2) set [count(_p2s select 2),_p];
						} else {
							_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
							(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + (_x select 5)];
						};
					};	
				} count Z_BuyingArray;	
			};
			
			if(Z_SellingFrom == 2)then{
				_p2ic = 0; _p2s = [[],[],[]]; _p = 0; _name = "NoName";


				systemChat format["[Trader] Adding %1 Items in gear",count (Z_BuyingArray)];
				{

					_name = _x select 0;
					_p = _x select 2;
					if( _x select 1 == "trade_weapons")then{
						_count = 0;
						while(_count < _x select 5)do{
							player addWeapon (_x select 0);	
							_count = _count + 1;
						};
						if (!(_name in (_p2s select 0))) then {
							(_p2s select 0) set [count(_p2s select 0),_name];
							(_p2s select 1) set [count(_p2s select 1),(_x select 5)];
							(_p2s select 2) set [count(_p2s select 2),_p];
						} else {
							_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
							(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + (_x select 5)];
						};					 
					};
					if( _x select 1 == "trade_items")then{
						_count = 0;						
						 while{_count < _x select 5}do{
							player addMagazine (_x select 0);	
							_count = _count + 1;
						};
						if (!(_name in (_p2s select 0))) then {
							(_p2s select 0) set [count(_p2s select 0),_name];
							(_p2s select 1) set [count(_p2s select 1),(_x select 5)];
							(_p2s select 2) set [count(_p2s select 2),_p];
						} else {
							_p2ic = ((_p2s select 1) select (count(_p2s select 1)-1));
							(_p2s select 1) set [(count(_p2s select 1)-1),_p2ic + (_x select 5)];
						};
					};					
				} count Z_BuyingArray;									
			};	

			PVDZE_obj_Trade = [player,0,0,"ZombZ",inTraderCity,"ItemGoldBar10oz","ZombZ",true,_p2s];
			publicVariableServer  "PVDZE_obj_Trade";

			systemChat format["[Trader] Removing %1 Gold ",_priceToBuy];
			_total_currency_dry = call epoch_totalCurrency;
			[player,(_total_currency_dry - _priceToBuy)] call p2_gc;
			systemChat format["[Trader] Removed %1 Gold ",_priceToBuy];				
		};				
	}else{
		systemChat format["[Trader] You need %1 %2 to buy all these items.",_priceToBuy,CurrencyName];
	};
};

/* ----------------------------------------------------------------------------
Examples:
   _result = [_backpack, ["SmokeShell","M16_AMMO"],["M16","M16","M240"]] call ZUPA_fnc_removeWeaponsAndMagazinesCargo; 
   _result == [[1,0,0,1,1,1,0],[1,0,0,1],[1,0]]; // 1 = success, 0 = fail ->( item was not in cargo)
   
Author:
   Zupa 2014-09-30
---------------------------------------------------------------------------- */
ZUPA_fnc_removeWeaponsAndMagazinesCargo = {
	private ["_unit", "_items","_weaps","_normalItems","_normalWeaps", "_count", "_i", "_unit_allItems", "_unit_allItems_types", "_unit_allItems_count", "_item_type", "_item_count", "__returnVar"];
	_unit = _this select 0;
	_items = _this select 1; 
	_weaps = _this select 2; 
	_bags = [];
	if(count _this > 3)then{
		_bags = _this select 3; 
	};
	
	_normalItems = [];
	_normalWeaps = [];
	_normalBags = [];
	
	_unit_allItems = getMagazineCargo _unit; //  [[type1, typeN, ...],[count1, countN, ...]]
	_unit_allItems_types = _unit_allItems select 0;
	_unit_allItems_count = _unit_allItems select 1;	
	
	_unit_allWeaps = getWeaponCargo _unit; 
	_unit_allWeaps_types = _unit_allWeaps select 0;
	_unit_allWeaps_count = _unit_allWeaps select 1;	
	
	_unit_allBags = getBackpackCargo _unit; 
	_unit_allBags_types = _unit_allBags select 0;
	_unit_allBags_count = _unit_allBags select 1;	
	
	clearMagazineCargoGlobal _unit;	
	clearWeaponCargoGlobal _unit;
	
	if( count _bags > 0 )then{					
		clearBackpackCargoGlobal  _unit;
	};	
	
	{
		_counter = 0 ;
		while{	_counter < ( _unit_allItems_count select _forEachIndex)}do{
		_normalItems set [count(_normalItems),_x];
				_counter = _counter + 1;
		};
	}forEach _unit_allItems_types;				
	{
		_counter = 0 ;
		while{	_counter < ( _unit_allWeaps_count select _forEachIndex)}do{
		_normalWeaps set [count(_normalWeaps),_x];
				_counter = _counter + 1;
		};
	}forEach _unit_allWeaps_types;	
	{
		_counter = 0 ;
		while{	_counter < ( _unit_allBags_count select _forEachIndex)}do{
		_normalBagss set [count(_normalBags),_x];
				_counter = _counter + 1;
		};
	}forEach _unit_allBags_types;	
	
	_returnVar = [];	
	_returnMag = [];	
	_returnWeap = [];
	_returnBag = [];
	{		
		_inCargo = _normalItems find _x;
		if(_inCargo > -1)then{
			_normalItems set [_inCargo, "soldItem"];
			_returnMag set [count(_returnMag),1];
		}else{
			_returnMag set [count(_returnMag),0];	
		};
	}count _items;	
	_normalItems = _normalItems - ["soldItem"];
	{				
		_unit addMagazineCargoGlobal [_x, 1];				
	}count _normalItems;	
	
	{		
		_inCargo = _normalWeaps find _x;
		if(_inCargo > -1)then{
			_normalWeaps set [_inCargo, "soldItem"];
			_returnWeap set [count(_returnWeap),1];
		}else{
			_returnWeap set [count(_returnWeap),0];	
		};
	}count _weaps;	
	_normalWeaps = _normalWeaps - ["soldItem"];
	{				
		_unit addWeaponCargoGlobal [_x, 1];				
	}count _normalWeaps;
	
	{		
		_inCargo = _normalBags find _x;
		if(_inCargo > -1)then{
			_normalBags set [_inCargo, "soldItem"];
			_returnBag set [count(_returnBag),1];
		}else{
			_returnBag set [count(_returnBag),0];	
		};
	}count _bags;	
	_normalWeaps = _normalWeaps - ["soldItem"];
	{				
		_unit addBackpackCargoGlobal [_x, 1];				
	}count _normalBags;
			
	_returnVar set [0,_returnMag];
	_returnVar set [1,_returnWeap];
	_returnVar set [2,_returnBag];
	_returnVar;
};

Z_ChangeBuySell = {		
	private ["_dialog"];
	_dialog = findDisplay 711197;		
	Z_Selling = !Z_Selling;	
	if(Z_Selling)then{	
		(_dialog displayCtrl 7416) ctrlSetText "Buy";
		(_dialog displayCtrl 7409) ctrlSetText "Selling";
		{ctrlShow [_x,true];} forEach [7401,7402,7435,7430,7431,7432,7433]; // show
		{ctrlShow [_x,false];} forEach [7421,7422,7436,7440,7441,7442,7443,7404]; // hide											
	}else{
		(_dialog displayCtrl 7416) ctrlSetText "Sell";
		(_dialog displayCtrl 7409) ctrlSetText "Buying";
		{ctrlShow [_x,true];} forEach [7421,7422,7436,7440,7441,7442,7443,7404]; // show
		{ctrlShow [_x,false];} forEach [7401,7402,7435,7430,7431,7432,7433]; // hide	
		call Z_fillBuyList;
	};	
	[2] call Z_getContainer; // default gear		
};


Z_calculateFreeSpace = {
	private ["_selection", "_returnArray", "_allowedMags", "_allowedWeapons", "_allowedBackpacks", "_backpack", "_dialog"];
	_selection = _this select 0;
	_returnArray = [0,0,0];
	if(_selection == 2) then{ //gear
		systemChat format["[Trader] No advanced buying of weapons/backpacks currently into gear for security reasons!"];
		_allowedMags = 20 - count(magazines player);
		_allowedWeapons = 0;
		_allowedBackpacks = 0;		
		_returnArray = [_allowedMags,_allowedWeapons,_allowedBackpacks];
	};		
	if(_selection == 1) then{ //vehicle
		_allowedMags = 0;
		_allowedWeapons = 0;
		_allowedBackpacks = 0;
		if (!isNull Z_vehicle) then {   
			_allowedWeapons = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportMaxWeapons');
			_allowedMags = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportMaxMagazines');
			_allowedBackpacks = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportmaxbackpacks ');
		};									
		_returnArray = [_allowedMags,_allowedWeapons,_allowedBackpacks];
	};		
	if(_selection == 0) then{ //backpack
		_allowedWeapons = 0;
		_allowedMags = 0;
		_allowedBackpacks = 0;
		_backpack = unitBackpack player;
		if (!isNil "_backpack") then {   
			_allowedWeapons = getNumber (configFile >> 'CfgVehicles' >> (typeOf _backpack) >> 'transportMaxWeapons');
			_allowedMags = getNumber (configFile >> 'CfgVehicles' >> (typeOf _backpack) >> 'transportMaxMagazines');
			_allowedBackpacks = 0;
		};		
		_returnArray = [_allowedMags,_allowedWeapons,_allowedBackpacks];
	};				
	_dialog = findDisplay 711197;
	(_dialog displayCtrl 7404) ctrlSetText format["Free Slots: %1 / %2 / %3",_returnArray select 1,_returnArray select 0,_returnArray select 2];
};

Z_CheckCloseVehicle = {	
	private ["_vehicle", "_list", "_result"];
	Z_vehicle = objNull;
	_vehicle = objNull;
	_list = nearestObjects [(getPosATL player), ["AllVehicles"], Z_VehicleDistance];	
	{	
		if(!isNull _x && local _x && !isPlayer _x && alive _x && !(_x isKindOf "zZombie_base"))then{
			systemChat format["[Trader] Selected %1",typeOf _x];
			_vehicle = _x;
		};
	}count _list;		
	_result = false;		
	if(!isNull _vehicle)then{
		Z_vehicle = _vehicle;
		_result = true;
		[format["Buying in %1.", typeOf Z_vehicle]] call Z_filleTradeTitle;				
	};						
	_result
};

Z_allowBuying = {
	private ["_selection", "_return", "_toBuyWeaps", "_toBuyMags", "_toBuyBags", "_allowedMags", "_allowedWeapons", "_allowedBackpacks", "_check1", "_check2", "_check3", "_mags", "_weaps", "_bags", "_normalMags", "_normalWeaps", "_normalBags", "_kinds", "_ammmounts", "_counter", "_kinds2", "_ammmounts2", "_kinds3", "_ammmounts3", "_backpack", "_check4"];
	//	Z_SellingFrom = 0 - backpack, 1 - car, 2 -gear
	_selection = Z_SellingFrom;
	_return = false;
	_toBuyWeaps = _this select 0;
	_toBuyMags = _this select 1;
	_toBuyBags = _this select 2;
	if(_selection == 2) then{ //gear
		systemChat format["[Trader] Only 0 weapon /  backpack allowed to buy at a time for security reasons!"];
		_allowedMags = 20 - count(magazines player);
		_allowedWeapons = 0;
		_allowedBackpacks = 0;	
		
		_check1 = false;
		_check2 = false;
		_check3 = false;

		if( _allowedWeapons >=_toBuyWeaps)then{
			_check1 = true;
		}else{
			systemChat format["[Trader] You can only buy %1 weapons in your gear.",_allowedWeapons];
		};
		if( _allowedMags >= _toBuyMags)then{
			_check2 = true;
		}else{
			systemChat format["[Trader] You can only buy %1 magazines  in your gear.",_allowedMags];
		};		
		if( _allowedBackpacks >= _toBuyBags)then{
			_check3 = true;
		}else{
			systemChat format["[Trader] You can only buy %1 backpacks  in your gear.",_allowedBackpacks];
		};
		
		if(_check1 && _check2 && _check3)then{
			_return = true;
		};
		
	};		
	if(_selection == 1) then{ //vehicle
		_allowedMags = 0;
		_allowedWeapons = 0;
		_allowedBackpacks = 0;
		if ( !isNull Z_vehicle) then {   
		
			_mags = getMagazineCargo Z_vehicle;
			_weaps = getWeaponCargo Z_vehicle;
			_bags = getBackpackCargo Z_vehicle;
			
			_normalMags = [];
			_normalWeaps = [];
			_normalBags = [];
			
			_kinds = _mags select 0;
			_ammmounts = _mags select 1;
			{
				_counter = 0 ;
				while{	_counter < ( 	_ammmounts select _forEachIndex)}do{
				_normalMags set [count(_normalMags),_x];
						_counter = _counter + 1;
				};
			}forEach _kinds;
			
			_kinds2 = _weaps select 0;
			_ammmounts2 = _weaps select 1;
			{
				_counter = 0 ;
				while{	_counter < ( 	_ammmounts2 select _forEachIndex)}do{
					_normalWeaps set [count(_normalWeaps),_x];
					_counter = _counter + 1;
				};
			}forEach _kinds2;
			
			_kinds3 = _bags select 0;
			_ammmounts3 = _bags select 1;
			{
				_counter = 0 ;
				while{	_counter < ( 	_ammmounts3 select _forEachIndex)}do{
					_normalBags set [count(_normalBags),_x];
					_counter = _counter + 1;
				};
			}forEach _kinds3;
		
					
			_allowedWeapons = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportMaxWeapons') - count(_normalWeaps);
			_allowedMags = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportMaxMagazines') - count(_normalMags);
			_allowedBackpacks = getNumber (configFile >> 'CfgVehicles' >> (typeOf Z_vehicle) >> 'transportmaxbackpacks ') - count(_normalBags);
		}else{
			systemChat format["[Trader] %1", typeName "Z_vehicle"];
		};	
		
		_check1 = false;
		_check2 = false;
		_check3 = false;

		if( _allowedWeapons >= _toBuyWeaps)then{
			_check1 = true;
		}else{
			systemChat format["[Trader] You can only buy %1 weapons in your vehicle.",_allowedWeapons];
		};
		if( _allowedMags >= _toBuyMags)then{
			_check2 = true;
		}else{
			systemChat format["[Trader] You can only buy %1 magazines in your vehicle.",_allowedMags];
		};			
		if( _allowedBackpacks >= _toBuyBags)then{
			_check3 = true;
		}else{
			systemChat format["[Trader] You can only buy %1 backpacks in your vehicle.",_allowedBackpacks];
		};
		
		if(_check1 && _check2 && _check3)then{
			_return = true;
		};					
	};		
	if(_selection == 0) then{ //backpack
		_allowedWeapons = 0;
		_allowedMags = 0;
		_allowedBackpacks = 0;
		_backpack = unitBackpack player;
		if (!isNil "_backpack") then {   
			_allowedWeapons = getNumber (configFile >> 'CfgVehicles' >> (typeOf _backpack) >> 'transportMaxWeapons');
			_allowedMags = getNumber (configFile >> 'CfgVehicles' >> (typeOf _backpack) >> 'transportMaxMagazines');
			_allowedBackpacks = 0;
		};		
		
		_check1 = false;
		_check2 = false;
		_check3 = false;
		_check4 = false;

		if( _allowedWeapons >= _toBuyWeaps)then{
			_check1 = true;
		};
		if( _allowedMags >= _toBuyMags)then{
			_check2 = true;
		};			
		if( _allowedBackpacks >= _toBuyBags)then{
			_check3 = true;
		};									
		if(_check1 && _check2 && _check3 && _check4)then{
			_return = true;			
		};	
		
		systemChat format["[Trader] Buying to backpack is currently disabled for security reasons"];
	};

	_return
};