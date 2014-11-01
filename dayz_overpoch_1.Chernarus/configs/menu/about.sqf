_choose_section = _this select 0;

	 _leftmenu = ["Rules","Staff","Support","Recruitment","Servers","Our Vision","","Bases","Loadouts","Skins","Gold","Humanity"];
	//0 //1 //2 //3 //4 //5 //6
	if (_choose_section == "Left") exitWith {
	
		//sends left menu array to file
		_leftmenu 

	};
	if (_choose_section == "Right") exitWith {
		_selectright = _this Select 1;
		_text = switch (_selectright) do {



case (_leftmenu Select 0):{ 
"<t color='#01DFD7'>Rules</t>
<br/><br/>

No Hacking.
No Glitching.
No Duping items.
No Extreme Racial Insults.

Be respectful to staff.
<br/><br/> If you have a problem with a staff member, Please provide evidence (screen shots or video) on our forums. We will then investigate the matter.
"
};
case (_leftmenu Select 1):{ 
"<t color='#01DFD7'>Staff</t>
<br/><br/>
Our staff team are a loyal dedicated group of players who contribute their time 
to making your playing experience the best it can be.
<br/><br/>
It is not their job to do what you want when you want. But to help and suggest solutions to you.
<br/><br/>
<t color='#FFBF00'>Helpers</t>
<br/>
These are our trainee staff. New to the team, and still learning. 
<br/><br/>
<t color='#FFBF00'>Admins/Developers</t>
<br/>
There are our staff who has been with us for a while. Have learned how to use our investigation methods and are also helping to improve the servers. They have proven themselves to be trustworthy.
<br/><br/>
<t color='#FFBF00'>Management</t>
<br/>
These people are responsibly for training up our staff on how to use our tools, they also admin occasionally and try to help in situations where admins are unsure.
<br/><br/>
<t color='#FFBF00'>Owners</t>
<br/>
The guys who you never see. We hide behind the scenes, not getting involved in the day to day stuff. But overseeing everything. We spend the majority of our time coding new servers, and features for you enjoyment
"
};

case (_leftmenu Select 0):{ 
"<t color='#01DFD7'>Support</t>
<br/><br/>
If you cant find the solution to your problem on the menu system. Try joining our teamspeak. We have a massive staff team and support rooms where you can find the solution to the issue you have.
If you dont have teamspeak feel free to visit our forums on our website www.zombz.net We also have a huge staff team that monitor these forums and reply to any issues raised.
<br/><br/>
Hope you find what you are looking for
"
};
case (_leftmenu Select 3):{ 
"<t color='#01DFD7'>Recruitment</t>
<br/><br/>
We are always looking for the right people to help us support our servers. 
No special skills are required other than being a friendly, patient, helpful person.
<br/><br/>
<t color='#FFBF00'>Whats involved?</t>
<br/>
Directing players to the correct place to find the solution to their problem.
Being able to calm down a situation without throwing a ban out straight away.
Not resorting to arguments with angry players.
Being knowledgeable about the game.
Being able to learn our systems (training provided)
<br/><br/>
<t color='#FFBF00'>What do I get?</t>
<br/>
You get the joy of helping make this community the best.
You also get access to testing servers where we test new releases.
<br/><br/>
Still Interested? Fill out an application on our forums!
"
};
case (_leftmenu Select 4):{ 
"<t color='#01DFD7'>Servers</t>
<br/><br/>
We have been running arma 2 servers for years. We were the most successful Panthera server for a long time, until the mod died.
<br/><br/>
We run multiple servers. Our most successful is currently our overwatch servers. Which have been ranked in the top 10 servers for the past year
<br/><br/>
All Servers can be found and joined via our website (www.zombz.net) or by searching 1000000 vehicles, or zombz on dayz commander.
"
};
case (_leftmenu Select 5):{ 
"<t color='#01DFD7'>Our Vision</t>
<br/><br/>
Here at Zombz, we pride ourselves on quality. We aim for a community that runs the best, most interesting mods possible. Custom coded by ourselves. Not copy pasted like alot of other servers.
<br/><br/>
We pride ourselves are running anti hack measures that just cant be found anywhere else in the arma community.
<br/><br/>
Eventually we want to move onto Arma 3, and create a ton of fun mods, not just dayz, but mods like Warthunder, Call of Duty etc. Using the arma engines.
"
};
case (_leftmenu Select 6):{ 
"
"
};
case (_leftmenu Select 7):{ 
"<t color='#01DFD7'>Bases</t>
<br/><br/>
We dont currently offer bases on Overpoch. You can build them. This may change as we release more servers. But some servers will remain with no purchases.
"
};
case (_leftmenu Select 8):{ 
"<t color='#01DFD7'>Loadouts</t>
<br/><br/>
We dont currently offer loadouts on Overpoch. This may change as we release more servers. But some servers will remain with no purchases.
"
};
case (_leftmenu Select 9):{ 
"<t color='#01DFD7'>Skins</t>
<br/><br/>
We dont currently offer skins on Overpoch. This may change as we release more servers. But some servers will remain with no purchases.
"
};
case (_leftmenu Select 10):{ 
"<t color='#01DFD7'>Gold</t>
<br/><br/>
We dont currently offer gold on Overpoch. This may change as we release more servers. But some servers will remain with no purchases.
"
};
case (_leftmenu Select 11):{ 
"<t color='#01DFD7'>Humanity</t>
<br/><br/>
We dont currently offer humanity on Overpoch. This may change as we release more servers. But some servers will remain with no purchases.
"
};

			};//end of switch
		//sends text back to file

		_text

	};