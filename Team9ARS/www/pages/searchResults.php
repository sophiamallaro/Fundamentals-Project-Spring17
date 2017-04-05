<?php
    include_once '../includes/register.inc.employee.php';
    include_once '../includes/functions.php';
    sec_session_start(); // Our custom secure way of starting a PHP session.
    ini_set("date.timezone", "America/New_York");
?>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.6;text-alight:left;}
    </style>
    <meta charset="UTF-8">
    <title>Flight Search</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
<form action="searchResults.php" method="post" name="test_form">
    <h1>Flight Search</h1>
        Departure City: <select name="source">
        <option value="ATL">ATL</option>
        <option value="CID">CID</option>
        <option value="JFK">JFK</option>
        <option value="ORD">ORD</option>
        <option value="SFO">SFO</option>
        </select>
        Arrival City: <select name="destination">
        <option value="ATL">ATL</option>
        <option value="CID">CID</option>
        <option value="JFK">JFK</option>
        <option value="ORD">ORD</option>
        <option value="SFO">SFO</option>
        </select><br>
        Departure Date: <input type="date" name="Departure">
        <input type="submit" value="Find Flights"><br>
</form>
</body>
<?php
    header('Location: ../pages/searchResults.php');
    exit();
?>
</html>