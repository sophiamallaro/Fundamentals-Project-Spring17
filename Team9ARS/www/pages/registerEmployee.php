<?php
include_once '../includes/register.inc.employee.php';
include_once '../includes/functions.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {background-color: powderblue;line-height: 1.8;}
        </style>
        <meta charset="UTF-8">
        <title>Secure Login: Employee Registration Form</title>
        <script type="text/JavaScript" src="../js/sha512.js"></script> 
        <script type="text/JavaScript" src="../js/forms.js"></script>
        <link rel="stylesheet" href="../styles/main.css" />
        <div style='float: right;'><a href="../index.php">Home</a></div>
    </head>
    <body>
        <!-- Registration form to be output if the POST variables are not
        set or if the registration script caused an error. -->
		<h1>Register a new Employee</h1>
        <?php
        if (!empty($error_msg)) {
            echo $error_msg;
        }
        ?>
        <ul>
            <li>Usernames may contain only digits, upper and lowercase letters and underscores</li>
            <li>Emails must have a valid email format</li>
            <li>Passwords must be at least 6 characters long</li>
            <li>Passwords must contain
                <ul>
                    <li>At least one uppercase letter (A..Z)</li>
                    <li>At least one lowercase letter (a..z)</li>
                    <li>At least one number (0..9)</li>
                </ul>
            </li>
            <li>Your password and confirmation must match exactly</li>
        </ul>
        <form action="<?php echo esc_url($_SERVER['REQUEST_URI']); ?>" 
                method="post" 
                name="registration_form">
            Email: <input type="text" name="email" id="email" /><br>
			Account Type: <input type="radio" name="type" id="type" value="Manager" />Manager
						  <input type="radio" name="type" id="type" value="Admin" />Administrator<br>
            Password: <input type="password"
                             name="password" 
                             id="password"/><br>
            Confirm password: <input type="password" 
                                     name="confirmpwd" 
                                     id="confirmpwd" /><br>
            <input type="button" 
                   value="Register" 
                   onclick="return regformhashemployee(this.form,
                                   this.form.email,
								   this.form.type,
                                   this.form.password,
                                   this.form.confirmpwd);" /> 
        </form>
        <p><a href="/pages/adminTools.php">Return to admin tools</a></p>
    </body>
</html>