function miPerfilCtrl($scope,$http){
	
	$scope.pass='';
	$scope.newPass='';
	$scope.newPass2='';

	$http.get("php/consultas/miPerfil/getInfo.php")
	.success(function(data) {
    	    $scope.id_usuario=data.id_usuario;
            $scope.nombre=data.nombre;
            $scope.apellidos=data.apellidos;
            $scope.email=data.email;
            $scope.telefono=data.telefono;
            $scope.celular=data.celular;
            $scope.direccion=data.direccion;
            $scope.id_puesto=data.id_puesto;
            $scope.id_area=data.id_area;
            $scope.user=data.user;
            $scope.id_perfil=data.id_perfil;
    });

    $http.get('php/consultas/usuarios/getPerfiles.php').
	success(function(data){
        $scope.perfiles=data;
    	for (var i = 0; i < $scope.perfiles.length; i++) {
            if($scope.perfiles[i].id_perfil==$scope.id_perfil){
                $scope.permiso=$scope.perfiles[i];            
                break;
            }
    	};
	});
    $scope.actualizarPerfil=function(id_perfil){
    	$scope.id_perfil=id_perfil;
    }; 

    $http.get('php/consultas/area/getAreas.php').
	success(function(data){
        $scope.areas=data;
    	for (var i = 0; i < $scope.areas.length; i++) {
            if($scope.areas[i].id_area==$scope.id_area){
                $scope.ar=$scope.areas[i];            
                break;
            }
    	};
	});
    $scope.actualizarArea=function(id_area){
    	$scope.id_area=id_area;
	}; 

    $http.get('php/consultas/puesto/getPuestos.php').
    success(function(data){
        $scope.puestos=data;
        for (var i = 0; i < $scope.puestos.length; i++) {
            if($scope.puestos[i].id_puesto==$scope.id_puesto){
                $scope.pu=$scope.puestos[i];            
                break;
            }
        };
    });
    $scope.actualizarPuesto=function(id_puesto){
        $scope.id_puesto=id_puesto;
    }; 

	$scope.guardarCambios=function(){
     	$('#guardar > i').removeClass('fa-floppy-o').addClass('fa-refresh fa-spin');
        if($scope.newPass){
            if(!$scope.pass){
                alert("Debe ingresar la contraseña actual para\npoder cambiar de contraseña");
                return;
            }
            var datos={
                id_usuario:$scope.id_usuario,
                nombre:$scope.nombre,
                apellidos:$scope.apellidos,
                email:$scope.email,
                telefono:$scope.telefono,
                celular:$scope.celular,
                direccion:$scope.direccion,
                password:$scope.pass, 
                new_pass:$scope.newPass,
	            id_puesto:$scope.id_puesto,
	            id_area:$scope.id_area,
	            id_perfil:$scope.id_perfil,
                OptionSQL:"guardarCambios"
            };
            console.log(datos);
            $http({
                url:'php/consultas/usuarios/sqlUsuarios.php',
                method:'POST',
                data:datos
            }).success(function(data){
                $('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                $('#guardar > i').removeClass('fa-refresh fa-spin').addClass('fa-floppy-o');
            });
        }else{
            var datos={
                id_usuario:$scope.id_usuario,
                nombre:$scope.nombre,
                apellidos:$scope.apellidos,
                email:$scope.email,
                telefono:$scope.telefono,
                celular:$scope.celular,
                direccion:$scope.direccion,
                id_puesto:$scope.id_puesto,
	            id_area:$scope.id_area,
	            id_perfil:$scope.id_perfil,
                password:0,  
                OptionSQL:"guardarCambios"             
            };
            console.log(datos);
            $http({
            url:'php/consultas/usuarios/sqlUsuarios.php',
                method:'POST',
                data:datos
            }).success(function(data){
                $('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                $('#guardar > i').removeClass('fa-refresh fa-spin').addClass('fa-floppy-o');
            });  
     
        }
    }

}