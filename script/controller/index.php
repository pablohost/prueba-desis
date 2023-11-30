<?php
//Conexion PDO a la base de datos
require('database.php');

//Verifico si viene el request
if (isset($_POST["request"])) {
	$request = json_decode($_POST["request"]);

	//Verifico si el rut ya voto
	if (rut_exists($request->rut, $conn)) {
		echo json_encode(array("response"=>"Rut ya tiene un voto ingresado"));
	}else{
		//Registro de voto
		if (set_votacion($request, $conn)) {
			echo json_encode(array("response"=>"Voto registrado exitosamente"));
		}else{
			echo json_encode(array("response"=>"Error, intente otra vez"));
		}
	}
}

/*
* Guardo en la base de datos la votacion
* @param JSON $request JSON con toda la informacion del formulario
* @param PDO $conn Variable de conexion PDO a la base de datos
* @return boolean TRUE: Se guardo correctamente, FALSE: Hubo un error
*/
function set_votacion($request, $conn)
{
	// iniciar transacción 
	$conn->beginTransaction();
	try { 
	    $sql = "INSERT INTO votacion(full_name,alias,rut,email,comuna,candidato,howto) VALUES (:full_name,:alias,:rut,:email,:comuna,:candidato,:howto);";

		$result = $conn->prepare($sql);

		$result->bindValue(':full_name', $request->full_name, PDO::PARAM_STR);
		$result->bindValue(':alias', $request->alias, PDO::PARAM_STR);
		$result->bindValue(':rut', $request->rut, PDO::PARAM_STR);
		$result->bindValue(':email', $request->email, PDO::PARAM_STR);
		$result->bindValue(':comuna', $request->comuna, PDO::PARAM_INT);
		$result->bindValue(':candidato', $request->candidato, PDO::PARAM_INT);
		$result->bindValue(':howto', $request->howto, PDO::PARAM_STR);
	    $result->execute(); 
	    
	    //Devolvemos TRUE
	    $conn->commit();
	    return true;
	} catch (PDOException $e) { 
		// si ocurre un error hacemos rollback para anular todos los insert 
		$conn->rollback();
		return false; 
	}
}

/*
* Verifico si el RUT ya tiene un voto registrado
* @param string $rut Rut de la persona que registra su voto
* @param PDO $conn Variable de conexion PDO a la base de datos
* @return boolean TRUE: Rut ya voto, FALSE: Rut puede votar
*/
function rut_exists($rut, $conn)
{
	// iniciar transacción 
	$conn->beginTransaction();
	try { 
	    $sql = "SELECT vo.full_name as nombre_apellido 
				FROM votacion as vo 
				WHERE vo.rut = :rut  
				AND vo.status = 0;";

		$result = $conn->prepare($sql);

		$result->bindValue(':rut', $rut, PDO::PARAM_STR);
		// Especificamos el fetch mode antes de llamar a fetch()
	    $result->setFetchMode(PDO::FETCH_ASSOC);
	    $result->execute(); 
	    //Comprobamos si encontro el registro
	    $rows=$result->rowCount();

		//Obtiene la cantidad de filas que hay en la consulta
		//Si no existe ninguna fila, devuelvo FALSE
		if ($rows === 0) {
			$conn->commit();
			return false;
		} else {
			//Devolvemos TRUE
			$conn->commit();
			return true;
		}; //Fin else $rows
	} catch (PDOException $e) { 
		// si ocurre un error hacemos rollback para anular todos los insert 
		$conn->rollback();
		return true; 
	}
}

?>