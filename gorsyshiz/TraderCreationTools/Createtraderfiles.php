<?php
set_time_limit(300);

	$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //DB DETAILS 	locahost is the IP and dbname is the databases name
	$DB_USERNAME = "ticketuser"; //  DATABASE USERNAME 									
	$DB_PASSWORD = "29control"; //DATABASE PASSWORD
	$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);
	//selects the ones in the where (type='???'')
	$query = "SELECT * FROM overpoch_traders WHERE (type='Weapons' OR type='Vehicle' OR type='Ammo' OR type='Backpacks') AND classes IS NOT NULL;";
	Echo "<a href='encrypttraders.php'>Now Encrypt that shiz</a><br><br><b>Recreated the following files:</b><Br>";
	foreach ($dbh->query($query) AS $result){
		$buildfile = "";
		$trader = $result['trader'];
		$type = $result['type'];
		$classes = $result['classes'];
		$category = $result['category'];
		echo "$trader<br>";
		//$buildfile = "$buildfile $trader - $type - $classes<Br>";
		//change into arrays for the foreach
		$category = explode(",",$category);
		$classes = explode(",",$classes);
		//set the database to use depending on the type
		switch ($type) {
			case 'Weapons':
				$db = "overpoch_items";
			
				break;
			case 'Ammo':
				$db = "overpoch_ammo";
			
				break;
			case 'Vehicle':
				$db = "overpoch_vehicles";
				
				break;
			case 'Backpacks':
				$db = "overpoch_backpack";
				
				break;
			
			default:
				$db = "overpoch_items";
				break;
		}

		echo "<hr><br><br>$trader<br>";
		//print_r($category);
		echo "<br>";
		//$buildfile ="<br><br>";
		//for each category we set the category and then add all the stuff
		foreach ($category AS $cat){
			$buildfile = "$buildfile class Category_$cat {\n";
			echo "$cat<br><BR>";
			//foreach class we have return them and fill in the file
			foreach ($classes AS $class){
				$query = "SELECT price, item, subtype FROM $db WHERE type='$class' AND enable ='Yes';";
				echo "db= $db class=$class<br>";
				//$buildfile = $query;
				foreach ($dbh->query($query) AS $result){
					$subtype = $result['subtype'];
					$item = $result['item'];
					$buy = $result['price'];

					//set the right thing for the file

					switch ($subtype) {
						case 'item':
							$subtype1 = "trade_items";
							break;
						case 'Weapon':
							$subtype1 = "trade_weapons";
							break;
						case 'car':
							$subtype1= "trade_any_vehicle";
							break;
						case 'air':
							$subtype1= "trade_any_vehicle";
							break;
						case 'boat':
							$subtype1= "trade_any_boat";
							break;	
						case 'backpack':
							$subtype1= "trade_backpacks";
							break;	
						default:
							# code...
							break;
					}

					$sell = round(($buy/100) *50);
					$buy = '{'.$buy.'}';
					$sell = '{'.$sell.'}';
					$buildfile = "$buildfile \tclass $item {\n";
					$buildfile = "$buildfile \t\ttype = \"$subtype1\";\n";
					$buildfile = "$buildfile \t\tbuy[]=$buy;\n";
					$buildfile = "$buildfile \t\tsell[]=$sell;\n";
					$buildfile = "$buildfile \t};\n";




				}
			}
			$buildfile = "$buildfile };\n";
			//echo nl2br($buildfile);
			//echo "<br>";
		}
		$url = "hpp/$trader";

		$myfile = fopen($url, "w") or die("Unable to open file!");
		
		fwrite($myfile, $buildfile);
		
		
		fclose($myfile);
		//echo "<hr>$trader<br><br>$buildfile";
		//file_put_contents($url, $buildfile);


	}
