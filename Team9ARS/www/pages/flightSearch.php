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
</head>
<body>
    <h1>Search Flights</h1>

	<form action="../includes/process_search.php" method="post"
	name="aircraft_form" id="aircraft_form">

	<?php
		$stmt = $mysqli->query("SELECT * FROM flight");

        if ($stmt->num_rows > 0) {
            while($row = $stmt->fetch_assoc()) {

                echo '<tr>';
                '<td>'.$row['number'].'</td>';
                '<td>'.$row['ddate'].'</td>';
                '<td>'.$row['adate'].'</td>';
                '<td>'.$row['dtime'].'</td>';
                '<td>'.$row['atime'].'</td>';
                '<td>'.$row['ePrice'].'</td>';
                '<td>'.$row['fcPrice'].'</td>';

                echo '</tr>';
                }
                       // echo "</select>";
        } else {
            echo 'I am not working.';
        }

	?>
            <input type="submit"
                   value="Book" />
    </form>

</body>
</html>
