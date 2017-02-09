<?php
require_once('../class.phpmailer.php');
$mail=new PHPMailer();
//$body=file_get_contents('templates/editor.html');
//$body=eregi_replace("[\]",'',$body);
$mail->IsSMTP();
$mail->SMTPDebug=2;
$mail->SMTPAuth=true;
$mail->SMTPSecure="ssl";
$mail->Host="smtp.gmail.com";
$mail->Port=465;
$mail->Username="masterdoc.correo@gmail.com";
$mail->Password="masterdocMail";
$mail->SetFrom('masterdoc.correo@gmail.com', 'MasterDoc');
$mail->AddReplyTo("masterdoc.correo@gmail.com","MasterDoc");
$mail->Subject = "Envio de email usando SMTP de Gmail";
//$mail->MsgHTML("Hola que tal, esto es el cuerpo del mensaje!");
$mail->MsgHTML("Este es el mensaje");
$address = "davichay@gmail.com";
$mail->AddAddress($address, "David Chay");
$mail->Send()
/*if(!$mail->Send()) {
echo "Error al enviar: " . $mail->ErrorInfo;
} else {
echo "Mensaje enviado!";
}*/
?>