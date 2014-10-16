<?php

function GorsySQFarraybuilder($url,$arrayname){
	
	$file = file($url);
	$count = 0;
	if (strpos($file[0], "GORSYS SQF ARRAY BUILDER") !== false){
		echo "FILE HAS ALREADY BEEN MODIFIED BY THIS CODE, PLEASE USE AN UNALTERED FILE";
	}else{
		foreach ($file AS $line){

			if ($count <1){
				$buildfile = "//GORSYS SQF ARRAY BUILDER\n $arrayname = [\n";
			}
			$count = $count +1;
			if (strpos($line, "\"") !==false){
				$line="$line,";
			}else{
				$line = "\"$line\",";
			}
			$line = str_replace("\n", "", $line);
			$buildfile = "$buildfile $line\n";
		};
		$buildfile = substr($buildfile,0,-2);
		$buildfile = "$buildfile \n];";
		file_put_contents($url,$buildfile);

		echo "$count Lines Changed<br>File Compiled<br> Check $url to see changes<br>";	
	}
}

$arrayname = "_testvehicles";
$url = "spawnvehicles.txt";

GorsySQFarraybuilder($url,$arrayname);


//FILE MUST HAVE NOTHING BUT WHAT YOU WANT IN THE ARRAY AND BE SPACED ONTO SEPERATE LINES FOR EACH ITEM

/* E.G
pook_H13_amphib_PMC
pook_H13_amphib_GUE
pook_H13_amphib_CIV
pook_H13_amphib_CIV_RU
pook_H13_gunship
"pook_H13_gunship_CDF"
pook_H13_gunship_UNO
pook_H13_gunship_PMC
pook_H13_gunship_GUE
pook_H13_gunship_TAK
pook_H13_gunship_INS
*/

?>