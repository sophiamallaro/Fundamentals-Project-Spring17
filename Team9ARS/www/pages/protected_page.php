<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';
 
sec_session_start();
?>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {background-color: powderblue;text-align: center;line-height: 1.8;}
        </style>
        <meta charset="UTF-8">
        <title>Secure Login: Protected Page</title>
        <link rel="stylesheet" href="../styles/main.css" />
    </head>
    <body>
        <?php if (login_check($mysqli) == true && $_SESSION['accountType'] == 'Customer') : ?>
            <p>Welcome <?php echo htmlentities($_SESSION['username']); ?>!</p>
            <p>
                This is an example protected page.  To access this page, Custopmers
                must be logged in.  You are of the account type Customer! In the future,
				you will redirect elsewhere.
            </p>
            <p>Return to <a href="..\index.php">Home</a></p>
        <?php else : ?>
            <p>
                <span class="error">You are not authorized to access this page.</span> Please <a href="login.php">login</a>.
            </p>
        <?php endif; ?>
        <a href="myFlights.html">View My Flights</a>
    </body>
</html>