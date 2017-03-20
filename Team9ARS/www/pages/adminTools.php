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
    <title>Administrator Tools</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
    <h1>Administrator Tools</h1>
	
	<?php if (login_check($mysqli) == true && $_SESSION['accountType'] == 'Admin') : ?>
        <p>Welcome Administrator <?php echo htmlentities($_SESSION['username']); ?>!</p><br>
		
		<p>
			<a href="flightManagement.html">Flight Management</a><br>
			<a href="accountManagement.php">Account Management</a><br>
		</p>
			
    <?php else : ?>
            <p>
                <span class="error">You are not authorized to access this page.</span> Please <a href="login.php">login</a>.
            </p>
    <?php endif; ?>
</body>
</html>