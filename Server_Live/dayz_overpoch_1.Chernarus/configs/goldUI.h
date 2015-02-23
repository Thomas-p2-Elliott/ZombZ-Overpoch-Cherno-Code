class Rscp2GoldGuiPic
{
    access = 0;
    type = 0;
    idc = -1;
    colorBackground[] = {0,0,0,0};
    colorText[]={0.9,0.9,0.9,0.75};
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    style = "0x30 + 0x100";
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};
class Rscp2GoldGuiTxt
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {0.8784,0.8471,0.651,0.75};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
    w = 0.1;
    h = 0.2;
	text = "0";
	size = 0.04;
    sizeEx = 0.04;
	shadow = 2;
};

class Rscp2GoldGuiTxtF: Rscp2GoldGuiTxt
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {0.8784,0.8471,0.651,0.75};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
    w = 0.1;
    h = 0.2;
	text = "";
	size = 0.04;
    sizeEx = 0.04;
	shadow = 2;
};

class p2goldUI
{
	idd = 8279;
	movingEnable = 0;
	duration = 100000;
	name = "p2GoldUI";
	onLoad = "uiNamespace setVariable ['p2GoldUI', _this select 0];";
	class Controls {
		class p: Rscp2GoldGuiPic
		{
			idc = 8280;
			text = "\z\addons\dayz_epoch\pictures\equip_gold_bar_10oz_CA.paa";
			x="0.955313 * safezoneW + safezoneX";
			y="0.595 * safezoneH + safezoneY";
			w=0.059999999;
			h=0.079999998;
		};
		class t: Rscp2GoldGuiTxt
		{
			idc = 8290;
			x = 0.881984 * safezoneW + safezoneX;
			y = 0.6055 * safezoneH + safezoneY;
			w = 0.0729273 * safezoneW;
		};
		class tminus: Rscp2GoldGuiTxtF
		{
			idc = 8291;
			x = 0.881984 * safezoneW + safezoneX;
			y = 0.6260 * safezoneH + safezoneY;
			w = 0.0729273 * safezoneW;
			colorText[] = {0,0.8784,0,0.8};

		};
		class tplus: Rscp2GoldGuiTxtF
		{
			idc = 8292;
			x = 0.881984 * safezoneW + safezoneX;
			y = 0.5850 * safezoneH + safezoneY;
			w = 0.0729273 * safezoneW;
			colorText[] = {0.8784,0,0,0.8};
		};
	};
};
