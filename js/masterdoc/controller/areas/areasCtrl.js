function areasCtrl($scope,$http,$state,createDialog){
	if($scope.usuario.id_perfil>0){
		$state.go('escritorio.dashboard');
	}
	$http.get('php/consultas/area/getAreas.php').
	success(function(data){
        $scope.areaList=data;
	});	
	$scope.nueva_area='';
	$scope.nuevo_codigo='';
	$scope.nueva_descripcion='';

	$scope.addArea=function(){
		$scope.nueva_area=$scope.nueva_area.charAt(0).toUpperCase() + $scope.nueva_area.slice(1);
		$scope.nuevo_codigo=$scope.nuevo_codigo.toUpperCase();
		$scope.nueva_descripcion=$scope.nueva_descripcion.charAt(0).toUpperCase() + $scope.nueva_descripcion.slice(1);
		$scope.areaObj={
				'nombre_area':$scope.nueva_area+' ('+$scope.nuevo_codigo+')',
				'area':$scope.nueva_area,
				'codigo':$scope.nuevo_codigo,
				'descripcion':$scope.nueva_descripcion
			};
		for (var i =0; i<$scope.areaList.length; i++) {
			if($scope.nuevo_codigo==$scope.areaList[i].codigo){
				var mensaje='<div class="alert alert-warning">';
				mensaje+='<button type="button" class="close" data-dismiss="alert">&times;</button>';
		  		mensaje+='<i class="fa fa-exclamation-triangle"></i> El codigo <strong>';
		  		mensaje+=$scope.nuevo_codigo+'</strong> ya se encuentra en la base de datos.</div>';
				$('#msg').hide();
               	$('#msg').empty();
               	$('#msg').html(mensaje);
               	$('#msg').fadeIn(1000);
               	return;
			}
		};
		var datos={
				nombre_area:$scope.nueva_area,
				codigo_area:$scope.nuevo_codigo,
				descripcion_area:$scope.nueva_descripcion,
				OptionSQL:'agregarArea'
		};
		$http({
            url:'php/consultas/area/sqlAreas.php',
            method:'POST',
            data:datos
        }).success(function(data){
               $scope.areaObj.id_area=data.id_area;
		       $scope.areaList.push($scope.areaObj);

               $('#msg').hide();
               $('#msg').empty();
               $('#msg').html(data.mensaje);
               $('#msg').fadeIn(1000);

               	$scope.nueva_area='';
				$scope.nuevo_codigo='';
				$scope.nueva_descripcion='';
        }); 
		
	}

	//Guardar Cambios
	$scope.guardarCambios=function(area,id){
		area.area=area.area.charAt(0).toUpperCase() + area.area.slice(1);
		area.codigo=area.codigo.toUpperCase();
		area.descripcion=area.descripcion.charAt(0).toUpperCase() + area.descripcion.slice(1);
		for (var i =0; i<$scope.areaList.length; i++) {
			if(area.codigo==$scope.areaList[i].codigo){
				if(area.id_area!=$scope.areaList[i].id_area){
					alert("El codigo "+area.codigo+" ya se encuentra en la base de datos.");
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
				nombre_area:area.area,
				codigo_area:area.codigo,
				descripcion_area:area.descripcion,
				id_area:area.id_area,
				OptionSQL:'actualizarArea'
		};
		$http({
            url:'php/consultas/area/sqlAreas.php',
            method:'POST',
            data:datos
        }).success(function(data){
   				for (var i =0; i<$scope.areaList.length; i++) {
					if(area.id_area==$scope.areaList[i].id_area){
						$scope.areaList[i].nombre_area=area.area+' ('+area.codigo+')';
						$scope.areaList[i].descripcion_area=area.descripcion;
					}
				};
        		var mns='<p class="text-success"><i class="fa fa-check"></i> Los cambios se realizaron exitosamente</p>';
                $('#'+area.id_area+' > td > div.mnss').hide();
                $('#'+area.id_area+' > td > div.mnss').empty();
                $('#'+area.id_area+' > td > div.mnss').html(mns);
            	$('#'+area.id_area+' > td > div.mnss').fadeIn(1000);
				$('#'+area.id_area+' > td > div.mnss').fadeOut(5000);
        });
		
	}
	$scope.confirmarEliminarArea=function(area){
		createDialog({
		              id: 'simpleDialog',
		              template:
		                '<div class="">' +
		                '  <h3>¿Está realmente seguro de eliminar?</h3>' +
		                '	<p class="lead">'+area.nombre_area+'</p>'+
		                '	 <p>¡Algunos registros pueden sufrir algunos cambios dentro de la base de datos!</p>'+
		                '</div>',
		              title: '¡Atención!',
		              backdrop: true,
		              success: {label:'Eliminar', fn: function(){$scope.eliminarArea(area);}},
		              cancel: {label: 'Cancelar', fn:function(){}}
		            });	
	};
	$scope.eliminarArea=function(area){
			var datos={
					id_area:parseInt(area.id_area),
					OptionSQL:'eliminarArea'
			};
			console.log(datos);
			//return;
			$http({
	            url:'php/consultas/area/sqlAreas.php',
	            method:'POST',
	            data:datos
	        }).success(function(data){
	        	var stylos={
                    backgroundColor:'none',
                    backgroundColor:'#F2DEDE'
                };
                $('#'+area.id_area+' > td').css(stylos);
                $('#'+area.id_area).fadeOut(2000, function () {
                     $('#mun'+area.id_area).remove();
              	});
	        });
	};
};