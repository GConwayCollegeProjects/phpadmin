<?php

if (session_status() == PHP_SESSION_NONE) {
	session_start();
	$_SESSION['userid'] = '100001' ;

}

$color = null;

$color = @$_GET['color'];

// If add ? color=number 1-3 to url then get choice of 4 different color palettes - defaults to green/blue/yellow

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../ass/res/css/mycss.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="../ass/res/css/image-picker.css" crossorigin="anonymous" />
    <style>
        .tabs li { width: 63px;}



    </style>
    <?php
    
    if($color==='1')
    {
        echo '<link rel="stylesheet" href="res/css/colors1.css">' ;
    }
    elseif($color==='2')
    {
        echo '<link rel="stylesheet" href="res/css/colors2.css">' ;
    }
    elseif($color==='3')
    {
        echo '<link rel="stylesheet" href="res/css/colors3.css">' ;
    }
    else
    {
        echo '<link rel="stylesheet" href="res/css/colors.css">' ;
    }

    ?>
    <link rel="stylesheet" href="res/css/formChecks.css">






</head>

