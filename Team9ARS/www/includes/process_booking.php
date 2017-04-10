<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

$name = $_POST['name'];
$class = $_POST['class'];

$flightNum = $_SESSION['flightNum'];

$identification = htmlentities($_SESSION['username']) ;


$stmt = $mysqli->prepare("INSERT INTO bookings (name, flightID, class) VALUES (?, ?, ?)");
if($stmt) {
    echo $name;
    echo $flightNum;
    echo $class;
    $stmt->bind_param('sss', $name, $flightNum, $class);
    $stmt->execute();
} else {
    echo 'Error Booking';
}


$insertValue = 0;
if($class == "Economy") {
    $sql = "SELECT ePrice FROM  WHERE flight =".$flightNum;
    $insertValue = $mysqli->query($sql);
} else {
    $sql = "SELECT fcPrice FROM  WHERE flight =".$flightNum;
    $insertValue = $mysqli->query($sql);
}

//$statement = $mysqli->prepare("INSERT INTO reciepts (name, accountID, class) VALUES (?, ?, ?)");
//$statement->bind_param('sss', $name, $identification, $class);
//$statement->execute();

echo 'Successful Purchase!';
exit();
 ?>