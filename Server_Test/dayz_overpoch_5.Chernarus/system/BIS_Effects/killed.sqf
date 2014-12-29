private ["_v","_int","_t"];
_v=_this select 0;
if (_v iskindof "helicopter" || _v iskindof "plane")
	then
	{
		_v setVehicleInit "[this] spawn BIS_Effects_AirDestruction";
		processInitCommands; //ClearvehicleInit done at end of burn script
	};
if (_v iskindof "tank")
	then
	{
	    _int = (fuel _v)*(2+random 2);
		
		[_v,_int] spawn BIS_Effects_Secondaries;
	};
if (_v iskindof "car" || _v iskindof "ship")
	then
	{
		_int = (fuel _v)*(2 + random 1);

		[_v,_int] spawn BIS_Effects_Secondaries;
		_b="SmallSecondary" createvehicle (getpos _v);
		
	};