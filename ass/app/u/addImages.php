<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();

	$_SESSION['userid'] = 1;
}


require_once('../m/Connection.php');

$Conn = new Connection();

$pdo = $Conn->newConnection();

if(isset($_FILES['ifile'])) {
// Check for and save image file if exists ========================
	$caption = $_POST['icaption'];
	$unique = uniqid("LP", true);
	$unique = str_replace(".", "", $unique);
	$file = $_FILES['ifile'];
	$fileName = $_FILES['ifile']['name'];
	$fileTmpName = $_FILES['ifile']['tmp_name'];
	$fileSize = $_FILES['ifile']['size'];
	$fileError = $_FILES['ifile']['error'];
	$fileType = $_FILES['ifile']['type'];
	$fileExt = explode('.', $fileName);
	$fileActualExt = strtolower(end($fileExt));
	$allowed = array('jpg', 'jpeg', 'png');
	if (in_array($fileActualExt, $allowed)) {
		if ($fileError === 0) {
			if ($fileSize < 10000000) {
				$fileNameNew = $unique . '.' . $fileActualExt;
				$fileDestination = 'c:/wamp64/www/local-pages/ass/data/pics/' . $fileNameNew;
				$result = move_uploaded_file($fileTmpName, $fileDestination);
				if ($result===true) {
					$iFilename = $unique;
					$iCaption = $caption;
					$iExt = $fileActualExt;
					// create record and get id's
// *******************************************************************************************************************
					// Insert Image
					$sql = "INSERT INTO images (img_ind_id, img_filename, img_ext, img_caption, img_added, img_amended, img_changed_by) VALUES (:id, :filename, :ext, :caption, :added, :amended, :changed_by )";

					$stmt = $pdo->prepare($sql);

					//Bind our variables.
					$stmt->bindValue(':id', $id);
					$stmt->bindValue(':filename', $iFilename);
					$stmt->bindValue(':ext', $iExt);
					$stmt->bindValue(':caption', $iCaption);
					$stmt->bindValue(':added', $datetime);
					$stmt->bindValue(':amended', $datetime);
					$stmt->bindValue(':changed_by', $id);

					//Execute the statement and insert the new image.
					$stmt->execute();

					$iID = $pdo->lastInsertId();

				}
				else{
					$iError = 'There was an error uploading your file';
				}
			} else {
				$iError = 'Your file is too big!';
			}
		} else {
			$iError = 'There was an error uploading your file';
		}
	} else {
		$iError = 'You cannot upload files of this type!';
	}
} // done iFile
