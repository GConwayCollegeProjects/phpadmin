<?php


	require_once('../m/Connection.php');

	$Conn = new Connection();

	$pdo = $Conn->newConnection();

	$field1 = 'img_filename';
	$field2 = 'img_ext';
	$field3 = 'img_caption';

// create record and get id


	$fullname = 'LP5ef5d94d40f30361797005.jpg';
	$end = strpos($fullname, '.');
	$filename = substr($fullname, 0, $end );
	echo $filename;
	$sql = "SELECT img_caption FROM images where img_filename = '$filename' LIMIT 1";
	try {
		$stmt = $pdo->prepare("$sql");
		$stmt->execute();

		$result = $stmt->fetch();
		$stmt = null;
		$conn = null;

		echo $result[0];

	} catch (PDOException $e) {
		$error = $e->getMessage();
	}




