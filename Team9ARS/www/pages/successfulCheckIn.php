<?php
include_once '../includes/db_connect.php';
include_once '../includes/functions.php';
 
sec_session_start();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.4;}
    </style>
    <meta charset="UTF-8">
    <title>Success!</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
	<h1>Check In Successful!</h1>
	
	<div id ="boarding"><h2><u>Boarding Pass</u></h2>
	
	<b>Date of Creation:</b><p id="date"></p>
	<b>Name:</b><?php $_POST['name'] ?><br>
	<b>Flight ID:</b><?php echo $_POST['flightID']; ?><br>
	<b>Source:</b><br>
	<b>Destination:</b><br>
	<b>Departure Time:</b><br>
	<b>Arrival Time:</b><br>
	<b>Class:</b><br>
	<b>Seating Number:</b><br>
	<b>Number of Bags:</b><?php echo $_POST['quantity']; ?><br>
	<b>Carry On:</b><?php echo $_POST['carryOn']; ?><br>
	
	</div>
	<br>
	<button onclick="myFunction()">Print this Boarding Pass</button>

<script>
function myFunction() {
    var prtContent = document.getElementById("boarding");
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write(prtContent.innerHTML);
	WinPrint.document.close();
	WinPrint.focus();
	WinPrint.print();
	WinPrint.close();
}

document.getElementById("date").innerHTML = Date();
</script>

</body>
</html>