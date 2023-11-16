<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $nombre = $_POST["nombre"];
        $passw = $_POST["password"];
        $resultado = -2;
        
        if(isset($nombre) && isset($passw)){
            $query_usuario = $pdo->prepare("select count(*) as cantidad from USUARIO where NOMBRE= :nombre");
            $query_usuario->bindParam(":nombre", $nombre, PDO::PARAM_STR);
            $query_usuario->execute();
            $number_of_rows = $query_usuario->fetchColumn(); 
            
            if($number_of_rows <= 0){  // si no existe un usuario con ese nombre
                $insert_usuario = $pdo->prepare("insert into USUARIO (NOMBRE, PASSWORD, esAdmin) VALUES (:nombre,:password,false);");
                $insert_usuario->bindParam(":nombre", $nombre, PDO::PARAM_STR);
                $insert_usuario->bindParam(":password", $passw, PDO::PARAM_STR);
                $insert_usuario->execute();
                
                $usuario = 0;
            } else {
                $resultado = -1;
            }
        }
        
        echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
    }
    
?>