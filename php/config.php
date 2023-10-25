
<?php
    // parametros
    $conn = 'mysql:host=localhost;port=3306;dbname=nombreDB';
    $username = '';
    $password = '';
    $options = array(
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8mb4'",  // codificaci贸n de caracteres en UTF8 para evitar problemas con tildes
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // para devolver los datos como objetos en lugar de arrays
        PDO::ATTR_EMULATE_PREPARES => false,                    // desactivar preparaciones emuladas
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    );

    try {
        $pdo = new PDO($conn, $username, $password, $options);
    } catch (PDOException $e) {
        echo $e->getMessage();
        die();
}

?>