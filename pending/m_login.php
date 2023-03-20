<?php
class Login
{
    private $host = "localhost";
    private $user = "root";
    private $pw = "";
    private $database = "glogin";

    public function db_connect()
    {
        $db = new PDO('mysql:host=' . $this->host . ';dbname=' . $this->database . '', $this->user, $this->pw) or die("Cannot connect to mySQL.");

        return $db;
    }
}

class Posted extends Login
{

    private $username;
    private $password;
    private $result;
    private $my_array;

    function __construct($username, $password)
    {
        $this->username = $username;
        $this->password = $password;

        $this->login2 = new Login();
        $this->db = $this->login2->db_connect();

        $command = $this->db->prepare("SELECT * FROM logins_test WHERE login =:login AND password = password(:password)");
        $command->bindParam(':login', $this->username);
        $command->bindParam(':password', $this->password);
        $command->execute();
        $result = $command->fetchAll();
        $this->result = $result;

//var_dump($result);
        $my_array = array();
        foreach ($this->result as $row) {

            $my_array[] = $row;
        }

        $this->my_array = $my_array;
        if (!empty($this->my_array)) {
            $_SESSION['id'] = $this->my_array[0]['id'];
            $_SESSION['login'] = $this->my_array[0]['login'];
            $_SESSION['timestamp'] = time();
            echo $_SESSION['id'] . " - " . $_SESSION['login'] . " - " . $_SESSION['timestamp'];
            echo "<br/>Success<br/>";

            $this->mytime = $_SESSION['timestamp'];
            $this->myuser = $_SESSION['id'];
            $command = "INSERT INTO logins_validate VALUES (NULL,:user_id, :time_current)";
            $command1 = $this->db->prepare($command);
            $command1->bindParam(':user_id', $this->myuser);
            $command1->bindParam(':time_current', $this->mytime);
            $command1->execute();

        } else {
            echo "Wrong username or password!";
        }

    }

}

class Verified extends Login
{

    protected $mytime;
    protected $myuser;
    private $result;
    private $my_check;

    function __construct($myuser, $mytime)
    {
        $this->myuser = $myuser;
        $this->mytime = $mytime;

//echo $this->mytime . "<br/>";
//echo $this->myuser . "<br/>";

        $this->login3 = new Login();
        $this->db = $this->login3->db_connect();

        $command = $this->db->prepare("SELECT * FROM logins_validate WHERE user_id =:login AND time_check = :mytime");
        $command->bindParam(':login', $this->myuser);
        $command->bindParam(':mytime', $this->mytime);
        $command->execute();
        $result = $command->fetchAll();

        $this->result = $result;

        $my_check = array();
        foreach ($result as $row) {
            $my_check[] = $row;
        }

        $this->my_check = $my_check;

        if (!empty($this->my_check)) {
            echo "<br/>Session is validated!";
## ADD CUSTOM CODE HERE
        } else {
            echo "<br/>Session is not validated!";
## ADD CUSTOM CODE HERE
        }
    }

}


