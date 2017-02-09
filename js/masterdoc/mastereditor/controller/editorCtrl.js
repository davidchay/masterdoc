function editorCpCtrl($scope,$http,$state,$stateParams,createDialog){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.objetivo="";
	$scope.alcance="";
	$scope.definiciones="";
	$scope.desarrollo="";
	$scope.referencias="";
	$scope.responsabilidades=[];
	$scope.registros=[];
	$scope.anexos="";
	
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
		$scope.id_creador=data.id_creador;
		$scope.id_revisor=data.id_revisor;
		$scope.id_autorizador=data.id_autorizador;
		if($scope.usuario.id_usuario!=$scope.id_creador){
			alert("¡Usted no tiene permiso de editar este documento!");
			$state.go('escritorio.documentos.borrador');
		}
		if($scope.estado!='Edición'){
			alert("¡Este docmento ya no se encuentra en estado de Edición!");
			$state.go('escritorio.documentos.borrador');
		}
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}

		/*Obtiene los comentarios anteriormente guardado por el autorizador*/
		$http.get('php/consultas/documentos/getComentariosCompleta.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.id_autorizador)
		.success(function(data) {
			/*$scope.comentarioObjetivoAutorizador=data.objetivo;
			$scope.comentarioAlcanceAutorizador=data.alcance;
			$scope.comentarioDefinicionesAutorizador=data.definiciones;
			$scope.comentarioResponsabilidadesAutorizador=data.responsabilidades;
			$scope.comentarioDesarrolloAutorizador=data.desarrollo;
			$scope.comentarioReferenciasAutorizador=data.referencias;
			$scope.comentarioRegistrosAutorizador=data.registros;
			$scope.comentarioAnexosAutorizador=data.anexos;*/
			$scope.comentarioObjetivoAutorizador= typeof(data.objetivo) != "undefined" ? data.objetivo : "";
			$scope.comentarioAlcanceAutorizador=typeof(data.alcance) != "undefined" ? data.alcance : "";
			$scope.comentarioDefinicionesAutorizador=typeof(data.definiciones) != "undefined" ? data.definiciones : "";
			$scope.comentarioResponsabilidadesAutorizador=typeof(data.responsabilidades) != "undefined" ? data.responsabilidades : "";
			$scope.comentarioDesarrolloAutorizador=typeof(data.desarrollo) != "undefined" ? data.desarrollo : "";
			$scope.comentarioReferenciasAutorizador=typeof(data.referencias) != "undefined" ? data.referencias : "";
			$scope.comentarioRegistrosAutorizador=typeof(data.registros) != "undefined" ? data.registros : "";
			$scope.comentarioAnexosAutorizador=typeof(data.anexos) != "undefined" ? data.anexos : "";

		});
		/*Obtiene los comentarios anteriormente guardado por el revisor*/
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
    /*configurando el tinymce*/
	var opcionesTinymce={
    	language : 'es',
    	theme: "modern",
    	skin:'light',
    	plugins: [
	        "advlist autolink lists link image charmap preview hr anchor pagebreak",
	        "searchreplace wordcount visualblocks visualchars code fullscreen",
	        "insertdatetime media nonbreaking save table contextmenu directionality",
	        "emoticons template paste textcolor responsivefilemanager "
	    ],
	    fixed_toolbar_container: "#mytoolbar",
        menubar: "edit format table insert view tools",
        toolbar:"responsivefilemanager | undo redo | styleselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | table link image media | forecolor backcolor | insertdatetime spellchecker visualblocks searchreplace preview",
		external_filemanager_path:"filemanager/",
		filemanager_title:"Responsive Filemanager" ,
		external_plugins: { "filemanager" : "filemanager/plugin.min.js"},
		handle_event_callback: function (e) {
    	// put logic here for keypress
  		}	
  	};	
  	$scope.objetivoTinyOp = opcionesTinymce;
	$scope.alcanceTinyOp = opcionesTinymce;
	$scope.definicionesTinyOp = opcionesTinymce;
	$scope.desarrolloTinyOp = opcionesTinymce;
	$scope.referenciasTinyOp = opcionesTinymce;
	$scope.anexosTinyOp = opcionesTinymce;
	
  	/*Obteniendo datos anteriormente guardados*/  
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
	/*Obteniendo los registros de la tabla de responsabilidades*/
	$http.get('php/consultas/documentos/getDatosCompletaRespon.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.responsabilidades=data;
	});
	/*Obteniendo registros de la tabla registros*/
	$http.get('php/consultas/documentos/getDatosCompletaRegistros.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.registros=data;
	});
	/*Obteniendo registros de la tabla revisiones*/
	$http.get('php/consultas/documentos/getDatosCompletaRevision.php?id_documento='+$scope.idDocumento)
	.success(function(data) {
		$scope.revisionList=data;
	});

	/*Modelo Responsabilidades*/
	$scope.agregarRespon=function(){
		$scope.resObj={
			area:'',
			acciones:''
		};
		$scope.responsabilidades.push($scope.resObj);
	};
	$scope.eliminarRes=function(index,obj){
		$scope.responsabilidades.splice(index,1);
	};
	/*Modelo registros*/
	$scope.agregarRegistro=function(){
		$scope.regObj={
			nombre_registro:'',
			codigo:'',
			responsable:'',
			tiempo_resguardo:''
		};
		$scope.registros.push($scope.regObj);
	};
	$scope.eliminarRegistro=function(index){
		$scope.registros.splice(index,1);
	};		



  	$scope.guardar=function(){
		var datos={
			objetivo:$scope.objetivo,
			alcance:$scope.alcance,
			definiciones:$scope.definiciones,
			desarrollo:$scope.desarrollo,
			referencias:$scope.referencias,
			id_documento:$scope.idDocumento,
			responsabilidades:$scope.responsabilidades,
			registros:$scope.registros,
			anexos:$scope.anexos,
        	OptionSQL:"guardarCpCambios"
    	};
    	console.log(datos);
		if(typeof $scope.objetivo == "undefined"){
			alert('objetivo undefined');
			return;
		}
    	$http({
		    url:'php/consultas/documentos/sqlDocumentos.php',
		    method:'POST',
		    data:datos
		}).success(function(data){
		    $('#mensaje-editor').empty();
		    $('#mensaje-editor').html(data);
		    $('#mensaje-editor').fadeIn(2000);
			setTimeout( "$('#mensaje-editor').fadeOut(1000);",7000 );
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
		                '  <h3>¿Está realmente seguro de salir de edición?</h3>' +

		                '     Los cambios realizados no se guardaran'+
		                
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Salir sin guardar', fn: function(){$scope.salir();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};

	$scope.confirmarToRevision=function(){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de enviar el documento a revisión?</h3>' +
		                '     Ya no podra hacer cambios al documento.'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Enviar a revisión', fn: function(){$scope.toRevision();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};


	$scope.toRevision=function(){
		$scope.guardar();
		if($scope.usuario.id_usuario!=$scope.id_creador){
			alert("¡Usted no tiene permiso para enviar a revisión este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"enviarRevisionCp"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento fue enviado a Revisión");
			    $state.go('escritorio.documentos.borrador');
		    });
		}
	};//Termina toRevision
  	
};


function editorBsCtrl($scope,$http,$state,$stateParams,createDialog,$fileUploader,$sce){
	$scope.idDocumento=$stateParams.idDocumento;
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
		$scope.id_creador=data.id_creador;
		$scope.id_revisor=data.id_revisor;
		$scope.id_autorizador=data.id_autorizador;
		$http.get('php/consultas/busquedaArchivo/busquedaArchivo.php?file='+$scope.codigo)
		.success(function(data) {
			if(data==1){
				$scope.html=$sce.trustAsHtml('<iframe src="js/viewer/#../../pdfs/'+$scope.codigo+'.pdf" width="100%" height="500" allowfullscreen webkitallowfullscreen></iframe>');
			}
		});

		if($scope.usuario.id_usuario!=$scope.id_creador){
			alert("¡Usted no tiene permiso de editar este documento!");
			$state.go('escritorio.documentos.borrador');
		}
		if($scope.estado!='Edición'){
			alert("¡Este docmento ya no se encuentra en estado de Edición!");
			$state.go('escritorio.documentos.borrador');
		}
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}

		/*Obtiene los comentarios anteriormente guardado por el autorizador*/
		$http.get('php/consultas/documentos/getComentariosBasica.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.id_autorizador)
		.success(function(data) {
			//$scope.comentarioAutorizador=data.comentario;
			$scope.comentarioAutorizador=typeof(data.comentario) != "undefined" ? data.comentario : "";
		});
		/*Obtiene los comentarios anteriormente guardado por el revisor*/
		$http.get('php/consultas/documentos/getComentariosBasica.php?id_documento='+$scope.idDocumento+'&id_usuario='+$scope.id_revisor)
		.success(function(data) {
			//$scope.comentarioRevisor=data.comentario;
			$scope.comentarioRevisor=typeof(data.comentario) != "undefined" ? data.comentario : "";
		});
		
    });

	/*uptoload*/
	 // create a uploader with options
        var uploader = $scope.uploader = $fileUploader.create({
            scope: $scope,                          // to automatically update the html. Default: $rootScope
            url: 'php/upload.php'
        });
        // ADDING FILTERS
        uploader.filters.push(function(item /*{File|HTMLInput}*/  ) { // user filter
           // console.info('filter1');
            return true;
        });
        // REGISTER HANDLERS


    $scope.toRevision=function(){
    	$('#btnrm').hide();
    	$("#btnrm").attr("disabled", "disabled");
    	$("#btnsc").attr("disabled", "disabled");
		if($scope.usuario.id_usuario!=$scope.id_creador){
			alert("¡Usted no tiene permiso para enviar a revisión este documento!");
			$state.go('escritorio.documentos.borrador');
		}else{
			var datos={
					id_documento:$scope.idDocumento,
					OptionSQL:"enviarRevisionBs"
			};
			$http({
			    url:'php/consultas/documentos/sqlDocumentos.php',
			    method:'POST',
			    data:datos
			}).success(function(data){
			    alert("El Documento fue enviado a Revisión");
			    $state.go('escritorio.documentos.borrador');
		    });
		}
	};//Termina toRevision
};


