<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_preguntas = $_POST["preguntas"];
        $soluciones = array();
        
        $preguntas = explode(" ", $post_preguntas);

        if(count($preguntas) > 0){
            
            foreach( $preguntas as $id ){
                
                $query_solucion = $pdo->prepare("select RESPUESTACORRECTA from PREGUNTA where ID= :id;");
                $query_solucion->bindParam(":id", $id, PDO::PARAM_INT);
                $query_solucion->execute();
                
                $query_solucion_array = $query_solucion->fetch(PDO::FETCH_ASSOC);
                array_push($soluciones, $query_solucion_array["RESPUESTACORRECTA"]);
                
            }
            
        }
        
        echo json_encode($soluciones, JSON_UNESCAPED_UNICODE);
    }

?>