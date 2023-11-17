<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $id_usuario = $_POST["id"];
        $resultado = false;
        
        if(isset($id_usuario)){
            $query_usuario = $pdo->prepare("DELETE FROM USUARIO WHERE ID= :id");
            $query_usuario->bindParam(":id", $id_usuario, PDO::PARAM_STR);
            $query_usuario->execute();

            $registros_borrados = $query_usuario->rowCount();
            if($registros_borrados > 0){
                // exito
                $resultado = true;
            }
        }
        
        echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
    }
    
?>