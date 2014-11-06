private ["_bldTxtClrO","_bldTxtClrW","_bldTxtClrR","_bldTxtClrG","_bldTxtSz","_bldTxtSzT","_bldTxtShdw","_bldTxtAlgnL","_bldTxtUndrln","_bldTxtBold","_bldTxtFinal","_bldTxtStringTitle","_bldTxtString1","_bldTxtString2","_bldTxtString3","_bldTxtString4","_bldTxtString5","_bldTxtString6","_bldTxtString7"];
/*---------------------------------------------------------------------------
p2_mountHelp

Description:

	Shows text on screen detailing how to use the vehicle mount system
	How to aim, how to shoot, to switch back to the seat

Author: Player2
Thanks to SnapBuildPro Author for giving me some copy pasteable pretty text =D
---------------------------------------------------------------------------*/

/*Text Configuration*/
_bldTxtClrO = "color='#ff8800'";
_bldTxtClrW = "color='#ffffff' size='0.6'"; 
_bldTxtClrR = "color='#fd0a05'"; 
_bldTxtClrG = "color='#11ef00'"; 
_bldTxtSz = "size='0.86'"; 
_bldTxtSzT = "size='0.7'"; 
_bldTxtShdw = "shadow='1'"; 
_bldTxtAlgnL = "align='left'"; 
_bldTxtUndrln = "underline='true'";
_bldTxtBold = "font='Zeppelin33'"; 
_bldTxtFinal = "";

/*Key Configuration*/

_freeLook = 		actionKeysNames ["LookAround", 1];
_freeLook2 = 		actionKeysNames ["LookAroundToggle", 1];
_rightMouseBtn = 	actionKeysNames ["Optics", 2];
_reload = 			actionKeysNames ["ReloadMagazine", 2];
_turnLeft = 		actionKeysNames ["LeanLeft", 2];
_turnRight = 		actionKeysNames ["LeanRight", 2];

_getOut = 							"INSERT";
_freeLook = 		_freeLook2 + " or " +  _freeLook;
_freeLook = 		[_freeLook,"""",""] call KRON_Replace;
_rightMouseBtn = 	[_rightMouseBtn,"""",""] call KRON_Replace;
_reload = 			[_reload,"""",""] call KRON_Replace;
_turnLeft = 		[_turnLeft,"""",""] call KRON_Replace;
_turnRight = 		[_turnRight,"""",""] call KRON_Replace;


/* The Text to Display */

//Title
_bldTxtStringTitle = format ["<t %1%2%3%4%6>ZombZ<t %5%7> Drive-By</t></t><br />",_bldTxtClrW,_bldTxtSz,_bldTxtShdw,_bldTxtAlgnL,_bldTxtClrO,_bldTxtUndrln,_bldTxtBold];

//Contents
_bldTxtString1 = format["<t %1%3%4%5>[%6]<t %2>: Look Down the sights.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_rightMouseBtn];
_bldTxtString2 = format["<t %1%3%4%5>[%6]<t %2>: Aim/Point Weapon.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_freeLook];
_bldTxtString3 = format["<t %1%3%4%5>[%6]<t %2>: Reload Weapon.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_reload];
_bldTxtString4 = format["<t %1%3%4%5>[%6]<t %2>: Turn Left.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_turnLeft];
_bldTxtString5 = format["<t %1%3%4%5>[%6]<t %2>: Turn Right.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_turnRight];
_bldTxtString6 = format["<t %1%3%4%5>[%6]<t %2>: Get out of firing position.</t></t><br /><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_getOut];
_bldTxtString7 = format["<t %1%3%4%5>[Instructions]<t %2>: Go into first person view.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
_bldTxtString8 = format["<t %1%3%4%5><t %2> Use %6 to raise weapon.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_rightMouseBtn];
_bldTxtString9 = format["<t %1%3%4%5><t %2> Then Use %6 to aim.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL,_freeLook];

_bldTxtFinal = _bldTxtStringTitle + _bldTxtString1 + _bldTxtString2 + _bldTxtString3 + _bldTxtString4 + _bldTxtString5 + _bldTxtString6 + _bldTxtString7 + _bldTxtString8 + _bldTxtString9;

[
	_bldTxtFinal, //structured text
	0.55 * safezoneW + safezoneX, //number - x
	0.55 * safezoneH + safezoneY, //number - y
	45, //number - duration
	1, // number - fade in time
	0, // number - delta y
	800 //number - layer ID
] spawn bis_fnc_dynamicText;