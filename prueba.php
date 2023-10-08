<?php
    $servername = "localhost";
    $database = "autoescuelaBD";
    $username = "autoescuela";
    $password = "22cdvABZYCAU";
    // crear conexion
    $conn = mysqli_connect($servername, $username, $password, $database);
    
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
    echo "Connected successfully";

    // cerrar la conexión con la base de datos
    mysqli_close($conn);
?>