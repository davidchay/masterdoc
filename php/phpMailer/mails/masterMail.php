<?php 
require_once('../../config.php');
require_once('../class.phpmailer.php');

class MasterMail{
	protected $_mysql;
	protected $_query;
	protected $_where;
	public function __construct()
	{
		$this->_mysql = new mysqli(SERVIDOR, USUARIO, CLAVE, BDATOS) or die('There was a problem connecting to the database');
	}
	
	public function nuevoDoc($id_documento,$tipoDoc)
	{
		$ids=$this->getIds($id_documento);
		foreach ($ids as $usuario => $id) {
			$this->prepareMensage($id_documento,$tipoDoc,$usuario,$id,'nuevoDoc');
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
	protected function prepareMensage($id_documento,$tipoDoc,$usuario,$id_usuario,$opcion){
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
	    	$mensaje_email=$mensaje;
	    }
	    /* cambiando el mensaje */
    	$mensaje_email=str_replace('%nombre%',$nombre_usuario, $mensaje_email);
    	$mensaje_email=str_replace('%documento%', $nombre_documento,  $mensaje_email);
        $mensaje_email=str_replace('%codigo%', $codigo_documento, $mensaje_email);
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
	    	$asunto_email=$asunto;
	    }
	    /* cambiando el mensaje */
    	$asunto_email=str_replace('%nombre%',$nombre_usuario, $asunto_email);
    	$asunto_email=str_replace('%documento%', $nombre_documento,  $asunto_email);
        $asunto_email=str_replace('%codigo%', $codigo_documento, $asunto_email);
    	$stmt->close();
		return $asunto_email;
	}
	protected function enviarEmailNuevoDoc($mensaje_email,$email_usuario,$nombre_usuario,$asunto)
	{
		
		$mail=new PHPMailer();
		$mail->IsSMTP();
		$mail->SMTPAuth=true;
		$mail->SMTPSecure="ssl";
		$mail->Host="smtp.gmail.com";
		$mail->Port=465;
		$mail->Username="masterdoc.correo@gmail.com";
		$mail->Password="masterdocMail";
		$mail->SetFrom('masterdoc.correo@gmail.com', 'MasterDoc');
		$mail->AddReplyTo("masterdoc.correo@gmail.com","MasterDoc");
		$mail->Subject = $asunto;
		$mail->MsgHTML($mensaje_email);
		$mail->AddAddress( $email_usuario, $nombre_usuario);
		$mail->Send();
	} 
	
	public function __destruct() 
    {
		$this->_mysql->close();
    }
}

?>