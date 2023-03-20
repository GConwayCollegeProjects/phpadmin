<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}



	if(!isset($_POST['submit'])) {
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
		} // done iFile

		if(isset($_FILES['vfile'])) {
// Check for and save video file if exists ========================		
			$caption = $_POST['vcaption'];
			$unique = uniqid("LP", true);
			$unique = str_replace(".", "", $unique);
			$file = $_FILES['vfile'];
			$fileName = $_FILES['vfile']['name'];
			$fileTmpName = $_FILES['vfile']['tmp_name'];
			$fileSize = $_FILES['vfile']['size'];
			$fileError = $_FILES['vfile']['error'];
			$fileType = $_FILES['vfile']['type'];
			$fileExt = explode('.', $fileName);
			$fileActualExt = strtolower(end($fileExt));
			$allowed = array('mp3', 'mp4');
			if (in_array($fileActualExt, $allowed)) {
				if ($fileError === 0) {
					if ($fileSize < 10000000) {
						$fileNameNew = $unique . '.' . $fileActualExt;
						$fileDestination = 'c:/wamp64/www/local-pages/ass/data/vids/' . $fileNameNew;
						$result = move_uploaded_file($fileTmpName, $fileDestination);
						if ($result===true) {
							$vFilename = $unique;
							$vCaption = $caption;
						}
					} else {
						$vError = 'Your file is too big!';
					}
				} else {
					$vError = 'There was an error uploading your file';
				}
			} else {
				$vError = 'You cannot upload files of this type!';
			}
		} // done vFile

		if(isset($_FILES['pfile'])) {
// Check for and save PDF file if exists ========================
			$caption = $_POST['pcaption'];
			$unique = uniqid("LP", true);
			$unique = str_replace(".", "", $unique);
			$file = $_FILES['pfile'];
			$fileName = $_FILES['pfile']['name'];
			$fileTmpName = $_FILES['pfile']['tmp_name'];
			$fileSize = $_FILES['pfile']['size'];
			$fileError = $_FILES['pfile']['error'];
			$fileType = $_FILES['pfile']['type'];
			$fileExt = explode('.', $fileName);
			$fileActualExt = strtolower(end($fileExt));
			$allowed ='pdf';
			if ($fileActualExt===$allowed) {
				if ($fileError === 0) {
					if ($fileSize < 10000000) {
						$fileNameNew = $unique . '.' . $fileActualExt;
						$fileDestination = 'c:/wamp64/www/local-pages/ass/data/pdfs/' . $fileNameNew;
						$result = move_uploaded_file($fileTmpName, $fileDestination);
						if ($result===true) {
							$pFilename = $unique;
							$pCaption = $caption;
						}
					} else {
						$pError = 'Your file is too big!';
					}
				} else {
					$pError = 'There was an error uploading your file';
				}
			} else {
				$pError = 'You cannot upload files of this type!';
			}
		} // done pFile

		if(isset($_POST['url'])) {
// Validate and Save URL link ===========================================================

			$url = $_POST['url'];
			$uCaption = $_POST['ucaption'];
		}































	}
