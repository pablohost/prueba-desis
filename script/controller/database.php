<?php
// Carga la configuración 
$config = parse_ini_file('../config/database.ini'); 

// Conexión con los datos del '.ini' 
$conn = new PDO("mysql:dbname=".$config['dbname'].";host=".$config['host'].";charset=utf8",$config['username'], $config['password']);

// Si la conexión falla, aparece el error 
if($conn === false) { 
 echo 'Ha habido un error <br>'.mysqli_connect_error(); 
} else {
 //echo 'Conectado a la base de datos';
}
?>