function approvalCpCtrl($scope,$http,$state,$stateParams,createDialog){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.commentObjetivo="";
	$scope.commentAlcance="";
	$scope.commentDefiniciones="";
	$scope.commentResponsabilidades="";
	$scope.commentDesarrollo="";
	$scope.commentReferencias="";
	$scope.commentRegistros="";
	$scope.commentAnexos="";
	/*Obtiene los detalles del documento*/
	$http.get('php/consultas/documentos/getDetallesDocumento.php?tabla=cp&id_documento='+$scope.idDocumento)
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
		$scope.id_autorizador=data.id_autorizador;
		$scope.id_revisor=data.id_revisor;
		if($scope.usuario.id_usuario!=$scope.id_autorizador){
			alert("¡Usted no tiene permiso de editar este documento!");
			$state.go('escritorio.documentos.borrador');
		}
		if($scope.estado!='Aprobación'){
			alert("¡Este docmento ya no se encuentra en estado de Revisión!");
			$state.go('escritorio.documentos.borrador');
		}
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}
    });
	/*Obtiene las secciones del documento*/
  	$http.get('php/consultas/documentos/getDatosCompleta.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}
		$scope.objetivo=data.objetivo;
		$scope.alcance=data.alcance;
		$scope.definiciones=data.definiciones;
		$scope.desarrollo=data.desarrollo;
		$scope.referencias=data.referencias;
		$scope.anexos=data.anexos;
		/*Obtiene los comentarios del revisor*/
		$http.get('php/consultas/documentos/getComentariosCompleta.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.id_revisor)
		.success(function(data) {
			/*$scope.comentarioObjetivoRevisor=data.objetivo;
			$scope.comentarioAlcanceRevisor=data.alcance;
			$scope.comentarioDefinicionesRevisor=data.definiciones;
			$scope.comentarioResponsabilidadesRevisor=data.responsabilidades;
			$scope.comentarioDesarrolloRevisor=data.desarrollo;
			$scope.comentarioReferenciasRevisor=data.referencias;
			$scope.comentarioRegistrosRevisor=data.registros;
			$scope.comentarioAnexosRevisor=data.anexos;*/

			$scope.comentarioObjetivoRevisor= typeof(data.objetivo) != "undefined" ? data.objetivo : "";
			$scope.comentarioAlcanceRevisor=typeof(data.alcance) != "undefined" ? data.alcance : "";
			$scope.comentarioDefinicionesRevisor=typeof(data.definiciones) != "undefined" ? data.definiciones : "";
			$scope.comentarioResponsabilidadesRevisor=typeof(data.responsabilidades) != "undefined" ? data.responsabilidades : "";
			$scope.comentarioDesarrolloRevisor=typeof(data.desarrollo) != "undefined" ? data.desarrollo : "";
			$scope.comentarioReferenciasRevisor=typeof(data.referencias) != "undefined" ? data.referencias : "";
			$scope.comentarioRegistrosRevisor=typeof(data.registros) != "undefined" ? data.registros : "";
			$scope.comentarioAnexosRevisor=typeof(data.anexos) != "undefined" ? data.anexos : "";
		});
	});
	/*obtiene los registros de la tabla de responsabilidades*/
	$http.get('php/consultas/documentos/getDatosCompletaRespon.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.responsabilidades=data;
	});
	/*Obtiene los registros de la tabla de registros*/
	$http.get('php/consultas/documentos/getDatosCompletaRegistros.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.registros=data;
	});
	/*Obteniendo registros de la tabla revisiones*/
	$http.get('php/consultas/documentos/getDatosCompletaRevision.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.revisionList=data;
	});
	/*Obtiene los comentarios anteriormente guardado por el autorizador*/
	$http.get('php/consultas/documentos/getComentariosCompleta.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.usuario.id_usuario)
	.success(function(data) {
		/*$scope.commentObjetivo=data.objetivo;
		$scope.commentAlcance=data.alcance;
		$scope.commentDefiniciones=data.definiciones;
		$scope.commentResponsabilidades=data.responsabilidades;
		$scope.commentDesarrollo=data.desarrollo;
		$scope.commentReferencias=data.referencias;
		$scope.commentRegistros=data.registros;
		$scope.commentAnexos=data.anexos;*/
		$scope.commentObjetivo=typeof(data.objetivo) != "undefined" ? data.objetivo : "";
		$scope.commentAlcance=typeof(data.alcance) != "undefined" ? data.alcance : "";
		$scope.commentDefiniciones=typeof(data.definiciones) != "undefined" ? data.definiciones : "";
		$scope.commentResponsabilidades=typeof(data.responsabilidades) != "undefined" ? data.responsabilidades : "";
		$scope.commentDesarrollo=typeof(data.desarrollo) != "undefined" ? data.desarrollo : "";
		$scope.commentReferencias=typeof(data.referencias) != "undefined" ? data.referencias : "";
		$scope.commentRegistros=typeof(data.registros) != "undefined" ? data.registros : "";
		$scope.commentAnexos=typeof(data.anexos) != "undefined" ? data.anexos : "";
	});
	
	/*Funcion guardar*/
	$scope.guardar=function(){
		var datos={
			objetivo:$scope.commentObjetivo,
			alcance:$scope.commentAlcance,
			definiciones:$scope.commentDefiniciones,
			desarrollo:$scope.commentDesarrollo,
			referencias:$scope.commentReferencias,
			responsabilidades:$scope.commentResponsabilidades,
			registros:$scope.commentRegistros,
			anexos:$scope.commentAnexos,
			id_documento:$scope.idDocumento,
			id_usuario:$scope.usuario.id_usuario,
        	OptionSQL:"guardarCommentCp"
    	};
    	$http({
		    url:'php/consultas/documentos/sqlDocumentos.php',
		    method:'POST',
		    data:datos
		}).success(function(data){
		    $('#mensaje-revisor').empty();
		    $('#mensaje-revisor').html(data);
		    $('#mensaje-revisor').fadeIn(2000);
			setTimeout( "$('#mensaje-revisor').fadeOut(1000);",7000 );
	    });
		  		
	};

	$scope.guardarSalir=function(){
		$scope.guardar();
		$scope.salir();

	};
	$scope.salir=function(){
		$state.go('escritorio.documentos.borrador');
	};	
	$scope.salirNoGuardar=function(){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de salir de aprobación?</h3>' +

		                '     Los comentarios realizados no se guardaran'+
		                
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Salir sin guardar', fn: function(){$scope.salir();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};

	$scope.confirmarToAprobacion=function(){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de Autorizar el Documento?</h3>' +
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Aprobar Documento', fn: function(){$scope.toAutorizar();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};


	$scope.toAutorizar=function(){
		$scope.guardar();
		if($scope.usuario.id_usuario!=$scope.id_autorizador){
			alert("¡Usted no tiene permiso para Autorizar este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"AutorizarDocCp"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento ha sido Aprobado");
			    $state.go('escritorio.documentos.aprobados');
		    });
		}
	};//Termina toApronbacion
  	
	$scope.confirmarToEdicion=function(){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de regresar el documento a edición?</h3>' +
		                '     Ya no podra revisar el documento.'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Enviar a edición', fn: function(){$scope.toEdicion();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};
	$scope.toEdicion=function(){
		$scope.guardar();
		if($scope.usuario.id_usuario!=$scope.id_autorizador){
			alert("¡Usted no tiene permiso para enviar a edicion este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"enviarEdicionCp"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento fue enviado a Edición");
			    $state.go('escritorio.documentos.borrador');
		    });
		}
	};//Termina toEdicion
  	
};


function approvalBsCtrl($scope,$http,$state,$stateParams,createDialog,$sce){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.html='<h3 class="text-center text-primary separator-top"><i class="fa fa-circle-o-notch fa-spin"></i> Cargando el documento...</h3>';
	/*Obtiene los detalles del documento*/
	$http.get('php/consultas/documentos/getDetallesDocumento.php?tabla=bs&id_documento='+$scope.idDocumento)
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
		$scope.id_autorizador=data.id_autorizador;
		$scope.id_revisor=data.id_revisor;
		$http.get('php/consultas/busquedaArchivo/busquedaArchivo.php?file='+$scope.codigo)
		.success(function(data) {
			if(data==1){
				$scope.html=$sce.trustAsHtml('<iframe src="js/viewer/#../../pdfs/'+$scope.codigo+'.pdf" width="100%" height="500" allowfullscreen webkitallowfullscreen></iframe>');
			}else{
				$scope.html='<h1 class="text-center text-danger separator-top">:( UPSS...</h1><br>';
				$scope.html+='<h3 class="text-center text-danger"><i class="fa fa-exclamation-triangle"></i> El archivo no se cargó correctamente.</h3>';
				$scope.html+='<h3 class="text-center text-danger">Por favor pulse la tecla F5 o vuelva a entrar a esta sección.</h3>';
				$scope.html+='<p class="text-center text-danger">Si el problema persiste comuníquese con el administrador.</p>';
			}
		});
		if($scope.usuario.id_usuario!=$scope.id_autorizador){
			alert("¡Usted no tiene permiso de Autorizar este documento!");
			$state.go('escritorio.documentos.borrador');
		}
		if($scope.estado!='Aprobación'){
			alert("¡Este docmento ya no se encuentra en estado de Revisión!");
			$state.go('escritorio.documentos.borrador');
		}
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}
		/*Obtiene los comentarios del revisor*/
		$http.get('php/consultas/documentos/getComentariosBasica.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.id_revisor)
		.success(function(data) {
			//$scope.comentarioRevisor=data.comentario;
			$scope.comentarioRevisor=typeof(data.comentario) != "undefined" ? data.comentario : "";
			
		});
		/*Obtiene los comentarios anteriormente guardado por el autorizador*/
		$http.get('php/consultas/documentos/getComentariosBasica.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.usuario.id_usuario)
		.success(function(data) {
			//$scope.comentarioAutorizador=data.comentario;
			$scope.comentarioAutorizador=typeof(data.comentario) != "undefined" ? data.comentario : "";
		});
    });
	
	/*Funcion guardar*/
	$scope.guardar=function(){
		var datos={
			comentario:$scope.comentarioAutorizador,
			id_documento:$scope.idDocumento,
			id_usuario:$scope.usuario.id_usuario,
        	OptionSQL:"guardarCommentBs"
    	};
    	$http({
		    url:'php/consultas/documentos/sqlDocumentos.php',
		    method:'POST',
		    data:datos
		}).success(function(data){
		    $('#mensaje-revisor').empty();
		    $('#mensaje-revisor').html(data);
		    $('#mensaje-revisor').fadeIn(2000);
			setTimeout( "$('#mensaje-revisor').fadeOut(1000);",7000 );
	    });
		  		
	};

	$scope.guardarSalir=function(){
		$scope.guardar();
		$scope.salir();

	};
	$scope.salir=function(){
		$state.go('escritorio.documentos.borrador');
	};	
	$scope.salirNoGuardar=function(){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de salir de aprobación?</h3>' +

		                '     Los comentarios realizados no se guardaran'+
		                
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Salir sin guardar', fn: function(){$scope.salir();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};

	$scope.confirmarToAprobacion=function(){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de Autorizar el Documento?</h3>' +
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Aprobar Documento', fn: function(){$scope.toAutorizar();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};


	$scope.toAutorizar=function(){
		$scope.guardar();
		if($scope.usuario.id_usuario!=$scope.id_autorizador){
			alert("¡Usted no tiene permiso para Autorizar este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"AutorizarDocBs"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento ha sido Aprobado");
			    $state.go('escritorio.documentos.aprobados');
		    });
		}
	};//Termina toApronbacion
  	
	$scope.confirmarToEdicion=function(){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de regresar el documento a edición?</h3>' +
		                '     Ya no podra revisar el documento.'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Enviar a edición', fn: function(){$scope.toEdicion();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};
	$scope.toEdicion=function(){
		$scope.guardar();
		if($scope.usuario.id_usuario!=$scope.id_autorizador){
			alert("¡Usted no tiene permiso para enviar a edicion este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"enviarEdicionBs"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento fue enviado a Edición");
			    $state.go('escritorio.documentos.borrador');
		    });
		}
	};//Termina toEdicion
  	
};