<?php

$dir="C:\_gitHub_opoch\opoch_cherno\dayz_overpoch_1.Chernarus\CfgServerTrader\Category";

//get all files from directory and display them

$directorys = scandir($dir);

foreach ($directorys AS $directory){
	echo "<A href='setvehicles.php?dir=$directory'> $directory<br>";
}
