<?php 
	require_once('config.php');
	require_once("MySqlDb.php");

	function clearString($string){
			$string=str_replace("\n", "",$string);
			$string=str_replace("\r", "",$string);
			$string=str_replace('"','\"',$string); 
			$string=str_replace("'","\'",$string);
			return $string;
	}


	function checkPerfil($id_usuario,$perfil){
		$conect = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$sql=$conect->query("SELECT id_perfil FROM usuarios WHERE id_usuario=$id_usuario LIMIT 1");
		while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
			$response=$data['id_perfil'];
	    }
	    switch($perfil){
	    	case "Administrador":
	    	case "administrador":
	    	case "ADMINISTRADOR":
	    		if($response==0)$R=1;
	    		else $R=0;
	    	break;
	    	case 'Autorizador':
	    	case 'autorizador':
	    	case 'AUTORIZADOR':
	    		if($response<=1)$R=1;
	    		else $R=0;
	    	break;
	    	case 'Revisor':
	    	case 'revisor':
	    	case 'REVISOR':
	    		if($response<=2)$R=1;
	    		else $R=0;	
	    	break;
	    	case 'Editor':
	    	case 'editor':
	    	case 'EDITOR':
	    		if($response<=3)$R=1;
	    		else $R=0;	
	    	break;	
	    	case 'Lector':
	    	case 'lector':
	    	case 'LECTOR':
	    		if($response<=4)$R=1;
	    		else $R=0;	
	    	break;
	    	default:
	    		return 'Err';
	    } 	
	   
		return $R;
	}

	function crear_documento($id_tipo,$idDocumento){
		$fecha=fechaHoy();
		$query = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
		$query->query("SET NAMES 'utf8'");
		switch ($id_tipo) {
			case '1':
			case '2':
					$query->query("INSERT INTO plantilla_completa(id_documento,rev,estado,fecha) VALUES($idDocumento,'A','Edición','$fecha')");
				break;
			case '3':
			case '4':
					$query->query("INSERT INTO plantilla_basica(id_documento,rev,estado,fecha) VALUES($idDocumento,'A','Edición','$fecha')");
				break;
		}
	}	

	function dateTime(){
		date_default_timezone_set('Mexico/General');
		$date=date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
		return $date;
	}
	function fechaHoy(){
		date_default_timezone_set('Mexico/General');
		$date=date('d')."/".date('m')."/".date('Y');
		return $date;
	}

	function getPlazo($fecha)
	{
	  	$now=date("d-m-Y",time());
		$fecha_hoy = str_replace("-", "/", $now);
		$fInput = explode ("/", $fecha);   
		$fHoy = explode ("/", $fecha_hoy); 

		$diaIn=$fInput[0];  
		$mesIn=$fInput[1];  
		$anioIn=$fInput[2]; 
		$diaHoy=$fHoy[0];  
		$mesHoy=$fHoy[1];  
		$anioHoy=$fHoy[2];
		$diasInJD = gregoriantojd($mesIn, $diaIn, $anioIn);  
		$diasHoyJD = gregoriantojd($mesHoy, $diaHoy, $anioHoy);     
		if(!checkdate($mesIn, $diaIn, $anioIn)){
			return 0;
		}elseif(!checkdate($mesHoy, $diaHoy, $anioHoy)){
			return 0;
		}else{
			$r=$diasHoyJD-$diasInJD;
			if($r>0){
				return $r;
			}else{
			 	return 0;
			}
			//return  $diasHoyJD - $diasInJD;
		} 

	}

?>