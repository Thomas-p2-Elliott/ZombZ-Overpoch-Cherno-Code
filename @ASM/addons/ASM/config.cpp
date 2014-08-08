class CfgPatches
{
	class ASM
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		fileName="ASM.pbo";
		author="Fred41";
	};
};
class cfgFunctions
{
	class A3
	{
		class ArmaServerMonitor
		{
			file="ASM";
			class ASM
			{
				ext=".fsm";
				preInit=1;
			};
		};
	};
};
