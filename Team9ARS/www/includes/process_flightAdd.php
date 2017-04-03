<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

$number = $_POST['number'];
$aircraft = $_POST['aircraft'];
$departingL = $_POST['departingL'];
$arrivingL = $_POST['arrivingL'];
$departingD = $_POST['departingD'];
$departingT = $_POST['departingT'];
$arrivingD = $_POST['arrivingD'];
$arrivingT = $_POST['arrivingT'];

$stmt = $mysqli->prepare("INSERT INTO flights (number, aircraft, departing airport, arrival airport, departure date, departure time, arrival date, arrival time) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param('sissssss', $number, $aircraft, $deportingL, $arrivingL, $deportingD, $deportingT, $arrivingD, $arrivingT);
$stmt->execute();

header('Location: ../pages/addFlight.html');
exit();
 ?>