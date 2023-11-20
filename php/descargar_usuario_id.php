<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $id_post = $_POST["id"];
        $id = intval($id_post, 10);
        $usuario = array();
        
        $query_usuario = $pdo->prepare("select * from USUARIO where ID= :id;");
        $query_usuario->bindParam(":id", $id, PDO::PARAM_INT);
        $query_usuario->execute();
        
        $usuario = $query_usuario->fetch(PDO::FETCH_ASSOC);
        
        echo json_encode($usuario, JSON_UNESCAPED_UNICODE);
    }
    
?>