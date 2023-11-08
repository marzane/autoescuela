<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_preguntas = $_POST["preguntas"];
        $num_preguntas = intval($post_preguntas, 10);
        $preguntas = array();
        
        $query_preguntas = $pdo->prepare("select * from PREGUNTA order by rand() limit :limite;");
        $query_preguntas->bindParam(":limite", $num_preguntas, PDO::PARAM_INT);
        $query_preguntas->execute();
        
        if($query_preguntas){
            $preguntas = $query_preguntas->fetchAll();
        }
        
        
        echo json_encode($preguntas, JSON_UNESCAPED_UNICODE);
    }
    
?>