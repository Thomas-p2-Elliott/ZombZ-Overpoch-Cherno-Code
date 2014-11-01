_choose_section = _this select 0;

	 _leftmenu = ["About","Bicycle","Motorbike","ATV","350z","BTR","Humvee","BTR W/ Guns","Humvee W/ Guns","","Gyrocopter","Littlebird","Merlin","Huey"];
	//0 //1 //2 //3 //4 //5 //6
	if (_choose_section == "Left") exitWith {
	
		//sends left menu array to file
		_leftmenu 

	};
	if (_choose_section == "Right") exitWith {
		_selectright = _this Select 1;
		_text = switch (_selectright) do {



case (_leftmenu Select 0):{ 
"Craftable Vehicles is a feature originally created by the ZombZ team. Many servers have ripped off the basic original script of creating a bicycle. 
But no other servers have our indepth crafting system.
<br/><br/>
Craftable Vehicles, allows you to literally build and upgrade vehicles just using vehicle parts. 
Meaning as you move around the map, find industrial loot or even industrial carepackages. You can upgrade your vehicle further.
<br/><br/>
A full list of what upgrades can be done, and what parts are required are listed on the right.
"
};
case (_leftmenu Select 1):{ 
"<t color='#01DFD7'>Bicycle</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A standard push bike. Allowing you to easily and quietly move around the map.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
None
<br/>
"
};
case (_leftmenu Select 2):{ 
"<t color='#01DFD7'>Motorbike</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A good old, Noisy 2 man Motorbike. Allows fast travel, both offroad and onroad.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
Bicycle
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Scrap Metal x 1 Engine x 1
<br/>
"
};
case (_leftmenu Select 3):{ 
"<t color='#01DFD7'>ATV</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Really fast, 2 man bouncy fun. Great if you have the skill to handle it. Comes with its own flipping machine! (located on your scrollbar when you flip)
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
Bicycle
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Wheel x 1 Scrap Metal x 1
<br/>
"
};
case (_leftmenu Select 4):{ 
"<t color='#01DFD7'>350z</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A fast, sexy Sports car. You will look the part driving around the map in one of these 2 man speedsters.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
Motorbike
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Wheel x 1 Scrap Metal x 1
<br/>
"
};
case (_leftmenu Select 5):{ 
"<t color='#01DFD7'>BTR 40</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A heavily armoured, open top mini tank.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
ATV
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Scrap Metal x 1 Engine x 1
<br/>
"
};

case (_leftmenu Select 6):{ 
"<t color='#01DFD7'>BTR With Guns</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A heavily armoured, open air mini tank. With a big ass machine gun on it.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
BTR
<br/stuff><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Heavy Machine gun x 1 Scrap Metal x 1
<br/>
"
};

case (_leftmenu Select 7):{ 
"<t color='#01DFD7'>Humvee</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A nicely armoured Humvee, that carrys alot of players around the map.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
BTR
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Scrap Metal x 1
<br/>
"
};
case (_leftmenu Select 8):{ 
"<t color='#01DFD7'>Humvee with Guns</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A nicely armoured humvee with an exposed gunner seat
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
Humvee
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Heavy Machine Gun x 1 Scrap Metal x 1
<br/>
"
};
case (_leftmenu Select 9):{ 
"

"
};
case (_leftmenu Select 10):{ 
"<t color='#01DFD7'>Gyrocopter</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A 1 man flying helicopter. Compeltly exposed. But can drop grenades from the air
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
 Engine x 1 Main Rotar x 1
<br/>
"
};
case (_leftmenu Select 11):{ 
"<t color='#01DFD7'>Littlebird</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
a 4 man helicopter, fast, agile and classy
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
Gyrocopter
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Scrap Metal x 1 Engine x 1
<br/>
"
};
case (_leftmenu Select 12):{ 
"<t color='#01DFD7'>Merlin</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A huge helicopter, carrys alot of people, and can take alot of damage.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
Littlebird
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Scrap Metal x 1 Engine x 1
<br/>
"
};
case (_leftmenu Select 13):{ 
"<t color='#01DFD7'>Huey</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A nice fast helicopter with 2 gunner seats
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Upgrades From:</t>
<br/>
Merlin
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Heavy Machine Gun x 1 Scrap Metal x 1
<br/>
"
};
			};//end of switch
		//sends text back to file

		_text

	};