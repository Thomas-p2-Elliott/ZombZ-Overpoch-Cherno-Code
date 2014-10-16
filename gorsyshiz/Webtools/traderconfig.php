<?php
set_time_limit(300);
$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //DB DETAILS 	locahost is the IP and dbname is the databases name
$DB_USERNAME = "ticketuser"; //  DATABASE USERNAME 									
$DB_PASSWORD = "29control"; //DATABASE PASSWORD
$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);
$space= "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
$dir="C:\_gitHub_opoch\opoch_cherno\dayz_overpoch_1.Chernarus\CfgServerTrader\Category";
if (isset($_POST['submitForm'])){
		$category= $_GET['trader'];
		$file = $_GET['file'];
	$catagory = explode(",", $category);
	foreach ($catagory AS $cat){
		$query="UPDATE overpoch_traders SET done='done' WHERE category LIKE '%$cat%'";
		$dbdone = $dbh->prepare($query);
		$dbdone->execute();


		#set the catagory at the top of the page
		echo"<br><Br>class Category_$cat {<br>";

		foreach ($_POST AS $return_weps){
			$query = "SELECT * FROM overpoch_items WHERE type = '$return_weps';";
			foreach (($dbh->query($query)) AS $wep_result){
				if ($wep_result['class'] == "Weapon"){
					$code_type = "trade_weapons";
					$baseprice = $wep_result['price'];
					$buy = $baseprice;
					$sell = $baseprice + 10;
				}
				echo ' '.$space.' 
				class '.$wep_result['item'].' {type="'.$code_type.'";buy[]={'.$sell.'};sell[]={'.$buy.'};};';
				echo "<br>";
			}
		}


		echo"<br>};<br><br>";
	}

	

}else{
	if (isset($_GET['trader'])){
		
		$category= $_GET['trader'];
		$file = $_GET['file'];

		echo"<form method='POST' action='' onSubmit='return assignOtherValue()';><table cellpadding='8'><tr>";
		$count=0;
		$count2= 1;
		$query = "select `type` from `overpoch_items` group by `type` having count(*)>=1 ORDER BY 'type' DESC";
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
		echo "<br><br> Editing $file with categorys $category";

	}else{
		#scan directory and find the required files
		$files = scandir($dir);
		foreach ($files as $file) {


				if (strpos($file, ".hpp")){
				$query = "SELECT done FROM overpoch_traders WHERE trader = '$file';";
				foreach (($dbh->query($query)) AS $result1){
					$done = $result1['done'];
					if ($done == "done"){
						$font = "red";
					}else{
						$font = "blue";
					}
				}
					$catagory = substr($catagory, 1);
					//echo "UPDATE overpoch_traders SET category='$catagory' WHERE trader='$lastfile';<br>";
						echo "<a href='traderconfig.php?trader=$catagory&file=$lastfile'><font color='$font'> $lastfile - <font color='black'>$catagory</font></a><br>";
					$catagory = false;
					//echo "<font color='red'>$dir\\$file</font><br>";
				$openfile = "$dir\\$file";
				$openfile = file($openfile);
				foreach ($openfile AS $line){
					if (strpos($line, "Category_")){
						//echo "$line<br>";
						$stripline = substr($line, 15);
						$stripline = substr($stripline, 0,-4);
						//echo "$stripline<br>";
						$catagory = "$catagory,$stripline";
						$lastfile = $file;
					}
				}
			}
		}
	}
}
//print_r($files1);

?>