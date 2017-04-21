<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Flights</title>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.4;}
    </style>
    <meta charset="UTF-8">
    <title>Create Account</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
    <h1>My Flights</h1>
	
	<table width="1000">
    <tr>
        <td>Flight Number</td>
		<td>Departure</td>
		<td>Arrival</td>
		<td>Departure Date</td>
        <td>Arrival Date</td>
        <td>Departure Time</td>
        <td>Arrival Time</td>
    </tr>
	<?php

        $query1 = "SELECT * FROM bookings a, flight b WHERE a.accountID=\"" . htmlentities($_SESSION['username']) . "\" and b.number = a.flightID";
		$stmt = $mysqli->query($query1);
            if ($stmt->num_rows > 0) {
                        while($row = $stmt->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>'.$row['number'].'</td>';
							echo '<td>'.$row['source'].'</td>';
							echo '<td>'.$row['destination'].'</td>';
                            echo '<td>'.$row['ddate'].'</td>';
                            echo '<td>'.$row['adate'].'</td>';
                            echo '<td>'.$row['dtime'].'</td>';
                            echo '<td>'.$row['atime'].'</td>';
                            echo '</tr>';
                        }
            } else {
                echo 'No Available Flights';
            }

	?>
	</table><br>
	
</body>
</html>