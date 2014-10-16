<?php
#vehicle spawning code

set_time_limit(300);
$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //edit ip and dbname
$DB_USERNAME = "ticketuser"; // EDIT THIS LINE, THIS SHOULD BE THE DATABASE USERNAME
$DB_PASSWORD = "29control"; // EDIT THIS LINE, THIS SHOULD BE THE DATABASE PASSWORD

$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);

$build = "_gorsyvehicletest = [<br><br>";
$query= "SELECT item FROM overpoch_vehicles WHERE subtype ='boat' ORDER BY item ASC;";
foreach($dbh -> query($query) AS $result){
	$build = "$build \"".$result['item']."\",<br>";

}
#ohhh
$build = substr($build,0,-5);
#wtf
$build = "$build <Br><Br>];<br><br>";

echo $build;