<?php
include_once 'db_connect.php';
include_once 'functions.php';
 
sec_session_start(); // Our custom secure way of starting a PHP session.

$model = $_POST['model'];
$econCapacity = $_POST['econCapacity'];
$firstClassCapacity = $_POST['firstClassCapacity'];

$stmt = $mysqli->prepare("INSERT INTO aircrafts (model, econCapacity, firstClassCapacity) VALUES (?, ?, ?)");
$stmt->bind_param('sii', $model, $econCapacity, $firstClassCapacity);
$stmt->execute();
 
header('Location: ../pages/addAircraft.html');
exit();
 ?>