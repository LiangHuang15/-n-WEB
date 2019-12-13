<?php 

    session_start();

    $username = "";
    $email = "";
    $errors = array();
    
    $db = mysqli_connect('localhost', 'root', '', 'qldt');

?>