function mensajeEmailCtrl($scope,$http,$state,$stateParams,createDialog){
	/*configurando el tinymce*/
	$scope.tinyOps={
    	language : 'es',
    	theme: "modern",
    	skin:'light',
    	menubar: false,
      plugins: [
          "textcolor"
      ],
      toolbar:" styleselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor backcolor ",
    	
		handle_event_callback: function (e) {
    	// put logic here for keypress
  		}	
  	};	
  	$http.get('php/consultas/config/getMensajes.php').
	   success(function(data){
      console.log(data);
		/*cuando un documento es creado*/
		$scope.nuevoDoc={
			asunto:data['nuevoDoc'].asunto.mensaje,	
			creador:data['nuevoDoc'].creador.mensaje,
			revisor:data['nuevoDoc'].revisor.mensaje,
			autorizador:data['nuevoDoc'].autorizador.mensaje
		};
    $scope.alRevisor={
      asunto:data['revision'].asunto.mensaje, 
      revisor:data['revision'].revisor.mensaje
    };
    $scope.autorizador={
      asunto:data['autorizacion'].asunto.mensaje, 
      autorizador:data['autorizacion'].autorizador.mensaje
    };
    $scope.edicion={
      asunto:data['edicion'].asunto.mensaje, 
      creador:data['edicion'].creador.mensaje
    };
    $scope.eliminado={
      asunto:data['eliminado'].asunto.mensaje, 
      usuarios:data['eliminado'].usuarios.mensaje
    };
    $scope.aprobado={
      asunto:data['aprobado'].asunto.mensaje, 
      usuarios:data['aprobado'].usuarios.mensaje
    };
    $scope.revisionDoc={
      asunto:data['revisionDoc'].asunto.mensaje, 
      usuarios:data['revisionDoc'].usuarios.mensaje
    };
    $scope.obsoleto={
      asunto:data['obsoleto'].asunto.mensaje, 
      usuarios:data['obsoleto'].usuarios.mensaje
    };
    $scope.permiso={
      asunto:data['permiso'].asunto.mensaje, 
      usuarios:data['permiso'].usuarios.mensaje
    };
	});
  /*Guardar Nuevo documento*/   
  $scope.guardarND=function(datos){
  	datos['OptionSQL']='guardarND';
   	$http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
        	console.log(data);
               $('#mensajeND').hide();
               $('#mensajeND').empty();
               $('#mensajeND').html(data);
               $('#mensajeND').fadeIn(1000);
        }); 
  };
  /*Guardar revision*/
  $scope.guardarRevision=function(datos){
    datos['OptionSQL']='guardarRevision';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajeRV').hide();
               $('#mensajeRV').empty();
               $('#mensajeRV').html(data);
               $('#mensajeRV').fadeIn(1000);
        }); 
  };
  /*Guardar autorizador*/
  $scope.guardarAprobacion=function(datos){
    datos['OptionSQL']='guardarAprobacion';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajeAT').hide();
               $('#mensajeAT').empty();
               $('#mensajeAT').html(data);
               $('#mensajeAT').fadeIn(1000);
        }); 
  };
  /*Guardar autorizador*/
  $scope.guardarEdicion=function(datos){
    datos['OptionSQL']='guardarEdicion';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajeED').hide();
               $('#mensajeED').empty();
               $('#mensajeED').html(data);
               $('#mensajeED').fadeIn(1000);
        }); 
  };
  /*Guardar Eliminado*/
  $scope.guardarEliminado=function(datos){
    datos['OptionSQL']='guardarEliminado';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajeEL').hide();
               $('#mensajeEL').empty();
               $('#mensajeEL').html(data);
               $('#mensajeEL').fadeIn(1000);
        }); 
  };
   /*Guardar Aprobado*/
  $scope.guardarAprobado=function(datos){
    datos['OptionSQL']='guardarAprobado';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajeAP').hide();
               $('#mensajeAP').empty();
               $('#mensajeAP').html(data);
               $('#mensajeAP').fadeIn(1000);
        }); 
  };
    /*Guardar Aprobado*/
  $scope.guardarRevisionDoc=function(datos){
    datos['OptionSQL']='guardarRevisionDoc';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajeRVD').hide();
               $('#mensajeRVD').empty();
               $('#mensajeRVD').html(data);
               $('#mensajeRVD').fadeIn(1000);
        }); 
  };
    /*Guardar obsoletos*/
  $scope.guardarObsoleto=function(datos){
    datos['OptionSQL']='guardarObsoleto';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajeOB').hide();
               $('#mensajeOB').empty();
               $('#mensajeOB').html(data);
               $('#mensajeOB').fadeIn(1000);
        }); 
  };
    /*Guardar obsoletos*/
  $scope.guardarPermiso=function(datos){
    datos['OptionSQL']='guardarPermiso';
    $http({
            url:'php/consultas/config/sqlConfig.php',
            method:'POST',
            data:datos
        }).success(function(data){
          console.log(data);
               $('#mensajePE').hide();
               $('#mensajePE').empty();
               $('#mensajePE').html(data);
               $('#mensajePE').fadeIn(1000);
        }); 
  };
}
