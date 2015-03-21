// 0 = Disabled, 1 = Chat, 2 = Full
if (isNil 'P2DZ_notifsEvents') then {
	P2DZ_notifsEvents = 2;
};
if (isNil 'P2DZ_notifsKills') then {
	P2DZ_notifsKills = 	2;
};
if (isNil 'P2DZ_notifsServer') then {
	P2DZ_notifsServer = 2;
};
if (isNil 'P2DZ_notifsMode') then {
	P2DZ_notifsMode = 	[P2DZ_notifsEvents,P2DZ_notifsKills,P2DZ_notifsServer];
};

//Used for GUI notifications queue
P2DZ_guiNotif_lT = 0;
P2DZ_guiNotif_lL = 0;

//create notif function
P2DZ_guiNotif = compile preprocessFileLineNumbers "p2_notifs\client_notif.sqf";	

//Add handler now that functions are compiled
'P2DZE_guiMsg' addPublicVariableEventHandler { _id2 = (_this select 1) spawn P2DZ_guiNotif; };
