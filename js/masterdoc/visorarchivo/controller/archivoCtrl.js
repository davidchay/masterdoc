function archivoCpCtrl($scope,$http,$state,$stateParams,createDialog){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.consecutivo=$stateParams.consecutivo;
	$scope.status=$stateParams.status;
	$scope.commentObjetivo='';
	$scope.commentAlcance='';
	$scope.commentDefiniciones='';
	$scope.commentResponsabilidades='';
	$scope.commentDesarrollo='';
	$scope.commentReferencias='';
	$scope.commentRegistros='';

	/*Permisos del documento*/
	$http.get('php/consultas/documentos/getPermisosDocumento.php?id_documento='+$scope.idDocumento)
	    .success(function(data) {
	        $scope.permiso=data;
	        if($scope.permiso<1 && $scope.usuario.id_perfil>0){
	        	alert('Usted no tiene permisos para ver este documento.');
	        	$state.go('escritorio.documentos.aprobados');
	        }
	   	});

	/*Obtiene los detalles del documento*/
	$http.get('php/consultas/documentos/getDetallesDocumentoObsoleto.php?tabla=cp&id_documento='+$scope.idDocumento+'&consecutivo='+$scope.consecutivo)
	.success(function(data) {
		$scope.nombre_doc=data.nombre_documento;
	   	$scope.codigo=data.codigo;
        $scope.fecha=data.fecha;
        $scope.tipo_documento=data.nombre_tipo_doc;
        $scope.creador=data.creador;
        $scope.creador_puesto=data.creador_puesto;
        $scope.revisor=data.revisor;
        $scope.revisor_puesto=data.revisor_puesto;
        $scope.autorizador=data.autorizador;
        $scope.autorizador_puesto=data.autorizador_puesto;
        $scope.fecha_creacion=data.fecha_creacion;
		$scope.ultima_modificacion=data.fecha_ultima_mod;
		$scope.estado=data.estado;
		$scope.id_creador=data.id_creador;
		if(data.length<1){
			alert("nose puede cargar la informacion");
			
			$state.go('escritorio.documentos.aprobados');
		}
    });
	/*Obtiene las secciones del documento*/
  	$http.get('php/consultas/documentos/getDatosCompletaObsoletos.php?id_documento='+$scope.idDocumento+'&consecutivo='+$scope.consecutivo)
	.success(function(data) {
		if(data.length<1){
			$state.go('escritorio.documentos.aprobados');
		}
		$scope.objetivo=data.objetivo;
		$scope.alcance=data.alcance;
		$scope.definiciones=data.definiciones;
		$scope.desarrollo=data.desarrollo;
		$scope.referencias=data.referencias;
		$scope.anexos=data.anexos;
		
	});
	
	/*obtiene los registros de la tabla de responsabilidades*/
	$http.get('php/consultas/documentos/getDatosCompletaResponObsoletos.php?id_documento='+$scope.idDocumento+'&consecutivo='+$scope.consecutivo)
	.success(function(data) {
		$scope.responsabilidades=data;
	});
	/*Obtiene los registros de la tabla de registros*/
	$http.get('php/consultas/documentos/getDatosCompletaRegistrosObsoletos.php?id_documento='+$scope.idDocumento+'&consecutivo='+$scope.consecutivo)
	.success(function(data) {
		$scope.registros=data;
		
	});

	/*Obtiene las revisiones de las versiones*/
	$http.get('php/consultas/documentos/getDatosCompletaRevisionObsoletos.php?id_documento='+$scope.idDocumento+'&consecutivo='+$scope.consecutivo)
	.success(function(data) {
		$scope.revisionList=data;
		
	});

	$(".ineditable").selectOff();


	$scope.atras=function(){
		if($scope.status=='obsoleto'){
			console.log('obsoleto');
			$state.go('escritorio.documentos.versiones',{idDocumento:$scope.idDocumento,tabla:'cp' });
		}else{
			console.log('aprobado');
			$state.go('escritorio.documentos.aprobados');
		}
	};
	
	$scope.crearPDF=function(){
        window.open("partials/visorarchivo/documentoPDF.php?id_documento="+$scope.idDocumento+"&consecutivo="+$scope.consecutivo,"Documento PDF","width=800,height=500,top=75,left=250,menubar=no,directories=no,location=no"); 
    };
    
  	
};



function archivoBsCtrl($scope,$http,$state,$stateParams,createDialog,$sce){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.consecutivo=$stateParams.consecutivo;
	$scope.status=$stateParams.status;
	$scope.html='<h3 class="text-center text-primary separator-top"><i class="fa fa-circle-o-notch fa-spin"></i> Cargando el documento...</h3>';
	/*Permisos del documento*/
	$http.get('php/consultas/documentos/getPermisosDocumento.php?id_documento='+$scope.idDocumento)
	    .success(function(data) {
	        $scope.permiso=data;
	        if($scope.permiso<1 && $scope.usuario.id_perfil>0){
	        	alert('Usted no tiene permisos para ver este documento.');
	        	$state.go('escritorio.documentos.aprobados');
	        }
	   	});
	/*Obtiene los detalles del documento*/
	$http.get('php/consultas/documentos/getDetallesDocumentoObsoleto.php?tabla=bs&id_documento='+$scope.idDocumento+'&consecutivo='+$scope.consecutivo)
	.success(function(data) {
		$scope.nombre_doc=data.nombre_documento;
	   	$scope.codigo=data.codigo;
        $scope.fecha=data.fecha;
        $scope.tipo_documento=data.nombre_tipo_doc;
        $scope.creador=data.creador;
        $scope.creador_puesto=data.creador_puesto;
        $scope.revisor=data.revisor;
        $scope.revisor_puesto=data.revisor_puesto;
        $scope.autorizador=data.autorizador;
        $scope.autorizador_puesto=data.autorizador_puesto;
        $scope.fecha_creacion=data.fecha_creacion;
		$scope.ultima_modificacion=data.fecha_ultima_mod;
		$scope.estado=data.estado;
		$scope.id_creador=data.id_creador;
		$http.get('php/consultas/busquedaArchivo/busquedaArchivo.php?file='+$scope.codigo)
		.success(function(data) {
			if(data==1){
				$scope.html=$sce.trustAsHtml('<iframe src="js/viewer/#../../pdfs/'+$scope.codigo+'.pdf" width="100%" height="600" allowfullscreen webkitallowfullscreen></iframe>');
			}else{
				$scope.html='<h1 class="text-center text-danger separator-top">:( UPSS...</h1><br>';
				$scope.html+='<h3 class="text-center text-danger"><i class="fa fa-exclamation-triangle"></i> El archivo no se cargó correctamente.</h3>';
				$scope.html+='<h3 class="text-center text-danger">Por favor pulse la tecla F5 o vuelva a entrar a esta sección.</h3>';
				$scope.html+='<p class="text-center text-danger">Si el problema persiste comuníquese con el administrador.</p>';
			}
		});
		if(data.length<1){
			$state.go('escritorio.documentos.aprobados');
		}	
    });
	
	/*Obtiene las revisiones de las versiones*/
	$http.get('php/consultas/documentos/getDatosBasicaRevision.php?id_documento='+$scope.idDocumento+'&consecutivo='+$scope.consecutivo)
	.success(function(data) {
		$scope.revisionList=data;
		
	});

	$(".ineditable").selectOff();

	$scope.atras=function(){
		if($scope.status=='obsoleto'){
			console.log('obsoleto');
			$state.go('escritorio.documentos.versiones',{idDocumento:$scope.idDocumento,tabla:'cp' });
		}else{
			console.log('aprobado');
			$state.go('escritorio.documentos.aprobados');
		}
	};
	
	$scope.crearPDF=function(){
        var datos={
			path:"../pdfs/",
			file_name:$scope.codigo+".pdf"
		};
        $http({
            url:'php/download.php',
            method:'POST',
            data:datos,
            responseType: 'arraybuffer' 
        }).success(function(data) {
            var file = new Blob([data], { type: 'application/pdf' });
            saveAs(file, $scope.codigo+'.pdf');
        });
    };
    
  	
};

