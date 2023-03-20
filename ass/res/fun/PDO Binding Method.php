<?php

$sql = "SELECT COUNT(ind_email) AS num FROM individuals WHERE ind_email = :email";
$stmt = $pdo->prepare($sql);

//Bind the provided username to our prepared statement.
$stmt->bindValue(':email', $email);

//Execute.
$stmt->execute();

//Fetch the row.
$row = $stmt->fetch(PDO::FETCH_ASSOC);

//If the provided username already exists - display error.
//TO ADD - Your own method of handling this error. For example purposes,
//I'm just going to kill the script completely, as error handling is outside
//the scope of this tutorial.

if ($row['num'] > 0) {
	die('That email already exists!');