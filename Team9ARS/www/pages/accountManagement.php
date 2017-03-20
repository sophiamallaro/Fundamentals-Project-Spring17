<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';
 
sec_session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.4;}
    </style>
    <meta charset="UTF-8">
    <title>Account Management</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
    <h1>Airline Account Management Tools</h1>

	<?php if (login_check($mysqli) == true && $_SESSION['accountType'] == 'Admin') : ?>
		<p>
			<a href="registerEmployee.php">Register New Employee</a><br>
			Edit Employee<br>
			Edit Customer<br>
			<a href="/pages/adminTools.php">Return to admin tools</a>
		</p>
    <?php else : ?>
            <p>
                <span class="error">You are not authorized to access this page.</span> Please <a href="login.php">login</a>.
            </p>
    <?php endif; ?>
    
</body>
</html>