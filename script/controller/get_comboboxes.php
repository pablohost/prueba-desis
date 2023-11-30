<?php
//Conexion PDO a la base de datos
require('database.php');

//Arreglos con informacion de los combobox
$comboboxes['regiones'] = getRegiones($conn);
$comboboxes['comunas'] = getComunas($conn);
$comboboxes['candidatos'] = getCandidatos($conn);

//Devuelvo arreglo con informacion en formato JSON
echo json_encode($comboboxes);

/*
* Busco las regiones en la base de datos
* @param PDO $conn Variable de conexion PDO a la base de datos
* @return array $regiones Arreglo con todas las regiones
*/
function getRegiones($conn)
{
	// iniciar transacción 
	$conn->beginTransaction();
	try { 
	    $sql = "SELECT re.id as id, re.msg as region 
				FROM region as re 
				WHERE re.status=0;";

		$result = $conn->prepare($sql);
		// Especificamos el fetch mode antes de llamar a fetch()
	    $result->setFetchMode(PDO::FETCH_ASSOC);
	    $result->execute(); 
	    //Comprobamos si encontro el registro
	    $rows=$result->rowCount();

		$regiones = array();

		//Obtiene la cantidad de filas que hay en la consulta
		//Si no existe ninguna fila, devuelvo array vacio
		if ($rows === 0) {
			$conn->commit();
			return $regiones;
		} else {
			//La variable $result contiene el array que se genera en la consulta, así que obtenemos los datos y los mostramos en un bucle
			while($row = $result->fetch()) {
				$arr_tmp['id'] = $row['id'];
				$arr_tmp['region'] = $row['region'];
				array_push($regiones, $arr_tmp);
			};//Fin while $result
		}; //Fin else $rows
		//Devolvemos el array
		$conn->commit();
		return $regiones;
	} catch (PDOException $e) { 
		// si ocurre un error hacemos rollback para anular todos los insert 
		$conn->rollback();
		return array($e->getMessage()); 
	}
}

/*
* Busco las comunas en la base de datos
* @param PDO $conn Variable de conexion PDO a la base de datos
* @return array $comunas Arreglo con todas las comunas
*/
function getComunas($conn)
{
	// iniciar transacción 
	$conn->beginTransaction();
	try { 
	    $sql = "SELECT co.id as id, co.msg as comuna, re.msg as region  
				FROM comuna as co 
				INNER JOIN region as re ON re.id = co.region 
				WHERE co.status=0;";

		$result = $conn->prepare($sql);
		// Especificamos el fetch mode antes de llamar a fetch()
	    $result->setFetchMode(PDO::FETCH_ASSOC);
	    $result->execute(); 
	    //Comprobamos si encontro el registro
	    $rows=$result->rowCount();

		$comunas = array();

		//Obtiene la cantidad de filas que hay en la consulta
		//Si no existe ninguna fila, devuelvo array vacio
		if ($rows === 0) {
			$conn->commit();
			return $comunas;
		} else {
			//La variable $result contiene el array que se genera en la consulta, así que obtenemos los datos y los mostramos en un bucle
			while($row = $result->fetch()) {
				$arr_tmp['id'] = $row['id'];
				$arr_tmp['comuna'] = $row['comuna'];
				$arr_tmp['region'] = $row['region'];
				array_push($comunas, $arr_tmp);
			};//Fin while $result
		}; //Fin else $rows
		//Devolvemos el array
		$conn->commit();
		return $comunas;
	} catch (PDOException $e) { 
		// si ocurre un error hacemos rollback para anular todos los insert 
		$conn->rollback();
		return array($e->getMessage()); 
	}
}

/*
* Busco los candidatos en la base de datos
* @param PDO $conn Variable de conexion PDO a la base de datos
* @return array $candidatos Arreglo con todos los candidatos
*/
function getCandidatos($conn)
{
	// iniciar transacción 
	$conn->beginTransaction();
	try { 
	    $sql = "SELECT ca.id as id, ca.msg as candidato  
				FROM candidato as ca 
				WHERE ca.status=0;";

		$result = $conn->prepare($sql);
		// Especificamos el fetch mode antes de llamar a fetch()
	    $result->setFetchMode(PDO::FETCH_ASSOC);
	    $result->execute(); 
	    //Comprobamos si encontro el registro
	    $rows=$result->rowCount();

		$candidatos = array();

		//Obtiene la cantidad de filas que hay en la consulta
		//Si no existe ninguna fila, devuelvo array vacio
		if ($rows === 0) {
			$conn->commit();
			return $candidatos;
		} else {
			//La variable $result contiene el array que se genera en la consulta, así que obtenemos los datos y los mostramos en un bucle
			while($row = $result->fetch()) {
				$arr_tmp['id'] = $row['id'];
				$arr_tmp['candidato'] = $row['candidato'];
				array_push($candidatos, $arr_tmp);
			};//Fin while $result
		}; //Fin else $rows
		//Devolvemos el array
		$conn->commit();
		return $candidatos;
	} catch (PDOException $e) { 
		// si ocurre un error hacemos rollback para anular todos los insert 
		$conn->rollback();
		return array($e->getMessage()); 
	}
}
?>