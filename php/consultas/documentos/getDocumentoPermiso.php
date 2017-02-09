<?php 
	session_start();
	$id_documento=$_GET['id_documento'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$consulta=$Db->query("SELECT * FROM permisos_documento_puestos WHERE id_documento=$id_documento");
		$detalles=array();
	$contador=0;
	while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
	{  
			$detalles[$contador]['id_documento']=$data['id_documento'];
			$detalles[$contador]['id_puesto']=$data['id_puesto'];
			$contador=$contador+1;
	}
	print(json_encode($detalles));
?>