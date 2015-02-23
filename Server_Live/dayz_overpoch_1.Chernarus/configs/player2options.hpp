/*
7601 = Name Tags
7602 = View Dist
7603 = Event Notifs
7604 = Kill Notifs
7605 = Server Notifs
7606 = Debug Mon. Mode
7700 = Cancel
7701 = OK
7702 = Debug Mon. Colour Menu
*/

class p2_options
{
	idd = 8849;
	movingenable = 1;
	name = "p2_options";
	onLoad = "uiNamespace setVariable ['p2_options', _this select 0]; _nil = [] spawn { uiSleep 0.1; call compile preprocessFileLineNumbers 'actions\player2_openMenu.sqf'; };";
	class Controls
	{
		/* Frames */
		class p2_bgFrame: p2OptionsFrame
		{
			idc = 8850;
			x = 0.385417 * safezoneW + safezoneX;
			y = 0.238852 * safezoneH + safezoneY;
			w = 0.2363 * safezoneW;
			h = 0.494806 * safezoneH;
			colorBackground[] = {0.3,0.3,0.3,0.4};
		};
		class p2_bgTopFrame: p2OptionsFrame
		{
			idc = 8851;
			x = 0.385417 * safezoneW + safezoneX;
			y = 0.238852 * safezoneH + safezoneY;
			w = 0.236328 * safezoneW;
			h = 0.0412339 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.6};
		};
		class p2_bgLowFrame: p2OptionsFrame
		{
			idc = 8852;
			x = 0.385431 * safezoneW + safezoneX;
			y = 0.67868 * safezoneH + safezoneY;
			w = 0.2363 * safezoneW;
			h = 0.0549784 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.6};
		};
		/* Buttons */
		class p2_btnCancel: p2shortcutButton
		{
			idc = 7700;
			text = "Cancel";
			x = 0.392591 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.079 * safezoneW;
			h = 0.11;
			action = "closeDialog 0";
		};
		class p2_btnOk: p2shortcutButton
		{
			idc = 7701;
			text = "Save";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.11;
			action = "closeDialog 0";
		};
		class p2_cfgDebugMonColour: p2shortcutButton
		{
			idc = 7702;
			text = "Edit";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.610 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.11;
			action = "closeDialog 0; [] call fnc_p2debugMonColorGUI;";
		};
		/* Combo Boxes */
		class p2_cfgNameTags: p2Combo
		{
			idc = 7601;
			text = "Enabled";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.307575 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
			onLBSelChanged = "switch (_this select 1) do {	default { };	case 0:	{ _p setVariable ['DZE_display_name', true]; };		case 1:	{ _p setVariable ['DZE_display_name', false]; };		};";

		};
		class p2_cfgViewDistance: p2Combo
		{
			idc = 7602;
			text = "1000";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.362554 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
			onLBSelChanged = "switch (_this select 1) do {			default { setViewDistance 1000; };			case 0: { setViewDistance 500;	};			case 1: { setViewDistance 750;	};			case 2: { setViewDistance 1000;	};			case 3: { setViewDistance 1250;	};			case 4: { setViewDistance 1500;	};			case 5: { setViewDistance 1750;	};			case 6: { setViewDistance 2000;	};			case 7: { setViewDistance 2500;	};			case 8: { setViewDistance 3000;	};		}; player setVariable ['P2_viewDist', viewDistance, true]; ";
		};
		class p2_cfgEventNotifications: p2Combo
		{
			idc = 7603;
			text = "3 Sec.";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.417532 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
			onLBSelChanged = "switch (_this select 1) do {	default {};	case 0: { P2DZ_notifsEvents = 2 };	case 1: { P2DZ_notifsEvents = 1; };	case 2: { P2DZ_notifsEvents = 0; };};";
		};
		class p2_cfgKillNotifications: p2Combo
		{
			idc = 7604;
			text = "Full";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.472511 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
			onLBSelChanged = "switch (_this select 1) do {	default {};	case 0: { P2DZ_notifsKills = 2 };	case 1: { P2DZ_notifsKills = 1; };	case 2: { P2DZ_notifsKills = 0; };};";
		};
		class p2_cfgServerNotifications: p2Combo
		{
			idc = 7605;
			text = "Full";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.527489 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
			onLBSelChanged = "switch (_this select 1) do {	default {};	case 0: { P2DZ_notifsKills = 2 };	case 1: { P2DZ_notifsKills = 1; };	case 2: { P2DZ_notifsKills = 0; };};";
		};
		class p2_cfgDebugMonMode: p2Combo
		{
			idc = 7606;
			text = "Full";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.582468 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
			onLBSelChanged = "switch (_this select 1) do {	default {};	case 0: { P2DZ_dbCurMode = 2; P2DZ_debugMonitor = true; player setVariable ['P2_DebugMonMode', P2DZ_dbCurMode, true]; };	case 1: { P2DZ_dbCurMode = 3; P2DZ_debugMonitor = true; player setVariable ['P2_DebugMonMode', P2DZ_dbCurMode, true]; };	case 2: { P2DZ_dbCurMode = 1; P2DZ_debugMonitor = false;  667 cutText ['', 'PLAIN']; player setVariable ['P2_DebugMonMode', P2DZ_dbCurMode, true]; };};";
		};
		/* Text */
		class p2_txtTop: RscStructuredText
		{
			idc = 8853;
			text = "<t align='left' size='1.5'>Player Options</t>";
			x = 0.385417 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.236328 * safezoneW;
			h = 0.0412339 * safezoneH;
		};
		class p2_txtNameTags: RscStructuredText
		{
			idc = 8854;
			text = "<t align='left' size='1.0'>Name Tags:</t>";
			x = 0.392578 * safezoneW + safezoneX;
			y = 0.307575 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_txtViewDistance: RscStructuredText
		{
			idc = 8855;
			text = "<t align='left' size='1.0'>View Dist:</t>";
			x = 0.392578 * safezoneW + safezoneX;
			y = 0.362554 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_txtEventNotifications: RscStructuredText
		{
			idc = 8856;
			text = "<t align='left' size='1.0'>Event Notifs:</t>";
			x = 0.392578 * safezoneW + safezoneX;
			y = 0.417532 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_txtKillNotifications: RscStructuredText
		{
			idc = 8857;
			text = "<t align='left' size='1.0'>Kill Notifs:</t>";
			x = 0.392578 * safezoneW + safezoneX;
			y = 0.472511 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_txtServerNotifications: RscStructuredText
		{
			idc = 8858;
			text = "<t align='left' size='1.0'>Server Notifs:</t>";
			x = 0.392591 * safezoneW + safezoneX;
			y = 0.527489 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0274893 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class p2_txtDebugMonMode: RscStructuredText
		{
			idc = 8859;
			text = "<t align='left' size='1.0'>Stats Monitor:</t>";
			x = 0.392591 * safezoneW + safezoneX;
			y = 0.582468 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_txtDebugMonColour: RscStructuredText
		{
			idc = 8860;
			text = "<t align='left' size='1.0' color='#FFFFFF'>UI Colour:</t>";
			x = 0.392591 * safezoneW + safezoneX;
			y = 0.637446 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
	};
};

