<?php
include_once '../includes/register.inc.employee.php';
include_once '../includes/functions.php';
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
    <div style='float: left;'><a href="flightManagement.html">Back</a></div>
</head>
<body>
<h1>Add A Flight</h1>
<?php
        if (!empty($error_msg)) {
            echo $error_msg;
        }
    ?>
<form action="../includes/process_addFlight.php" method="post" name="test_form">
    Flight Number: <input type="text" name="number"><br>
    Departure City: <select name="source">
    <option value="ATL">ATL</option>
    <option value="CID">CID</option>
    <option value="JFK">JFK</option>
    <option value="ORD">ORD</option>
    <option value="SFO">SFO</option>
    </select><br>
    Arrival City: <select name="destination">
    <option value="ATL">ATL</option>
    <option value="CID">CID</option>
    <option value="JFK">JFK</option>
    <option value="ORD">ORD</option>
    <option value="SFO">SFO</option>
    </select><br>

    Departure Date: <input type="date" name="ddate"><br>
    Arrival Date: <input type="date" name="adate"><br>
    Departure Time: <input type="time" name="dtime"><br>
    Arrival Time: <input type="time" name="atime"><br>
    Frequency: <select name="frequency">
    <option value="0">One Time</option>
    <option value="1">Weekly</option>
    <option value="2">Monthly</option>
    </select><br>
    End Date: <input type="date" name="edate"><br>
    First Class Price: <input type="number" name="fcPrice"><br>
    Economy Price: <input type="number" name="ePrice"><br>
	
	<?php
		$stmt = $mysqli->query("SELECT aircraftID, model FROM aircrafts");
		
		if ($stmt->num_rows > 0) {
			// output data of each row
			echo '<select name="aircraftID">';
			
			while($row = $stmt->fetch_assoc()) {
				
				echo '<option value="'.$row['aircraftID'].'">'.$row['aircraftID']." ".$row['model'].'</option>';
				
				//echo "Model: " . $row["model"]. "  -  Capacity: " . $row["capacity"]."<br>";
			}
			echo "</select>";
		} else {
			echo "0 results";
		}
	?><br>
	
    <input type="submit" value="Add"><br>

</form>

</body>
</html>