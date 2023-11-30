<?php
require('database.php');

mysqli_set_charset($connection,"utf8");

foreach ($_POST as $key => $value) {
    echo "Field ".htmlspecialchars($key)." is ".htmlspecialchars($value)."<br>";
}

/*
$comboboxes['regiones'] = getRegiones($connection);
$comboboxes['comunas'] = getComunas($connection);
$comboboxes['candidatos'] = getCandidatos($connection);

echo json_encode($comboboxes);

function getRegiones($connection)
{
	$sql = "SELECT re.id as id, re.msg as region 
			FROM region as re 
			WHERE re.status=0;";

	$query = mysqli_query($connection, $sql);
	$regiones = array();

	//Obtiene la cantidad de filas que hay en la consulta
	$rows = mysqli_num_rows($query);
	//Si no existe ninguna fila, devuelvo array vacio
	if ($rows === 0) {
		return $regiones;
	} else {
		//La variable $response contiene el array que se genera en la consulta, así que obtenemos los datos y los mostramos en un bucle
		while($response = mysqli_fetch_assoc($query)) {
			$arr_tmp['id'] = $response['id'];
			$arr_tmp['region'] = $response['region'];
			array_push($regiones, $arr_tmp);
		};//Fin while $response
	}; //Fin else $rows
	//Devolvemos el array
	return $regiones;
}
*/
?>