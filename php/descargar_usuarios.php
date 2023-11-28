<?php 
    header('Access-Control-Allow-Origin: *'); 
    
        require 'config.php';
        $usuarios = array();
            
        $query_usuarios = $pdo->prepare("select * from USUARIO order by NOMBRE;");
        $query_usuarios->execute();
            
        $usuarios = $query_usuarios->fetchAll();
        
        echo json_encode($usuarios, JSON_UNESCAPED_UNICODE);

    

?>