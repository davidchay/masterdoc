/*
* selectTextOff; plugin para evitar la selección en los elementos seleccionados por jQuery
* 22/08/2011
* JFcoDíaz (http://www.devtics.com.mx)
* MIT/GNU
*/
(function($){
  $.fn.extend({
    selectOff : function(){
     this.attr('unselectable', 'on').css({
        'KhtmlUserSelect' : 'none',
        'MozUserSelect' : 'none'
      }).each(function(i,o){
        o["onselectstart"] = o['onmousedown'] = function(){return false;}
      });
    }
 }); 
})(jQuery);

