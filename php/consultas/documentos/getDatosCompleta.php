<?php 
	session_start();
	$id_documento=$_GET['id_documento'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$consulta=$Db->query("SELECT objetivo,alcance,definiciones,desarrollo,referencias,anexos FROM plantilla_completa WHERE id_documento=$id_documento");
		
	$datos=array();
	while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
	{  
			$datos=array_map('utf8_encode', $data);
	}
	print(json_encode($datos));
?>