function listaUsuariosCtrl($scope,$http,$state,$stateParams){
	if($scope.usuario.id_perfil>0){
        $state.go('escritorio.dashboard');
    }
    $scope.users=[{}];
	$scope.query='';
	$http.get('php/consultas/usuarios/getTablaUsuarios.php')
    .success(function(data) {
        $scope.usuariosList=data;
    });

    $scope.transitionTo=function(page,param){
    	 $state.transitionTo(page,param);
    }
}
function detalleUsuarioCtrl($scope,$http,$state,$stateParams){
	if($scope.usuario.id_perfil>0){
        $state.go('escritorio.dashboard');
    }
    $scope.idUsuario=$stateParams.idUsuario;
	$scope.newPass='';
	$scope.newPass2='';

	$http.get("php/consultas/usuarios/getInfoPerfil.php?id_perfil="+$scope.idUsuario)
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
	$scope.actualizarDatos=function(){
        $('#guardarCambios > i').removeClass('fa-file-text-o').addClass('fa-refresh fa-spin');
     	if($scope.newPass){
            
            var datos={
                id_usuario:$scope.id_usuario,
                nombre:$scope.nombre,
                apellidos:$scope.apellidos,
                email:$scope.email,
                telefono:$scope.telefono,
                celular:$scope.celular,
                direccion:$scope.direccion,
                new_pass:$scope.newPass,
	            id_puesto:$scope.id_puesto,
	            id_area:$scope.id_area,
	            id_perfil:$scope.id_perfil,
                OptionSQL:"actualizarDatos"
            };
            $http({
                url:'php/consultas/usuarios/sqlUsuarios.php',
                method:'POST',
                data:datos
            }).success(function(data){
                $('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                $('#guardarCambios > i').removeClass('fa-refresh fa-spin').addClass('fa-file-text-o');
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
                new_pass:0,  
                OptionSQL:"actualizarDatos"             
            };
            $http({
            url:'php/consultas/usuarios/sqlUsuarios.php',
                method:'POST',
                data:datos
            }).success(function(data){
                $('.mensaje').hide();
                $('.mensaje').empty();
                $('.mensaje').html(data);
                $('.mensaje').fadeIn(1000);
                $('#guardarCambios > i').removeClass('fa-refresh fa-spin').addClass('fa-floppy-o');
            });  
     
        }
    }

    $scope.eliminarUsuario=function(){
        var r=confirm("Esta realmente seguro de eliminar al usuario:\n"+$scope.nombre+" "+$scope.apellidos+".\n\nOtros registros pueden ser modificados en la base de datos" );
        if(r){
            $('#eliminarUsuario > i').removeClass('fa-times').addClass('fa-times fa-spin');
            var datos={
                id_usuario:$scope.id_usuario,
                OptionSQL:"eliminar"
            };
            $http({
                url:'php/consultas/usuarios/sqlUsuarios.php',
                method:'POST',
                data:datos
            }).success(function(data){
                $('#guardarCambios > i').removeClass('fa-spin');
                alert("El usuario se eliminio de la base de datos");
                $state.transitionTo('usuarios.lista');
            });
        }
    }
}

function nuevoUsuarioCtrl($scope,$http){
    $scope.nombre="";
    $scope.apellidos="";
    $scope.email="";
    $scope.telefono="";
    $scope.celular="";
    $scope.direccion="";
    $scope.id_puesto="";
    $scope.id_area="";
    $scope.user="";
    $scope.id_perfil="";
    $scope.newPass="";
    $scope.newPass2="";
    $scope.reset="";

    $http.get('php/consultas/usuarios/getPerfiles.php').
    success(function(data){
        $scope.perfiles=data;
        
    });
    $scope.actualizarPerfil=function(id_perfil){
        $scope.id_perfil=id_perfil;
    }; 

    $http.get('php/consultas/area/getAreas.php').
    success(function(data){
        $scope.areas=data;
        
    });
    $scope.actualizarArea=function(id_area){
        $scope.id_area=id_area;
    }; 

    $http.get('php/consultas/puesto/getPuestos.php').
    success(function(data){
        $scope.puestos=data;
        
    });
    $scope.actualizarPuesto=function(id_puesto){
        $scope.id_puesto=id_puesto;
    }; 

    

    $scope.guardar=function(){
        $('#guardar > i').removeClass('fa-floppy-o').addClass('fa-refresh fa-spin');
        var datos={
            usuario:$scope.user,
            OptionSQL:"usuarioDisponible"
        }; 
         $http({
            url:'php/consultas/usuarios/sqlUsuarios.php',
            method:'POST',
            data:datos
        }).success(function(data){
            if(data.error==1){
               $scope.pass='';
               $('#disponible').hide();
               $('#disponible').empty();
               $('#disponible').html(data.mensage);
               $('#disponible').fadeIn(1000);
               $("#user").focus();
               $('#guardar > i').removeClass('fa-refresh fa-spin').addClass('fa-floppy-o');
            }else{
               $('#disponible').fadeOut(1000);
               $('#disponible').empty();
               var datos={
                    nombre:$scope.nombre,
                    apellidos:$scope.apellidos,
                    email:$scope.email,
                    telefono:$scope.telefono,
                    celular:$scope.celular,
                    direccion:$scope.direccion,
                    password:$scope.newPass,
                    id_puesto:$scope.id_puesto,
                    usuario:$scope.user,
                    id_area:$scope.id_area,
                    id_perfil:$scope.id_perfil,
                    OptionSQL:"nuevo"
                };
                $http({
                    url:'php/consultas/usuarios/sqlUsuarios.php',
                    method:'POST',
                    data:datos
                }).success(function(data){
                    $('.mensaje').hide();
                    $('.mensaje').empty();
                    $('.mensaje').html(data);
                    $('.mensaje').fadeIn(1000);
                    $scope.reset="reset";
                    $('#guardar > i').removeClass('fa-refresh fa-spin').addClass('fa-floppy-o');
                });
            }// cierra else
        });       

    };

    $scope.nuevo=function(){
        $scope.nombre="";
        $scope.apellidos="";
        $scope.email="";
        $scope.telefono="";
        $scope.celular="";
        $scope.direccion="";
        $scope.puesto="";
        $scope.pu="";
        $scope.id_area="";
        $scope.user="";
        $scope.id_perfil="";
        $scope.newPass="";
        $scope.newPass2="";

        $scope.ar="";
        $scope.permiso="";

        $scope.reset="";

        $('.mensaje').hide();
        $('.mensaje').empty();
    }

}
