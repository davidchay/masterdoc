<?php
	require_once('config.php');
	require_once('funciones.php');
	require_once('/phpMailer/masterMail.php');
	
	/*
	*	cuando e
	*/
	//$BD=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$fecha="12/08/2014";
	$dias=getPlazo($fecha);
	echo "Faltan ".$dias." Para que se venza el plazo<br><hr><br>";


	
	
	
?>