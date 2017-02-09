<?php 
header("Content-Type: text/html;charset=utf-8");
require_once('masterMail.php');
require_once('../config.php');

$correo=new masterMail(SERVIDOR,USUARIO,CLAVE,BDATOS);
//$correo->obsoleto(158,1);
$correo->nuevoDoc(322,4);

echo "se ha ejecutado".rand();

	/*$mail=new PHPMailer();
	$mail->IsSMTP();
	//$mail->SMTPDebug  = 2;
	$mail->SMTPAuth=true;
	$mail->SMTPSecure="ssl";
	$mail->Host="smtp.gmail.com";
	$mail->Port=465;
	$mail->Username="masterdoc.correo@gmail.com";
	$mail->Password="masterdocMail";
	$mail->SetFrom('masterdoc.correo@gmail.com', 'MasterDoc');
	$mail->AddReplyTo("masterdoc.correo@gmail.com","MasterDoc");
	$mail->Subject = 'este es el asunto';
	$mail->MsgHTML('este es un mensaje de prueba');
	$mail->AddAddress( 'davichay@hotmail.com','david');
	$mail->Send();*/

?>