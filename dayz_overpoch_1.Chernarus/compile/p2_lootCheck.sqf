/*---------------------------------------------------------------------------
p2_lootCheck.sqf
Version 0.5
Author: Player2

Description:
	Swaps loot depending on area of the map that it is spawning
	E.g. Swap M4A1's for AK's if spawning in Berezino

Inputs:

	_this select 0: Loot Category Name (type: String)
	_this select 1: Position where loot is spawning (type: Position Array)
	
Outputs:

	Category Name (type: String)

Example Use:

	p2_lootCheck = call compile preprocessFileLineNumbers "p2_lootCheck.sqf";
	_newCategoryName = [_oldCategoryName,(position player)] call p2_lootCheck;

Configuration Instructions:

	Add and configure these variables:

	P2DZ_lootClassCheck_centerPoint - Center point for where the 'improved' loot should spawn (type: position array)
	P2DZ_lootClassCheck_radius - Radius for this dome for the size of the imrpoved loot zone (type: number, meters)
	P2DZ_lootClassCheck_debug - Toggles debugging logs (type: boolean)

	Configure the weapons to swap from this file at marked points!

www.ZombZ.net
---------------------------------------------------------------------------*/
private ["_lootClass","_position","_out","_p2d","_centerPoint","_radius","_dist","_inZone","_timeStart","_timeEnd","_timeBetween"];

/* For Testing */
P2DZ_lootClassCheck_centerPoint = [2677,11891,0];
P2DZ_lootClassCheck_radius = 6100;
P2DZ_lootClassCheck_enabled = true;
P2DZ_lootClassCheck_debug = true;

if(P2DZ_lootClassCheck_enabled) then {

_timeStart = diag_tickTime;
//load info parsed in from execution
_lootClass = _this select 0;
_position = _this select 1;

if (isNil '_lootClass' || isNil '_position') exitWith {
	nil
};

_out = _lootClass;

//load info from global vars
_p2d = P2DZ_lootClassCheck_debug;
_centerPoint = P2DZ_lootClassCheck_centerPoint;
_radius = P2DZ_lootClassCheck_radius;

_dist = _position distance _centerPoint;
_inZone = _dist < _radius;

//If player is in the zone
if (_inZone) then {
	/*---------------------------------------------------------------------------
	Configuration Start: Inside of Zone (NATO Weapons)
	---------------------------------------------------------------------------*/

	switch (_lootClass) do {
		case "AKLowWeaps": { 		_out = "AKHighWeaps"};
		case "RiflesMedWeaps": { 	_out = "RiflesLowWeaps"};

		default {};
	};

//Player is outside of the zone
} else {

	/*---------------------------------------------------------------------------
	Configuration Start: Out of Zone (Russian Weapons)
	---------------------------------------------------------------------------*/
	switch (_lootClass) do {
		case "ACRLowWeaps": { 		_out = "AKLowWeaps"};
		case "ACRHighWeaps": { 		_out = "AKHighWeaps"};
		case "ScarLowWeaps": { 		_out = "SubWeaps"};
		case "ScarHighWeaps": { 	_out = "AKHighWeaps"};
		case "HK416Weaps": { 		_out = "AKLowWeaps"};
		case "HK417Weaps": { 		_out = "AKHighWeaps"};
		case "MasWeaps": { 			_out = "SubWeaps"};
		case "G36Weaps": { 			_out = "AKLowWeaps"};
		case "M4Weaps": { 			_out = "AKLowWeaps"};
		case "L85Weaps": { 			_out = "AKHighWeaps"};
		case "M8Weaps": { 			_out = "AKLowWeaps"};
		case "LMGWeaps": { 			_out = "RiflesLowWeaps"};
		case "HMGWeaps": { 			_out = "RiflesLowWeaps"};
		case "SniperMedWeaps": { 	_out = "SVDWeaps"};
		case "SniperTopWeaps": { 	_out = "SVDWeaps"};
		case "PistolTopWeaps": { 	_out = "PistolMilWeaps"};
		case "UltraWeaps": { 		_out = "LauncherWeaps"};
		case "RocketWeaps": { 		_out = "LauncherWeaps"};
		case "TWSWeaps": { 			_out = "LauncherWeaps"};

		default {};
	};

};
_timeEnd = diag_tickTime;
_timeBetween = _timeEnd - _timeStart;
if (_p2d) then { diag_log("fn_lootClassCheck:	_lootClass:	" + str _lootClass + "	_inZone:	" + str _inZone + "	_out:	" + str _out + "	Ticks Taken: " + str _timeBetween); };
_out

} else {
	_this select 0
};