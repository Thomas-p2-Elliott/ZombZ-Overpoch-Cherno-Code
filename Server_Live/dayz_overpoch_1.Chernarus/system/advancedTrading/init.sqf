/*---------------------------------------------------------------------------
Global Variables
---------------------------------------------------------------------------*/
Z_SellableArray = [];
Z_SellArray = [];
Z_BuyArray = [];
Z_BuyingArray = [];
Z_vehicle = objNull;
Z_VehicleDistance = 30;
Z_MoneyVariable = "ZombZGold";
Z_NormalCurrency = false;
CurrencyName = 'Gold Bars';
call compile preprocessFileLineNumbers "system\advancedTrading\compiles.sqf";
call compile preprocessFileLineNumbers "system\advancedTrading\buildList.sqf";
Z_AdvancedTradingInit = true;