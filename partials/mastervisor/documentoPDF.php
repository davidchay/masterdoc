<?php 
    require_once('consultasPDF.php'); 
    ob_end_clean();
    define('MAIN','masterdoc3');
    require_once('../../php/html2pdf/html2pdf.class.php');
    ob_start(); 
?>
<page backtop="30mm" backbottom="16mm" backleft="0mm" backright="0mm" style="font-size:12pt" backimg="copia_controlada.jpg">
	<page_header backtop="30mm">
        <table style="width:100%; border-bottom:solid 1px LIGHTGRAY;padding-bottom:2mm;">
            <tr>
                <td style="width:15%;" rowspan="3">
                    <img src="img/logo-procesa.jpg" width="100">
                </td>
                <td  style="width:70%;text-align:center;"  rowspan="2" >
                    <h4>
                        Procesamiento Especializado de Alimentos,S.A.P.I. de C.V.
                    </h4>
                </td>
                <td style="width:15%;text-align:right;">
                    <?php echo $fecha; ?>
                </td>
            </tr>
            <tr>
                <td style="width:15%;text-align:right;">
                    <?php echo $codigo; ?>
                </td>
            </tr>
            <tr>
                <td style="width:70%;text-align:center;">
                    <?php echo $nombre_documento; ?>
                </td>
                <td style="width:15%;text-align:right;" >
                        p&aacute;gina [[page_cu]]/[[page_nb]]
                </td>
             </tr>
        </table>
    </page_header>
    <page_footer backbottom="16mm">
        <table style="width: 100%; border-top: solid 1px LIGHTGRAY;padding-top:2mm;">
            <tr>
                <td style="width: 33.33%; text-align: left;">
                    <img src="img/logo.png" width="100">
                </td>
                <td style="width: 33.33%; text-align:center;">
                    [[page_cu]]/[[page_nb]]
                </td>
                <td style="width: 33.33%; text-align: right;">
                    <?php 
                        date_default_timezone_set('Mexico/General');
                        echo date('d')."/".date('m')."/".date('Y')." - ".date('H:i')." hrs.";
                    ?>
                </td>
            </tr>
        </table>
    </page_footer>
    <bookmark title="PRESENTACION" level="0"></bookmark>
    <br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br>
    <h1 style="text-align:center;"><?php echo $nombre_documento;?></h1>
    <h4 style="text-align:center;">
        <?php echo $codigo; ?>
    </h4>
    <br/><br/><br/>
    <table style="width:100%;border-collapse:collapse;" align="center">
        <tr>
            <td style="width: 33.33%; text-align: center; padding:5px; border: solid 1px #000000;">Editor<br/><strong><?php echo $nombre_creador; ?></strong><br><small><?php echo $creador_puesto;?></small></td>
            <td style="width: 33.33%; text-align: center; padding:5px; border: solid 1px #000000;">Revisor<br/><strong><?php echo $nombre_revisor; ?></strong><br><small><?php echo $revisor_puesto;?></small></td>
            <td style="width: 33.33%; text-align: center; padding:5px; border: solid 1px #000000;">Autorizador<br/><strong><?php echo $nombre_autorizador; ?></strong><br><small><?php echo $autorizador_puesto;?></small></td>
        </tr>
    </table>
</page>
<page pageset="old">
    <br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br>
    <bookmark title="CONTENIDO" level="0" ></bookmark>
</page>
<page pageset="old">
    <bookmark title="1. OBJETIVO" level="0" ></bookmark>
    <h1>1 Objetivo</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <?php echo $objetivo; ?>
    </div>
</page>
<page pageset="old">
    <bookmark title="2. ALCANCE" level="0" ></bookmark>
    <h1>2 Alcance</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <?php echo $alcance; ?>
    </div>
</page>
<page pageset="old">
    <bookmark title="3. DEFINICIONES" level="0" ></bookmark>
    <h1>3 Definiciones</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <?php echo $definiciones; ?>
    </div>
</page>
<page pageset="old">
    <bookmark title="4. RESPONSABILIDADES" level="0" ></bookmark>
    <h1>4. Responsabilidades</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <table style="width: 100%;border: solid 1px #5544DD; border-collapse: collapse">
        <thead>
          <tr class="active">
            <th style="width: 5%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">
                #
            </th>
            <th style="width: 30%; text-align: left; padding:5px; border: solid 1px #000000; background: #DCDCDC">
                Area
            </th>
            <th style="width: 65%; text-align: left; padding:5px; border: solid 1px #000000; background: #DCDCDC">
                Acciones
            </th>
          </tr>
        </thead>
        <tbody>
            <?php    for ($i=0; $i < count($responsabilidades) ; $i++) { ?>
            <tr>
                <td style="width: 5%; text-align: left; padding:5px; border: solid 1px #000000">
                    <?php echo $i+1; ?>
                </td>
                <td style="width: 30%; text-align: left; padding:5px; border: solid 1px #000000">
                    <?php echo $responsabilidades[$i]['area']; ?>
                </td>
                <td  style="width: 65%; text-align: left; padding:5px; border: solid 1px #000000">
                    <?php echo $responsabilidades[$i]['acciones'] ?>
                </td>
            </tr>
            <?php    }   ?>
          </tbody>
      </table>
    </div>
</page>
<page pageset="old">
    <bookmark title="5. DESARROLLO" level="0" ></bookmark>
    <h1>5. Desarrollo</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <?php echo $desarrollo; ?>
    </div>
</page>
<page pageset="old">
    <bookmark title="6. REFERENCIAS" level="0" ></bookmark>
    <h1>6. Referencias</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <?php echo $referencias; ?>
    </div>
</page>
<page pageset="old">
    <bookmark title="7. REGISTROS" level="0" ></bookmark>
    <h1>7. Registros</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <table style="width: 100%;border: solid 1px #5544DD; border-collapse: collapse">
        <thead>
          <tr>
            <th style="width: 5%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">#</th>
            <th style="width: 30%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Nombre del Registro</th>
            <th style="width: 20%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Código</th>
            <th style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Responsable</th>
            <th style="width: 20%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Tiempo de resguardo</th>
          </tr>
        </thead>
        <tbody>
        <?php for ($i=0; $i < count($registros); $i++) { ?>
            <tr>
                <td style="width: 5%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $i+1; ?></td>
                <td style="width: 30%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $registros[$i]['nombre_registro'];?></td>
                <td style="width: 20%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $registros[$i]['codigo'];?></td>
                <td style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $registros[$i]['responsable'];?></td>
                <td style="width: 20%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $registros[$i]['tiempo_resguardo'];?></td>
            </tr>                
        <?php } ?>
        </tbody>
      </table>
    </div>
</page>
<page pageset="old">
    <bookmark title="8. ANEXOS" level="0" ></bookmark>
    <h1>8. Anexos</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <?php echo $anexos; ?>
    </div>
</page>
<page pageset="old">
    <bookmark title="9. REVISIÓN" level="0"></bookmark>
    <h1>9. Revisión</h1>
    <div style="line-height:130%;margin-bottom:15mm">
        <table style="width: 100%;border: solid 1px #5544DD; border-collapse: collapse">
        <thead>
          <tr class="active">
            <th style="width: 5%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">No.</th>
            <th style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Fecha de cambio</th>
            <th style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Descripción del cambio</th>
            <th style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Justificación de cambio</th>
            <th style="width: 20%; text-align: left; padding:5px; border: solid 1px #000000; background: #dcdcdc">Responsable</th>
          </tr>
        </thead>
        <tbody>
            <?php for ($i=0; $i <count($revision) ; $i++) { ?>
                <tr>
                    <td style="width: 5%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $i+1; ?> </td>
                    <td style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $revision[$i]['fecha_cambio']; ?></td>
                    <td style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $revision[$i]['descripcion_cambio']; ?></td>
                    <td style="width: 25%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $revision[$i]['descripcion_justificacion']; ?></td>
                    <td style="width: 20%; text-align: left; padding:5px; border: solid 1px #000000"><?php echo $revision[$i]['responsable']; ?></td>
                </tr>                
            <?php } ?>
        </tbody>
      </table>
    </div>
</page>
<?php 
      $content = ob_get_clean(); 
      $html2pdf = new HTML2PDF('P', ' LETTER', 'es', true, 'UTF-8', 7);
      $html2pdf->WriteHTML($content); 
      //$html2pdf->writeHTML($content, isset($_GET['vuehtml']));
      $html2pdf->createIndex('CONTENIDO', 30, 12, false, true, 2);
        
      $html2pdf->Output('vigente.pdf'); 
?>