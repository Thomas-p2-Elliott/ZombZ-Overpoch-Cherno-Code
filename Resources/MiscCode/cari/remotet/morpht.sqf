private ["_long"];
_long = ;
private ["_target","_cariMorpht","_cariName"];_target = _this select 0;
_cariName = name _target;_cariMorpht = format ["
	if (name player == '%2') then {
		removeAllWeapons player;
		removeAllItems player;
		removeBackpack player;
		_model = '%1';
		[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
	};
",cariMorph,_cariName];
[_cariMorpht] call cariRE;systemChat format ["Morphed %2 into %1",cariMorph,_cariName];