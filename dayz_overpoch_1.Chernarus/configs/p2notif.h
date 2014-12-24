class p2_notifFrame
{
	x=0;
	y=0;
	h=0.037;
	w=0.30000001;
	shadow=2;
	font="Zeppelin32";
	SizeEx=0.039209999;
	access = 0;
	style = 160;
	type = 0;
  	colorBackground[] = {0, 0, 0, 0.2};
  	colorText[] =		{0, 0, 0, 1};
  	text = "";
};
class p2_notifFrame2
{
	x=0;
	y=0;
	h=0.037;
	w=0.30000001;
	shadow=2;
	font="Zeppelin32";
	type = 0;
	colorText[] = {0, 0, 0, 0};
	colorBackground[]={0,0,0,0.2};
	text = "";
	style = 128;
	sizeEx = 0.025;
};
class p2_notifText
{
	type = 13;
    style = 2 + 16;
    lineSpacing = 1;
	x=0;
	y=0;
	h=0.1;
	w=0.1;
	text="";
    size = 0.026;
	colorText[]={0.87840003,0.84710002,0.65100002,1};
	shadow=2;
	font = "BitStream";
	class Attributes 
	{
		font = "BitStream";
		color = "#ffffff";
		align = "left";
		shadow = true;
	};
};

class p2_pic
{
	access=0;
	type=0;
	idc=-1;
	style = 0x30 + 0x800;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,1};
	font="TahomaB";
	sizeEx=0;
	lineSpacing=0;
	text="";
};

class p2_notif
{
	idd			 = 		9501;
	movingEnable =  	1;
	duration	  =  	5;
	fadein		 =  	0.3;
	fadeout		=  		1.5;
	name = "p2_notif";

	onLoad="uiNamespace setVariable ['p2_notif', _this select 0]";
	controls[] = 
	{
	  "p2_bgMain",
	  "p2_bgPicBox",
	  "p2_bgTop",
	  "p2_txtTop",
	  "p2_txtMain",
	  "p2_bgMainCol",
	  "p2_picBox"
	};
	class p2_bgMainCol: p2_notifFrame2
	{
		idc = 700;
		x = 0.635803 * safezoneW + safezoneX;
		y = 0.838637 * safezoneH + safezoneY;
		w = 0.329387 * safezoneW;
		h = 0.137446 * safezoneH;
	};
	class p2_bgMain: p2_notifFrame
	{
		idc = 600;
		x = 0.635803 * safezoneW + safezoneX;
		y = 0.838637 * safezoneH + safezoneY;
		w = 0.329387 * safezoneW;
		h = 0.137446 * safezoneH;
	};
	class p2_bgPicBox: p2_notifFrame
	{
		idc = 601;
		x = 0.635803 * safezoneW + safezoneX;
		y = 0.879871 * safezoneH + safezoneY;
		w = 0.0716059 * safezoneW;
		h = 0.0962122 * safezoneH;
		colorBackground[] = {0, 0, 0, 0};
		colorText[] =		{0, 0, 0, 0};
	};
	class p2_bgTop: p2_notifFrame
	{
		idc = 602;
		x = 0.635803 * safezoneW + safezoneX;
		y = 0.838637 * safezoneH + safezoneY;
		w = 0.329387 * safezoneW;
		h = 0.0412338 * safezoneH;
		colorBackground[] = {0, 0, 0, 0};
	};
	class p2_picBox: p2_pic
	{
		idc = 1200;
		text = "\CA\weapons\data\equip\w_makarov_ca.paa";
		x = 0.635803 * safezoneW + safezoneX;
		y = 0.879871 * safezoneH + safezoneY;
		w = 0.0716059 * safezoneW;
		h = 0.0962122 * safezoneH;
		colorBackground[] = {0,0,0,0};
	};
	class p2_txtTop: p2_notifText
	{
		idc = 1100;
		text = "Notification Title";
		x = 0.642964 * safezoneW + safezoneX;
		y = 0.852381 * safezoneH + safezoneY;
		w = 0.315066 * safezoneW;
		h = 0.0274892 * safezoneH;
		colorBackground[] = {0,0,0,0};
	};
	class p2_txtMain: p2_notifText
	{
		idc = 1101;
		text = "Notification Text";
		x = 0.714569 * safezoneW + safezoneX;
		y = 0.893615 * safezoneH + safezoneY;
		w = 0.24346 * safezoneW;
		h = 0.0824676 * safezoneH;
		colorBackground[] = {0,0,0,0};
	};
};

class p2_notif5: p2_notif
{
	idd			 = 		9502;
	name = "p2_notif5";
	onLoad="uiNamespace setVariable ['p2_notif5', _this select 0]";
	duration	  =  	5;
};

class p2_notif10: p2_notif
{
	idd			 = 		9503;
	name = "p2_notif10";
	onLoad="uiNamespace setVariable ['p2_notif10', _this select 0]";
	duration	  =  	10;
};

class p2_notif15: p2_notif
{
	idd			 = 		9504;
	name = "p2_notif15";
	onLoad="uiNamespace setVariable ['p2_notif15', _this select 0]";
	duration	  =  	15;
};

class p2_notif20: p2_notif
{
	idd			 = 		9505;
	name = "p2_notif20";
	onLoad="uiNamespace setVariable ['p2_notif20', _this select 0]";
	duration	  =  	20;
};

class p2_notif25: p2_notif
{
	idd			 = 		9506;
	name = "p2_notif25";
	onLoad="uiNamespace setVariable ['p2_notif25', _this select 0]";
	duration	  =  	25;
};

class p2_notif30: p2_notif
{
	idd			 = 		9507;
	name = "p2_notif30";
	onLoad="uiNamespace setVariable ['p2_notif30', _this select 0]";
	duration	  =  	30;
};
