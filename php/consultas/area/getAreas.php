<?php
	session_start();
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT id_area,nombre_area as area,CONCAT(nombre_area,' ( ',codigo_area,' )') as nombre_area,codigo_area as codigo,descripcion_area as descripcion FROM areas ORDER BY nombre_area ASC");
	if($sql->num_rows==0){
		return false;	
	}else{
		$areas=array();
		$contador=0;
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$areas[$contador]=array_map('utf8_encode', $data);
			$contador++;
	    }	
	     print(json_encode($areas));
	}	
?>
