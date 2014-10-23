<?php
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
			//$strlen = strlen($weapon);
			$count = 0;
			$wordarray = array();
			
			$array = explode("c", $weapon);
			$arraycount = count($array);
			$wordbuilder = "";
			foreach ($array AS $each){
				$each = ($each -10) - $arraycount;
				$letter = chr($each);
				$wordbuilder = "$wordbuilder$letter";
			}
			
			//$weapon = implode(",", $wordarray);
			//$weapon = str_replace(",", "c", $weapon);
			$replaceweapon = $wordbuilder;			

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