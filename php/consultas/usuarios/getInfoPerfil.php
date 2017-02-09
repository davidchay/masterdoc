<?php
	session_start();
	$id_perfil_user=$_GET['id_perfil'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT id_usuario,nombre,apellidos,direccion,email,telefono,celular,id_puesto,user,id_area,id_perfil 
						FROM usuarios WHERE id_usuario=$id_perfil_user LIMIT 1");
	if($sql->num_rows==0){
		return false;	
	}else{
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$usuario=array_map('utf8_encode', $data);
	    }	
	   print(json_encode($usuario));
	}	
?>
