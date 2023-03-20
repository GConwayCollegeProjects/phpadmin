<?php

/*
* INIT
* BASIC CONFIGURATION
*/

//connect to database

$server = 'localhost';

//$server = 'localhost';
$user = 'college';
$pass = '32b79bb49a4378d472bfee2385cf2417';
$db = 'shop_2019';

//username = adminboy@localhost
//password md5 hash of adminboy36

$Database = new mysqli($server, $user, $pass, $db);

//error reporting
mysqli_report(MYSQLI_REPORT_ERROR);
ini_set('display_errors', 1);

//set  up constants
define('SITE_NAME', 'gStore');
define('SITE_PATH', 'http://localhost:8081/gHnd3/');
define('IMAGE_PATH', 'resources/images/');

//create objects
include('app/m/m_template.php');
include('app/m/m_categories.php');
include('app/m/m_products.php');
$Template = new Template();
$Categories = new Categories();
$Products = new Products();

session_start();

?>