<?php 
    include("../connection.php");
    $data = json_decode(file_get_contents("php://input"));
    $password = sha1($data->password);
    $username = $data->username;

    $userInfo = $db->query("SELECT username FROM user WHERE username='$username' AND password='$password'");
    $userInfo = $userInfo->fetchAll();

	$token; 
	if (count($userInfo) == 1){
		//This means that the user is logged in and let's givem a token :D :D :D
		$token = $username. " | " . uniqid() . uniqid() . uniqid();
		
	$q2 = "UPDATE user SET token=:token WHERE username=:username AND password=:password";
	$query = $db->prepare($q2);
	$execute = $query->execute(array(
		":token" => $token,
		":username" => $username,
		":password" => $password
	)); 

    echo json_encode($token);
	} else {
	echo "ERROR";
	}
	
	
	

?>