<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

if (isset($_POST['email'],$_POST['name'],$_POST['num'])) 
{
	$email = "'".$_POST['email']."'";
	$name = "'".$_POST['name']."'";
	$num = "'".$_POST['num']."'";
	$cancel = "1";
	
	$query = "UPDATE bookings SET Cancellation = ".$cancel." WHERE accountID = ".$email." AND name = ".$name." AND flightID =".$num." ";

	$result = $mysqli->query($query);
	
	//$stmt = $mysqli->prepare("UPDATE bookings SET Cancellation = ? WHERE accountID = ? AND name = ? AND flightID = ?"); 
	//$stmt->bind_param('isss', $cancel, $email, $name, $num);
    //$stmt->execute();    // Execute the prepared sql.	
	$message = "Successfully cancelled ticket. Redirecting in 5 seconds";
}
else
{
	$message = "Input Error, couldn't cancel ticket. Redirecting in 5 seconds";
}
header('Refresh:5; url=../pages/managerTools.html');
echo $message;
?>
