P2DZ_AH_FunctionChecks = {
	private ["_inSafeZoneVar","_TraderDialogBuy","_index","_item","_data","_TraderDialogSell","_ltxt","_puid","_inSafeZone","_result","_pname"];
	_pname = _this select 0;
	_puid = _this select 1;
	disableSerialization;

	if (P2DZ_AHDebug) then {
		diag_log(format["P2AntiHackDebug: %1", "P2DZ_AH_FunctionChecks"]);
	};

	_inSafeZoneVar = (player getVariable ["ZombZInSafeZone", false]);

	_TraderDialogBuy = {
		private ['_index', '_item', '_data'];
		_index = _this select 0;
		if (_index < 0) exitWith {
			cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
		};
		_item = TraderItemList select _index;
		_data = [_item select 0, _item select 3, 1, _item select 2, 'buy', _item select 4, _item select 1, _item select 8];
		[0, player, '', _data] execVM (_item select 9);
		TraderItemList = -1;
	};
	TraderDialogBuy = _TraderDialogBuy;

	_TraderDialogSell = {
		private ['_index', '_item', '_data'];
		_index = _this select 0;
		if (_index < 0) exitWith {
			cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
		};
		_item = TraderItemList select _index;
		_data = [_item select 6, _item select 0, _item select 5, 1, 'sell', _item select 1, _item select 7, _item select 8];
		[0, player, '', _data] execVM (_item select 9);
		TraderItemList = -1;
	};

	TraderDialogSell = _TraderDialogSell;

	if (!isNil 'TraderItemList') then
	{
		if (typeName TraderItemList == 'CODE') then
		{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
				_pname, _puid, toArray ('Trader Menu - not near a Trader!'), toArray (format["#1 - %1 @%2",_ltxt,getPosATL player])];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
	};	
	if (!isNil 'fnc_usec_damageHandler') then 
	{
		if ((str (fnc_usec_damageHandler) == '{}' || (([(str fnc_usec_damageHandler)] call KRON_strLen) < 500))) then 
		{
			if (!([str (fnc_usec_damageHandler),"ZombZinSafeZone"] call KRON_strInStr) || !(player getVariable ["ZombZInSafeZone", false])) exitWith {
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, 'fnc_usec_damageHandler', (str fnc_usec_damageHandler)];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
	};

	if (!isNil 'fnc_usec_unconscious') then 
	{
		if ((str (fnc_usec_unconscious) == '{}' || (([(str fnc_usec_unconscious)] call KRON_strLen) < 500))) then 
		{
			if (!([str (player_zombieCheck),"ZombZinSafeZone"] call KRON_strInStr) || !(player getVariable ["ZombZInSafeZone", false])) exitWith {
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, 'fnc_usec_unconscious', (str fnc_usec_unconscious)];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
	};

	if (!isNil 'player_zombieCheck') then 
	{
		if (isNil 'orig_player_zombieCheck') then 
		{
			orig_player_zombieCheck = str(player_zombieCheck);
		};
	};
	if (!isNil 'orig_player_zombieCheck') then 
	{
		if (str(player_zombieCheck) != orig_player_zombieCheck && (([(str fnc_usec_unconscious)] call KRON_strLen) < 500)) exitWith 
		{
			if (!(["ZombZinSafeZone", str (player_zombieCheck)] call KRON_strInStr) && !(player getVariable ["ZombZInSafeZone", false])) exitWith {
				PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, 'player_zombieCheck', (str player_zombieCheck)];
				publicVariableServer 'PVDZE_atp';
				[] spawn P2DZ_AHKick;
			};
		};
	};
	if (!isNil 'player_checkStealth') then 
	{
		if (isNil 'orig_player_checkStealth') then 
		{
			orig_player_checkStealth = str(player_checkStealth);
		};
	};
	if (!isNil 'orig_player_checkStealth') then 
	{
		if (str(player_checkStealth) != orig_player_checkStealth) exitWith 
		{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, toArray 'player_checkStealth', toArray ('NotOriginal')];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
	};
	if (!isNil 'player_zombieAttack') then 
	{
		if (isNil 'orig_player_zombieAttack') then 
		{
			orig_player_zombieAttack = str(player_zombieAttack);
		};
	};
	if (!isNil 'orig_player_zombieAttack') then 
	{
		if (str(player_zombieAttack) != orig_player_zombieAttack) exitWith 
		{
			PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",_pname, _puid, toArray 'player_zombieAttack', toArray ('NotOriginal')];
			publicVariableServer 'PVDZE_atp';
			[] spawn P2DZ_AHKick;
		};
	};

	if (!isNil 'player_humanityMorph') then
	{
		if (isNil 'oplayer_humanityMorph') then {oplayer_humanityMorph = player_humanityMorph};
		player_humanityMorph = {
			if (typeOf player == (_this select 2)) exitWith {cutText ['You already wear this Skin!', 'PLAIN'];};
			closeDialog 0;closeDialog 0;closeDialog 0;
			_result = _this spawn oplayer_humanityMorph;
			_result
		};
	};

	_ltxt = lbtext [12001,0];
	if (str _TraderDialogBuy != str TraderDialogBuy) then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid, toArray ('TraderDialogBuy modified: '), toArray (format["%1 @%2 %3",_ltxt,getPosATL player,TraderDialogBuy])];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;

	};

	if (str _TraderDialogSell != str TraderDialogSell) then
	{
		PVDZE_atp = format["NAME:	(%1)	UID: (%2)	COMMAND USED:	(%3)	PARAMS USED:	(%4)",
			_pname, _puid, toArray ('TraderDialogSell modified: '), toArray (format["%1 @%2 %3",_ltxt,getPosATL player,TraderDialogSell])];
		publicVariableServer 'PVDZE_atp';
		[] spawn P2DZ_AHKick;
	};

};