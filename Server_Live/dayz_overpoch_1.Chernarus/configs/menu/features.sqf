_choose_section = _this select 0;

	 _leftmenu = ["Auto Refuel","Anti Side Chat","A.I. Missions ","A.I Fortress","Altitude Meter","Base Building","Crafting Menu","Craftable Vehicles","Custom Mapping","Custom Displays","Custom Sounds","Colour Menu System","Code Rewrites","Custom Debug","Combat Log Punishment","Debug Kill Punishment","Death Messages","Extra Zeds","Extended Friends","Faster Traders","Ground Spawn","Halo Spawn","Halo Jump","Headless Client ","Humanity Levels","Lifting ","New Loot","New Vehicles","New Stances","Maintain Base","Medic System (heroes)","Menu UID","Paint Vehicle","Random Loadouts","Random Vehicle Spawns","Randomised Mags","Shoot from Vehicle","Server Antihack","Skynet Antihack","Snap Build Pro","Towing","Trader Zones","Tons of bug fixes","Watermark","Zombie Hordes","",""];
	//0 //1 //2 //3 //4 //5 //6
	if (_choose_section == "Left") exitWith {
	
		//sends left menu array to file
		_leftmenu 
	};
	if (_choose_section == "Right") exitWith {
		_selectright = _this Select 1;
		_text = switch (_selectright) do {

case ("Auto Refuel"):{
"<t color='#01DFD7'>Auto Refuel</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Allows the player to refuel vehicles when near any fuel sources.
<br/><br/>
Walk up to the fuel source, mouse wheel and click refuel vehicle. Then simply wait.
"
};
case ("Anti Side Chat"):{
"<t color='#01DFD7'>Anti Side Chat</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Warns players when they try to talk over side chat. 
<br/><br/>
Continued abuse will lead to an automatic kick from the server.
"
};
case ("A.I. Missions "):{
"<t color='#01DFD7'>A.I. Missions </t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
You will always find 2 AI missions active on the server. Visit these areas, kill the AI, and take the reward. Check your map for the locations.
<br/><br/>
AI missions are done via our headless client to remove any lag that would normally be caused. 
"
};
case ("A.I Fortress"):{
"<t color='#01DFD7'>A.I Fortress</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
If you can manage to take on the AI fortress, your going to get some very nice rewards. Although, we would not recomend trying to do this alone! Check your map for the location.
We have added some scary surprises to this place. If you want to know what they are, well... you'll just have to try and take it on.
<br/><br/>
The AI fortress is done via our headless client to remove any lag that would normally be caused.
"
};
case ("Altitude Meter"):{
"<t color='#01DFD7'>Altitude Meter</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Well one thing we noticed when players HALO jump, sometimes they tend to go splat. So we attatched each player with a pretty altitude watch. That also shows the direction your player is facing.
<br/><br/>
Watch it carefully to know when to pull your parachute.
"
};
case ("Base Building"):{
"<t color='#01DFD7'>Base Building</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Allows you to build a base, after you have placed a plot pole on the map. Build it to look however you want. Store your valuables here, But make sure to plan for attacks. 
We intend to add booby traps to allow you to protect your base while offline.
<br/><br/>
There is a detailed write up on base building located on the menu. Look there for more information, recipes and guides.
"
};
case ("Crafting Menu"):{
"<t color='#01DFD7'>Crafting Menu</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
You can create items both for base building and other uses. Using various items found around the map
<br/><br/>
There is a detailed write up on all the crafting in the game located on the menu. Look there for more information, recipes and guides.
"
};
case ("Craftable Vehicles"):{
"<t color='#01DFD7'>Craftable Vehicles</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Allows you to build vehicles out of vehicle parts. You can then upgrade these with more parts.
<br/><br/>
Check out the detailed write up on the menu to find out what you need and what you can build.
"
};
case ("Custom Mapping"):{
"<t color='#01DFD7'>Custom Mapping</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Thats right, we have improved towns. Built new areas to explore. Just to add to the fun.
<br/><br/>
Lets face it, Cherno is old and boring. So find new roads, airfields, towns and outposts located around the map. We rotate these to other outposts at different periods of time to give you a nice fresh field
"
};
case ("Custom Displays"):{
"<t color='#01DFD7'>Custom Displays</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We have added alot of custom displays to the game, and continue to redesign and add more.
<br/><br/>
As you will notice the gear menu has changed. It now shows your gold.
<br/><br/>
We have a completly custom debug monitor. New information menus. Log out screens, etc etc.
"
};
case ("Custom Sounds"):{
"<t color='#01DFD7'>Custom Sounds</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We have added various sound effects throughout the game.
<br/><br/>
For example, taking pain pills now plays the sound of you taking the pills. Morphine now makes the sound of you injecting it. 
<br/><br/>
See if you can figure out what other sounds we have added.
"
};
case ("Colour Menu System"):{
"<t color='#01DFD7'>Colour Menu System</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We know that not everyone likes the same thing. Therefore we have added the ability to customise your experience.
<br/><br/>
Change and swap around the colors of your menus to what suits you best.
"
};
case ("Code Rewrites"):{
"<t color='#01DFD7'>Code Rewrites</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We have rewritten alot of the code that came with the mod. We did this to improve efficiency. Reduce lag and desync to give the game a more real feel. Alot of this goes unseen, but it has been a 6 month non stop project. We have added in tons of security to also help stop hacks.
"
};
case ("Custom Debug"):{
"<t color='#01DFD7'>Custom Debug</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Our debug monitor is pretty awesome. 
<br/><br/>
You can change the way it looks, Switch it off completly. Or even change the color from the Menu. Have a play around, F5 changes the way it looks.
"
};
case ("Combat Log Punishment"):{
"<t color='#01DFD7'>Combat Log Punishment</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Comabt logging, one of the most annoying things about the game. Also a very hard one to deal with. We have played around and now have a punishment system in place to deal with this.
<br/><br/>
After so many offences the punishment will get worse. Muhahahahaha
"
};
case ("Debug Kill Punishment"):{
"<t color='#01DFD7'>Debug Kill Punishment</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Even more annoying than combat logging. You change clothes and boom you get shot in the face in debug by some noob who has logged in and spawned in debug. 
<br/><br/>
Our code which has been running for a long time on Overwatch. It checks players locations when they shoot someone. 
<br/><br/>
If your in debug... Well your going to enjoy the 10,000 feet drop, over the ocean, if you dont die, your going to die swimming. A helicopter cant even get there and back on 1 tank of fuel.
"
};
case ("Death Messages"):{
"<t color='#01DFD7'>Death Messages</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
Totally custom, counter strike styled death messages. 
<br/><br/>
Watch the top left of the screen to see them in detail. 
"
};
case ("Extended Friends"):{
"<t color='#01DFD7'>Extended Friends</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> <br/>
So we have all seen tag as friendly for a long time. But we have taken it a step futher. Tagged friends can now: 
<br/><br/>
Enter your base without the pass code 
<br/>
Contribute to the building of your base
"
};
case ("Faster Traders"):{
"<t color='#01DFD7'>Faster Traders</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
While it might not seem it. We have massivly improved the speed of trader lists. We do have over 800 weapons, and 600 vehicles for sale.
<br/><br/>
So yeh. We had to change the way they work to make it load alooooot faster.
<br/><br/>
You wont find more items at a trader than on our servers.
"
};
case ("Ground Spawn"):{
"<t color='#01DFD7'>Ground Spawn</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
You have the choice to spawn on the ground, at the location of your choosing.
<br/><br/>
This can be helpful if you dont want to get spotted floating in
"
};
case ("Halo Spawn"):{
"<t color='#01DFD7'>Halo Spawn</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
You have the choice to spawn in the air and parachute to ground. 
<br/><br/>
This is handy if you want to view the area before you land. Or deliberatly parachute 2k into the map.
"
};
case ("Halo Jump"):{
"<t color='#01DFD7'>Halo Jump</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
You can now halo jump out of vehicles once they are above a certain altitude (around about 175). 
<br/><br/>
So fly into a hot zone and have your team jump to different locations for the perfect ambush.
"
};
case ("Headless Client "):{
"<t color='#01DFD7'>Headless Client </t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Now this is a complicated one to explain. Basically we connect to the server as a PLAYER. We then use this player to run certain code and calculations. This helps take the load off the server, and put the load onto the (imaginary) player.
<br/><br/>
This means we can do things like add 100 AI to the map, multiple huge zombie hordes and extra zombies for each player with no lag created what so ever. It actually causes less lag than a real player running around.
<br/><br/> 
Our headless client runs on 1gb internet line, so its super fast and can process and send information really quickly.
"
};
case ("Humanity Levels"):{
"<t color='#01DFD7'>Humanity Levels</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/>
There are multiple levels of humanity. 
<br/><br/>
A write up on these is coming soon
<br/> 
"
};
case ("Lifting "):{
"<t color='#01DFD7'>Lifting </t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
The ability to lift and carry vehicles around the map. Great if you want to make money by selling vehicles. You can even take vehicles to combat zones or back to your base. 
We want to vary the kinds of helicopters that are seen flying around and also make it a bit more interesting in terms of different experiences you get on the server. 
<br/><br/>
You can lift by hovering over the vehicle and mousewheel to click LIFT
<br/><br/>
So only the following Vehicles can lift:
<br/>
USEC_ch53_E - Mi17_medevac_Ins - Mi17_medevac_CDF
<br/>
Mi17_medevac_RU - BAF_Merlin_DZE - MV22_DZ
<br/>
Mi17_Civilian_DZ - CH53_DZE - UH60M_MEV_EP1
<br/>
Ka137_PMC - Ka60_PMC -CH_47F_EP1_DZE
"
};
case ("New Loot"):{
"<t color='#01DFD7'>New Loot</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We have literally every weapon availble over 800 of them added around the map. Even TWS weapons can be found. But they are rare.
<br/><br/>
We have also added every skin package. with right click options to allow you to get into skins you could not wear as it stood.
<br/><br/>
There are carepackages, Helicrashes, and various others added around, With tons of food/meds/weapons/skins/ammo etc
"
};
case ("New Vehicles"):{
"<t color='#01DFD7'>New Vehicles</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We spent a long time going through every vehicle to see what works. We now have every single one that does, In the server. The vehicles around the map are random, So you never know what you might find. They also dont spawn in the same place when destroyed. So keep your eyes out. Alot of these are hidden
<br/><br/>
Wether you want to drive around in tanks/ambulances/sports car/ hipppie vans or anything else. Its all here. On the ZombZ servers.
"
};
case ("New Stances"):{
"<t color='#01DFD7'>New Stances</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
So you know about sit down, and salute, vault etc. We have also added more stances to the game. Some can be caused by hitting x c and v in certain situations.
"
};
case ("Maintain Base"):{
"<t color='#01DFD7'>Maintain Base</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
You can maintain your base with gold, by visiting the plot pole for your base. Alternatively you can read up more by going to the basebuilding section of the menu.
"
};
case ("Medic System - heroes"):{
"<t color='#01DFD7'>Medic System - heroes</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
So theres not really much call for heroes anymore. Thats why we have added in the ability, to bandage, fix legs, and heal unconcious, without the need for bandages/morphine/epi pen. Lets hope this means you will be a hero and save my life.
"
};
case ("Menu UID"):{
"<t color='#01DFD7'>Menu UID</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
There are 3 Bob's in the server, How can we tell which one is you. To get around this, we have added your Unique ID, only assigned to you, to your escape menu. If there is any major problems, we can use this to help you out.
"
};
case ("Paint Vehicle"):{
"<t color='#01DFD7'>Paint Vehicle</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Mouse wheel on certain vehicles and you can set your own colors. This will cost you some gold. But it will save after restart. Rock the server with Pink bus if thats what floats your boat
"
};
case ("Random Loadouts"):{
"<t color='#01DFD7'>Random Loadouts</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
One thing we always hated was that there was no difference when you logged in. Everyone was the same. So as you start your survival, you are assigned with different gear. This is random, so you never know what you might end up with.
"
};
case ("Random Vehicle Spawns"):{
"<t color='#01DFD7'>Random Vehicle Spawns</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
To make the game more interesting and prevent people from farming vehicle spawns after a restart, We have totally randomised the spawn locations of destroyed vehicles. Now your really gonna have to hunt, insted of flying back to the same spot. It should help players bump into vehicles randomly.
"
};
case ("Randomised Mags"):{
"<t color='#01DFD7'>Randomised Mags</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> So weapons dont just hold the same magazines. There is actually tons of mags it can use. Thats why we have added code to randomise the magazines found with weapons. Adding more interesting stuff is what we do.
"
};
case ("Shoot from Vehicle"):{
"<t color='#01DFD7'>Shoot from Vehicle</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Experimental and constantly being worked on. Certain vehicles can now be shot from. We will continue to keep adding to this as we update. 
<br/><br/>
Controls
<br/>
Scroll wheel to shoot
Insert to get back to the pasenger seat
Unfortunatly at this moment, there are only 2 vehicles this works with. We are working to fix some serious bugs we encountered.
"
};
case ("Server Antihack"):{
"<t color='#01DFD7'>Server Antihack</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We have server anti hacks, that dont add load and fps to the server. Just a ton of checks on your players to make sure you arnt doing anything you shouldnt be, or have anything you shouldnt have. This will then talk with our skynet program, Having skynet investigate you further, and hand out a ban if required.
"
};
case ("Skynet Antihack"):{
"<t color='#01DFD7'>Skynet Antihack</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Our baby. One of the most efficient Anti Hacks going. Completly coded by us, and kept really hush hush. This helps us automatically ban players from the server and we keep it quiet because we dont want players to work out how it works. Once people know, getting around it becomes easier.
So fear not, skynet is watching you.
"
};
case ("Snap Build Pro"):{
"<t color='#01DFD7'>Snap Build Pro</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Snap building, allows you to easily attatch base objects together. You no longer need to spend ages perfecting your base objects so that you dont fall through them. See basebuilding for more information.
"
};
case ("Towing"):{
"<t color='#01DFD7'>Towing</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Just like lifting, but allows you to tow a vehicle behind another. To tow simple select the vehicle you want to tow, click tow, and approach the vehicle you will be towing with.
<br/><br/>
We have made the following vehicles able to tow:
<br/>

Ural_CDF - Ural_INS - UralCivil
<br/>
UralCivil2 - V3S_Civ - V3S_Gue
<br/>
Ural_UN_EP1 - Ural_TK_CIV_EP1 - MTVR_DES_EP1
<br/>
V3S_TK_EP1_DZE - UralCivil_DZE - UralCivil2_DZE
<br/>
KamazOpen_DZE - GAZ_Vodnik_MedEvac
<br/>
BRDM2_HQ_TK_GUE_EP1 - BTR40_TK_GUE_EP1
<br/>
BTR40_TK_INS_EP1 - M1133_MEV_EP1 - GAZ_Vodnik_DZE 
<br/>
BTR90_DZE - BTR90_HQ_DZE - LAV25_DZE
<br/>
LAV25_HQ_DZE - M113Ambul_UN_EP1_DZ - TowingTractor
<br/>
M113Ambul_TK_EP1_DZ - Tractor - tractorOld 

"
};
case ("Trader Zones"):{
"<t color='#01DFD7'>Trader Zones</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
A bunch of anti griefing code, to stop players abusing trader zones. 
<br/><br/>
Speed Restriction 25 kph
<br/>
Unable to fire weapons
<br/>
God Mode
<br/>
Vehicles dumped and unlocked, outside of trader zones on restart. Remember though, Not every trader zone is protected. If it is, it will say as you enter.
"
};
case ("Tons of bug fixes"):{
"<t color='#01DFD7'>Tons of bug fixes</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
We have been through all the files, and fixed tons of bugs caused by the epoch and overwatch code. If you find any more bugs please post them on forums so we can add them to our todo list.
<br/><br/>
Unfortunatly some bugs are caused by the arma engine and we are unable to do anything with these
"
};
case ("Watermark"):{
"<t color='#01DFD7'>Watermark</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Our own stamp to say that it is our server that you are playing on.
<br/><br/>
There are alot of servers that try to steal our code, or copy our code. Always play official zombz for the best experiences.
"
};

case ("Zombie Hordes"):{
"<t color='#01DFD7'>Zombie Hordes</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
This feature has not been seen before in dayz. It is immense and ground breaking
<br/><br/>
Becareful when sitting around, at times the hordes may pass through your area. A huge group of zombies all grouped up together running around the map. There may even be more than one group running around at a time. If you see them... Be ready to run.
"	
}

case ("Extra Zeds"):{
"<t color='#01DFD7'>Extra Zeds</t>
<br/><br/>
<t color='#FFBF00'>Description: </t>
<br/> 
Our headless client spawns in extra zombies for each player on the server.
<br/><br/>
Our hope is that this will give you all a much scarier zombie game, the way Dayz was supposed to be.
"	
};
case (""):{
""
};
			};//end of switch
		//sends text back to file

		_text

	};

/*

Auto Refuel
Anti Side Chat
A.I. Missions 
A.I Fortress
Altitude Meter
Base Building
Crafting Menu
Craftable Vehicles
Custom Mapping
Custom Displays
Custom Sounds
Colour Menu System
Code Rewrites
Custom Debug
Combat Log Punishment
Debug Kill Punishment
Death Messages
Extended Friends
Faster Traders
Ground Spawn
Halo Spawn
Halo Jump
Headless Client 
Humanity Levels
Lifting 
New Loot
New Vehicles
New Stances
Maintain Base
Medic System (heroes) - can fix any issues other than sick
Menu UID
Paint Vehicle
Random Loadouts
Random Vehicle Spawns
Randomised Mags - spawns with different types of mags
Shoot from Vehicle
Server Antihack
Skynet Antihack
Snap Build Pro
Towing
Trader Zones
Tons of bug fixes
Watermark

*/