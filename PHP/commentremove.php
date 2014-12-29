

<?php 

  set_time_limit(900);
//see bottom of file, Must have a xampp server on local PC.
// GORSY ZombZ.Net Comment and comment section remover Version 1.0.
//Ask For permission to use. TS3.ZombZ.Net
//G93i943t
// Will Remove all // comments and also any /* */ Segements, Not configured for #, ;, : or ' comments
  function GorsyRemoveComments($url){
  $gorsydebug = 0; //switch to 1 to output testing
  $lines = file($url);
  $file= "";
  $count = 0;
  $linecount =0;
  $commentsection = "";
  $commentendcheck = 0;
  foreach ($lines as $line){
    $ogline = $line;
    $linecount = $linecount +1;
    //count so we know what line we are on, and telling it that we need to subtract nothing from that line
    $subtract = 0;
    //getting the position of the start of the comment, and the new line
    $position = strpos($line,"//");
    $newline = strpos($line,"\n");
    //working out how many to remove from the end of the line
    if (strpos($line,"//") !== false){
      $count = $count + 1;
      $subtract = ($position - $newline) -1;
      //remove the required amount from the line
      $line = substr($line, 0, $subtract);
      $line = "$line \n";
    } 
    //builds the file.
    $file = "$file$line";
 //check for a comment segment
    if (strpos($line,"/*") !== false){
      $count = $count + 1;
      //set it to continue logging the following lines till later
      $commentendcheck = 1;
      //line starts at 0 so check where comment starts
      $commentstart = strpos($line, "/*");
                                 if ($gorsydebug > 0){echo"<br><br><br>";}    
                                 if ($gorsydebug > 0){echo"<br>Line $linecount: Found start tag at $commentstart - $line";}
      if ($commentstart > 0){
                                 if ($gorsydebug > 0){echo"<br>Line $linecount: More than one in, so moving to the start - $line ";}
        $line = substr($line,$commentstart); //works
      }
    }
    //if a comment section was started then keep adding to it
    if ($commentendcheck > 0){
      if (strpos($line, "*/") !==false){
        //find the position of the end tag.
          $commentend = strpos($line, "*/");
                                   if ($gorsydebug > 0){echo"<br>Line $linecount: Found End tag at position $commentend - $line";}      
                                   if ($gorsydebug > 0){echo"<br>Line $linecount: End of the line is at $newline - $line";}      
              $newline = strpos($line,"\n");
         #need to get the remaining amount between end of comment and end of line 
         $commentsubtract = ($commentend - $newline) +1;
                                   if ($gorsydebug > 0){echo"<br>Line $linecount: Removing $commentsubtract from line - $line";}     
         //echo $commentsubtract;
         $line = substr($ogline,0,$commentsubtract);      
      }
      //sets the section to be removed          
      #problem is when they are on the same line and it has code removed sadasd/*123*/
      $commentsection = "$commentsection$line";
      //if we find the end tag, switch it off
      if (strpos($ogline, "*/") !==false){

        $commentendcheck = 0;
                                    if ($gorsydebug > 0){echo"<br>Line $linecount: Removing $commentsection from the file - $line";}   
        $file = str_replace($commentsection, "\n", $file);
        $commentsection = "";
      }  
    }
  }
  //prints the file after doing all lines
  file_put_contents($url,$file);
  echo "File <font color='green'><b><u>$url</b></u></font> has had its $count comments removed and the file has been replaced.<br>";
}


//directory searching for files to use.

function GorsyScanDirectory($scanurl,$badfilenames){

  $files1 = scandir($scanurl);
  unset($files1[0]);
  unset($files1[1]);
  if (!isset($foundfiles)){
    $foundfiles = array('1');
  }
  $extradirectorys = array('1');
  foreach ($files1 AS $dir){
    $pushthearray = 0;
    if (strpos($dir,".") !== false){
      foreach ($badfilenames AS $badfiles){
        if (strpos($dir, $badfiles)){
          $pushthearray = 1;
        }
      }
      if ($pushthearray < 1){
        array_push($foundfiles, $dir);
      }
    }else{
      array_push($extradirectorys, $dir);
    }
  }
  unset($extradirectorys[0]);
  $extradircount = count($extradirectorys);
  if ($extradircount > 0) {
    foreach ($extradirectorys AS $newscanurl){
      $usescanurl = "$scanurl/$newscanurl";
      GorsyScanDirectory($usescanurl,$badfilenames);
    }
  }
  unset($foundfiles[0]);
  //just for the comments code, remove for file retreival
  foreach ($foundfiles AS $removecomments){
    $commenturl = "$scanurl/$removecomments";
    //echo "$commenturl<br>";
    GorsyRemoveComments($commenturl);
  }
}










//enter bad file names that it should not check here
$badfilenames = array(".paa",".ogg",".jpg",".png",".gif");
//directory mode for removing comments
$dir = "C:\Users\Jason\Desktop\opoch_cherno-master\dayz_overpoch_1.Chernarus";

GorsyScanDirectory($dir,$badfilenames);

?>
