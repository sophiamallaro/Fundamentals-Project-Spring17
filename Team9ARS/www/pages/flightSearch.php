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
<h1>Search Flights</h1>
<?php
        if (!empty($error_msg)) {
            echo $error_msg;
        }
    ?>
<form action="../includes/process_search.php" method="post" name="test_form">
    From: <input type="text" name="source">
    To: <input type="text" name="destination"><br>
    Departure Date: <input type="date" name="ddate"><br>
    Return Date: <input type="date" name="adate"><br>
    <input type="submit" value="Search"><br>

</form>

<table>
    <thead>
    <tr>
        <td>From</td>
        <td>To</td>
        <td>Departure Date</td>
        <td>Arrival Date</td>
    </tr>
    </thead>
    <tbody>
    <?php
            $connect = mysql_connect("localhost","root", "root");
            if (!$connect) {
                die(mysql_error());
            }
            mysql_select_db("apploymentdevs");
            $results = mysql_query("SELECT * FROM demo LIMIT 10");
            while($row = mysql_fetch_array($results)) {
            ?>
    <tr>
        <td><?php echo $row['Id']?></td>
        <td><?php echo $row['Name']?></td>
    </tr>

    <?php
            }
            ?>
    </tbody>
</table>
</body>
</html>


</body>
</html>