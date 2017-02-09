<?php

$datos=file_get_contents("php://input");
$urlDownload=json_decode($datos,true);
//$enlace = $path_a_tu_doc."/".$id; 
$path=$urlDownload['path'];
$file_name=$urlDownload['file_name'];
$enlace=$path.$file_name;
//$enlace = $_POST['url']; 

header ("Content-Disposition: attachment; filename=".$file_name." "); 

header ("Content-Type: application/octet-stream");

header ("Content-Length: ".filesize($enlace));

readfile($enlace);

?>