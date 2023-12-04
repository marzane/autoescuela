<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_falladas = $_POST["falladas"];
        $post_acertadas = $_POST["acertadas"];
        $post_usuario_id = $_POST["usuario"];
        
        if(isset($post_falladas) && isset($post_usuario_id) && isset($post_acertadas)){
            $usuario_id = intval($post_usuario_id, 10);       

            $query_usuario = $pdo->prepare("select count(*) as cantidad from USUARIO where ID= :id");
            $query_usuario->bindParam(":id", $usuario_id, PDO::PARAM_INT);
            $query_usuario->execute();
            $number_of_rows = $query_usuario->fetchColumn(); 
            
            if($number_of_rows > 0){  // si existe el usuario
                $falladas = explode("-", $post_falladas);
                $acertadas = explode("-", $post_acertadas);
                
                foreach( $acertadas as $pregunta_id ){
                    $delete_pregunta = $pdo->prepare("DELETE FROM PREGUNTAFALLADA WHERE USUARIO= :usuario AND PREGUNTA= :pregunta;");
                    $delete_pregunta->bindParam(":usuario", $usuario_id, PDO::PARAM_INT);
                    $delete_pregunta->bindParam(":pregunta", $pregunta_id, PDO::PARAM_INT);
                    $delete_pregunta->execute();
                }
            
                foreach( $falladas as $pregunta_id ){
                    $query_fallada = $pdo->prepare("select count(*) as cantidad from PREGUNTAFALLADA WHERE USUARIO = :usuario AND PREGUNTA = :pregunta");
                    $query_fallada->bindParam(":usuario", $usuario_id, PDO::PARAM_INT);
                    $query_fallada->bindParam(":pregunta", $pregunta_id, PDO::PARAM_INT);
                    $query_fallada->execute();
                    $number_of_rows = $query_fallada->fetchColumn(); 
            
                     if($number_of_rows <= 0){  // si no existe la pregunta
                        //$insert_pregunta = $pdo->prepare("INSERT INTO PREGUNTAFALLADA (USUARIO, PREGUNTA)VALUES (:usuario,:pregunta) IF NOT EXISTS (SELECT * FROM PREGUNTAFALLADA WHERE USUARIO = :usuario AND PREGUNTA = :pregunta);");
                        $insert_pregunta = $pdo->prepare("INSERT INTO PREGUNTAFALLADA (USUARIO, PREGUNTA)VALUES (:usuario,:pregunta);");
                        $insert_pregunta->bindParam(":usuario", $usuario_id, PDO::PARAM_INT);
                        $insert_pregunta->bindParam(":pregunta", $pregunta_id, PDO::PARAM_INT);
                        $insert_pregunta->execute();
                     }
                }
                
                // guardar resultado del examen
                $num_falladas = count($falladas);
                $num_acertadas = count($acertadas);
                $resultado_examen = "suspenso";
                
                if($num_falladas > 3){
                    $resultado_examen = "suspenso";
                } else if($num_falladas == 0){
                    $resultado_examen = "perfecto";
                } else {
                    $resultado_examen = "aprobado";
                }
                
                $insert_examen = $pdo->prepare("INSERT INTO EXAMENCORREGIDO(USUARIO, ESTADO)VALUES (:usuario,:estado);");
                $insert_examen->bindParam(":usuario", $usuario_id, PDO::PARAM_INT);
                $insert_examen->bindParam(":estado", $resultado_examen, PDO::PARAM_STR);
                $insert_examen->execute();
            }
        }
        echo json_encode($falladas, JSON_UNESCAPED_UNICODE);
    }

?>