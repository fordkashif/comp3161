<?php 
    include("../connection.php");
    $data = json_decode(file_get_contents("php://input"));
    $firstname = $data->firstname;
    $lastname = $data->lastname;
    $username = $data->username;
    $password = $data->password;
    $address = $data->address;
    $email = $data->email;

    $q = "INSERT INTO users (firstname, lastname, username, password, address, email) VALUES (:firstname, :lastname, :username, :password, :address, :email)";
    $query = $db->prepare($q);
    $execute = $query->execute(array(
        ":firstname" => $firstname,
        ":lastname" => $lastname,
        ":username" => $username,
        ":password" => sha1($password),
        ":address" => $address,
        ":email" => $email
    ));

    echo json_encode($email);
?>