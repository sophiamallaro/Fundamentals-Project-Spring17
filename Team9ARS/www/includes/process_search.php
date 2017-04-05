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

$fields = array('number', 'source', 'destination', 'ddate', 'adate', 'dtime');
$error = false;
$error_msg = "";

foreach($fields AS $fieldname) { //Loop trough each field
  if(!isset($_POST[$fieldname]) || empty($_POST[$fieldname])) {
   $error_msg .= '<p class="error">Invalid Departure Airport</p>';
 }
}
if (strlen($source) != 3) {
    $error_msg .= '<p class="error">Invalid Departure Airport</p>';
}
if (strlen($destination) != 3) {
    $error_msg .= '<p class="error">Invalid Arrival Airport</p>';
}
if($insertddate > $insertadate) {
    $error_msg .= '<p class="error">Arrival cannot occur before departure.</p>';
} else if($insertddate == $insertadate) {
    if($insertdtime > $insertatime) {
         $error_msg .= '<p class="error">Arrival cannot occur before departure.</p>';
    }
}
$prep_stmt = "SELECT * FROM flight WHERE number = ? LIMIT 1";
$stmt = $mysqli->prepare($prep_stmt);

// check if such a flight exists
if ($stmt) {
    $stmt->bind_param('s', $number);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 0) {
        // A user with this email address already exists
        $error_msg .= '<p class="error">No flight with this number exists.</p>';
                        $stmt->close();
    }
} else {
    $error_msg .= '<p class="error">Database error Line 39</p>';
         $stmt->close();
}

if(empty($error_msg)) {
    $stmt = $mysqli->prepare("UPDATE flight SET source = ?, destination = ?, ddate = ?, adate = ?, dtime = ?, atime = ?, frequency = ? WHERE number = ?");
    $stmt->bind_param('ssssssis',$source, $destination, $insertddate, $insertadate, $insertdtime, $insertatime, $frequency, $number);
    $stmt->execute();    // Execute the prepared sql.
    header('Location: ../pages/adminTools.html');
    exit();
}

 ?>
