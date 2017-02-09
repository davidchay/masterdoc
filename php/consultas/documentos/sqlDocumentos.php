<?php 
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	header("Content-Type: text/html;charset=utf-8");
	if(!$_SERVER['REQUEST_METHOD']=='POST') exit(); 
	require_once('../../config.php');
	require_once("../../MySqlDb.php");
	require_once('../../funciones.php');
	require_once('../../phpMailer/masterMail.php');
	$Db = new MySqlDb(SERVIDOR, USUARIO, CLAVE, BDATOS);
	$datos=file_get_contents("php://input");
	$datoDocumento=json_decode($datos,true);
	$op=$datoDocumento['OptionSQL'];
	/// opcion nuevo Documento
	if($op === "nuevo"){
		$response=array();
		$response['error']=0;
		$response['mensaje']="";
		//Comprobando privilegios revisor
		if(!checkPerfil($datoDocumento['id_revisor'],"Revisor"))
		{
			$response['error']=1;
			$response['mensaje']='<div class="alert alert-warning">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡Error!</strong><br>
		  				El usuario que eligio para revisor, no tiene los permisos necesarios para revisar docuemntos.
		  		</div>';	
		}
		//Comprovando privilegios autorizador
		if(!checkPerfil($datoDocumento['id_autorizador'],"autorizador"))
		{
			$response['error']=1;
			$response['mensaje'].='<div class="alert alert-warning">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡Error!</strong><br>
		  				El usuario que eligio para autorizador, no tiene los permisos necesarios para la aprobación de documentos.
		  		</div>';
		}
		if($response['error']>0){
			return print(json_encode($response));
			exit();
		} 
		$meses = array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
		date_default_timezone_set('Mexico/General');
		$id_area=$datoDocumento['id_area'];
		$id_tipo_doc=$datoDocumento['id_tipo_doc'];
		$nuevoDocumento = array(
			'nombre_doc' =>ucwords( strtolower($datoDocumento['nombre_doc'])),
			'id_tipo_doc' =>$datoDocumento['id_tipo_doc'],
 			'id_area'=>$datoDocumento['id_area'],
 			'mes'=>$meses[(date('n')-1)],
 			'anio'=>date('Y'),
 			'id_creador'=>$datoDocumento['id_creador'],
 			'id_revisor'=>$datoDocumento['id_revisor'],
 			'id_autorizador'=>$datoDocumento['id_autorizador'],
			'fecha_creacion'=>date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs."  
		);
		$Db->insert('documento', $nuevoDocumento);
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$sql=$Bd->query("SELECT numero_concecutivo FROM documento WHERE id_tipo_doc=$id_tipo_doc and id_area=$id_area ORDER BY numero_concecutivo DESC LIMIT 1");
		$n='';
		while($last_doc = $sql->fetch_object()) {
				if($last_doc->numero_concecutivo!=''){
					$clear=trim($last_doc->numero_concecutivo);
					$n_concecutivo=(int)$clear + 1;
					$n=str_pad($n_concecutivo, 3, "0", STR_PAD_LEFT);  
				}else{
					$n="001";
				}  
		}
		if($sql=$Bd->query('SELECT MAX(id_documento) AS id FROM documento')){
				while($id = $sql->fetch_object()) {  
		    		$ultimo_id=$id->id;
				}		
		}
		crear_documento($id_tipo_doc,$ultimo_id);
		$Bd->query("UPDATE documento SET numero_concecutivo='$n' WHERE id_documento=$ultimo_id");
		/*Envio de email*/ 		
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$ultimo_id=(int)$ultimo_id;
		$id_tipo_doc=(int)$id_tipo_doc;
		$correo->nuevoDoc($ultimo_id,$id_tipo_doc);
		$response['mensaje']='<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			El documento se creo correctamente.<br>
		  			El documento esta listo para su elaboraci&oacute;n.
		  		</div>';
		return print(json_encode($response));
	} // finaliza Nuevo Documento
	if ($op==="eliminarDoc") {
		$id_documento=$datoDocumento['id_documento'];
		$tabla=$datoDocumento['tabla'];
		$tipoDoc=0;
		$meses = array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
		date_default_timezone_set('Mexico/General');
		$fecha_eliminado=date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
		$justificacion=$datoDocumento['justificacion'];
		$Db=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Db, "utf8");
		$Db->query("UPDATE documento SET fecha_eliminado='$fecha_eliminado' WHERE id_documento=$id_documento");
		$Db->query("UPDATE documento SET justificacion_eliminado='$justificacion' WHERE id_documento=$id_documento");
		switch ($tabla) {
			case 'cp':
				$Db->query("UPDATE plantilla_completa SET estado='Eliminado' WHERE id_documento=$id_documento");
				$tipoDoc=1;
			break;
			case 'bs':
				$Db->query("UPDATE plantilla_basica SET estado='Eliminado' WHERE id_documento=$id_documento");
				$tipoDoc=3;
			break;
		}
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		if($tipoDoc>0)
		{
			$correo->eliminado($id_documento,$tipoDoc);
		}
	}//finaliza eliminar documento
	if ($op==="restaurarDoc") {
		$id_documento=$datoDocumento['id_documento'];
		$tabla=$datoDocumento['tabla'];
		$Db=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Db, "utf8");
		$Db->query("UPDATE documento SET fecha_eliminado='' WHERE id_documento=$id_documento");
		$Db->query("UPDATE documento SET justificacion_eliminado='' WHERE id_documento=$id_documento");
		switch ($tabla) {
			case 'cp':
				$Db->query("UPDATE plantilla_completa SET estado='Edición' WHERE id_documento=$id_documento");
				
			break;
			case 'bs':
				$Db->query("UPDATE plantilla_basica SET estado='Edición' WHERE id_documento=$id_documento");
			break;
		}
		
	}//finaliza restaurar documento

	if($op==="cambiarNombreDoc"){
		$id_documento=$datoDocumento['id_documento'];
		$nombre=$datoDocumento['nombre_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd,"utf8");
		$Bd->query("UPDATE documento SET nombre_doc='$nombre' WHERE id_documento=$id_documento");
	}//cambiar nombre documento
	/// Editar despues de dar de alta al alumno
	if($op === "guardarCpCambios" ){
		$id_documento=$datoDocumento['id_documento'];
		$responsabilidades=$datoDocumento['responsabilidades'];
		$registros=$datoDocumento['registros'];
		date_default_timezone_set('Mexico/General');
		$date=date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
		$Db=new MySqlDb(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$datos = array(
		    	'objetivo' =>$datoDocumento['objetivo'],
				'alcance' => $datoDocumento['alcance'],
				'definiciones' =>$datoDocumento['definiciones'], 
				'desarrollo' => $datoDocumento['desarrollo'],
				'referencias' => $datoDocumento['referencias'],
				'anexos' => $datoDocumento['anexos']
			);
		$Db->where('id_documento', $id_documento);
		$Db->update('plantilla_completa', $datos);
		$q=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($q, "utf8");
		$q->query("DELETE FROM plantilla_completa_responsabilidades WHERE id_documento=$id_documento");
		for($i=0;$i<count($responsabilidades); $i++){
				$area=$responsabilidades[$i]['area'];
				$acciones=$responsabilidades[$i]['acciones'];
				$q->query("INSERT INTO plantilla_completa_responsabilidades (id_documento,area,acciones) 
						VALUES('$id_documento','$area','$acciones')");
		};
		$q->query("DELETE FROM plantilla_completa_registros WHERE id_documento=$id_documento");
		for($i=0;$i<count($registros); $i++){
				$nombre_registro=$registros[$i]['nombre_registro'];
				$codigo=$registros[$i]['codigo'];
				$responsable=$registros[$i]['responsable'];
				$tiempo_resguardo=$registros[$i]['tiempo_resguardo'];
				$q->query("INSERT INTO plantilla_completa_registros (id_documento,nombre_registro,codigo,responsable,tiempo_resguardo) 
						VALUES('$id_documento','$nombre_registro','$codigo','$responsable','$tiempo_resguardo')");
		};
		
		$q->query("UPDATE documento SET fecha_ultima_mod='$date' WHERE id_documento='$id_documento' ");
		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los cambios se realizarón correctamente.
				 </div>';
	}	//finaliza actualizar

	if($op=="permisos_doc"){
		$id_documento=$datoDocumento['id_documento'];
		$ids_puestos=$datoDocumento['puestos'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		
		$Bd->query("DELETE FROM permisos_documento_puestos WHERE id_documento=$id_documento");
		for($i=0;$i<count($ids_puestos);$i++){
			$id_puesto=$ids_puestos[$i]['id_puesto'];
			$Bd->query("INSERT INTO permisos_documento_puestos(id_documento,id_puesto) VALUES('$id_documento','$id_puesto')");
		}

		$datos=$Bd->query("SELECT id_tipo_doc FROM documento WHERE id_documento=$id_documento");
		while($data = $datos->fetch_array(MYSQLI_ASSOC)) 
		{  
			$tipoDoc=$data['id_tipo_doc'];
		}

		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->permiso(intval($id_documento),intval($tipoDoc));

		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los permisos se guardaron correctamente.
				 </div>';
			
	}

	if($op === "enviarRevisionCp"){
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_completa SET estado='Revisión' WHERE id_documento=$id_documento");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->toRevision($id_documento,1);

	}//finaliza enviar Revision
	if($op === "enviarAprobacionCp"){
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_completa SET estado='Aprobación' WHERE id_documento=$id_documento");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->toAprobacion($id_documento,1);
	}//finaliza enviar aprobacion
	if($op === "enviarEdicionCp"){
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_completa SET estado='Edición' WHERE id_documento=$id_documento");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->toEdicion($id_documento,1);
	}//finaliza enviar edicion
	if($op==="AutorizarDocCp"){
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_completa SET estado='Autorizado' WHERE id_documento=$id_documento");
		$Bd->query("UPDATE plantilla_completa_obsoletos SET estado='Obsoleto' WHERE id_documento=$id_documento");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->aprobado($id_documento,1);
	}//finaliza documento Autorizado
	
	if($op === "guardarCommentCp"){
		$id_usuario=$datoDocumento['id_usuario'];
		$id_documento=$datoDocumento['id_documento'];
		$objetivo=$datoDocumento['objetivo'];
		$alcance=$datoDocumento['alcance'];
		$definiciones=$datoDocumento['definiciones'];
		$responsabilidades=$datoDocumento['responsabilidades'];
		$desarrollo=$datoDocumento['desarrollo'];
		$referencias=$datoDocumento['referencias'];
		$registros=$datoDocumento['registros'];
		$anexos=$datoDocumento['anexos'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$query=$Bd->query("INSERT INTO plantilla_completa_comentarios (id_usuario,id_documento,objetivo,alcance,definiciones,desarrollo,referencias,responsabilidades,registros,anexos)
					VALUES($id_usuario,$id_documento,'$objetivo','$alcance','$definiciones','$desarrollo','$referencias','$responsabilidades','$registros','$anexos')
					ON DUPLICATE KEY UPDATE
					id_documento=$id_documento,objetivo='$objetivo',alcance='$alcance',
					definiciones='$definiciones',desarrollo='$desarrollo',
					referencias='$referencias',responsabilidades='$responsabilidades',registros='$registros',anexos='$anexos'");

		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los comentarios se guardaron correctamente.
				 </div>';

	}// Guardar comentarios
	
	
	

	if($op === "nuevaRevision"){
		$id_documento=$datoDocumento['id_documento'];
		$usuario=$datoDocumento['usuario'];
		$descripcion=$datoDocumento['descripcion'];
		$justificacion=$datoDocumento['justificacion'];
		date_default_timezone_set('Mexico/General');
		$fecha_cambio=date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		
		$Bd->query("INSERT INTO plantilla_completa_revisiones(id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario) 
					VALUES($id_documento,'$fecha_cambio','$descripcion','$justificacion','$usuario')");
		
		$Bd->query("INSERT INTO plantilla_completa_obsoletos(id_documento,rev,estado,objetivo,alcance,definiciones,desarrollo,referencias,anexos) 
					SELECT id_documento,rev,estado,objetivo,alcance,definiciones,desarrollo,referencias,anexos
					FROM plantilla_completa where id_documento=$id_documento");

		$sql=$Bd->query('SELECT MAX(consecutivo) AS id FROM plantilla_completa_obsoletos');
		while($id = $sql->fetch_object()) {  
			$ultimo_consecutivo=$id->id;
		};		
		
		$Bd->query("INSERT INTO plantilla_completa_registros_obsoletos(consecutivo,id_documento,nombre_registro,codigo,responsable,tiempo_resguardo) 
					SELECT $ultimo_consecutivo,id_documento,nombre_registro,codigo,responsable,tiempo_resguardo
					FROM plantilla_completa_registros WHERE id_documento=$id_documento");

		$Bd->query("INSERT INTO plantilla_completa_responsabilidades_obsoletos(consecutivo,id_documento,area,acciones) 
					SELECT $ultimo_consecutivo,id_documento,area,acciones
					FROM plantilla_completa_responsabilidades WHERE id_documento=$id_documento");

		$Bd->query("INSERT INTO plantilla_completa_revisiones_obsoletos(consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario) 
					SELECT $ultimo_consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario
					FROM plantilla_completa_revisiones WHERE id_documento=$id_documento ");

		$Bd->query("UPDATE plantilla_completa SET rev=CHAR(ascii(rev)+1),estado='Edición' WHERE id_documento=$id_documento");
		
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->revisionDoc($id_documento,1);

		echo '
		<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			Se ha creado una nueva revisión. <br>
		  			Esta revisión a quedado como obsoleta.
		  		</div>';
		
	}//finaliza documento nueva revision

	if($op==="docObsoletoCp"){
		$id_documento=$datoDocumento['id_documento'];
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->obsoleto($id_documento,1);

		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("INSERT INTO plantilla_completa_obsoletos(id_documento,rev,estado,objetivo,alcance,definiciones,desarrollo,referencias,anexos) 
					SELECT id_documento,rev,'Obsoleto',objetivo,alcance,definiciones,desarrollo,referencias,anexos
					FROM plantilla_completa where id_documento=$id_documento");

		$sql=$Bd->query('SELECT MAX(consecutivo) AS id FROM plantilla_completa_obsoletos');
		while($id = $sql->fetch_object()) {  
			$ultimo_consecutivo=$id->id;
		};		
		
		$Bd->query("INSERT INTO plantilla_completa_registros_obsoletos(consecutivo,id_documento,nombre_registro,codigo,responsable,tiempo_resguardo) 
					SELECT $ultimo_consecutivo,id_documento,nombre_registro,codigo,responsable,tiempo_resguardo
					FROM plantilla_completa_registros WHERE id_documento=$id_documento");

		$Bd->query("INSERT INTO plantilla_completa_responsabilidades_obsoletos(consecutivo,id_documento,area,acciones) 
					SELECT $ultimo_consecutivo,id_documento,area,acciones
					FROM plantilla_completa_responsabilidades WHERE id_documento=$id_documento");

		$Bd->query("INSERT INTO plantilla_completa_revisiones_obsoletos(consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario) 
					SELECT $ultimo_consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario
					FROM plantilla_completa_revisiones WHERE id_documento=$id_documento ");

		$Bd->query("DELETE FROM plantilla_completa WHERE id_documento=$id_documento");
		$Bd->query("DELETE FROM plantilla_completa_registros WHERE id_documento=$id_documento");
		$Bd->query("DELETE FROM plantilla_completa_responsabilidades WHERE id_documento=$id_documento");
		$Bd->query("DELETE FROM plantilla_completa_revisiones WHERE id_documento=$id_documento");
		$Bd->query("DELETE FROM plantilla_completa_comentarios WHERE id_documento=$id_documento");
		
		echo '
		<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			El documento se hizo obsoleto. 
		  		</div>';
		
	}



	/***************************************
			Plantilla basica
	****************************************/
	if($op === "enviarRevisionBs"){
		date_default_timezone_set('Mexico/General');
		$date=date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_basica SET estado='Revisión' WHERE id_documento=$id_documento");
		$Bd->query("UPDATE documento SET fecha_ultima_mod='$date' WHERE id_documento='$id_documento' ");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->toRevision($id_documento,3);
	}//finaliza enviar Revision
	if($op === "enviarAprobacionBs"){
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_basica SET estado='Aprobación' WHERE id_documento=$id_documento");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->toAprobacion($id_documento,3);
	}//finaliza enviar aprobacion
	if($op === "enviarEdicionBs"){
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_basica SET estado='Edición' WHERE id_documento=$id_documento");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->toEdicion($id_documento,3);
	}//finaliza enviar edicion
	if($op==="AutorizarDocBs"){
		$id_documento=$datoDocumento['id_documento'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("UPDATE plantilla_basica SET estado='Autorizado' WHERE id_documento=$id_documento");
		$Bd->query("UPDATE plantilla_basica_obsoletos SET estado='Obsoleto' WHERE id_documento=$id_documento");
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->aprobado($id_documento,3);
	}//finaliza documento Autorizado
	

	if($op === "guardarCommentBs"){
		$id_usuario=$datoDocumento['id_usuario'];
		$id_documento=$datoDocumento['id_documento'];
		$comentario=$datoDocumento['comentario'];
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$query=$Bd->query("INSERT INTO plantilla_basica_comentarios (id_usuario,id_documento,comentario)
					VALUES($id_usuario,$id_documento,'$comentario')
					ON DUPLICATE KEY UPDATE
					id_documento=$id_documento,comentario='$comentario'");

		echo '<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>¡En hora buena!</strong><br>
		  			Los comentarios se guardaron correctamente.
				 </div>';

	}// Guardar comentarios

	if($op === "nuevaRevisionBs"){
		$id_documento=$datoDocumento['id_documento'];
		$usuario=$datoDocumento['usuario'];
		$descripcion=$datoDocumento['descripcion'];
		$justificacion=$datoDocumento['justificacion'];
		$file_name=$datoDocumento['file'];
		date_default_timezone_set('Mexico/General');
		$fecha_cambio=date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		
		$Bd->query("INSERT INTO plantilla_basica_revisiones(id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario) 
					VALUES($id_documento,'$fecha_cambio','$descripcion','$justificacion','$usuario')");
	
		$Bd->query("INSERT INTO plantilla_basica_obsoletos(id_documento,rev,estado) 
					SELECT id_documento,rev,estado
					FROM plantilla_basica where id_documento=$id_documento");		
		
		$sql=$Bd->query('SELECT MAX(consecutivo) AS id FROM plantilla_basica_obsoletos');
		while($id = $sql->fetch_object()) {  
			$ultimo_consecutivo=$id->id;
		};		
		
		$Bd->query("INSERT INTO plantilla_basica_revisiones_obsoletos(consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario) 
					SELECT $ultimo_consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario
					FROM plantilla_completa_revisiones WHERE id_documento=$id_documento ");


		
		$Bd->query("UPDATE plantilla_basica SET rev=CHAR(ascii(rev)+1),estado='Edición' WHERE id_documento=$id_documento");
		
		$romper = explode("-", $file_name);
		$tipo_doc=$romper[0];
		$area=$romper[1];
		$consecutivo=$romper[2];
		$rev=$romper[3];
		$new_rev=chr(ord($rev)+1);
		$new_file="$tipo_doc-$area-$consecutivo-$new_rev.pdf";
		copy("../../../pdfs/".$file_name,"../../../pdfs/".$new_file);
    	
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->revisionDoc($id_documento,3);

		echo '
		<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			Se ha creado una nueva revisión. <br>
		  			Esta revisión a quedado como obsoleta.
		  		</div>';
	}//finaliza documento nueva revision BS

	if($op==="docObsoletoBs"){
		$id_documento=$datoDocumento['id_documento'];
		$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$correo->obsoleto($id_documento,3);
		$Bd=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		mysqli_set_charset($Bd, "utf8");
		$Bd->query("INSERT INTO plantilla_basica_obsoletos(id_documento,rev,estado) 
					SELECT id_documento,rev,'Obsoleto'
					FROM plantilla_basica where id_documento=$id_documento");		
		
		$sql=$Bd->query('SELECT MAX(consecutivo) AS id FROM plantilla_basica_obsoletos');
		while($id = $sql->fetch_object()) {  
			$ultimo_consecutivo=$id->id;
		};		
		
		$Bd->query("INSERT INTO plantilla_basica_revisiones_obsoletos(consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario) 
					SELECT $ultimo_consecutivo,id_documento,fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario
					FROM plantilla_completa_revisiones WHERE id_documento=$id_documento ");

		$Bd->query("DELETE FROM plantilla_basica WHERE id_documento=$id_documento");
		$Bd->query("DELETE FROM plantilla_basica_comentarios WHERE id_documento=$id_documento");
		
		echo '
		<div class="alert alert-success">
		  			<button type="button" class="close" data-dismiss="alert">&times;</button>
		  			<strong>En hora buena</strong><br>
		  			El documento se hizo obsoleto. 
		  		</div>';
				
	}
?>