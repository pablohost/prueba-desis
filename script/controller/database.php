<?php
// Carga la configuración 
$config = parse_ini_file('../config/database.ini'); 

// Conexión con los datos del '.ini' 
$connection = mysqli_connect($config['host'],$config['username'],$config['password'],$config['dbname']); 

// Si la conexión falla, aparece el error 
if($connection === false) { 
 echo 'Ha habido un error <br>'.mysqli_connect_error(); 
} else {
 //echo 'Conectado a la base de datos';
}
?>