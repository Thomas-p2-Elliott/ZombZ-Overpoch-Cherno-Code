<?php
set_time_limit(300);
$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //edit ip and dbname
$DB_USERNAME = "ticketuser"; // EDIT THIS LINE, THIS SHOULD BE THE DATABASE USERNAME
$DB_PASSWORD = "29control"; // EDIT THIS LINE, THIS SHOULD BE THE DATABASE PASSWORD

$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);
#gorsy put vehicles into database
$url="Vehicles.txt";
$file = file($url);

foreach ($file AS $line){
	$query= "INSERT INTO overpoch_vehicles (item,price,type,compatibility,comment,class,subtype) VALUES ('$line','0','none','Overpoch','','vehicle','boat');";
	$sth = $dbh->prepare($query);
	$sth->execute();
}

echo "finished";