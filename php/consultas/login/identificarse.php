<?php 
	//if(!$_SERVER['REQUEST_METHOD']=='POST') exit(); 
	require_once("../../config.php");
	require_once("../../MySqlDb.php");
	require_once("../../funciones.php");
	$datos=file_get_contents("php://input");
	$datoUsuario=json_decode($datos,true);
	/// opcion nuevo Documento
	$usuario=$datoUsuario['usuario'];
	$password=$datoUsuario['password'];
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$login = $Db->query("SELECT id_usuario,nombre,apellidos,user,password,usuarios.id_perfil,id_puesto,perfil FROM usuarios,perfil WHERE usuarios.id_perfil=perfil.id AND user LIKE BINARY '$usuario' AND password LIKE BINARY '$password' LIMIT 0,1");
	if($login->num_rows>0){
		if(!isset($_SESSION['MD_USER'])){ 
    		session_start(); 
		}
		while ($datos=$login->fetch_assoc()) {
			$_SESSION['MD_USER']=$datos['user'];
			$_SESSION['MD_ID_USER']=$datos['id_usuario'];
			$_SESSION['MD_NOMBRE_USER']=$datos['nombre'];
			$_SESSION['MD_APELLIDOS_USER']=$datos['apellidos'];
			$_SESSION['MD_ID_PERFIL']=$datos['id_perfil'];
			$_SESSION['MD_ID_PUESTO']=$datos['id_puesto'];
			$_SESSION['MD_PERFIL']=$datos['perfil'];
			
		}
		$response['error']=0;
		return print(json_encode($response));
		
	}else{
		$response['error']=1;
		$response['mensage']='
			<div class="alert alert-warning">
	  			<button type="button" class="close" data-dismiss="alert">&times;</button>
	  			Ususario y/o Contraseña incorrectos.
	  		</div>
		';
	  	return print(json_encode($response));
	}
	
	
?>