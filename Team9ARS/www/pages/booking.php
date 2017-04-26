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
	<?php
			$sql = "SELECT fcPrice, ePrice FROM flight WHERE number ='".$_SESSION['flightNum']."' LIMIT 1";
			$value = $mysqli->query($sql);
			$row = $value->fetch_assoc();
			echo "Economy Price: $".$row['ePrice']." First Class Price: $".$row['fcPrice']."<br>";
	?>
     <select name="class">		
        <option value="Economy">Economy</option>
        <option value="First Class">First Class</option>
     </select><br>
     Credit Card Number: <input type="text" name="creditcard"><br>
     <input type="submit" value="Book"><br>
     </form>
</body>
</html>