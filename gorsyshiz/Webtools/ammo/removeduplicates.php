<?php
$url = "hpp/BanditAmmunition.hpp";
$lines = file($url);
$rowcount = 1;
$count = 0;
foreach ($lines AS $line){
	$buildfile2 = "$buildfile2 $line";
	//find the class
	if (strpos($line, "class") !== false){
		//echo"line contains Class <br>";
		//check if class already exists
		$substring = substr($line, 6);
		$substring = substr($substring,0,-1);
		if (stripos($buildfile, $substring) !== false){
		//set it to not touch following lines
		$count = 2;
		$duplicates = "$duplicates$line";
		//if line dosnt have class
		}else{
			$buildfile = "$buildfile$line";
		}
	}else{
		//echeck to see if we have been told not to touch lines
			if ($count == 2){
				//check to see if we have reached 4 extra lines
				if ($rowcount > 4){
					//stop checking
					$count =0;
				//if we havnt reached 4 extra lines then
				}else{
					//then add that line to the amount of lines
					$rowcount = $rowcount +1;
				}
			//if we have not been told to skip next lines
			}else{
				$buildfile = "$buildfile$line";
			}

	}
}

echo nl2br($buildfile);
echo "<hr>";
echo nl2br($duplicates);

/*
class 15Rnd_9x19_M9SD {
type = "trade_items";
buy[] ={5};
sell[]={3};
};
class 15Rnd_9x19_M9SD {
type = "trade_items";
buy[] ={5};
sell[]={3};
};
*/