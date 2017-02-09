<?php
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$q=$_GET['term'];
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT id_usuario,nombre,apellidos,id_perfil FROM usuarios  WHERE MATCH(nombre,apellidos) AGAINST ('$q') AND id_perfil<4");
	if($sql->num_rows==0){
		return false;	
	}else{
		$contador=0;
		$response=array();
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$response[$contador]['id_usuario']=$data['id_usuario'];
			$response[$contador]['nombre_completo']=$data['nombre'].' '.$data['apellidos'];
			$response[$contador]['id_perfil']=$data['id_perfil'];
			$response[$contador]['label']=$data['nombre'].' '.$data['apellidos'];
			$response[$contador]['value']=$data['id_usuario'];
			$contador++;
	    }	
	    print(json_encode($response));
	}	
?>
