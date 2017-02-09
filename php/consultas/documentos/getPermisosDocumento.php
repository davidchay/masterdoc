<?php 
	session_start();
	$id_puesto=$_SESSION['MD_ID_PUESTO'];
	$id_documento=$_GET['id_documento'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$consulta=$Db->query("SELECT * FROM permisos_documento_puestos WHERE id_documento=$id_documento AND id_puesto=$id_puesto");
	if($consulta->num_rows>0){	
		print("1");
	}else{
		print("0");
	}
	
?>