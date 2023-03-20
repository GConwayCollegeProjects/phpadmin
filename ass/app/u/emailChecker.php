<?php

// retrieve the email entry  to test passed from js
$email =($_POST['val']);



// check if valid email address
//convert to lower case and remove spaces

$email =str_replace(' ','',strtolower($email));
$valid ="false";
// check validity of format
if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
// define sql
	$sql = "SELECT COUNT(ind_email) AS num FROM individuals WHERE ind_email = :email";
// get database connection
	require_once('../m/Connection.php');

	$Conn = new Connection();

	$pdo = $Conn->newConnection();

// prepare pdo
	$stmt = $pdo->prepare($sql);

//Bind the provided email entry to our prepared statement.
	$stmt->bindValue(':email', $email);

//Execute.
	$stmt->execute();

//Fetch the row.
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
// check for existing entries
	if ($row['num'] < 1) {
		$valid = "true";
	}
}

	$array = array($email, $valid);

	echo json_encode($array);
