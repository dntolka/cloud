<?php

// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";
$email = $role = "";
$email_err = $role_err = "" ;
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    
    // Validate username
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter a username.";     
    } else{
        $username = trim($_POST["username"]);
    }
    
    // Validate password
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter a password.";     
    }else{
        $password = trim($_POST["password"]);
    }
    
    // Validate confirm password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Please confirm password.";     
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "Password did not match.";
        }
    }

    // Validate email 
    if(empty(trim($_POST["email"]))){
        $email_err = "Please enter a email.";     
    } else{
        $email = trim($_POST["email"]);
    }

    // Validate role 
    if(empty(trim($_POST["role"]))){
        $role_err = "Please enter a role[“ADMIN”, ”EVENTORGANIZER”, ”USER”].";     
    } else{
        $role = trim($_POST["role"]);
        if($role != "ADMIN" && $role != "EVENTORGANIZER" && $role != "USER"){
            $role_err = "Role did not match." ;
        }
    }
    
    // Check input errors before inserting in database
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err) && empty($role_err) && empty($email_err)){
        
        /***************** ACQUIRE X-Auth-Token *****************/
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, "http://172.18.1.5:3005/v1/auth/tokens");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, 1);
        curl_setopt($ch, CURLOPT_POST, TRUE);

        curl_setopt($ch, CURLOPT_POSTFIELDS, "{
        \"name\": \"dntolka@test.com\",
        \"password\": \"test\"
        }");

        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        "Content-Type: application/json"
        ));

        $response = curl_exec($ch);  
        
        // Get header of response
        $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
        $header = substr($response, 0, $header_size);
        $header = explode("\r\n", $header); 

        curl_close($ch);

        // Get X-Subject-token
        $subject_token = trim(explode(":",$header[2])[1]);
        
        /********************** CREATE USER *********************/
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, "http://172.18.1.5:3005/v1/users");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);

        curl_setopt($ch, CURLOPT_POST, TRUE);

        curl_setopt($ch, CURLOPT_POSTFIELDS, "{
        \"user\": {
            \"username\": \"".$username."\",
            \"email\": \"".$email."\",
            \"password\": \"".$password."\"
        }
        }");

        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "Content-Type: application/json",
            "X-Auth-token: ".$subject_token.""
        ));

        $result = curl_exec($ch);
        curl_close($ch);

        /******************** GET THE CREATED USER'S ID **********************/
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'http://172.18.1.5:3005/v1/users',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                "X-Auth-Token: ".$subject_token.""
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        //echo $response;
        $result = json_decode($response, true);

        foreach($result as $key){
            foreach($key as $doc){
                if($doc['username'] == $username && $doc['email'] == $email){
                    $userid = $doc['id'];
                }
            }
        }

        header("location: index.php");
        exit;

        /********************PUT USER'S ROLE**********************/
       /* $appID = "abe27d6b-9ffb-4bbc-b016-105bc0a909f6";
        $roleUserID = "8611e74d-4916-4582-956b-b9363c2cb405";
        $roleEventOrganizerID = "de2aba1-f6bf-4c9f-86b7-720b2a4335fe";
        
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, "http://keyrock:3005/v1/applications/abe27d6b-9ffb-4bbc-b016-105bc0a909f6/users/".$userid."/roles");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);

        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "X-Auth-token: ".$subject_token.""
        ));

        $response = curl_exec($ch);
        echo $response;
        curl_close($ch);
        */
    }
}
?>
 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Sign Up</h2>
        <p>Please fill this form to create an account.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="<?php echo $username; ?>">
                <span class="help-block"><?php echo $username_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Password</label>
                <input type="password" name="password" class="form-control" value="<?php echo $password; ?>">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($confirm_password_err)) ? 'has-error' : ''; ?>">
                <label>Confirm Password</label>
                <input type="password" name="confirm_password" class="form-control" value="<?php echo $confirm_password; ?>">
                <span class="help-block"><?php echo $confirm_password_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
                <label>Email</label>
                <input type="text" name="email" class="form-control" value="<?php echo $email; ?>">
                <span class="help-block"><?php echo $email_err; ?></span>
            </div>
            <div class="form-group <?php echo (!empty($role_err)) ? 'has-error' : ''; ?>">
                <label>Role</label>
                <input type="radio" name="role"
                <?php if (isset($role) && $role=="ADMIN") echo "checked";?>
                value="ADMIN">ADMIN
                <input type="radio" name="role"
                <?php if (isset($role) && $role=="USER") echo "checked";?>
                value="USER">USER
                <input type="radio" name="role"
                <?php if (isset($role) && $role=="EVENTORGANIZER") echo "checked";?>
                value="EVENTORGANIZER">EVENTORGANIZER
                <span class="help-block"><?php echo $role_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Submit">
                <input type="reset" class="btn btn-default" value="Reset">
            </div>
            <p>Already have an account? <a href="login.php">Login here</a>.</p>
        </form>
    </div>    
</body>
</html>
