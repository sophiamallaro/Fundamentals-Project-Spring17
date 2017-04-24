<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

$query1 = "SELECT bookingID from bookings WHERE flightID = '".$_POST['flightID']."' AND name = '".$_POST['name']."' AND accountID = '".$_POST['email']."'";
$stmt1 = $mysqli->query($query1);

$row = $stmt1->fetch_assoc();

$query2 = "INSERT INTO seating(flightID, bookingID, carryOn, numBags) VALUES('".$_POST['flightID']."', '".$row['bookingID']."', '".$_POST['carryOn']."', '".$_POST['quantity']."')";
$stmt2 = $mysqli->query($query2);

header("Location: ../pages/successfulCheckIn.html");
exit();
?>