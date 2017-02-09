<?php
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	header("Content-Type: text/html;charset=utf-8");
	if(!$_SERVER['REQUEST_METHOD']=='POST') exit(); 
	require_once('../../config.php');
	require_once("../../MySqlDb.php");
	require_once('../../funciones.php');
	$datos=file_get_contents("php://input");
	$datoArea=json_decode($datos,true);
	$op=$datoArea['OptionSQL'];
	if($op==="agregarArea"){
		$nuevo = array(
			'nombre_area' =>ucwords(strtolower($datoArea['nombre_area'])),
			'codigo_area' => strtoupper($datoArea['codigo_area']),
			'descripcion_area' => ucfirst($datoArea['descripcion_area']),
		);
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->insert('areas', $nuevo);
		$query = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$last_id=$query->query("SELECT MAX(id_area) AS id FROM areas");
		while($id = $last_id->fetch_object()) {  
    		$ultimo_id=$id->id;
		}
		$response['id_area']=$ultimo_id;
		$response['mensaje']='<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			La nueva <strong>Area</strong> se agrego a la base de datos correctamente.<br>
	  		</div>';
	  	return print(json_encode($response));  
	}	
	if($op==="actualizarArea"){
		$id_area=$datoArea['id_area'];
		$update = array(
			'nombre_area' =>$datoArea['nombre_area'],
			'codigo_area' => $datoArea['codigo_area'],
			'descripcion_area' => $datoArea['descripcion_area']
		);
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->where('id_area',$id_area);
		$Db->update('areas', $update);
		
	}
	if($op==="eliminarArea"){
		$id_area=$datoArea['id_area'];
		$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
		$Db->where('id_area',$id_area);
		$Db->delete('areas');
		
	}
?>