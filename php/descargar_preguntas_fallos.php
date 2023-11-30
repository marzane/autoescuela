<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_usuario_id = $_POST["usuario"];
        $post_preguntas = $_POST["preguntas"];
        $preguntas = array();
        if(isset($post_usuario_id)){
            $usuario_id = intval($post_usuario_id, 10);       
            $num_preguntas = intval($post_preguntas, 10);
            
            $query_usuario = $pdo->prepare("select count(*) as cantidad from USUARIO where ID= :id");
            $query_usuario->bindParam(":id", $usuario_id, PDO::PARAM_INT);
            $query_usuario->execute();
            $number_of_rows = $query_usuario->fetchColumn(); 
            
            if($number_of_rows > 0){  // si existe el usuario
                $query_preguntas_falladas = $pdo->prepare("select * from PREGUNTAFALLADA f join PREGUNTA p on f.PREGUNTA = p.ID where USUARIO= :usuario order by rand() limit :limite;");
                $query_preguntas_falladas->bindParam(":usuario", $usuario_id, PDO::PARAM_INT);
                $query_preguntas_falladas->bindParam(":limite", $num_preguntas, PDO::PARAM_INT);
                $query_preguntas_falladas->execute();
                $preguntas = $query_preguntas_falladas->fetchAll();
                $num_preguntas_falladas = $query_preguntas_falladas->rowCount();
        
                if($num_preguntas_falladas < $num_preguntas || $num_preguntas_falladas <= 0){
                    //$preguntas_falladas = $query_preguntas_falladas->fetchAll();
                    
                    $nuevo_limite = ($num_preguntas - $num_preguntas_falladas);
                    
                    $query_preguntas = $pdo->prepare("select * from PREGUNTA order by rand() limit :limite;");
                    $query_preguntas->bindParam(":limite", $nuevo_limite, PDO::PARAM_INT);
                    $query_preguntas->execute();
                    $preguntas_normales = $query_preguntas->fetchAll();
                    
                    $preguntas = array_merge($preguntas, $preguntas_normales);
                }

            }
            echo json_encode($preguntas, JSON_UNESCAPED_UNICODE);
        }

    }

?>