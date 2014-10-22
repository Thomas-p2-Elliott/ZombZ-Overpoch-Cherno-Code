/*---------------------------------------------------------------------------
Player2's Stats Logger


Logs: 

	Connects
	Disconnects
	Deaths
	Hits
	Player Syncs (Movement)
	Gold Changes
	Trader Transactions

---------------------------------------------------------------------------*/


stats_death = {
	[format["%1_%2",P2DZ_serverName,"stats_death"],format["%1",(_this)]] call p2net_log1; 
};

stats_connects = {
	[format["%1_%2",P2DZ_serverName,"stats_connects"],format["%1",(_this)]] call p2net_log1; 
};

stats_disconnects = {
	[format["%1_%2",P2DZ_serverName,"stats_disconnects"],format["%1",(_this)]] call p2net_log1; 
};

stats_hits = {
	[format["%1_%2",P2DZ_serverName,"stats_hits"],format["%1",(_this)]] call p2net_log1; 
};

stats_gold = {
	[format["%1_%2",P2DZ_serverName,"stats_gold"],format["%1",(_this)]] call p2net_log1; 
};

stats_trader = {
	[format["%1_%2",P2DZ_serverName,"stats_trader"],format["%1",(_this)]] call p2net_log1; 
};

stats_sync = {
	[format["%1_%2",P2DZ_serverName,"stats_sync"],format["%1",(_this)]] call p2net_log1; 
};