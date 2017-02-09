<?php
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db= new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT id_tipo_doc,nombre_tipo_doc,codigo_doc,descripcion_doc, CONCAT(nombre_tipo_doc, ' ( ',codigo_doc,' )') AS tipo_doc
						FROM tipo_documento ORDER BY nombre_tipo_doc ASC");
	$tipo_doc=array();
	$contador=0;
	while($data=$sql->fetch_array(MYSQLI_ASSOC)) 
	{  
		$tipo_doc[$contador]=array_map('utf8_encode', $data);
		$contador++;
	}	
	print(json_encode($tipo_doc));
?>
