<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

$name = $_POST['name'];
$class = $_POST['class'];
$flightNum = $_SESSION['flightNum'];
//$query = "SELECT ddate from flight where number= " . $flightNum;

//$stmtQuery = $mysqli->query($query);

//echo $query;



$identification = "" . htmlentities($_SESSION['username']) . "" ;

$stmt = $mysqli->prepare("INSERT INTO bookings (name, flightID, class, accountID) VALUES (?, ?, ?, ?)");
if($stmt) {
    $stmt->bind_param('ssss', $name, $flightNum, $class, $identification);
    $stmt->execute();
} else {
    echo 'Error Booking';
}

$insertValue = 0;
//if($class == "Economy") {
  //  $sql = "SELECT ePrice FROM flight WHERE number ='".$flightNum."'";
   // $insertValue = $mysqli->query($sql);
//} else {
  //  $sql = "SELECT fcPrice FROM flight WHERE number ='".$flightNum."'";
   // $insertValue = $mysqli->query($sql);
//}
 $sql = "SELECT fcPrice, ePrice FROM flight WHERE number ='".$flightNum."'";
    $insertValue = $mysqli->query($sql);


if ($insertValue->num_rows > 0) {
			// output data of each row
			
			while($row = $insertValue->fetch_assoc()) {
				if($class == "Economy") {
					$price = $row['ePrice'];
				} else {
					$price = $row['fcPrice'];
				}
				
				
			}
}

$statement = $mysqli->prepare("INSERT INTO reciepts (name, accountID, class, price) VALUES (?, ?, ?, ?)");
$statement->bind_param('sssi', $name, $identification, $class, $price);
$statement->execute();

$email = "" . htmlentities($_SESSION['username']) . "";

$message = "python ..\python\sendEmail.py \"{$email}\" \"Your Receipt\" \"You paid $" . $price . " for a ticket in " . $class . ".\"";
exec($message);

header("Location: ../pages/purchases.php");
exit();
 ?>