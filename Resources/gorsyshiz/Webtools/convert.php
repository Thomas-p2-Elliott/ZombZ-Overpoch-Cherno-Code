<?php
$weapons="
ACRLowWeaps,
ACRHighWeaps,
ScarLowWeaps,
ScarHighWeaps,
SniperMedWeaps,
RiflesMedWeaps,
HK416Weaps,
HK417Weaps,
MasWeaps,
G36Weaps,
PistolTopWeaps,
SVDWeaps,
PistolMilWeaps,
PistolsLow,
SubWeaps,
RiflesLowWeaps,
SniperLowWeaps,
AKLowWeaps,
AKHighWeaps,
LMGWeaps,
L85Weaps,
M4Weaps,
M8Weaps,
HMGWeaps,
NVweaps,
UltraWeaps,
ShotgunWeaps,
MeleeWeaps,
SniperTopWeaps,
RocketWeaps,
TWSWeaps,
LauncherWeaps
";
$weapons = explode(",", $weapons);
//print_r($weapons);
//$build = "$build \n\n\n";

$url="convert.txt";
$file = file($url);
foreach ($file as $line){
	$exists = 0;
	//if it contains cfgloot wep WORKS
	if (strpos($line,"cfglootweapon") !==false){
		// WORKS
		foreach ($weapons as $wep) {
			//$build = "$build CHECKING SHIZ: $wep ($line)\n\n ";
			//DOES NOT WORK
			$search = "/^$wep/";
			$check = preg_match($search, $line);
			if ($check !== false){
				$exists = 1;
				//$build = "$build <h1>GORSY THIS FUCKING DID IT $exists";
			}	
		}
		if ($exists > 0){
			//{"PistolsLow", "cfglootweapon", 0.08 },
			$newline =str_replace("{", "", $line);
			$newline =str_replace("\"","", $newline);
			$newline =str_replace("}","", $newline);
			$newnewline = explode(",", $newline);
		//	echo $newnewline[0];
			 //{"", "HK416Weaps",0.01}
			//echo $newnewline[2];
			$type = str_replace(" ", "", $newline[0]);
			$build = "$build {\"\", \"".$newnewline[0]." \", ".$newnewline[2]."},";
			$build = "$build \n";
		}else{
			$build = "$build $line";
		}
	}else{
		$build = "$build $line";
	}
}
file_put_contents($url, $build);
echo $build;