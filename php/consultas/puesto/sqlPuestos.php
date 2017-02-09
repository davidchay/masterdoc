<?php
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	header("Content-Type: text/html;charset=utf-8");
	if(!$_SERVER['REQUEST_METHOD']=='POST') exit(); 
	require_once('../../config.php');
	require_once("../../MySqlDb.php");
	require_once('../../funciones.php');
	$datos=file_get_contents("php://input");
	$datoPuesto=json_decode($datos,true);
	$op=$datoPuesto['OptionSQL'];
	if($op==="agregarPuesto"){
		$nuevo = array(
			'nombre_puesto' =>ucwords(strtolower($datoPuesto['nombre_puesto'])),
			'descripcion_puesto' => ucfirst($datoPuesto['descripcion_puesto'])
		);
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->insert('puestos', $nuevo);
		$query = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$last_id=$query->query("SELECT MAX(id_puesto) AS id FROM puestos");
		while($id = $last_id->fetch_object()) {  
    		$ultimo_id=$id->id;
		}
		$response['id_puesto']=$ultimo_id;
		$response['mensaje']='<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			El nuevo <strong>Puesto</strong> se agrego a la base de datos correctamente.<br>
	  		</div>';
	  	return print(json_encode($response));  
	}	
	if($op==="actualizarPuesto"){
		$id_puesto=$datoPuesto['id_puesto'];
		$update = array(
			'nombre_puesto' =>$datoPuesto['nombre_puesto'],
			'descripcion_puesto' => $datoPuesto['descripcion_puesto']
		);
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->where('id_puesto',$id_puesto);
		$Db->update('puestos', $update);
		
	}
	if($op==="eliminarPuesto"){
		$id_puesto=$datoPuesto['id_puesto'];
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->where('id_puesto',$id_puesto);
		$Db->delete('puestos');
		
	}
?>