<?php
require('database.php');

mysqli_set_charset($connection,"utf8");


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

function getComunas($connection)
{
	$sql = "SELECT co.id as id, co.msg as comuna, re.msg as region  
			FROM comuna as co 
			INNER JOIN region as re ON re.id = co.region 
			WHERE co.status=0;";

	$query = mysqli_query($connection, $sql);
	$comunas = array();

	//Obtiene la cantidad de filas que hay en la consulta
	$rows = mysqli_num_rows($query);
	//Si no existe ninguna fila, devuelvo array vacio
	if ($rows === 0) {
		return $comunas;
	} else {
		//La variable $response contiene el array que se genera en la consulta, así que obtenemos los datos y los mostramos en un bucle
		while($response = mysqli_fetch_assoc($query)) {
			$arr_tmp['id'] = $response['id'];
			$arr_tmp['comuna'] = $response['comuna'];
			$arr_tmp['region'] = $response['region'];
			array_push($comunas, $arr_tmp);
		};//Fin while $response
	}; //Fin else $rows
	//Devolvemos el array
	return $comunas;
}

function getCandidatos($connection)
{
	$sql = "SELECT ca.id as id, ca.msg as candidato  
			FROM candidato as ca 
			WHERE ca.status=0;";

	$query = mysqli_query($connection, $sql);
	$candidatos = array();

	//Obtiene la cantidad de filas que hay en la consulta
	$rows = mysqli_num_rows($query);
	//Si no existe ninguna fila, devuelvo array vacio
	if ($rows === 0) {
		return $candidatos;
	} else {
		//La variable $response contiene el array que se genera en la consulta, así que obtenemos los datos y los mostramos en un bucle
		while($response = mysqli_fetch_assoc($query)) {
			$arr_tmp['id'] = $response['id'];
			$arr_tmp['candidato'] = $response['candidato'];
			array_push($candidatos, $arr_tmp);
		};//Fin while $response
	}; //Fin else $rows
	//Devolvemos el array
	return $candidatos;
}
?>