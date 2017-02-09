<?php
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$sql = $Db->query("SELECT id_usuario,nombre,apellidos,direccion,email,telefono,celular,id_puesto,user,id_area,id_perfil 
						FROM usuarios WHERE id_usuario=$id_usuario LIMIT 1");
	if($sql->num_rows==0){
		return false;	
	}else{
		$usuario_perfil=array();
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$usuario_perfil=array_map('utf8_encode',$data);
		}	
	   print(json_encode($usuario_perfil));
	}	
?>
