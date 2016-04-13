<?php

//connect to the database
$connect = mysql_connect("localhost", "username", "password");
mysql_select_db("angular_authenticate", $connect); //select table

if ($_FILES[csv][size] > 0) {

    //get the csv file
    $file = $_FILES[csv][tmpfile];
    $handle = fopen($file, "r");

    //loop throught the csv file and insert into the database
    do {
        if ($data[0]) {
            mysql_query("INSERT INTO recipes (recipe_ID, serving_quantity, crt_date, recipe_name, prep_time, calorie_count) VALUES
            (
                '".addslashes($data[0])."', 
                '".addslashes($data[1])."', 
                '".addslashes($data[2])."',
                '".addslashes($data[3])."', 
                '".addslashes($data[4])."', 
                '".addslashes($data[5])."' 
            ");
        }
    } while ($data = fgetcsv(handle,1000,",","'",",","'"));
    //
    
    //redirect
    header('Location: recipe.php?success=1'); die;
}