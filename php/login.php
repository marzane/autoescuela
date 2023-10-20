<?php
        if($_POST){
            include 'claves.php';

            $nombre = $_POST["nombre"];
            $password = $_POST["password"];
            echo "<p>Nombre: ".$nombre."</p> <p>Password: ".$password."</p>";

            // crear conexion
            $conn = mysqli_connect($servername, $username, $password, $database);
            
                if (!$conn) {
                    die("Connection failed: " . mysqli_connect_error());
                }
            echo "Connected successfully";
        
            // cerrar la conexión con la base de datos
            mysqli_close($conn);
        }

?>