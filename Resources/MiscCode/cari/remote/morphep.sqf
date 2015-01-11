private ["_long"];
_long = ;
private ["_cariMorphep"];_cariMorphep = format ["
	removeAllWeapons player;
	removeAllItems player;
	removeBackpack player;
	_model = '%1';
	[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
",cariMorph];
[_cariMorphep] call cariRE;uiSleep 2;
call cariAdd;
if (cariDayz) then {call cariNear;};systemChat format ["Morphed every player to %1",cariMorph];