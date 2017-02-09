<?php 
	session_start();
	header("Content-Type: text/html;charset=utf-8");
	$id_documento=$_GET['id_documento'];
	$tabla=$_GET['tabla'];
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	if($tabla="pc"){
		$plantilla_completa=$Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
			concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
			concat(mes,' ',anio) AS fecha, consecutivo
			FROM documento,tipo_documento,plantilla_completa_obsoletos,areas
			WHERE documento.id_documento=$id_documento
			AND documento.id_documento=plantilla_completa_obsoletos.id_documento
			AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
			AND areas.id_area=documento.id_area
			
		");
	}
	if($tabla="bs"){
		$plantilla_basica=$Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
			concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
			concat(mes,' ',anio) AS fecha, consecutivo
			FROM documento,tipo_documento,plantilla_basica_obsoletos,areas
			WHERE documento.id_documento=$id_documento
			AND documento.id_documento=plantilla_basica_obsoletos.id_documento
			AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
			AND areas.id_area=documento.id_area
			
		");
	}
	
	$obsoletos=array();
	$contador=0;
	while($data = $plantilla_completa->fetch_array(MYSQLI_ASSOC)) 
	{  
			$obsoletos[$contador]=array_map('utf8_encode', $data);
			$contador++;
	}	
	
	while($data = $plantilla_basica->fetch_array(MYSQLI_ASSOC)) 
	{  
			$obsoletos[$contador]=array_map('utf8_encode', $data);
			$contador++;
	}
	if(count($obsoletos)>0){
		foreach ($obsoletos as $key => $row)
		{
		    $codigo[$key]  = $row['codigo'];
		}
		array_multisort($codigo,SORT_ASC,$obsoletos);
	}	 

	print(json_encode($obsoletos));
?>