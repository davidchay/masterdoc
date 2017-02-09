<?php 
	session_start();
	$id_usuario=$_SESSION['MD_ID_USER'];
	$id_perfil=$_SESSION['MD_ID_PERFIL'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	
	$plantilla_completa = $Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
		concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
		concat(mes,' ',anio) AS fecha,estado,'cp' AS tabla,id_creador,id_revisor,id_autorizador,0 as consecutivo, 'visor' as op
		FROM documento,tipo_documento,plantilla_completa,areas
		WHERE documento.id_documento=plantilla_completa.id_documento
		AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
		AND areas.id_area=documento.id_area
		AND plantilla_completa.estado='Autorizado'
		");
	
	$plantilla_basica = $Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
		concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
		concat(mes,' ',anio) AS fecha,estado,'bs' AS tabla,id_creador,id_revisor,id_autorizador,0 as consecutivo, 'visor' as op
		FROM documento,tipo_documento,plantilla_basica,areas
		WHERE documento.id_documento=plantilla_basica.id_documento
		AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
		AND areas.id_area=documento.id_area
		AND plantilla_basica.estado='Autorizado'
		");
	$plantilla_completa_obsoletos=$Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
		concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
		concat(mes,' ',anio) AS fecha,estado,'cp' AS tabla,id_creador,id_revisor,id_autorizador,consecutivo,'archivo' as op
		FROM documento,tipo_documento,plantilla_completa_obsoletos,areas
		WHERE documento.id_documento=plantilla_completa_obsoletos.id_documento
		AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
		AND areas.id_area=documento.id_area
		AND plantilla_completa_obsoletos.estado='Autorizado'
		");

	$plantilla_basica_obsoletos=$Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
		concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
		concat(mes,' ',anio) AS fecha,estado,'bs' AS tabla,id_creador,id_revisor,id_autorizador,consecutivo,'archivo' as op
		FROM documento,tipo_documento,plantilla_basica_obsoletos,areas
		WHERE documento.id_documento=plantilla_basica_obsoletos.id_documento
		AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
		AND areas.id_area=documento.id_area
		AND plantilla_basica_obsoletos.estado='Autorizado'
		");
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
	
	while($data = $plantilla_completa_obsoletos->fetch_array(MYSQLI_ASSOC)) 
	{  
			$borradores[$contador]=array_map('utf8_encode', $data);
			$contador++;
	}
	while($data = $plantilla_basica_obsoletos->fetch_array(MYSQLI_ASSOC)) 
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