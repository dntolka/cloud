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
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Concerts</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>
    <style type="text/css">
        .wrapper{
            width: 650px;
            margin: 0 auto;
            margin-top: 100px;
        }
        .page-header h2{
            margin-top: 0;
        }
        table tr td:last-child a{
            margin-right: 15px;
        }

       
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });

        $(document).ready(function(){
    
            $(document).on('click','button[id^="fav_"]', function(){
                /* Get input value on change */
                var cid = $(this).closest("tr").find('td:eq(0)').text();
                var uid = $(this).closest("tr").find('td:eq(5)').text();

                $.ajax({
                    url:"addFavorite.php",    //the page containing php script
                    type: "post",    //request type,
                    dataType: 'json',
                    data: {id: cid, uid:uid}
                });
                
            });
        });

    </script>

</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="welcome.php">Home</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="concerts.php">Concerts</a></li>
            <li><a href="organizer.php">Organizers</a></li>
          </ul>
        </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li><a><?php echo htmlspecialchars($_SESSION["username"]) , " [" ,htmlspecialchars($_SESSION["role"]), "]" ; ?></a></li>
        <li><a href="logout.php" class="btn btn-success pull-right">Logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-header clearfix">
                        <h2 class="pull-left">Concerts Details</h2>
                        <a href="favorites.php" class="btn btn-success pull-right">Go to Favorites</a>
                    </div>
                    <?php

                    $curl = curl_init();
                    $url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
                        'get_cons_u' => true
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

                    echo "<table id='myTable' class='table table-bordered table-striped'>";
                                    echo "<thead>";
                                        echo "<tr>";
                                            echo "<th hidden = true>#</th>";
                                            echo "<th>Title</th>";
                                            echo "<th>Date</th>";
                                            echo "<th>Artist Name</th>";
                                            echo "<th>Category</th>";
                                        echo "</tr>";
                                    echo "</thead>";
                                    echo "<tbody>";

                    for ($i=0; $i < count($response); $i++) { 
                        echo "<tr>";
                            echo "<td hidden = true>" . $response[$i]->id . "</td>";
                            echo "<td> <input type='text' name='title' class='form-control' value='". $response[$i]->title ."'></td>";
                            echo "<td> <input type='text' name='date' class='form-control' value='" . $response[$i]->date . "'></td>";
                            echo "<td> <input type='text' name='artistname' class='form-control' value='" . $response[$i]->artistname . "'></td>";
                            echo "<td> <input type='text' name='catergory' class='form-control' value='" . $response[$i]->category . "'></td>";
                            echo "<td name='userid' hidden = true >" . $_SESSION["id"]. "</td>";
                            echo "<td>";
                                echo "<button id='fav_".intval($i)."' class='btn btn-default swap'><span class='glyphicon glyphicon-heart-empty'></span></button>";
                        echo "</td>";
                        echo "</tr>";
                    }
                    echo "</tbody>";                            
                    echo "</table>";
                    
                    ?>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>