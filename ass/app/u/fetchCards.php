<?php


if (session_status() == PHP_SESSION_NONE) {
	session_start();
}

require_once('../m/Connection.php');

$Conn = new Connection();

$pdo = $Conn->newConnection();

$field1 = 'img_filename';
$field2 = 'img_ext';
$field3 = 'img_caption';

// create record and get id

$sql = "SELECT * FROM images where img_ind_id = 1";
try {
$stmt = $pdo->prepare("$sql");
$stmt->execute();

$result = $stmt->fetchAll();
$stmt = null;
$conn = null;
}
catch(PDOException $e)

{
	$error = $e->getMessage();
}


            echo'<div class="container-fluid  overflow-auto" style="height:250px; width: 600px ">
            <div class="row"> 	<!--    DIV - Start of 	-->
			 ' ;
                $x=1;
            foreach($result as $key => $row) {
	            $src = "../../data/pics/$row[$field1].$row[$field2]";
	            if (file_exists($src) === true) {
		            $id = "$row[$field1].$row[$field2]";
		            echo '<div class="col-sm-4">';
		            echo '<li class=" d-flex justify-content-center" style="list-style: none; "><img  id=' . $id . ' height="80px" alt="" src= ' . $src . '><br></li>';
		            echo '<li class=" d-flex justify-content-center" style="list-style: none; ">' . $row[$field3] . '</li>';
	                echo '</div>';
	                if ($x ===3){
	                   echo ' <div class="w-100"></div>';
	                   $x=0;
                    }
	                $x = $x+1;
	              };
   			};

                                    echo '
                                                    
                                        </div> <!-- End of Row -->
                                    </div> <!-- End of container -->' ;
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>











