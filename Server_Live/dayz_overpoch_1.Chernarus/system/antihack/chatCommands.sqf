P2DZ_chatCommands = {

	if (P2DZ_AHDebug) then {
		//diag_log(format["P2AntiHackDebug: %1", "P2DZ_chatCommands"]);
	};

	private ["_display","_chat","_txt","_txtArray","_sound"];
	disableSerialization;
	_display = findDisplay 24;
	if (isNull _display) then { } else {
		_chat = _display displayCtrl 101;
		_txt = ctrlText _chat;
		if (_txt != '') then
		{
			_txtArray = toArray _txt;
			if ((_txtArray select 0) in [44,36,37,38,92,124,194,176,45,95,60,62]) then {_chat ctrlSetText '';};
			if (_txt in ['/scream','scream']) then
			{
				(_display) closeDisplay 0;
				_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;
				[nil,player,rSAY,[_sound,250]] call RE;
				[player,500,true,(getPosATL player)] spawn player_alertZombies;
			};
			if (count (nearestObjects [player, ['Plastic_Pole_EP1_DZ'], 45]) == 0) then
			{
				if (_txt in ['stop','/stop']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rswitchMove,''] call RE;
					player playActionNow 'stop';
				};
				if (_txt in ['pushup','/pushup']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_exercisePushup'] call RE;
				};
				if (_txt in ['handstand','/handstand']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou'] call RE;
				};
				if (_txt in ['boxing','/boxing']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle68boxing'] call RE;
				};
				if (_txt in ['marts','/marts','karate','/karate','fighter','/fighter']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_exerciseKata'] call RE;
				};
				if (_txt in ['boogie','/boogie']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingDuoIvan'] call RE;
				};                             
				if (_txt in ['dance','/dance']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingStefan'] call RE;
				};
				if (_txt in ['clubbing','/clubbing']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingDuoStefan'] call RE;
				};
				if (_txt in ['excercise','/excercise']) then
				{
					(_display) closeDisplay 0;
					[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle69drepy'] call RE;
				};
			};
			if (_txt in ['/killme','killme']) then
			{
				(_display) closeDisplay 0;
				[] spawn (compile preprocessFileLineNumbers 'compile\player_death.sqf');
				player setHit['Body',1];
			};
			if (_txt in ['!help','/help','help']) then
			{
				(_display) closeDisplay 0;
				systemChat 'ZombZ Chat Commands:';
				systemChat '/stop, stop, /pushup, pushup, /handstand, handstand, /boxing, boxing,';
				systemChat '/marts, marts, /karate, karate, /fighter, fighter, /boogie, boogie,';
				systemChat '/dance, dance, /clubbing, clubbing, /excercise, excercise,';
				systemChat '/killme, killme, /unstuck, unstuck';
			};
		};
	};
};