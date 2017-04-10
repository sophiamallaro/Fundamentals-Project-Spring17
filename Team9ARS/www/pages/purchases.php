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
	
	<?php		
		$emailTest = "SELECT purchaseDate, price, class,name FROM reciepts WHERE accountID = '" . htmlentities($_SESSION['username']) . "'";
		$stmt = $mysqli->query($emailTest);

		if ($stmt->num_rows > 0) {
			// output data of each row
			
			while($row = $stmt->fetch_assoc()) {
			
				echo 'Purchase Date: '.$row['purchaseDate'].'   '.'Price: $'.$row['price'].'   '.'Class: '.$row['class'].'   '.'Name: '.$row['name'].'</br>';
				
				//echo "Model: " . $row["model"]. "  -  Capacity: " . $row["capacity"]."<br>";
			}
		} else {
			echo "No purchases made";
		}
	?>

</body>
</html>