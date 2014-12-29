<?php
set_time_limit(300);
error_reporting(0);
function get_url_contents($url) {
    $crl = curl_init();

    curl_setopt($crl, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322)');
    curl_setopt($crl, CURLOPT_URL, $url);
    curl_setopt($crl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($crl, CURLOPT_CONNECTTIMEOUT, 5);

    $ret = curl_exec($crl);
    curl_close($crl);
    return $ret;
}
function gorsy_get_images($search,$name){

    $json = get_url_contents("http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=$search");

    $data = json_decode($json);
    echo "<table>
            <tr>
                <td colspan='2'>
                    <center><h3>$name</h3></center>
                </td>
            </tr>
            <tr>";
                $count =0;
                foreach ($data->responseData->results as $result) {
                    $image = $result->url;
                    echo "<td>
                            <img src='$image' width='200' height='200'></img>
                        </td>";
                    $count = $count +1;
                    if ($count > 1){
                        echo "</tr><tr>";
                        $count=0;
                    }
                    //$results[] = array('url' => $result->url, 'alt' => $result->title);
                }
    echo "</tr><tr>
        ";
}



$DB_CONNSTRING ="mysql:host=208.167.247.35;dbname=resources"; //edit ip and dbname
$DB_USERNAME = "ticketuser"; // EDIT THIS LINE, THIS SHOULD BE THE DATABASE USERNAME
$DB_PASSWORD = "29control"; // EDIT THIS LINE, THIS SHOULD BE THE DATABASE PASSWORD

$dbh = new PDO($DB_CONNSTRING, $DB_USERNAME, $DB_PASSWORD);

//if (isset($_POST['submitForm'])){
   // $column = $_POST['column'];
  //  $colsearch = $_POST['colsearch'];

    $query = "SELECT * FROM overpoch_vehicles WHERE subtype = 'air';";
    echo "<table border='3'>
            <tr>
                <td colspan ='3'>
                    <center> SHOWING AIR VEHICLES - Images are from google so they are not accurate, Look for ones that look like arma 2 </center>
                </td>
            </tr>
            <tr>";
            $newcount = 0;
                foreach($dbh -> query($query) AS $result){
                    $newcount = $newcount +1;
                    if ($newcount > 3){
                        echo "</tr><tr>";
                        $newcount = 1;
                    }
                    echo "<td>";
                    $item = $result['item'];
                   $newitem = str_replace("_", "+", $item);
                    
                    echo "
                            <td colspan='2'>".gorsy_get_images($newitem,$item)."<br>
                            <b>Type =</b> ".$result['type']." <b>Subtype =</b> ".$result['subtype']."<br>
                            <b>Price =</b> ".$result['price']." <b>Compatibility =</b> ".$result['compatibility']."<br>
                            <b>Description</b><br>
                            ".$result['comment']."<br><br></td></tr></table>
                        </td>";

                }
echo "</tr>
    </table>";

//}else{
    #show the form


//}
//gorsy_get_images("Blackhawk");
?>