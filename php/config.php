<?php
    $servername = " /* host */ ";
    $database = " /* base de datos */ ";
    $username = " /* usuario */ ";
    $password = " /* contraseña */ ";
    
    $conn = mysqli_connect($servername, $username, $password, $database);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
?>
