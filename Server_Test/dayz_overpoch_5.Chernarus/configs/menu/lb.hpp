class RscGorsyMenuLB {
	idd=2649;
	enableDisplay=1;
	onLoad = "uiNamespace setVariable ['ZombZ_GorsyMenuLB', _this select 0]; if ((P2DZE_debugCol select 3) < 0.85) then {	((uiNamespace getVariable 'ZombZ_GorsyMenuLB') displayCtrl 1800) ctrlSetBackgroundColor [(P2DZE_debugCol select 0),(P2DZE_debugCol select 1),(P2DZE_debugCol select 2),(P2DZE_debugCol select 3) + 0.149]; } else {	((uiNamespace getVariable 'ZombZ_GorsyMenuLB') displayCtrl 1800) ctrlSetBackgroundColor P2DZE_debugCol; };";
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

		//New: Scrollbar added by Player2
		// MenuListBoxRight block moved inside of Player2RscControlsgroup block
		// MenuListBoxRight positions(x,y) set to 0,0 as they are now relative to the Player2RscControlsgroup pos not the screen
		// Player2RscControlsgroup has original MenuListBoxRight position set as its own position
		// Any controls inside it inherit that position
		class Player2RscControlsgroup 
		{
			type = 15;
			idc = -1;
			style = 0;
			x = 0.448441 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.29002 * safezoneW;
			h = 0.495 * safezoneH;

			class VScrollbar 
			{
				color[] = {1, 1, 1, 1};
				width = 0.021;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
			};

			class HScrollbar 
			{
				color[] = {1, 1, 1, 1};
				height = 0.028;
			};

			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "#(argb,8,8,3)color(1,1,1,1)";
				arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
				arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
				border = "#(argb,8,8,3)color(1,1,1,1)";
			};

			class Controls 
			{
				class MenuListBoxRight: RscGorsyStructuredText
				{
					idc = 1501;
					x = 0;	//Pre-p2-ScrollBar:  0.448441 * safezoneW + safezoneX;
					y = 0;  //Pre-p2-ScrollBar:  0.225 * safezoneH + safezoneY;
					w = 0.289 * safezoneW;
					h = 1.5 * safezoneH;
					color[] = {0.5,0.5,0.5,1};
					colorActive[] = {1,1,1,1};
					colorText[] = {1,1,1,1};
			      	text = "<t size='1' font='Bitstream' align='left' color='#FFBF00'><br/><br/>Select an option from the left.</t>";
			      	colorDisabled[] = {0,0,0,0};
					colorBackground[] = {0,0,0,0.0};
					colorBackgroundDisabled[] = {0,0,0,0};
					colorBackgroundActive[] = {0,0,0,0};

				};
			};
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
			text = "";
			x = 0.293764 * safezoneW + safezoneX;
			y = 0.59625 * safezoneH + safezoneY;
			w = 0.148232 * safezoneW;
			h = 0.0275 * safezoneH;
		};
	};
};