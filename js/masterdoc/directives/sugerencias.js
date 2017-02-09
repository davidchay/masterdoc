/*
	suggestEditor sugerencia para editor
*/
angular.module('masterdoc').directive('suggestEditor',function(){
	return{
		restrict:'EA',
		replace:true,
		transclude:true,
		template:'<input name="suggestEditor" class="form-control"  type="text" />',
		link: function(scope, element, attrs){
			scope.$watch(attrs.url, function(value){
				element.autocomplete({
					source:function(request,response) {
			                    $.ajax({
			                        url:'php/consultas/usuarios/sugerenciaUsuarios.php',
			                        data: {
			                        	term: request.term,
			                        }, 
			                        type: "GET",  
                    				dataType: "json", 
			                        success: function( data ) {
			                        	response($.map(data, function(item) {
			                                return {
			                                    label: item.label,
			                                    value: item.value
			                                }
			                            })) 
							        }
			                    });
                			},
                	minLength:3,
                	search:function(event,ui){
						scope.id_editor='';
						scope.$apply();
					},
					select:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.id_editor=ui.item.value;
						scope.$apply();
					},
					focus:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.$apply();
					}
				});
			});

		}
	}
	
});


/*
	suggestEditor sugerencia para revisor
*/
angular.module('masterdoc').directive('suggestRevisor',function(){
	return{
		restrict:'EA',
		replace:true,
		transclude:true,
		template:'<input name="suggestRevisor" class="form-control"  type="text" required/>',
		link: function(scope, element, attrs){
			scope.$watch(attrs.url, function(value){
				element.autocomplete({
					source:function(request,response) {
			                    $.ajax({
			                        url:'php/consultas/usuarios/sugerenciaUsuarios.php',
			                        data: {
			                        	term: request.term,
			                        }, 
			                        type: "GET",  
                    				dataType: "json", 
			                        success: function( data ) {
			                        	response($.map(data, function(item) {
			                                return {
			                                    label: item.label,
			                                    value: item.value
			                                }
			                            })) 
							        }
			                    });
                			},
                	minLength:3,
                	search:function(event,ui){
						scope.id_revisor='';
						scope.$apply();
					},
					select:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.id_revisor=ui.item.value;
						scope.$apply();
					},
					focus:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.$apply();
					}
				});
			});

		}
	}
	
});


/*
	suggestSupervisor sugerencia para editor
*/
angular.module('masterdoc').directive('suggestAutorizador',function(){
	return{
		restrict:'EA',
		replace:true,
		transclude:true,
		template:'<input name="suggestAutorizador" class="form-control"  type="text" required/>',
		link: function(scope, element, attrs){
			scope.$watch(attrs.url, function(value){
				element.autocomplete({
					source:function(request,response) {
			                    $.ajax({
			                        url:'php/consultas/usuarios/sugerenciaUsuarios.php',
			                        data: {
			                        	term: request.term,
			                        }, 
			                        type: "GET",  
                    				dataType: "json", 
			                        success: function( data ) {
			                        	response($.map(data, function(item) {
			                                return {
			                                    label: item.label,
			                                    value: item.value
			                                }
			                            })) 
							        }
			                    });
                			},
                	minLength:3,
                	search:function(event,ui){
						scope.id_autorizador='';
						scope.$apply();
					},
					select:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.id_autorizador=ui.item.value;
						scope.$apply();
					},
					focus:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.$apply();
					}
				});
			});

		}
	}
	
});

/*
	suggestEditor sugerencia para editor
*/
angular.module('masterdoc').directive('suggestElectronico',function(){
	return{
		restrict:'EA',
		replace:true,
		transclude:true,
		template:'<input name="suggestEditor" class="form-control"  type="text" />',
		link: function(scope, element, attrs){
			scope.$watch(attrs.url, function(value){
				element.autocomplete({
					source:function(request,response) {
			                    $.ajax({
			                        url:'php/consultas/usuarios/sugerenciasUsuario.php',
			                        data: {
			                        	term: request.term,
			                        }, 
			                        type: "GET",  
                    				dataType: "json", 
			                        success: function( data ) {
			                        	response($.map(data, function(item) {
			                                return {
			                                    label: item.label,
			                                    value: item.value
			                                }
			                            })) 
							        }
			                    });
                			},
                	minLength:3,
                	search:function(event,ui){
						scope.id_electronico='';
						scope.$apply();
					},
					select:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.id_electronico=ui.item.value;
						scope.$apply();
					},
					focus:function(event,ui){
						event.preventDefault();
						this.value=ui.item.label;
						scope.nombre_electronico=ui.item.label;
						scope.$apply();
					}
				});
			});

		}
	}
	
});