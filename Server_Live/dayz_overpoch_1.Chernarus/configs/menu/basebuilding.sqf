	//basebuilding menu
	_choose_section = _this select 0;

	 _leftmenu = ["Explained","Controls","Maintenance","Health and Removal","Garage Door","Garage Door Locked","Half Floor","Large Door Frame","Large Wall With Door","Large Door Locked","Large Wall","Large Door Frame","Large Wall Window","Quarter Floor","Small Door Frame","Small Door Locked","Small Wall","Small Door Frame","Small Wall With Door","Small Wall Window","Third Wall","Wooden Ladder","Wooden Floor","WoodStairs Sans","Wooden Stairs w/ Supports","Cinder Block Half Wall","Cinder Block Full Wall","Cinder Garage Doorway","Cinder Garage Locked","Cinder Wall w/ Door","Metal Floor","",
	 "Crafting","","Bandages","ItemPole","ItemBurlap","Canvas","Corrugated Fence","Lumber","LumberPack","Plywood","Plywood Pack","Sandbag","H Barrier","Camping Tent","Domed Desert Tent","Domed Green Tent","Arrows","Empty Supply Crate","Wooden Shed","Wood Shack","Wood Workbench","Stick Fence","Sandbag Nest","Sun Shade","Rusty Gate","Outhouse","Storage Shed","Light Pole","Desert Netting","Forest Netting","Large Desert Net","Large Forest Net","Deer Stand","Metal Panel","",""];

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
Toolbox, Crowbar, Sledgehammer
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
metal_panel_kit x 4
<br/>
"
};
case (_leftmenu Select 31):{
"
"
};
case (_leftmenu Select 32):{
"
Crafting items in Epoch is fairly simple. Most crafting requires toolbelt items, a workbench, and materials
<br/><br/>
Player built structures deteriorate over time and must be maintained or they will decay and be removed by automated cleanup processes!
 <br/><br/>
See Building Maintenance for building components which require maintenance.
 <br/><br/>
The easiest way to find out what you need is to right click a craft-able item and try to build it. If nothing happens, close or move your gear UI and read the displayed message. The message will tell you what is required for the next step. This means you will not have to use a browser based site to figure out what to craft and what it needs. You can simply attempt to build it and it will tell you what item/requirement is next.
"
};
case (_leftmenu Select 33):{
"
"
};
case (_leftmenu Select 34):{
"
<t color='#01DFD7'>Bandages</t> (ItemBandage)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Used to cover wounds and prevent blood loss.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
SkinBase (Any Clothes Parcel)
Toilet Paper
<br/>
"
};
case (_leftmenu Select 35):{
"
<t color='#01DFD7'>ItemPole</t> (ItemPole)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A few sturdy metal poles, used to craft tents and other buildables.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Fire
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
PartGeneric (Scrap Metal) x 2
<br/>
"
};
case (_leftmenu Select 36):{
"
<t color='#01DFD7'>ItemBurlap</t> (ItemBurlap)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A strong cloth like material used for building sandbags
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemCanvas x 2
<br/>
"
};
case (_leftmenu Select 37):{
"
<t color='#01DFD7'>Canvas</t> (ItemCanvas)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Canvas parcel used to make tents and camo netting.
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
SkinBase (clothing Parcel) x 2
<br/>
"
};
case (_leftmenu Select 38):{
"
<t color='#01DFD7'>Corrugated Fence</t> (ItemCorrugated)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A buildable object used for fortification purposes.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Fire
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemPole x 2
ItemTankTrap x 2
PartWoodLumber x 2
<br/>
"
};
case (_leftmenu Select 39):{
"
<t color='#01DFD7'>Lumber</t> (PartWoodLumber)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Used for building many structures.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
PartWoodPile x 2
<br/>
"
};
case (_leftmenu Select 40):{
"
<t color='#01DFD7'>Lumber Pack</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A pack of lumber to save some space
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Lumber x 3
<br/>
"
};
case (_leftmenu Select 41):{
"
<t color='#01DFD7'>Plywood</t> (PartWoodPlywood)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
USed for building structures.
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
PartWoodLumber x 2
<br/>
"
};
case (_leftmenu Select 42):{
"
<t color='#01DFD7'>Plywood Pack</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A pack of plywood to save space.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WorkBench
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
Plywood x 3
<br/>
"
};
case (_leftmenu Select 43):{
"
<t color='#01DFD7'>Sandbag</t> (ItemSandbag)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A buildable object used for fortification purposes.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Sand
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Entrenching Tool
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemBurlap x 3
<br/>
"
};
case (_leftmenu Select 44):{
"
<t color='#01DFD7'>H Barrier</t> (ItemSandbagLarge)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A buildable object that is used for fortification purposes.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Entrenching Tool
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemSandbag x 3
ItemWire x 1
ItemTankTrap x 1
<br/>
"
};
case (_leftmenu Select 45):{
"
<t color='#01DFD7'>Old Camping Tent</t> (ItemTent)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A place to store items
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemCanvas x 2
ItemPole x 2
<br/>
"
};
case (_leftmenu Select 46):{
"
<t color='#01DFD7'>Domed Desert Tent</t> (ItemTentDomed)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A domed version of a tent, to store items.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemCanvas x 3
ItemPole x 3
<br/>
"
};
case (_leftmenu Select 47):{
"
<t color='#01DFD7'>Domed Green Tent</t> (ItemTentDomed2)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Green version of the domed tent, for storing items.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemCanvas x 3
ItemPole x 3
<br/>
"
};
case (_leftmenu Select 48):{
"
<t color='#01DFD7'>Arrows</t> (WoodenArrow)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A wooden arrow, for use in a crossbow.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
PartWoodPile x 1
ItemTrashRazor x 1
<br/>
"
};
case (_leftmenu Select 49):{
"
<t color='#01DFD7'>Empty Supply Crate</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Used in to store items in bulk.
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
PartWoodLumber x 2
PartGeneric (Scrap Metal)x 1 
<br/>
"
};
case (_leftmenu Select 50):{
"
<t color='#01DFD7'>Wooden Shed</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A crafted object that holds a lot of items/weapons/backpacks and has a door that opens and closes.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
WoodShack, WorkBench
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemCorrugated x 2
PartWoodPlywood x 4
PartWoodLumber x 4
<br/>
"
};
case (_leftmenu Select 51):{
"
<t color='#01DFD7'>Wood Shack</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A crafted object that holds some items/weapons/backpacks.
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
bulk_empty x 1
PartWoodPlywood x 4
PartWoodLumber x 4
<br/>
"
};
case (_leftmenu Select 52):{
"
<t color='#01DFD7'>Wood Workbench</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A crafted workbench that allows crafting of items.
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
PartWoodPlywood x 1
PartWoodLumber x 2
<br/>
"
};
case (_leftmenu Select 53):{
"
<t color='#01DFD7'>Stick Fence</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A build-able barrier that can be used to keep zombies out of your camp. They are fairly weak and can be ran over easier.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
PartWoodPile x 6
<br/>
"
};
case (_leftmenu Select 54):{
"
<t color='#01DFD7'>Sandbag Nest</t> (sandbag_nest_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A build-able fortification object, can be removed.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Anywhere
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Entrenching Tools
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemSandbag x 4
PartWoodPlywood x 2
PartWoodLumber x 4
<br/>
"
};
case (_leftmenu Select 55):{
"
<t color='#01DFD7'>Sun Shade</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A build-able object used to keep the sun off your back.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemCanvas x 1
PartWoodLumber x 4
<br/>
"
};
case (_leftmenu Select 56):{
"
<t color='#01DFD7'>Rusty Gate</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A build-able object that can be opened and closed. Does not stop zombies from entering/opening.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemPole x 3
ItemTankTrap x 1
<br/>
"
};
case (_leftmenu Select 57):{
"
<t color='#01DFD7'>Outhouse</t> (outhouse_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A build-able object that you can hold a small stash in. Comes pre-stocked with one roll of Toilet Paper.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemCorrugated x 1
PartWoodPlywood x 3
PartWoodLumber x 3
ItemTrashToiletpaper x 1
<br/>
"
};
case (_leftmenu Select 58):{
"
<t color='#01DFD7'>Storage Shed</t> (storage_shed_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A large build-able object that is non enter-able and holds a lot of items/weapons/backpacks.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemCorrugated x 4
PartWoodPlywood x 2
PartWoodLumber x 2
<br/>
"
};
case (_leftmenu Select 59):{
"
<t color='#01DFD7'>Light Pole</t> (light_pole_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A build-able object that can be used with a (Generator TBA) to provide light in times of darkness.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Entrenching Tool
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemLightBulb x 1
PartGeneric x 1
PartWoodLumber x 6
<br/>
"
};

case (_leftmenu Select 60):{
"
<t color='#01DFD7'>Desert Netting</t> (desert_net_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Used to conceal your camp from enemies. Hide your valuables under this to give your camp that extra stealth. Perfect for those sandy camps.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Hunting Knife
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
ItemTent x 2 (Any Tent Type)
ItemPole x 2
<br/>
"
};
case (_leftmenu Select 61):{
"
<t color='#01DFD7'>Forest Netting</t> (forest_net_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Used to conceal your camp from enemies. Hide you valuables under this to give your camp that extra stealth. Perfect for hiding in a forest or jungle.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Entrenching Tool
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemTent x 4
ItemPole x 4
<br/>
"
};
case (_leftmenu Select 62):{
"
<t color='#01DFD7'>Large Desert Netting</t> (desert_large_net_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Three times larger than the normal Netting, the large net can cover a wider range, and can give you the ability to hide more than just sheds under it. Perfect for those sandy camps.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Entrenching Tool
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemDesertCamoNet x 3
<br/>
"
};
case (_leftmenu Select 63):{
"
<t color='#01DFD7'>Large Forest Netting</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Three times larger than the normal Netting, the large net can cover a wider range, and can give you the ability to hide more than just sheds under it. Perfect for hiding in a forest or jungle.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Entrenching Tool
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemForestCamoNet x 3
<br/>
"
};
case (_leftmenu Select 64):{
"
<t color='#01DFD7'>Deer Stand</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A deerstand, used for looking out over an area.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
bulk_empty x 1
PartWoodLumber x 8
PartWoodPile x 2
<br/>
"
};
case (_leftmenu Select 65):{
"
<t color='#01DFD7'>Metal Panel</t> (metal_panel_kit)
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
A metal panel to provide cover.
<br/><br/>
<t color='#FFBF00'>Must be crafted near:</t>
<br/>
Workshop
<br/><br/>
<t color='#FFBF00'>Required Tools: </t>
<br/>
Toolbox, Crowbar
<br/><br/>
<t color='#FFBF00'>Required Parts:</t>
<br/>
ItemPole x 4
ItemTankTrap x 4
<br/>
"
};
case (_leftmenu Select 66):{
"
"
};
case (_leftmenu Select 67):{
"
"
};

			};//end of switch
		//sends text back to file
		diag_log format["_text = %1",_text];
		_text

	};