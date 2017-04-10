<?php
include_once 'db_connect.php';
include_once 'functions.php';

sec_session_start(); // Our custom secure way of starting a PHP session.

ini_set("date.timezone", "America/New_York");

$number = $_POST['number'];

$prep_stmt = "SELECT * FROM flight WHERE number = ? LIMIT 1";
$stmt = $mysqli->prepare($prep_stmt);

// check if such a flight exists
if ($stmt) {
    $stmt->bind_param('s', $number);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 0) {

        $error_msg .= '<p class="error">No flight with this number exists.</p>';
                        $stmt->close();


    }
    else {
        $ps = "SELECT * FROM flight WHERE number = ? AND firstClass = 0 AND economy = 0 LIMIT 1";
        $st = $mysqli->prepare($ps);
        if($st) {
            $st->bind_param('s', $number);
            $st->execute();
            $st->store_result();

            if($st->num_rows==0) {
                $error_msg .= '<p class="error">This flight is booked and cannot be cancelled.</p>';
                $st->close();
            } else {
                $prep_statement = "DELETE FROM flight WHERE number = ?";
                  $statement = $mysqli->prepare($prep_statement);
                  if($statement) {
                            $statement->bind_param('s', $number);
                            $statement->execute();
                  } else {
                   $error_msg .= 'I AM NOT PREPARING PROPERLY';
                  }

            }

        }

    }

} else {
    $error_msg .= 'MAIN STATEMENT NOT PREPARING PROPERLY';

}

if(empty($error_msg)) {
    header('Location: ../pages/adminTools.php');
    exit();
} else {
    header('Location: ../pages/deleteFlight.html');
    exit();
}


 ?>
