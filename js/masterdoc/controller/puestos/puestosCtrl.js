function puestosCtrl($scope,$http,$state,createDialog){
	if($scope.usuario.id_perfil>0){
		$state.go('escritorio.dashboard');
	}
	$http.get('php/consultas/puesto/getPuestos.php').
	success(function(data){
        $scope.puestoList=data;
	});	
	$scope.nuevo_puesto='';
	$scope.nueva_descripcion='';

	$scope.addPuesto=function(){
		$scope.nuevo_puesto=$scope.nuevo_puesto.charAt(0).toUpperCase() + $scope.nuevo_puesto.slice(1);
		$scope.nueva_descripcion=$scope.nueva_descripcion.charAt(0).toUpperCase() + $scope.nueva_descripcion.slice(1);
		$scope.puestoObj={
				'nombre_puesto':$scope.nuevo_puesto,
				'descripcion':$scope.nueva_descripcion
			};

		for (var i =0; i<$scope.puestoList.length; i++) {
			if($scope.nuevo_puesto==$scope.puestoList[i].nombre_puesto){
				var mensaje='<div class="alert alert-warning">';
				mensaje+='<button type="button" class="close" data-dismiss="alert">&times;</button>';
		  		mensaje+='<i class="fa fa-exclamation-triangle"></i> El puesto <strong>';
		  		mensaje+=$scope.nuevo_puesto+'</strong> ya se encuentra en la base de datos.</div>';
				$('#msg').hide();
               	$('#msg').empty();
               	$('#msg').html(mensaje);
               	$('#msg').fadeIn(1000);
               	return;
			}
		};
		var datos={
				nombre_puesto:$scope.nuevo_puesto,
				descripcion_puesto:$scope.nueva_descripcion,
				OptionSQL:'agregarPuesto'
		};
		$http({
            url:'php/consultas/puesto/sqlPuestos.php',
            method:'POST',
            data:datos
        }).success(function(data){
               $scope.puestoObj.id_puesto=data.id_puesto;
		       $scope.puestoList.push($scope.puestoObj);
               $('#msg').hide();
               $('#msg').empty();
               $('#msg').html(data.mensaje);
               $('#msg').fadeIn(1000);
				$scope.nuevo_puesto='';
				$scope.nueva_descripcion='';
				
        }); 
		
	}

	//Guardar Cambios
	$scope.guardarCambios=function(puesto,id){
		puesto.nombre_puesto=puesto.nombre_puesto.charAt(0).toUpperCase() + puesto.nombre_puesto.slice(1);
		puesto.descripcion=puesto.descripcion.charAt(0).toUpperCase() + puesto.descripcion.slice(1);
		for (var i =0; i<$scope.puestoList.length; i++) {
			if(puesto.nombre_puesto==$scope.puestoList[i].nombre_puesto){
				if(puesto.id_puesto!=$scope.puestoList[i].id_puesto){
					alert("El puesto "+puesto.nombre_puesto+" ya se encuentra en la base de datos.");
					var mns='<p class="text-danger"><i class="fa fa-times"></i> No se realizaron los cambios</p>';
					$('#'+area.id_area+' > td > div.mnss').hide();
	               	$('#'+area.id_area+' > td > div.mnss').empty();
	               	$('#'+area.id_area+' > td > div.mnss').html(mns);
	               	$('#'+area.id_area+' > td > div.mnss').fadeIn(1000);
					return;
				}
			}
		};
		var datos={
				nombre_puesto:puesto.nombre_puesto,
				descripcion_puesto:puesto.descripcion,
				id_puesto:puesto.id_puesto,
				OptionSQL:'actualizarPuesto'
		};
		$http({
            url:'php/consultas/puesto/sqlPuestos.php',
            method:'POST',
            data:datos
        }).success(function(data){
        		$('tr#'+puesto.id_puesto).animate({
                    backgroundColor: '#FCF8E3'
                    }, 1000, function() {
                    $(this).animate({backgroundColor: '#ffffff'},2000);    
                });
        });
		
	};
	$scope.confirmarEliminarPuesto=function(puesto){
			createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de eliminar?<br>'+puesto.nombre_puesto+'</h3>' +
		                '	 <p>¡Algunos registros pueden sufrir algunos cambios dentro de la base de datos!</p>'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Eliminar', fn: function(){$scope.eliminarPuesto(puesto);}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};
	$scope.eliminarPuesto=function(puesto){
			var datos={
					id_puesto:puesto.id_puesto,
					OptionSQL:'eliminarPuesto'
			};
			$http({
	            url:'php/consultas/puesto/sqlPuestos.php',
	            method:'POST',
	            data:datos
	        }).success(function(data){
	        	var stylos={
                    backgroundColor:'none',
                    backgroundColor:'#F2DEDE'
                };
                $('#'+puesto.id_puesto).css(stylos);
                $('#'+puesto.id_puesto).fadeOut(2000, function () {
                     $(this).remove();
              	});
	        });
	};
};