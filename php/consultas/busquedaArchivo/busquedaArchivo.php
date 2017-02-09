<?php
header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
$file_name=$_GET['file'];
$file_name="../../../pdfs/".$file_name.".pdf";
if (file_exists($file_name)) {
    print(1);
} else{
	print(0);
}
?>