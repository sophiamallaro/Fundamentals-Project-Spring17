<?php
include_once 'db_connect.php';
include_once 'functions.php';
 
sec_session_start(); // Our custom secure way of starting a PHP session.
 
if (isset($_POST['email'], $_POST['p'])) {
    $email = $_POST['email'];
    $password = $_POST['p']; // The hashed password.
	
	$loginSuccess = login($email, $password, $mysqli);
 
	if ($loginSuccess == true && $_SESSION['accountType'] == 'Admin'){
		//admin login
		if ($_SESSION['tempPassword'] == 0){
			header('Location: ../pages/adminTools.php');
		}
		else {
			header('Location: ../pages/tempLogin.php');
		}
		exit();
	}
    else if ($loginSuccess == true && $_SESSION['accountType'] == 'Manager') {
        //manager login
		if ($_SESSION['tempPassword'] == 0){
			header('Location: ../pages/managerTools.html');
		}
		else{
			header('Location: ../pages/tempLogin.php');
		}
		exit();
    } 
	else if($loginSuccess == true){
		header('Location: ../index.php');
		exit();
	}
	else {
        // Login failed 
        header('Location: ../pages/login.php?error=1');
		exit();
    }
} else {
    // The correct POST variables were not sent to this page. 
    echo 'Invalid Request';
}
?>