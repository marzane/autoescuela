<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        include 'config.php';
        $nombre_usuario = $_POST["usuario"];

        $array_examenes = array();
        
        //$query_usuario_id = mysqli_query($conn, "select id from USUARIO where NOMBRE=".$nombre_usuario.";");
        $query_usuario_id = mysqli_query($conn, "select ID from USUARIO where NOMBRE='".$nombre_usuario."';");

        if($query_usuario_id && mysqli_num_rows($query_usuario_id) == 1){

            $array_usuario_id = mysqli_fetch_assoc($query_usuario_id);
        
            $query_examenes = mysqli_query($conn, "select e.id, e.fechahora, (select count(*) from RESULTADOPREGUNTA where resultado='acierto' and examen=e.id) as aciertos,
                                                   (select count(*) from RESULTADOPREGUNTA where resultado='fallo' and examen=e.id) as fallos
                                                   from RESULTADOEXAMEN e join RESULTADOPREGUNTA p
                                                   on e.usuario='".$array_usuario_id[0]."' group by e.id order by e.id asc;");
    
            $array_examenes = mysqli_fetch_assoc($query_examenes);
    
            //mysqli_free_result($query_examenes);
        }

        echo json_encode($array_examenes, JSON_UNESCAPED_UNICODE);
        
        mysqli_close($conn);        
    }

?>
