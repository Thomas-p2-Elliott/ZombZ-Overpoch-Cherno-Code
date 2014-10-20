epoch_totalCurrency = {
	_total_currency = 0;
	_total_currency = player getVariable ["ZombZGold", 0];
	diag_log format["DEBUG TRADER epoch_totalCurrency: %1", _total_currency];
	_total_currency
};


epoch_returnChange = {
	private ["_trade_total","_part_inWorth","_part_in_configClass","_total_currency","_part","_worth","_return_change","_total","_briefcase_100oz","_gold_10oz_a","_gold_10oz_b","_gold_10oz","_gold_1oz_a","_gold_1oz_b","_gold_1oz","_silver_10oz_a","_silver_10oz_b","_silver_10oz","_silver_1oz_a","_silver_1oz_b","_silver_1oz","_successful","_buyOrSell","_total_items"];
	_successful = false;
	_canAfford = false;

	_buyOrSell = (_this select 1);

	diag_log format["DEBUG TRADER INPUT: %1", (_this select 0)];

	// buying in currency
	_trade_total = (_this select 0) call epoch_itemCost;

	diag_log format["DEBUG TRADER INPUT TOTAL: %1", _trade_total];

	_total_currency_dry = call epoch_totalCurrency;

	_return_change_dry = 0;
	if (_buyOrSell == 0) then {
		//buy
		_return_change_dry = _total_currency_dry - _trade_total; 
	} else {
		//sell
		_return_change_dry = _total_currency_dry + _trade_total; 
	};

	diag_log format["DEBUG TRADER DRY: %1", _return_change_dry];

	if (_return_change_dry >= 0) then {
		_canAfford = true;
	};

	if (_canAfford) then {

		// total currency
		_total_currency = _total_currency_dry;

		diag_log format["DEBUG TRADER INPUT CURRENCY TOTAL: %1", _total_currency];

		_return_change = 0;
		if (_buyOrSell == 0) then {
			//buy
			_return_change = _total_currency - _trade_total; 
		} else {
			//sell
			_return_change = _total_currency + _trade_total; 
		};

		diag_log format["DEBUG TRADER CHANGE: %1", _return_change];

		if (_return_change >= 0) then {
			
			// total currency
			_total = _return_change;
			P2DZE_plr_giveChange = [player,_total];
			publicVariableServer "P2DZE_plr_giveChange";

			_successful = true;
		};
	};
	_successful
};