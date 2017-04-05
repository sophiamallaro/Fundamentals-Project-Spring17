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
$fcPrice = $_POST['fcPrice'];
$ePrice = $_POST['ePrice'];
$fields = array('number', 'source', 'destination', 'ddate', 'adate', 'dtime', 'fcPrice', 'ePrice');
$error = false;
$error_msg = "";

foreach($fields AS $fieldname) {
  if(!isset($_POST[$fieldname]) || empty($_POST[$fieldname])) {
   $error_msg .= '<p class="error">Invalid Departure Airport</p>';
 }
}
if ($source == $destination ) {
    $error_msg .= '<p class="error">Departure and destination airports cannot be the same. </p>';
}
if($insertddate > $insertadate) {
    $error_msg .= '<p class="error">Arrival cannot occur before departure.</p>';
} else if($insertddate == $insertadate) {
    if($insertdtime > $insertatime) {
         $error_msg .= '<p class="error">Arrival cannot occur before departure.</p>';
    }
}
if(empty($error_msg)) {
    $stmt = $mysqli->prepare("INSERT INTO flight (number, source, destination, ddate, adate, dtime, atime, frequency, fcPrice, ePrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param('sssssssiii', $number, $source, $destination, $insertddate, $insertadate, $insertdtime, $insertatime, $frequency, $fcPrice, $ePrice);
    $stmt->execute();
    header('Location: ../pages/adminTools.html');
    exit();
}

?>