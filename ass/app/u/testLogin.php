<?php

session_start();
// create database connection
require_once('../m/Connection.php');

$Conn = new Connection();

$pdo = $Conn->newConnection();

if(isset($_POST['email'])){

	//Retrieve the field values from our login form.
	$email = !empty($_POST['email']) ? trim($_POST['email']) : null;
	$passwordAttempt = !empty($_POST['password']) ? trim($_POST['password']) : null;

	//Retrieve the user account information for the given email.
	$sql = "SELECT ind_id, ind_firstname, ind_lastname, ind_img_id, ind_email, ind_pword FROM individuals WHERE ind_email = :email";
	$stmt = $pdo->prepare($sql);


	//Bind value.
	$stmt->bindValue(':email', $email);

	//Execute.
	$stmt->execute();

	//Fetch row.
	$user = $stmt->fetch(PDO::FETCH_ASSOC);

	//If $row is FALSE.
	if($user === false){
		//Could not find a user with that email!
		die('Email address not found!');
	} else{
		//User account found. Check to see if the given password matches the
		//password hash that we stored in our users table.


		$pass=$user['ind_pword'];



		$validPassword=password_verify($passwordAttempt, $pass);


		//Compare the passwords.
		// $validPassword = password_verify($pass, $passwordAttempt);

		//If $validPassword is TRUE, the login has been successful.
		if($validPassword){
			echo $email;
			echo $_SESSION['user_name'];
			//Provide the user with a login session.
			$_SESSION['userid'] = $user['ind_id'];
			$_SESSION['loggedin'] = time();
			$_SESSION['username'] = $user['ind_firstname']." ".$user['ind_lastname'];

			//Redirect to our protected page, which we called home.html
			header('Location: ../../home.php');
			exit;

		}
		else{
			die("Incorrect password entered - please try again!");

		}
	}

}

