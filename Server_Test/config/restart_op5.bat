::   __   __        ___    __  
::  /  ` /  \ |\ | |__  | / _` 
::  \__, \__/ | \| |    | \__> 
::                             
::by Player2 cuz he is tired of editing these things
::Notes:
::	>>anything<< after the =  in this file is included in the variable, even quotes and spaces, it finishes on newline
:: When setting up a new server be sure to check these files:
:: cleanup.pl & hiveExt.ini file for database settings and the server config file for other settings

::Set this to the drive the server is on:
D:

::Set the server exe folder
set ServerFolder=D:\SteamLibrary\steamapps\common\Arma 2 Operation Arrowhead
::Set the server exe file name
set ExeFile=overpoch_s5
::	Set the server pbo folder name
set ServerPbo=@OverpochServer_5
::	Set the mission file folder name
set MissionPbo=dayz_overpoch_zombz_5.Chernarus
::	Set the server config folder name
set ConfigFolder=config_overpoch_1
::	Set the server config file name (include file extension)
set ConfigFile=config_zombz_5.cfg
:: 	Set the network config file name (include file extension)
set netConfigFile=network.cfg
::	Set the server game port (steamport and steamquery port set through ConfigFile)
set Port=6666
::	Set the servers mods (-mod param)
set ServerMods=@DayzOverwatch;@DayZ_Epoch;%ServerPbo%;@Arma2NET;
::	Set the server max cpu core usage (must be used in conjunction with a proper affinity, for more than 2 cores nocb cannot be used in launch opts)
set CPUCount=1
::	Set the cpu core(s) affinity (see chart at bottom for help)
set CPUAffinity=9
::  Set the server max RAM (-maxMem param, 2047 is max)
set MaxRAM=2047

::	Set any additional launch options (noCB disables multi-core, noLogs disables script error log) 
::	Test Server Version
set LaunchOpts=-bandwidthAlg=2 -noCB -noLogs
::	Live Server Version:
::set LaunchOpts=-bandwidthAlg=2 -noLogs

::CPU Core Affinity Binary/Decimal -> Hex Helper by Player2
::DECIMAL			1		2		3		4		5		6		7		8		9		10		11		12		13		14		15
::HEX				1		2		3		4		5		6		7		8		9		A		B		C		D		E		F
::BINARY			0001	0010	0011	0100	0101	0110	0111	1000	1001	1010	1011	1100	1101	1110	1111

:: Examples:
::
:: Note: Hex/Dec/Binary 1 == Core 0. So Core 7 = 8, core 0 = 1, core 1 = 2, etc.
::
:: 00000001 = 1 = 	Core(s): 1
:: 10000000 = 8 = 	Core(s): 7
:: 10101010 = AA = 	Core(s): 7, 5, 3, 1

@echo off
echo Killing current server process...
taskkill /IM %ExeFile%.exe /F
echo.
echo Server Process Killed.
timeout 1

CD "%ServerFolder%\%ConfigFolder%"
DEL "%ExeFile%.RPT" /f
DEL "%ExeFile%.txt" /f
DEL "HiveExt.log" /f

perl cleanup.pl
timeout 4
echo Recompiling PBO Files...
cd "%ServerFolder%\tools"
echo Compiling Server PBO...
cpbo -y -p "%ServerFolder%\%ServerPbo%\addons\dayz_server"
echo Server PBO Compiled.
timeout 2
echo Compiling Mission PBO...
cpbo -y -p "%ServerFolder%\MPMissions\%MissionPbo%"
echo Mission PBO Compiled.
timeout 2

echo Starting Server...
cd "%ServerFolder%"

start /min /affinity %CPUAffinity% %ExeFile%.exe "-mod=%ServerMods%" "-profiles=%ConfigFolder%" "-name=%ConfigFolder%" "-config=%ConfigFolder%\%ConfigFile%" "-cfg=%ConfigFolder%\%netConfigFile%" "-port=%Port%" "-cpuCount=%CPUCount%" "-maxMem=%MaxRAM%" "%LaunchOpts%" 
echo.
echo Server Started.
timeout 5

exit