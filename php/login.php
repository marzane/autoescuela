<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $nombre = $_POST["preguntas"];
        $passw = $_POST["preguntas"];
        
        if(isset($nombre) && isset($passw)){
            $query_usuario = $pdo->prepare("select count(*) from USUARIO where NOMBRE= :nombre");
            $query_usuario->bindParam(":nombre", $nombre, PDO::PARAM_STR);
            $query_usuario->execute();
            
            if($query_usuario->fetchColumn() > 0){
                // ya existe un usuario con ese nombre
                
            } else {
                
            }   
        }
        
        
        //echo json_encode($preguntas, JSON_UNESCAPED_UNICODE);
    }
    
?>