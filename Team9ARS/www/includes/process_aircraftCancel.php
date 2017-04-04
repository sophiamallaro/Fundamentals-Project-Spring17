<?php
include_once 'db_connect.php';
include_once 'functions.php';
 
sec_session_start(); // Our custom secure way of starting a PHP session.

$aircraftID = $_POST['aircraftID'];

$sql = "DELETE FROM aircrafts WHERE aircraftID = " . $aircraftID;

$stmt = $mysqli->query($sql);
 
header('Location: ../pages/cancelAircraft.php');
exit();
 ?>