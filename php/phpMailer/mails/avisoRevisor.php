<?php 
header("Content-Type: text/html;charset=utf-8");
require_once('masterMail.php');
$correo=new MasterMail();
/*$datos = array(
	'nombre_doc' =>ucwords( strtolower($datoDocumento['nombre_doc'])),
	'id_tipo_doc' =>$datoDocumento['id_tipo_doc'],
		'id_area'=>$datoDocumento['id_area'],
		'id_creador'=>$datoDocumento['id_creador'],
		'id_revisor'=>$datoDocumento['id_revisor'],
		'id_autorizador'=>$datoDocumento['id_autorizador'],
);*/
/*$datos = array(
	'id_documento'=>61,
	'nombre_doc' =>'Documento de prueba para email',
	'id_creador'=>13,
	'id_revisor'=>51,
	'id_autorizador'=>48,
);*/
$correo->nuevoDoc(168,1);


?>