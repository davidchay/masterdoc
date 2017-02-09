<?php 
	
	if(!$_SERVER['REQUEST_METHOD']=='POST') exit(); 
	require_once('../../config.php');
	require_once("../../MySqlDb.php");
	require_once('../../funciones.php');
	$datos=file_get_contents("php://input");
	$datoUsuario=json_decode($datos,true);
	
	session_start(); 
	$response['user']=$_SESSION['MD_USER'];
	$response['id_usuario']=$_SESSION['MD_ID_USER'];
	$response['nombre']=$_SESSION['MD_NOMBRE_USER'];
	$response['apellidos']=$_SESSION['MD_APELLIDOS_USER'];
	$response['perfil']=$_SESSION['MD_PERFIL'];
	$id_perfil=$response['id_perfil']=$_SESSION['MD_ID_PERFIL'];
	$m=0;
	$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
	$menu_main = $Db->query("SELECT id_perfil,indice_menu,opcion,url FROM menu_principal WHERE id_perfil = $id_perfil ORDER BY  indice_menu ASC");
	while ($menu=$menu_main->fetch_assoc()) {
			$response['menu_principal'][$m]['indice_menu']=$menu['indice_menu'];
			
				$sub_menu = $Db->query("SELECT id_perfil,indice_menu,indice_submenu,opcion,url FROM sub_menu WHERE id_perfil=$id_perfil AND indice_menu = ".$menu['indice_menu']." ORDER BY  indice_submenu ASC");	
				$i=0;
				while ($sm=$sub_menu->fetch_assoc()) {
					$response['sub_menu'][$menu['opcion']][$i]['indice_menu']=$sm['indice_submenu'];
					$response['sub_menu'][$menu['opcion']][$i]['indice_submenu']=$sm['indice_submenu'];
					$response['sub_menu'][$menu['opcion']][$i]['opcion']=$sm['opcion'];
					$response['sub_menu'][$menu['opcion']][$i]['url']=$sm['url'];
					
					$i++;		
				}
			$response['menu_principal'][$m]['opcion']=$menu['opcion'];
			$response['menu_principal'][$m]['url']=$menu['url'];
			
			$m++;
			
		}
	return print(json_encode($response));
	
?>