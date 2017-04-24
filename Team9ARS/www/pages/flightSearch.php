<?php
include_once '../includes/register.inc.employee.php';
include_once '../includes/functions.php';
ini_set("date.timezone", "America/New_York");
include_once '../includes/db_connect.php';
 
sec_session_start();
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
    <h1>Results</h1>
	<h2>Direct Flights</h2>
	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1000">
    <tr>
        <td>Flight Number</td>
		<td>Departure Destination</td>
        <td>Arrival Destination</td>
        <td>Departure Date</td>
        <td>Arrival Date</td>
        <td>Departure Time</td>
        <td>Arrival Time</td>
        <td>Economy Price</td>
        <td>First Class Price</td>
    </tr>
	<?php
	    $source = $_POST['source'];
	    $destination = $_POST['destination'];
        $insertddate = date('Y-m-d', strtotime($_POST['ddate']));
		$sort = $_POST['sort'];
		
		if($sort == 0) {
			//$in = "SELECT * FROM flight ORDER BY ePrice";
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY ePrice";
		} else if($sort == 1) {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY dTime";
			//$in = "SELECT * FROM flight ORDER BY dtime";
			//$s = $mysqli->prepare($in);
			//$s->execute();
		} else {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY aTime";
			//$in = "SELECT * FROM flight ORDER BY atime";
			//$s = $mysqli->prepare($in);
			//$s->execute();
		}
		
        //$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."'";
		$stmt = $mysqli->query($instruction);
        if($stmt) {
            if ($stmt->num_rows > 0) {
                        while($row = $stmt->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>'.$row['number'].'</td>';
							echo '<td>'.$row['source'].'</td>';
							echo '<td>'.$row['destination'].'</td>';
                            echo '<td>'.$row['ddate'].'</td>';
                            echo '<td>'.$row['adate'].'</td>';
                            echo '<td>'.$row['dtime'].'</td>';
                            echo '<td>'.$row['atime'].'</td>';
                            echo '<td>'.$row['ePrice'].'</td>';
                            echo '<td>'.$row['fcPrice'].'</td>';
							echo '<td><button type="submit" name ="number" value="'.$row['number'].'">Book Flight '.$row['number'].'</button></td>';
							if (($source=='CID' or $destination =='CID') and ($source=='ATL' or $destination=='ATL'))
							{
								echo '<td><a href="mapCidAtl.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='JFK' or $destination=='JFK'))
							{
								echo '<td><a href="mapAtlJfk.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapAtlOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapAtlSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='JFK' or $destination=='JFK'))
							{
								echo '<td><a href="mapCidJfk.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapCidOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapCidSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='JFK' or $destination =='JFK') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapJfkOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='JFK' or $destination =='JFK') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapJfkSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ORD' or $destination =='ORD') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapOrdSfo.html" target="_blank">View Map</a></td>';
							}
                            echo '</tr>';
                        }
                        // echo "</select>";
            } else {
                echo 'No Available Flights';
            }
        } else {
                echo 'Error';
        }

	?>
	</table><br>
	
	<h2>First Leg</h2>
	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1000">
    <tr>
        <td>Flight Number</td>
        <td>Departure Date</td>
        <td>Arrival Date</td>
        <td>Departure Time</td>
        <td>Arrival Time</td>
        <td>Economy Price</td>
        <td>First Class Price</td>
    </tr>
		<?php
	    $source = $_POST['source'];
	    $destination = $_POST['destination'];
        $insertddate = date('Y-m-d', strtotime($_POST['ddate']));
		$sort = $_POST['sort'];
		
		if($sort == 0) {
			//$in = "SELECT * FROM flight ORDER BY ePrice";
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination!='".$destination."' AND ddate ='".$insertddate."' ORDER BY ePrice";
		} else if($sort == 1) {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination!='".$destination."' AND ddate ='".$insertddate."' ORDER BY dTime";
			//$in = "SELECT * FROM flight ORDER BY dtime";
			//$s = $mysqli->prepare($in);
			//$s->execute();
		} else {
			$instruction = "SELECT * FROM flight where source='".$source."' AND destination!='".$destination."' AND ddate ='".$insertddate."' ORDER BY aTime";
			//$in = "SELECT * FROM flight ORDER BY atime";
			//$s = $mysqli->prepare($in);
			//$s->execute();
		}
		
        //$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."'";
		$stmt = $mysqli->query($instruction);
        if($stmt) {
            if ($stmt->num_rows > 0) {
                        while($row = $stmt->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>'.$row['number'].'</td>';
							echo '<td>'.$row['source'].'</td>';
							echo '<td>'.$row['destination'].'</td>';
                            echo '<td>'.$row['ddate'].'</td>';
                            echo '<td>'.$row['adate'].'</td>';
                            echo '<td>'.$row['dtime'].'</td>';
                            echo '<td>'.$row['atime'].'</td>';
                            echo '<td>'.$row['ePrice'].'</td>';
                            echo '<td>'.$row['fcPrice'].'</td>';
							echo '<td><button type="submit" name ="number" value="'.$row['number'].'">Book Flight '.$row['number'].'</button></td>';
							if (($source=='CID' or $destination =='CID') and ($source=='ATL' or $destination=='ATL'))
							{
								echo '<td><a href="mapCidAtl.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='JFK' or $destination=='JFK'))
							{
								echo '<td><a href="mapAtlJfk.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapAtlOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapAtlSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='JFK' or $destination=='JFK'))
							{
								echo '<td><a href="mapCidJfk.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapCidOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapCidSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='JFK' or $destination =='JFK') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapJfkOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='JFK' or $destination =='JFK') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapJfkSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ORD' or $destination =='ORD') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapOrdSfo.html" target="_blank">View Map</a></td>';
							}
                            echo '</tr>';
                        }
                        // echo "</select>";
            } else {
                echo 'No Available Flights';
            }
        } else {
                echo 'Error';
        }

	?>
	</table><br>
	
	<h2>Second Leg</h2>
	<form action="booking.php" method="post"
	name="aircraft_form" id="aircraft_form">
    <table width="1000">
    <tr>
        <td>Flight Number</td>
        <td>Departure Date</td>
        <td>Arrival Date</td>
        <td>Departure Time</td>
        <td>Arrival Time</td>
        <td>Economy Price</td>
        <td>First Class Price</td>
    </tr>
		<?php
	    $source = $_POST['source'];
	    $destination = $_POST['destination'];
        $insertddate = date('Y-m-d', strtotime($_POST['ddate']));
		$sort = $_POST['sort'];
		
		if($sort == 0) {
			$instruction = "SELECT * FROM flight where source!='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY ePrice";
		} else if($sort == 1) {
			$instruction = "SELECT * FROM flight where source!='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY dTime";
		} else {
			$instruction = "SELECT * FROM flight where source!='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."' ORDER BY aTime";
		}
		
        //$instruction = "SELECT * FROM flight where source='".$source."' AND destination='".$destination."' AND ddate ='".$insertddate."'";
		$stmt = $mysqli->query($instruction);
        if($stmt) {
            if ($stmt->num_rows > 0) {
                        while($row = $stmt->fetch_assoc()) {
                            echo '<tr>';
                            echo '<td>'.$row['number'].'</td>';
							echo '<td>'.$row['source'].'</td>';
							echo '<td>'.$row['destination'].'</td>';
                            echo '<td>'.$row['ddate'].'</td>';
                            echo '<td>'.$row['adate'].'</td>';
                            echo '<td>'.$row['dtime'].'</td>';
                            echo '<td>'.$row['atime'].'</td>';
                            echo '<td>'.$row['ePrice'].'</td>';
                            echo '<td>'.$row['fcPrice'].'</td>';
							echo '<td><button type="submit" name ="number" value="'.$row['number'].'">Book Flight '.$row['number'].'</button></td>';
							if (($source=='CID' or $destination =='CID') and ($source=='ATL' or $destination=='ATL'))
							{
								echo '<td><a href="mapCidAtl.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='JFK' or $destination=='JFK'))
							{
								echo '<td><a href="mapAtlJfk.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapAtlOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ATL' or $destination =='ATL') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapAtlSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='JFK' or $destination=='JFK'))
							{
								echo '<td><a href="mapCidJfk.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapCidOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='CID' or $destination =='CID') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapCidSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='JFK' or $destination =='JFK') and ($source=='ORD' or $destination=='ORD'))
							{
								echo '<td><a href="mapJfkOrd.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='JFK' or $destination =='JFK') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapJfkSfo.html" target="_blank">View Map</a></td>';
							}
							else if(($source=='ORD' or $destination =='ORD') and ($source=='SFO' or $destination=='SFO'))
							{
								echo '<td><a href="mapOrdSfo.html" target="_blank">View Map</a></td>';
							}
							
                            echo '</tr>';
                        }
                        // echo "</select>";
            } else {
                echo 'No Available Flights';
            }
        } else {
                echo 'Error';
        }

	?>
	</table><br>
	

    </form>
</body>
</html>
