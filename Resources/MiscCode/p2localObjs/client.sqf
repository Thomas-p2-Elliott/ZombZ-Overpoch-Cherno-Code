/*---------------------------------------------------------------------------
Local Objects (Client Side)
Author: Player2
Desc:

1 Network Message Listener - P2LOS_NetDmg
1 Function - P2LOS_C_RecDmg

---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
P2LOS_C_RecDmg - Function - Called by P2LOS_NetDmg, a publicVariableEventHandler

Description: Takes variable name and damage as input, then applies damage to object
with given variable name (if it exists & is local).

Input:
	Format (Array): [_obj,_dmg]
	_this select 0:	_obj - String - Global Variable Name of Object being Referenced - EG: ("Balota_10")
	_this select 1:	_dmg - Number - Amount of damage to apply to _obj

Processing:
	Takes _obj string, and compiles it as a variable/as code to get variable content
	If damage not found or not number, exit
	If object not found or not object or null object or not local object, exit

Output:
	Applies amount of damage given via _dmg input to the object
	If debugging enabled via P2LOS_Debug_Client_Damage it will output information about its input and its actions

---------------------------------------------------------------------------*/

P2LOS_C_RecDmg = {
	private["_obj","_dmg","_localObj","_d"];
	_d = P2LOS_Debug_Client_Damage;

	if (_d) then {	diag_log(format["P2LOS_C_RecDmg: %1",_this]); };

	_obj = (_this select 0);
	_dmg = (_this select 1);
	if (isNil '_dmg') exitWith { };
	if (typeName _dmg != "SCALAR") exitWith { };

	_localObj = call compile ("if (local " + format["%1", _obj] + ") then { "+format["%1", _obj]+" } else { nil };");

	if (!isNil '_localObj') then {
		if (typeName _localObj == "OBJECT") then {
			if (!isNull _localObj) then {
				if (local _localObj) then {
					
					if (_d) then {	diag_log(format['P2LOS_C_RecDmg: Damaged: %1 (%2) with %3 damage',_localObj,(typeOf _localObj),_dmg]);	};

					if (_dmg > 1) then {
						_localObj setDamage _dmg;
					} else {
						_localObj setDamage _dmg;
					};
				};
			};
		};
	};
};

/*---------------------------------------------------------------------------
P2LOS_NetDmg - Network Message Listener

	Listens for network messages named P2LOS_NetDmg
	Then parses given message to function P2LOS_C_RecDmg
	Outputs debugging logs if P2LOS_Debug_Client_NetMessages is enabled
---------------------------------------------------------------------------*/

"P2LOS_NetDmg" addPublicVariableEventHandler {
	(_this select 1) call P2LOS_C_RecDmg;
	if (P2LOS_Debug_Client_NetMessages) then { diag_log(format["P2LOS_NetDmg Received: %1", (_this select 1)]); };
};