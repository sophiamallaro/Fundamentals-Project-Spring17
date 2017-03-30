<?php
include_once 'db_connect.php';
include_once 'psl-config.php';
include_once 'functions.php';

$error_msg = "";

if (isset($_POST['email'], $_POST['p'])) {

    if (empty($error_msg)) {

        // Create hashed password using the password_hash function.
        // This function salts it with a random salt and can be verified with
        // the password_verify function.

        $password = password_hash($password, PASSWORD_BCRYPT);

        // Insert the new user into the database
        if ($insert_stmt = $mysqli->prepare("INSERT INTO loginCredentials (EmailAddress, Password, tempPassword) VALUES (?, ?, ?)")) {
            $insert_stmt->bind_param('ssi', $email, $password, 0);
            // Execute the prepared query.
            if (! $insert_stmt->execute()) {
                header('Location: ../error.php?err=Registration failure: INSERT');
            }
        }
		$message = "python ..\python\sendEmail.py \"{$email}\" \"Welcome to Team9ARS!\" \"Thank you for registering an account. You are now able to book flights. Here is your Username: {$email}. Don't forget your password!\"";
		//console_log($message);

		// Windows usage only??
		exec($message);
        header('Location: ./register_success.php');
    }
}
?>