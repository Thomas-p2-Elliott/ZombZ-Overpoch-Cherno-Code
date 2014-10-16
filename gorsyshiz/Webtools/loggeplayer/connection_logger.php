

<!DOCTYPE html>
<html>
<body>
<?php 




////////////////////////CONFIGURABLES////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    																																									/////
    $linescan = 500; //set the amount of lines to be scanned for each run 																								/////
    $filepath = "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 OA Reality\dayz_overwatch\arma2oaserver.rpt"; // the file to be scanned 							/////
    $server=1; // server number, make sure this is set.																													/////
    $SERVERIP="208.167.247.35"; // set the servers IP for protection																												/////
    $DB_CONNSTRING ="mysql:host=localhost;dbname=players"; //DB DETAILS 																								/////
	$DB_USERNAME = "root"; //  DATABASE USERNAME 																														/////
	$DB_PASSWORD = ""; //DATABASE PASSWORD																																/////
    																																									/////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo $_SERVER['REMOTE_ADDR'];
if ($_SERVER['REMOTE_ADDR'] == $SERVERIP){
	    function gorsyandp2_readLogFile($filePath,$server,$linenumber,$linescan,$dbh) {
			//$lines = new splfileobject($filepath);
			//$lines -> seek($linenumber);
			//checks file size
			$charcount = count( file( $filePath));
			// if not near end of file do nothing. (very bottom of page, refreshes the page with the line count)
			if ($charcount  > ($linenumber +1000)){
				
			

				$refreshcount=0;
				$onlyread = $linenumber + $linescan;//sets the amount of lines it should scan (added to where it previously got)
				$lines = file($filePath);
				//$mylines =array_slice($lines, $linenumber);
				foreach($lines as $line_num => $line)
				{	
					if ($line_num > $linenumber && $line_num < $onlyread){
					    //IP address finding regex
					    $regex_ip = "/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/";

					    //Search for players by IP address first, then scan for the rest of the information
						if (preg_match($regex_ip, $line, $ipMatch)) {
							   // echo "IP Found: {$ipMatch[0]} "; 
								//20:48:14 BattlEye Server: Player #39 yexi (113.245.113.109:3335) connected

							    //found the ip address, store it...
							    $players_ip = $ipMatch[0];

							if ($players_ip == "127.0.0.1"){

							}else{
							    
				   				//	get the players name from the ip address string: 	20:48:14 BattlEye Server: Player #39 yexi (113.245.113.109:3335) connected
							   	//replace '20:48:14 BattlEye Server: Player #39 ' with nothing
							   	$line2 = preg_replace('/\d{1,2}:\d{1,2}:\d{1,2} BattlEye Server: Player #\d* /', "", $line);
							   	//replace '' (113.245.113.109:3335) connected' with nothing
							   	$line3 = preg_replace('/ \(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{1,6}\) connected/', "", $line2);
							   	//check to make sure it isn't super long and not actually a name
							   	$namelength = strlen($line3);
							   	if ($namelength > 32) {
									//echo "Long Name Found! Ignoring!: {$line3}";
				 					//echo "</br>";


							   	} else {
							   		//echo "	Name Found: {$line3}";
				 					//we now have the name!
							   		$players_name = rtrim($line3);
							   		$players_name = ltrim($players_name);

							   	}

							   	//get player name and id number together in one lil substring to use for this next part when grabbing guid
							   	//$line4 = preg_replace('/\d{1,2}:\d{1,2}:\d{1,2} BattlEye Server: Player /', "", $line);
							   	//replace '' (113.245.113.109:3335) connected' with nothing
							   //	$line5 = preg_replace('/ \(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d{1,6}\) connected/', "", $line4);
							    //line5: #39 yexi

							    //		Searching within 20 lines after the ip adress was found, starting with 1 line after (i = 1)
							   	for ($i = 1; $i <= 20; $i++) {
									$lineNumberToSearchIn = $line_num + $i;
									$currentLine = $lines[$lineNumberToSearchIn];

							   		//if line has player name in
							   		$hasPlayerName = strpos($currentLine, $players_name);
									if ($hasPlayerName !== false) {

										//if line has '(id=XXXXXXXX)'
										$hasUID = strpos($currentLine, " connected (id=");
										if ($hasUID !== false) {
											//	get the uid n store it
											//get the uid part of the string:' connected (id=3295936).'
											$regex_uidGrabber = "/ connected \(id=\d{4,64}\)./";
											if (preg_match($regex_uidGrabber, $currentLine, $uidMatch)) {
												//strip 15chars off the start: ' connected (id='
												$line6 = substr($uidMatch[0],15);
												//strip 2 chars off the end: ').'
												$line7 = substr($line6,0,-2);
												//echo "	UID Found: {$line7}";
												//echo "</br>";

												//we now have the uid!
												$players_uid = $line7;
											}
											
										}

										//if line has guid
										$regex_GUID_Grabber = "/\b[\w\d]{32}\b/";
										if (preg_match($regex_GUID_Grabber, $currentLine, $GUIDMatch)) {

											//echo "	GUID Found: {$GUIDMatch[0]}";
											//echo "</br>";

											//we now have the uid!
											$playerline = $line_num;
											$players_guid = $GUIDMatch[0];

										}
									}

								}

								if (isset($players_ip))  {
									//echo "IP Found: {$players_ip} "; 

									if (isset($players_name))  {
										//echo "	Name Found: {$players_name}";

										if (isset($players_uid))  {
											//echo "	UID Found: {$players_uid}";

											if (isset($players_guid))  {
												//echo "	GUID Found: {$players_guid}";

												//grab the connection time 
												$player_time = substr($line,0,8);
												$player_time = ltrim($player_time);
												$player_time = rtrim($player_time);

												//grab date this is run
												$currentDate = date('d:m:Y');

												//remove bad characters from players name
												$players_name = addslashes($players_name);

												$ipupdated =0;
												$guidupdated =0;
												$query = "SELECT * FROM players WHERE ip LIKE '%$players_ip%';"; //checking if ip already exists
												
												//check if ip matches
												foreach ($dbh->query($query) as $key) {
														//combining the variables if ip or guid has changed for the return send to database.
													if (isset($key['ip'])){
														$dbip = $key['ip'];
														$dbguid = $key['guid'];
														if (strpos($dbip, $players_ip)){
															//do nothing because they match
														}else{
															//add the ip to the current ip
															$newplayers_ip = "$dbip,$players_ip";

														}
														if (strpos($dbguid, $players_guid)){

														}else{
															$newplayers_guid = "$dbguid,$players_guid";
														}
														//write new shiz to the database
														
														$query = "UPDATE players SET ip = ip = :ip guid=:guid name=:name uid=:uid lastserver=:server";
														$paycount = $dbh->prepare($query);
														//run the query and escape the strings automatically, stops sql injection and allows all characters
														$paycount->execute(array(':ip'=>$newplayers_ip,':guid'=>$newplayers_guid,':uid'=>$players_uid,':name'=>$players_name,':server'=>$server));
														echo "<font color='red'>IPF:</font>";
														$ipupdated =1;
													}
													
												}
												


												$query2 = "SELECT * FROM players WHERE guid LIKE '%$players_guid%';"; //checking if guid already exists
												foreach ($dbh->query($query2) as $key) {
													if (isset($key['guid'])){
														$dbip = $key['ip'];
														$dbguid = $key['guid'];

														if (strpos($dbip, $players_ip)){
															//do nothing because they match
														}else{
															//add the ip to the current ip
															$newplayers_ip = "$dbip,$players_ip";
														}
														if (strpos($dbguid, $players_guid)){

														}else{
															$newplayers_guid = "$dbguid,$players_guid";
														}
													//write new shit to the database
														$query = "UPDATE players SET ip = :ip guid=:guid name=:name uid=:uid lastserver=:server";
														$paycount = $dbh->prepare($query);
														//run the query and escape the strings automatically, stops sql injection and allows all characters
														$paycount->execute(array(':ip'=>$newplayers_ip,':guid'=>$newplayers_guid,':uid'=>$players_uid,':name'=>$players_name,':server'=>$server));
														echo "<font color='red'>GUIDF:</font>";
														$guidupdated =1;
														
													}
													
												}

												if ($guidupdated == 0 && $ipupdated == 0){
													$query="INSERT INTO players (ip,guid,name,uid,lastserver) VALUES (:ip,:guid,:name,:uid,:server)";
													$paycount = $dbh->prepare($query);
													//run the query and escape the strings automatically, stops sql injection and allows all characters
													$paycount->execute(array(':ip'=>$players_ip,':guid'=>$players_guid,':uid'=>$players_uid,':name'=>$players_name,':server'=>$server));
													echo "<font color='green'>INSERT NEW:</font>";
												}

												

												echo "$players_ip - $players_name - $players_guid - $players_uid - $playerline<br>
												<META http-equiv=\"refresh\" content=\"10;URL=connection_logger.php?line=$onlyread\">";



												//echo "INSERT INTO connection_log (UID,GUID,IP,NAME,SERVER,TIME,DATE) VALUES ('{$players_uid}','{$players_guid}','{$players_ip}','{$players_name}','$server','{$player_time}','{$currentDate}');";

												/*$query = "SELECT IP,NAME,SERVER from PlayerDB WHERE UID='$players_uid';";

												//rowcount  shiz retreive IP/name and store in variable

												if ($rowcount < 1){
													$query = "INSERT INTO PlayerDB (UID,GUID,IP,NAME,SERVER,TIME,DATE) VALUES ('$players_uid','$players_guid','$players_ip','$players_name','$server','$player_time','$currentDate');";
												}else{
													if ($IP == $players_ip){
														$knownIPs = "$IP,$players_ip";
														$knownnames = "$name,$players_name";
														$query= "UPDATE PlayersDB SET GUID='$playersguid', IP='$players_IP' KnownIPs='$knownIPs' Name=$players_name, KnownNames='$Knownnames',Time='$currentDate';";
													}else{
														$knownIPs = "$IP,$players_ip";
														$knownnames = "$name,$players_name";										
														
														$query= "UPDATE PlayersDB SET GUID='$playersguid', IP='$players_IP' KnownIPs='$knownIPs' Name=$players_name, KnownNames='$Knownnames',Time='$currentDate';";
														//WRITE TO SUSPECT SHEET AS THEY ARE USING A NEW IP

													}
												}*/

												
											};
										};
									};
								};

								

								//echo "</br>";
							};//end of 127 ip check
						}	
					}

					//add button to insert these into db using php mysql connection
								
				}

			}else{
				//keeps checking to see if there are new entrys if there is then it will run the code, if there isnt keep refreshing until there is.
				$refreshcount +1;
				if ($refreshcount > 20){ //method for making it start again before a restart, needs long term testing.
					$linenumber=0;
				}
				echo "<META http-equiv=\"refresh\" content=\"10;URL=connection_logger.php?line=$linenumber&refresh=$refreshcount\">";

			}
	    }
	    //end of function

	    //code for retrieving line number
	    if (isset($_GET['line'])){
	    	$line = $_GET['line'];
	    }else{
	    	$line = 0;
	    }
	    $dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);



	gorsyandp2_readLogFile($filepath,$server,$line,$linescan,$dbh);
}    
?>
</body></html>