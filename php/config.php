<?php
    $servername = "localhost";
    $database = "";
    $username = "";
    $password = "";
    
    $conn = mysqli_connect($servername, $username, $password, $database);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
?>
