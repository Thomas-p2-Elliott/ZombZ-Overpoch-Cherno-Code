//Script: p2LocalObjs\init.sqf
//Author: Player2
//Description: Initiliazes local object systems various components on the server and the two client types (headless & player)

/* How? 



	The player/server both have copies of an object created on startup with 0 damage
	The client has 2 local event handlers handlers applied to each object, handleDamage & killed
	both of these handlers parse their info on to the server, the damage handler wont parse the damage client side
	it ignore the damage, and just tells the server about it, the server then responds and tells that client
	and all nearby clients that the object should have X damage and to apply it accordingly


	The server gets sent via pubVarServer any damage applied to an object by a client
	It then saves that objects new damage into a cache with 3 bits of info
	the global var name of that object, the amount of damage applied, and the player objects netid that applied the damage
	the players objects netid is used so the server knows who is aware of the damage to that object and who isnt
	since only the player who applied the damage is aware of it at the point of damage, they are the only one who gets
	added to that list on initial object damage, when the server sends this information to other clients it will
	update the cache to include more and more netids as more clients become aware of the damage change to that object

	While the server is running, it loops through all online, alive players
		Per player it then loops through the damaged object cache
			if the player is near an object that has had damage applied, and has not previously received the current damage:
				the damage will be sent to that player via pubVarClient and they will be added to the received damage portion
				of that objects chunk in the damage cache to prevent re-sending of the same message



/*---------------------------------------------------------------------------
	Debugging Variables
---------------------------------------------------------------------------*/
P2LOS_Debug_Client_Damage = true; 				//enable client-side damage debugging outputs
P2LOS_Debug_Server_Damage = true;				//enable server-side damage debugging outputs

P2LOS_Debug_Client_NetMessages = true;			//enable client-side network message debugging outputs
P2LOS_Debug_Server_NetMessages = true;			//enable server-side network message debugging outputs

P2LOS_Debug_Server_Cache = true;				//enable server-side cache debugging outputs

/*---------------------------------------------------------------------------
Server
---------------------------------------------------------------------------*/
if (isDedicated && !hasInterface || isServer) exitWith {
	private["_nil1"];
	_nil1 =						[] execVM "p2LocalObjs\server.sqf";

};


/*---------------------------------------------------------------------------
Client / Player
---------------------------------------------------------------------------*/
if (hasInterface && !isDedicated) exitWith {
	private["_nil1"];
	_nil1 =						[] execVM "p2LocalObjs\client.sqf";


};


/*---------------------------------------------------------------------------
Headless Client
---------------------------------------------------------------------------*/
if (!hasInterface && !isDedicated && !isServer) exitWith {
	//ToDo? Might not be needed...
};