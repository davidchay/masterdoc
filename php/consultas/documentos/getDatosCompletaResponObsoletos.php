<?php 
	session_start();
	$id_documento=$_GET['id_documento'];
	$consec=$_GET['consecutivo'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$consulta=$Db->query("SELECT area,acciones 
						FROM plantilla_completa_responsabilidades_obsoletos 
						WHERE id_documento=$id_documento
						AND consecutivo=$consec");
		
	$datos=array();
	$count=0;
	while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
	{  
			$datos[$count]=array_map('utf8_encode', $data);
			$count++;
	}
	print(json_encode($datos));
?>