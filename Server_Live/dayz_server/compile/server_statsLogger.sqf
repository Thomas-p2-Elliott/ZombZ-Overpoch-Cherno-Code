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

/*---------------------------------------------------------------------------
GLS LOGS - Root Folder - All Servers
---------------------------------------------------------------------------*/

//p2re/p2re_init.sqf
stats_hackers = {
	[format["%1","stats_hackers"],format["%1",(_this)]] call p2net_log2; 
};

//compile/player2_deathMessage.sqf
stats_kills = {
	[format["%1","stats_kills"],format["%1",(_this)]] call p2net_log2; 
};
//compile/fnc_plyrHit.sqf
stats_hits = {
	[format["%1","stats_hits"],format["%1",(_this)]] call p2net_log2; 
};
//init/goldEventHandlers.sqf
stats_gold = {
	[format["%1","stats_gold"],format["%1",(_this)]] call p2net_log2; 
};
//init/goldEventHandlers.sqf
stats_gold_human = {
	[format["%1","stats_gold_human"],format["%1",(_this)]] call p2net_log2; 
};

//compile/server_tradeObject.sqf
stats_trades = {
	[format["%1","stats_trader"],format["%1",(_this)]] call p2net_log2; 
};

/*---------------------------------------------------------------------------
GLS LOGS - Server Name/Number - Per Server
---------------------------------------------------------------------------*/

//compile/server_onPlayerConnect.sqf
stats_allConnects = {
	[format["%1/%2",P2DZ_serverName,"stats_allConnects"],format["%1",(_this)]] call p2net_log2; 
};


/*---------------------------------------------------------------------------
Recommended Move to GLS Logs
---------------------------------------------------------------------------*/
//init\server_functions.sqf
stats_publishLog = {
	[format["%1/%2",P2DZ_serverName,"stats_publishLog"],format["%1",(_this)]] call p2net_log2; 
};

//compile/server_updateObject.sqf
stats_vehicleKills = {
	[format["%1/%2",P2DZ_serverName,"stats_deleteLog"],format["%1",(_this)]] call p2net_log2;
};

//compile\server_logUnlockLockEvent.sqf
stats_logUnlock = {
	[format["%1/%2",P2DZ_serverName,"stats_lockUnlock"],format["%1",(_this)]] call p2net_log2; 
};



/*---------------------------------------------------------------------------
Development Logs
---------------------------------------------------------------------------*/

//p2re/p2re_init.sqf
stats_teleports = {
	[format["%1/%2",P2DZ_serverName,"stats_teleports"],format["%1",(_this)]] call p2net_log2; 
};


//compile\server_publishObject.sqf
stats_badPublishLog = {
	[format["%1/%2",P2DZ_serverName,"stats_badPublishes"],format["%1",(_this)]] call p2net_log2; 
};


//system\antihack_functions.sqf
stats_hashFails = {
	[format["%1/%2",P2DZ_serverName,"stats_hashFails"],format["%1",(_this)]] call p2net_log2; 
};


//init\server_monitor.sqf
stats_highGoldObjects = {
	[format["%1/%2",P2DZ_serverName,"stats_highGoldObjects"],format["%1",(_this)]] call p2net_log2; 
};

//system\antihack_functions.sqf
stats_goldHashFails = {
	[format["%1/%2",P2DZ_serverName,"stats_hashFailsGold"],format["%1",(_this)]] call p2net_log2; 
};

/*---------------------------------------------------------------------------
Misc Logs
---------------------------------------------------------------------------*/
//compile/server_onPlayerDisconnect.sqf
stats_disconnects = {
	[format["%1/%2",P2DZ_serverName,"stats_disconnects"],format["%1",(_this)]] call p2net_log2; //done by BEC
};

stats_connects = {
	[format["%1/%2",P2DZ_serverName,"stats_connects"],format["%1",(_this)]] call p2net_log2; 
};

//compile/server_playerDied.sqf
stats_deaths = {
	[format["%1/%2",P2DZ_serverName,"stats_deaths"],format["%1",(_this)]] call p2net_log2; 
};

stats_hackers_human = {
	[format["%1/%2",P2DZ_serverName,"stats_hackers_human"],format["%1",(_this)]] call p2net_log2; 
};

stats_plotPlacements = {
	[format["%1/%2",P2DZ_serverName,"stats_plotPlacements"],format["%1",(_this)]] call p2net_log2; 
};
