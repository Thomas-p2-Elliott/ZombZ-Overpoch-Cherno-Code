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
	idd = 8732;
	movingenable = 1;
	name = "p2_options";
	onLoad = "uiNamespace setVariable ['p2_options', _this select 0]; comment 'Name Tags: '; ((_this select 0) displayCtrl 7601) lbAdd 'Enabled'; ((_this select 0) displayCtrl 7601) lbAdd 'Disabled';							comment 'View Distance: '; ((_this select 0) displayCtrl 7602) lbAdd '500'; ((_this select 0) displayCtrl 7602) lbAdd '750'; ((_this select 0) displayCtrl 7602) lbAdd '1000'; ((_this select 0) displayCtrl 7602) lbAdd '1250'; ((_this select 0) displayCtrl 7602) lbAdd '1500'; ((_this select 0) displayCtrl 7602) lbAdd '1750'; ((_this select 0) displayCtrl 7602) lbAdd '2000'; ((_this select 0) displayCtrl 7602) lbAdd '2500'; ((_this select 0) displayCtrl 7602) lbAdd '3000';	comment 'Event Notifications: '; ((_this select 0) displayCtrl 7603) lbAdd 'Enabled (Full)'; ((_this select 0) displayCtrl 7603) lbAdd 'Enabled (Chat)'; ((_this select 0) displayCtrl 7603) lbAdd 'Disabled';																												comment 'Kill Notifications: '; ((_this select 0) displayCtrl 7604) lbAdd 'Enabled (Full)'; ((_this select 0) displayCtrl 7604) lbAdd 'Enabled (Chat)'; ((_this select 0) displayCtrl 7604) lbAdd 'Disabled';					 																							comment 'Server Notifications: '; ((_this select 0) displayCtrl 7605) lbAdd 'Enabled (Full)'; ((_this select 0) displayCtrl 7605) lbAdd 'Enabled (Chat)'; ((_this select 0) displayCtrl 7605) lbAdd 'Disabled';																										comment 'Debug Monitor Mode: '; ((_this select 0) displayCtrl 7606) lbAdd 'Enabled (Full)'; ((_this select 0) displayCtrl 7606) lbAdd 'Enabled (Mini)'; ((_this select 0) displayCtrl 7606) lbAdd 'Disabled';																													comment 'Setting Default values'; 	{  ((_this select 0) displayCtrl _x) lbSetCurSel 0; } count [7601,7602,7603,7604,7605,7606];";
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
			w = 0.0803571 * safezoneW;
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
		};
		class p2_cfgViewDistance: p2Combo
		{
			idc = 7602;
			text = "1000";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.362554 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
			onLoad = "diag_log(format['OnLoad: %1',_this]);";
			onLBSelChanged = "diag_log(format['onLBSelChanged: %1',_this]);";
		};
		class p2_cfgEventNotifications: p2Combo
		{
			idc = 7603;
			text = "3 Sec.";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.417532 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_cfgKillNotifications: p2Combo
		{
			idc = 7604;
			text = "Full";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.472511 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_cfgServerNotifications: p2Combo
		{
			idc = 7605;
			text = "Full";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.527489 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
		};
		class p2_cfgDebugMonMode: p2Combo
		{
			idc = 7606;
			text = "Full";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.582468 * safezoneH + safezoneY;
			w = 0.107422 * safezoneW;
			h = 0.0274893 * safezoneH;
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

