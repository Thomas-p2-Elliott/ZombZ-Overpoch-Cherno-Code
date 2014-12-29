//generate hash for vehicles
P2DZE_randHashVar = "hash_id" callExtension "id";
P2DZE_randHashVar = ("_" + P2DZE_randHashVar);

call compile ("
	with uiNamespace do {
	    if (isNil 'hashIdVar" + P2DZE_randHashVar + "') then {
	        uiNamespace setVariable ['hashIdVar" + P2DZE_randHashVar + "', 'hash_id' callExtension 'rID'];
	    };
	};
");