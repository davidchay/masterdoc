<?php 
	session_start();
	$id_usuario=$_GET['id_usuario'];
	$id_documento=$_GET['id_documento'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$consulta=$Db->query("SELECT objetivo,alcance,definiciones,responsabilidades,desarrollo,referencias,registros,anexos FROM plantilla_completa_comentarios WHERE id_documento='$id_documento' AND id_usuario='$id_usuario' ");
	$datos=array();
	while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
	{  
		$datos=array_map('utf8_encode', $data);
	}
	print(json_encode($datos));
?>