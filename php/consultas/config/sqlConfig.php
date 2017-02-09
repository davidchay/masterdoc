<?php
	session_start();
	$id_perfil=$_SESSION['MD_ID_PERFIL'];
	if($id_perfil>0)exit();	 
	header("Content-Type: text/html;charset=utf-8");
	if(!$_SERVER['REQUEST_METHOD']=='POST') exit(); 
	require_once('../../config.php');
	$datos=file_get_contents("php://input");
	$datoConfig=json_decode($datos,true);
	
	$op=$datoConfig['OptionSQL'];
	if($op==="guardarND"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='nuevoDoc' AND destino='$destinatario'");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}	
	if($op==="guardarRevision"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='revision' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}	
	if($op==="guardarAprobacion"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='autorizacion' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}	
	if($op==="guardarEdicion"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='edicion' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}

	if($op==="guardarEliminado"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='eliminado' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}
	if($op==="guardarAprobado"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='aprobado' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}

	if($op==="guardarRevisionDoc"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='revisionDoc' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}
	if($op==="guardarObsoleto"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='obsoleto' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}
	if($op==="guardarPermiso"){
		$Db = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS);
		mysqli_set_charset($Db, "utf8");
		foreach ($datoConfig as $destinatario => $mensaje) {
			if($destinatario!='OptionSQL'){
				$Db->query("UPDATE messages_mail SET mensaje='$mensaje' WHERE opcion='permiso' AND destino='$destinatario' ");
			}
		}
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}
?>