<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';
 
sec_session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.8;}
    </style>
    <meta charset="UTF-8">
    <title>Account Information</title>
	<div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
	<h1>Purchase History</h1>
	
	<table width="1000">
	<tr>
        <td>Purchase Date</td>
        <td>Price</td>
        <td>Class</td>
        <td>Name</td>
    </tr>
	<?php		
		$emailTest = "SELECT purchaseDate, price, class,name FROM reciepts WHERE accountID = '" . htmlentities($_SESSION['username']) . "'";
		$stmt = $mysqli->query($emailTest);

		if ($stmt->num_rows > 0) {
			// output data of each row
			
			while($row = $stmt->fetch_assoc()) {
				echo '<tr>';
				echo '<td>'.$row['purchaseDate'].'</td>';
				echo '<td>$'.$row['price'].'</td>';
				echo '<td>'.$row['class'].'</td>';
				echo '<td>'.$row['name'].'</td>';
				echo '</tr>';
				
				//echo "Model: " . $row["model"]. "  -  Capacity: " . $row["capacity"]."<br>";
			}
		} else {
			echo "No purchases made";
		}
	?>
	</table>
</body>
</html>