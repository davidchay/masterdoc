<?php 
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	header("Content-Type: text/html;charset=utf-8");
	if(!$_SERVER['REQUEST_METHOD']=='POST') exit(); 
	require_once('../../config.php');
	require_once("../../MySqlDb.php");
	require_once('../../funciones.php');
	$datos=file_get_contents("php://input");
	$datoUsuario=json_decode($datos,true);
	$op=$datoUsuario['OptionSQL'];
	if($op==="guardarCambios"){
		$id_usuario=$datoUsuario['id_usuario'];
		if($datoUsuario['password']===0){
				$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
				$modificarUsuario = array(
		    		'nombre' =>ucwords(strtolower($datoUsuario['nombre'])),
					'apellidos' => ucwords(strtolower($datoUsuario['apellidos'])),
					'email' =>$datoUsuario['email'], 
					'telefono' => $datoUsuario['telefono'],
					'celular' => $datoUsuario['celular'],
					'id_puesto' => $datoUsuario['id_puesto'],
					'id_perfil'=>$datoUsuario['id_perfil'],
					'id_area'=>$datoUsuario['id_area'],
					'direccion' => ucfirst($datoUsuario['direccion'])
					);
				$Db->where('id_usuario', $id_usuario);
				$Db->update('usuarios', $modificarUsuario);
				echo '
				<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
		}else{
				//$id_usuario=$datoUsuario['id_usuario'];
				$password=$datoUsuario['password'];
				$dataBase = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
				$pass= $dataBase->query("SELECT password FROM usuarios WHERE id_usuario=$id_usuario AND password LIKE BINARY '$password' LIMIT 0,1");
				if($pass->num_rows>0){
					$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
					$modificarUsuario = array(
			    		'nombre' =>ucwords(strtolower($datoUsuario['nombre'])),
						'apellidos' => ucwords(strtolower($datoUsuario['apellidos'])),
						'email' =>$datoUsuario['email'], 
						'telefono' => $datoUsuario['telefono'],
						'celular' => $datoUsuario['celular'],
						'password' => $datoUsuario['new_pass'],
						'id_puesto' => $datoUsuario['id_puesto'],
						'id_perfil'=>$datoUsuario['id_perfil'],
						'id_area'=>$datoUsuario['id_area'],
						'direccion' => ucfirst($datoUsuario['direccion'])
						);
					$Db->where('id_usuario', $id_usuario);
					$Db->update('usuarios', $modificarUsuario);
					echo '
					<div class="alert alert-success">
			  			<button type="button" class="close" data-dismiss="alert">&times;</button>
			  			<strong>En hora buena</strong><br>
			  			Los cambios se realizaron correctamente.
					 </div>';
					
				}else{
					echo'
						<div class="alert alert-danger">
				  			<button type="button" class="close" data-dismiss="alert">&times;</button>
				  			<strong>Cambios no realizados</strong><br>
				  			<strong>¡Error!</strong> La contraseña actual no coincide.
				  		</div>
					';
				}
		}
	}

	if($op==="actualizarDatos"){
		$id_usuario=$datoUsuario['id_usuario'];
		if($datoUsuario['new_pass']===0){
				$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
				$modificarUsuario = array(
		    		'nombre' =>ucwords(strtolower($datoUsuario['nombre'])),
					'apellidos' => ucwords(strtolower($datoUsuario['apellidos'])),
					'email' =>$datoUsuario['email'], 
					'telefono' => $datoUsuario['telefono'],
					'celular' => $datoUsuario['celular'],
					'id_puesto' => $datoUsuario['id_puesto'],
					'id_perfil'=>$datoUsuario['id_perfil'],
					'id_area'=>$datoUsuario['id_area'],
					'direccion' => ucfirst($datoUsuario['direccion'])
					);
				$Db->where('id_usuario', $id_usuario);
				$Db->update('usuarios', $modificarUsuario);
				echo '
				<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
		}else{
				//$id_usuario=$datoUsuario['id_usuario'];
				$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
				$modificarUsuario = array(
		    		'nombre' =>ucwords(strtolower($datoUsuario['nombre'])),
					'apellidos' => ucwords(strtolower($datoUsuario['apellidos'])),
					'email' =>$datoUsuario['email'], 
					'telefono' => $datoUsuario['telefono'],
					'celular' => $datoUsuario['celular'],
					'password' => $datoUsuario['new_pass'],
					'id_puesto' => $datoUsuario['id_puesto'],
					'id_perfil'=>$datoUsuario['id_perfil'],
					'id_area'=>$datoUsuario['id_area'],
					'direccion' => ucfirst($datoUsuario['direccion'])
					);
				$Db->where('id_usuario', $id_usuario);
				$Db->update('usuarios', $modificarUsuario);
				echo '
				<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			Los cambios se realizaron correctamente.
				 </div>';
			
				
		}
	}


	/// opcion nuevo usuario
	if($op === "nuevo"){
		$nuevo = array(
			'nombre' =>ucwords(strtolower($datoUsuario['nombre'])),
			'apellidos' => ucwords(strtolower($datoUsuario['apellidos'])),
			'direccion' => ucfirst($datoUsuario['direccion']),
			'email' =>$datoUsuario['email'], 
			'telefono' => $datoUsuario['telefono'],
			'celular' => $datoUsuario['celular'],
			'id_puesto' => $datoUsuario['id_puesto'],
			'user' => $datoUsuario['usuario'],
			'password' => $datoUsuario['password'],
			'id_perfil'=>$datoUsuario['id_perfil'],
			'id_area'=>$datoUsuario['id_area']
		);
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->insert('usuarios', $nuevo);
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			El nuevo usuario <strong>'.$datoUsuario['usuario'].'</strong> se agrego a la base de datos correctamente.<br>
		  		</div>';

		  
	} // finaliza Nuevo usuario

	if($op === "usuarioDisponible" ){
		$usuario=$datoUsuario['usuario'];
		$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$Db->query("SET NAMES 'utf8'");
		
		$diponible = $Db->query("SELECT user FROM usuarios WHERE user = '$usuario' LIMIT 0,1");
		if($diponible->num_rows>0){
			$response['error']=1;
			$response['mensage']='
				<div class="alert alert-danger">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			El nombre de usuario no esta disponible, por favor elija otro.
		  		</div>
			';
		  	return print(json_encode($response));
		}else{
			$response['error']=0;
			return print(json_encode($response));
		}
		
		
	}	//finaliza actualizar
	if($op === "eliminar"){
		$id_usuario=intval($datoUsuario['id_usuario']);
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->query("SET NAMES 'utf8'");
		$Db->where('id_usuario',$id_usuario);
		$Db->delete('usuarios');
	}//finaliza eliminar
	
?>