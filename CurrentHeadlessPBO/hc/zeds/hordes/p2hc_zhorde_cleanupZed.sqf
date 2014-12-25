/*---------------------------------------------------------------------------
Delete any zombie passed into it
Makes sure zed isnt null & var passed in isnt nil
---------------------------------------------------------------------------*/
private["_zed"];
_zed = _this;
if (isNil '_zed') exitWith {		diag_log(format["P2DZ_HC_ZHorde_cleanupZed: ERROR: Object var (%1) passed in was nil",_zed]); };
if (!isNull _zed) then {	
	if (_zed isKindof "zZombie_Base") exitWith {
		deleteVehicle _zed;	
	};
	diag_log(format["P2DZ_HC_ZHorde_cleanupZed: ERROR: Object (%1) passed in was not a zombie!",typeOf _zed]);
};
