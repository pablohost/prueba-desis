<?php
require('database.php');

if (isset($_POST["request"])) {
	$request = json_decode($_POST["request"]);

	if (rut_exists($request->rut, $conn)) {
		echo json_encode('{"response": "Rut ya tiene un voto ingresado"}');
	}else{
		if (set_votacion($request, $conn)) {
			echo json_encode('{"response": "Voto registrado exitosamente"}');
		}else{
			echo json_encode('{"response": "Error, intente otra vez"}');
		}
	}
}


//echo $request;
/*
if (rut_exists($request->rut, $conn)) {
	echo json_encode('{"response": "Rut puede votar"}');
}else{
	echo json_encode('{"response": "Rut ya tiene un voto ingresado"}');
}
*/
//echo json_encode($_POST);
//var_dump($_POST);
/*
foreach ($_POST as $key => $value) {
    echo "Field ".$key." is ".$value."<br>";
}
*/
/*
$comboboxes['regiones'] = getRegiones($connection);
$comboboxes['comunas'] = getComunas($connection);
$comboboxes['candidatos'] = getCandidatos($connection);

echo json_encode($comboboxes);
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
	    
	    $conn->commit();
	    return true;
	} catch (PDOException $e) { 
		// si ocurre un error hacemos rollback para anular todos los insert 
		$conn->rollback();
		echo $e->getMessage();
		return false; 
	}
}

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
		return false; 
	}
}

?>