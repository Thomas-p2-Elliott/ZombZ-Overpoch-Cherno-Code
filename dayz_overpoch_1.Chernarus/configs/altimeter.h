class ATM_Altimeter
{
	idd=5099;
	name="ATM_Altimeter";
	movingEnable=0;
	fadein=0;
	fadeout=0;
	duration=999999;
	onLoad="uiNamespace setVariable ['ATM_Altimeter', _this select 0];(_this select 0) call ALTIMETER_fnc_AltimData;";
	controls[]=
	{
		"AltiShow",
		"AltiNightShow",
		"AltiAlt",
		"AltiDir",
		"AltiTime"
	};
	class AltiShow
	{
		idc=-1;
		type=0;
		style=48;
		text="img\altimetre.paa";
		colorBackground[]={0,0,0,0};
		colorText[]={1,1,1,1};
		font="Bitstream";
		sizeEx=0.050000001;
		x="safeZoneX";
		y="safeZoneY + safeZoneH - 0.9";
		h="0.4 * safezoneH";
		w="0.225 * safezoneW";
	};
	class AltiNightShow
		{
		idc=5100;
		type=0;
		style=48;
		text="img\altimetre.paa";
		colorBackground[]={0,0,0,0};
		colorText[]={1,1,1,1};
		font="Bitstream";
		sizeEx=0.050000001;
		x="safeZoneX";
		y="safeZoneY + safeZoneH - 0.9";
		h="0.4 * safezoneH";
		w="0.225 * safezoneW";
	};
	class AltiAlt
	{
		idc=5102;
		type=0;
		style=2;
		text="";
		colorBackground[]={0,0,0,0};
		colorText[]={0.2,0.77600002,0.667,1};
		font="Bitstream";
		sizeEx=0.071;
		x="safezoneX - 0.005";
		y="safeZoneY + safeZoneH - 0.89";
		h="0.4 * safezoneH";
		w="0.225 * safezoneW";
	};
	class AltiDir
	{
		idc=5105;
		type=0;
		style=2;
		text="";
		colorBackground[]={0,0,0,0};
		colorText[]={0.2,0.77600002,0.667,1};
		font="Bitstream";
		sizeEx=0.031;
		x="safezoneX - 0.005";
		y="safeZoneY + safeZoneH - 0.81"; //795
		h="0.4 * safezoneH";
		w="0.225 * safezoneW";
	};
	class AltiTime
	{
		idc=5108;
		type=0;
		style=2;
		text="";
		colorBackground[]={0,0,0,0};
		colorText[]={0.2,0.77600002,0.667,1};
		font="Bitstream";
		sizeEx=0.031;
		x="safezoneX - 0.005";
		y="safeZoneY + safeZoneH - 0.98";
		h="0.4 * safezoneH";
		w="0.225 * safezoneW";
	};
};

