<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_preguntas = $_POST["preguntas"];
        $num_preguntas = intval($post_preguntas, 10);
        $preguntas = array();
        
        $query_preguntas = $pdo->prepare("select * from PREGUNTA order by rand() limit :limite;");
        //$query_preguntas = $pdo->prepare("SELECT * FROM PREGUNTA OFFSET floor(random() * ( SELECT COUNT(*) FROM PREGUNTA)) LIMIT :limite;");
        $query_preguntas->bindParam(":limite", $num_preguntas, PDO::PARAM_INT);
        $query_preguntas->execute();
        
        if($query_preguntas){
            $preguntas = $query_preguntas->fetchAll();
        }
        
        
        echo json_encode($preguntas, JSON_UNESCAPED_UNICODE);
    }
    
    
    /*
    if($_POST){
        require 'config.php';
        $offset = $_POST["offset"];
        $preguntas = $_POST["preguntas"];
        $preguntas = array();
        
        if(isset($offset) && isset($preguntas)){
            $offset_int = intval($offset, 10);
            $preguntas_int = intval($preguntas, 10);

            $query_preguntas = $pdo->prepare("select * from PREGUNTA limit :limite offset :offset;");
            //$query_usuario_id=$pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            $query_preguntas->bindParam(":limite", $preguntas_int, PDO::PARAM_INT);
            $query_preguntas->bindParam(":offset", $offset_int, PDO::PARAM_INT);
            $query_preguntas->execute();
        
            if($query_preguntas){
                $preguntas = $query_preguntas->fetchAll();
            }

        }
        
        echo json_encode($preguntas, JSON_UNESCAPED_UNICODE);

    }
    */
?>