class Rsc2Text
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.8784,0.8471,0.651,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.03921;
};
class Rsc2StructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03921;
	shadow = 2;
};
class Rsc2Picture
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};
class Rsc2ShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;
	class HitZone
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos
	{
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos
	{
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	shortcuts[] = {};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = {0.8784,0.8471,0.651,1};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {1,1,1,1};
	colorBackground2[] = {1,1,1,0.4};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
	idc = -1;
	style = 0;
	default = 0;
	shadow = 2;
	w = 0.183825;
	h = 0.104575;
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscDisplayInspectVehicle
{
	idd=9666;
	enableDisplay=1;
	onLoad="uiNamespace setVariable ['ZombZ_vehicleInspect', _this select 0]";
	name = "ZombZ_vehicleInspect";
	class controls
	{
		class RscText_6660: Rsc2Text
		{
			idc = 6660;
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.310417 * safezoneH + safezoneY;
			w = 0.343984 * safezoneW;
			h = 0.351528 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_6661: Rsc2Text
		{
			style = ST_CENTER;

			idc = 1006;
			text = "Vehicle Inspection";
			x = 0.334375 * safezoneW + safezoneX;
			y = 0.281944 * safezoneH + safezoneY;
			w = 0.343984 * safezoneW;
			h = 0.0286111 * safezoneH;
			colorBackground[] = {0,0.2,0,0.9};
		};
		class Rsc2IGUIShortcutButton_1666: Rsc2ShortcutButton
		{
			idc = 1666;
			text = "Close";
			x = 0.350 * safezoneW + safezoneX;
			y = 0.604583 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.11;
			colorBackground[] = {0,0.4,0,1};
			colorBackgroundActive[] = {0,0,0,1};
			onButtonClick = "closeDialog 0;";
		};
		class Rsc2IGUIShortcutButton_1667: Rsc2ShortcutButton
		{
			idc = 1667;
			text = "More Info";
			x = 0.540000 * safezoneW + safezoneX;
			y = 0.604583 * safezoneH + safezoneY;
			w = 0.2;
			h = 0.11;
			colorBackground[] = {0,0.4,0,1};
			colorBackgroundActive[] = {0,0,0,1};
			onButtonClick = "[] spawn { closeDialog 0; uiSleep 0.1; createDialog 'RscGorsyMenuLB'; uiSleep 0.1; ['features','img\menu\SF.paa'] execVM 'configs\menu\listbox.sqf'; _text = ['Right','Towing'] call compile preprocessFileLineNumbers ('configs\menu\features.sqf'); ((uiNamespace getVariable 'ZombZ_GorsyMenuLB') displayCtrl 1501) ctrlSetStructuredText parseText(_text); };";
		};
		class RscText_6662: Rsc2Text
		{
			style = ST_MULTI;
			lineSpacing = 1;
			idc = 6662;
			sizeEx = 0.0275;
			text = "Loading...";
			x = 0.348046 * safezoneW + safezoneX;
			y = 0.334306 * safezoneH + safezoneY;
			w = 0.317812 * safezoneW;
			h = 0.282778 * safezoneH;
		};
		class RscText_6663: Rsc2Picture
		{
			idc = 6663;
			sizeEx = 0.0275;
			text = "";
			x = 0.438046 * safezoneW + safezoneX;
			y = 0.334306 * safezoneH + safezoneY;
			w = 0.227812 * safezoneW;
			h = 0.282778 * safezoneH;
		};
		class RscText_6664: Rsc2Picture
		{
			idc = 6664;
			sizeEx = 0.0275;
			text = "";
			x = 0.438046 * safezoneW + safezoneX;
			y = 0.334306 * safezoneH + safezoneY;
			w = 0.227812 * safezoneW;
			h = 0.282778 * safezoneH;
		};
		class RscText_6665: Rsc2StructuredText
		{
			idc = 6665;
			sizeEx = 0.0275;
			text = "";
			x = 0.438046 * safezoneW + safezoneX;
			y = 0.334306 * safezoneH + safezoneY;
			w = 0.227812 * safezoneW;
			h = 0.4;
		};
	};
};