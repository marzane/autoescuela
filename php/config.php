<?php
    $servername = "localhost";
    $database = "martalap_prueba";
    $username = "martalap_prueba";
    $password = "22cdvABZYCAU";
    
    $conn = mysqli_connect($servername, $username, $password, $database);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
?>