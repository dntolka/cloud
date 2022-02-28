<?php
// Initialize the session
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: welcome.php");
    exit;
}
 
// Define variables and initialize with empty values
$email = $password = "";
$email_err = $password_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if email is empty
    if(empty(trim($_POST["email"]))){
        $email_err = "Please enter email.";
    } else{
        $email = trim($_POST["email"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";
    } else{
        $password = trim($_POST["password"]);
    }

    // Validate credentials
    if(empty($email_err) && empty($password_err)){

        /********************************** AUTHENTICATE USER ****************************/
        $client_id = "abe27d6b-9ffb-4bbc-b016-105bc0a909f6";
        $client_secret = "77d389e3-858c-4d09-9204-67ccce899cce";
        $authorization = base64_encode($client_id.":". $client_secret);

        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL, "http://172.18.1.5:3005/oauth2/token");
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Authorization: Basic '.$authorization,
            'Content-Type: application/x-www-form-urlencoded'
            ));

        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
    
        curl_setopt($curl,CURLOPT_POSTFIELDS, http_build_query([
            'grant_type' => 'password',
            'username' => $email,
            'password' => $password,
        ]));

        //make the request
        $result = curl_exec($curl);
        curl_close($curl);
        $result= json_decode($result);
            
       if( $result->access_token == NULL){
            header("location: error.php");
            exit;
        } 

        /************************ACQUIRE USERNAME AND ROLE********************************/
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'http://172.18.1.5:3005/user?access_token='. $result->access_token,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
        ));

        $response = curl_exec($curl);
        //echo $response;
        curl_close($curl);
        $response = json_decode($response);

        $_SESSION["token"] = $result->access_token;
        $_SESSION["loggedin"] = true;
        $_SESSION["id"] = $response->id;
        $_SESSION["username"] = $response->username;
        $_SESSION["role"] = $response->roles[0]->name;

        header("location: welcome.php");
        exit;
    }
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Login</h2>
        <p>Please fill in your credentials to login.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
                <label>email</label>
                <input type="text" name="email" class="form-control" value="<?php echo $email; ?>">
                <span class="help-block"><?php echo $email_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="password" class="form-control">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Login">
            </div>
            <p>Don't have an account? <a href="register.php">Sign up now</a>.</p>
        </form>
    </div>    
</body>
</html>