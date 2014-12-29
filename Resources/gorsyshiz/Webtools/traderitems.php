<?php

#Sort items out 
/*
class Category_630 {
	class FoodbaconCooked {
		type = "trade_items";
		buy[] = {4,"ItemSilverBar"};
		sell[] = {2,"ItemSilverBar"};
	};
};
*/
$sell = 80;
$buy = 120;

$dir="C:\_gitHub_opoch\opoch_cherno\dayz_overpoch_1.Chernarus\CfgServerTrader\Category";

if (isset($_GET['DoPrices'])){
	$filebuild = $_GET['DoPrices'];
	$url= "$dir\\".$_GET['DoPrices']."";
	$lines = file($url);
	$buildfile ="";
	foreach ($lines AS $line){
		if (strpos($line, "buy[]") !==false){
			$line = "           buy[] = {".$buy."};\n";
		}
		if (strpos($line, "sell[]") !==false){
			$line = "           sell[] = {".$sell."};\n";
		}
	$buildfile = "$buildfile $line";

	}
	echo nl2br($buildfile);
	file_put_contents("hpp/$filebuild", $buildfile);
}else{
	$files = scandir($dir);
	foreach ($files as $file) {
		echo "<a href='traderitems.php?DoPrices=$file'>$file</a><br>";
	}
}

