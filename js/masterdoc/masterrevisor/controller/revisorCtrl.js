function revisorCpCtrl($scope,$http,$state,$stateParams,createDialog){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.commentObjetivo='';
	$scope.commentAlcance='';
	$scope.commentDefiniciones='';
	$scope.commentResponsabilidades='';
	$scope.commentDesarrollo='';
	$scope.commentReferencias='';
	$scope.commentRegistros='';
	$scope.commentAnexos='';
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
		$scope.id_revisor=data.id_revisor;
		$scope.id_autorizador=data.id_autorizador;
		if($scope.usuario.id_usuario!=$scope.id_revisor){
			alert("¡Usted no tiene permiso de editar este documento!");
			$state.go('escritorio.documentos.borrador');
		}
		if($scope.estado!='Revisión'){
			alert("¡Este docmento ya no se encuentra en estado de Revisión!");
			$state.go('escritorio.documentos.borrador');
		}
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}
		/*Obtiene los comentarios anteriormente guardado por el autorizador*/
		$http.get('php/consultas/documentos/getComentariosCompleta.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.id_autorizador)
		.success(function(data) {
			$scope.comentarioObjetivoAutorizador= typeof(data.objetivo) != "undefined" ? data.objetivo : "";
			$scope.comentarioAlcanceAutorizador=typeof(data.alcance) != "undefined" ? data.alcance : "";
			$scope.comentarioDefinicionesAutorizador=typeof(data.definiciones) != "undefined" ? data.definiciones : "";
			$scope.comentarioResponsabilidadesAutorizador=typeof(data.responsabilidades) != "undefined" ? data.responsabilidades : "";
			$scope.comentarioDesarrolloAutorizador=typeof(data.desarrollo) != "undefined" ? data.desarrollo : "";
			$scope.comentarioReferenciasAutorizador=typeof(data.referencias) != "undefined" ? data.referencias : "";
			$scope.comentarioRegistrosAutorizador=typeof(data.registros) != "undefined" ? data.registros : "";
			$scope.comentarioAnexosAutorizador=typeof(data.anexos) != "undefined" ? data.anexos : "";
		});

    });
	/*Obtiene datos del documento*/
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
		
	});
	/*obtiene datos de la seccion responsabilidades*/
	$http.get('php/consultas/documentos/getDatosCompletaRespon.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.responsabilidades=data;
		
	});
	/*obtiene datos de la seccion registros*/
	$http.get('php/consultas/documentos/getDatosCompletaRegistros.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.registros=data;
	});
	/*Obteniendo registros de la tabla revisiones*/
	$http.get('php/consultas/documentos/getDatosCompletaRevision.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.revisionList=data;
	});

	/*obtiene los comenatarios guardados anteriormene del revisor (usuario actual)*/
	$http.get('php/consultas/documentos/getComentariosCompleta.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.usuario.id_usuario)
	.success(function(data) {
		$scope.commentObjetivo=typeof(data.objetivo) != "undefined" ? data.objetivo : "";
		$scope.commentAlcance=typeof(data.alcance) != "undefined" ? data.alcance : "";
		$scope.commentDefiniciones=typeof(data.definiciones) != "undefined" ? data.definiciones : "";
		$scope.commentResponsabilidades=typeof(data.responsabilidades) != "undefined" ? data.responsabilidades : "";
		$scope.commentDesarrollo=typeof(data.desarrollo) != "undefined" ? data.desarrollo : "";
		$scope.commentReferencias=typeof(data.referencias) != "undefined" ? data.referencias : "";
		$scope.commentRegistros=typeof(data.registros) != "undefined" ? data.registros : "";
		$scope.commentAnexos=typeof(data.anexos) != "undefined" ? data.anexos : "";
	});
	
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
		                '  <h3>¿Está realmente seguro de salir de revisión?</h3>' +

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
		                '  <h3>¿Está realmente seguro de enviar el documento a aprobación?</h3>' +
		                '     Ya no podra revisar el documento.'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Enviar a aprobación', fn: function(){$scope.toAprobacion();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};


	$scope.toAprobacion=function(){
		$scope.guardar();
		if($scope.usuario.id_usuario!=$scope.id_revisor){
			alert("¡Usted no tiene permiso para enviar a aprobación este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"enviarAprobacionCp"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento fue enviado a Aprobación");
			    $state.go('escritorio.documentos.borrador');
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
		if($scope.usuario.id_usuario!=$scope.id_revisor){
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


function revisorBsCtrl($scope,$http,$state,$stateParams,createDialog,$sce){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.comentarioAutorizador="";
	$scope.comentarioRevisor="";
	$scope.html='<h3 class="text-center text-primary separator-top"><i class="fa fa-circle-o-notch fa-spin"></i> Cargando el documento...</h3>';
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
		$scope.id_revisor=data.id_revisor;
		$scope.id_autorizador=data.id_autorizador;
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
        if($scope.usuario.id_usuario!=$scope.id_revisor){
			alert("¡Usted no tiene permiso de revisar este documento!");
			$state.go('escritorio.documentos.borrador');
		}
		if($scope.estado!='Revisión'){
			alert("¡Este docmento ya no se encuentra en estado de Revisión!");
			$state.go('escritorio.documentos.borrador');
		}
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}
		/*Obtiene los comentarios anteriormente guardado por el autorizador*/
		$http.get('php/consultas/documentos/getComentariosBasica.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.id_autorizador)
		.success(function(data) {
			$scope.comentarioAutorizador=typeof(data.comentario) != "undefined" ? data.comentario : "";
		});

		/*obtiene los comenatarios guardados anteriormene del revisor (usuario actual)*/
		$http.get('php/consultas/documentos/getComentariosBasica.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.usuario.id_usuario)
		.success(function(data) {
			$scope.comentarioRevisor=typeof(data.comentario) != "undefined" ? data.comentario : "";
		});
    });

	$scope.guardar=function(){
		var datos={
			comentario:$scope.comentarioRevisor,
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
		                '  <h3>¿Está realmente seguro de salir de revisión?</h3>' +

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
		                '  <h3>¿Está realmente seguro de enviar el documento a aprobación?</h3>' +
		                '     Ya no podra revisar el documento.'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Enviar a aprobación', fn: function(){$scope.toAprobacion();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};


	$scope.toAprobacion=function(){
		$scope.guardar();
		if($scope.usuario.id_usuario!=$scope.id_revisor){
			alert("¡Usted no tiene permiso para enviar a aprobación este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"enviarAprobacionBs"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento fue enviado a Aprobación");
			    $state.go('escritorio.documentos.borrador');
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
		if($scope.usuario.id_usuario!=$scope.id_revisor){
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

}
