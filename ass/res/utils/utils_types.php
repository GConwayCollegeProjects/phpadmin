    <?php

    $servername 	= "localhost";
    $dbname 	 	= "peakacti_local_pages";
    $dbusername 	= "root";
    $dbpassword 	= "";

    $error	  		= FALSE;
    $result   		= FALSE;
    $table       	= "tmp";
    $id_field      	= "tmp_id";

    $select1		= "SELECT * from tmp" ;


    $field1 = "name" ;
    $field2 = "type_id" ;
    $field3 = "web" ;


    $field5 = "typ_name";
    $field6 = "typ_id";



    try

    {


    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $dbusername, $dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);



    $stmt = $conn->prepare("$select1");
    $stmt->execute();

    $tmp = $stmt->fetchAll();
    $stmt = null;
    $conn = null;
    }
    catch(PDOException $e)

    {
    $error = $e->getMessage();
    }

    foreach ($tmp as $key =>$row){
        $name = $row['type'] ;
       // echo $name ;
        $select2 = "select * from types where typ_name = '$name'";

        try {

        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $dbusername, $dbpassword);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $conn->prepare("$select2");
        $stmt->execute();

        $result = $stmt->fetch();
        $stmt = null;
        $conn = null;
    }

    catch(PDOException $e)

    {
        $error = $e->getMessage();
    }

        $result1 = $result[$field6];
        $result2 = $row['name'];
        $result3 = $row['web'];
        $result4 = $row['email'];




        $sql="INSERT INTO organisations (org_type_id, org_name, org_web, org_email) VALUES ('$result1', '$result2', '$result3', '$result4')";
    
    
            try {


    
                $conn = new PDO("mysql:host=$servername;dbname=$dbname", $dbusername, $dbpassword);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $conn->exec($sql);
        

            }

            catch(PDOException $e) {
                echo 'ERROR: ' . $e->getMessage();
            }
            $conn = null ;




    } // ends for each





    ?>



