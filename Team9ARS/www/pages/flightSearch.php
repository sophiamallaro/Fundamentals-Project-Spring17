<?php
include_once '../includes/register.inc.employee.php';
include_once '../includes/functions.php';
ini_set("date.timezone", "America/New_York");
include_once '../includes/db_connect.php';
 
sec_session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.4;}
    </style>
    <meta charset="UTF-8">
    <title>Create Add Flight</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
    <h1>Results</h1>

	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1000">
    <tr>
        <td>Flight Number</td>
        <td>Departure Date</td>
        <td>Arrival Date</td>
        <td>Departure Time</td>
        <td>Arrival Time</td>
        <td>Economy Price</td>
        <td>First Class Price</td>
    </tr>
	<?php
	    $source = $_POST['source'];
	    $destination = $_POST['destination'];
        $insertddate = date('Y-m-d', strtotime($_POST['ddate']));
        $insertadate = date('Y-m-d', strtotime($_POST['adate']));
        $instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' AND adate='".$insertadate."'";
		$stmt = $mysqli->query($instruction);
        if($stmt) {
            if ($stmt->num_rows > 0) {
                        while($row = $stmt->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>'.$row['number'].'</td>';
                            echo '<td>'.$row['ddate'].'</td>';
                            echo '<td>'.$row['adate'].'</td>';
                            echo '<td>'.$row['dtime'].'</td>';
                            echo '<td>'.$row['atime'].'</td>';
                            echo '<td>'.$row['ePrice'].'</td>';
                            echo '<td>'.$row['fcPrice'].'</td>';
							echo '<td><button type="submit" name ="number" value="'.$row['number'].'">Book Flight '.$row['number'].'</button></td>';
							echo '<td><a href="../index.php">/View Map</a></td>';
                            echo '</tr>';
                        }
                        // echo "</select>";
            } else {
                echo 'No Available Flights';
            }
        } else {
                echo 'STATEMENT NOT PREPARING';
        }

	?>
	</table><br>
    </form>
</body>
</html>
