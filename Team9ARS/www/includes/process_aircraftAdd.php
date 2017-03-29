<?php
include_once 'db_connect.php';
include_once 'functions.php';
 
sec_session_start(); // Our custom secure way of starting a PHP session.

$model = $_POST['model'];
$capacity = $_POST['capacity'];

$stmt = $mysqli->prepare("INSERT INTO aircrafts (model, capacity) VALUES (?, ?)");
$stmt->bind_param('si', $model, $capacity);
$stmt->execute();
 
header('Location: ../pages/addAircraft.html');
exit();
 ?>