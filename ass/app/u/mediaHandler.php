<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}

	$datetime = date('Y-m-d H:i:s');


	if(!isset($_POST['submit'])) {
		echo "<div>Failed to post details correctly</div>";
		// Update errors log =======================================
	}
	else {
		$type = $_POST['type'];
		switch ($type) {
			case "i":
				$allowed = array('jpg', 'jpeg', 'png');
				$fileLimit = 10000000;
				$fileDestination = 'c:/wamp64/www/cohortadmin/ass/data/pics/';
				$sql = "INSERT INTO images (img_ind_id, img_filename, img_ext, img_caption, img_added, img_amended, img_changed_by) VALUES (:id, :filename, :ext, :caption, :added, :amended, :changed_by )";
				break;
			case "v":
				$allowed = array('mp3', 'mp4');
				$fileLimit = 100000000;
				$fileDestination = 'c:/wamp64/www/cohortadmin/ass/data/vids/';
				$sql = "INSERT INTO videos (vid_ind_id, vid_filename, vid_ext, vid_caption, vid_added, vid_amended, vid_changed_by) VALUES (:id, :filename, :ext, :caption, :added, :amended, :changed_by )";
				break;
			case "p":
				$allowed = array('pdf');
				$fileLimit = 10000000;
				$fileDestination = 'c:/wamp64/www/cohortadmin/ass/data/pdfs/';
				$sql = "INSERT INTO pdfs (pdf_ind_id, pdf_filename, pdf_ext, pdf_caption, pdf_added, pdf_amended, pdf_changed_by) VALUES (:id, :filename, :ext, :caption, :added, :amended, :changed_by )";
				break;
			case "u":
				$allowed = array('pdf');
				$fileLimit = 10000000;
				$fileDestination = 'c:/wamp64/www/cohortadmin/ass/data/pdfs/';
				$sql = "INSERT INTO pdfs (pdf_ind_id, pdf_filename, pdf_ext, pdf_caption, pdf_added, pdf_amended, pdf_changed_by) VALUES (:id, :filename, :ext, :caption, :added, :amended, :changed_by )";
				break;
		}
		require_once('../m/Connection.php');

		$Conn = new Connection();

		$pdo = $Conn->newConnection();

		$id = $_SESSION['userid'];

		if (isset($_FILES['file'])) {
// Check for and save image file if exists ========================		
			$caption = $_POST['caption'];
			$unique = uniqid("LP", true);
			$unique = str_replace(".", "", $unique);
			$file = $_FILES['file'];
			$fileName = $_FILES['file']['name'];
			$fileTmpName = $_FILES['file']['tmp_name'];
			$fileSize = $_FILES['file']['size'];
			$fileError = $_FILES['file']['error'];
			$fileType = $_FILES['file']['type'];

			$fileExt = explode('.', $fileName);
			$fileActualExt = strtolower(end($fileExt));

			if (in_array($fileActualExt, $allowed)) {
				if ($fileError === 0) {
					if ($fileSize < $fileLimit) {
						$fileNameNew = $unique . '.' . $fileActualExt;
						$fileDestination = $fileDestination . $fileNameNew;
						$result = move_uploaded_file($fileTmpName, $fileDestination);
						if ($result === true) {
							$Filename = $unique;
							$Caption = $caption;
							$Ext = $fileActualExt;
							// create record and get id's
// *******************************************************************************************************************
							// Insert Image


							$stmt = $pdo->prepare($sql);

							//Bind our variables.
							$stmt->bindValue(':id', $id);
							$stmt->bindValue(':filename', $Filename);
							$stmt->bindValue(':ext', $Ext);
							$stmt->bindValue(':caption', $Caption);
							$stmt->bindValue(':added', $datetime);
							$stmt->bindValue(':amended', $datetime);
							$stmt->bindValue(':changed_by', $id);

							//Execute the statement and insert the new image.
							$stmt->execute();

							//$iID = $pdo->lastInsertId();

							echo $Filename.".".$Ext;


						} else {
							$Error = 'There was an error uploading your file';
						}
					} else {
						$Error = 'Your file is too big!';
					}
				} else {
					$Error = 'There was an error uploading your file';
				}
			} else {
				$Error = 'You cannot upload files of this type!';
			}
		} // done iFile

	}
