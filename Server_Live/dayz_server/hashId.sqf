/*---------------------------------------------------------------------------
    Hash Id Functions
----------------------
Description:
    This generates the server hash - should be run ONCE on server startup
---------------------------------------------------------------------------*/
//Create random variable using hashid system
P2DZE_randHashVar = "hash_id" callExtension "id";
//Append _ to variable contents, making it something like "_32141"
P2DZE_randHashVar = ("_" + P2DZE_randHashVar);

//Create a variable in server uiNamespace, variable name being something like "_32141", 
//variable contents being the servers rID to use when verifying a generated hashId
call compile ("
	with uiNamespace do {
	    if (isNil 'hashIdVar" + P2DZE_randHashVar + "') then {
	        uiNamespace setVariable ['hashIdVar" + P2DZE_randHashVar + "', 'hash_id' callExtension 'rID'];
	    };
	};
");