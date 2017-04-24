<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bookings</title>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.4;}
    </style>
    <meta charset="UTF-8">
    <title>Create Account</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>	
	<table width="1000">
    <tr>
		<td>Ticket Holder</td>
		<td>Class Type</td>
		<td>Cancelled?</td>
    </tr>
	<?php

        $query1 = "SELECT * FROM bookings WHERE flightID ='".$_POST['num']."'";
		$stmt = $mysqli->query($query1);
            if ($stmt->num_rows > 0) {
                        while($row = $stmt->fetch_assoc()) {
                            echo '<tr>';
							echo '<td>'.$row['name'].'</td>';
							echo '<td>'.$row['class'].'</td>';
							if ($row['Cancellation'] == 1)
							{
								echo '<td>Yes</td>';
							}
							else
							{
								echo '<td> </td>';
							}
                            echo '</tr>';
                        }
            } else {
                echo 'No Available bookings';
            }

	?>
	</table><br>	
</body>
</html>