<?php
	session_start();
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');

	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT id_puesto,nombre_puesto,descripcion_puesto as descripcion FROM puestos ORDER BY nombre_puesto ASC");
		$contador=0;
		$response=array();
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$response[$contador]=array_map('utf8_encode',$data);
			$contador++;
	    }	
	    print(json_encode($response));
?>
