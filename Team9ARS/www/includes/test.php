<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

$Fname = $_POST['Fname'];
$Lname = $_POST['Lname'];

$stmt = $mysqli->prepare("INSERT INTO test (Fname,Lname) VALUES (?,?)");
$stmt->bind_param('si', $Fname, $Lname);
$stmt->execute();

header('Location: ../pages/addFlight.html');
exit();
 ?>