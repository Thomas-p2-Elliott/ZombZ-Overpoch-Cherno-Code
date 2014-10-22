_vcl = _this select 0;

if (isServer) then
{
	_vcl setVariable ["NORRN_mountOn_vcl_pos0", false, true];
	_vcl setVariable ["NORRN_mountOn_vcl_pos1", false, true];
	sleep 2;
};

_nul  = [_vcl] execVM "heliDoor\mount_vcl_init.sqf";
_nul  = [_vcl] execVM "heliDoor\mount_vcl_init1.sqf";
	