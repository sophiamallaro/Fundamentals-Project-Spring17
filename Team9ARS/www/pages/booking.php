<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

sec_session_start();

$_SESSION['flightNum'] = $_POST['number'];
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
    <form action="../includes/process_booking.php" method="post" name="test_form">
    <h1>Book Your Flight</h1>
    Name: <input type="text" name="name"><br>
     <select name="class">
        <option value="Economy">Economy</option>
        <option value="First Class">First Class</option>
        </select><br>
     Credit Card Number: <input type="text" name="creditcard"><br>
     <input type="submit" value="Book"><br>
     </form>
</body>
</html>