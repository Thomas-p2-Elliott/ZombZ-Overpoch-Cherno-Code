private['_pname','_puid'];
_pname = _this select 0; _puid = _this select 1; 

if (P2DZ_AHDebug) then {
	diag_log(format["P2AntiHackDebug: %1", "miscChecks"]);
};

/*---------------------------------------------------------------------------
Ensure Game Functions are Loaded Correctly
---------------------------------------------------------------------------*/
call compile ("
{
	[_x] spawn {
		_x = _this select 0;
		waitUntil {!(isNil _x)};
		P2DZ_fire =["+(str _pname)+", " +(str _puid)+ ", 'GameFunction Broken: ',  (str(_x))];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick; 
	};
} forEach ['typeName','lbClear','closedialog','startloadingscreen','endLoadingScreen','findDisplay','setposATL','getPos','to',
'closeDisplay','getPlayerUID','publicVariableServer','setPos','toArray','setposASL','getPosASL','driver',
'endMission','str','isNil','diag_log','format','removeMagazines','getPosATL','from','ctrlEnabled','uiNameSpace',
'removeMagazine','failMission','diag_ticktime','setGroupIconsVisible','groupIconsVisible','publicvariable',
'profileNamespace','for','displayRemoveAllEventHandlers','ctrlRemoveAllEventHandlers','removeWeapon',
'&&','||','removeAction','in','spawn','do','displayCtrl','player','select','saveProfileNamespace',
'exitWith','or','and','visibleMap','uiSleep','alive','isNull','typeOf','distance','true','false','isDedicated',
'unitRecoilCoefficient','call','setunitRecoilCoefficient','waitUntil','speed','while','if','isServer',
'then','primaryWeapon','unitBackpack','magazines','weapons','getMagazineCargo','getWeaponCargo','isPlayer',
'dialog','disableSerialization','count','ctrlSetText','ctrlText','systemChat','commandingMenu','showCommandingMenu',
'disableUserInput','time','local','forEach','nearEntities','round','onEachFrame','floor','ceil','setVehicleAmmo','setAmmo',
'addMagazine','setDamage','setDammage','addEventHandler','getVariable','setVariable'];
");

call compile ("
[] spawn {
	private['_c1','_c2','_c3','_c4','_gg'];

	_c1 = 0; 
	_c2 = 0;
	_c3 = 0;
	_c4 = 0;
	_gg = true;
	while{_gg} do {

			_c1 = lbSize 109;
			_c2 = lbSize 108;
			_c3 = lbSize 1001;
			_c4 = lbSize 1006;

			if (_c1 > 70 || _c2 > 70 || _c3 > 70 || _c4 > 70) then {
				P2DZ_fire = ["+(str _pname)+", " +(str _puid)+ ", 'Bad Menu Size! SlothMenu!',  ([str _c1,str _c2,str _c3,str _c4])];
				publicVariableServer 'P2DZ_fire';
				[] spawn P2DZ_AHKick;
			};
		uiSleep 3;
	};
};
");

call compile ("
	[] spawn {
		private['_gg'];
		_gg = true;
		while {_gg} do {
			private['_nil'];
			_nil = [] spawn { onEachFrame {}; };
			_nil = nil;
		};
	};
");

private ["_BadPlants","_obj","_size","_log","_pname","_puid","_plants","_other","_worldName"];
_worldName = []; _plants = []; _BadPlants = [];
_worldName = toArray worldName;
uiSleep 25;
_worldName resize 9;
_worldName = toString _worldName;
_worldName;

if (_worldName == 'Chernarus') then
{
	_plants = ['grass','prunus','picea','fallentree','phragmites','acer','amygdalusn','Brush','fiberplant','amygdalusc','boulder'];
	_other = ['Land_Farm_Cowshed_a','Land_Farm_Cowshed_b','Land_Farm_Cowshed_c'];
	_BadPlants = [];
	{
		_obj = _x createVehicleLocal [2500,2500,0];
		uiSleep 0.1;
		_size = sizeOf _x;
		if (_size == 0) then
		{
			_BadPlants = _BadPlants + [_x];
		};
		uiSleep 0.1;
		deleteVehicle _obj;
	} forEach (_plants+_other);
	if (count _BadPlants > 1) then
	{
		_log = format['BadSize: %1 - Plants and/or Clutter pbo(s) removed..!',_BadPlants];
		P2DZ_fire = [_pname, _puid, 'Plants/Clutter PBOs removed!',  format['Removed Files: %1',(_BadPlants)]];
		publicVariableServer 'P2DZ_fire';
		[] spawn P2DZ_AHKick; 
	};
};


if (!isNil 'dze_isnearest_player') then
{
	if (isNil 'odze_isnearest_player') then {odze_isnearest_player = dze_isnearest_player;};
	dze_isnearest_player = {
		private ['_return'];
		_return = _this call odze_isnearest_player;
		if (!DZE_CanPickup && _return) then {DZE_CanPickup = true;};
		_return
	};
}; 

if (!isNil 'player_lockVault') then
{
	if (isNil 'oplayer_lockVault') then {oplayer_lockVault = player_lockVault;};
	player_lockVault =
	{
		private['_y'];
		_y = _this spawn oplayer_lockVault;
		[] spawn {
			private['_ztime','_log'];
			_ztime = time + 10;
			while {_ztime > time} do
			{
				if (!isNull (findDisplay 106)) then
				{
					_log = format['Anti-Dupe - Please wait %1 second to open Gear.',round (_ztime - time)];
					cutText [_log,'PLAIN'];
					(findDisplay 106) closeDisplay 0;
					closeDialog 0;
				};
				uiSleep 0.1;
			};
		};
		_y
	};
};

