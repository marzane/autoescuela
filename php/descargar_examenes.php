<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        include 'config.php';
        $usuario = $_POST["usuario"];
        
        $query_usuario_id = mysqli_query($conn, "select id from USUARIO where nombre=".$usuario.";");
        $usuario_id = mysqli_fetch_row(mysqli_result $query_usuario_id);
        echo $usuario_id;
        
    
        $query_examenes = mysqli_query($conn, "select e.id, e.fechahora, (select count(*) from RESULTADOPREGUNTA where resultado='aciertos' and examen=e.id) as aciertos,
                                               (select count(*) from RESULTADOPREGUNTA where resultado='fallos' and examen=e.id) as fallos
                                               from RESULTADOEXAMEN e join RESULTADOPREGUNTA p
                                               on e.usuario=".$usuario." group by e.id order by e.id asc;");
        
        $num_examenes = mysqli_num_rows($query_preguntas);
    
    
        echo json_encode($query_examenes, JSON_UNESCAPED_UNICODE);
        
        mysqli_close($conn);        
    }

?>