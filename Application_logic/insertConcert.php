<?php

session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

if($_SESSION['role'] != 'eventorganizer'){
    header("location: error.php");
    exit;
}

/**********************create concert**********************/
$curl = curl_init();

$url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
    'insert_concerts' => true,
    'title' => $_POST["title"],
    'date' => $_POST["date"],
    'artistname' => $_POST["artistname"],
    'category' => $_POST["category"],
    'userid' => $_POST["userid"]
]);


curl_setopt_array($curl, array(
  CURLOPT_URL => $url,
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_HTTPHEADER  => array(
    "Content-Type: application/json",
    "X-Auth-Token: magic_key",
    )
));

$response = curl_exec($curl);
curl_close($curl);
$response = json_decode($response);
echo json_encode($response);

/**********************create entity**********************/
$curl = curl_init();
$arr_input = array(
    'id' => $response->_id->{'$oid'},
    'title' => $_POST["title"],
    'date' => $_POST["date"],
    'artistname' => $_POST["artistname"],
    'category' => $_POST["category"],
    'userid' => $_POST["userid"]
);

curl_setopt_array($curl, array(
    CURLOPT_URL => "http://172.18.1.12:1027/v2/entities?options=keyValues",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_POSTFIELDS => json_encode($arr_input,true),
    CURLOPT_HTTPHEADER => array(
        "Content-Type: application/json",
        "X-Auth-Token: magic_key",
    ),
));

$response_ = curl_exec($curl);
curl_close($curl);


?>