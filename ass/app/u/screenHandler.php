<?php



    $name =($_POST['val']);

    require_once("../m/Name.php");

    $Name = new Name();

    $screen = $Name->createScreen($name);

    echo json_encode($screen);