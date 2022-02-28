<?php
// Initialize the session
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

file_put_contents('php://stdout', print_r("\n*********last******\n", TRUE));
file_put_contents('php://stdout', print_r($_POST["uid"], TRUE));

/**********************delete concert**********************/
$curl = curl_init();

$url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
    'delete_concerts' => true,
    'id' => $_POST["id"]
]);

curl_setopt_array($curl, array(
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'DELETE',
    CURLOPT_HTTPHEADER => array(
        "X-Auth-Token: magic_key",
    ),
  ));

$response = curl_exec($curl);
curl_close($curl);
$response = json_decode($response);

/*****************delete favorite and subscription*****************/
$curl = curl_init();

$url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
    'del_fav_con' => true,
    'concertid' => $_POST["id"],
]);

curl_setopt($curl , CURLOPT_URL , $url);
curl_setopt($curl , CURLOPT_HTTPGET , true);
curl_setopt($curl , CURLOPT_RETURNTRANSFER , true);
curl_setopt($curl , CURLOPT_HTTPHEADER , array(
    "X-Auth-Token: magic_key"
));

$res = curl_exec($curl);
curl_close($curl);

/**********************delete entity**********************/
$curl = curl_init();
        
curl_setopt_array($curl, array(
    CURLOPT_URL => "http://172.18.1.12:1027/v2/entities/".$_POST["id"]."?type=Thing",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "DELETE",
    CURLOPT_HTTPHEADER => array(
        "X-Auth-Token: magic_key",
    ),
));

$response_ = curl_exec($curl);
curl_close($curl);

?>
