<?php 
header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header("Content-Type: text/html;charset=utf-8");
  session_start();
  if(!isset($_SESSION['MD_USER'])){
    header ("Location: ./login.php");
    exit();
  }

?>
<!DOCTYPE html>
<html ng-app="masterdoc">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>MASTERDOC</title>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="css/yeti/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/dashboard.css">
	<link rel="stylesheet" type="text/css" href="css/bs-docs-side-nav.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<!-- js -->
	<script type="text/javascript" src="js/vendor/jquery.js"></script>
	<script type="text/javascript" src="js/vendor/jquery-ui.js"></script>
	<script type="text/javascript" src="js/vendor/angular.min.js"></script>
	<script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/vendor/angular-sanitize.js"></script>
	<script type="text/javascript" src="js/vendor/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="js/vendor/main.js"></script>
	<script type="text/javascript" src="js/vendor/angular-file-upload.min.js"></script>
	<script type="text/javascript" src="js/vendor/FileSaver.js"></script>
	<script type="text/javascript" src="js/masterdoc/masterdoc.js"></script>
	
	<!-- controllers -->
	<script type="text/javascript" src="js/masterdoc/controller/escritorio/mainCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/usuarios/usuariosCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/miPerfil/miPerfilCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/areas/areasCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/puestos/puestosCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/documentos/documentosCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/documentos/nuevoDocCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/config/configuracionCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/mastereditor/controller/editorCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/masterrevisor/controller/revisorCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/masterapproval/controller/approvalCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/mastervisor/controller/visorCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/visorarchivo/controller/archivoCtrl.js"></script>

	<!-- Directives -->
	<script type="text/javascript" src="js/masterdoc/directives/sugerencias.js"></script>
	<script type="text/javascript" src="js/masterdoc/directives/truncate.js"></script>
	<!-- servises-->
	<script type="text/javascript" src="js/masterdoc/services/createDialog.js"></script>
	<!-- angular ui -->
	<script type="text/javascript" src="js/vendor/angular-ui/angular-ui-router.min.js"></script>
	<script type="text/javascript" src="js/vendor/angular-ui/ui-bootstrap-tpls-0.10.0.js"></script>
	<script type="text/javascript" src="js/vendor/angular-ui/tinymce.js"></script>
	<script type="text/javascript" src="js/vendor/angular-ui/tinymce-inline.js"></script>
	<script type="text/javascript" src="js/vendor/angular-ui/keypress.js"></script>
	<!-- angular strap -->
	<script type="text/javascript" src="js/vendor/angular-strap/affix.js"></script>
	<script type="text/javascript" src="js/vendor/angular-strap/scrollspy.js"></script>
	<script type="text/javascript" src="js/vendor/angular-strap/dimensions.js"></script>
	<script type="text/javascript" src="js/vendor/angular-strap/debounce.js"></script>
	
	
	
</head>
<body ng-controller="mainCtrl">
	<div ui-view class="animated fadeIn" autoscroll="true"></div>
</body>
</html>