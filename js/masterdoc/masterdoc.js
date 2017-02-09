/*Control de usuarios menu principal*/
var masterDoc=angular.module('masterdoc', ['ngSanitize','ui.bootstrap','ui.router','fundoo.services','ui.tinymce','ui.tinymce.inline','mgcrea.ngStrap.scrollspy','mgcrea.ngStrap.affix','angularFileUpload','truncate','ui.keypress'])
	.run(
      [        '$rootScope', '$state', '$stateParams',
      function ($rootScope,   $state,   $stateParams) {

        // It's very handy to add references to $state and $stateParams to the $rootScope
        // so that you can access them from any scope within your applications.For example,
        // <li ng-class="{ active: $state.includes('contacts.list') }"> will set the <li>
        // to active whenever 'contacts.list' or one of its decendents is active.
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;
    }]);
/*angular.module('masterdoc').run(function($rootScope, $templateCache) {
   $rootScope.$on('$viewContentLoaded', function() {
      $templateCache.removeAll();
   });
});*/

masterDoc.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /state1
	$urlRouterProvider.otherwise("/");
  // Now set up the states
  	$stateProvider
    	.state('escritorio', {
	      	url: "/",
          abstract:true,
	      	//templateUrl:"welcome.html"
          templateUrl:"partials/escritorio/escritorio.html"
    	})
      .state('escritorio.dashboard',{
        url:'',
        templateUrl:"partials/escritorio/dashboard.html",
        controller:"dashboardCtrl"  
      })
      .state('escritorio.usuarios',{
        abstract: true,
        url: "usuarios/",
        templateUrl:"partials/usuarios/usuarios.html"
    	})
    	.state('escritorio.usuarios.lista',{
    		url: "",
	      templateUrl:"partials/usuarios/lista.usuarios.html",
	      controller:"listaUsuariosCtrl"	
    	})
    	.state('escritorio.usuarios.nuevo',{
    		url: "nuevo/",
	      templateUrl:"partials/usuarios/nuevo.usuario.html",
        controller:"nuevoUsuarioCtrl"
    	})
      .state('escritorio.usuarios.detalles',{
        url: ":idUsuario",
        templateUrl:"partials/usuarios/detalle.usuario.html" ,
        controller:"detalleUsuarioCtrl" 
      })
      .state('escritorio.mi-perfil',{
        url: "mi-perfil/",
        templateUrl:"partials/miPerfil/miPerfil.html",
        controller:"miPerfilCtrl" 
      })
      .state('escritorio.areas',{
        url: "areas/",
        templateUrl:"partials/areas/areas.html",
        controller:"areasCtrl" 
      })
      .state('escritorio.puestos',{
        url: "puestos/",
        templateUrl:"partials/puestos/puestos.html",
        controller:"puestosCtrl" 
      })
       .state('escritorio.documentos',{
        abstract: true,
        url: "documentos/",
        templateUrl:"partials/documentos/documentos.html",
        controller:"" 
      })
     .state('escritorio.documentos.borrador',{
        url: "",
        templateUrl:"partials/documentos/borrador.html",
        contrller:"borradoresCtrl" 
      })
      .state('escritorio.documentos.aprobados',{
        url: "aprobados/",
        templateUrl:"partials/documentos/aprobados.html",
        controller:"aprobadosCtrl"
      })
      .state('escritorio.documentos.papelera',{
        url: "papelera/",
        templateUrl:"partials/documentos/papelera.html",
        controller:"papeleraCtrl"
      })
      .state('escritorio.documentos.permisos',{
        url: "permisos/",
        templateUrl:"partials/documentos/permisos.html",
        controller:"permisosCtrl"
      })
      .state('escritorio.documentos.permiso',{
        url: "permisos/:tabla/:idDocumento",
        templateUrl:"partials/documentos/permiso.html",
        controller:"permisoCtrl"
      })
      .state('escritorio.documentos.obsoletos',{
        url: "obsoletos/",
        templateUrl:"partials/documentos/obsoletos.html",
        controller:"obsoletosCtrl"
      })
      .state('escritorio.documentos.versiones',{
        url: "obsoletos/:idDocumento/:tabla",
        templateUrl:"partials/documentos/obsoletos.versiones.html",
        controller:"obsoletosVersionesCtrl"
      })
      .state('escritorio.documentos.crear',{
        url: "nuevo/",
        templateUrl:"partials/documentos/nuevo.html",
        controller:"nuevoDocCtrl"
      })
      
      .state('escritorio.configuracion',{
        abstract: true,
        url: "config/",
        templateUrl:"partials/config/configuraciones.html",
        controller:"" 
      })
     .state('escritorio.configuracion.mensajes',{
        url: "",
        templateUrl:"partials/config/mensajes.html",
        controller:"mensajeEmailCtrl" 
      })
      
      .state('editorcp',{
        url: "/MASTERedit/cp/:idDocumento",
        controller:"editorCpCtrl", 
        templateUrl:"partials/mastereditor/editor.cp.html",
      })
      .state('editorbs',{
        url: "/MASTERedit/bs/:idDocumento",
        controller:"editorBsCtrl", 
        templateUrl:"partials/mastereditor/editor.bs.html",
      })

     .state('revisorcp',{
        url: "/MASTERreview/cp/:idDocumento",
        controller:"revisorCpCtrl", 
        templateUrl:"partials/masterrevisor/revisor.cp.html",
      })
     .state('revisorbs',{
        url: "/MASTERreview/bs/:idDocumento",
        controller:"revisorBsCtrl", 
        templateUrl:"partials/masterrevisor/revisor.bs.html",
      })
     .state('approvalcp',{
        url: "/MASTERapproval/cp/:idDocumento",
        controller:"approvalCpCtrl", 
        templateUrl:"partials/masterapproval/approval.cp.html",
      })
     .state('approvalbs',{
        url: "/MASTERapproval/bs/:idDocumento",
        controller:"approvalBsCtrl", 
        templateUrl:"partials/masterapproval/approval.bs.html",
      })
      .state('visorcp',{
        url: "/MASTERvisor/cp/:idDocumento",
        controller:"visorCpCtrl", 
        templateUrl:"partials/mastervisor/visor.cp.html",
      })
      .state('visorbs',{
        url: "/MASTERvisor/bs/:idDocumento",
        controller:"visorBsCtrl", 
        templateUrl:"partials/mastervisor/visor.bs.html",
      })

      .state('archivocp',{
        url: "/archivo/cp/:idDocumento/:consecutivo/:status",
        controller:"archivoCpCtrl", 
        templateUrl:"partials/visorarchivo/archivo.cp.html",
      })
      .state('archivobs',{
        url: "/archivo/bs/:idDocumento/:consecutivo/:status",
        controller:"archivoBsCtrl", 
        templateUrl:"partials/visorarchivo/archivo.bs.html",
      })
    });




