/*---------------------------------------------------------------------------
Player2's Stats Logger


Logs: 

	Connects
	Disconnects
	Deaths
	Kills
	Hits
	Gold Transactions
	Trader Transactions

---------------------------------------------------------------------------*/

//compile/player2_deathMessage.sqf
stats_kills = {
	[format["%1/%2",P2DZ_serverName,"stats_kills"],format["%1",(_this)]] call p2net_log1; 
};

//compile/server_playerDied.sqf
stats_deaths = {
	[format["%1/%2",P2DZ_serverName,"stats_deaths"],format["%1",(_this)]] call p2net_log1; 
};

//compile/server_onPlayerConnect.sqf
stats_connects = {
	[format["%1/%2",P2DZ_serverName,"stats_connects"],format["%1",(_this)]] call p2net_log1; 
};

//compile/server_onPlayerDisconnect.sqf
stats_disconnects = {
	[format["%1/%2",P2DZ_serverName,"stats_disconnects"],format["%1",(_this)]] call p2net_log1; 
};

//compile/fnc_plyrHit.sqf
stats_hits = {
	[format["%1/%2",P2DZ_serverName,"stats_hits"],format["%1",(_this)]] call p2net_log1; 
};

//init/goldEventHandlers.sqf
stats_gold = {
	[format["%1/%2",P2DZ_serverName,"stats_gold"],format["%1",(_this)]] call p2net_log1; 
};

//compile/server_tradeObject.sqf
stats_trades = {
	[format["%1/%2",P2DZ_serverName,"stats_trader"],format["%1",(_this)]] call p2net_log1; 
};

//p2re/p2re_init.sqf
stats_hackers = {
	[format["%1/%2",P2DZ_serverName,"stats_hackers"],format["%1",(_this)]] call p2net_log1; 
};

//p2re/p2re_init.sqf
stats_teleports = {
	[format["%1/%2",P2DZ_serverName,"stats_teleports"],format["%1",(_this)]] call p2net_log1; 
};