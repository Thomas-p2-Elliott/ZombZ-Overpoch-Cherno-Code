<?php
	$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //DB DETAILS 	locahost is the IP and dbname is the databases name
	$DB_USERNAME = "ticketuser"; //  DATABASE USERNAME 									
	$DB_PASSWORD = "29control"; //DATABASE PASSWORD
	$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);

if (!isset($_POST['submitForm'])){
	$query = "SELECT * FROM overpoch_traders WHERE (type='Weapons' OR type='Vehicle' OR type='Ammo') AND classes IS NULL LIMIT 1";

	foreach ($dbh->query($query) AS $result){
		$type = $result['type'];
		$trader = $result['trader'];
		echo "<br> ".$result['trader']." <br>  ";
		//echo $type;

		//if ($type == "Weapons"){
				echo"<form method='POST' action='' onSubmit='return assignOtherValue()';><table cellpadding='8'><tr>";
			$count=0;
			$count2= 1;
		//switch to set what query to use.
			switch ($type) {
				case 'Weapons':
					$query = "select `type` from `overpoch_items` group by `type` having count(*)>=1 ORDER BY 'type' DESC";
					break;
				case 'Vehicle':
					$query = "select `type` from `overpoch_vehicles` group by `type` having count(*)>=1 ORDER BY 'type' DESC";
					break;
				case 'Ammo':
					$query = "select `type` from `overpoch_ammo` group by `type` having count(*)>=1 ORDER BY 'type' DESC";
					break;	
				default:
					# code...
					break;
			}
			
			foreach (($dbh->query($query)) AS $result){

				$item_type = "" .$result['type'] ."";
				$count = $count +1;
				echo "<input type='hidden' name='trader' value='$trader'>";
				echo "<td><input type='checkbox' id ='POST' name='op$count' value='$item_type' ><b> $item_type </b></td> ";


				if (($count / 7) == $count2){
					echo "</tr><tr>";
					$count2=$count2+1;
				}
			}
				echo "</tr></table><br>
					<input type='submit' name='submitForm' value='Submit' /><hr>";
		//}	
	}
}else{
	$trader = $_POST['trader'];
	unset($_POST['trader']);
	unset($_POST['submitForm']);
	$classes = implode(",", $_POST);
	echo "<br> $classes";

	$query = "UPDATE overpoch_traders SET classes = '$classes' WHERE trader ='$trader';";
	$dbdone = $dbh->prepare($query);
	$dbdone->execute();

	echo"<a href='http://localhost/1/Buildtrader.php'>Next</a>";
}