<?php 
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	$id_perfil=$_SESSION['MD_ID_PERFIL'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	if($id_perfil>0)
	{
		$plantilla_completa = $Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
			concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
			concat(mes,' ',anio) AS fecha,estado,'cp' AS tabla, id_creador,id_revisor,id_autorizador
			FROM documento,tipo_documento,plantilla_completa,areas
			WHERE documento.id_documento=plantilla_completa.id_documento
			AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
			AND areas.id_area=documento.id_area
			AND plantilla_completa.estado<>'autorizado'
			AND plantilla_completa.estado<>'eliminado'
			AND (documento.id_creador=$id_usuario
			OR documento.id_revisor=$id_usuario
			OR documento.id_autorizador=$id_usuario)");
		
		$plantilla_basica = $Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
			concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
			concat(mes,' ',anio) AS fecha,estado,'bs' AS tabla, id_creador,id_revisor,id_autorizador
			FROM documento,tipo_documento,plantilla_basica,areas
			WHERE documento.id_documento=plantilla_basica.id_documento
			AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
			AND areas.id_area=documento.id_area
			AND plantilla_basica.estado<>'autorizado'
			AND plantilla_basica.estado<>'eliminado'
			AND (documento.id_creador=$id_usuario
			OR documento.id_revisor=$id_usuario
			OR documento.id_autorizador=$id_usuario)");
		
	}
	else
	{
		$plantilla_completa = $Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
			concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
			concat(mes,' ',anio) AS fecha,estado,'cp' AS tabla,id_creador,id_revisor,id_autorizador
			FROM documento,tipo_documento,plantilla_completa,areas
			WHERE documento.id_documento=plantilla_completa.id_documento
			AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
			AND areas.id_area=documento.id_area
			AND plantilla_completa.estado<>'autorizado'
			AND plantilla_completa.estado<>'eliminado'
			");
		
		$plantilla_basica = $Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
			concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
			concat(mes,' ',anio) AS fecha,estado,'bs' AS tabla,id_creador,id_revisor,id_autorizador
			FROM documento,tipo_documento,plantilla_basica,areas
			WHERE documento.id_documento=plantilla_basica.id_documento
			AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
			AND areas.id_area=documento.id_area
			AND plantilla_basica.estado<>'autorizado'
			AND plantilla_basica.estado<>'eliminado'
			");
	}

	$borradores=array();
	$contador=0;
	while($data = $plantilla_completa->fetch_array(MYSQLI_ASSOC)) 
	{  
			$borradores[$contador]=array_map('utf8_encode', $data);
			$contador++;
	}	
	
	while($data = $plantilla_basica->fetch_array(MYSQLI_ASSOC)) 
	{  
			$borradores[$contador]=array_map('utf8_encode', $data);
			$contador++;
	}
	if(count($borradores)>0){
		foreach ($borradores as $key => $row)
		{
		    $nombre_documento[$key]  = $row['nombre_documento'];
		} 
		array_multisort($nombre_documento,SORT_ASC,$borradores);
	}
	print(json_encode($borradores));
?>