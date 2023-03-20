<?php

session_start();

$name ="gordon conway";

require_once("../m/Name.php");

$Name = new Name();

$screen = $Name->createScreen($name);

print_r($screen);