function borradoresCtrl($scope,$http,$state,$stateParams,createDialog){
	$http.get('php/consultas/documentos/getDocumentoBorrador.php')
    .success(function(data) {
        $scope.borradoresList=data;
        console.log($scope.borradoresList);
    });
    $scope.edit=false;
    $scope.transitionTo=function(tabla,param,estado){
     	if(estado=='edicion'){
     		$state.go('editor'+tabla,param);
     	}else if(estado=='revision'){
     		$state.go('revisor'+tabla,param);
     	}else if(estado=='aprobacion'){
     		$state.go('approval'+tabla,param);
     	}else{
     		alert("opcion no valida");
     	}
    }


    $scope.verDetalles = function(id_documento,tabla) {
    		$('#'+id_documento+' #detalles > i').removeClass('fa-info-circle').addClass('fa-refresh fa-spin');
    		$http.get('php/consultas/documentos/getDetallesDocumento.php?id_documento='+id_documento+'&tabla='+tabla)
		    .success(function(data) {
		    	createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <div>' +
		                '    <dl class="dl-horizontal">' +
		                '       <dt>Nombre documento</dt>' +
		                '       <dd>'+data.nombre_documento+'</dd> '+
		                '       <dt>Codigo</dt>' +
		                '       <dd>'+data.codigo+'</dd> '+
		                '       <dt>Fecha </dt>' +
		                '       <dd>'+data.fecha+'</dd> '+
		                '       <dt>Tipo</dt>' +
		                '       <dd>'+data.nombre_tipo_doc+'</dd> '+
		                '       <dt>Area</dt>' +
		                '       <dd>'+data.nombre_area+'</dd> '+
		                '       <dt>Creador</dt>' +
		                '       <dd>'+data.creador+'</dd> '+
		                '       <dt>Revisor</dt>' +
		                '       <dd>'+data.revisor+'</dd> '+
		                '       <dt>Autorizador</dt>' +
		                '       <dd>'+data.autorizador+'</dd> '+
		                '       <dt>Estado</dt>' +
		                '       <dd>'+data.estado+'</dd> '+
		                '       <dt>Fecha de creación</dt>' +
		                '       <dd>'+data.fecha_creacion+'</dd> '+
						'       <dt>Ultima modificación</dt>' +
		                '       <dd>'+data.fecha_ultima_mod+'</dd> '+
		                '    </dl>' +
		                '  </div>' +
		                '</div>',
		              title: 'Detalles del documento...',
		              backdrop: true,
		              footerTemplate:'<button class="btn btn-primary" ng-click="$modalCancel()">Aceptar</button>'            
		            });
				$('#'+id_documento+' #detalles > i').removeClass('fa-refresh fa-spin').addClass('fa-info-circle');
    		
		    });
	};
	$scope.crearPDF=function(){
        window.open("php/reportes/reporte.borrador.php","Documento PDF","width=auto,height=auto,menubar=no,directories=no,location=no"); 
    };
	$scope.confirmaEliminar=function(id_documento,nombre_documento,tabla,id_creador){
			//$('#'+id_documento+' #eliminar > i').removeClass('fa-times').addClass('fa-refresh fa-spin');
    		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <div>' +
		                '    <h4> El documento: <strong>'+nombre_documento+'</strong>. Será enviado a la papelera</h4>'+
		                '	 <div class="form-group">'+
		                '	 	<label class="control-label" for="justificacion">Escriba la justificación</label>'+
		                '	    <textarea name="justificacion" ng-model="justificacion" class="form-control"></textarea>'+
		                '    </div>'+
		                '  </div>' +
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              controller: 'toPapeleraCtrl',
		              footerTemplate:'<button class="btn btn-warning" ng-click="$modalCancel();">Cancelar</button>'+            
		              '<button ng-disabled="!justificacion" class="btn btn-danger" ng-click="eliminarBorrador('+id_documento+',\''+tabla+'\',\''+id_creador+'\',\''+$scope.usuario.id_usuario+'\',\''+$scope.usuario.id_perfil+'\');$modalCancel();">Enviar a papelera</button>'
		            });
	};
	$scope.guardarCambiosNombre=function(id_documento,id,index){
		var x=$('#'+id).val();
		$scope.borradoresList[index].nombre_documento=x;
		var position=id.indexOf('-');
	    id=id.slice(0,position);
		var datos={
			id_documento:id,
			nombre_documento:x,
            OptionSQL:'cambiarNombreDoc'
        };
       $http({
            url:'php/consultas/documentos/sqlDocumentos.php',
            method:'POST',
            data:datos
        }).success(function(data) {
        	$('#'+id+' > td').addClass('info',400);
           	setTimeout(function() {
				$('#'+id+' > td').removeClass('info',400);
           	}, 700);
            $('.mensaje').html(data);  	
    	});
	};
	$scope.cancelarCambiosNombre=function(id,index){
		var x=$scope.borradoresList[index].nombre_documento;
		$('#'+id).val(x);
		return false;
	};
	
}
function toPapeleraCtrl($rootScope,$scope,$http,$state,$stateParams,createDialog){
	$scope.justificacion='';

	$scope.eliminarBorrador=function(id_documento,tabla,id_creador,id_usuario,id_perfil){
		if(id_usuario!=id_creador && id_perfil>0){
			alert("¡Usted no tiene permiso para eliminar este documento!");
			return;
		}
		var datos={
            id_documento:parseInt(id_documento),
            tabla:tabla,
            justificacion:$scope.justificacion,
            OptionSQL:'eliminarDoc'
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
			var stylos={
                    backgroundColor:'none',
                    backgroundColor:'#F2DEDE'
            };
            $('#'+id_documento+' > td').css(stylos);
            $('#'+id_documento).fadeOut(2000, function () {
                     $(this).remove();
              	});
			$('#'+id_documento+' #eliminar > i').removeClass('fa-refresh fa-spin').addClass('fa-times');
        	
    	});
	};
}

function permisosCtrl($scope,$http,$state,createDialog){
	$http.get('php/consultas/documentos/getDocumentoAutorizado.php')
    .success(function(data) {
        $scope.borradoresList=data;
    });
    $scope.transitionTo=function(param){
     	$state.go('escritorio.documentos.permiso',param);
    }
  }

function permisoCtrl($scope,$http,$state,$stateParams){
	$scope.id_documento=$stateParams.idDocumento;
	$scope.tabla=$stateParams.tabla;
	$scope.puestosSelect=[];
	if($scope.usuario.id_perfil>0){
		$state.go('escritorio.dashboard');
	}
	$http.get('php/consultas/documentos/getDetallesDocumento.php?id_documento='+$scope.id_documento+'&tabla='+$scope.tabla)
	.success(function(data) {
	    $scope.nombre_documento=data.nombre_documento;
	    $scope.codigo=data.codigo;
	    $scope.fecha=data.fecha;
	    $scope.tipo=data.nombre_tipo_doc;
	    $scope.area=data.nombre_area;
	    $scope.creador=data.creador;
	    $scope.revisor=data.revisor;
	    $scope.autorizador=data.autorizador;
	    $scope.estado=data.estado;
	    $scope.fecha_creacion=data.fecha_creacion;
		$scope.ultima_modificacion=data.fecha_ultima_mod;
    });
	$scope.puesto_selec='';
	$scope.puestoList=[];  
	$http.get('php/consultas/puesto/getPuestos.php')
    .success(function(data){
    	$scope.puestos=data;
    	$http.get('php/consultas/documentos/getDocumentoPermiso.php?id_documento='+$scope.id_documento).
		success(function(data){
			$scope.puestosSelect=data;
			for(var i=0;i<$scope.puestosSelect.length;i++){
				for (var x = 0; x < $scope.puestos.length; x++) {
					if($scope.puestosSelect[i].id_puesto==$scope.puestos[x].id_puesto){
						$scope.obj={
							id_puesto:$scope.puestos[x].id_puesto,
							nombre_puesto:$scope.puestos[x].nombre_puesto
						};
						$scope.puestoList.push($scope.obj);
					}
				};	
			};
		});
    });
	

	$scope.addPuesto=function(post){
		console.log('post '+post);
		if(post=='') return;
		$scope.obj={
			id_puesto:post.id_puesto,
			id_documento:$scope.id_documento
		};
		for (var i=0; i<$scope.puestosSelect.length; i++) {
				if(post.id_puesto===$scope.puestosSelect[i].id_puesto){
					return;
				}	
			};
		$scope.puestosSelect.push($scope.obj);
		$scope.puestoList.push(post);
		$scope.puesto_selec='';
	};
	$scope.rmPuesto=function(index){
		$scope.puestoList.splice(index,1);
		$scope.puestosSelect.splice(index,1);
	};

   $scope.guardar=function(){
		var datos={
			id_documento:$scope.id_documento,
			puestos:$scope.puestosSelect,
            OptionSQL:'permisos_doc'
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
    	});
	};
}

function aprobadosCtrl($scope,$http,$state,$stateParams,createDialog){
	$http.get('php/consultas/documentos/getDocumentoAutorizado.php')
    .success(function(data) {
        $scope.borradoresList=data;
        console.log($scope.borradoresList);
    });

    $scope.verDocumento=function(id_documento,tabla,op,consec){
    	var param={};
    	if(consec>0){
    		param={idDocumento:id_documento,consecutivo:consec,status:'aprobado'}
    	}else{
    		param={idDocumento:id_documento}
    	}
    	$http.get('php/consultas/documentos/getPermisosDocumento.php?id_documento='+id_documento)
	    .success(function(data) {
	        $scope.permiso=data;
	        if($scope.permiso>0){
	        	$scope.visorDoc(tabla,param,op);
	        }else{
	        	$scope.sinPermiso();
	        }
	    });
    }

    $scope.visorDoc=function(tabla,param,op){
    	if(op=='visor'){
    		$state.go('visor'+tabla,param);
    	}
    	else if(op=='archivo'){
    		$state.go('archivo'+tabla,param);
       	}
    }
    $scope.sinPermiso = function() {
    		    createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <div>' +
		                '    Usted no puede acceder al documento.'+
		                '  </div>' +
		                '</div>',
		              title: '¡Permiso denegado!',
		              backdrop: true,
		               footerTemplate:'<button class="btn btn-primary" ng-click="$modalCancel()">Aceptar</button>'            
		            });
			
	};

	$scope.crearPDF=function(){
        window.open("php/reportes/reporte.aprobados.php","Documento PDF","width=auto,height=auto,menubar=no,directories=no,location=no"); 
    };

}
function obsoletosCtrl($scope,$http,$state,$stateParams,createDialog){
	$http.get('php/consultas/documentos/getDocumentosObsoletos.php')
    .success(function(data) {
        $scope.obsoletosList=data;
    });

    $scope.transitionTo=function(page,param){
    	 $state.transitionTo(page,param);
    }

    $scope.crearPDF=function(){
        window.open("php/reportes/reporte.obsoletos.php","Documento PDF","width=auto,height=auto,menubar=no,directories=no,location=no"); 
    };

};
function obsoletosVersionesCtrl($scope,$http,$state,$stateParams,createDialog){
	$scope.id_documento=$stateParams.idDocumento;
	$scope.tabla=$stateParams.tabla;
	if($scope.usuario.id_perfil>0){
		$state.go('escritorio.dashboard');
	}
	$http.get('php/consultas/documentos/getDocumentoObsoletoVersiones.php?id_documento='+$scope.id_documento+'&tabla='+$scope.tabla)
	.success(function(data) {
	    $scope.versionesList=data;
	    $scope.nombre_documento=data[0].nombre_documento;
    });

    $scope.verArchivo=function(id_documento,consec){
    	$state.go('archivo'+$scope.tabla,{idDocumento:id_documento,consecutivo:consec,status:'obsoleto'});
    }
    
    $scope.crearPDF=function(){
        window.open("php/reportes/reporte.obsoletos.versiones.php?id_documento="+$scope.id_documento+'&tabla='+$scope.tabla,"Documento PDF","width=auto,height=auto,menubar=no,directories=no,location=no"); 
    };
}

function papeleraCtrl($scope,$http,$state,$stateParams,createDialog){
	$http.get('php/consultas/documentos/getDocumentoEliminado.php')
    .success(function(data) {
        $scope.eliminadosList=data;
        console.log($scope.eliminadosList);
    });
    $scope.verDetalles = function(id_documento,tabla) {
    		$('#'+id_documento+' #detalles > i').removeClass('fa-info-circle').addClass('fa-refresh fa-spin');
    		$http.get('php/consultas/documentos/getDetallesDocumento.php?id_documento='+id_documento+'&tabla='+tabla)
		    .success(function(data) {
		    	createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <div>' +
		                '    <dl class="dl-horizontal">' +
		                '       <dt>Nombre documento</dt>' +
		                '       <dd>'+data.nombre_documento+'</dd> '+
		                '       <dt>Codigo</dt>' +
		                '       <dd>'+data.codigo+'</dd> '+
		                '       <dt>Fecha </dt>' +
		                '       <dd>'+data.fecha+'</dd> '+
		                '       <dt>Tipo</dt>' +
		                '       <dd>'+data.nombre_tipo_doc+'</dd> '+
		                '       <dt>Area</dt>' +
		                '       <dd>'+data.nombre_area+'</dd> '+
		                '       <dt>Creador</dt>' +
		                '       <dd>'+data.creador+'</dd> '+
		                '       <dt>Revisor</dt>' +
		                '       <dd>'+data.revisor+'</dd> '+
		                '       <dt>Autorizador</dt>' +
		                '       <dd>'+data.autorizador+'</dd> '+
		                '       <dt>Estado</dt>' +
		                '       <dd>'+data.estado+'</dd> '+
		                '       <dt>Fecha de creación</dt>' +
		                '       <dd>'+data.fecha_creacion+'</dd> '+
						'       <dt>Ultima modificación</dt>' +
		                '       <dd>'+data.fecha_ultima_mod+'</dd> '+
		                '    </dl>' +
		                '  </div>' +
		                '</div>',
		              title: 'Detalles del documento...',
		              backdrop: true,
		              footerTemplate:'<button class="btn btn-primary" ng-click="$modalCancel()">Aceptar</button>'            
		              //success: {label: 'Aceptar', fn: function() {console.log('Inline modal closed');}},
		            });
				$('#'+id_documento+' #detalles > i').removeClass('fa-refresh fa-spin').addClass('fa-info-circle');
    		
		    });
	};
	$scope.crearPDF=function(){
        window.open("php/reportes/reporte.papelera.php","Documento PDF","width=auto,height=auto,menubar=no,directories=no,location=no"); 
    };
	$scope.confirmaReciclar=function(id_documento,nombre_documento,tabla){
			createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <div>' +
		                '    <h4> El documento: <strong>'+nombre_documento+'</strong>. Volvera hacer activo</h4>'+
		                '	 -El documento aparecerá en borador'+
		                '  </div>' +
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Restaurar documento', fn: function() {$scope.reciclarDoc(id_documento,tabla);}},
		              cancel: {label: 'Cancelar', fn:function(){$('#'+id_documento+' #eliminar > i').removeClass('fa-refresh fa-spin').addClass('fa-times');}}
		            });
	};
	$scope.reciclarDoc=function(id_documento,tabla){
		var datos={
            id_documento:parseInt(id_documento),
            tabla:tabla,
            OptionSQL:'restaurarDoc'
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
			var stylos={
                    backgroundColor:'none',
                    backgroundColor:'#F2DEDE'
            };
            $('#'+id_documento+' > td').css(stylos);
            $('#'+id_documento).fadeOut(2000, function () {
                     $(this).remove();
              	});
			$('#'+id_documento+' #eliminar > i').removeClass('fa-refresh fa-spin').addClass('fa-times');
        	
    	});
	};
	
}