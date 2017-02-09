function mainCtrl($scope,$http){
   $scope.usuario={
        user:'',
        id_usuario:'',
        nombre:'',
        apellidos:'',
        id_perfil:'',
        menuPrincipal:'',
        subMenu:'',
        perfil:''
    };
    $http({
            url:'php/consultas/usuarios/getDataCurrentUser.php',
            method:'POST',
    }).success(function(data){
        $scope.usuario.user=data.user;
        $scope.usuario.id_usuario=parseInt(data.id_usuario);
        $scope.usuario.nombre=data.nombre;
        $scope.usuario.apellidos=data.apellidos;
        $scope.usuario.id_perfil=parseInt(data.id_perfil);
        $scope.usuario.perfil=data.perfil;
        $scope.usuario.menuPrincipal=data.menu_principal;
        $scope.usuario.subMenu=data.sub_menu;
    });

}

function dashboardCtrl($scope,$http){
    $scope.claseTareas='default';
    var dia=['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'];
    var mes=['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Nobiembre','Diciembre'];
    var date=new Date();
    $scope.hoy=dia[date.getDay()]+", "+date.getDate()+" de "+mes[date.getMonth()]+" del "+date.getFullYear()+".";

    $http.get('php/consultas/dashboard/resumenDocumentos.php')
    .success(function(data) {
        $scope.resumen=data;
        $scope.autorizados=data.num_autorizado_cp+data.num_autorizado_bs;
        $scope.borrador=data.num_borrador_cp+data.num_borrador_bs;
        $scope.participacion=data.num_participacion;
        $scope.obsoletos=data.num_obsoletos_cp+data.num_obsoletos_bs;
        $scope.tareas=data.tareas_cp;
        if($scope.tareas==0){
            $scope.claseTareas='success';
        }
        else if($scope.tareas<6) {
            $scope.claseTareas='warning';
        }
        else if($scope.tareas>5) {
            $scope.claseTareas='danger';
        }
    });
}