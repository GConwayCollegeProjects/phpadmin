<?php

// retrieve the name to test passed from js
$screen =($_POST['val']);
//prepare sql statement
$sql = "SELECT count(ind_screen) AS num FROM individuals WHERE ind_screen = :screen";
//make database connection
require_once('../m/Connection.php');

$Conn = new Connection();

$pdo = $Conn->newConnection();

// Prepare pdo

$stmt = $pdo->prepare($sql);

//Bind the provided screen name to test to our prepared statement.

$stmt->bindValue(':screen', $screen);

//Execute.
$stmt->execute();

//Fetch the row.
$row = $stmt->fetch(PDO::FETCH_ASSOC);

// If screen name exists return error

$screen ="false";

if ($row['num'] > 0) {

	$screen="true";
}

echo json_encode($screen);