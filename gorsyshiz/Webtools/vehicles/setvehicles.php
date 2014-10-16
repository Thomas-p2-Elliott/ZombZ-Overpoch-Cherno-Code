
<?php

set_time_limit(300);
$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //DB DETAILS 	locahost is the IP and dbname is the databases name
$DB_USERNAME = "ticketuser"; //  DATABASE USERNAME 									
$DB_PASSWORD = "29control"; //DATABASE PASSWORD
$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);
//gets the required catagorys for the traders
$file = $_GET['dir'];
$url = "C:\_gitHub_opoch\opoch_cherno\dayz_overpoch_1.Chernarus\CfgServerTrader\Category\\$file";
$lines = file($url);
$catagoryarray = array();
foreach($lines AS $line){
	//check if it has a catagory on line
	if (strpos($line,"Category")!== false){

		array_push($catagoryarray, $line);
	}else{

	}

	
}

//print_r($catagoryarray);
//if its not a postback form
if (!isset($_POST['submitForm'])){

	echo "Now Working on $file<br><Br> Choose the sections you want to contain in this file";

	//creates the form
	echo"<form method='POST' action='' onSubmit='return assignOtherValue()';><table cellpadding='8'><tr>";
	$count=0;
	$count2= 1;
	$query = "select `type` from `overpoch_vehicles` group by `type` having count(*)>=1 ORDER BY 'type' DESC";
	foreach (($dbh->query($query)) AS $result){

		$item_type = "" .$result['type'] ."";
		$count = $count +1;

		echo "<td><input type='checkbox' id ='POST' name='op$count' value='$item_type'  ><b> $item_type </b></td> ";


		if (($count / 7) == $count2){
			echo "</tr><tr>";
			$count2=$count2+1;
		}
	}
	echo "</tr></table><br>
		<input type='submit' name='submitForm' value='Submit' />";
}else{
	//if it is a postback form
	$buildfile = "";
	$catcount = 0;
	//print_r($_POST);
	//echo "<br><Br>";
	foreach ($catagoryarray AS $cat){
		$catcount = $catcount + 1;
		//add an end tag before each new catagory except for the first
		if ($catcount > 1){
			$buildfile = "$buildfile}; \n";
		}

		$buildfile = "$buildfile$cat"; //puts the catagory at the top of the file;
		//foreach postback section
		foreach ($_POST AS $type){
			//now build the catagorys to exist inside it.
			$query = "SELECT item,price,subtype FROM overpoch_vehicles WHERE type = '$type' AND enable='Yes' ORDER BY price ASC; ";
			foreach ($dbh -> query($query) AS $result){
				$filetype = $result['subtype'];
				//define what type of vehicle
				switch ($filetype) {
					case 'boat':
						$filetype = "trade_any_boat";
						break;
					
					default:
						$filetype = "trade_any_vehicle";
						break;
				}
				//set the prices
				$buy = $result['price'];
				$sell = round(($buy / 100) * 50);
				//now build the file
				$buildfile = "$buildfile        class ".$result['item']." {\n";
				$buildfile = "$buildfile              type = \"$filetype\";\n ";
				$buildfile = "$buildfile              buy[] ={".$buy."};\n";
				$buildfile = "$buildfile              sell[]={".$sell."};\n";
				$buildfile = "$buildfile        };\n";
			}
		}
	}
	$buildfile = "$buildfile};\n"; //add last end bracket
	echo nl2br($buildfile);
	$file = "hpp/$file";
	file_put_contents($file, $buildfile);
}