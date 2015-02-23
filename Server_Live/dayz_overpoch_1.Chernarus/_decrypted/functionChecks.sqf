P2DZ_AH_FunctionChecks = {
	private ["_TrB","_TrS","_lt","_pi","_pn"];
	_pn = _this select 0;
	_pi = _this select 1;
	disableSerialization;

	if (P2DZ_AHDebug) then {
		diag_log(format["P2AntiHackDebug: %1", "P2DZ_AH_FunctionChecks"]);
	};

	_TrB = {
		private ['_in', '_it', '_dt'];
		_in = _this select 0;
		if (_in < 0) exitWith {
			cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
		};
		_it = TraderItemList select _in;
		_dt = [_it select 0, _it select 3, 1, _it select 2, 'buy', _it select 4, _it select 1, _it select 8];
		[0, player, '', _dt] execVM (_it select 9);
		TraderItemList = -1;
	};
	TraderDialogBuy = _TrB;

	_TrS = {
		private ['_in', '_it', '_dt'];
		_in = _this select 0;
		if (_in < 0) exitWith {
			cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
		};
		_it = TraderItemList select _in;
		_dt = [_it select 6, _it select 0, _it select 5, 1, 'sell', _it select 1, _it select 7, _it select 8];
		[0, player, '', _dt] execVM (_it select 9);
		TraderItemList = -1;
	};

	TraderDialogSell = _TrS;

	if (!isNil 'TraderItemList') then
	{
		if (typeName TraderItemList == 'CODE') then
		{
			P2DZ_fire = [_pn, _pi,  ('Trader Menu - Changed to Code!'),  (format["Suspect Code: %1",TraderItemList])];
			publicVariableServer 'P2DZ_fire';
			[] spawn P2DZ_AHKick;
		};
	};	
	if (!isNil 'fnc_usec_damageHandler') then 
	{
		if ((str (fnc_usec_damageHandler) == '{}' || (([(str fnc_usec_damageHandler)] call KRON_strLen) < 500))) then 
		{
			if (!([str (fnc_usec_damageHandler), "ZombZinSafeZone"] call KRON_strInStr)) then {
				P2DZ_fire = [_pn, _pi, 'fnc_usec_damageHandler changed', format['NotOriginal - God Mode? Suspect Code: %1',fnc_usec_damageHandler]];
				publicVariableServer 'P2DZ_fire';
				[player] call fnc_usec_damageHandle;
			};
		};
	};

	if (!isNil 'fnc_usec_unconscious') then 
	{
		if ((str (fnc_usec_unconscious) == '{}' || (([(str fnc_usec_unconscious)] call KRON_strLen) < 500))) then 
		{
			if (!([str (fnc_usec_unconscious), "ZombZinSafeZone"] call KRON_strInStr)) then {
				P2DZ_fire = [_pn, _pi, 'fnc_usec_unconscious changed', format['NotOriginal - Anti Knockout? Suspect Code: %1',fnc_usec_unconscious]];
				publicVariableServer 'P2DZ_fire';
				fnc_usec_unconscious =	compile preprocessFileLineNumbers "compile\fn_unconscious.sqf";
			};
		};
	};

	if (!isNil 'player_zombieCheck') then 
	{
		if (isNil 'p2_zoCh') then 
		{
			p2_zoCh = str(player_zombieCheck);
		};
	};
	if (!isNil 'p2_zoCh') then 
	{
		if (str(player_zombieCheck) != p2_zoCh && (([(str player_zombieCheck)] call KRON_strLen) < 500)) then 
		{
			if (!([str (player_zombieCheck), "ZombZinSafeZone"] call KRON_strInStr)) then {
				P2DZ_fire = [_pn, _pi, 'player_zombieCheck changed', format['NotOriginal - No Zed Aggro? Suspect Code: %1',player_zombieCheck]];
				publicVariableServer 'P2DZ_fire';
				 
			};
		};
	};
	if (!isNil 'player_checkStealth') then 
	{
		if (isNil 'p2_chSt') then 
		{
			p2_chSt = str(player_checkStealth);
		};
	};
	if (!isNil 'p2_chSt') then 
	{
		if (str(player_checkStealth) != p2_chSt) then 
		{
			P2DZ_fire = [_pn, _pi,  'player_checkStealth changed', format['NotOriginal - No Zed Aggro? Suspect Code: %1',player_checkStealth]];
			publicVariableServer 'P2DZ_fire';
			[] spawn P2DZ_AHKick;
		};
	};
	if (!isNil 'player_zombieAttack') then 
	{
		if (isNil 'p2_zoAt') then 
		{
			p2_zoAt = str(player_zombieAttack);
		};
	};
	if (!isNil 'p2_zoAt') then 
	{
		if (str(player_zombieAttack) != p2_zoAt) then 
		{
			P2DZ_fire = [_pn, _pi,  'player_zombieAttack changed',  format['NotOriginal - No Zed Damage? Suspect Code: %1',player_zombieAttack]];
			publicVariableServer 'P2DZ_fire';
			[] spawn P2DZ_AHKick;
		};
	};

	if (!isNil 'gearDialog_create') then 
	{
		if (isNil 'p2_geDiCr') then 
		{
			p2_geDiCr = str(gearDialog_create);
		};
	};
	if (!isNil 'p2_geDiCr') then 
	{
		if (str(gearDialog_create) != p2_geDiCr) then 
		{
			P2DZ_fire = [_pn, _pi,  'gearDialog_create changed',  format['NotOriginal - Menu Hack? Suspect Code: %1',gearDialog_create]];
			publicVariableServer 'P2DZ_fire';
			[] spawn P2DZ_AHKick;
		};
	};

	if (!isNil 'player_humanityMorph') then
	{
		if (isNil 'p2_huMo') then {p2_huMo = player_humanityMorph};
		player_humanityMorph = {
			private["_r"];
			if (typeOf player == (_this select 2)) exitWith {cutText ['You already wear this Skin!', 'PLAIN'];};
			closeDialog 0;closeDialog 0;closeDialog 0;
			_r = _this spawn p2_huMo;
			_r
		};
	};

	_lt = lbtext [12001,0];
	if (str _TrB != str TraderDialogBuy) then
	{
		P2DZ_fire = [_pn, _pi,  ('TraderDialogBuy modified: '),  (format["Trader Text: %1, Player Pos: %2, Suspect Code: %3",_lt,getPosATL player,TraderDialogBuy])];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;

	};

	if (str _TrS != str TraderDialogSell) then
	{
		P2DZ_fire = [_pn, _pi,  ('TraderDialogSell modified: '),  (format["Trader Text: %1, Player Pos: %2, Suspect Code: %3",_lt,getPosATL player,TraderDialogSell])];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick;
	};

};