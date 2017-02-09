<?php
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db= new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT *	FROM messages_mail");
	$tipo_doc=array();
	while($data=$sql->fetch_array(MYSQLI_ASSOC)) 
	{  
		$op=$data['opcion'];
		$destino=$data['destino'];
		$mensajes[$op][$destino]=array_map('utf8_encode', $data);
	}	
	print(json_encode($mensajes));
?>
