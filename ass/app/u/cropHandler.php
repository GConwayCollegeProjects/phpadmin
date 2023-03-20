<?php

session_start();


$id = $_SESSION['userid'];
$date = $date = date('Y-m-d H:i:s');


include('../m/Connection.php');

$Conn = new Connection();

$pdo = $Conn->newConnection();

//Prepare our INSERT statement.
//Remember: We are inserting a new row into our images table.

$sql = "INSERT INTO images(img_ind_id, img_added, img_amended, img_changed_by, img_ext) VALUES (:id, :added, :amended, :by, :ext)";
$stmt = $pdo->prepare($sql);

//Bind our variables.

        $stmt->bindValue(':id', $id);
        $stmt->bindValue(':added', $date);
        $stmt->bindValue(':amended', $date);
        $stmt->bindValue(':by', $id);
        $stmt->bindValue(':ext', 'png');

//Execute the statement and insert the new image

        $update = $stmt->execute();


        $image_id = $pdo->lastInsertId();


$sql = "UPDATE individuals  SET ind_img_id = :image_id, ind_amended = :amended, ind_changed_by = :by WHERE ind_id = :id";

$stmt = $pdo->prepare($sql);

//Bind our variables.

$stmt->bindValue(':id', $id);
$stmt->bindValue(':image_id', $image_id);
$stmt->bindValue(':amended', $date);
$stmt->bindValue(':by', $id);


//Execute the statement and update the image record

$update = $stmt->execute();



$folderPath = '../../data/pics/';


$image_parts = explode(";base64,", $_POST['image']);

$image_type_aux = explode("image/", $image_parts[0]);

$image_type = $image_type_aux[1];

$image_base64 = base64_decode($image_parts[1]);

//$file = $folderPath . uniqid() . '.png';

$file = $folderPath . $image_id . '.png';

if (!file_put_contents($file, $image_base64)){

    echo "<a href='javascript:showI(3)'>Upload Failed - Click here to continue</a>";
}
else
{
    $_SESSION['userpic'] ="$image_id . '.png'";

    echo "<a href='javascript:showI(3)'>Upload Succeeded - Click here to continue</a>";

}






?>



