<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        include 'config.php';
        $usuario = $_POST["usuario"];
        
        $query_usuario_id = mysqli_query($conn, "select id from USUARIO where nombre=".$usuario.";");
        $usuario_id = mysqli_fetch_row($query_usuario_id);
        //echo $usuario_id;

        //if($usuario_id && $usuario_id[0])
    
        $query_examenes = mysqli_query($conn, "select e.id, e.fechahora, (select count(*) from RESULTADOPREGUNTA where resultado='aciertos' and examen=e.id) as aciertos,
                                               (select count(*) from RESULTADOPREGUNTA where resultado='fallos' and examen=e.id) as fallos
                                               from RESULTADOEXAMEN e join RESULTADOPREGUNTA p
                                               on e.usuario=".$usuario_id[0]." group by e.id order by e.id asc;");
        
        $num_examenes = mysqli_num_rows($query_preguntas);

        $array_examenes = mysqli_fetch_assoc($query_examenes);

        echo json_encode($array_examenes, JSON_UNESCAPED_UNICODE);

        //mysqli_free_result($query_examenes);
        
        mysqli_close($conn);        
    }

?>
