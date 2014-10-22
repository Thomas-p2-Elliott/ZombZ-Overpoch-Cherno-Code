switch ((_this select 1)) do
{
		/*
		//DELETE key
		case 211:
		{	
			comment "Rotate unit anticlockwise";
			if (!NORRN_heliDoorRight) then 
			{
				_dir = ((getDir player) + 0.1) - 1;
				player setDir _dir;
			};
		};
		//END key
		case 207:
		{	
			comment "Rotate unit clockwise";
			if (!NORRN_heliDoorRight) then 
			{
				_dir = ((getDir player) + 0.1) + 1;
				player setDir _dir;
			}; 	
		};
		*/

		//INSERT key
		case 210:
		{	
			comment "INSERT - eject";
			if (!(player getVariable "NORRN_heliDoor")) then 
			{	
				titleText ["Move to seat","BLACK FADED", 0.2];
				detach player;
				player setVariable ["NORRN_heliDoor", true, true];
			};
		};

		//R key
		case 19:
		{	
			comment "R - reload";
			if (!(player getVariable "NORRN_heliDoor")) then 
			{	
				reload player;
			};
		};
		
}; 

