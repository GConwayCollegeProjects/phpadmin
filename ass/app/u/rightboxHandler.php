<?php

require_once '../../app/m/Rightbox.php';

    $Rightbox = new Rightbox();
	$val = ($_POST['val']);
	$result = $Rightbox->fillRightbox($val);


     echo $result ;
