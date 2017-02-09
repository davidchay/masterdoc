<?php 
require_once("class.phpmailer.php");
//require_once("../config.php");

class masterMail{
	protected $_mysql;
	protected $_query;
	protected $_where;
	
	public function __construct($host, $username, $password, $db) {
      $this->_mysql = new mysqli($host, $username, $password, $db) or die('There was a problem connecting to the database');
    }
    /*public function __construct() {
      $this->_mysql = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS) or die('There was a problem connecting to the database');
    }*/
	
	public function nuevoDoc($id_documento,$tipoDoc)
	{
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			$this->prepareMensage($id_documento,$tipoDoc,$usuario,$id,'nuevoDoc');
		}
		 
	}
	public function toRevision($id_documento,$tipoDoc)
	{
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			if($usuario=='revisor'){
				$this->prepareMensage($id_documento,$tipoDoc,$usuario,$id,'revision');
			}
		}
	}
	public function toAprobacion($id_documento,$tipoDoc)
	{
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			if($usuario=='autorizador'){
				$this->prepareMensage($id_documento,$tipoDoc,$usuario,$id,'autorizacion');
			}
		}
	}
	public function toEdicion($id_documento,$tipoDoc)
	{
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			if($usuario=='creador'){
				$this->prepareMensage($id_documento,$tipoDoc,$usuario,$id,'edicion');
			}
		}
	}
	public function eliminado($id_documento,$tipoDoc)
	{
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'eliminado');
		}
		 
	}
	public function aprobado($id_documento,$tipoDoc)
	{
		$ids=$this->getPuestosPermiso($id_documento);
		for ($i=0; $i < count($ids); $i++) { 
			$ids_usuarios=$this->getIdxPuesto($ids[$i]);
			foreach ($ids_usuarios as $usuario => $id) {
				$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'aprobado');
			}
		}
		$idsAdmin=$this->getIdsAdministrador();
		foreach ($idsAdmin as $usuario => $id) {
			$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'aprobado');
		}
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'aprobado');
		}
		 
	}
	public function revisionDoc($id_documento,$tipoDoc)
	{
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'revisionDoc');
		}
		$idsAdmin=$this->getIdsAdministrador();
		foreach ($idsAdmin as $usuario => $id) {
			$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'revisionDoc');
		}
		 
	}
	public function obsoleto($id_documento,$tipoDoc)
	{
		$ids_puesto=$this->getPuestosPermiso($id_documento);
		for ($i=0; $i < count($ids_puesto); $i++) { 
			$ids_usuarios=$this->getIdxPuesto($ids_puesto[$i]);
			foreach ($ids_usuarios as $usuario => $id) {
				$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'obsoleto');
			}
		}
	}
	public function permiso($id_documento,$tipoDoc)
	{
		$ids_puesto=$this->getPuestosPermiso($id_documento);
		for ($i=0; $i < count($ids_puesto); $i++) { 
			$ids_usuarios=$this->getIdxPuesto($ids_puesto[$i]);
			foreach ($ids_usuarios as $usuario => $id) {
				$this->prepareMensage($id_documento,$tipoDoc,'usuarios',$id,'permiso');
			}
		}
	}
	protected function getIds($id_documento){
		$query="SELECT id_creador,id_revisor,id_autorizador	FROM documento	WHERE documento.id_documento=$id_documento";
		$stmt = $this->_mysql->prepare($query);
		$stmt->execute();
		$stmt->bind_result($id_editor,$id_revisor,$id_autorizador);
	    $results=array();
	    /* obtener los valores */
	    while ($stmt->fetch()) 
	    {
	    	$results['creador']=$id_editor;
	    	$results['revisor']=$id_revisor;
	    	$results['autorizador']=$id_autorizador;
	    }
	    /* liberar el conjunto de resultados */
    	$stmt->close();
    	return $results;	
	}
	protected function getIdsAdministrador(){
		$query="SELECT id_usuario FROM usuarios WHERE id_perfil=0";
		$stmt = $this->_mysql->prepare($query);
		$stmt->execute();
		$stmt->bind_result($admins);
	    $results=array();
	    $i=0;
	    while ($stmt->fetch()) 
	    {
	    	$results[$i]=$admins;
	    	$i=$i+1;
	    }
	    /* liberar el conjunto de resultados */
    	$stmt->close();
    	return $results;
	}
	protected function getPuestosPermiso($id_documento){
		$query="SELECT id_puesto FROM permisos_documento_puestos WHERE id_documento=$id_documento";
		$stmt = $this->_mysql->prepare($query);
		$stmt->execute();
		$stmt->bind_result($puestos);
	    $results=array();
	    /* obtener los valores */
	    $i=0;
	    while ($stmt->fetch()) 
	    {
	    	$results[$i]=$puestos;
	    	$i=$i+1;
	    }
	    /* liberar el conjunto de resultados */
    	$stmt->close();
    	return $results;
	}
	protected function getIdxPuesto($id_puesto){
		$query="SELECT id_usuario FROM usuarios WHERE id_puesto=$id_puesto";
		$stmt = $this->_mysql->prepare($query);
		$stmt->execute();
		$stmt->bind_result($ids);
	    $results=array();
	    /* obtener los valores */
	    $i=0;
	    while ($stmt->fetch()) 
	    {
	    	$results[$i]=$ids;
	    	$i=$i+1;
	    }
	    /* liberar el conjunto de resultados */
    	$stmt->close();
    	return $results;
	}
	protected function prepareMensage($id_documento,$tipoDoc,$usuario,$id_usuario,$opcion){
		switch ($tipoDoc) {
			case '1':
			case '2':
					$query="SELECT nombre, email,nombre_doc,
					concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
					mensaje
					FROM usuarios,documento,tipo_documento,plantilla_completa,areas,messages_mail
					WHERE documento.id_documento=plantilla_completa.id_documento
					AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
					AND areas.id_area=documento.id_area
					AND id_usuario=$id_usuario 
					AND documento.id_documento=$id_documento
					AND opcion='$opcion'
					AND destino='$usuario'";
				break;
			case '3':
			case '4':
					$query="SELECT nombre, email,nombre_doc,
					concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
					mensaje
					FROM usuarios,documento,tipo_documento,plantilla_basica,areas,messages_mail
					WHERE documento.id_documento=plantilla_basica.id_documento
					AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
					AND areas.id_area=documento.id_area
					AND id_usuario=$id_usuario 
					AND documento.id_documento=$id_documento
					AND opcion='$opcion'
					AND destino='$usuario'";
				break;
		}
		
   		$stmt = $this->_mysql->prepare($query);
   		$stmt->execute();
		/* vincular las variables de resultados */
	    $stmt->bind_result($nombre,$email,$nombre_doc,$codigo,$mensaje);
	    /* obtener los valores */
	    while ($stmt->fetch()) 
	    {
	    	$nombre_usuario=$nombre;
	    	$email_usuario=$email;
	    	$nombre_documento=$nombre_doc;
	    	$codigo_documento=$codigo;
	    	//$mensaje_email=$mensaje;
	    	$mensaje_email=str_replace('%nombre%',$nombre,$mensaje);
    		$mensaje_email=str_replace('%documento%', $nombre_doc, $mensaje_email);
        	$mensaje_email=str_replace('%codigo%', $codigo,$mensaje_email);
	    }
	    $asunto=$this->getAsunto($nombre_usuario,$codigo_documento,$nombre_documento,$opcion);
		$this->enviarEmailNuevoDoc($mensaje_email,$email_usuario,$nombre_usuario,$asunto);	
		$stmt->close();
	}
	protected function getAsunto($nombre_usuario,$codigo_documento,$nombre_documento,$opcion){
		$query="SELECT mensaje FROM messages_mail	WHERE opcion='$opcion' and destino='asunto'";
		$stmt = $this->_mysql->prepare($query);
   		$stmt->execute();
		/* vincular las variables de resultados */
	    $stmt->bind_result($asunto);
	    /* obtener los valores */
	    while ($stmt->fetch()) 
	    {
	    	$asunto=$asunto;
		    /* cambiando el mensaje */
	    	$asunto_email=str_replace('%nombre%',$nombre_usuario, $asunto);
	    	$asunto_email=str_replace('%documento%', $nombre_documento,  $asunto_email);
	        $asunto_email=str_replace('%codigo%', $codigo_documento, $asunto_email);
	    }
		return $asunto_email;
	    $stmt->close();
	}
	protected function enviarEmailNuevoDoc($mensaje_email,$email_usuario,$nombre_usuario,$asunto)
	{
		$mail=new PHPMailer();
		$mail->IsSMTP();
		$mail->SMTPDebug = false;
		$mail->SMTPAuth=true;
		$mail->CharSet = 'utf-8';
		$mail->SMTPSecure="ssl";
		$mail->Host="smtp.gmail.com";
		$mail->Port=465;
		$mail->Username="master.mensajero@gmail.com";
		$mail->Password="mensajeromaestro";
		$mail->Mailer = 'smtp';
		$mail->SetFrom('master.mensajero@gmail.com', 'MasterDoc');
		$mail->AddReplyTo("master.mensajero@gmail.com","MasterDoc");
		$mail->Subject = $asunto;
		$mail->MsgHTML($mensaje_email);
		$mail->AddAddress( $email_usuario, $nombre_usuario);
		$mail->IsHTML(true);
		$mail->Send();
	} 
	
	public function __destruct() 
    {
		$this->_mysql->close();
    }
}

?>