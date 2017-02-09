function loginCtrl($scope,$http){
    
    $scope.user='';
    $scope.pass='';
    

    $scope.login=function(){
        var datos={
            usuario:this.user,
            password:this.pass,
        };
        $http({
            url:'php/consultas/login/identificarse.php',
            method:'POST',
            data:datos
        }).success(function(data){
            $('.mensaje').hide();
            $('.mensaje').empty();
            if(data.error==1){
               $scope.pass='';
               $('.mensaje').html(data.mensage);
               $('.mensaje').fadeIn(1000);
            }else{
               $('#login_box').removeClass('fadeInDown').addClass('bounceOut');
                setTimeout(function(){
                    $(location).attr('href',''); 
                }, 500);
            }
          
        });
    }

}