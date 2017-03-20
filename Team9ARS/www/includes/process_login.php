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
		header('Location: ../pages/adminTools.php');
		exit();
	}
    else if ($loginSuccess == true && $_SESSION['accountType'] == 'Manager') {
        //manager login 
        header('Location: ../pages/managerTools.html');
		exit();
    } 
	else if($loginSuccess == true){
		header('Location: ../pages/protected_page.php');
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