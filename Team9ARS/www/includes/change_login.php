<?php
include_once 'db_connect.php';
include_once 'functions.php';
 
sec_session_start(); // Our custom secure way of starting a PHP session.
 
if (isset($_POST['newPassword'],$_POST['confPassword'],$_POST['p'])) {
	$password = filter_input(INPUT_POST, 'p', FILTER_SANITIZE_STRING);
	$password = password_hash($password, PASSWORD_BCRYPT);
	
	$emailUsername = $_SESSION['username'];
	
	$tempCheck = 0;
	
	$stmt = $mysqli->prepare("UPDATE loginCredentials SET Password = ?, tempPassword = ? WHERE EmailAddress = ?"); 
        $stmt->bind_param('sis', $password,$tempCheck,$emailUsername);
        $stmt->execute();    // Execute the prepared sql.
	
	header('Location: ../index.php');
	exit();
}
?>