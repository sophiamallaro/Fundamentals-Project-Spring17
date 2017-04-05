<?php
include_once '../includes/register.inc.employee.php';
include_once '../includes/functions.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {background-color: powderblue;text-align: center;line-height: 1.4;}
    </style>
    <meta charset="UTF-8">
    <title>Create Add Flight</title>
    <div style='float: right;'><a href="../index.php">Home</a></div>
</head>
<body>
<h1>Add A Flight</h1>
<?php
        if (!empty($error_msg)) {
            echo $error_msg;
        }
    ?>
<form action="../includes/process_addFlight.php" method="post" name="test_form">
    Flight Number: <input type="text" name="number"><br>
    Departure City: <select name="source">
    <option value="ATL">ATL</option>
    <option value="CID">CID</option>
    <option value="JFK">JFK</option>
    <option value="ORD">ORD</option>
    <option value="SFO">SFO</option>
    </select><br>
    Arrival City: <select name="destination">
    <option value="ATL">ATL</option>
    <option value="CID">CID</option>
    <option value="JFK">JFK</option>
    <option value="ORD">ORD</option>
    <option value="SFO">SFO</option>
    </select><br>

    Departure Date: <input type="date" name="ddate"><br>
    Arrival Date: <input type="date" name="adate"><br>
    Departure Time: <input type="time" name="dtime"><br>
    Arrival Time: <input type="time" name="atime"><br>
    Frequency: <select name="frequency">
    <option value="0">One Time</option>
    <option value="1">Weekly</option>
    <option value="2">Monthly</option>
    </select><br>
    First Class Price: <input type="integer" name="fcPrice"><br>
    Economy Price: <input type="integer" name="ePrice"><br>
    <input type="submit" value="Add"><br>

</form>


</body>
</html>