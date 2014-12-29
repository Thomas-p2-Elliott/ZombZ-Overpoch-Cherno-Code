<?php

$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //DB DETAILS 	locahost is the IP and dbname is the databases name
$DB_USERNAME = "ticketuser"; //  DATABASE USERNAME 									
$DB_PASSWORD = "29control"; //DATABASE PASSWORD
$wepchances = array('1' => 1);


$weaponarray = array('1' => 1);
$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);
//COPT FROM HERE AND REPLACE THE TYPE UNTIL YOU HAVE ALL TYPES---------------------------------------------
$query = "SELECT item FROM overpoch_items WHERE type = 'SniperMedWeaps';";
//echo "$query";
$chance = 0.01; //edit this chance for each section
foreach (($dbh->query($query)) AS $wep){
  $wep = $wep['item'];
  array_push($weaponarray, $wep);
//  echo "added<br>";
}


$countingweps = count($weaponarray);
$count = 1;

while ($count < $countingweps){
	array_push($wepchances,$chance);
	$count = $count +1;
}
//END OF COPY SECTION


echo "<Br><Br><Br>";
//print_r($weaponarray);
//print_r($wepchances);
echo "Remember to remove 1,weapon and the first 1 in chances<Br><Br><br>";

echo "<br><br>[<br><br>";

foreach ($weaponarray AS $yes){
$count = $count +1;
	echo "[\"$yes\",weapon],<br>";;
}
echo "<br><br>];<br><br>";
echo "<br><br>";
foreach ($wepchances AS $no){
	echo "$no,";
}