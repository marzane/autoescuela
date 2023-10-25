<?php 
    header('Access-Control-Allow-Origin: *'); 
    require 'config.php';

    $query_preguntas = $pdo->prepare("select * from PREGUNTA");
    $query_preguntas->execute();

    $num_preguntas =$query_preguntas->rowCount();

    if($num_preguntas < 0 || !$num_preguntas){
        $num_preguntas = 0;        
    }

    echo json_encode($num_preguntas, JSON_UNESCAPED_UNICODE);
?>