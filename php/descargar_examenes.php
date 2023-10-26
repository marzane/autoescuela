<?php 
    header('Access-Control-Allow-Origin: *'); 
    if($_POST){
        require 'config.php';
        $nombre_usuario = $_POST["usuario"];
        
        $examenes = array();

        $query_usuario_id = $pdo->prepare("select ID from USUARIO where NOMBRE= :usuario");
        //$query_usuario_id=$pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $query_usuario_id->bindParam(":usuario", $nombre_usuario, PDO::PARAM_STR);
        $query_usuario_id->execute();
        
        /*
        $return_arr = array();
        foreach ($datos as $row){
            $id =  $row['ID'];   
            
            //$return_arr[] = array("id" => $id);
        }
        */
        
        if($query_usuario_id){
                   $datos = $query_usuario_id->fetchAll();
                   $query_examenes = $pdo->prepare("select e.id, e.fechahora, (select count(*) from RESULTADOPREGUNTA where resultado='acierto' and examen=e.id) as aciertos, (select count(*) from RESULTADOPREGUNTA where resultado='fallo' and examen=e.id) as fallos from RESULTADOEXAMEN e join RESULTADOPREGUNTA p on e.usuario= :usuario_id group by e.id order by e.id asc;");
                   $query_examenes->bindParam(":usuario_id", $datos[0]["ID"], PDO::PARAM_INT);
                   $query_examenes->execute();
                   $examenes = $query_examenes->fetchAll();
        }


        echo json_encode($examenes, JSON_UNESCAPED_UNICODE);
    }
?>