<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

ini_set("date.timezone", "America/New_York");

$source = $_POST['source'];
$destination = $_POST['destination'];
$insertddate = date('Y-m-d', strtotime($_POST['ddate']));
$insertadate = date('Y-m-d', strtotime($_POST['adate']));
$insertdtime = $_POST['dtime'];
$insertatime = $_POST['atime'];
$frequency = $_POST['frequency'];
$fcPrice = $_POST['fcPrice'];
$ePrice = $_POST['ePrice'];
$fields = array('source', 'destination', 'ddate', 'adate', 'dtime', 'fcPrice', 'ePrice');
$edate = date('Y-m-d', strtotime($_POST['edate']));
$error = false;
$error_msg = "";

foreach($fields AS $fieldname) {
  if(!isset($_POST[$fieldname]) || empty($_POST[$fieldname])) {
    $error_msg .= '<p class="error">Error: Incomplete Form</p>';
 }
}
if ($source == $destination ) {
    $error_msg .= '<p class="error">Error: Source and Destination cannot be the same.</p>';
}
if($insertddate > $insertadate) {
    $error_msg .= '<p class="error">Error: Invalid Date/Time</p>';
} else if($insertddate == $insertadate) {
    if($insertdtime > $insertatime) {
        $error_msg .= '<p class="error">Error: Invalid Date/Time</p>';
    }
}
if(empty($error_msg)) {
	$aircraftID = $_POST['aircraftID'];
	$stmt = $mysqli->prepare("INSERT INTO flight (source, destination, ddate, adate, dtime, atime, frequency, fcPrice, ePrice, aircraftID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
   		 $stmt->bind_param('ssssssiiii', $source, $destination, $insertddate, $insertadate, $insertdtime, $insertatime, $frequency, $fcPrice, $ePrice, $aircraftID);
   		 $stmt->execute();
	if($frequency == 1) {
		$insertddate2 = $insertddate;
		$insertadate2 = $insertadate;
		do {
				$insertddate2 = date('Y-m-d', strtotime($insertddate2 . '+7 days'));
				$insertadate2 = date('Y-m-d', strtotime($insertadate2 . '+7 days'));
				$stmt = $mysqli->prepare("INSERT INTO flight (source, destination, ddate, adate, dtime, atime, frequency, fcPrice, ePrice, aircraftID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				$stmt->bind_param('ssssssiiii', $source, $destination, $insertddate2, $insertadate2, $insertdtime, $insertatime, $frequency, $fcPrice, $ePrice, $aircraftID);
				$stmt->execute();
         	} while ( $insertddate2 < $edate);
	} else if ($frequency == 2){
		$insertddate2 = $insertddate;
		$insertadate2 = $insertadate;
		do {
				$insertddate2 = date('Y-m-d', strtotime($insertddate2 . '+1 month'));
				$insertadate2 = date('Y-m-d', strtotime($insertadate2 . '+1 month'));
				$stmt = $mysqli->prepare("INSERT INTO flight (source, destination, ddate, adate, dtime, atime, frequency, fcPrice, ePrice, aircraftID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				$stmt->bind_param('ssssssiiii', $source, $destination, $insertddate2, $insertadate2, $insertdtime, $insertatime, $frequency, $fcPrice, $ePrice, $aircraftID);
				$stmt->execute();
         	} while( $insertddate2 < $edate);
	}

    header('Location: ../pages/adminTools.php');
    exit();
} else {
    header('Location: ../pages/addFlight.php');
    exit();
}
?>