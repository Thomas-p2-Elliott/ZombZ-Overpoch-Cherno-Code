private ["_colour","_colour2","_playerWealth","_PUID","_zGold"];
_PUID = (getPlayerUID player);
_zGold = (player getVariable["ZombZGold", 0]);

_playerWealth = (_zGold >= ColourPrice);

if (_playerWealth) then {
	_colour = ""+str((sliderPosition 5700) / 10)+","+str((sliderPosition 5701) / 10)+","+str((sliderPosition 5702) / 10)+",1";
	_colour2 = ""+str((sliderPosition 6700) / 10)+","+str((sliderPosition 6701) / 10)+","+str((sliderPosition 6702) / 10)+",1";

	PVDZE_veh_Colour = [VehicleToPaint,_colour,_colour2,_PUID,dayz_playerName];
	publicVariableServer "PVDZE_veh_Colour";

	P2DZE_plr_giveChange = [player,(_zGold - ColourPrice)];
	publicVariableServer "P2DZE_plr_giveChange";

	titleText ["Vehicle has been repainted! Please wait a moment for the texture to update!","PLAIN DOWN"];
} else {
	titleText ["You do not have enough gold bars to repaint your vehicle!","PLAIN DOWN"];
};
