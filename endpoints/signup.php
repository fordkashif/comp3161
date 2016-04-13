<?php 
    include("../connection.php");
    $data = json_decode(file_get_contents("php://input"));
    $firstname = $data->firstname;
    $lastname = $data->lastname;
    $username = $data->username;
    $password = $data->password;
    $address = $data->address;
    $email = $data->email;

    $q = "INSERT INTO profile (firstname, lastname, address, email) VALUES (:firstname, :lastname, :address, :email)";
    $q2 = "INSERT INTO user (username, password) VALUES (:username, :password)";
    $query = $db->prepare($q);
    $execute = $query->execute(array(
        ":firstname" => $firstname,
        ":lastname" => $lastname,
        ":address" => $address,
        ":email" => $email
    ));
    $query2 = $db->prepare($q2);
    $execute2 = $query2->execute(array(
        ":username" => $username,
        ":password" => sha1($password)
    ));

    echo json_encode($email);
?>