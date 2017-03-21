<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';
 
sec_session_start();
 
if (login_check($mysqli) == true) {
    $logged = 'in';
} else {
    $logged = 'out';
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            body {background-color: powderblue;text-align: center;line-height: 1.8;}
        </style>
		<meta charset="UTF-8">
        <title>Secure Login: Log In</title>
        <link rel="stylesheet" href="../styles/main.css" />
        <script type="text/JavaScript" src="../js/sha512.js"></script> 
        <script type="text/JavaScript" src="../js/forms.js"></script>
        <div style='float: right;'><a href="../index.php">Home</a></div>
    </head>
    <body>
        <?php
        if (isset($_GET['error'])) {
            echo '<p class="error">Error Logging In!</p>';
        }
        ?>
        <h1>Please change your temp Password to a permanent one.</h1>
        <form action="../includes/change_login.php" method="post" name="login_form">                      
            Temp Password: <input type="password" 
                             name="tempPassword" 
                             id="tempPassword"/><br>
			New Password: <input type="password"
							 name="newPassword"
							 id="newPassword"/><br>
			Confirm Password: <input type="password"
							 name="confPassword"
							 id="confPassword"/><br>
            <input type="button" 
                   value="Change Password" 
                   onclick="formhash(this.form, this.form.newPassword);" /> 
        </form>
    </body>
</html>