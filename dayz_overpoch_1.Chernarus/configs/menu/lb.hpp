class RscGorsyMenuLB {
	idd=2649;
	enableDisplay=1;
	onLoad="diag_log(""GorsyDebug: RscGorsyMenuLB loaded""); uiNamespace setVariable ['ZombZ_GorsyMenuLB', _this select 0]; ((uiNamespace getVariable 'ZombZ_GorsyMenuLB') displayCtrl 1800) ctrlSetBackgroundColor P2DZE_debugCol;  ";
	name = "ZombZ_GorsyMenuLB";
	class controls
	{
		class MenuListBoxFrame: RscGorsyFrame
		{
			idc = 1800;
			style = 128;
			x = 0.258338 * safezoneW + safezoneX;
			y = 0.207 * safezoneH + safezoneY;
			w = 0.522036 * safezoneW;
			h = 0.605 * safezoneH;
			colorBackground[] = {1,1,1,0.5};
		};
		class MenuListBoxLeft: RscGorsyListbox
		{
			idc = 1500;
			x = 0.293764 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.148232 * safezoneW;
			h = 0.3575 * safezoneH;
		};
		class MenuListBoxRight: RscGorsyStructuredText
		{
			idc = 1501;
			x = 0.448441 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.29002 * safezoneW;
			h = 0.495 * safezoneH;
			color[] = {0.5,0.5,0.5,1};
			colorActive[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
	      	text = "<t size='2' font='Bitstream' align='left' color='#FFBF00'>Select an option from the left.</t>";
	      	colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0.0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};

		};

		class MenuCloseButton: RscGorsyButton
		{
			idc = 1600;
			text = "Close";
			x = 0.622453 * safezoneW + safezoneX;
			y = 0.7475 * safezoneH + safezoneY;
			w = 0.116008 * safezoneW;
			h = 0.0275 * safezoneH;
			action = "closeDialog 0; MenuActive= false;";
		};
		class MenuActivePic: RscGorsyPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.293764 * safezoneW + safezoneX;
			y = 0.65125 * safezoneH + safezoneY;
			w = 0.130971 * safezoneW;
			h = 0.11875 * safezoneH;
		};
		class MenuTitle: RscGorsyStructuredText
		{
			idc = 1100;
			text = "Click The Section Above";
			x = 0.293764 * safezoneW + safezoneX;
			y = 0.59625 * safezoneH + safezoneY;
			w = 0.148232 * safezoneW;
			h = 0.0275 * safezoneH;
		};
	};
};