<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

if($_SESSION['role'] != 'user'){
    header("location: error.php");
    exit;
}

/***************************check if the concert is already favorite and subscription***************************/
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'http://172.18.1.11:2000/data_storage.php?check_fav=1&userid='.$_POST["uid"].'&concertid='.$_POST["id"].'',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    "Content-Type: application/json",
        "X-Auth-Token: magic_key"
  ),
));

$response = curl_exec($curl);
curl_close($curl);
$result = json_decode($response, true);

$count=0;
foreach($result as $key){
    $count=$count+1;
}

if($count>=1){
    header("location: concerts.php");
    exit;
}

/***************************create subscription***************************/
$curl = curl_init();

// set the POST request body and parameters
curl_setopt_array($curl, array(
    CURLOPT_URL => 'http://172.18.1.12:1027/v2/subscriptions', // use orion-proxy (PEP Proxy for Orion CB) IP address and port instead of Orion CB's 
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'POST',
    CURLOPT_POSTFIELDS =>'{
    "description": "'.$_POST["uid"].'",
    "subject": {
        "entities": [
            {
                "id": "'.$_POST["id"].'",
                "type": "Thing"
            }
        ],
        "condition": {
            "attrs": [
                "date"
            ]
        }
     },
     "notification": {
        "http": {
            "url": "http://172.18.1.8:80/orion_selector.php"
        }, 
        "attrs": [
            "title",
            "date"
        ]
     },
    "expires": "2030-01-01T14:00:00.00Z",
    "throttling": 3
    }',
    CURLOPT_HTTPHEADER => array(
        'Content-Type: application/json',
        "X-Auth-Token: magic_key",
        'Accept: application/json'
    ),
  ));

$response_ = curl_exec($curl);
curl_close($curl);

/***************************get subscriptions***************************/
$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => 'http://172.18.1.7:1026/v2/subscriptions',
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'GET',
    ));

$res = curl_exec($curl);
curl_close($curl);;
$res = json_decode($res);

$subid = 0;
foreach($res as $document){
    $subid = $document->id;
}
        
//***************************create favorite***************************/
$curl = curl_init();

$url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
    'insert_favorites' => true,
    'concertid' => $_POST["id"],
    'userid' => $_POST["uid"],
    'subid' => $subid
]);

curl_setopt($curl , CURLOPT_URL , $url);
curl_setopt($curl , CURLOPT_HTTPGET , true);
curl_setopt($curl , CURLOPT_RETURNTRANSFER , true);
curl_setopt($curl , CURLOPT_HTTPHEADER , array(
    "X-Auth-Token: magic_key"
));

$response = curl_exec($curl);
curl_close($curl);
$response = json_decode($response);

?>
