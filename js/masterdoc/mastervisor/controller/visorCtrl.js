function visorCpCtrl($scope,$http,$state,$stateParams,createDialog){
	$scope.idDocumento=$stateParams.idDocumento;
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
	        if($scope.permiso<1){
	        	alert('Usted no tiene permisos para ver este documento.');
	        	$state.go('escritorio.documentos.aprobados');
	        }
	   	});

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
		$scope.id_creador=data.id_creador;
		if(data.length<1){
			$state.go('escritorio.documentos.aprobados');
		}
    });
	/*Obtiene las secciones del documento*/
  	$http.get('php/consultas/documentos/getDatosCompleta.php?id_documento='+$scope.idDocumento)
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
	$scope.salir=function(){
		$state.go('escritorio.documentos.borrador');
	};	
	
	$scope.crearPDF=function(){
        window.open("partials/mastervisor/documentoPDF.php?id_documento="+$scope.idDocumento,"Documento PDF","width=800,height=500,top=75,left=250,menubar=no,directories=no,location=no"); 
    };

    $(".ineditable").selectOff();

    $scope.confirmRevision=function(){
    	createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div>' +
		                	'<h4>¿Esta seguro de hacer una nueva revsión?</h4>'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              //footerTemplate:'<button class="btn btn-primary" ng-click="$modalCancel()">Aceptar</button>'            
		              success: {label:'Si', fn: function() {$scope.nuevaRevision();}},
		              cancel: {label: 'No', fn:function(){}}
		            });
    };
  	$scope.nuevaRevision=function(){
  		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div>' +
		                	'<h4>Descripción del cambio</h4>'+
		                	'<textarea class="form-control" ng-model="descripcionCambio" required></textarea>'+
		                	'<h4>Justificación del cambio</h4>'+
		                	'<textarea class="form-control" ng-model="justificacionCambio" required></textarea>'+
		               '</div>',
		              title: 'Nueva Revsión',
		              backdrop: true,
		              controller: 'nuevaRevisionCtrl',
		              footerTemplate:'<button class="btn btn-danger" ng-click="$modalCancel();">Cancelar</button>'+            
		              '<button ng-disabled="!descripcionCambio || !justificacionCambio" class="btn btn-primary" ng-click="enviarRevision('+$scope.idDocumento+',\''+$scope.usuario.user+'\');$modalCancel();">Crear Nueva Revisión</button>'
		              
		              
		            });
  	};
  	$scope.confirmObsoleto=function(){
    	createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div>' +
		                	'<h4>¿Esta seguro de hacer este documento obsoleto?</h4>'+
		                	'No se podrán hacer mas revisiones del documento'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Hacer obsoleto el documento', fn: function() {$scope.docObsoleto();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });
    };
    $scope.docObsoleto=function(){
		var datos={
			id_documento:$scope.idDocumento,
			OptionSQL:'docObsoletoCp'
		};
	   $http({
            url:'php/consultas/documentos/sqlDocumentos.php',
            method:'POST',
            data:datos
        }).success(function(data) {
				$('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                alert('El documento esta obsoleto.');
                $state.go('escritorio.documentos.aprobados');
    	});
	}

  	
};

function nuevaRevisionCtrl($scope,$http,$state){
	$scope.descripcionCambio="";
	$scope.justificacionCambio="";
	$scope.enviarRevision=function(id_doc,usuario){
		var datos={
			id_documento:id_doc,
			usuario:usuario,
			descripcion:$scope.descripcionCambio,
			justificacion:$scope.justificacionCambio,
            OptionSQL:'nuevaRevision'
		};
	   $http({
            url:'php/consultas/documentos/sqlDocumentos.php',
            method:'POST',
            data:datos
        }).success(function(data) {
				$('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                alert('Se ha creado una nueva revisión.\nEsta revisión a quedado como obsoleta.');
                $state.go('escritorio.documentos.borrador');
    	});
	}
}

function visorBsCtrl($scope,$http,$state,$stateParams,createDialog,$sce){
	$scope.idDocumento=$stateParams.idDocumento;
	$scope.html='<h3 class="text-center text-primary separator-top"><i class="fa fa-circle-o-notch fa-spin"></i> Cargando el documento...</h3>';
	/*Permisos del documento*/
	$http.get('php/consultas/documentos/getPermisosDocumento.php?id_documento='+$scope.idDocumento)
	    .success(function(data) {
	        $scope.permiso=data;
	        if($scope.permiso<1){
	        	alert('Usted no tiene permisos para ver este documento.');
	        	$state.go('escritorio.documentos.aprobados');
	        }
	   	});

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
        if($scope.estado!='Autorizado'){
			alert("¡Este docmento ya no se encuentra en estado de Revisión!");
			$state.go('escritorio.documentos.borrador');
		}
		if(data.length<1){
			$state.go('escritorio.documentos.borrador');
		}
	});
	
	$scope.salir=function(){
		$state.go('escritorio.documentos.borrador');
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

    $(".ineditable").selectOff();

    $scope.confirmRevision=function(){
    	createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div>' +
		                	'<h4>¿Esta seguro de hacer una nueva revsión?</h4>'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              //footerTemplate:'<button class="btn btn-primary" ng-click="$modalCancel()">Aceptar</button>'            
		              success: {label:'Si', fn: function() {$scope.nuevaRevision();}},
		              cancel: {label: 'No', fn:function(){}}
		            });
    };
  	$scope.nuevaRevision=function(){
  		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div>' +
		                	'<h4>Descripción del cambio</h4>'+
		                	'<textarea class="form-control" ng-model="descripcionCambio" required></textarea>'+
		                	'<h4>Justificación del cambio</h4>'+
		                	'<textarea class="form-control" ng-model="justificacionCambio" required></textarea>'+
		               '</div>',
		              title: 'Nueva Revsión',
		              backdrop: true,
		              controller: 'nuevaRevisionBsCtrl',
		              footerTemplate:'<button class="btn btn-danger" ng-click="$modalCancel();">Cancelar</button>'+            
		              '<button ng-disabled="!descripcionCambio || !justificacionCambio" class="btn btn-primary" ng-click="enviarRevisionBs('+$scope.idDocumento+',\''+$scope.usuario.user+'\',\''+$scope.codigo+'\');$modalCancel();">Crear Nueva Revisión</button>'
		              
		              
		            });
  	};
  	
  	$scope.confirmObsoleto=function(){
    	createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div>' +
		                	'<h4>¿Esta seguro de hacer este documento obsoleto?</h4>'+
		                	'No se podrán hacer mas revisiones del documento'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Hacer obsoleto el documento', fn: function() {$scope.docObsoleto();}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });
    };
    $scope.docObsoleto=function(){
		var datos={
			id_documento:$scope.idDocumento,
			OptionSQL:'docObsoletoBs'
		};
	   $http({
            url:'php/consultas/documentos/sqlDocumentos.php',
            method:'POST',
            data:datos
        }).success(function(data) {
				$('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                alert('El documento esta obsoleto.');
                $state.go('escritorio.documentos.aprobados');
    	});
	}


};

function nuevaRevisionBsCtrl($scope,$http,$state){
	$scope.descripcionCambio="";
	$scope.justificacionCambio="";
	$scope.enviarRevisionBs=function(id_doc,usuario,codigo){
		var datos={
			id_documento:id_doc,
			usuario:usuario,
			file:codigo+'.pdf',
			descripcion:$scope.descripcionCambio,
			justificacion:$scope.justificacionCambio,
            OptionSQL:'nuevaRevisionBs'
		};
	   $http({
            url:'php/consultas/documentos/sqlDocumentos.php',
            method:'POST',
            data:datos
        }).success(function(data) {
				$('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                alert('Se ha creado una nueva revisión.\nEsta revisión a quedado como obsoleta.');
                $state.go('escritorio.documentos.borrador');
    	});
	}
}