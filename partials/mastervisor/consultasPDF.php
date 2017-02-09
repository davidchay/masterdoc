<?php
    header("Content-Type: text/html;charset=utf-8");
    require_once('../../php/config.php');
    $id_documento=$_GET['id_documento'];
    $Db=new mysqli(SERVIDOR,USUARIO,CLAVE,BDATOS);
    $sql=$Db->query("SELECT documento.id_documento,nombre_doc, 
                concat(tipo_documento.codigo_doc,'-',areas.codigo_area,'-',numero_concecutivo,'-',rev) as codigo,estado,
                nombre_tipo_doc,nombre_area,fecha_creacion,fecha_ultima_mod,
                concat(mes,' ',anio) AS fecha,id_creador,id_revisor,id_autorizador
                FROM documento,tipo_documento,plantilla_completa,areas
                WHERE documento.id_documento=plantilla_completa.id_documento
                AND tipo_documento.id_tipo_doc=documento.id_tipo_doc 
                AND areas.id_area=documento.id_area
                AND documento.id_documento=$id_documento");
    while($data = $sql->fetch_array(MYSQLI_ASSOC)) {  
            $nombre_documento=$data['nombre_doc'];
            $codigo=$data['codigo'];
            $fecha=$data['fecha'];
            $estado=$data['estado'];
            $fecha_creacion=$data['fecha_creacion'];
            $fecha_ultima_mod=$data['fecha_ultima_mod'];
            $nombre_area=$data['nombre_area'];
            $nombre_tipo_doc=$data['nombre_tipo_doc'];
            $id_revisor=$id_revisor=$data['id_revisor'];
            $id_creador=$id_creador=$data['id_creador'];
            $id_autorizador=$id_autorizador=$data['id_autorizador'];
    }   //cierra while
    $creador=$Db->query("SELECT concat(nombre,' ',apellidos) as creador, nombre_puesto as creador_puesto
                        from usuarios,puestos WHERE id_usuario=$id_creador
                        AND usuarios.id_puesto=puestos.id_puesto");
    while($data = $creador->fetch_array(MYSQLI_ASSOC)) 
    {  
            $nombre_creador=$data['creador'];
            $creador_puesto=$data['creador_puesto'];
    }
    $revisor=$Db->query("SELECT concat(nombre,' ',apellidos) as revisor, nombre_puesto as revisor_puesto
                        from usuarios,puestos WHERE id_usuario=$id_revisor
                        AND usuarios.id_puesto=puestos.id_puesto");
    while($data = $revisor->fetch_array(MYSQLI_ASSOC)) 
    {  
            $nombre_revisor=$data['revisor'];
            $revisor_puesto=$data['revisor_puesto'];
    }
    $autorizador=$Db->query("SELECT concat(nombre,' ',apellidos) as autorizador, nombre_puesto as autorizador_puesto
                    from usuarios,puestos WHERE id_usuario=$id_autorizador
                    AND usuarios.id_puesto=puestos.id_puesto");
    while($data = $autorizador->fetch_array(MYSQLI_ASSOC)) 
    {  
            $nombre_autorizador=$data['autorizador'];
            $autorizador_puesto=$data['autorizador_puesto'];
    }
    $query=$Db->query("SELECT * FROM plantilla_completa WHERE id_documento=$id_documento");
    while($plan = $query->fetch_array(MYSQLI_ASSOC)) {  
            $objetivo=$plan['objetivo'];
            $alcance=$plan['alcance'];
            $definiciones=$plan['definiciones'];
            $desarrollo=$plan['desarrollo'];
            $referencias=$plan['referencias'];
            $anexos=$plan['anexos'];
    }
    $consulta=$Db->query("SELECT area,acciones FROM plantilla_completa_responsabilidades WHERE id_documento=$id_documento");
    $responsabilidades=array();
    $count=0;
    while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
    {  
        $responsabilidades[$count]['area']=$data['area'];
        $responsabilidades[$count]['acciones']=$data['acciones'];
        $count++;
    }
    $consulta=$Db->query("SELECT nombre_registro,codigo,responsable,tiempo_resguardo FROM plantilla_completa_registros WHERE id_documento=$id_documento");
    $registros=array();
    $count=0;
    while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
    {  
        $registros[$count]['nombre_registro']=$data['nombre_registro'];
        $registros[$count]['codigo']=$data['codigo'];
        $registros[$count]['responsable']=$data['responsable'];
        $registros[$count]['tiempo_resguardo']=$data['tiempo_resguardo'];
        $count++;
    }
    $consulta=$Db->query("SELECT fecha_cambio,descripcion_cambio,descripcion_justificacion,usuario
                    FROM plantilla_completa_revisiones
                    WHERE id_documento=$id_documento
                    ");
    $revision=array();
    $count=0;
    while($data = $consulta->fetch_array(MYSQLI_ASSOC)) 
    {  
            $revision[$count]['fecha_cambio']=$data['fecha_cambio'];
            $revision[$count]['descripcion_cambio']=$data['descripcion_cambio'];
            $revision[$count]['descripcion_justificacion']=$data['descripcion_justificacion'];
            $revision[$count]['responsable']=$data['usuario'];
            $count++;
    }
?>