<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}



if(!isset($_POST['submit'])) {
	echo "<div>Failed to post details correctly</div>";
	// Update errors log =======================================
}
else {


	$array = $_POST['select'];
	print_r ($array);





}