<?php
    define('MAIN','masterdoc3');
    require_once('../../php/html2pdf/html2pdf.class.php');
    ob_start();
    include(dirname('__FILE__').'/documentoPDF.php');
    $content = ob_get_clean();
    try
    {
        $html2pdf = new HTML2PDF('P', ' LETTER', 'es', true, 'UTF-8', 7);
        $html2pdf->pdf->SetDisplayMode('fullpage');
        $html2pdf->writeHTML($content, isset($_GET['vuehtml']));
        $html2pdf->createIndex('CONTENIDO', 30, 12, false, true, 2);
        $html2pdf->Output('vigente.pdf');
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
?>