<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

if ( isset($firstName) || isset($lastName) || isset($phone) || isset($email) || isset($message) ) {
    $firstName = $_POST["firstName"];
    $lastName = $_POST["lastName"];
    $phone = $_POST["phone"];
    $email = $_POST["email"];
    $message = $_POST["message"];

    echo "Arvot on asetettu";
    } else {
        echo "Arvot ei ole asetettu";
    }

if( empty($firstName) || empty($lastName) || empty($phone) || empty($email) ||empty($message) ) {
    echo "Väärin";
} else {
    echo "Oikein";
    exit;
}

    $input = json_decode(file_get_contents('php://input'));
    $firstName = filter_var($input->firstName,FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $lastName = filter_var($input->lastName,FILTER_SANITIZE_SPECIAL_CHARS);
    $phone = filter_var($input->phone,FILTER_SANITIZE_SPECIAL_CHARS);
    $email = filter_var($input->email,FILTER_SANITIZE_SPECIAL_CHARS);
    $message = filter_var($input->message,FILTER_SANITIZE_SPECIAL_CHARS);

    try{

        $db = openDb();

        //Suoritetaan parametrien lisääminen tietokantaan.
        $sql = "INSERT INTO feedback (firstname, lastname, phone, email, message) VALUES ('$firstName', '$lastName', '$phone', '$email', '$message')";
        
        executeInsert($db,$sql);
        
        /*
        $sql = "INSERT INTO feedback (firstname, lastname, phone, email, message) VALUES (?, ?, ?, ?, ?)";
        $pdoStatement = $pdo->prepare($sql);
        $pdoStatement->bindParam(1, $firstName);
        $pdoStatement->bindParam(2, $lastName);
        $pdoStatement->bindParam(3, $phone);
        $pdoStatement->bindParam(4, $email);
        $pdoStatement->bindParam(5, $message);
        $statement->execute();
        */
        
    }catch(PDOException $e){
        echo "Käyttäjää ei voitu lisätä<br>";
        echo $e->getMessage();
    }
