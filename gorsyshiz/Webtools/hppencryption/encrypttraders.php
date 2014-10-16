<?php
$directory = scandir("hpp");
unset($directory[0]);
unset($directory[1]);
set_time_limit(900);
foreach ($directory AS $url){
	$url = "hpp/$url";
	$lines = file($url);
	$buildfile = "";
	$foundreplace = "Not Found";
	foreach ($lines AS $line){

		if (strpos($line,"Category") ===false){
			//echo nl2br($line);
			if(strpos($line,"class")){
				if (strpos($line,"type")){
					
					$weapon = str_replace(" ","",$line);
					$weapon = str_replace("class","",$line);
					//$weapon = substr($line,5);
				

					//get location of first { and \n
				
					$firstbrack = strpos($weapon,"{type");
					$newline = strpos($weapon,"\n");


					$length = strlen($line);
					$remove = ($firstbrack - $newline) -2;
					$weapon = substr($weapon, 0, $remove);
					$weapon = str_replace(" ","",$weapon);

					$weaponname = $weapon;


					$strlen = strlen($weapon);
					$count = 0;
					$wordarray = array();
					
					while ($count < $strlen){

						

						$pushtoarray =ord($weapon);
						$pushtoarray = ($pushtoarray +10) + $strlen;
						array_push($wordarray, $pushtoarray);
						$weapon = substr($weapon,1);
						$count = $count+1;
					}
					
					$weapon = implode(",", $wordarray);
					$weapon = str_replace(",", "c", $weapon);
					$replaceweapon = $weapon;

					if (strpos($line,$weaponname) !==false){
						$foundreplace = "Found it";
					}
					$weapon11 = str_replace($weaponname, $replaceweapon, $line);
					$buildfile = "$buildfile\n$weapon11";
					//echo "<br>";
				//if line does not contain type (so they are spread out over lines)
				}else{
					$weapon = str_replace("class","",$line);
					$weapon = substr($weapon, 0, -4);
					$weapon = str_replace(" ","",$weapon);

					$weaponname = $weapon;
					//echo "$weapon<br>";


					$strlen = strlen($weapon);
					$count = 0;
					$wordarray = array();
				
					while ($count < $strlen){

					

						$pushtoarray =ord($weapon);
						$pushtoarray = ($pushtoarray +10) + $strlen;
						array_push($wordarray, $pushtoarray);
						$weapon = substr($weapon,1);
						$count = $count+1;
					}
				
					$weapon = implode(",", $wordarray);
					$weapon = str_replace(",", "c", $weapon);
					$replaceweapon = $weapon;
					if (strpos($line,$weaponname) !==false){
						$foundreplace = "Found it";
					}
					$weapon11 = str_replace($weaponname, $replaceweapon, $line);
					$buildfile = "$buildfile     class $weapon {\n";
				
				}
				
			}else{
				$buildfile = "$buildfile$line";
			}
		}else{
			$buildfile = "$buildfile$line";
		}
	}
	//echo"<hr><br>";
	//echo nl2br($buildfile);
	echo"<hr>$url - $weapon11 - $weaponname - $replaceweapon - $strlen - $foundreplace<br>";
	file_put_contents($url, $buildfile);
}
/*
Skin_BanditW2_DZ 
Skin_BanditW2_DZ
class ItemPainkiller { - ItemPainkiller - 34c98c141c126c134c105c122c130c135c132c130c133c133c126c139


78 30 
class FHQ_ACR_TAN_IRN_F {type="trade_weapons";buy[]={40};sell[]={30};}; 

73 23 86 
73 23 86 
class FHQ_ACR_BLK_CCO_F {type="trade_weapons";buy[]={50};sell[]={40};}; 




















*/