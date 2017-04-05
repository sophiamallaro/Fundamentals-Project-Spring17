<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

ini_set("date.timezone", "America/New_York");

$number = $_POST['number'];
$source = $_POST['source'];
$destination = $_POST['destination'];
$insertddate = date('Y-m-d', strtotime($_POST['ddate']));
$insertadate = date('Y-m-d', strtotime($_POST['adate']));
$insertdtime = $_POST['dtime'];
$insertatime = $_POST['atime'];
$frequency = $_POST['frequency'];

$stmt = $mysqli->prepare("INSERT INTO flight (number, source, destination, ddate, adate, dtime, atime, frequency) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param('sssssssi', $number, $source, $destination, $insertddate, $insertadate, $insertdtime, $insertatime, $frequency);
$stmt->execute();

header('Location: ../pages/addFlight.html');
exit();
 ?>
