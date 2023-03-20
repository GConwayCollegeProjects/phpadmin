<?php

require_once '../../app/m/Leftbox.php';

$Leftbox = new Leftbox();
$val = ($_POST['val']);
$result = $Leftbox->fillLeftbox($val);


echo $result ;
