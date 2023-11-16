<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $id_usuario = $_POST["id"];
        
        if(isset($id_usuario)){
            $query_usuario = $pdo->prepare("DELETE FROM USUARIO WHERE ID= :id");
            $query_usuario->bindParam(":id", $id_usuario, PDO::PARAM_STR);
            $query_usuario->execute();
        }
        
        //echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
    }
    
?>