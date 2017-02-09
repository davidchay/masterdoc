function nuevoDocCtrl($scope, $http){
	$scope.nombre_doc="";
    $scope.tipo_documento='';
    $scope.ar='';
    $scope.id_editor=$scope.usuario.id_usuario;
    $scope.nombre_editor=$scope.usuario.nombre+' '+$scope.usuario.apellidos;
    $scope.id_revisor=0;
    $scope.id_autorizador=0;
    $scope.id_perfil=$scope.usuario.id_perfil;
    $http.get('php/consultas/area/getAreas.php').
    success(function(data){
        $scope.areas=data;
    });
    

    $http.get('php/consultas/documentos/getTipoDocumentos.php').
    success(function(data){
        $scope.tipoDocumento=data;
    });

    $scope.validar=function(){
        var m='El Editor, Revisor y Autorizador deden ser diferentes';
        var mn='Asegurese de llenar correctamente la ruta de aprobación ';
        if(parseInt($scope.id_editor)>0 && parseInt($scope.id_revisor)>0 && parseInt($scope.id_autorizador)>0)
        {
            if(parseInt($scope.id_editor)!=parseInt($scope.id_revisor))
            {
                if(parseInt($scope.id_editor)!=parseInt($scope.id_autorizador))
                {
                    if(parseInt($scope.id_revisor)!=parseInt($scope.id_autorizador))
                    {
                        $scope.crearDocumento();
                    }
                    else
                    {
                        $scope.msjErr(m);
                    }
                }
                else
                {
                    $scope.msjErr(m);
                }
            }else{
                $scope.msjErr(m);
            }
        }
        else
        {
            $scope.msjErr(mn);
        }    
    }// end validar()
    $scope.msjErr=function(msj){
        var err='<div class="alert alert-danger">';
            err+='<button type="button" class="close" data-dismiss="alert">&times;</button>';
            err+='<strong>¡Error!</strong><br>';
            err+=msj;
            err+='</div>';
            $('.mensaje').hide();
            $('.mensaje').empty();
            $('.mensaje').html(err);
            $('.mensaje').fadeIn(1000);
            return ;
    }// end msjErr
    $scope.crearDocumento=function(){
        $('#guardar > i').removeClass('fa-file-text-o').addClass('fa-refresh fa-spin');
        var datos={
            nombre_doc:this.nombre_doc,
            id_tipo_doc:this.tipo_documento,
            id_area:parseInt(this.ar),
            id_creador:parseInt(this.id_editor),
            id_revisor:parseInt(this.id_revisor),
            id_autorizador:parseInt(this.id_autorizador),
            OptionSQL:'nuevo'
        };
        $http({
            url:'php/consultas/documentos/sqlDocumentos.php',
            method:'POST',
            data:datos
        }).success(function(data){
            console.log(data);
            $('.mensaje').hide();
            $('.mensaje').empty();
            $('#guardar > i').removeClass('fa-refresh fa-spin').addClass('fa-file-text-o');
            if(data.error>0){
                $('.mensaje').html(data.mensaje);
            }else{
                $('#guardar').addClass('hidden');
                $('#otroDoc').removeClass('hidden');
                $('.mensaje').html(data.mensaje);
            }
            $('.mensaje').fadeIn(1000);
        });
        
    }
    //Finaliza crearDocumento()
    $scope.otroDoc=function(){
        $scope.nombre_doc="";
        $scope.tipo_documento=null;
        $scope.ar=null;
        $scope.id_editor=$scope.usuario.id_usuario;
        $scope.nombre_editor=$scope.usuario.nombre+' '+$scope.usuario.apellidos;
        $scope.id_revisor=0;
        $scope.nombre_revisor="";  
        $scope.id_autorizador=0; 
        $scope.nombre_autorizador="";

        $('.mensaje').hide();
        $('.mensaje').empty();
        $('.mensaje').fadeIn(1000);

        $('#guardar').removeClass('hidden');
        $('#otroDoc').addClass('hidden');   
    }
}   