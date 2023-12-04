<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $nombre = $_POST["nombre"];
        $passw = $_POST["password"];
        $usuario = array();
        
        if(isset($nombre) && isset($passw)){
            $query_usuario = $pdo->prepare("select * from USUARIO where NOMBRE=:nombre && PASSWORD=:passw;");
            $query_usuario->bindParam(":nombre", $nombre, PDO::PARAM_STR, 30);
            $query_usuario->bindParam(":passw", $passw, PDO::PARAM_STR, 30);
            $query_usuario->execute();
            
            $usuario = $query_usuario->fetch(PDO::FETCH_ASSOC);
        
            if($usuario){
                if($usuario["NOMBRE"] != $nombre || $usuario["PASSWORD"] != $passw){
                    // no existe el usuario
                    $usuario = array();
                } 
            } else{
                $usuario = array();
            }

        }
        
        
        echo json_encode($usuario, JSON_UNESCAPED_UNICODE);
    }
    
?>