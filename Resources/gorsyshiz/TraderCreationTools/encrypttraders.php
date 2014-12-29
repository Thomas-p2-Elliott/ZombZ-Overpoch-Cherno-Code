<?php
//enter directory to change here. (route from where this script is located)
$directory = scandir("hpp");
//do not touch below.
unset($directory[0]);
unset($directory[1]);
set_time_limit(900);
foreach ($directory AS $url){
	$url = "hpp/$url";
	$lines = file($url);
	$buildfile = "";
	$foundreplace = "Not Found";
foreach ($lines AS $line){
	if (strpos($line,"Category") === false){
		$matches = false;
		//line does not contain cat
		if (strpos($line,"class") !==false){
			$weapontobereplaced = explode("{", $line);
			$weapon = str_replace("class", "", $weapontobereplaced[0]);
			$weapon = str_replace("\t", "", $weapon);
			$weapon = str_replace(" ", "", $weapon);
			$replacedweapon = $weapon;
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

			//echo "".$replacedweapon.", $replaceweapon<br>";
			$line = str_replace($replacedweapon, $replaceweapon, $line);
			$buildfile="$buildfile$line";
			//echo nl2br($line);
		}else{
		//	echo nl2br($line);
			$buildfile="$buildfile$line";
		}
	}else{
		//echo nl2br($line);
		$buildfile="$buildfile$line";
	}

	/*

	class 30Rnd_9x19_UZI {
	      type = "trade_items";
	       buy[] ={5};
	      sell[]={3};
	};

	*/
}
	//echo"<hr><br>";
	//echo nl2br($buildfile);
	//echo"<hr>$url - $weapon11 - $weaponname - $replaceweapon - $strlen - $foundreplace<br>";
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