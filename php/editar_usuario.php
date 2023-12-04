<?php 
    header('Access-Control-Allow-Origin: *'); 
    
    if($_POST){
        require 'config.php';
        $post_id = $_POST["id"];
        $nombre = $_POST["nombre"];
        $passw = $_POST["password"];
        $admin = isset($_POST["esAdmin"]) ? $_POST["esAdmin"] : "";
        $resultado = -2;
        
        if(isset($post_id) && isset($nombre) && isset($passw)){
            $id = intval($post_id, 10);
            
            $query_usuario = $pdo->prepare("select count(*) as cantidad from USUARIO where NOMBRE= :nombre and ID != :id");
            $query_usuario->bindParam(":nombre", $nombre, PDO::PARAM_STR);
            $query_usuario->bindParam(":id", $id, PDO::PARAM_INT);
            $query_usuario->execute();
            $number_of_rows = $query_usuario->fetchColumn(); 
            
            if($number_of_rows <= 0){  // si no existe un usuario con ese nombre
                if(isset($admin) && $admin != ""){
                    $query = "update USUARIO set NOMBRE= :nombre, PASSWORD= :password, esAdmin= :admin where ID= :id;";
                } else {
                    $query = "update USUARIO set NOMBRE= :nombre, PASSWORD= :password where ID= :id;";
                }
            
                $update_usuario = $pdo->prepare($query);
                $update_usuario->bindParam(":nombre", $nombre, PDO::PARAM_STR);
                $update_usuario->bindParam(":password", $passw, PDO::PARAM_STR);
                if(isset($admin) && $admin != ""){
                    $bool_admin = settype($admin, 'boolean');
                    $update_usuario->bindParam(":admin", $bool_admin, PDO::PARAM_INT);
                }
                $update_usuario->bindParam(":id", $id, PDO::PARAM_INT);
                $update_usuario->execute();
                
                $registros_editados = $update_usuario->rowCount();
                if($registros_editados > 0){
                     $resultado = 0;
                } else {
                    $resultado = -2;
                }

               
            } else {
                $resultado = -1;  // el nombre de usuario ya está en uso; no se puede editar
            }
            

        }
        
        echo json_encode($resultado, JSON_UNESCAPED_UNICODE);
    }
    
?>