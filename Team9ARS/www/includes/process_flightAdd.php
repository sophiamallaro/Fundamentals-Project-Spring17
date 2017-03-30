<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

$number = $_POST['number'];
$aircraft = $_POST['aircraft'];
$departingL = $_POST['departing airport'];
$arrivingL = $_POST['arrival airport'];
$departingD = $_POST['departure date'];
$departingT = $_POST['departure time'];
$arrivingD = $_POST['arrival date'];
$arrivalT = $_POST['arrival time'];


$stmt = $mysqli->prepare("INSERT INTO flights (number, aircraft, deporting airport, arrival airport, departure date, departure time, arrival date, arrival time) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param('si', $number, $aircraft, $deportingL, $arrivingL, $deportingD, $deportingT, $arrivingD, $arrivalT);
$stmt->execute();

header('Location: ../pages/addFlight.html');
exit();
 ?>