Z_removeAllFromBuyingList = {
	Z_clearBuyingList;
	Z_BuyingArray = [];
};

Z_removeItemFromBuyingList = {
	private ["_index"];
	_index = _this select 0;
	if(!isNil"_index" && _index > -1)then {
		lbDelete [7422, _index];
		Z_BuyingArray set [_index,"deleted"];
		Z_BuyingArray = Z_BuyingArray - ["deleted"];		
		call Z_calcPrice;	
	};
};

Z_toBuyingList = {
	private ["_index", "_amount", "_temp", "_item", "_index2"];
	_index = _this select 0;
	_amount = parseNumber(_this select 1);		
	if(!isNil"_index" && _index > -1 && (typeName _amount == "SCALAR") && _amount > 0 )then {
		_temp = Z_BuyArray select _index;
		_item = [_temp select 0,_temp select 1 ,_temp select 2,_temp select 3, _temp select 4, _amount ];
		Z_BuyingArray set [count(Z_BuyingArray),_item];		
		_index2 = lbAdd [7422, format["%1x: %2",_item select 5,_item select 3]];
		lbSetPicture [7422, _index2, _item select 4];
		call Z_calcPrice;
	};	
};

Z_fillBuyList = {
		private ["_pic","_text","_totalPrice","_pthrough","_y","_y2","_type","_buy","_cat","_forEachIndex","_cfgtraders","_arrayOfTraderCat","_counter"];
		call Z_clearBuyList;
		call Z_clearBuyingList;
		diag_log(str z_traderData);
		Z_BuyArray = [];
		Z_BuyingArray = [];
		_arrayOfTraderCat = Z_traderData;	
		_counter = 0; _y = nil; _y2 = "";
		{	
			_cat =  format["Category_%1",(_arrayOfTraderCat select _forEachIndex select 1)];
			_cfgtraders = missionConfigFile >> "CfgTraderCategory"  >> _cat;
			for "_i" from 0 to (count _cfgtraders)-1 do
			{
				_y  = _cfgtraders select _i;								
				if (isClass _y) then
				{
					_y  = configName (_y); 	_y2 = _y call P2DZ_decryptFunction;
					if (_y2 == "20Rnd_762x51_SB_SCAR") then { _y2 = "20rnd_762x51_SB_SCAR"; };
					_type =  getText(missionConfigFile >> "CfgTraderCategory"  >> _cat  >> _y >> "type");
					_buy = getArray(missionConfigFile >> "CfgTraderCategory"  >> _cat  >> _y >> "buy");
					_pic = "";
					_text = "";	
					if(_type == "trade_items")then{
						_pic = getText (configFile >> 'CfgMagazines' >> _y2 >> 'picture');
						_text = getText (configFile >> 'CfgMagazines' >> _y2 >> 'displayName');
						Z_BuyArray set [count(Z_BuyArray) , [_y2,_type,_buy select 0,_text,_pic]];
						_totalPrice = _totalPrice + (_buy select 0);																				
					};
					if(_type == "trade_weapons")then{
						_pic = getText (configFile >> 'CfgWeapons' >> _y2 >> 'picture');
						_text = getText (configFile >> 'CfgWeapons' >> _y2 >> 'displayName');
						Z_BuyArray set [count(Z_BuyArray) , [_y2,_type,_buy select 0,_text,_pic]];
						_totalPrice = _totalPrice + (_buy select 0);	
					};
				};																									
			};																	
		}forEach _arrayOfTraderCat;

		call Z_fillBuylList;
		call Z_calcPrice;
};

Z_fillBuylList = {
	private ["_index"];
	{
		_index = lbAdd [7421,  _x select 3];
		lbSetPicture [7421, _index, _x select 4 ];
	}count Z_BuyArray;
};

Z_fillBuyingList = {
	private ["_index"];
	{  		
		_index = lbAdd [7422, _x select 3];
		lbSetPicture [7422, _index,  _x select 4];
	}count Z_BuyingArray;
};

Z_checkArrayInConfig = {
	private ["_weaps", "_mags", "_pthrough", "_extraText", "_all", "_total", "_arrayOfTraderCat", "_totalPrice", "_y", "_y2", "_cat", "_excists", "_pic", "_text", "_type", "_sell", "_backUpText", "_ctrltext"];
	_weaps = _this select 0;
	_mags = _this select 1;
	_extraText = _this select 2;
	_all = _weaps + _mags ;
	_total = count(_all);
	_arrayOfTraderCat = Z_traderData;
	_totalPrice = 0; _y = ""; _y2 = "";	_pthrough = 0; _pthrough2 = 0;
	_ctrltext = ["Please Wait...", _totalPrice,CurrencyName];
	ctrlSetText [7412, _ctrltext];		

	if(_total > 0)then{
		{
			_pthrough2 = _pthrough2 + 1;
			_y = _x; 
			if (_y == "20Rnd_762x51_SB_SCAR") then { _y = "20rnd_762x51_SB_SCAR"; }; 
			_y2 = _y call z_getWeaponName;	
			if (_y == "20rnd_762x51_SB_SCAR") then { _y = "20Rnd_762x51_SB_SCAR"; };
			_ctrltext = format["Checking Item %1 of %2 (%3)",_pthrough2,_total,_y];
			ctrlSetText [7412, _ctrltext];	
			{
				_cat =  format["Category_%1",(_arrayOfTraderCat select _forEachIndex select 1)];
				_excists = false;

				if(isClass(missionConfigFile >> "CfgTraderCategory"  >> _cat >> _y2 ))then{
					_excists = isClass(missionConfigFile >> "CfgTraderCategory"  >> _cat >> _y2 );
				};

				_pthrough = ((_forEachIndex / ((count _arrayOfTraderCat) - 1)) * 100);
				ctrlSetText [7413, format["Scanning List %3/%4...(%1%2)", round _pthrough, "%", _forEachIndex, count _arrayOfTraderCat]];

				if(_excists)exitWith{
					_pic = "";
					_text = "";
					_type = getText(missionConfigFile >> "CfgTraderCategory"  >> _cat  >> _y2 >> "type");
					_sell = getArray(missionConfigFile >> "CfgTraderCategory"  >> _cat  >> _y2 >> "sell");									
					
					switch (true) do {
						case (_type == "trade_items") :
						{
							_pic = getText (configFile >> 'CfgMagazines' >> _y >> 'picture');
							_text = getText (configFile >> 'CfgMagazines' >> _y >> 'displayName');
						};
						case (_type == "trade_weapons") :
						{
							_pic = getText (configFile >> 'CfgWeapons' >> _y >> 'picture');
							_text = getText (configFile >> 'CfgWeapons' >> _y >> 'displayName');
						};
						case (_type == "trade_backpacks") :
						{
							_pic = getText (configFile >> 'CfgVehicles' >> _y >> 'picture');
							_text = getText (configFile >> 'CfgVehicles' >> _y >> 'displayName');
						};
					};
					
					if( isNil '_text')then{_text = _y;};
					Z_SellableArray set [count(Z_SellableArray) , [_y,_type,_sell select 0,_text,_pic]];
					_totalPrice = _totalPrice + (_sell select 0);				
				};					
			}forEach _arrayOfTraderCat;				
		}count _all;	
				
		_backUpText = _extraText;
		if(Z_SellingFrom != 2)then{
			_extraText = getText (configFile >> 'CfgVehicles' >> _extraText >> 'displayName');
		};
		if (isNil '_extraText')then{_extraText = _backUpText;};
		
		_ctrltext = format["I would offer %1 %2.", _totalPrice,CurrencyName];
		ctrlSetText [7413, _ctrltext];		
		_ctrltext = format["I accept %1 items from %2...", count(Z_SellableArray) , _extraText];
		ctrlSetText [7412, _ctrltext];	
		call Z_fillSellList;
	};		
};