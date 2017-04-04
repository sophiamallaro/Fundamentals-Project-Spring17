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
    <title>Cancel an aircraft</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
    <h1>Cancel an aircraft</h1>
	
	<form action="../includes/process_aircraftCancel.php" method="post" 
	name="aircraft_form" id="aircraft_form">
	
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
	?>
            <input type="submit" 
                   value="Delete" /> 
    </form>
	
</body>
</html>