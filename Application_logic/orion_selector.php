<?php

/******input has data when an eventorganizer change the date of a user's favorite***/
$response = file_get_contents('php://input');

$response = json_decode($response);

$conid = $response->data[0]->id;
$title = $response->data[0]->title->value;
$date = $response->data[0]->date->value;

$curl = curl_init();

curl_setopt_array($curl , array(
    CURLOPT_URL => 'http://172.18.1.12:1027/v2/subscriptions/'.$response->subscriptionId,
    CURLOPT_RETURNTRANSFER => true ,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'GET',
    CURLOPT_HTTPHEADER => array(
        "X-Auth-Token: magic_key"
    ),
));

$req = curl_exec($curl) ;
$req = json_decode($req);
curl_close($curl);

$userid = $req->description;

/*****************every change is inserting in the collection feedback*****************/
$curl = curl_init();
$url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
    'set_feed' => true,
    'title' => $title,
    'date'=> $date,
    'userid' => $userid,
    'conid' => $conid,
    'subid' => $response->subscriptionId
]);

curl_setopt($curl , CURLOPT_URL , $url);
curl_setopt($curl , CURLOPT_HTTPGET , true);
curl_setopt($curl , CURLOPT_RETURNTRANSFER , true);
curl_setopt($curl , CURLOPT_HTTPHEADER , array(
    "X-Auth-Token: magic_key"
));

$response_ = curl_exec($curl);
curl_close($curl);

?>