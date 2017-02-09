<?php
	session_start();
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT id as id_perfil, perfil FROM perfil ORDER BY id ASC");
	if($sql->num_rows==0){
		return false;	
	}else{
		
		$perfiles=array();
		$contador=0;
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$perfiles[$contador]=array_map('utf8_encode', $data);
			$contador++;
	    }	
	     print(json_encode($perfiles));
	   
	}	
?>
