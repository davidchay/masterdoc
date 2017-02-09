<?php 
$id_documento=$_GET['id_documento'];
$tabla=$_GET['tabla'];
header("Content-Type: text/html; charset=iso-8859-1");  
require_once('../config.php');
$Db = new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
 if($tabla="pc"){
    $plantilla_completa=$Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
      concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
      concat(mes,' ',anio) AS fecha, consecutivo
      FROM documento,tipo_documento,plantilla_completa_obsoletos,areas
      WHERE documento.id_documento=$id_documento
      AND documento.id_documento=plantilla_completa_obsoletos.id_documento
      AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
      AND areas.id_area=documento.id_area
    ");
  }
  if($tabla="bs"){
      $plantilla_basica = $Db->query("SELECT documento.id_documento,nombre_doc as nombre_documento, 
      concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,
      concat(mes,' ',anio) AS fecha, consecutivo
      FROM documento,tipo_documento,plantilla_basica_obsoletos,areas
      WHERE documento.id_documento=$id_documento
      AND documento.id_documento=plantilla_basica_obsoletos.id_documento
      AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
      AND areas.id_area=documento.id_area
      ");
  }
$obsoletos=array();
$contador=0;
  while($data = $plantilla_completa->fetch_array(MYSQLI_ASSOC)) 
  {  
      $nombreDocumento=$data['nombre_documento'];
      $obsoletos[$contador]=array_map('utf8_encode', $data);
      $contador++;
  } 
  while($data = $plantilla_basica->fetch_array(MYSQLI_ASSOC)) 
  {  
      $nombreDocumento=$data['nombre_documento'];
      $obsoletos[$contador]=array_map('utf8_encode', $data);
      $contador++;
  }
if(count($obsoletos)>0){
  foreach ($obsoletos as $key => $row)
  {
      $nombre_documento[$key]  = $row['nombre_documento'];
  } 
  array_multisort($nombre_documento,SORT_ASC,$obsoletos);
}  
 ob_end_clean();
 define('MAIN','masterdoc3');
  require_once('../html2pdf/html2pdf.class.php');
      ob_start(); 
?> 
 <page backtop="25mm" backbottom="11mm" backleft="0mm" backright="0mm"> 
      <page_header> 
           <table class="page_header" style="width: 100%; border-bottom: solid 1px LIGHTGRAY;padding-bottom:2mm;">
            <tr>
                <td style="width:30%;" >
                    <img src="img/logo.png" width="150">
                </td>
                <td  style="width:70%;text-align:left;"   >
                    <h1>
                       Versiones anteriores 
                    </h1>
                </td>
                
            </tr>
        </table>
      </page_header> 
      <page_footer> 
           <table class="page_footer" style="width: 100%; border-top: solid 1px LIGHTGRAY;padding-top:2mm;">
            <tr>
                <td style="width: 50%; text-align: left;">
                    <?php 
                        date_default_timezone_set('Mexico/General');
                        echo date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
                    ?>
                </td>
                <td style="width: 50%; text-align:right;">
                    P&aacute;gina: [[page_cu]]/[[page_nb]]
                </td>
            </tr>
        </table>
      </page_footer> 
       <h2><?php echo $nombreDocumento; ?></h2>
       <table style="width:100%;border-collapse:collapse;">
         <thead>
           <tr>
              <th style="width: 4%; text-align: center; padding:5px; border: solid 1px #c6c6c6;">No.</th>
              <th style="width: 60%; text-align: center; padding:5px; border: solid 1px #c6c6c6;">Documento</th>
              <th style="width: 18%; text-align: center; padding:5px; border: solid 1px #c6c6c6;">Codigo</th>
              <th style="width: 18%; text-align: center; padding:5px; border: solid 1px #c6c6c6;">Fecha</th>
           </tr>
         </thead>
         <tbody>
            <?php
            for ($i=0; $i < count($obsoletos); $i++) { 
                $nombre_documento=$obsoletos[$i]['nombre_documento'];
                $codigo=$obsoletos[$i]['codigo'];
                $fecha=$obsoletos[$i]['fecha'];
                echo '<tr>';
                echo '<td style="width:4%; text-align: center; padding:5px; border: solid 1px #c6c6c6">'.($i+1).'</td>';
                echo '<td style="width:60%; text-align: left; padding:5px; border: solid 1px #c6c6c6">'.$nombre_documento.'</td>';
                echo '<td style="width:18%; text-align: left; padding:5px; border: solid 1px #c6c6c6">'.$codigo.'</td>';
                echo '<td style="width:18%; text-align: center; padding:5px; border: solid 1px #c6c6c6">'.$fecha.'</td>';
                echo '</tr>';
            }
           ?>
         </tbody>
       </table>
 </page> 
<?php 
      $content = ob_get_clean(); 
      $html2pdf = new HTML2PDF('P', ' LETTER', 'es', true, 'UTF-8', 7);
      $html2pdf->WriteHTML($content); 
      $html2pdf->Output('Versiones Anteriores.pdf'); 
?>