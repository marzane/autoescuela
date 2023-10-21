<?php 
    header('Access-Control-Allow-Origin: *'); 
    include 'config.php';
    
    $query_preguntas = mysqli_query($conn, "select * from PREGUNTA;");
    $num_preguntas = mysqli_num_rows($query_preguntas);

    if($num_preguntas < 0 || !$num_preguntas){
        $num_preguntas = 0;        
    }
    //print_r($num_preguntas);
    echo json_encode($num_preguntas, JSON_UNESCAPED_UNICODE);
    
    mysqli_close($conn);
?>