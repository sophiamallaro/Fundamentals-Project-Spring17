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
	<h2>Direct Flights</h2>
	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1500">
    <tr>
        <td>Flight Number</td>
		<td>Departure Destination</td>
        <td>Arrival Destination</td>
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
		$sort = $_POST['sort'];
		$roundtrip = $_POST['roundtrip'];
		$returndate = date('Y-m-d', strtotime($_POST['rdate']));
		
		if($sort == 0) {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY ePrice";
		} else if($sort == 1) {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY dTime";
		} else {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY aTime";
		}
		$stmt = $mysqli->query($instruction);
        if($stmt) {
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
                echo 'Error';
        }

	?>
	</table><br>
	
	<h2>Flights With Stops</h2>
	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1500">
    <tr>
        <td>Flight Number</td>
		<td>Departure Destination</td>
        <td>Arrival Destination</td>
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
		$sort = $_POST['sort'];
		
		if($sort == 0) {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination!='".$destination."' AND ddate ='".$insertddate."' ORDER BY ePrice";
		} else if($sort == 1) {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination!='".$destination."' AND ddate ='".$insertddate."' ORDER BY dTime";
		} else {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination!='".$destination."' AND ddate ='".$insertddate."' ORDER BY aTime";

		}
		$stmt = $mysqli->query($instruction);
        if($stmt) {			
            if ($stmt->num_rows > 0) {
				while($row = $stmt->fetch_assoc()) {
					$instruction2 = "SELECT * FROM flight where source='".$row['destination']."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY aTime";
					$statement2 = $mysqli->query($instruction2);
					if($statement2->num_rows > 0) {
						echo '<tr>';
						echo '<td>'.$row['number'].'</td>';
						echo '<td>'.$row['source'].'</td>';
						echo '<td>'.$row['destination'].'</td>';
						echo '<td>'.$row['ddate'].'</td>';
						echo '<td>'.$row['adate'].'</td>';
						echo '<td>'.$row['dtime'].'</td>';
						echo '<td>'.$row['atime'].'</td>';
						echo '<td>'.$row['ePrice'].'</td>';
						echo '<td>'.$row['fcPrice'].'</td>';
						echo '<td><button type="submit" name ="number" value="'.$row['number'].'">Book Flight '.$row['number'].'</button></td>';
						echo '<td><a href="../index.php">/View Map</a></td>';
						echo '</tr>';
						
						while($row2 = $statement2->fetch_assoc()) {
							if($row['atime'] < $row2['dtime']) {
								echo '<tr>';
								echo '<td>'.$row2['number'].'</td>';
								echo '<td>'.$row2['source'].'</td>';
								echo '<td>'.$row2['destination'].'</td>';
								echo '<td>'.$row2['ddate'].'</td>';
								echo '<td>'.$row2['adate'].'</td>';
								echo '<td>'.$row2['dtime'].'</td>';
								echo '<td>'.$row2['atime'].'</td>';
								echo '<td>'.$row2['ePrice'].'</td>';
								echo '<td>'.$row2['fcPrice'].'</td>';
								echo '<td><button type="submit" name ="number" value="'.$row2['number'].'">Book Flight '.$row2['number'].'</button></td>';
								echo '<td><a href="../index.php">/View Map</a></td>';
								echo '</tr>';
							}
						}
					}
				}	
            } else {
                echo 'No Available Flights';
            }
        } else {
                echo 'Error';
        }
	?>
	</table><br>
	
	<h2>Return Flights (Direct)</h2>
	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1500">
    <tr>
        <td>Flight Number</td>
		<td>Departure Destination</td>
        <td>Arrival Destination</td>
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
		$sort = $_POST['sort'];
		$roundtrip = $_POST['roundtrip'];
		$rdate = date('Y-m-d', strtotime($_POST['rdate']));
		
		if($sort == 0) {
			$instruction = "SELECT * FROM flight where source='".$destination."' AND destination='".$source."' AND ddate ='".$rdate."' ORDER BY ePrice";
		} else if($sort == 1) {
			$instruction = "SELECT * FROM flight where source='".$destination."' AND destination='".$source."' AND ddate ='".$rdate."' ORDER BY dTime";
		} else {
			$instruction = "SELECT * FROM flight where source='".$destination."' AND destination='".$source."' AND ddate ='".$rdate."' ORDER BY aTime";
		}
		$stmt = $mysqli->query($instruction);
        if($stmt) {
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
                echo 'Error';
        }

	?>
	</table><br>
	
	
		</table><br>
	
	<h2>Return Flights (Stops)</h2>
	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1500">
    <tr>
        <td>Flight Number</td>
		<td>Departure Destination</td>
        <td>Arrival Destination</td>
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
		$sort = $_POST['sort'];
		if($sort == 0) {
			$instruction = "SELECT * FROM flight where source='".$destination."' AND destination='".$source."' AND ddate ='".$rdate."' ORDER BY ePrice";
		} else if($sort == 1) {
			$instruction = "SELECT * FROM flight where source='".$destination."' AND destination='".$source."' AND ddate ='".$rdate."' ORDER BY dTime";
		} else {
			$instruction = "SELECT * FROM flight where source='".$destination."' AND destination='".$source."' AND ddate ='".$rdate."' ORDER BY aTime";
		}
		$stmt = $mysqli->query($instruction);
        if($stmt) {			
            if ($stmt->num_rows > 0) {
				while($row = $stmt->fetch_assoc()) {
					$instruction2 = "SELECT * FROM flight where source='".$row['destination']."' AND destination='".$source."' AND ddate ='".$rdate."' ORDER BY aTime";
					$statement2 = $mysqli->query($instruction2);
					if($statement2->num_rows > 0) {
						echo '<tr>';
						echo '<td>'.$row['number'].'</td>';
						echo '<td>'.$row['source'].'</td>';
						echo '<td>'.$row['destination'].'</td>';
						echo '<td>'.$row['ddate'].'</td>';
						echo '<td>'.$row['adate'].'</td>';
						echo '<td>'.$row['dtime'].'</td>';
						echo '<td>'.$row['atime'].'</td>';
						echo '<td>'.$row['ePrice'].'</td>';
						echo '<td>'.$row['fcPrice'].'</td>';
						echo '<td><button type="submit" name ="number" value="'.$row['number'].'">Book Flight '.$row['number'].'</button></td>';
						echo '<td><a href="../index.php">/View Map</a></td>';
						echo '</tr>';
						
						while($row2 = $statement2->fetch_assoc()) {
							if($row['atime'] < $row2['dtime']) {
								echo '<tr>';
								echo '<td>'.$row2['number'].'</td>';
								echo '<td>'.$row2['source'].'</td>';
								echo '<td>'.$row2['destination'].'</td>';
								echo '<td>'.$row2['ddate'].'</td>';
								echo '<td>'.$row2['adate'].'</td>';
								echo '<td>'.$row2['dtime'].'</td>';
								echo '<td>'.$row2['atime'].'</td>';
								echo '<td>'.$row2['ePrice'].'</td>';
								echo '<td>'.$row2['fcPrice'].'</td>';
								echo '<td><button type="submit" name ="number" value="'.$row2['number'].'">Book Flight '.$row2['number'].'</button></td>';
								echo '<td><a href="../index.php">/View Map</a></td>';
								echo '</tr>';
							}
						}
					}
				}	
            } else {
                echo 'No Available Flights';
            }
        } else {
                echo 'Error';
        }
	?>
	</table><br>
	
    </form>
</body>
</html>
