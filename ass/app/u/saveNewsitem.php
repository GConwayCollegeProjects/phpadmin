<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}

$userid = $_SESSION['userid'];

	if(!isset($_POST['submit'])) {
		echo "<div>Failed to post details correctly</div>";
		// Update errors log =======================================
	}
	else
	{
		require_once('../m/Connection.php');

		$Conn = new Connection();

		$pdo = $Conn->newConnection();

		$iFilename = "";
		$iCaption = "";


		$vFilename = "";
		$vCaption = "";
		$vError = "";
		$vExt = "";
		$vID = 0;

		$pFilename = "";
		$pCaption = "";
		$pError = "";
		$pExt = "";
		$pID = 0;

		$URL = "";
		$uCaption = "";
		$uError = "";

		$userid = $_SESSION['userid'];
		$postype = 1;
		$pos_id = 0;
		$date = date("Y-m-d");
		$time = "00:00";
		$datetime = date('Y-m-d H:i:s');
		if (isset($_POST['start']) && $_POST['start']>$date) {
			$date = $_POST['start'];
			if (isset($_POST['time'])) {
				$time = $_POST['time'];
			}
		}
		$show_from = $date." ".$time;
//		Ensure user informed of progress if slow
		echo '<script>addMessage("Updating Files")</script>';
		$date_from = date_create("$show_from");
		$date_to = date_add($date_from,date_interval_create_from_date_string("30 days"));
		$show_to = date('Y-m-d H:i:s', $date_to->getTimestamp());
		$subject = $_POST['subject'];

		$source = $_POST['source'];


// Save Postings Entry

		// create record and get id

		$sql = "INSERT INTO posts (pos_typ_id, pos_ind_id, pos_added, pos_amended, pos_changed_by ) VALUES (:type, :id, :added, :amended, :changed_by)";

		$stmt = $pdo->prepare($sql);

		//Bind our variables.
		$stmt->bindValue(':type', $postype);
		$stmt->bindValue(':id', $id);
		$stmt->bindValue(':added', $datetime);
		$stmt->bindValue(':amended', $datetime);
		$stmt->bindValue(':changed_by', $id);
		//Execute the statement and insert the new posting
		$stmt->execute();

		$pos_id = $pdo->lastInsertId();

// Save News Types Entries

		// create record and get id
		$sql = "INSERT INTO postlinks (pli_pos_id, pli_postype_id) VALUES (:pos_id, :type)";

		$array = $_POST['select'];
		$max = count($array);
		for ($x = 0; $x <= $max-1; $x++) {
			$postype = $array[$x];
			//Bind our variables.
			$stmt = $pdo->prepare($sql);
			$stmt->bindValue(':pos_id', $pos_id);
			$stmt->bindValue(':type', $postype);
			//Execute the statement and insert the new link
			$stmt->execute();
			// repeat for all entries in array
		}

// Save News Item itself

		$sql = "INSERT INTO news (new_pos_id, new_img_id, new_vid_id, new_gal_id, new_pdf_id, new_url_id, new_subject, new_source, new_html, new_show_from, new_show_to)
 				VALUES (:pos_id, :img_id, :vid_id, :gal_id, :pdf_id, :url_id, :subject, :source, :html, :show_from, :show_to)";

		$stmt = $pdo->prepare($sql);

		//Bind our variables.
		$stmt->bindValue(':pos_id', $pos_id);
		$stmt->bindValue(':img_id', $iID);
		$stmt->bindValue(':vid_id', $vID);
		$stmt->bindValue(':gal_id', 0);
		$stmt->bindValue(':pdf_id', $pID);
		$stmt->bindValue(':url_id', $uID);
		$stmt->bindValue(':subject', $subject);
		$stmt->bindValue(':source', $source);
		$stmt->bindValue(':html', $html);
		$stmt->bindValue(':show_from', $show_from);
		$stmt->bindValue(':show_to', $show_to);


		//Execute the statement and insert the new newsitem
		$stmt->execute();



	}
header("Location: ../../home.php");
exit();
