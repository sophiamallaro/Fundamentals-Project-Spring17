<?php
include_once 'includes/db_connect.php';
include_once 'includes/functions.php';
 
sec_session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.8;}
    </style>
    <meta charset="UTF-8">
    <title>Home</title>
    
    <?php
	if (login_check($mysqli) == false){
		echo "<div style='float: right;'><a href='/pages/login.php'>Log In</a></div><br>";
	} 		
	if (login_check($mysqli) == true && $_SESSION['accountType'] == 'Admin') {
		echo "<div style='float: right;'><a href='/pages/adminTools.php'>Administrator Tools</a></div><br>";
	}
	else if (login_check($mysqli) == true && $_SESSION['accountType'] == 'Manager') {
		echo "<div style='float: right;'><a href='/pages/managerTools.html'>Manager Tools</a></div><br>";
    }
	else if (login_check($mysqli) == true){
		echo "<div style='float: right;'><a href='pages/userInfo.html'>Account Information</a></div><br>";
	}
	if (login_check($mysqli) == true){
		echo "<div style='float: right;'><a href='pages/logout.php'>Log out</a></div><br>";
	} 
	?>
	
</head>

<body>
    <div style="font-size: 250%"></div><h1>Iowa Air</h1></div>
    <span class="center"><img src="/styles/travel-industry-air.jpg"></span>
    <div style="font-size:200%"><a href="/pages/searchResults.html">Search Flights</a></div>

</body>


</html>