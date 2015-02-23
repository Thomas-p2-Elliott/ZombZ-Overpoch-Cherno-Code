// trader menu gui by maca134
TraderDialogCatList = 12000;
TraderDialogItemList = 12001;
TraderDialogBuyPrice = 12002;
TraderDialogSellPrice = 12003;
TraderDialogBuyBtn = 12004;
TraderDialogSellBtn = 12005;
TraderDialogCurrency = 12006;

TraderCurrentCatIndex = -1;
TraderCatList = -1;
TraderItemList = -1;

TraderDialogLoadItemList = {
	private ["_ind","_trader_id","_activatingPlayer","_distance","_objclass","_it_list","_pthrough","_dtAdded","_resultData"];
	TraderItemList = -1;
	_dtAdded = false;
	_ind = _this select 0;

	if (_ind < 0) exitWith {};
	//TraderCurrentCatIndex = _ind;

	if (isNil 'P2DZE_traderListLoading') then {
		P2DZE_traderListLoading = false;
	};

	if (!P2DZE_traderListLoading) then {

		//Trader List Loading Set to True
		P2DZE_traderListLoading = True;

		_pthrough = 0;

		_trader_id = TraderCatList select _ind;
		_activatingPlayer = player;

		lbClear TraderDialogItemList;
		ctrlSetText [TraderDialogBuyPrice, ""];
		ctrlSetText [TraderDialogSellPrice, ""];

		lbAdd [TraderDialogItemList, format["Please Wait (%1) Is Loading...", _trader_id]];


		_cfgTraderCategory = missionConfigFile >> "CfgTraderCategory" >> (format["Category_%1",_trader_id]);
		//cache list check
		if (!isNil 'P2DZE_cachedTraders') then {
			if (((count P2DZE_cachedTraders) > 0)) then {
				{
					if (_cfgTraderCategory == _x select 0) then {
						_resultData = _x select 1;
						_dtAdded = true;
						PVDZE_plr_TradeMenuResult = _resultData;
					};
				} count P2DZE_cachedTraders;
			};
		} else {
			P2DZE_cachedTraders = [];
		};
		if (!_dtAdded) then {
			PVDZE_plr_TradeMenuResult = [];
	
			for "_i" from 0 to ((count _cfgTraderCategory) - 1) do {
				//output percentage through in window
				lbClear TraderDialogItemList;
				_pthrough = ((_i / ((count _cfgTraderCategory) - 1)) * 100);
				lbAdd [TraderDialogItemList, format["Please Wait, Trader List Loading...(%1%2)", round _pthrough, "%"]];

				_class = configName (_cfgTraderCategory select _i);

				_type  = getText ((_cfgTraderCategory select _i) >> "type");	
				_buy  = getArray ((_cfgTraderCategory select _i) >> "buy");	
				_sell = getArray ((_cfgTraderCategory select _i) >> "sell");
				
				_buy set [2,1]; 
				_sell set [2,1];

				_typeNum = 1;
				if (_type == "trade_weapons") then {
					_typeNum = 3;
				} else { 
					if (_type in ["trade_backpacks", "trade_any_vehicle", "trade_any_vehicle_free", "trade_any_boat", "trade_any_bicycle"]) then {
						_typeNum = 2;
					};
				};

				_class = _class call P2DZ_decryptFunction;
				_dt = [9999,[_class,_typeNum],99999,_buy,_sell,0,_trader_id,_type];
				
				PVDZE_plr_TradeMenuResult set [count PVDZE_plr_TradeMenuResult, _dt];			
			};
			
			//cache traders
			P2DZE_cachedTraders set [count P2DZE_cachedTraders, [_cfgTraderCategory,PVDZE_plr_TradeMenuResult]];		
		};

		lbClear TraderDialogItemList;
		_it_list = [];
		{
			private ["_header", "_it", "_name", "_type", "_textPart", "_qty", "_buy", "_bqty", "_btype", "_sell", "_sqty", "_stype", "_mags", "_order", "_order", "_afile", "_File", "_count", "_magCount", "_magCount2", "_bag", "_bagclass", "_ind", "_image"];
			_header = _x select 0; // "TRD"
			_it = _x select 1;
			_name = _it select 0;
			_type = _it select 1;
			switch (true) do {
				case (_type == 1): {
					_type = "CfgMagazines";
				}; 
				case (_type == 2): {
					_type = "CfgVehicles";
				}; 
				case (_type == 3): {
					_type = "CfgWeapons";
				};
			};

			// Display Name of item
			_textPart =	getText(configFile >> _type >> _name >> "displayName");

			// Total in stock
			_qty = _x select 2;

			// Buy Data from array
			_buy = _x select 3;

			//diag_log(format["DEBUG player_traderMenuConfig.sqf: _x: %1", _x]);

			_bqty = _buy select 0;
			_btype = _buy select 2;
			switch(true)do{ 
				case (_btype == 1): {
					_btype = "CfgMagazines";
				}; 
				case (_btype == 2): {
					_btype = "CfgVehicles";
				}; 
				case (_btype == 3): {
					_btype = "CfgWeapons";
				}; 
			}; 

			// Display Name of buy item
			_sell = _x select 4;
			_sqty = _sell select 0;
			_stype = _sell select 2;
			switch(true)do{ 
				case (_stype == 1): { 
					_stype = "CfgMagazines";
				}; 
				case (_stype == 2): { 
					_stype = "CfgVehicles";
				}; 
				case (_stype == 3): { 
					_stype = "CfgWeapons";
				}; 
			}; 

			// Menu sort order
			_order = _x select 5;

			// Action file to use for trade
			_afile = _x select 7;
			_File = "\z\addons\dayz_code\actions\" + _afile + ".sqf";
				
			if (_afile == "trade_its" || _afile == "trade_any_bicycle" || _afile == "trade_any_boat" || _afile == "trade_any_vehicle" || _afile == "trade_any_vehicle_free") then {
				_File = "actions\" + _afile + ".sqf";
			};

			_count = 0;
			if(_type == "CfgVehicles") then {
				if (_afile == "trade_backpacks") then {
					_File = "actions\" + _afile + ".sqf";
					_bag = unitBackpack player;
					_bagclass = typeOf _bag;
					if(_name == _bagclass) then {
						_count = 1;
					};
				} else {
					if (isClass(configFile >> "CfgVehicles" >> _name)) then {
						_distance = dayz_sellDistance_vehicle;
						if (_name isKindOf "Air") then {
							_distance = dayz_sellDistance_air;
						};
						if (_name isKindOf "Ship") then {
							_distance = dayz_sellDistance_boat;
						};
						_count = ({(((typeOf _x) == _name) && {(alive _x)} && {(!(_x getVariable ["Deployed",false]))})} count (nearestObjects [(getPosATL player), [_name], _distance]));
					};
				};
			};

			if(_type == "CfgMagazines") then {
				_count = {_x == _name} count magazines player;
			};

			if(_type == "CfgWeapons") then {
				_count = {_x == _name} count weapons player;
			};

			_ind = lbAdd [TraderDialogItemList, format["%1 (%2)", _textPart, _name]];

			if (_count > 0) then {
				lbSetColor [TraderDialogItemList, _ind, [0, 1, 0, 1]];
			};

			//Mag Highligting: Yellow for Main Weapon Magtype, Orange for other magtypes the weapon can use
			_magCount = 0;
			_magCount2 = 0;

			if (_count < 1) then {
				{
				  _mags = [] + getArray (configFile >> "cfgWeapons" >> _x >> "magazines");
				  if (_mags select 0 == _name) exitWith { _magCount2 = _magCount2 + 1; };
				  { if (_x == _name) then { _magCount = _magCount + 1; }; } forEach _mags;
				} count weapons player;

				if (_magCount2 > 0) then {
					lbSetColor [TraderDialogItemList, _ind, [0.77, 1, 0, 1]];
				};
				if (_magCount > 0) then {
					lbSetColor [TraderDialogItemList, _ind, [0.9, 1, 0, 1]];
				};
			};

			_image = getText(configFile >> _type >> _name >> "picture");
			lbSetPicture [TraderDialogItemList, _ind, _image];

			_it_list set [count _it_list, [
				_name,
				_textPart,
				_bqty,
				"ItemGoldBar10z",
				"Gold Bars",
				_sqty,
				"ItemGoldBar10z",
				"Gold Bars",
				_header,
				_File
			]];
		} forEach PVDZE_plr_TradeMenuResult;

		P2DZE_traderListLoading = false;

		TraderItemList = _it_list;
	} else {
		systemChat("[Trader Dialog] Please wait for the list to finish loading.");
	};
};

TraderDialogShowPrices = {
	private ["_ind", "_it"];
	_ind = _this select 0;
	if (_ind < 0) exitWith {};
	//diag_log(format["P2DEBUG: _this: (%1) / TraderItemList: (%2)", _this, TraderItemList]);
	while {count TraderItemList < 1} do { uiSleep 1; };
	_it = TraderItemList select _ind;

	ctrlSetText [TraderDialogBuyPrice, format["%1 %2", _it select 2, _it select 4]];
	ctrlSetText [TraderDialogSellPrice, format["%1 %2", _it select 5, _it select 7]];
};

TraderDialogBuy = {
	private ["_ind", "_it", "_dt"];
	_ind = _this select 0;
	if (_ind < 0) exitWith {
		cutText [(localize "str_epoch_player_6"), "PLAIN DOWN"];
	};
	_it = TraderItemList select _ind;
	_dt = [_it select 0, _it select 3, 1, _it select 2, "buy", _it select 4, _it select 1, _it select 8];
	[0, player, '', _dt] execVM (_it select 9);
	TraderItemList = -1;
};

TraderDialogSell = {
	private ["_ind", "_it", "_dt"];
	_ind = _this select 0;
	if (_ind < 0) exitWith {
		cutText [(localize "str_epoch_player_6"), "PLAIN DOWN"];
	};
	_it = TraderItemList select _ind;
	_dt = [_it select 6, _it select 0, _it select 5, 1, "sell", _it select 1, _it select 7, _it select 8];
	[0, player, '', _dt] execVM (_it select 9);
	TraderItemList = -1;
};
