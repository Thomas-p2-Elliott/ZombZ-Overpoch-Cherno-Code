	//basebuilding menu
	_choose_section = _this select 0;

	 _leftmenu = ["Explained","Controls","Maintenance","Health and Removal","Garage Door","Garage Door Locked","Half Floor","Large Door Frame","Large Wall With Door","Large Door Locked","Large Wall","Large Door Frame","Large Wall Window","Quarter Floor","Small Door Frame","Small Door Locked","Small Wall","Small Door Frame","Small Wall With Door","Small Wall Window","Third Wall","Wooden Ladder","Wooden Floor","WoodStairs Sans","Wooden Stairs w/ Supports","Cinder Block Half Wall","Cinder Block Full Wall Upgrade","Cinder Garage Doorway","Cinder Garage Doorway Locked","Cinder Wall With Door","Metal Floor","",""];

	//0 //1 //2 //3 //4 //5 //6
	if (_choose_section == "Left") exitWith {
	
		//sends left menu array to file
		_leftmenu 

	};
	if (_choose_section == "Right") exitWith {
		_selectright = _this Select 1;
		_text = switch (_selectright) do {



case (_leftmenu Select 0):{ 
"A 30 Meter Plot Pole is required to build a base. <br/>
A Plot pole can be found around the map. <br/>
In buildings, carepackages and also purchased from traders.<br/>
<br/>
Once you have your Plot Pole. Head to the location you want	your base. Right click your Plot Pole, in your inventory.
<br/><br/>
To obtain various parts for your base... You must collect various parts from around the map. Combining these items 
will create the parts for your base. A recipe book is provided on the left.
<br/><br/>
You can build multiple stories with locked doors and garages decorative windows and door less openings.
<br/>
"
};

case (_leftmenu Select 1):{ 
"<t color='#FFBF00'>CTRL+PGUP/PGDN</t> 
<br/>
1/100th meter movement
<br/><br/>
<t color='#FFBF00'>ALT+PGUP/PGDN</t>
<br/>
1 meter movement.
<br/><br/>
Building pieces go wherever you are looking.
<br/><br/>
This server uses snap building. You can mouse wheel to force building pieces to snap together.
<br/><br/>
Right clicking Tools and Items brings up various options also 
<br/><br/>
Supply_Crates are no longer needed in crafting. Instead, use these to pack up your scrap metal, tank traps, wire fencing kits, Coke and Pepsi cans.
<br/>
"	
};		
case (_leftmenu Select 2):{ 
"
If left unattended bases will eventually decay.<br/>
When a base decays its parts will start to vanish from the map.
<br/><br/>
There are two ways to maintain your base:
<br/><br/>
<t color='#FFBF00'>Option 1 </t>
<br/>
You can mousewheel on your plot pole and pay the cost via a fee of gold. 
<br/><br/>
<t color='#FFBF00'>Option 2 </t>
<br/>
You can manually maintain items by using mousewheel on an object. 
<br/>
To maintain an wooden items, you need lumber. 
<br/>
To maintain block walls, you need mortar buckets. 
<br/><br/>
Remember. If you forget to maintain your base will vanish! 
<br/>
"
};
case (_leftmenu Select 3):{ 
"
Every building piece comes with health. It can therefore be demolished if enough damage is caused. 
<br/><br/>
Wooden items are tier 1 objects. These have the least health.
<br/><br/>
Cinder and Metal items are tier 2 objects. These have the most health 
<br/><br/>
They can no longer be run over by vehicles. 
<br/><br/>
Owners can now remove obects they have placed without having to destroy them. <br/>
Nothing is refundable or returned to the owner however. 
<br/>
"
};
case (_leftmenu Select 4):{
"
<t color='#01DFD7'>Garage Door</t> (ItemWoodWallGarageDoor) 
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Wooden garage door. Allows ground vehicles to enter and leave your base. 
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workbench
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar 
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallLg x 1 
<br/>
"
};
case (_leftmenu Select 5):{
"
<t color='#01DFD7'>Garage Door Lockable</t> (ItemWoodWallGarageDoorLocked) <br/>
<br/>
<t color='#FFBF00'>Description: </t>
<br/>
Wooden garage door that can be locked. Allows ground vehicles to enter and leave your base.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workbench 
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar 
<br/><br/>
<t color='#FFBF00'>Required Parts: </t>
<br/>
ItemWoodWallGarageDoor x 1 
<br/>
Item ComboLock x 1 
<br/>
"
};
case (_leftmenu Select 6):{
"
<t color='#01DFD7'>Half_Floor</t> (ItemWoodFloorHalf)
<br/><br/>
<t color='#FFBF00'>Description:</t>
<br/>
Half of a room's floor created from wooden planks and plywood, can also serve as a ceiling and roof.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodFloorQuarter x 2
<br/>
"
};
case (_leftmenu Select 7):{
"
<t color='#01DFD7'>Large Door Frame</t> (ItemWoodWallDoorLg)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Wooden wall built with a doorway in mind.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallLg x 1
<br/>
"
};

case (_leftmenu Select 8):{
"
<t color='#01DFD7'>Large Wall With Door</t>(ItemWoodWallWithDoorLg)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Larger wooden wall equipped with a door.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallDoorLg x 1
PartWoodLumber x 1
PartWoodPlywood x 1
<br/>
"
};
case (_leftmenu Select 9):{
"
<t color='#01DFD7'>Large Door Locked</t> (ItemWoodWallWithDoorLgLocked)
<br/><br/>
<t color='#FFBF00'>Description:</t>
<br/>
Larger wooden wall equipped with a lockable door.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallWithDoorLg x 1
ItemComboLock x 1
<br/>
"
};
case (_leftmenu Select 10):{
"
<t color='#01DFD7'>Large Wall</t> (ItemWoodWallLg)
<br/><br/>
<t color='#FFBF00'>Description:</t>
<br/>
Larger wooden wall built to withstand substantial damage.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWall x 1
PartWoodPlywood x 1
PartWoodLumber x 1
<br/>
"
};
case (_leftmenu Select 11):{
"
<t color='#01DFD7'>Large Door Frame</t> (ItemWoodWallDoorLg)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Wooden wall built with a doorway in mind.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallLg x 1
<br/>
"
};
case (_leftmenu Select 12):{
"
<t color='#01DFD7'>Large Wall Window</t> (ItemWoodWallWindowLg)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Larger wooden wall with featured window.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallLg x 1
PartGlass x 1
<br/>
"
};
case (_leftmenu Select 13):{
"
<t color='#01DFD7'>Quarter Floor</t> (ItemWoodFloorQuarter)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
1/4 of a room's floor created from wooden planks and plywood, can also serve as a ceiling/roof.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
PartWoodLumber x 3
PartWoodPlywood x 3
<br/>
"
};
case (_leftmenu Select 14):{
"
<t color='#01DFD7'>Small Door Frame</t> (ItemWoodWallDoor)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Smaller wooden wall built with a doorway in mind.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWall x 1
PartWoodLumber x 2
<br/>
"
};
case (_leftmenu Select 15):{
"
<t color='#01DFD7'>Small Door Locked</t> (ItemWoodWallWithDoorLocked)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Smaller wooden wall equipped with secured lockable door.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallWithDoor x 1
ItemComboLock x 1
<br/>
"
};
case (_leftmenu Select 16):{
"
<t color='#01DFD7'>Small Wall</t> (ItemWoodWall)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Smaller variant of the wooden wall built to withstand substantial damage.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallThird x 3
<br/>
"
};
case (_leftmenu Select 17):{
"
<t color='#01DFD7'>Small Door Frame</t> (ItemWoodWallDoor)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Smaller wooden wall built with a doorway in mind.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWall x 1
PartWoodLumber x 2
<br/>
"
};
case (_leftmenu Select 18):{
"
<t color='#01DFD7'>Small Wall With Door</t> (ItemWoodWallWithDoor)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Smaller wooden wall built with a door in mind.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWallDoor x 1
PartWoodLumber x 1
PartWoodPlywood x 1
<br/>
"
};
case (_leftmenu Select 19):{
"
<t color='#01DFD7'>Small Wall Window</t> (ItemWoodWallWindow)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Smaller wooden wall equipped with featured window.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodWall x 1
PartGlass x 1
<br/>
"
};
case (_leftmenu Select 20):{
"
<t color='#01DFD7'>Third Wall</t> (ItemWoodWallThird)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Short wooden wall in the likeness of a banister.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
PartWoodPlywood x 3
PartWoodLumber x 3
<br/>
"
};
case (_leftmenu Select 21):{
"
<t color='#01DFD7'>Wooden Ladder</t> (ItemWoodLadder)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Ladder designed to reach one story upwards.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
PartWoodLumber x 8
<br/>
"
};
case (_leftmenu Select 22):{
"
<t color='#01DFD7'>Wooden Floor</t> (ItemWoodFloor)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A room sized structure of flooring created from wooden planks and plywood, can also serve as a ceiling/roof.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodFloorHalf x 2
<br/>
"
};
case (_leftmenu Select 23):{
"
<t color='#01DFD7'>WoodStairs Sans</t> (ItemWoodStairs)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Stairs intended to reach one story of your structure.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
PartWoodLumber x 8
<br/>
"
};
case (_leftmenu Select 24):{
"
<t color='#01DFD7'>Wooden Stairs With Supports</t> (ItemWoodStairsSupport)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Stairs intended to reach one story of your structure. (With supports).
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemWoodStairs x 1
PartWoodLumber x 2
<br/>
"
};
case (_leftmenu Select 25):{
"
<t color='#01DFD7'>Cinder Block Half Wall</t> (CinderWallHalf_DZ)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Cinder Wall Half built to increase defence.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
CinderBlocks x 3
MortarBucket x 1
<br/>
"
};
case (_leftmenu Select 26):{
"
<t color='#01DFD7'>Cinder Block Full Wall</t> (CinderWall_DZ)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Upgrade your Cinder Wall Half to further increase defense.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
CinderBlocks x 3
MortarBucket x 1
<br/>
"
};
case (_leftmenu Select 27):{
"
<t color='#01DFD7'>Cinder Garage Doorway</t> (CinderWallDoorway_DZ)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Cinder garage doorway built to increase defense.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
CinderBlocks x 3
MortarBucket x 1
ItemTankTrap x 1
<br/>
"
};
case (_leftmenu Select 28):{
"
<t color='#01DFD7'>Cinder Garage Doorway Locked</t> (CinderWallDoorway_DZ)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Cinder garage doorway built to increase defense, with a 3 digit combination lock added.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
CinderBlocks x 3
MortarBucket x 1
ItemTankTrap x 1
<br/>
<t color='#FFBF00'>Upgrade Frame to Garage Door</t>
<br/>
ItemTankTrap x 3
ItemPole x 3
<br/>
<t color='#FFBF00'>Upgrade to Locked Garage Door</t>
<br/>
ItemComboLock x 1
<br/>
"
};
case (_leftmenu Select 29):{
"
<t color='#01DFD7'>Cinder Wall With Door</t> (cinder_door_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Reinforced metal door w/ cinder block wall used in the Modular Building System.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
CinderBlocks x 4
Mortar Bucket x 1
TankTrap x 1
<br/>
Upgrades: Can be upgraded while in place to a LOCKED door!
"
};
case (_leftmenu Select 30):{
"
<t color='#01DFD7'>Metal Floor</t> (metal_floor_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Reinforced metal floor/ceiling item used in the Modular Building System.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox Crowbar, Sledgehammer
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
metal_panel_kit x 4
<br/>
"
};
case (_leftmenu Select 31):{
"
<t color='#01DFD7'></t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Reinforced metal floor/ceiling item used in the Modular Building System.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>

<br/>
"
};
case (_leftmenu Select 32):{
"
<t color='#01DFD7'></t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Reinforced metal floor/ceiling item used in the Modular Building System.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench_DZ
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>

<br/>
"
};

			};//end of switch
		//sends text back to file
		diag_log format["_text = %1",_text];
		_text

	};