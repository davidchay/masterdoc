<?php 
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$resumen=array();
	/*Resumen documentos en plantilla completa*/
	$query=$Db->query("SELECT count(*) AS no_cp FROM  plantilla_completa");
	while($data = $query->fetch_array(MYSQLI_ASSOC)) 
	{  
			$resumen['num_cp']=(int)$data['no_cp'];
	}
	$query=$Db->query("SELECT count(*) AS no_borrador_cp FROM plantilla_completa WHERE estado='revisión' OR estado='edicion' OR estado='autorizacion'");
	while($data = $query->fetch_array(MYSQLI_ASSOC)) 
	{  
			$resumen['num_borrador_cp']=(int)$data['no_borrador_cp'];
	}
	$query=$Db->query("SELECT count(*) AS no_autorizado_cp FROM plantilla_completa WHERE estado='Autorizado'");
	while($data = $query->fetch_array(MYSQLI_ASSOC)) 
	{  
			$resumen['num_autorizado_cp']=(int)$data['no_autorizado_cp'];
	}
	$obsoletos_cp=$Db->query("SELECT DISTINCT id_documento FROM plantilla_completa_obsoletos");
	$resumen['num_obsoletos_cp']=$obsoletos_cp->num_rows;
	
	$query=$Db->query("SELECT count(*) AS participacion FROM documento WHERE id_creador=$id_usuario OR id_revisor=$id_usuario OR id_autorizador=$id_usuario");
	while($data=$query->fetch_array(MYSQLI_ASSOC))
	{
			$resumen['num_participacion']=(int)$data['participacion'];	
	}

	$tareas_cp=$Db->query("SELECT documento.id_documento
		FROM documento,plantilla_completa
		WHERE documento.id_documento=plantilla_completa.id_documento
		AND plantilla_completa.estado<>'Autorizado'
		AND plantilla_completa.estado<>'Eliminado'
		AND (documento.id_creador=$id_usuario
		OR documento.id_revisor=$id_usuario
		OR documento.id_autorizador=$id_usuario)");
	$resumen['tareas_cp']=$tareas_cp->num_rows;
	/*Resumen documentos en plantilla basica*/
	$query=$Db->query("SELECT count(*) AS no_bs FROM  plantilla_basica");
	while($data = $query->fetch_array(MYSQLI_ASSOC)) 
	{  
			$resumen['num_bs']=(int)$data['no_bs'];
	}
	$query=$Db->query("SELECT count(*) AS no_borrador_bs FROM plantilla_basica WHERE estado='revisión' OR estado='edicion' OR estado='autorizacion'");
	while($data = $query->fetch_array(MYSQLI_ASSOC)) 
	{  
			$resumen['num_borrador_bs']=(int)$data['no_borrador_bs'];
	}
	$query=$Db->query("SELECT count(*) AS no_autorizado_bs FROM plantilla_basica WHERE estado='Autorizado'");
	while($data = $query->fetch_array(MYSQLI_ASSOC)) 
	{  
			$resumen['num_autorizado_bs']=(int)$data['no_autorizado_bs'];
	}
	$obsoletos_bs=$Db->query("SELECT DISTINCT id_documento FROM plantilla_basica_obsoletos");
	$resumen['num_obsoletos_bs']=$obsoletos_bs->num_rows;
	
	

	$tareas_bs=$Db->query("SELECT documento.id_documento
		FROM documento,plantilla_basica
		WHERE documento.id_documento=plantilla_basica.id_documento
		AND plantilla_basica.estado<>'Autorizado'
		AND plantilla_basica.estado<>'Eliminado'
		AND (documento.id_creador=$id_usuario
		OR documento.id_revisor=$id_usuario
		OR documento.id_autorizador=$id_usuario)");
	$resumen['tareas_bs']=$tareas_bs->num_rows;

	print(json_encode($resumen));
	//var_dump($resumen);
?>