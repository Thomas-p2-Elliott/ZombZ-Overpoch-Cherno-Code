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
_bldTxtClrW = "color='#ffffff'"; 
_bldTxtClrR = "color='#fd0a05'"; 
_bldTxtClrG = "color='#11ef00'"; 
_bldTxtSz = "size='0.76'"; 
_bldTxtSzT = "size='0.6'"; 
_bldTxtShdw = "shadow='1'"; 
_bldTxtAlgnL = "align='left'"; 
_bldTxtUndrln = "underline='true'";
_bldTxtBold = "font='Zeppelin33'"; 
_bldTxtFinal = "";

/* The Text to Display */

//Title
_bldTxtStringTitle = format ["<t %1%2%3%4%6>ZombZ<t %5%7> Drive-By</t></t><br />",_bldTxtClrW,_bldTxtSz,_bldTxtShdw,_bldTxtAlgnL,_bldTxtClrO,_bldTxtUndrln,_bldTxtBold];

//Contents
_bldTxtString1 = format["<t %1%3%4%5>[Right Click]<t %2>: Aim Down the sights.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
_bldTxtString2 = format["<t %1%3%4%5>[ALT/FreeLook]<t %2>: Aim/Point Weapon.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
_bldTxtString3 = format["<t %1%3%4%5>[R]<t %2>: Reload Weapon.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
_bldTxtString4 = format["<t %1%3%4%5>[Insert]<t %2>: Get out of firing position.</t></t><br /><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
_bldTxtString5 = format["<t %1%3%4%5>[Instructions]<t %2>: Go into first person view.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
_bldTxtString6 = format["<t %1%3%4%5><t %2> Right click to aim down the weapons sights.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
_bldTxtString7 = format["<t %1%3%4%5><t %2> Hold or Double Tap ALT/FreeLook to aim the weapon.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];

_bldTxtFinal = _bldTxtStringTitle + _bldTxtString1 + _bldTxtString2 + _bldTxtString3 + _bldTxtString4 + _bldTxtString5 + _bldTxtString6 + _bldTxtString7;

[
	_bldTxtFinal, //structured text
	0.73 * safezoneW + safezoneX, //number - x
	0.65 * safezoneH + safezoneY, //number - y
	30, //number - duration
	1, // number - fade in time
	0, // number - delta y
	800 //number - layer ID
] spawn bis_fnc_dynamicText;