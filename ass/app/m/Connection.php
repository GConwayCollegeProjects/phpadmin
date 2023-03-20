<?php


class Connection
{

    /**
     * This class connects to MySQL using the PDO object.
     * This can be included in web pages where a database connection is needed.
     * Customize these to match your MySQL database connection details.
     * This info should be available from within your hosting panel.
     */

    function _construct(){ }

    public const USER = "peakacti_gconway";
    public const PASSWORD = "#LovethePeaks";
    public const HOST = "127.0.0.1";
    public const DB = "peakacti_local_pages";

    public $pdo;


    /**
     * PDO options / configuration details.
     * I'm going to set the error mode to "Exceptions".
     * I'm also going to turn off emulated prepared statements.
     */

    public const OPTIONS = array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_EMULATE_PREPARES => false ) ;



    public function newConnection() {




        /**
         * Connect to MySQL and instantiate the PDO object.
         */

        $pdo = new PDO(
            "mysql:host=" . self::HOST . ";dbname=" . self::DB, //DSN
            self::USER, //Username
            self::PASSWORD, //Password
           self::OPTIONS //Options
        );

        return($pdo);
    }




}