<?php 
	session_start();
	$id_documento=$_GET['id_documento'];
	$tabla=$_GET['tabla'];
	header("Content-Type: text/html;charset=utf-8");
	require_once('../../config.php');
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	switch ($tabla) {
		case 'cp':
			$consulta=$Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
				concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,estado,
				nombre_tipo_doc,nombre_area,fecha_creacion,fecha_ultima_mod,
				concat(mes,' ',anio) AS fecha,id_creador,id_revisor,id_autorizador
				FROM documento,tipo_documento,plantilla_completa,areas
				WHERE documento.id_documento=plantilla_completa.id_documento
				AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
				AND areas.id_area=documento.id_area
				AND documento.id_documento=$id_documento");
		break;
		case 'bs':
			$consulta=$Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
				concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,estado,
				nombre_tipo_doc,nombre_area,fecha_creacion,fecha_ultima_mod,
				concat(mes,' ',anio) AS fecha,id_creador,id_revisor,id_autorizador
				FROM documento,tipo_documento,plantilla_basica,areas
				WHERE documento.id_documento=plantilla_basica.id_documento
				AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
				AND areas.id_area=documento.id_area
				AND documento.id_documento=$id_documento");
		break;
		
	}
	$detalles=array();
	$datos_generales=array();
	$creador_arr=array();
	$revisor_arr=array();
	$autorizador_arr=array();
	$id_revisor=0;
	$id_creador=0;
	$id_autorizador=0;
	while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
	{  
			$datos_generales=array_map('utf8_encode', $data);
			$id_revisor=$data['id_revisor'];
			$id_creador=$data['id_creador'];
			$id_autorizador=$data['id_autorizador'];
	}
	$creador=$Db->query("SELECT concat(nombre,' ',apellidos) as creador, nombre_puesto as creador_puesto
from usuarios,puestos WHERE id_usuario=$id_creador
AND usuarios.id_puesto=puestos.id_puesto");
	while($data = $creador->fetch_array(MYSQLI_ASSOC)) 
	{  
			$creador_arr=array_map('utf8_encode', $data);
	}
	$revisor=$Db->query("SELECT concat(nombre,' ',apellidos) as revisor, nombre_puesto as revisor_puesto
from usuarios,puestos WHERE id_usuario=$id_revisor
AND usuarios.id_puesto=puestos.id_puesto");
	while($data = $revisor->fetch_array(MYSQLI_ASSOC)) 
	{  
			$revisor_arr=array_map('utf8_encode', $data);
	}
	$autorizador=$Db->query("SELECT concat(nombre,' ',apellidos) as autorizador, nombre_puesto as autorizador_puesto
from usuarios,puestos WHERE id_usuario=$id_autorizador
AND usuarios.id_puesto=puestos.id_puesto");
	while($data = $autorizador->fetch_array(MYSQLI_ASSOC)) 
	{  
			$autorizador_arr=array_map('utf8_encode', $data);
	}
	$detalles=array_merge($datos_generales,$creador_arr,$revisor_arr,$autorizador_arr);
	print(json_encode($detalles));
?>