//## PLAYER2 - ANTI BASE KAMIKAZEE ##
/* Example Use:
server_baseDamage = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\baseDamageHandler.sqf";
_object setVariable ["selections", []]; _object setVariable ["gethit", []];
_object addEventHandler ["HandleDamage",{ _this call server_baseDamage}];
*/

private ["_ammo", "_badClassnames", "_damage", "_object", "_selections", "_gethit", "_selection", "_olddamage"];
_ammo = _this select 4;
_badClassnames = ["HelicopterExploSmall","HelicopterExploBig"];
if ((_ammo) in (_badClassnames)) exitWith {
	_damage = 0;
	_damage
};
if ((_ammo) == "") exitWith {
	_damage = 0;
	_damage
};
_object = _this select 0;
_selections = _object getVariable ["selections", []];
_gethit = _object getVariable ["gethit", []];
_selection = _this select 1;
if !(_selection in _selections) then
{
	_selections set [count _selections, _selection];
	_gethit set [count _gethit, 0];
};
_i = _selections find _selection;
_olddamage = _gethit select _i;
_damage = _olddamage + ((_this select 2) - _olddamage) * 1;
_gethit set [_i, _damage];
_damage

//## PLAYER2 - ANTI BASE KAMIKAZEE ##


