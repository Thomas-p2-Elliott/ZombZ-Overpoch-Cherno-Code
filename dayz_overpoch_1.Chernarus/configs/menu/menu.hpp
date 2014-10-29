
class RscGorsyMenu
{
	idd=1986;
	enableDisplay=1;
	onLoad="uiNamespace setVariable ['ZombZ_GorsyMenu', _this select 0];    ((uiNamespace getVariable 'ZombZ_GorsyMenu') displayCtrl 1800) ctrlSetBackgroundColor P2DZE_debugCol;  ";
	name = "ZombZ_GorsyMenu";
	class controls
	{
		class MenuFrame: RscGorsyFrame
		{
			idc = 1800;
			style = 128;
			x = 0.287251 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.425499 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
		class MenuBut1: RscGorsyButton
		{
			idc = -1;
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0.0,0};
			action = "closeDialog 0; _ok = createDialog ""RscGorsyMenuLB""; [""basebuilding"",""img\menu\BB.paa""]execVM ""configs\menu\listbox.sqf""; diag_log(""GorsyDebug Menu: List box should be loaded"");";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuPic1: RscGorsyPicture
		{
			idc = -1;
			style = 48;
			text = "img\menu\BB.paa";
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "closeDialog 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuBut2: RscGorsyButton
		{
			idc = 1201;
			x = 0.43553 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0.0,0};
			action = "closeDialog 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuPic2: RscGorsyPicture
		{
			idc = 1201;
			style = 48;
			text = "img\menu\CV.paa";
			x = 0.43553 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class MenuBut3: RscGorsyButton
		{
			idc = 1202;
			x = 0.577363 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0.0,0};
			action = "closeDialog 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuPic3: RscGorsyPicture
		{
			idc = 1202;
			style = 48;
			text = "img\menu\SF.paa";
			x = 0.577363 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class MenuBut4: RscGorsyButton
		{
			idc = 1203;
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0.0,0};
			action = "closeDialog 0; [] spawn fnc_p2debugMonColorGUI;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuPic4: RscGorsyPicture
		{
			idc = 1203;
			style = 48;
			text = "img\menu\CS.paa";
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class MenuBut5: RscGorsyButton
		{
			idc = 1204;
			x = 0.43553 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0.0,0};
			action = "closeDialog 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuPic5: RscGorsyPicture
		{
			idc = 1204;
			style = 48;
			text = "img\menu\ACH.paa";
			x = 0.43553 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class MenuBut6: RscGorsyButton
		{
			idc = 1205;
			x = 0.577363 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0.0,0};
			action = "closeDialog 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuPic6: RscGorsyPicture
		{
			idc = 1205;
			style = 48;
			text = "img\menu\ABZ.paa";
			x = 0.577363 * safezoneW + safezoneX;
			y = 0.43125 * safezoneH + safezoneY;
			w = 0.128939 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class MenuButBottom: RscGorsyButton
		{
			idc = 1206;
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.412605 * safezoneW;
			h = 0.15125 * safezoneH;
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0.0,0};
			action = "closeDialog 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
		class MenuPicBottom: RscGorsyPicture
		{
			idc = 1206;
			style = 48;
			text = "img\watermark.paa";
			x = 0.293698 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.412605 * safezoneW;
			h = 0.15125 * safezoneH;
			color[] = { 0.5, 0.5, 0.5, 1 };
			colorActive[] = { 1, 1, 1, 1 };
			action = "diag_log(""hello""); closeDialog 0;";
			onMouseEnter = "ctrlSetFocus (_this select 0)";
		};
	};
};