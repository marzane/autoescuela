<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_limite = $_POST["usuarios"];
        $post_offset = $_POST["posicion"];
        $usuarios = array();
        
        if(isset($post_limite) && isset($post_offset)){
            $num_usuarios = intval($post_limite, 10);
            $posicion = intval($post_offset, 10);
            
            $query_usuarios = $pdo->prepare("select * from USUARIO order by NOMBRE limit :limite offset :offset;");
            $query_usuarios->bindParam(":limite", $num_usuarios, PDO::PARAM_INT);
            $query_usuarios->bindParam(":offset", $posicion, PDO::PARAM_INT);
            $query_usuarios->execute();
            
            $usuarios = $query_usuarios->fetchAll();
            
        }
        
        echo json_encode($usuarios, JSON_UNESCAPED_UNICODE);

    }

?>