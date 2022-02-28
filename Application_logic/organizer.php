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
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Organizers</title>
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

            $(document).on('click','button[id^="del_"]', function(){
                    /* Get input value on change */
                    var id = $(this).closest("tr").find('td:eq(0)').text();
                    $(this).closest("tr").remove();
                    $.ajax({
                        url:"deleteConcert.php",    //the page containing php script
                        type: "post",    //request type,
                        dataType: "json",
                        data: {id: id},
                        
                    }).done(function (response){
                        console.log(response);
                    });
            });

            $(document).on('click','button[id^="upt_"]', function(){
                /* Get input value on change */
                var id = $(this).closest("tr").find('td:eq(0)').text();
                var row = $(this).closest("tr").find('td:eq(0)').parent().index();
                console.log(row);
                row = row + 1;
                row = row.toString();
                var title = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(2) > input").value;
                var date = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(3) > input").value;
                var artistname = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(4) > input").value;
                var category = document.querySelector("#myTable > tbody > tr:nth-child("+row+") > td:nth-child(5) > input").value;

                $.ajax({
                    url:"updateConcert.php",    //the page containing php script
                    type: "post",    //request type,
                    dataType: "json",
                    data: {id:id, title:title , date:date , artistname:artistname ,category:category},
                    success:function(result){
                        console.log(result);
                        console.log(title);
                        console.log(date);
                        console.log(artistname);
                        console.log(category);
                    },
                    error: function() {
                            console.log($.makeArray(arguments));
                            console.log('no');
                            
                    }
                });
            });

            $(document).on('click','button[id="insertconcert"]', function(){
                /* Get input value on change */
                var title = document.getElementById("titleid").value;
                var date = document.getElementById("dateid").value;
                var artistname = document.getElementById("artistnameid").value;
                var category = document.getElementById("categoryid").value;
                var uid = document.getElementById("uid").value;
                
                var table = document.getElementById("myTable");
                var rows = document.getElementById("myTable").rows.length;
                var row = table.insertRow(rows);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);
                var cell6 = row.insertCell(5);
                var cell7 = row.insertCell(6);
                var cell8 = row.insertCell(7);
                
                $.ajax({
                    url:"insertConcert.php",    //the page containing php script
                    type: "post",    //request type,
                    dataType: "json",
                    data: {title:title, date:date, artistname:artistname, category:category, userid:uid},
                    success:function(result){
                        console.log(result);
                        console.log(result.title);
                        console.log(result._id.$oid);
                        cell1.innerHTML = result._id.$oid;
                        cell1.hidden = true;
                        cell2.innerHTML = "<td> <input type='text' name='title' class='form-control' value='"+title+"'></td>"
                        cell3.innerHTML = "<td> <input type='text' name='date' class='form-control' value='"+date+"'></td>"
                        cell4.innerHTML = "<td> <input type='text' name='artistname' class='form-control' value='"+artistname+"'></td>"
                        cell5.innerHTML = "<td> <input type='text' name='category' class='form-control' value='"+category+"'></td>";
                        cell6.innerHTML = "<td> <input type='text' name='_id' class='form-control' value='"+uid+"'></td>";
                        cell6.hidden = true;
                        cell7.innerHTML = "<button id='upt_' class='btn btn-default swap'><span class='glyphicon glyphicon-pencil'></span></button>";
                        cell8.innerHTML = "<button id='del_' class='btn btn-default swap'><span class='glyphicon glyphicon-trash'></span></button>";
                    },
                    error: function(){
                        console.log("no");
                    }
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
                            <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#exampleModal">
                        Insert a Concert
                        </button>
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">New Concert</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                <p>Please fill this form and submit to add a concert to the database.</p>
                                <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                                    <div hidden = true class="form-group <?php echo (!empty($id_err)) ? 'has-error' : ''; ?>">
                                        <label>ID</label>
                                        <input id="uid" type="text" name="name" class="form-control" value="<?php echo $_SESSION['id']; ?>">
                                        <span class="help-block"><?php echo $id_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($title_err)) ? 'has-error' : ''; ?>">
                                        <label>Title</label>
                                        <input id="titleid" type="text" name="title" class="form-control" value="<?php echo $title; ?>">
                                        <span class="help-block"><?php echo $title_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($date_err)) ? 'has-error' : ''; ?>">
                                        <label>Date</label>
                                        <input id="dateid" type="text" name="date" class="form-control" value="<?php echo $date; ?>">
                                        <span class="help-block"><?php echo $date_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($artistname_err)) ? 'has-error' : ''; ?>">
                                        <label>Artist Name</label>
                                        <input id="artistnameid" type="text" name="artistname" class="form-control" value="<?php echo $artistname; ?>">
                                        <span class="help-block"><?php echo $artistname_err;?></span>
                                    </div>
                                    <div class="form-group <?php echo (!empty($category_err)) ? 'has-error' : ''; ?>">
                                        <label>Category</label>
                                        <input id="categoryid" type="text" name="category" class="form-control" value="<?php echo $category; ?>">
                                        <span class="help-block"><?php echo $category_err;?></span>
                                    </div>                                
                                </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="insertconcert" type="button" class="btn btn-success">Save changes</button>
                                </div>
                                </div>
                            </div>
                            </div>
                    </div>
                    <?php
                    
                    $curl = curl_init();

                    $oath2token = $_SESSION["token"]; 

                    $url = "http://172.18.1.11:2000/data_storage.php?". http_build_query([
                        'get_concerts' => true,
                        'userid' => $_SESSION["id"]
                    ]);
                    
                    curl_setopt_array($curl, array(
                    CURLOPT_URL => $url,
                    CURLOPT_RETURNTRANSFER => true,
                    CURLOPT_ENCODING => '',
                    CURLOPT_MAXREDIRS => 10,
                    CURLOPT_TIMEOUT => 0,
                    CURLOPT_FOLLOWLOCATION => true,
                    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                    CURLOPT_CUSTOMREQUEST => 'GET',
                    CURLOPT_HTTPHEADER  => array(
                        'X-Auth-Token: '.$oath2token.''
                        )
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
                                echo "<button id='upt_".intval($i)."' class='btn btn-default swap'><span class='glyphicon glyphicon-pencil'></span></button>";
                        echo "</td>";
                        echo "<td>";
                                echo "<button id='del_".intval($i)."' class='btn btn-default swap'><span class='glyphicon glyphicon-trash'></span></button>";
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