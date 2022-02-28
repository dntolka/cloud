<?php

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

/*****************get the changes of the favorites concerts of the loggedin user*****************/
$curl = curl_init();

$url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
    'get_feed' => true,
    'userid' => $_POST['uid']
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

echo json_encode($response);
?>