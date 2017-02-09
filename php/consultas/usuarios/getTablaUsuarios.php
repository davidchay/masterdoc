<?php
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	$id_perfil=$_SESSION['MD_ID_PERFIL'];
	if($id_perfil>0) exit();
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql=$Db->query("SELECT id_usuario,nombre,apellidos,email,telefono,celular,user as usuario,id_puesto,id_perfil,perfil,nombre_area as area 
					FROM usuarios,perfil,areas
					WHERE id_perfil=id AND areas.id_area=usuarios.id_area ORDER BY nombre ASC");
	if($sql->num_rows==0){
		return false;	
	}else{
		$usuarios=array();
		$contador=0;
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$usuarios[$contador]=array_map('utf8_encode', $data);
			$contador++;
	    }	
	   print(json_encode($usuarios));
	}	
?>
