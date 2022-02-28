<?php
// Initialize the session
session_start();

    try {
        // connect to OVHcloud Public Cloud Databases for MongoDB (cluster in version 4.4, MongoDB PHP Extension in 1.8.1)
        $manager = new MongoDB\Driver\Manager('mongodb://mongo_db:27017');
        /* echo "Connection to database successfully";
        
        // display the content of the driver, for diagnosis purpose
        var_dump($manager); */
    }
    catch (Throwable $e) {
        // catch throwables when the connection is not a success
        echo "Captured Throwable for connection : " . $e->getMessage() . PHP_EOL;
    }

    /************************************************concerts************************************************/
    /*******get concerts for eventorganizers*******/
    if(isset($_GET['get_concerts']) && $_GET['get_concerts'] == true){
        
        $filter = ["userid" => $_GET['userid']];
        $options = [
            
        ];
        
        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.concerts', $query);
        $arr_ = array();
        $count = 0;

        foreach ($rows as $document) {
           
            $arr_[$count] = array(
                "id" => (string)$document->_id,
                "title" => $document->title,
                "date" => $document->date->toDateTime()->format('Y-m-d'),
                "artistname" => $document->artistname,
                "category" => $document->category,
                "userid" => $document->userid
            );
            $count = $count + 1;
          }

        echo json_encode($arr_);
    }

    /*******get concerts for users*******/
    if(isset($_GET['get_cons_u']) && $_GET['get_cons_u'] == true){
        
        $filter = [];
        $options = [
            
        ];
        
        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.concerts', $query);
        $arr_ = array();
        $count = 0;

        foreach ($rows as $document) {
           
            $arr_[$count] = array(
                "id" => (string)$document->_id,
                "title" => $document->title,
                "date" => $document->date->toDateTime()->format('Y-m-d'),
                "artistname" => $document->artistname,
                "category" => $document->category,
                "userid" => $document->userid
            );
            $count = $count + 1;
          }

        echo json_encode($arr_);
    }

    /*******insert concerts*******/
    if(isset($_GET['insert_concerts']) && $_GET['insert_concerts'] == true ){
            
        $bulk = new MongoDB\Driver\BulkWrite;

        $document = ['_id' => new MongoDB\BSON\ObjectId, 
                     'title' => $_GET["title"],
                     'date'=> new MongoDB\BSON\UTCDateTime(strtotime($_GET["date"]) * 1000),
                     'artistname'=> $_GET["artistname"], 
                     'category'=> $_GET["category"],
                     'userid'=> $_GET["userid"]
        ];

        $bulk->insert($document);
        $result = $manager->executeBulkWrite('cloud.concerts', $bulk);

        echo json_encode($document);
    }  

    /*******update concerts*******/ 
    if(isset($_GET['update_concerts']) && $_GET['update_concerts'] == true ){
        
        $bulk = new MongoDB\Driver\BulkWrite;

        $bulk->update( ["_id" => new MongoDB\BSON\ObjectId($_GET['id'])],
                       ['$set' => ['title' => $_GET["title"],
                                  'date' => new MongoDB\BSON\UTCDateTime(strtotime($_GET['date']) * 1000),
                                  'artistname' => $_GET['artistname'],
                                  'category' => $_GET['category'],
                                  'userid' => $_GET['userid']]
                       ]);

        $result = $manager->executeBulkWrite('cloud.concerts', $bulk);

        echo json_encode("success");
    }

    /*******delete concerts*******/
    if(isset($_GET['delete_concerts']) && $_GET['delete_concerts'] == true ){

        $bulk = new MongoDB\Driver\BulkWrite;

        $bulk->delete(['_id' => new MongoDB\BSON\ObjectId($_GET["id"])],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.concerts', $bulk);
        echo json_encode("success");

    }

    /************************************************favorites************************************************/
    /*******check favorites*******/ 
    if(isset($_GET['check_fav']) && $_GET['check_fav'] == true){
        
        $filter = ['userid' => $_GET['userid'], 'concertid' => $_GET['concertid']];
        $options = [
            
        ];
        
        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.favorites', $query);
        $arr = array();
        $count = 0;

        foreach ($rows as $document) {
           
            $filter = ['_id' => new MongoDB\BSON\ObjectId($document->concertid)];
            $query_ = new MongoDB\Driver\Query($filter, $options);
            $cons_ = $manager->executeQuery('cloud.concerts', $query_);

            foreach($cons_ as $doc){
                $arr[$count] = array(
                    "id" => (string)$doc->_id,
                    "title" => $doc->title,
                    "date" => $doc->date->toDateTime()->format('Y-m-d'),
                    "artistname"=>$doc->artistname,
                    "category"=>$doc->category,
                );
            }
            $count = $count + 1;
          }

        echo json_encode($arr);
    }

    /*******get favorites*******/  
    if(isset($_GET['get_fav']) && $_GET['get_fav'] == true){
        
        $filter = ['userid' => $_GET['userid']];
        $options = [
            
        ];
        
        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.favorites', $query);
        $arr = array();
        $count = 0;

        foreach ($rows as $document) {
           
            $filter = ['_id' => new MongoDB\BSON\ObjectId($document->concertid)];
            $query_ = new MongoDB\Driver\Query($filter, $options);
            $cons_ = $manager->executeQuery('cloud.concerts', $query_);

            foreach($cons_ as $doc){
                $arr[$count] = array(
                    "id" => (string)$doc->_id,
                    "title" => $doc->title,
                    "date" => $doc->date->toDateTime()->format('Y-m-d'),
                    "artistname"=>$doc->artistname,
                    "category"=>$doc->category,
                );
            }
            $count = $count + 1;
          }

        echo json_encode($arr);
    }

    /*******insert favorites*******/ 
    if(isset($_GET['insert_favorites']) && $_GET['insert_favorites'] == true ){
            
        $bulk = new MongoDB\Driver\BulkWrite;

        $document = ['_id' => new MongoDB\BSON\ObjectId, 
                     'userid' => $_GET["userid"], 
                     'concertid' => $_GET["concertid"], 
                     'subid' => $_GET["subid"]
        ];

        $bulk->insert($document);
        $result = $manager->executeBulkWrite('cloud.favorites', $bulk);

        echo json_encode($document);
    }

    /*******delete favorites & subscription & concert*******/
    if(isset($_GET['del_fav_con']) && $_GET['del_fav_con'] == true){

        $filter = [
            'concertid' => $_GET["concertid"]
        ];
        
        $options = [
            
        ];
        
        $query_ = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.favorites', $query_);
        
        $subid = 0;
        foreach($rows as $document){
            $subid = $document->subid;

            $curl = curl_init();
        
            curl_setopt_array($curl , array(
                CURLOPT_URL => 'http://172.18.1.12:1027/v2/subscriptions/'.$subid.'',
                CURLOPT_RETURNTRANSFER => true ,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'DELETE',
                CURLOPT_HTTPHEADER => array(
                    "X-Auth-Token: magic_key"
                ),
            ));
            
            $req = curl_exec($curl) ;
            $req = json_decode($req);
            curl_close($curl);
        }
    
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['concertid' =>$_GET["concertid"]]);
        $result = $manager->executeBulkWrite('cloud.favorites', $bulk);

        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['conid' =>$_GET["concertid"]]);
        $result = $manager->executeBulkWrite('cloud.feedback', $bulk);
    
        echo json_encode("success");
    
    }

    /*******delete favorites & subscription*******/
    if(isset($_GET['del_fav']) && $_GET['del_fav'] == true){

        $filter = [
            'userid' => $_GET["userid"],
            'concertid' => $_GET["concertid"]
        ];
        
        $options = [
            
        ];
        
        $query_ = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.favorites', $query_);
        
        $subid = 0;
        foreach($rows as $document){
            $subid = $document->subid;
        }
        
        $curl = curl_init();
        
        curl_setopt_array($curl , array(
            CURLOPT_URL => 'http://172.18.1.12:1027/v2/subscriptions/'.$subid.'',
            CURLOPT_RETURNTRANSFER => true ,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'DELETE',
            CURLOPT_HTTPHEADER => array(
                "X-Auth-Token: magic_key"
            ),
        ));
        
        $req = curl_exec($curl) ;
        $req = json_decode($req);
        curl_close($curl);
    
        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['concertid' =>$_GET["concertid"] , 'userid'=>$_GET["userid"]],['limit' => 1]);
        $result = $manager->executeBulkWrite('cloud.favorites', $bulk);

        $bulk = new MongoDB\Driver\BulkWrite;
        $bulk->delete(['conid' =>$_GET["concertid"] , 'userid'=>$_GET["userid"]]);
        $result = $manager->executeBulkWrite('cloud.feedback', $bulk);
    
        echo json_encode("success");
    
    }

    /************************************************notification/feedback************************************************/
    
    /*******insert feedback*******/
    if(isset($_GET['set_feed']) && $_GET['set_feed'] == true ){

        $bulk = new MongoDB\Driver\BulkWrite;
        $document = ['_id' => new MongoDB\BSON\ObjectId, 
                    'title' => $_GET["title"],
                    'date'=>new MongoDB\BSON\UTCDateTime(strtotime($_GET['date']) * 1000),
                    'userid'=>$_GET["userid"] , 
                    'conid'=>$_GET["conid"],
                    'subid' => $_GET["subid"]
                    ];
        $bulk->insert($document);
        $result = $manager->executeBulkWrite('cloud.feedback', $bulk);

        echo json_encode("success");   
    }

    /*******get feedback*******/
    if(isset($_GET['get_feed']) && $_GET['get_feed'] == true){
        
        $filter = ['userid'=>$_GET["userid"]];
        $options = [
            
        ];

        $query = new MongoDB\Driver\Query($filter, $options);
        $rows = $manager->executeQuery('cloud.feedback', $query);
        $arr = array();
        $count = 0;
        foreach ($rows as $document) {
           
            $arr[$count] = array(
                "title" => $document->title,
                "date" => $document->date->toDateTime()->format('Y-m-d')
            );

            $count = $count + 1;
          }
        echo json_encode($arr);
    }
    
