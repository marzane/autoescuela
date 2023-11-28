<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_usuario_id = $_POST["usuario"];
        $progreso = array();
        
            $usuario_id = intval($post_usuario_id, 10);       
            
            $query_usuario = $pdo->prepare("select count(*) as cantidad from USUARIO where ID= :id");
            $query_usuario->bindParam(":id", $usuario_id, PDO::PARAM_INT);
            $query_usuario->execute();
            $number_of_rows = $query_usuario->fetchColumn(); 
            
            if($number_of_rows > 0){  // si existe el usuario
                // me descargo los datos
                $query_progreso = $pdo->prepare("select ESTADO, count(*) as cantidad from EXAMENCORREGIDO where USUARIO= :usuario group by ESTADO order by ESTADO ASC");
                $query_progreso->bindParam(":usuario", $usuario_id, PDO::PARAM_INT);
                $query_progreso->execute();
                $progreso = $query_progreso->fetchAll();

            }
            echo json_encode($progreso, JSON_UNESCAPED_UNICODE);
        }
        
        
    

?>