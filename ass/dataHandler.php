<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}



	if(!isset($_POST['ifile'])) {
		echo "Failed to post details correctly";
		// Update errors log =======================================
	}
	else
	{
		$iFilename = "";
		$iCaption = "";
		$iError = "";
		$vFilename = "";
		$vCaption = "";
		$vError = "";
		$pFilename = "";
		$pCaption = "";
		$pError = "";
		$url = "";
		$uCaption = "";
		$uError = "";

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
			echo $iFilename;
		} // done iFile
		else{
			$iError = "File not found";
			echo $iError;
		}



































	}
