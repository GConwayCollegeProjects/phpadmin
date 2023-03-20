<?php
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}

if(isset($_POST['userid'])) {
	$userid = $_POST['userid'];
	$filelabel = $_POST['filelabel'];
	$unique = uniqid("LP", true);
	$unique = str_replace(".", "", $unique);
	echo $unique."<br><br>";
	$file = $_FILES['ifile'];
	$fileName = $_FILES['ifile']['name'];
	echo $fileName."<br><br>";
	$fileTmpName = $_FILES['ifile']['tmp_name'];
	echo $fileTmpName."<br><br>";
	$fileSize = $_FILES['ifile']['size'];
	$fileError = $_FILES['ifile']['error'];
	$fileType = $_FILES['ifile']['type'];

	$fileExt = explode('.', $fileName);
	$fileActualExt = strtolower(end($fileExt));
	$allowed = array('jpg', 'jpeg', 'png' );
	if(in_array($fileActualExt, $allowed)){
		echo "allowed";
		if ($fileError === 0) {
			if ($fileSize <10000000){
				$fileNameNew = $unique.'.'.$fileActualExt;
				$fileDestination = 'c:/wamp64/www/local-pages/ass/data/pics/'.$fileNameNew;
				echo $fileTmpName."<br><br>";
				echo $fileDestination."<br><br>";
				$result = move_uploaded_file($fileTmpName, $fileDestination);
				echo $result;
				//header('Refresh: 3; url=../../home.php');
			} else {
				echo 'Your file is too big!';
			}
		} else {
			echo 'There was an error uploading your file';
		}
	} else{
		echo 'You cannot upload files of this type!';
	}
	echo "finished";
}


