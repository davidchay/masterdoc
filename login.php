<?php 
header("Expires: Tue, 03 Jul 2001 06:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
  session_start();
  if(isset($_SESSION['MD_USER'])){
    header ("Location: ./#/");
    exit();
  }
?>
<!DOCTYPE html>
<html ng-app="masterdoc">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>MASTERDOC</title>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="css/yeti/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/dashboard.css">
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
	<script type="text/javascript" src="js/masterdoc/masterdoc.js"></script>
	
	<!-- controllers -->
	<script type="text/javascript" src="js/masterdoc/controller/escritorio/mainCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/usuarios/usuariosCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/miPerfil/miPerfilCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/areas/areasCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/puestos/puestosCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/documentos/documentosCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/documentos/nuevoDocCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/controller/login/loginCtrl.js"></script>
	<script type="text/javascript" src="js/masterdoc/mastereditor/controller/editorCtrl.js"></script>

	<!-- Directives -->
	<script type="text/javascript" src="js/masterdoc/directives/sugerencias.js"></script>
	<script type="text/javascript" src="js/masterdoc/directives/truncate.js"></script>
	<!--<script type="text/javascript" src="js/masterdoc/directives/file-upload.js"></script>-->
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
<body class="login_bg">
	<div class="container">
		<div class="row">
			<div id="login_box" class="col-md-4 col-md-offset-4 hidden">
				<br>
				<div class="login_shadow well well-lg text-center" ng-controller="loginCtrl">
					<img src="img/logo.png">
					<hr>
					<h3>Inicio de Sesión</h3>
					<br>
					<div class="mensaje text-left"></div>
					<form class="text-left" role="form" ng-submit="login()">
					  <div class="form-group">
					    <label for="usuario" class="control-label">Usuario</label>
					    <input type="text" ng-model="user" class="form-control" id="usuario" placeholder="Usuario" autofocus>
					  </div>
					  <div class="form-group">
					    <label for="password" class="control-label">Contraseña</label>
					    <input type="password" ng-model="pass" class="form-control" id="password" placeholder="Contraseña">
					  </div>
					  <div class="form-group">
					    <div class="text-left">
					      <button type="submit" class="btn btn-block btn-primary btn-default">Entrar</button>
					    </div>
					  </div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).on("ready",login);
		function login(){
			$('#login_box').removeClass('hidden').addClass('animated fadeInDown');
		};
	</script>
</body>
</html>