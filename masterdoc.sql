-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-02-2017 a las 14:33:32
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `masterdoc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
  `id_area` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(120) NOT NULL,
  `codigo_area` varchar(2) NOT NULL,
  `descripcion_area` varchar(250) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_area`, `nombre_area`, `codigo_area`, `descripcion_area`) VALUES
(61, 'Recepcion', 'RE', ''),
(2, 'Descongelado', 'DE', ''),
(3, 'Cocimiento', 'CM', ''),
(4, 'Carne Blanca', 'CB', ''),
(62, 'Est', 'ZZ', ''),
(6, 'Esterelizado', 'ES', ''),
(7, 'AcondicionadosX', 'AF', 'Descripcion acondicionados'),
(9, 'Capital Humano', 'CH', ''),
(10, 'Aseguramiento de Calidad', 'AC', ''),
(11, 'Ingenieria en Proceso', 'IP', ''),
(55, 'Pesado En Trozos', 'TR', ''),
(13, 'Aseguramiento de Provedores', 'AP', ''),
(14, 'Analitica e Inocuidad', 'AI', 'Esta es una descipcion de inociudad'),
(15, 'Sistema de Gestion de Calidad', 'SG', ''),
(16, 'Suministros (Compras)', 'SU', 'Descripcion del area de suministros'),
(18, 'Logistica', 'LG', ''),
(20, 'Mantenimiento', 'MT', ''),
(21, 'Investigacion y Desarrollo', 'ID', ''),
(50, 'Llenado', 'LL', ''),
(51, 'Preparacion De Liquidos', 'PL', ''),
(23, 'Nueva ne', 'MM', 'Nueva nevada mau mau'),
(24, 'Laboratorio X', 'LX', 'DESCRIPCION DE LABORATORIO X'),
(30, 'Nvarea', 'NV', 'Descripcion nueva area'),
(31, 'Area Nueva Otra Vez mas', 'TN', 'Area nueva otra vez'),
(32, 'Zona zeta azteca', 'ZL', 'Descripcion de zona ZETA azteka'),
(33, 'Operaciones', 'OP', 'Operaciones'),
(34, 'General', 'GN', 'General'),
(35, 'Director General', 'NT', ''),
(36, 'Director', 'NJ', ''),
(37, 'Eviscerado', 'EV', ''),
(38, 'Almacen', 'AM', ''),
(39, 'Finanzas', 'FS', ''),
(40, 'Compras', 'CO', ''),
(42, 'Direccion', 'DN', ''),
(43, 'Comercializacion', 'CN', ''),
(44, 'Sanidad', 'SA', ''),
(45, 'Contabilidad', 'CT', ''),
(46, 'Empaque', 'EM', 'Materiales de Empaque'),
(47, 'Materia Prima', 'MP', 'Materiales de Materia Prima'),
(48, 'Auditorias', 'AU', 'Documentos de Auditorias Internas'),
(49, 'Laboratorio', 'LB', 'Documentos de  Laboratorio'),
(52, 'Preparacion De Mezcla', 'PM', ''),
(53, 'Limpieza De Materia Prima', 'LM', ''),
(54, 'Sellado', 'SE', ''),
(56, 'Material  Extra??o', 'ME', ''),
(57, 'Bioseguridad', 'BS', ''),
(59, 'Evaluacion De Amenazas Y Vulnerabilidades', 'AV', ''),
(60, 'Rayos X', 'RX', ''),
(63, 'Otr ññ', 'XX', ''),
(64, 'Pruebas Par Master', '?', ''),
(65, 'Envasado', 'EN', 'ENVASADO DE POUCH'),
(68, 'Shyma', 'SH', 'SHYMA'),
(67, 'Envasado', 'EN', 'ENVASADO DE POUCH'),
(69, 'Vigilancia', 'VG', ''),
(70, 'Nominas', 'NM', ''),
(72, 'Atención A Clientes', 'AT', ''),
(73, 'Calidad De Servicios', 'CS', ''),
(74, 'Producto Terminado', 'PT', 'ESPECIFICACIONES DE PRODUCTO TERMINADO'),
(75, 'Capacitación E Inducción', 'CP', ''),
(76, 'Salud Del Personal', 'SP', ''),
(77, 'Mezclado', 'MZ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_doc` varchar(250) NOT NULL,
  `id_tipo_doc` int(3) NOT NULL,
  `id_area` int(3) NOT NULL,
  `numero_concecutivo` varchar(3) NOT NULL,
  `mes` varchar(10) NOT NULL,
  `anio` int(4) NOT NULL,
  `id_creador` int(6) NOT NULL,
  `id_revisor` int(6) NOT NULL,
  `id_autorizador` int(6) NOT NULL,
  `fecha_creacion` varchar(50) NOT NULL,
  `fecha_ultima_mod` varchar(50) NOT NULL,
  `fecha_eliminado` varchar(50) NOT NULL,
  `justificacion_eliminado` varchar(250) NOT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `id_area` (`id_area`),
  KEY `id_tipo_doc` (`id_tipo_doc`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=323 ;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `nombre_doc`, `id_tipo_doc`, `id_area`, `numero_concecutivo`, `mes`, `anio`, `id_creador`, `id_revisor`, `id_autorizador`, `fecha_creacion`, `fecha_ultima_mod`, `fecha_eliminado`, `justificacion_eliminado`) VALUES
(1, 'Determinaci?n de Histamina', 3, 49, '001', 'Agosto', 2014, 90, 45, 66, '06/08/2014 - 12:03 hrs.', '06/08/2014 - 12:10 hrs.', '', ''),
(2, 'Determinacion de Humedad Metodo Rapido Termobalanza', 3, 49, '002', 'Agosto', 2014, 90, 45, 66, '06/08/2014 - 17:23 hrs.', '06/08/2014 - 17:23 hrs.', '', ''),
(3, 'Determinación de pH', 3, 49, '003', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:15 hrs.', '07/08/2014 - 08:15 hrs.', '', ''),
(4, 'Determinación de Cloruros Morh Salinmetro', 3, 49, '004', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:17 hrs.', '07/08/2014 - 08:17 hrs.', '', ''),
(5, 'Determinacion de Trozos', 3, 49, '005', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:18 hrs.', '07/08/2014 - 08:18 hrs.', '', ''),
(6, 'Determinacion de Contenido Neto y Masa Drenada', 3, 49, '006', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:20 hrs.', '07/08/2014 - 08:20 hrs.', '', ''),
(7, 'Composición de Mezcla de Verduras', 3, 49, '007', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:23 hrs.', '07/08/2014 - 08:23 hrs.', '', ''),
(8, 'Determinacion de Material Extraño en Materias Primas', 3, 49, '008', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:25 hrs.', '07/08/2014 - 08:25 hrs.', '', ''),
(9, 'Granulometría', 3, 49, '009', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:34 hrs.', '07/08/2014 - 08:35 hrs.', '', ''),
(10, 'Evaluación Sensorial', 3, 49, '010', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:36 hrs.', '07/08/2014 - 08:36 hrs.', '', ''),
(11, 'Determinación de Alérgeno de Huevo', 3, 49, '011', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:38 hrs.', '07/08/2014 - 08:51 hrs.', '', ''),
(12, 'Determinacion Del Grado Cliente  Del Producto Semiterminado', 3, 49, '012', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 08:58 hrs.', '07/08/2014 - 09:06 hrs.', '', ''),
(13, 'Determinación de Alergeno Gliadina', 3, 49, '013', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 09:10 hrs.', '07/08/2014 - 09:14 hrs.', '', ''),
(14, 'Determinación de Alérgeno de Soya', 3, 49, '014', 'Agosto', 2014, 90, 45, 66, '07/08/2014 - 09:16 hrs.', '07/08/2014 - 09:17 hrs.', '', ''),
(15, 'Limpieza De Bancos', 3, 44, '001', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 11:00 hrs.', '07/08/2014 - 14:00 hrs.', '', ''),
(16, 'Prueba', 2, 30, '001', 'Agosto', 2014, 88, 87, 66, '07/08/2014 - 11:30 hrs.', '07/08/2014 - 11:45 hrs.', '20/08/2014 - 16:56 hrs.', 'prueba'),
(17, 'Pruba 2', 2, 30, '002', 'Agosto', 2014, 66, 88, 87, '07/08/2014 - 11:57 hrs.', '07/08/2014 - 12:51 hrs.', '', ''),
(18, 'Actividades Diarias De Revisi?n en sala de autoclaves ?mbkdfskldfnkld lksdkds kdkdkdkdk kdkdkdkdkd kdkdkdkd ', 1, 30, '001', 'Agosto', 2014, 88, 66, 87, '07/08/2014 - 12:29 hrs.', '07/08/2014 - 12:39 hrs.', '', ''),
(19, 'Limpieza De Bandas De Havas', 3, 44, '002', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 13:59 hrs.', '07/08/2014 - 14:10 hrs.', '', ''),
(20, 'Limpieza De Batidor', 3, 44, '003', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 14:12 hrs.', '07/08/2014 - 14:13 hrs.', '', ''),
(21, 'Limpieza De Botes De Basura', 3, 44, '004', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 14:14 hrs.', '07/08/2014 - 14:14 hrs.', '', ''),
(22, 'Limpieza De Bowl', 3, 44, '005', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 14:18 hrs.', '07/08/2014 - 14:19 hrs.', '', ''),
(23, 'Limpieza De Canales Y Rejillas', 3, 44, '006', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 14:23 hrs.', '07/08/2014 - 14:23 hrs.', '', ''),
(24, 'Limpieza De Espatulas', 3, 44, '007', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 14:24 hrs.', '07/08/2014 - 14:24 hrs.', '', ''),
(25, 'Limpieza De Estructuras', 3, 44, '008', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 14:28 hrs.', '07/08/2014 - 14:29 hrs.', '', ''),
(26, 'Limpieza De Filtro Uv', 3, 44, '009', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:30 hrs.', '18/08/2014 - 16:10 hrs.', '', ''),
(27, 'Limpieza De Guardas Y Motores', 3, 44, '010', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:35 hrs.', '07/08/2014 - 16:36 hrs.', '', ''),
(28, 'Instrumentos De Limpieza', 3, 44, '011', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:39 hrs.', '07/08/2014 - 16:40 hrs.', '', ''),
(29, 'Limpieza De Jarras', 3, 44, '012', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:46 hrs.', '07/08/2014 - 16:46 hrs.', '', ''),
(30, 'Limpieza De Javas', 3, 44, '013', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:47 hrs.', '07/08/2014 - 16:48 hrs.', '', ''),
(31, 'Limpieza De Lamparas', 3, 44, '014', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:49 hrs.', '07/08/2014 - 16:49 hrs.', '', ''),
(32, 'Limpieza Linea De Agua  Int.a876', 3, 44, '015', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:52 hrs.', '07/08/2014 - 16:52 hrs.', '', ''),
(33, 'Mesa De Limpieza', 3, 44, '016', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:53 hrs.', '07/08/2014 - 16:54 hrs.', '', ''),
(34, 'Limpieza De Mesas De Plastico O Metal', 3, 44, '017', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:55 hrs.', '07/08/2014 - 16:56 hrs.', '', ''),
(35, 'Limpieza De Paredes', 3, 44, '018', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:58 hrs.', '07/08/2014 - 16:58 hrs.', '', ''),
(36, 'Limpieza De Pat', 3, 44, '019', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 16:59 hrs.', '07/08/2014 - 16:59 hrs.', '', ''),
(37, 'Limpieza De Pisos', 3, 44, '020', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 17:02 hrs.', '07/08/2014 - 17:03 hrs.', '', ''),
(38, 'Limpieza De Puertas', 3, 44, '021', 'Agosto', 2014, 52, 66, 71, '07/08/2014 - 17:04 hrs.', '07/08/2014 - 17:05 hrs.', '', ''),
(39, 'Prueva', 4, 23, '001', 'Agosto', 2014, 88, 71, 66, '08/08/2014 - 08:48 hrs.', '', '20/08/2014 - 16:57 hrs.', 'prueba'),
(40, 'Limpieza De Tapas Azules', 3, 44, '022', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 08:50 hrs.', '08/08/2014 - 08:51 hrs.', '', ''),
(41, 'Limpieza De Tapas P/recipientes', 3, 44, '023', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 08:53 hrs.', '08/08/2014 - 08:53 hrs.', '', ''),
(42, 'Limpieza De Tapetes', 3, 44, '024', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 08:55 hrs.', '08/08/2014 - 08:55 hrs.', '', ''),
(43, 'Limpieza De Tarimas', 3, 44, '025', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 08:56 hrs.', '08/08/2014 - 08:56 hrs.', '', ''),
(44, 'Limpieza De Tarja', 3, 44, '026', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 08:57 hrs.', '08/08/2014 - 08:58 hrs.', '', ''),
(45, 'Limpieza De Techo', 3, 44, '027', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 08:58 hrs.', '08/08/2014 - 08:59 hrs.', '', ''),
(46, 'Limpieza De Truchas', 3, 44, '028', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 08:59 hrs.', '08/08/2014 - 09:00 hrs.', '', ''),
(47, 'Limpieza De Ventanas', 3, 44, '029', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:01 hrs.', '08/08/2014 - 09:01 hrs.', '', ''),
(48, 'Evaluaci', 4, 23, '002', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:02 hrs.', '', '08/08/2014 - 09:03 hrs.', 'prueba'),
(49, 'Limpieza De Aduanas', 3, 44, '030', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:10 hrs.', '18/08/2014 - 16:10 hrs.', '', ''),
(50, 'Limpieza De Anaqueles O Racks', 3, 44, '031', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:13 hrs.', '08/08/2014 - 09:13 hrs.', '', ''),
(51, 'Limpieza De  Ventiladores', 3, 44, '032', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:15 hrs.', '08/08/2014 - 09:16 hrs.', '', ''),
(52, 'Limpieza De Atico', 3, 44, '033', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:17 hrs.', '08/08/2014 - 09:17 hrs.', '', ''),
(53, 'Limpieza De Banda De Codificado 1 Y 2', 3, 44, '034', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:19 hrs.', '08/08/2014 - 09:19 hrs.', '', ''),
(54, 'Limpieza De Transportadora 1y 2', 3, 44, '035', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:46 hrs.', '08/08/2014 - 09:46 hrs.', '', ''),
(55, 'Limpieza De Banda De Rodillo 1 Y 2', 3, 44, '036', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:47 hrs.', '08/08/2014 - 09:48 hrs.', '', ''),
(56, 'Limpieza De Basculas', 3, 44, '037', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 09:56 hrs.', '08/08/2014 - 09:57 hrs.', '', ''),
(57, 'Limpieza De Cajon P/ Producto A Esterilizado', 3, 44, '038', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:00 hrs.', '08/08/2014 - 10:00 hrs.', '', ''),
(58, 'Limpieza De Carros Para Tapetes', 3, 44, '039', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:05 hrs.', '08/08/2014 - 10:10 hrs.', '', ''),
(59, 'Limpieza De Conos', 3, 44, '040', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:11 hrs.', '08/08/2014 - 10:12 hrs.', '', ''),
(60, 'Limpieza De Herramientas De Mantenimiento', 3, 44, '041', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:13 hrs.', '08/08/2014 - 10:13 hrs.', '', ''),
(61, 'Limpieza De Lonas Protectoras', 3, 44, '042', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:14 hrs.', '08/08/2014 - 10:14 hrs.', '', ''),
(62, 'Limpieza De Paletas', 3, 44, '043', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:16 hrs.', '08/08/2014 - 10:17 hrs.', '', ''),
(63, 'Limpieza De Recipientes', 3, 44, '044', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:17 hrs.', '08/08/2014 - 10:18 hrs.', '', ''),
(64, 'Limpieza De Selladora 1,2,3 Y 4', 3, 44, '045', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:18 hrs.', '08/08/2014 - 10:19 hrs.', '', ''),
(65, 'Limpieza De Difusores', 3, 44, '046', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:20 hrs.', '08/08/2014 - 10:20 hrs.', '', ''),
(66, 'Limpieza De Banda De Secado', 3, 44, '047', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:21 hrs.', '08/08/2014 - 10:21 hrs.', '', ''),
(67, 'Limpieza De Bandas De Recipientes', 3, 44, '048', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:23 hrs.', '08/08/2014 - 10:23 hrs.', '', ''),
(68, 'Limpieza De Empujadores', 3, 44, '049', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:25 hrs.', '08/08/2014 - 10:26 hrs.', '', ''),
(69, 'Limpieza De Estaci', 3, 44, '050', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:29 hrs.', '08/08/2014 - 10:30 hrs.', '', ''),
(70, 'Limpieza De Extintores', 3, 44, '051', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:31 hrs.', '08/08/2014 - 10:32 hrs.', '', ''),
(71, 'Limpieza De Filtro De Ventilaci', 3, 44, '052', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:33 hrs.', '08/08/2014 - 10:33 hrs.', '', ''),
(72, 'Limpieza De Guillotina', 3, 44, '053', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:35 hrs.', '08/08/2014 - 10:35 hrs.', '', ''),
(73, 'Limpieza De Guardas De Mangueras', 3, 44, '054', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:36 hrs.', '08/08/2014 - 10:37 hrs.', '', ''),
(74, 'Limpieza De Instalacion Electrica', 3, 44, '055', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:38 hrs.', '08/08/2014 - 10:39 hrs.', '', ''),
(75, 'Limpieza De Mangueras', 3, 44, '056', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:58 hrs.', '08/08/2014 - 11:08 hrs.', '', ''),
(76, 'Limpieza De Mesa de Pruebas', 3, 44, '057', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 10:58 hrs.', '08/08/2014 - 11:09 hrs.', '', ''),
(77, 'Limpieza De Rejillas De Ventilaci', 3, 44, '058', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:12 hrs.', '08/08/2014 - 11:12 hrs.', '', ''),
(78, 'Limpieza De Trampas De Luz', 3, 44, '059', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:13 hrs.', '08/08/2014 - 11:14 hrs.', '', ''),
(79, 'Limpieza De Trampas Mecanicas / Cebos', 3, 44, '060', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:15 hrs.', '08/08/2014 - 11:15 hrs.', '', ''),
(80, 'Limpieza De Despachador De Agua', 3, 44, '061', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:16 hrs.', '08/08/2014 - 11:17 hrs.', '', ''),
(81, 'Limpieza De Ductos', 3, 44, '062', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:20 hrs.', '08/08/2014 - 11:21 hrs.', '', ''),
(82, 'Limpieza De Estacion De Trabajo', 3, 44, '063', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:22 hrs.', '08/08/2014 - 11:22 hrs.', '', ''),
(83, 'Limpieza De Se', 3, 44, '064', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:25 hrs.', '08/08/2014 - 11:25 hrs.', '', ''),
(84, 'Limpieza De Locker', 3, 44, '065', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:26 hrs.', '08/08/2014 - 11:27 hrs.', '', ''),
(85, 'Limpieza De Maquina De Rayos X', 3, 44, '066', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:28 hrs.', '08/08/2014 - 11:28 hrs.', '', ''),
(86, 'Limpieza De Pizarras', 3, 44, '067', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:29 hrs.', '08/08/2014 - 11:29 hrs.', '', ''),
(87, 'Limpieza De Mesas Metal De Conos', 3, 44, '068', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:31 hrs.', '08/08/2014 - 11:32 hrs.', '', ''),
(88, 'Limpieza De Tableros Electricos', 3, 44, '069', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:39 hrs.', '08/08/2014 - 11:39 hrs.', '', ''),
(89, 'Limpieza De Video Jet', 3, 44, '070', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:40 hrs.', '08/08/2014 - 11:41 hrs.', '', ''),
(90, 'Limpieza De Camara De Vigilancia', 3, 44, '071', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:42 hrs.', '08/08/2014 - 11:42 hrs.', '', ''),
(91, 'Limpieza De Cortina De Aire', 3, 44, '072', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:47 hrs.', '08/08/2014 - 11:49 hrs.', '', ''),
(92, 'Limpieza de Esterilizador 1 y 2', 3, 44, '073', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:47 hrs.', '08/08/2014 - 11:53 hrs.', '', ''),
(93, 'Limpieza De Mpi', 3, 44, '074', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:55 hrs.', '08/08/2014 - 11:55 hrs.', '', ''),
(94, 'Limpieza De Puerta De Produccion', 3, 44, '075', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 11:56 hrs.', '18/08/2014 - 16:12 hrs.', '', ''),
(95, 'Limpieza De Puerta De Emergencia', 3, 44, '076', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 12:03 hrs.', '08/08/2014 - 12:03 hrs.', '', ''),
(96, 'Limpieza De Cribas', 3, 44, '077', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 12:05 hrs.', '08/08/2014 - 12:05 hrs.', '', ''),
(97, 'Limpieza De Cuarto De Cocedor', 3, 44, '078', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 12:07 hrs.', '08/08/2014 - 12:07 hrs.', '', ''),
(98, 'Limpieza De Guantes', 3, 44, '079', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 12:08 hrs.', '08/08/2014 - 12:08 hrs.', '', ''),
(99, 'Limpieza De Cisterna Descongelado, Esterilizado,cisterna General', 3, 44, '080', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 14:37 hrs.', '08/08/2014 - 14:38 hrs.', '', ''),
(100, 'Limpieza Cuarto De Guano', 3, 44, '081', 'Agosto', 2014, 52, 66, 71, '08/08/2014 - 14:43 hrs.', '08/08/2014 - 14:44 hrs.', '', ''),
(101, 'Kjflkdsjflks', 2, 30, '003', 'Agosto', 2014, 77, 66, 55, '11/08/2014 - 12:09 hrs.', '11/08/2014 - 14:39 hrs.', '', ''),
(102, 'Sal Molida', 4, 13, '001', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 10:06 hrs.', '12/08/2014 - 11:48 hrs.', '', ''),
(103, 'Exportaciones', 2, 10, '001', 'Agosto', 2014, 66, 87, 88, '12/08/2014 - 11:34 hrs.', '', '12/08/2014 - 11:38 hrs.', 'DOCUMENTO DE PRUEBA'),
(104, 'Sal Molida', 3, 13, '001', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 11:41 hrs.', '27/08/2014 - 09:19 hrs.', '', ''),
(105, 'Fibra De Soya', 3, 13, '002', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 13:51 hrs.', '12/08/2014 - 13:51 hrs.', '', ''),
(106, 'Fibra De Soya Helm', 3, 13, '003', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 14:05 hrs.', '12/08/2014 - 14:05 hrs.', '', ''),
(107, 'Aceite Comestible Puro De Soya', 3, 13, '004', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 14:06 hrs.', '12/08/2014 - 14:07 hrs.', '', ''),
(108, 'Aceite De Oliva', 3, 13, '005', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 14:07 hrs.', '12/08/2014 - 14:08 hrs.', '', ''),
(109, 'Mezcla De Verduras 20 Kg', 3, 13, '006', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 14:09 hrs.', '12/08/2014 - 14:10 hrs.', '', ''),
(110, 'Mayonesa 7.9 L Wilsey', 3, 13, '007', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 14:11 hrs.', '12/08/2014 - 14:12 hrs.', '', ''),
(111, 'Vinagre Blanco', 3, 13, '008', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 14:17 hrs.', '12/08/2014 - 14:22 hrs.', '', ''),
(112, 'Mezcla De Especies Procesa', 3, 13, '009', 'Agosto', 2014, 87, 82, 66, '12/08/2014 - 15:24 hrs.', '27/08/2014 - 09:18 hrs.', '', ''),
(113, 'Prueba', 1, 30, '002', 'Agosto', 2014, 87, 88, 66, '12/08/2014 - 15:34 hrs.', '12/08/2014 - 15:38 hrs.', '20/08/2014 - 16:56 hrs.', 'prueba'),
(114, 'Vigilancia', 1, 23, '001', 'Agosto', 2014, 87, 88, 66, '13/08/2014 - 11:18 hrs.', '13/08/2014 - 11:25 hrs.', '20/08/2014 - 16:59 hrs.', 'prueba'),
(115, 'Prueba De Formato', 4, 23, '003', 'Agosto', 2014, 87, 88, 66, '13/08/2014 - 11:33 hrs.', '13/08/2014 - 11:36 hrs.', '20/08/2014 - 16:56 hrs.', 'prueba'),
(116, 'Limpieza De Ductos De Aire', 3, 44, '082', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:04 hrs.', '13/08/2014 - 14:05 hrs.', '', ''),
(117, 'Limpieza De Llenadoras De Garrafones', 3, 44, '083', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:06 hrs.', '13/08/2014 - 14:07 hrs.', '', ''),
(118, 'Limpieza De Registros', 3, 44, '084', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:08 hrs.', '13/08/2014 - 14:09 hrs.', '', ''),
(119, 'Limpieza De Tina De Congelado, Tina De Descongelado Y Tinas De Guano', 3, 44, '085', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:10 hrs.', '13/08/2014 - 14:11 hrs.', '', ''),
(120, 'Limpieza De Trampas De Grasa 1 Y 2', 3, 44, '086', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:13 hrs.', '13/08/2014 - 14:13 hrs.', '', ''),
(121, 'Limpieza De Banda De Eviscerado', 3, 44, '087', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:15 hrs.', '13/08/2014 - 14:15 hrs.', '', ''),
(122, 'Limpieza De Carrritos De Corte', 3, 44, '088', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:16 hrs.', '13/08/2014 - 14:17 hrs.', '', ''),
(123, 'Limpieza De Cocedores', 3, 44, '089', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:18 hrs.', '13/08/2014 - 14:19 hrs.', '', ''),
(124, 'Limpieza De Herramientas (cuchillos Y Afiladores)', 3, 44, '090', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:21 hrs.', '13/08/2014 - 14:22 hrs.', '', ''),
(125, 'Limpieza De Resbaladillas', 3, 44, '091', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:23 hrs.', '13/08/2014 - 14:24 hrs.', '', ''),
(126, 'Limpieza De Sierra', 3, 44, '092', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:26 hrs.', '13/08/2014 - 14:27 hrs.', '', ''),
(127, 'Limpieza De Tuberia De Espreado', 3, 44, '093', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:29 hrs.', '13/08/2014 - 14:29 hrs.', '', ''),
(128, 'Limpieza De Volteador De Tinas', 3, 44, '094', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:30 hrs.', '13/08/2014 - 14:31 hrs.', '', ''),
(129, 'Limpieza De Cuarto De Cuarto De Pesado', 3, 44, '095', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:32 hrs.', '13/08/2014 - 14:33 hrs.', '', ''),
(130, 'Limpieza De Rampa', 3, 44, '096', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:34 hrs.', '18/08/2014 - 16:14 hrs.', '', ''),
(131, 'Limpieza De Tanques', 3, 44, '097', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 14:38 hrs.', '18/08/2014 - 16:15 hrs.', '', ''),
(132, 'Limpieza De Filtros De Aire', 3, 44, '098', 'Agosto', 2014, 52, 66, 71, '13/08/2014 - 15:16 hrs.', '18/08/2014 - 16:11 hrs.', '', ''),
(133, 'Nuevo', 2, 23, '001', 'Agosto', 2014, 88, 87, 66, '13/08/2014 - 15:45 hrs.', '13/08/2014 - 15:52 hrs.', '20/08/2014 - 16:55 hrs.', 'prueba'),
(134, 'Prueba', 2, 23, '002', 'Agosto', 2014, 88, 87, 66, '13/08/2014 - 19:31 hrs.', '', '20/08/2014 - 16:56 hrs.', 'prueba'),
(135, 'Prueba 2', 2, 23, '003', 'Agosto', 2014, 88, 87, 66, '13/08/2014 - 19:34 hrs.', '13/08/2014 - 19:41 hrs.', '', ''),
(136, 'Prueba 3', 3, 30, '001', 'Agosto', 2014, 66, 87, 55, '13/08/2014 - 19:50 hrs.', '', '18/08/2014 - 13:49 hrs.', 'prueba'),
(137, 'Prueba 4', 2, 30, '004', 'Agosto', 2014, 61, 87, 66, '13/08/2014 - 20:14 hrs.', '13/08/2014 - 20:17 hrs.', '', ''),
(138, 'Nuevo 6', 4, 30, '001', 'Agosto', 2014, 66, 88, 55, '13/08/2014 - 20:23 hrs.', '', '18/08/2014 - 13:48 hrs.', 'prueba'),
(139, 'Dprueva', 3, 23, '001', 'Agosto', 2014, 77, 88, 87, '15/08/2014 - 09:00 hrs.', '15/08/2014 - 16:18 hrs.', '20/08/2014 - 16:54 hrs.', 'prueba'),
(140, 'Prueba1', 1, 30, '003', 'Agosto', 2014, 77, 88, 87, '15/08/2014 - 10:03 hrs.', '', '15/08/2014 - 14:44 hrs.', 'PRUEBA'),
(141, 'Prueba2', 4, 23, '004', 'Agosto', 2014, 77, 88, 87, '15/08/2014 - 10:13 hrs.', '15/08/2014 - 16:12 hrs.', '20/08/2014 - 16:57 hrs.', 'prueba'),
(142, 'Dalila', 3, 23, '002', 'Agosto', 2014, 77, 88, 87, '15/08/2014 - 16:20 hrs.', '15/08/2014 - 16:26 hrs.', '20/08/2014 - 17:14 hrs.', 'prueba'),
(143, 'Xxxxx', 3, 23, '003', 'Agosto', 2014, 77, 88, 87, '18/08/2014 - 08:14 hrs.', '18/08/2014 - 10:27 hrs.', '18/08/2014 - 17:01 hrs.', 'prueba'),
(144, 'Limpieza De Tuberia De Espreado Interno', 3, 44, '099', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 10:39 hrs.', '18/08/2014 - 10:40 hrs.', '', ''),
(145, 'Limpieza De Cortinas Hawaianas', 3, 44, '100', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 10:53 hrs.', '18/08/2014 - 10:54 hrs.', '', ''),
(146, 'Limpieza De Proteccion De Pared', 3, 44, '101', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 10:56 hrs.', '18/08/2014 - 10:57 hrs.', '', ''),
(147, 'Limpieza De Apilador', 3, 44, '102', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 10:58 hrs.', '18/08/2014 - 11:40 hrs.', '', ''),
(148, 'Limpieza De Contenedor', 3, 44, '103', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 10:59 hrs.', '18/08/2014 - 11:00 hrs.', '', ''),
(149, 'Limpieza De Cucharones', 3, 44, '104', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:00 hrs.', '18/08/2014 - 11:01 hrs.', '', ''),
(150, 'Limpieza De Dispensadores', 3, 44, '105', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:01 hrs.', '18/08/2014 - 11:02 hrs.', '', ''),
(151, 'Limpieza De Escalera', 3, 44, '106', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:03 hrs.', '18/08/2014 - 11:03 hrs.', '', ''),
(152, 'Limpieza De Lavabo', 3, 44, '107', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:04 hrs.', '18/08/2014 - 11:04 hrs.', '', ''),
(153, 'Limpieza De Taladro', 3, 44, '108', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:06 hrs.', '18/08/2014 - 11:06 hrs.', '', ''),
(154, 'Limpieza De Hidrolavadora', 3, 44, '109', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:07 hrs.', '18/08/2014 - 11:08 hrs.', '', ''),
(155, 'Limpieza De Escritorios', 3, 44, '110', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:09 hrs.', '18/08/2014 - 11:09 hrs.', '', ''),
(156, 'Limpieza De Sillas', 3, 44, '111', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:10 hrs.', '18/08/2014 - 11:11 hrs.', '', ''),
(157, 'Limpieza De Espejo', 3, 44, '112', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:12 hrs.', '18/08/2014 - 11:12 hrs.', '', ''),
(158, 'Limpieza De Inodoro', 3, 44, '113', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:13 hrs.', '18/08/2014 - 11:13 hrs.', '', ''),
(159, 'Limpieza De Secador', 3, 44, '114', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:14 hrs.', '18/08/2014 - 11:14 hrs.', '', ''),
(160, 'Limpieza De Desmalezadora', 3, 44, '115', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:15 hrs.', '18/08/2014 - 11:15 hrs.', '', ''),
(161, 'Limpieza De Horno De Microondas', 3, 44, '116', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:16 hrs.', '18/08/2014 - 11:17 hrs.', '', ''),
(162, 'Limpieza De Porta Loncheras', 3, 44, '117', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:17 hrs.', '18/08/2014 - 11:18 hrs.', '', ''),
(163, 'Limpieza De Podadora', 3, 44, '118', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:19 hrs.', '18/08/2014 - 11:20 hrs.', '', ''),
(164, 'Limpieza De Refrigeradores', 3, 44, '119', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:21 hrs.', '18/08/2014 - 11:21 hrs.', '', ''),
(165, 'Limpieza De Montacarga', 3, 44, '120', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:22 hrs.', '18/08/2014 - 11:22 hrs.', '', ''),
(166, 'Limpieza De Dosatron', 3, 44, '121', 'Agosto', 2014, 52, 66, 71, '18/08/2014 - 11:23 hrs.', '18/08/2014 - 11:23 hrs.', '', ''),
(167, 'Sal Molida', 4, 47, '001', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 09:18 hrs.', '19/08/2014 - 09:26 hrs.', '', ''),
(168, 'Fibra De Soya', 4, 47, '002', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 09:20 hrs.', '19/08/2014 - 09:57 hrs.', '', ''),
(169, '', 4, 47, '003', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 09:57 hrs.', '19/08/2014 - 09:58 hrs.', '13/05/2016 - 12:20 hrs.', 'esta vacio'),
(170, 'Aceite Comestible Puro de Soya', 4, 47, '004', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 09:59 hrs.', '19/08/2014 - 10:00 hrs.', '', ''),
(171, 'Aceite de Oliva', 4, 47, '005', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:01 hrs.', '19/08/2014 - 10:01 hrs.', '', ''),
(172, 'Mezcla de Verduras 20 kg', 4, 47, '006', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:03 hrs.', '19/08/2014 - 10:03 hrs.', '', ''),
(173, 'Mayonesa 7.9 L Wilsey', 4, 47, '007', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:18 hrs.', '19/08/2014 - 10:18 hrs.', '', ''),
(174, 'Vinagre Blanco', 4, 47, '008', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:19 hrs.', '19/08/2014 - 10:19 hrs.', '', ''),
(175, 'Mezcla De Especies Procesa', 4, 47, '009', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:20 hrs.', '19/08/2014 - 10:21 hrs.', '', ''),
(176, 'Mezcla De Laurel Y Oregano Proceso', 4, 47, '010', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:21 hrs.', '19/08/2014 - 10:22 hrs.', '', ''),
(177, 'Proteina Texturizada De Soya', 4, 47, '011', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:24 hrs.', '19/08/2014 - 10:25 hrs.', '', ''),
(178, 'Premezcla Vitaminica Nutriatun Dsm', 4, 47, '012', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:26 hrs.', '19/08/2014 - 10:27 hrs.', '', ''),
(179, 'Chiles Jalapeños Insol Lata', 4, 47, '013', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:38 hrs.', '19/08/2014 - 10:40 hrs.', '', ''),
(180, 'Chile Jalapeño Diced Bolsa', 4, 47, '014', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:42 hrs.', '19/08/2014 - 10:42 hrs.', '', ''),
(181, 'Vg910', 4, 47, '015', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:43 hrs.', '19/08/2014 - 10:44 hrs.', '', ''),
(182, 'Pouch Marina Azul En Agua 74g', 4, 46, '001', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:57 hrs.', '19/08/2014 - 10:57 hrs.', '', ''),
(183, 'Pouch Generico 1.82kg', 4, 46, '002', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 10:58 hrs.', '19/08/2014 - 10:59 hrs.', '', ''),
(184, 'Pouch Marina Azul En Aceite 74g', 4, 46, '003', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:02 hrs.', '19/08/2014 - 11:02 hrs.', '', ''),
(185, 'Pouch Marina Azul En Aceite De Oliva 74g', 4, 46, '004', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:03 hrs.', '19/08/2014 - 11:04 hrs.', '', ''),
(186, 'Pouch Marina Azul En Agua Con Verduras 85g', 4, 46, '005', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:07 hrs.', '19/08/2014 - 11:07 hrs.', '', ''),
(187, 'Pouch Marina Azul Ensalada Con Mayonesa 85g', 4, 46, '006', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:09 hrs.', '19/08/2014 - 11:09 hrs.', '', ''),
(188, 'Pouch Generico 1.22kg', 4, 46, '007', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:13 hrs.', '19/08/2014 - 11:14 hrs.', '', ''),
(189, 'Pouch Nutriatun En Agua 74g', 4, 46, '008', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:16 hrs.', '19/08/2014 - 11:16 hrs.', '', ''),
(190, 'Pouch Nutriatun En Aceite 74g', 4, 46, '009', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:17 hrs.', '19/08/2014 - 11:18 hrs.', '', ''),
(191, 'Pouch Nutriatun En Agua 124g', 4, 46, '010', 'Agosto', 2014, 74, 87, 39, '19/08/2014 - 11:23 hrs.', '', '', ''),
(192, 'Pouch Practiatun Agua Fortificado 105g', 4, 46, '011', 'Agosto', 2014, 75, 87, 39, '19/08/2014 - 11:48 hrs.', '19/08/2014 - 11:50 hrs.', '', ''),
(193, 'Pouch Practiatun En Agua 85g Qro', 4, 46, '012', 'Agosto', 2014, 75, 87, 39, '19/08/2014 - 11:51 hrs.', '19/08/2014 - 11:51 hrs.', '', ''),
(194, 'Pouch Practiatun Aceite Fortificado 105g', 4, 46, '013', 'Agosto', 2014, 75, 87, 39, '19/08/2014 - 11:53 hrs.', '19/08/2014 - 11:53 hrs.', '', ''),
(195, 'Pouch Dif Juntos Por Chiapas 124g', 4, 46, '014', 'Agosto', 2014, 75, 87, 39, '19/08/2014 - 11:54 hrs.', '19/08/2014 - 11:54 hrs.', '', ''),
(196, 'Pouch Fresh Catch Light Tuna With Jalapeños 100g', 4, 46, '015', 'Agosto', 2014, 75, 87, 39, '19/08/2014 - 11:56 hrs.', '19/08/2014 - 11:56 hrs.', '', ''),
(197, 'Pouch Fresh Catch Light Tuna 120g', 4, 46, '016', 'Agosto', 2014, 75, 87, 39, '19/08/2014 - 11:58 hrs.', '19/08/2014 - 11:58 hrs.', '', ''),
(198, 'Mezcla De Laurel Y Oregano', 3, 13, '010', 'Agosto', 2014, 87, 82, 66, '19/08/2014 - 12:38 hrs.', '19/08/2014 - 12:39 hrs.', '', ''),
(199, 'Proteina Texturizada De Soya', 3, 13, '011', 'Agosto', 2014, 87, 82, 66, '19/08/2014 - 12:40 hrs.', '19/08/2014 - 12:40 hrs.', '', ''),
(200, 'Premezcla Vitaminica Nutriatun Dsm', 3, 13, '012', 'Agosto', 2014, 87, 82, 66, '19/08/2014 - 12:41 hrs.', '19/08/2014 - 12:42 hrs.', '', ''),
(201, 'Chile Jalapeño Insol Lata', 3, 13, '013', 'Agosto', 2014, 87, 82, 66, '19/08/2014 - 12:44 hrs.', '19/08/2014 - 13:41 hrs.', '', ''),
(202, 'Chile Jalapeño Diced Bolsa', 4, 13, '002', 'Agosto', 2014, 87, 82, 66, '19/08/2014 - 13:43 hrs.', '', '', ''),
(203, 'Chile Jalapeño Diced Bolsa', 3, 13, '014', 'Agosto', 2014, 87, 82, 66, '19/08/2014 - 13:45 hrs.', '19/08/2014 - 13:46 hrs.', '', ''),
(204, 'Vg910', 3, 13, '015', 'Agosto', 2014, 87, 82, 66, '19/08/2014 - 13:48 hrs.', '19/08/2014 - 13:49 hrs.', '', ''),
(205, 'Plan De Bioseguridad', 2, 57, '001', 'Agosto', 2014, 45, 87, 66, '19/08/2014 - 14:29 hrs.', '19/08/2014 - 15:08 hrs.', '', ''),
(206, 'Evaluación De Amenazas Y Vulnerabilidades', 2, 59, '001', 'Agosto', 2014, 45, 87, 66, '19/08/2014 - 15:17 hrs.', '19/08/2014 - 15:32 hrs.', '', ''),
(207, 'Atención A Clientes', 2, 72, '001', 'Agosto', 2014, 45, 87, 66, '19/08/2014 - 15:42 hrs.', '19/08/2014 - 16:15 hrs.', '', ''),
(208, 'Cronograma De Muestreo', 4, 14, '001', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 09:01 hrs.', '20/08/2014 - 09:01 hrs.', '', ''),
(209, 'Liberación de Producto Terminado', 2, 14, '001', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 09:15 hrs.', '20/08/2014 - 09:24 hrs.', '', ''),
(210, 'Verificación de Materias Primas y Producto Semiterminado', 2, 14, '002', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 09:15 hrs.', '20/08/2014 - 10:38 hrs.', '', ''),
(211, 'Calidad De Servicios', 2, 73, '001', 'Agosto', 2014, 45, 71, 66, '20/08/2014 - 10:56 hrs.', '20/08/2014 - 11:19 hrs.', '', ''),
(212, 'Evaluación De Riesgos', 4, 57, '001', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 11:39 hrs.', '20/08/2014 - 11:40 hrs.', '', ''),
(213, 'Quejas', 4, 14, '002', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 12:11 hrs.', '20/08/2014 - 12:12 hrs.', '', ''),
(214, 'Analisis Sensorial Y Fisicoquímicos De Producto semiterminado', 4, 14, '003', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 12:26 hrs.', '20/08/2014 - 12:27 hrs.', '', ''),
(215, 'Liberacion De Producto Terminado', 4, 14, '004', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 12:29 hrs.', '', '', ''),
(216, 'Evaluación De Reproceso', 4, 14, '005', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 12:30 hrs.', '20/08/2014 - 12:33 hrs.', '', ''),
(217, 'Evaluacion De pH En Producto Semiterminado', 4, 14, '006', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 12:36 hrs.', '20/08/2014 - 12:37 hrs.', '', ''),
(218, 'Inventario De Vidrios Y Plasticos De Laboratorio', 4, 14, '007', 'Agosto', 2014, 45, 87, 66, '20/08/2014 - 12:41 hrs.', '20/08/2014 - 12:41 hrs.', '', ''),
(219, 'Capacitacion E Induccion', 2, 75, '001', 'Agosto', 2014, 99, 96, 27, '20/08/2014 - 16:02 hrs.', '27/08/2014 - 15:55 hrs.', '', ''),
(220, 'Deteccion De Necesidades De Capacitacion', 4, 75, '001', 'Agosto', 2014, 99, 96, 27, '20/08/2014 - 16:34 hrs.', '27/08/2014 - 16:46 hrs.', '', ''),
(221, 'Cronograma De Capacitacion Programada', 4, 75, '002', 'Agosto', 2014, 99, 96, 27, '20/08/2014 - 16:34 hrs.', '27/08/2014 - 16:46 hrs.', '', ''),
(222, 'Lista De Asistencia', 4, 75, '003', 'Agosto', 2014, 99, 96, 27, '20/08/2014 - 16:35 hrs.', '27/08/2014 - 16:47 hrs.', '', ''),
(223, 'Convenio Roi', 4, 75, '004', 'Agosto', 2014, 99, 96, 27, '20/08/2014 - 16:36 hrs.', '27/08/2014 - 16:46 hrs.', '', ''),
(224, 'Evaluacion De Capacitacion', 4, 75, '005', 'Agosto', 2014, 99, 96, 27, '20/08/2014 - 16:36 hrs.', '', '', ''),
(225, 'Plan De Induccion A Planta', 4, 75, '006', 'Agosto', 2014, 99, 96, 27, '20/08/2014 - 16:37 hrs.', '27/08/2014 - 16:47 hrs.', '', ''),
(226, 'Programa Maestro De Sanidad', 4, 44, '001', 'Agosto', 2014, 52, 66, 71, '20/08/2014 - 16:45 hrs.', '', '', ''),
(227, 'Control De Limpieza De Areas', 4, 44, '002', 'Agosto', 2014, 52, 66, 71, '20/08/2014 - 16:46 hrs.', '', '', ''),
(228, 'Control Medico', 2, 76, '001', 'Agosto', 2014, 70, 55, 27, '22/08/2014 - 08:57 hrs.', '22/08/2014 - 09:11 hrs.', '', ''),
(229, 'Bitacora De Atencion Medica', 4, 76, '001', 'Agosto', 2014, 70, 55, 27, '22/08/2014 - 09:13 hrs.', '22/08/2014 - 09:14 hrs.', '', ''),
(230, 'Control De Salud Del Personal', 4, 76, '002', 'Agosto', 2014, 70, 55, 27, '22/08/2014 - 09:16 hrs.', '22/08/2014 - 09:19 hrs.', '', ''),
(231, 'Recepcion De Pescado Entero Y Lomos', 2, 61, '001', 'Agosto', 2014, 82, 87, 66, '22/08/2014 - 09:50 hrs.', '22/08/2014 - 10:33 hrs.', '', ''),
(232, 'Recepcion De Empaques', 2, 61, '002', 'Agosto', 2014, 82, 87, 66, '22/08/2014 - 10:37 hrs.', '22/08/2014 - 10:43 hrs.', '', ''),
(233, 'Recepcion De Materia Prima', 2, 60, '001', 'Agosto', 2014, 82, 55, 66, '22/08/2014 - 11:08 hrs.', '', '', ''),
(234, 'Recepecion De Materia Prima', 2, 61, '003', 'Agosto', 2014, 82, 55, 66, '22/08/2014 - 11:13 hrs.', '22/08/2014 - 11:36 hrs.', '', ''),
(235, 'Uniformes O Prendas Exteriores', 2, 68, '001', 'Agosto', 2014, 94, 70, 27, '22/08/2014 - 11:41 hrs.', '22/08/2014 - 11:51 hrs.', '', ''),
(236, 'Revision De Lockers', 2, 68, '002', 'Agosto', 2014, 94, 70, 27, '22/08/2014 - 11:53 hrs.', '22/08/2014 - 12:02 hrs.', '', ''),
(237, 'Asignacion De Lockers', 4, 68, '001', 'Agosto', 2014, 94, 70, 27, '22/08/2014 - 12:04 hrs.', '22/08/2014 - 12:13 hrs.', '', ''),
(238, 'Control De Revision De Uniformes', 4, 68, '002', 'Agosto', 2014, 94, 70, 27, '22/08/2014 - 12:05 hrs.', '', '', ''),
(239, 'Limpieza De Baños', 4, 68, '003', 'Agosto', 2014, 94, 70, 27, '22/08/2014 - 12:06 hrs.', '22/08/2014 - 12:26 hrs.', '', ''),
(240, 'Responsiva De Uniformes, E.p.p, Materiales  Y Herramientas', 4, 68, '004', 'Agosto', 2014, 94, 70, 27, '22/08/2014 - 12:08 hrs.', '22/08/2014 - 12:16 hrs.', '', ''),
(241, 'Sistema De Conformidad Envasado De Pouch 74 Gr', 4, 65, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:00 hrs.', '25/08/2014 - 08:54 hrs.', '', ''),
(242, 'Sistema De Conformidad Envasado De Pouch 85 Gr', 4, 65, '002', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:01 hrs.', '25/08/2014 - 08:55 hrs.', '', ''),
(243, 'Sistema De Conformidad Envasado De Pouch 100 Gr', 4, 65, '003', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:02 hrs.', '25/08/2014 - 08:52 hrs.', '', ''),
(244, 'Sistema De Conformidad Envsado De Pouch 105 Gr', 4, 65, '004', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:03 hrs.', '25/08/2014 - 08:55 hrs.', '', ''),
(245, 'Sistema De Conformidad Envasado De Pouch 120 Gr', 4, 65, '005', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:04 hrs.', '25/08/2014 - 08:52 hrs.', '', ''),
(246, 'Sistema De Conformidad Envasado De Pouch 124 Gr', 4, 65, '006', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:05 hrs.', '25/08/2014 - 09:05 hrs.', '', ''),
(247, 'Sistema De Conformidad Envasado De Pouch 145 Gr', 4, 65, '007', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:06 hrs.', '25/08/2014 - 08:54 hrs.', '', ''),
(248, 'Sistema De Conformidad Envasado De Pouch 1220 Gr', 4, 65, '008', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:07 hrs.', '25/08/2014 - 08:52 hrs.', '', ''),
(249, 'Sistema De Conformidad Registro De Obtencion De Carne Blanca', 4, 4, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:30 hrs.', '25/08/2014 - 10:30 hrs.', '', ''),
(250, 'Sistema De Conformidad Suministro De Carne Blanca', 4, 4, '002', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:31 hrs.', '25/08/2014 - 10:34 hrs.', '', ''),
(251, 'Sistema De Conformidad De Preparacion De Liquidos', 4, 51, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:38 hrs.', '25/08/2014 - 10:42 hrs.', '', ''),
(252, 'Sistema De Conformidad Mezclado', 4, 77, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:41 hrs.', '25/08/2014 - 10:36 hrs.', '', ''),
(253, 'Pesado De Porciones Y Llenado', 2, 50, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:58 hrs.', '27/08/2014 - 15:00 hrs.', '', ''),
(254, 'Limpieza De Materia Prima', 2, 53, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 16:59 hrs.', '25/08/2014 - 11:12 hrs.', '', ''),
(255, 'pesado en trozos', 2, 55, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 17:01 hrs.', '27/08/2014 - 15:31 hrs.', '', ''),
(258, 'Preparacion De Caldo Vegetal Con Turbo Agitador', 3, 51, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 09:54 hrs.', '', '', ''),
(256, 'Preparacion De Liquidos', 2, 51, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 17:02 hrs.', '27/08/2014 - 15:17 hrs.', '', ''),
(257, 'Sellado, Codificado Y Paletizado', 2, 54, '001', 'Agosto', 2014, 57, 63, 55, '22/08/2014 - 17:03 hrs.', '27/08/2014 - 15:25 hrs.', '', ''),
(259, 'Ajuste De Basculas', 3, 50, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 09:55 hrs.', '27/08/2014 - 09:42 hrs.', '', ''),
(260, 'Llenado De Porciones', 3, 50, '002', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 09:55 hrs.', '27/08/2014 - 09:43 hrs.', '', ''),
(261, 'Llenado De Pouch', 3, 18, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 09:58 hrs.', '', '', ''),
(262, 'Llenado de pouch', 3, 50, '003', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 09:58 hrs.', '27/08/2014 - 09:44 hrs.', '', ''),
(263, 'Limpieza De Pescado Entero', 3, 53, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 09:59 hrs.', '25/08/2014 - 10:04 hrs.', '', ''),
(264, 'Limpieza De Lomos Precocidos', 3, 53, '002', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 10:00 hrs.', '27/08/2014 - 09:43 hrs.', '', ''),
(265, 'Preparacion De Mezcla', 3, 52, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 10:01 hrs.', '25/08/2014 - 10:12 hrs.', '', ''),
(266, 'Sellado', 3, 54, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 10:01 hrs.', '27/08/2014 - 09:46 hrs.', '', ''),
(267, 'Paletizado', 3, 54, '002', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 10:02 hrs.', '25/08/2014 - 10:11 hrs.', '', ''),
(268, 'Codificad', 3, 54, '003', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 10:02 hrs.', '25/08/2014 - 10:03 hrs.', '', ''),
(269, 'Limpieza De Pouch', 3, 50, '004', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 10:10 hrs.', '25/08/2014 - 10:10 hrs.', '', ''),
(270, 'Sistema De Conformidad Cocimiento De Pescado Entero', 4, 3, '001', 'Agosto', 2014, 85, 57, 66, '25/08/2014 - 11:17 hrs.', '25/08/2014 - 12:54 hrs.', '', ''),
(271, 'Sistema De Conformidad Enfriamiento Spray/chill Room', 4, 3, '002', 'Agosto', 2014, 85, 57, 66, '25/08/2014 - 11:19 hrs.', '25/08/2014 - 12:52 hrs.', '', ''),
(272, 'Monitoreo De Temperaturas De Materia Prima En Chill Room', 4, 3, '003', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 11:20 hrs.', '25/08/2014 - 11:22 hrs.', '', ''),
(273, 'Control De Códigos', 4, 54, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 11:48 hrs.', '25/08/2014 - 11:48 hrs.', '', ''),
(274, 'Control De Pouches', 4, 50, '001', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 11:59 hrs.', '25/08/2014 - 11:59 hrs.', '', ''),
(275, 'Control De Defectos De Sellado Y Tiempos Por Ciclo', 4, 54, '002', 'Agosto', 2014, 57, 66, 55, '25/08/2014 - 12:02 hrs.', '25/08/2014 - 12:02 hrs.', '', ''),
(276, 'Hidratacion Y Humectacion De Pescado Cocido', 2, 3, '001', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:17 hrs.', '', '', ''),
(277, 'Precocimiento De Pescado Entero', 1, 3, '001', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:20 hrs.', '', '25/08/2014 - 12:21 hrs.', 'no era manual es pr'),
(278, 'Precocimiento De Pescado Entero', 2, 3, '002', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:21 hrs.', '', '', ''),
(279, 'Descongelado De Pescado Entero', 2, 2, '001', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:22 hrs.', '27/08/2014 - 10:42 hrs.', '', ''),
(280, 'Eviscerado', 2, 37, '001', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:26 hrs.', '', '', ''),
(281, 'Sistema De Conformidad Descongelado De Pescado Entero', 4, 2, '001', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:51 hrs.', '25/08/2014 - 12:51 hrs.', '', ''),
(282, 'Sistema De Conformidad Descongelado De Lomo/hojuela', 4, 2, '002', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:56 hrs.', '25/08/2014 - 12:57 hrs.', '', ''),
(283, 'Sistema De Conformidad Monitoreo De Temperatura De Eviscerado', 2, 37, '002', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 12:59 hrs.', '', '25/08/2014 - 12:59 hrs.', 'es formato'),
(284, 'Sistema De Conformidad Monitoreo De Temperatura De Eviscerado', 4, 37, '001', 'Agosto', 2014, 85, 57, 55, '25/08/2014 - 13:04 hrs.', '25/08/2014 - 13:04 hrs.', '', ''),
(285, 'Determinacion De Cloro, Ph Y Dureza', 3, 20, '001', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:15 hrs.', '', '', ''),
(286, 'Mantenimiento Preventivo Y Correctivo', 2, 20, '001', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:17 hrs.', '26/08/2014 - 09:04 hrs.', '', ''),
(287, 'Calibracion', 2, 20, '002', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:19 hrs.', '26/08/2014 - 08:49 hrs.', '', ''),
(288, 'Planificacion Y Construcción De Edificios', 1, 20, '001', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:21 hrs.', '', '', ''),
(289, 'Planificacion Y Construccion De Edificios', 2, 20, '003', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:22 hrs.', '26/08/2014 - 10:03 hrs.', '', ''),
(290, 'Tratamiento De Agua', 2, 20, '004', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:23 hrs.', '26/08/2014 - 10:38 hrs.', '', ''),
(291, 'Solicitud De Trabajo A Mantenimiento', 2, 20, '005', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:25 hrs.', '26/08/2014 - 10:53 hrs.', '', ''),
(292, 'Reparaciones Temporales', 2, 20, '006', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:28 hrs.', '26/08/2014 - 11:11 hrs.', '', ''),
(293, 'Compresor De Aire', 2, 20, '007', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:30 hrs.', '26/08/2014 - 12:54 hrs.', '', ''),
(294, 'Unidades Manejadoras De Aire', 2, 20, '008', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:33 hrs.', '26/08/2014 - 14:42 hrs.', '', ''),
(295, 'Operacion De Calderas', 2, 20, '009', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:35 hrs.', '26/08/2014 - 13:01 hrs.', '', ''),
(296, 'Mecanico En Linea', 2, 20, '010', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:39 hrs.', '26/08/2014 - 12:43 hrs.', '', ''),
(297, 'Camara De Congelacion', 2, 20, '011', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 08:40 hrs.', '26/08/2014 - 12:34 hrs.', '', ''),
(298, 'Cronograma De Mantenimiento Preventivo', 4, 20, '001', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:19 hrs.', '', '', ''),
(299, 'Cronograma Anual De Calibracion De Instrumentacion De Medicion', 4, 20, '002', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:20 hrs.', '26/08/2014 - 15:17 hrs.', '', ''),
(300, 'Orden De Trabajo "electrónico"', 4, 20, '003', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:27 hrs.', '', '', ''),
(301, 'Solicitud De Trabajo', 4, 20, '004', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:28 hrs.', '26/08/2014 - 15:20 hrs.', '', ''),
(302, 'Revisión Mensual A Basculas De Proceso', 4, 20, '005', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:30 hrs.', '26/08/2014 - 15:20 hrs.', '', ''),
(303, 'Revision Mensual Termometros', 4, 20, '006', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:30 hrs.', '26/08/2014 - 15:19 hrs.', '', ''),
(304, 'Monitoreo Tratamiento De Agua', 4, 20, '007', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:31 hrs.', '26/08/2014 - 15:19 hrs.', '', ''),
(305, 'Bitacora De Refrigeracion De La Camara De Congelacion', 4, 20, '008', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:32 hrs.', '26/08/2014 - 15:16 hrs.', '', ''),
(306, 'Bitacora De Caldera', 4, 20, '009', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:33 hrs.', '26/08/2014 - 15:15 hrs.', '', ''),
(307, 'Revision Tecnica: Equipos, Camara De Congelacion, Umas Y Subestaciones', 4, 20, '010', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:35 hrs.', '26/08/2014 - 15:20 hrs.', '', ''),
(308, 'Mantenimiento Preventivo Semanal Codificador', 4, 20, '011', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:36 hrs.', '', '', ''),
(309, 'Mantenimiento Preventivo Semanal Compresor De Aire', 4, 20, '012', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:38 hrs.', '', '', ''),
(310, 'Mantenimiento Preventivo Diario Selladoras Al Vacio Sp008-1,sp008-2, Sp008-3 Y Sp008-4', 4, 20, '013', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:44 hrs.', '26/08/2014 - 15:18 hrs.', '', ''),
(311, 'Bitacora De Salidas De Refacciones E Insumos De Mantenimiento', 4, 20, '014', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:53 hrs.', '26/08/2014 - 15:16 hrs.', '', ''),
(312, 'Bitacora De Entradas De Refacciones  E Insumos Mantenimiento', 4, 20, '015', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:56 hrs.', '26/08/2014 - 15:16 hrs.', '', ''),
(313, 'Revision Diaria De Descongelado-eviscerado', 4, 20, '016', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 11:58 hrs.', '', '', ''),
(314, 'Mantenimiento Preventivo Semanal De Linea De Producción', 4, 20, '017', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:00 hrs.', '', '', ''),
(315, 'Actividades Diarias De Revision En Sala De Autoclaves Encartonado Y 4-pack', 4, 20, '018', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:01 hrs.', '', '', ''),
(316, 'Mantenimiento Preventivo Diario De Torre De Enfriamiento', 4, 20, '019', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:03 hrs.', '26/08/2014 - 15:18 hrs.', '', ''),
(317, 'Codigo De Colores En Tuberia De Planta Procesa', 4, 20, '020', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:04 hrs.', '', '', ''),
(318, 'Programa Anual De Desazolve De Registros Y Trampas De Grasa', 4, 20, '021', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:06 hrs.', '', '', ''),
(319, 'Reparacion Temporal', 4, 20, '022', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:07 hrs.', '', '', ''),
(320, 'Lay Out Tuberias', 4, 20, '023', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:07 hrs.', '', '', ''),
(321, 'Lay Out Registro', 4, 20, '024', 'Agosto', 2014, 91, 71, 55, '26/08/2014 - 12:09 hrs.', '', '', ''),
(322, 'Lay Out Planta', 4, 20, '025', 'Agosto', 2014, 100, 102, 101, '26/08/2014 - 12:10 hrs.', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_principal`
--

CREATE TABLE IF NOT EXISTS `menu_principal` (
  `id_perfil` int(1) NOT NULL,
  `indice_menu` int(1) NOT NULL,
  `opcion` varchar(25) NOT NULL,
  `url` varchar(120) NOT NULL,
  KEY `id_perfil` (`id_perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `menu_principal`
--

INSERT INTO `menu_principal` (`id_perfil`, `indice_menu`, `opcion`, `url`) VALUES
(0, 1, 'Escritorio', 'escritorio.dashboard'),
(0, 2, 'Documentos', 'escritorio.documentos'),
(3, 2, 'Documentos', 'escritorio.documentos'),
(3, 3, 'Mi perfil', 'escritorio.mi-perfil'),
(2, 2, 'Documentos', 'escritorio.documentos'),
(1, 2, 'Documentos', 'escritorio.documentos'),
(0, 3, 'Usuarios', 'escritorio.usuarios'),
(0, 4, 'Areas', 'escritorio.areas'),
(0, 6, 'Mi perfil', 'escritorio.mi-perfil'),
(1, 1, 'Escritorio', 'escritorio.dashboard'),
(2, 1, 'Escritorio', 'escritorio.dashboard'),
(1, 3, 'Mi perfil', 'escritorio.mi-perfil'),
(2, 3, 'Mi perfil', 'escritorio.mi-perfil'),
(3, 1, 'Escritorio', 'escritorio.dashboard'),
(0, 5, 'Puestos', 'escritorio.puestos'),
(0, 7, 'Config', 'escritorio.configuracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages_mail`
--

CREATE TABLE IF NOT EXISTS `messages_mail` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `opcion` varchar(60) NOT NULL,
  `destino` varchar(60) NOT NULL,
  `mensaje` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `messages_mail`
--

INSERT INTO `messages_mail` (`id`, `opcion`, `destino`, `mensaje`) VALUES
(1, 'nuevoDoc', 'creador', '<h3>Hola, %nombre%.</h3>\n<p>El documento <strong>%documento% -</strong>&nbsp;(<strong>%codigo%)</strong> se ha creado.</p>\n<p>Ya puedes empezar a editar el documento.</p>\n<p><span style="color: #ffffff; background-color: #ff0000;"><em>NOTA: Tienes solo 10 dias para terminar la edicion del documento y enviarlo a revisi&oacute;n.</em></span></p>'),
(2, 'nuevoDoc', 'revisor', '<h3>Hola, %nombre%.</h3>\n<p>El documento&nbsp;<strong>%documento%</strong>&nbsp;<strong>%codigo%</strong>&nbsp;se ha creado.</p>\n<p>Espera aque el documento pase a Revisi&oacute;n.</p>'),
(3, 'nuevoDoc', 'autorizador', '<h3>Hola, %nombre%.</h3>\n<p>El documento <strong>%documento%</strong> <strong>%codigo%</strong> se ha creado.</p>\n<p>Espera aque el documento pase a Autorizaci&oacute;n.</p>'),
(4, 'nuevoDoc', 'asunto', 'El documento: %documento%. Se ha creado'),
(5, 'revision', 'asunto', 'EL documento: %documento%. Esta listo para su revision'),
(6, 'revision', 'revisor', '<h3>HOLA, %nombre%.</h3>\n<h3>&nbsp;</h3>\n<p>EL documento <strong>%documento%</strong> - <strong>%codigo%</strong> a pasado a revis&oacute;n.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>'),
(7, 'autorizacion', 'asunto', 'EL documento: %documento%. Esta listo para su aprobacion'),
(8, 'autorizacion', 'autorizador', '<h3>Hola, %nombre%.&nbsp;</h3>\n<p>EL documento&nbsp;<strong>%documento%</strong>&nbsp;-&nbsp;<strong>%codigo%</strong>&nbsp;a pasado a Aprobaci&oacute;n.&nbsp;</p>\n<p>&nbsp;</p>'),
(9, 'edicion', 'asunto', 'EL documento: %documento%. Se ha enviado a Edicion'),
(10, 'edicion', 'creador', '<h3>Hola, %nombre%.&nbsp;</h3>\n<p>EL documento&nbsp;<strong>%documento%</strong>&nbsp;-&nbsp;<strong>%codigo%</strong>&nbsp;a regresado a edicion.</p>'),
(11, 'eliminado', 'asunto', 'El documento: %documento%. ha sido eliminado.'),
(12, 'eliminado', 'usuarios', '<h3>Hola, %nombre%.&nbsp;</h3>\n<p>EL documento&nbsp;<strong>%documento%</strong>&nbsp;-&nbsp;<strong>%codigo%</strong>&nbsp;ha sido Eliminado.&nbsp;</p>\n<p>Para mayor informaci&oacute;n dirijase&nbsp;al administrador.</p>'),
(13, 'aprobado', 'asunto', 'El documento: %documento%. ha sido aprobado.'),
(14, 'aprobado', 'usuarios', '<h3>Hola, %nombre%.&nbsp;</h3>\n<p>EL documento&nbsp;<strong>%documento%</strong>&nbsp;-&nbsp;<strong>%codigo%.</strong>&nbsp;Ha sido aprobado.</p>'),
(15, 'revisionDoc', 'asunto', 'El Documento: %documento%. Se ha mandado a nueva revision'),
(16, 'revisionDoc', 'usuarios', '<h3>Hola, %nombre%.&nbsp;</h3>\n<p>EL documento&nbsp;<strong>%documento%</strong>&nbsp;- (<strong>%codigo%)</strong>. Se ha mandado a nueva revision</p>\n<p>&nbsp;</p>'),
(17, 'obsoleto', 'asunto', 'El Documento: %documento%. Esta obsoleto'),
(18, 'obsoleto', 'usuarios', '<h3>Hola, %nombre%.&nbsp;</h3>\n<p>EL documento&nbsp;<strong>%documento%</strong>&nbsp;- (<strong>%codigo%)</strong>. Se ha&nbsp;hecho obsoleto</p>\n<p>&nbsp; &nbsp;</p>'),
(19, 'permiso', 'asunto', 'Se le ah consedido permiso para visualizar el documento: %documento%'),
(20, 'permiso', 'usuarios', '<p>Usted tiene permisos para ver el documento %documento% &nbsp;&nbsp;</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(1) NOT NULL,
  `perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `perfil`) VALUES
(0, 'Administrador'),
(1, 'Autorizador'),
(2, 'Revisor'),
(3, 'Editor'),
(4, 'Lector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_documento_puestos`
--

CREATE TABLE IF NOT EXISTS `permisos_documento_puestos` (
  `id_documento` int(11) NOT NULL,
  `id_puesto` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permisos_documento_puestos`
--

INSERT INTO `permisos_documento_puestos` (`id_documento`, `id_puesto`) VALUES
(1, 39),
(1, 56),
(16, 26),
(16, 122),
(16, 39),
(18, 39),
(18, 26),
(18, 122),
(17, 39),
(17, 122),
(17, 26),
(18, 42),
(18, 106),
(102, 26),
(107, 39),
(107, 122),
(100, 9),
(100, 21),
(100, 39),
(100, 68),
(100, 105),
(100, 22),
(28, 29),
(28, 21),
(28, 26),
(28, 39),
(28, 105),
(28, 68),
(28, 62),
(51, 39),
(51, 62),
(51, 68),
(51, 105),
(51, 54),
(51, 88),
(51, 26),
(50, 29),
(50, 21),
(50, 88),
(50, 39),
(50, 31),
(50, 105),
(50, 68),
(50, 62),
(137, 39),
(107, 26),
(7, 39),
(12, 39),
(6, 39),
(8, 39),
(5, 39),
(14, 39),
(107, 133),
(16, 133),
(170, 39),
(171, 39),
(180, 39),
(135, 133),
(76, 133),
(137, 133),
(170, 133),
(243, 39),
(245, 39),
(248, 39),
(247, 39),
(241, 39),
(242, 39),
(273, 39),
(275, 39),
(274, 39),
(195, 39),
(183, 39),
(185, 39),
(287, 29),
(287, 21),
(287, 39),
(214, 39),
(297, 39),
(147, 39),
(147, 62),
(147, 105),
(147, 68),
(292, 21),
(292, 29),
(292, 39),
(293, 39),
(286, 39),
(296, 39),
(296, 21),
(296, 29),
(296, 107),
(296, 22),
(295, 39),
(295, 21),
(295, 29),
(291, 39),
(291, 21),
(291, 29),
(290, 39),
(290, 21),
(290, 29),
(290, 107),
(290, 22),
(294, 29),
(294, 21),
(294, 39),
(219, 39),
(219, 132),
(219, 49),
(219, 97),
(219, 14),
(219, 129),
(218, 39),
(287, 133);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_basica`
--

CREATE TABLE IF NOT EXISTS `plantilla_basica` (
  `id_documento` int(6) NOT NULL,
  `rev` varchar(3) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `fecha` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_basica`
--

INSERT INTO `plantilla_basica` (`id_documento`, `rev`, `estado`, `fecha`) VALUES
(136, 'A', 'Eliminado', '13/08/2014'),
(2, 'A', 'Autorizado', '06/08/2014'),
(3, 'A', 'Edición', '07/08/2014'),
(4, 'A', 'Aprobación', '07/08/2014'),
(5, 'A', 'Autorizado', '07/08/2014'),
(6, 'A', 'Autorizado', '07/08/2014'),
(7, 'A', 'Autorizado', '07/08/2014'),
(8, 'A', 'Autorizado', '07/08/2014'),
(9, 'A', 'Aprobación', '07/08/2014'),
(10, 'A', 'Aprobación', '07/08/2014'),
(11, 'A', 'Edición', '07/08/2014'),
(12, 'A', 'Autorizado', '07/08/2014'),
(13, 'A', 'Edición', '07/08/2014'),
(14, 'A', 'Autorizado', '07/08/2014'),
(15, 'A', 'Autorizado', '07/08/2014'),
(19, 'A', 'Autorizado', '07/08/2014'),
(20, 'A', 'Autorizado', '07/08/2014'),
(21, 'A', 'Autorizado', '07/08/2014'),
(22, 'A', 'Autorizado', '07/08/2014'),
(23, 'A', 'Autorizado', '07/08/2014'),
(24, 'A', 'Autorizado', '07/08/2014'),
(25, 'A', 'Autorizado', '07/08/2014'),
(26, 'A', 'Aprobación', '07/08/2014'),
(27, 'A', 'Autorizado', '07/08/2014'),
(28, 'A', 'Autorizado', '07/08/2014'),
(29, 'A', 'Autorizado', '07/08/2014'),
(30, 'A', 'Autorizado', '07/08/2014'),
(31, 'A', 'Autorizado', '07/08/2014'),
(32, 'A', 'Autorizado', '07/08/2014'),
(33, 'A', 'Autorizado', '07/08/2014'),
(34, 'A', 'Autorizado', '07/08/2014'),
(35, 'A', 'Autorizado', '07/08/2014'),
(36, 'A', 'Autorizado', '07/08/2014'),
(37, 'A', 'Autorizado', '07/08/2014'),
(38, 'A', 'Autorizado', '07/08/2014'),
(39, 'A', 'Eliminado', '08/08/2014'),
(40, 'A', 'Autorizado', '08/08/2014'),
(41, 'A', 'Autorizado', '08/08/2014'),
(42, 'A', 'Autorizado', '08/08/2014'),
(43, 'A', 'Autorizado', '08/08/2014'),
(44, 'A', 'Autorizado', '08/08/2014'),
(45, 'A', 'Autorizado', '08/08/2014'),
(46, 'A', 'Autorizado', '08/08/2014'),
(47, 'A', 'Autorizado', '08/08/2014'),
(48, 'A', 'Eliminado', '08/08/2014'),
(49, 'A', 'Aprobación', '08/08/2014'),
(50, 'A', 'Autorizado', '08/08/2014'),
(51, 'A', 'Autorizado', '08/08/2014'),
(52, 'A', 'Autorizado', '08/08/2014'),
(53, 'A', 'Autorizado', '08/08/2014'),
(54, 'A', 'Autorizado', '08/08/2014'),
(55, 'A', 'Autorizado', '08/08/2014'),
(56, 'A', 'Autorizado', '08/08/2014'),
(57, 'A', 'Autorizado', '08/08/2014'),
(58, 'A', 'Autorizado', '08/08/2014'),
(59, 'A', 'Autorizado', '08/08/2014'),
(60, 'A', 'Autorizado', '08/08/2014'),
(61, 'A', 'Autorizado', '08/08/2014'),
(62, 'A', 'Autorizado', '08/08/2014'),
(63, 'A', 'Autorizado', '08/08/2014'),
(64, 'A', 'Autorizado', '08/08/2014'),
(65, 'A', 'Autorizado', '08/08/2014'),
(66, 'A', 'Autorizado', '08/08/2014'),
(67, 'A', 'Autorizado', '08/08/2014'),
(68, 'A', 'Autorizado', '08/08/2014'),
(69, 'A', 'Autorizado', '08/08/2014'),
(70, 'A', 'Autorizado', '08/08/2014'),
(71, 'A', 'Autorizado', '08/08/2014'),
(72, 'A', 'Autorizado', '08/08/2014'),
(73, 'A', 'Autorizado', '08/08/2014'),
(74, 'A', 'Autorizado', '08/08/2014'),
(75, 'A', 'Autorizado', '08/08/2014'),
(76, 'A', 'Autorizado', '08/08/2014'),
(77, 'A', 'Autorizado', '08/08/2014'),
(78, 'A', 'Autorizado', '08/08/2014'),
(79, 'A', 'Autorizado', '08/08/2014'),
(80, 'A', 'Autorizado', '08/08/2014'),
(81, 'A', 'Autorizado', '08/08/2014'),
(82, 'A', 'Autorizado', '08/08/2014'),
(83, 'A', 'Autorizado', '08/08/2014'),
(84, 'A', 'Autorizado', '08/08/2014'),
(85, 'A', 'Autorizado', '08/08/2014'),
(86, 'A', 'Autorizado', '08/08/2014'),
(87, 'A', 'Autorizado', '08/08/2014'),
(88, 'A', 'Autorizado', '08/08/2014'),
(89, 'A', 'Autorizado', '08/08/2014'),
(90, 'A', 'Autorizado', '08/08/2014'),
(91, 'A', 'Autorizado', '08/08/2014'),
(92, 'A', 'Autorizado', '08/08/2014'),
(93, 'A', 'Autorizado', '08/08/2014'),
(94, 'A', 'Aprobación', '08/08/2014'),
(95, 'A', 'Autorizado', '08/08/2014'),
(96, 'A', 'Autorizado', '08/08/2014'),
(97, 'A', 'Autorizado', '08/08/2014'),
(98, 'A', 'Autorizado', '08/08/2014'),
(99, 'A', 'Autorizado', '08/08/2014'),
(100, 'A', 'Autorizado', '08/08/2014'),
(138, 'A', 'Eliminado', '13/08/2014'),
(102, 'A', 'Autorizado', '12/08/2014'),
(104, 'A', 'Revisión', '12/08/2014'),
(105, 'A', 'Autorizado', '12/08/2014'),
(106, 'A', 'Autorizado', '12/08/2014'),
(107, 'A', 'Autorizado', '12/08/2014'),
(108, 'A', 'Autorizado', '12/08/2014'),
(109, 'A', 'Aprobación', '12/08/2014'),
(110, 'A', 'Autorizado', '12/08/2014'),
(111, 'A', 'Autorizado', '12/08/2014'),
(112, 'A', 'Revisión', '12/08/2014'),
(115, 'A', 'Eliminado', '13/08/2014'),
(116, 'A', 'Autorizado', '13/08/2014'),
(117, 'A', 'Autorizado', '13/08/2014'),
(118, 'A', 'Autorizado', '13/08/2014'),
(119, 'A', 'Autorizado', '13/08/2014'),
(120, 'A', 'Autorizado', '13/08/2014'),
(121, 'A', 'Autorizado', '13/08/2014'),
(122, 'A', 'Autorizado', '13/08/2014'),
(123, 'A', 'Autorizado', '13/08/2014'),
(124, 'A', 'Autorizado', '13/08/2014'),
(125, 'A', 'Autorizado', '13/08/2014'),
(126, 'A', 'Autorizado', '13/08/2014'),
(127, 'A', 'Autorizado', '13/08/2014'),
(128, 'A', 'Autorizado', '13/08/2014'),
(129, 'A', 'Autorizado', '13/08/2014'),
(130, 'A', 'Edición', '13/08/2014'),
(131, 'A', 'Edición', '13/08/2014'),
(132, 'A', 'Edición', '13/08/2014'),
(139, 'A', 'Eliminado', '15/08/2014'),
(141, 'A', 'Eliminado', '15/08/2014'),
(142, 'A', 'Eliminado', '15/08/2014'),
(143, 'A', 'Eliminado', '18/08/2014'),
(144, 'A', 'Autorizado', '18/08/2014'),
(145, 'A', 'Autorizado', '18/08/2014'),
(146, 'A', 'Autorizado', '18/08/2014'),
(147, 'A', 'Autorizado', '18/08/2014'),
(148, 'A', 'Autorizado', '18/08/2014'),
(149, 'A', 'Autorizado', '18/08/2014'),
(150, 'A', 'Autorizado', '18/08/2014'),
(151, 'A', 'Autorizado', '18/08/2014'),
(152, 'A', 'Autorizado', '18/08/2014'),
(153, 'A', 'Autorizado', '18/08/2014'),
(154, 'A', 'Autorizado', '18/08/2014'),
(155, 'A', 'Autorizado', '18/08/2014'),
(156, 'A', 'Autorizado', '18/08/2014'),
(157, 'A', 'Autorizado', '18/08/2014'),
(158, 'A', 'Autorizado', '18/08/2014'),
(159, 'A', 'Autorizado', '18/08/2014'),
(160, 'A', 'Autorizado', '18/08/2014'),
(161, 'A', 'Autorizado', '18/08/2014'),
(162, 'A', 'Autorizado', '18/08/2014'),
(163, 'A', 'Autorizado', '18/08/2014'),
(164, 'A', 'Autorizado', '18/08/2014'),
(165, 'A', 'Autorizado', '18/08/2014'),
(166, 'A', 'Autorizado', '18/08/2014'),
(175, 'A', 'Autorizado', '19/08/2014'),
(174, 'A', 'Autorizado', '19/08/2014'),
(173, 'A', 'Autorizado', '19/08/2014'),
(172, 'A', 'Autorizado', '19/08/2014'),
(171, 'A', 'Autorizado', '19/08/2014'),
(170, 'A', 'Autorizado', '19/08/2014'),
(169, 'A', 'Eliminado', '19/08/2014'),
(168, 'A', 'Autorizado', '19/08/2014'),
(167, 'A', 'Edición', '19/08/2014'),
(176, 'A', 'Edición', '19/08/2014'),
(177, 'A', 'Autorizado', '19/08/2014'),
(178, 'A', 'Autorizado', '19/08/2014'),
(179, 'A', 'Autorizado', '19/08/2014'),
(180, 'A', 'Autorizado', '19/08/2014'),
(181, 'A', 'Autorizado', '19/08/2014'),
(182, 'A', 'Autorizado', '19/08/2014'),
(183, 'A', 'Autorizado', '19/08/2014'),
(184, 'A', 'Edición', '19/08/2014'),
(185, 'A', 'Autorizado', '19/08/2014'),
(186, 'A', 'Autorizado', '19/08/2014'),
(187, 'A', 'Edición', '19/08/2014'),
(188, 'A', 'Edición', '19/08/2014'),
(189, 'A', 'Edición', '19/08/2014'),
(190, 'A', 'Autorizado', '19/08/2014'),
(191, 'A', 'Edición', '19/08/2014'),
(192, 'A', 'Autorizado', '19/08/2014'),
(193, 'A', 'Autorizado', '19/08/2014'),
(194, 'A', 'Autorizado', '19/08/2014'),
(195, 'A', 'Autorizado', '19/08/2014'),
(196, 'A', 'Aprobación', '19/08/2014'),
(197, 'A', 'Edición', '19/08/2014'),
(239, 'A', 'Revisión', '22/08/2014'),
(238, 'A', 'Edición', '22/08/2014'),
(229, 'A', 'Edición', '22/08/2014'),
(237, 'A', 'Revisión', '22/08/2014'),
(230, 'A', 'Revisión', '22/08/2014'),
(198, 'A', 'Autorizado', '19/08/2014'),
(199, 'A', 'Autorizado', '19/08/2014'),
(200, 'A', 'Aprobación', '19/08/2014'),
(201, 'A', 'Autorizado', '19/08/2014'),
(202, 'A', 'Edición', '19/08/2014'),
(203, 'A', 'Autorizado', '19/08/2014'),
(204, 'A', 'Autorizado', '19/08/2014'),
(208, 'A', 'Autorizado', '20/08/2014'),
(212, 'A', 'Edición', '20/08/2014'),
(213, 'A', 'Autorizado', '20/08/2014'),
(214, 'A', 'Autorizado', '20/08/2014'),
(215, 'A', 'Edición', '20/08/2014'),
(216, 'A', 'Aprobación', '20/08/2014'),
(217, 'A', 'Autorizado', '20/08/2014'),
(218, 'A', 'Autorizado', '20/08/2014'),
(220, 'A', 'Revisión', '20/08/2014'),
(221, 'A', 'Revisión', '20/08/2014'),
(222, 'A', 'Revisión', '20/08/2014'),
(223, 'A', 'Revisión', '20/08/2014'),
(224, 'A', 'Edición', '20/08/2014'),
(225, 'A', 'Revisión', '20/08/2014'),
(226, 'A', 'Edición', '20/08/2014'),
(227, 'A', 'Edición', '20/08/2014'),
(240, 'A', 'Revisión', '22/08/2014'),
(241, 'A', 'Autorizado', '22/08/2014'),
(242, 'A', 'Autorizado', '22/08/2014'),
(243, 'A', 'Autorizado', '22/08/2014'),
(244, 'A', 'Autorizado', '22/08/2014'),
(245, 'A', 'Autorizado', '22/08/2014'),
(246, 'A', 'Revisión', '22/08/2014'),
(247, 'A', 'Autorizado', '22/08/2014'),
(248, 'A', 'Autorizado', '22/08/2014'),
(249, 'A', 'Revisión', '22/08/2014'),
(250, 'A', 'Revisión', '22/08/2014'),
(251, 'A', 'Revisión', '22/08/2014'),
(252, 'A', 'Revisión', '22/08/2014'),
(298, 'A', 'Edición', '26/08/2014'),
(285, 'A', 'Edición', '26/08/2014'),
(258, 'A', 'Edición', '25/08/2014'),
(259, 'A', 'Revisión', '25/08/2014'),
(260, 'A', 'Revisión', '25/08/2014'),
(261, 'A', 'Edición', '25/08/2014'),
(262, 'A', 'Revisión', '25/08/2014'),
(263, 'A', 'Autorizado', '25/08/2014'),
(264, 'A', 'Revisión', '25/08/2014'),
(265, 'A', 'Aprobación', '25/08/2014'),
(266, 'A', 'Revisión', '25/08/2014'),
(267, 'A', 'Autorizado', '25/08/2014'),
(268, 'A', 'Aprobación', '25/08/2014'),
(269, 'A', 'Autorizado', '25/08/2014'),
(270, 'A', 'Aprobación', '25/08/2014'),
(271, 'A', 'Aprobación', '25/08/2014'),
(272, 'A', 'Autorizado', '25/08/2014'),
(273, 'A', 'Autorizado', '25/08/2014'),
(274, 'A', 'Autorizado', '25/08/2014'),
(275, 'A', 'Autorizado', '25/08/2014'),
(281, 'A', 'Aprobación', '25/08/2014'),
(282, 'A', 'Aprobación', '25/08/2014'),
(284, 'A', 'Aprobación', '25/08/2014'),
(301, 'A', 'Revisión', '26/08/2014'),
(300, 'A', 'Edición', '26/08/2014'),
(299, 'A', 'Revisión', '26/08/2014'),
(302, 'A', 'Revisión', '26/08/2014'),
(303, 'A', 'Revisión', '26/08/2014'),
(304, 'A', 'Revisión', '26/08/2014'),
(305, 'A', 'Revisión', '26/08/2014'),
(306, 'A', 'Revisión', '26/08/2014'),
(307, 'A', 'Revisión', '26/08/2014'),
(308, 'A', 'Edición', '26/08/2014'),
(309, 'A', 'Edición', '26/08/2014'),
(310, 'A', 'Revisión', '26/08/2014'),
(311, 'A', 'Revisión', '26/08/2014'),
(312, 'A', 'Revisión', '26/08/2014'),
(313, 'A', 'Edición', '26/08/2014'),
(314, 'A', 'Edición', '26/08/2014'),
(315, 'A', 'Edición', '26/08/2014'),
(316, 'A', 'Revisión', '26/08/2014'),
(317, 'A', 'Edición', '26/08/2014'),
(318, 'A', 'Edición', '26/08/2014'),
(319, 'A', 'Edición', '26/08/2014'),
(320, 'A', 'Edición', '26/08/2014'),
(321, 'A', 'Edición', '26/08/2014'),
(322, 'A', 'Edición', '26/08/2014');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_basica_comentarios`
--

CREATE TABLE IF NOT EXISTS `plantilla_basica_comentarios` (
  `id_documento` int(6) NOT NULL,
  `id_usuario` int(6) NOT NULL,
  `comentario` text NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_basica_comentarios`
--

INSERT INTO `plantilla_basica_comentarios` (`id_documento`, `id_usuario`, `comentario`) VALUES
(111, 66, ''),
(111, 82, ''),
(33, 71, ''),
(142, 88, ''),
(213, 87, ''),
(9, 45, ''),
(174, 39, ''),
(244, 63, ''),
(244, 55, ''),
(284, 57, ''),
(225, 96, ''),
(229, 27, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_basica_obsoletos`
--

CREATE TABLE IF NOT EXISTS `plantilla_basica_obsoletos` (
  `consecutivo` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento` int(11) NOT NULL,
  `rev` varchar(3) NOT NULL,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`consecutivo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `plantilla_basica_obsoletos`
--

INSERT INTO `plantilla_basica_obsoletos` (`consecutivo`, `id_documento`, `rev`, `estado`) VALUES
(1, 1, 'A', 'Obsoleto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_basica_revisiones`
--

CREATE TABLE IF NOT EXISTS `plantilla_basica_revisiones` (
  `id_documento` int(11) NOT NULL,
  `fecha_cambio` varchar(50) NOT NULL,
  `descripcion_cambio` text NOT NULL,
  `descripcion_justificacion` text NOT NULL,
  `usuario` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_basica_revisiones_obsoletos`
--

CREATE TABLE IF NOT EXISTS `plantilla_basica_revisiones_obsoletos` (
  `consecutivo` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `fecha_cambio` varchar(50) NOT NULL,
  `descripcion_cambio` text NOT NULL,
  `descripcion_justificacion` text NOT NULL,
  `usuario` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa` (
  `id_documento` int(6) NOT NULL,
  `rev` varchar(3) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `objetivo` text NOT NULL,
  `alcance` text NOT NULL,
  `definiciones` text NOT NULL,
  `desarrollo` text NOT NULL,
  `referencias` text NOT NULL,
  `anexos` text NOT NULL,
  `revision` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa`
--

INSERT INTO `plantilla_completa` (`id_documento`, `rev`, `estado`, `fecha`, `objetivo`, `alcance`, `definiciones`, `desarrollo`, `referencias`, `anexos`, `revision`) VALUES
(16, 'C', 'Eliminado', '07/08/2014', '<p>kdjd</p>', '<p>djdj</p>', '<p>dkdk</p>', '<p><img src="source/ESPECIFICACIONES/sal molida.jpg" alt="" width="189" height="267" /></p>\n<p>&nbsp;</p>\n<p>kjjklfkfkflrlkjdgklgjkldfjgkldklsdnfksdnfjksdnjkdsnkjdfvndjfkbndkjv</p>', '<p>k</p>', '<p>k</p>', ''),
(133, 'A', 'Eliminado', '13/08/2014', '<p>jsdagdadgj</p>', '<p>dsfdsfsdfs</p>', '<p>dsfdsfsfd</p>\n<p>&nbsp;</p>', '<p>dsfdsfdsaf</p>', '<p>dfdsf</p>', '<p>na</p>', ''),
(113, 'A', 'Eliminado', '12/08/2014', '<p>mndvnxcnmxncvnxcvnxcnmvcxnmxcmnnmcxnmxcnm</p>', '<p>KJADSKADSKASKLDSKL</p>', '<p>KSDKLSADJKLAS</p>', '<p>DJASDJK</p>', '<p>LKJFKLSDF</p>', '<p>NA</p>', ''),
(103, 'A', 'Eliminado', '12/08/2014', '', '', '', '', '', '', ''),
(114, 'A', 'Eliminado', '13/08/2014', '<p>jjhghg</p>', '<p>,mnjknbjk</p>', '<p>bjkbkjb</p>', '<p>kkjjj</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '<p>NA</p>', '<p>NA</p>', ''),
(101, 'A', 'Autorizado', '11/08/2014', '<p>sdfdsfds</p>', '<p>dfdsfdf</p>', '<p>dsdASD</p>', '<p>DF</p>', '<p>FDDSAF</p>', '<p>SDDSD</p>', ''),
(134, 'A', 'Eliminado', '13/08/2014', '', '', '', '', '', '', ''),
(135, 'A', 'Autorizado', '13/08/2014', '<p>ccc</p>', '<p>cc</p>', '<p>bbb</p>', '<p>nnnn</p>', '<p>kkkkk</p>', '<p>kkkk</p>', ''),
(137, 'A', 'Autorizado', '13/08/2014', '<p>hflkk&ntilde;lkfkjfosdk</p>\n<p>&nbsp;</p>', '<p>ifdjpfd</p>', '<p>jlksjf</p>', '<p>jdf&ntilde;lkd{lf</p>', '<p>dsf</p>', '<p>kjfkdsa</p>', ''),
(140, 'A', 'Eliminado', '15/08/2014', '', '', '', '', '', '', ''),
(205, 'A', 'Edición', '19/08/2014', '<p style="text-align: justify;">Describir el plan a seguir para implementar programa de Bioseguridad de la planta Procesa. El cual aplica a todos los procesos relacionados con la elaboraci&oacute;n de nuestros productos, incluyendo recibo de materia prima y empaque, almacenamiento y distribuci&oacute;n de los productos terminados.</p>', '<p>Este documento aplica para todo el personal que labora en la planta Procesa.</p>', '<p>&nbsp;</p>\n<p style="text-align: justify;"><strong>DEFENSA DE LOS ALIMENTOS:</strong> consiste en prevenir, reducir o responder a la contaminaci&oacute;n deliberada de alimentos causada por una serie de posibles agentes amenazantes. Los cuales representan actos criminales que tienen la intenci&oacute;n premeditada de hacer da&ntilde;o.</p>\n<p style="text-align: justify;"><strong>EB:</strong> Equipo de Bioseguridad.&nbsp;</p>\n<p style="text-align: justify;"><strong>EQUIPO</strong>: Aparatos e instrumentos utilizados para un fin determinado.&nbsp;</p>\n<p style="text-align: justify;"><strong>HACCP:</strong> An&aacute;lisis de peligros y punto cr&iacute;ticos de Control. Enfoque sistem&aacute;tico de prevenci&oacute;n de problemas con el fin de asegurar la producci&oacute;n de productos alimenticios que sean inocuos para el consumo.&nbsp;</p>\n<p style="text-align: justify;"><strong>INOCUIDAD:</strong> Contaminaci&oacute;n accidental de los alimentos durante el procesamiento o almacenamiento por peligros biol&oacute;gicos, qu&iacute;micos o f&iacute;sicos.&nbsp;</p>\n<p style="text-align: justify;"><strong>MATERIA PRIMA:</strong> Se entiende por materia prima a la sustancia o producto de cualquier origen que se use en la elaboraci&oacute;n de alimentos, bebidas, cosm&eacute;ticos, tabacos, productos de aseo y limpieza. En el caso particular de la materia prima de Procesa Chiapas, se refiere al at&uacute;n entero y lomos precocidos congelados.&nbsp;</p>\n<p style="text-align: justify;"><strong>SEGURIDAD ALIMENTARIA:</strong> Es asegurar que las personas tienen en todo momento, acceso f&iacute;sico y econ&oacute;mico, a&nbsp; suficientes alimentos inocuos y nutritivos, para satisfacer sus necesidades alimentarias y sus preferencias en cuanto a los alimentos de llevar una vida activa y sana.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p>&nbsp;</p>', '<p style="text-align: justify;">5.1 El EB ser&aacute; el encargado&nbsp; de por lo menos una vez al a&ntilde;o reevaluar los riesgos y las estrategias descritas en este procedimiento.&nbsp;</p>\n<p style="text-align: justify;">&nbsp;5.2 Se realizaran verificaciones al programa por parte del coordinador del equipo al menos cada 2 meses.</p>\n<p style="text-align: justify;">&nbsp;5.3Se realizaran la capacitaci&oacute;n a todos los empleados de los siguientes programas y procedimientos</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.3.1&nbsp;&nbsp;&nbsp;&nbsp; <strong>Programa de Entrada de Visitantes </strong>&ndash; El programa incluye las preocupaciones de seguridad, tales como el acceso de los visitantes, identificaci&oacute;n de los visitantes y procedimientos de registro de entrada y salida de los visitantes de acuerdo al procedimiento de Acceso de personal Externo a planta (PR-VG-001-A).</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.3.2&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;Programa de Control de Qu&iacute;micos </strong>&ndash; Este programa explica c&oacute;mo usar y almacenar efectivamente los productos qu&iacute;micos. Los productos qu&iacute;micos no-autorizados no son permitidos en la planta. De acuerdo a lo descrito en el procedimiento de control de qu&iacute;micos (PR-CQ-001-A)</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.3.3&nbsp;&nbsp;&nbsp;&nbsp; <strong>Programa de Calidad de Servicios</strong> - Este programa asegura la calidad del agua, aire y vapor a utilizar en todos los procesos de la planta, asegurando la no contaminaci&oacute;n intencional.(PR-CS-001-A)</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;5.3.4&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;Programa de los Contratistas </strong>&ndash; Todos los empleados deben ser capacitados sobre este programa para que sepan c&oacute;mo manejar a los contratistas.&nbsp; Todos los miembros del equipo deben ser entrenados sobre este plan, el cual es practicado, revisado y actualizado frecuentemente. de acuerdo al procedimiento de Acceso de personal Externo a planta (PR-VG-001-A).</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.3.5&nbsp;&nbsp;&nbsp;&nbsp; <strong>Programa de Uniformes o Prendas Exteriores </strong>&ndash; El Programa de Uniformes o Prendas Exteriores es establecido para reducir las amenazas de seguridad de los empleados o visitantes que traen materiales no-autorizados en ropa de vestir. Los visitantes, as&iacute; como los empleados, deber&iacute;an ser entrenados sobre este programa. De acuerdo a lo descrito en el procedimiento de uniformes o prendas exteriores (PR-SH-001-A)</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.3.6&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;Programa de Inspecci&oacute;n de los Casilleros de los Empleados </strong>&ndash; Este programa reduce las amenazas de seguridad de los empleados guardando material no autorizado en los casilleros de los empleados. de acuerdo al procedimiento de Revisi&oacute;n de lockers (PR-SH-002-A)</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.3.7&nbsp;&nbsp;&nbsp;&nbsp; <strong>Programa de Retiro del Producto </strong>&ndash; Este programa se usar&iacute;a para los incidentes de seguridad de los alimentos y seguridad de la planta. El programa de retiro se practica a trav&eacute;s de ensayos de retiro tres veces por a&ntilde;o para probar su efectividad. Los resultados de los ensayos de retiro deben ser documentados.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;5.3.8&nbsp;&nbsp;&nbsp;&nbsp; <strong>Acceso a Informaci&oacute;n </strong>&ndash; El acceso a las computadoras e informaci&oacute;n confidencial est&aacute; limitado a los empleados que necesitan acceso a estas &aacute;reas. El acceso a las computadoras est&aacute; controlado por procedimientos y contrase&ntilde;as para usar el sistema desde una terminal. Las terminales son controladas en todo momento</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong></p>\n<p style="text-align: justify;"><strong>5.4&nbsp;</strong><strong>Medidas de Control de Acceso del Per&iacute;metro</strong></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4.1&nbsp;&nbsp;&nbsp;&nbsp; Esta planta est&aacute; protegida por c&iacute;rculos conc&eacute;ntricos de seguridad. Los portones y cercas son considerados la primera l&iacute;nea de defensa; las puertas exteriores cerradas bajo llaves son considerados como la segunda l&iacute;nea de defensa.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4.2&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;Portones y Cercas </strong>&ndash; Se han instalado portones y cercas en esta planta, las cuales son inspeccionadas en un recorrido diario. Registrando las observaciones en la bit&aacute;cora de vigilancia.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4.3&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;Puertas de Acceso </strong>&ndash; Todas las puertas exteriores ser&aacute;n marcadas con &ldquo;solo personal autorizado&rdquo;. Se han quitado los accesorios de las puertas que no se usan como entradas. Las puertas tienen que mantenerse cerradas bajo llave en todo momento de acuerdo a lo descrito en el programa de Control de Acceso a Personal Externo (PR-VG-001-A) y Control de Acceso a Persona Interno PR-VG-002-A.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4.4&nbsp;&nbsp;&nbsp;&nbsp; <strong>Entradas de los Empleados </strong>&ndash; Se tienen puestos letreros que marcan la ruta de acceso y &ldquo;solo personal autorizado&rdquo;. Los empleados entran y salen de la planta solamente por estas entradas asignadas para ellos.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4.5&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;Entradas de los Visitantes </strong>&ndash; Se realiza de acuerdo en el programa de acceso a lo descrito en el procedimiento de Acceso a personal externo a planta (PR-VG-001-A). Los visitantes entran y salen de la planta solamente por estas entradas asignadas para ellos. Los visitantes se mantienen en el lobby hasta que se les d&eacute; autorizaci&oacute;n de entrar y se les proporciona un acompa&ntilde;ante.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4.6&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;C&aacute;maras de Seguridad </strong>&ndash; Los sistemas de CCTV est&aacute;n instalados de en diferentes &aacute;reas de la planta, colocado de manera estrat&eacute;gica para asegurar la seguridad alimentaria. El uso y verificaci&oacute;n de los sistemas CCTV son monitoreados en todo momento, de acuerdo a lo descrito en el procedimiento de Sistema Integral de c&aacute;mara de seguridad (PR-VG-004-A).</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4.7&nbsp;&nbsp;&nbsp;&nbsp; <strong>Estacionamiento de Visitantes y Empleados </strong>&ndash; El estacionamiento dentro de la planta solo es utilizado por personal autorizado, de acuerdo a lo descrito en el procedimiento Acceso a personal externo &nbsp;&nbsp;PR-VG-001-A y Acceso a personal Interno PR-VG-002-A.</p>\n<p style="text-align: justify;">&nbsp;&nbsp;</p>\n<p style="text-align: justify;"><strong>5.5</strong><strong>Medidas de Control de Acceso Interno</strong></p>\n<p style="text-align: justify;"><strong>&nbsp;</strong></p>\n<p style="text-align: justify;">5.5.1&nbsp;&nbsp;&nbsp;&nbsp; Las medidas de control de acceso interno son el tercer c&iacute;rculo conc&eacute;ntrico de seguridad y son usadas para limitar el acceso dentro de la planta.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.5.2&nbsp;&nbsp;&nbsp;&nbsp; <strong>Acceso a las &Aacute;reas de Producci&oacute;n </strong>&ndash; El acceso a las &aacute;reas de producci&oacute;n est&aacute; limitado solamente a los empleados que requieren acceso a esta &aacute;rea. Se les permite la entrada a las &aacute;reas de producci&oacute;n al personal gerencial de la planta, personal de producci&oacute;n, aseguramiento de calidad y seguridad laboral. Los visitantes tienen que estar acompa&ntilde;ados. Todos los otros empleados tienen que reportarse con el supervisor de producci&oacute;n para poder entrar a las &aacute;reas de producci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.5.3&nbsp;&nbsp;&nbsp;&nbsp; <strong>Acceso al Laboratorio </strong>&ndash; Solamente se le permite la entrada al laboratorio a los t&eacute;cnicos de laboratorio, personal de aseguramiento de calidad, y el personal gerencial de la planta. El acceso al laboratorio es s&oacute;lo concedido al personal que tiene llave de acceso.</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong>&nbsp;</p>\n<p style="text-align: justify;"><strong>5.6</strong><strong>Evaluaciones de Amenazas / Vulnerabilidades</strong></p>\n<p style="text-align: justify;"><strong>&nbsp;</strong></p>\n<p style="text-align: justify;">5.6.1&nbsp;&nbsp;&nbsp;&nbsp; Se realizara la Evaluaci&oacute;n de Amenazas / Vulnerabilidades (EAV) de acuerdo a lo descrito en el procedimiento de Evaluaci&oacute;n de amenazas y vulnerabilidades(PR-BS-002-A)</p>\n<p style="text-align: justify;">&nbsp;</p>', '<p>PR-CS-001-A Calidad de Servicios</p>\n<p>PR-VG-001-A Control de Acceso a personal externo</p>\n<p>PR-VG-002-A Control de Acceso a personal Interno</p>\n<p>PR-VG-003-A Vigilancia y Medidas de Acceso perimetral</p>\n<p>PR-VG-004-A Manejo del Sistema Integral de C&aacute;maras</p>\n<p>PR-CQ-001-A Control de Qu&iacute;micos</p>\n<p>PR-SH-001-A Uniformes o prenda exteriores</p>\n<p>PR-SH-002-A Revisi&oacute;n de Lockers</p>\n<p>PR-TR-001-A Trazabilidad</p>\n<p>PR-RT-001-A Retiro</p>\n<p>PR-BS-002-A Evaluaci&oacute;n de vulnerabilidades</p>', '<p>N/A</p>', ''),
(206, 'A', 'Aprobación', '19/08/2014', '<p style="text-align: justify;">Describir las actividades a realizar para la Evaluaci&oacute;n de Amenazas y Vulnerabilidades, para minimizar los riesgos a niveles aceptables.</p>\n<p>&nbsp;</p>', '<p>Todas las &aacute;reas de la Planta.</p>\n<p>&nbsp;</p>', '<p style="text-align: justify;"><strong>AMENAZAS</strong>: Posibilidad latente de provocar un da&ntilde;o, a una persona, producto o instalaci&oacute;n.</p>\n<p style="text-align: justify;"><strong>VULNERABILIDADES</strong>: Es la incapacidad de resistencia cuando se presenta un fen&oacute;meno amenazante, o la incapacidad para reponerse despu&eacute;s de que ha ocurrido un desastre.</p>\n<p style="text-align: justify;"><strong>&nbsp;MRO</strong>: Manero del Riesgo Operacional. Es una secuencia de 6 pasos que permiten que la eficacia operacional se mejore por anticipar las amenazas y reducir el potencial para p&eacute;rdidas.</p>\n<p style="text-align: justify;"><strong>&nbsp;RIESGO:</strong> Es la vulnerabilidad ante un posible o potencial perjuicio o da&ntilde;o para las personas y cosas, particularmente para el medio ambiente.</p>\n<p style="text-align: justify;"><strong>&nbsp;SEGURIDAD:</strong> Estrategia para cuidar el producto, equipo, instalaciones, empleado o marca de contaminaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;<strong>EB:</strong> Equipo de Bioseguridad.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p>&nbsp;</p>', '<p style="text-align: justify;">5.1 Al menos una vez por a&ntilde;o deber&aacute; realizarse la evaluaci&oacute;n de Amenazas y Vulnerabilidades, o cuando hay un cambio significativo que afecte la seguridad de los alimentos.</p>\n<p style="text-align: justify;">5.2 El EB deber&aacute; identificar cu&aacute;les son los riesgos que se presentan en la planta, realizando la verificaci&oacute;n de toda la planta. Los hallazgos encontrados as&iacute; como la evaluaci&oacute;n se registraran en el Formato de Evaluaci&oacute;n de Riesgo (FO-BS-001-A)</p>\n<p style="text-align: justify;">5.3 El EB verificara las amenazas de acuerdo al tipo que se presente (natural, &nbsp;&nbsp;&nbsp;accidental, criminal o terrorista)</p>\n<p style="text-align: justify;">5.4El EB realizara la vulnerabilidad que la planta presenta con respecto a la amenaza encontrada, evaluando el impacto de esa amenaza en la empresa.</p>\n<p style="text-align: justify;">&nbsp;5.5Una vez realizado estos pasos se contin&uacute;a a realizar la calificaci&oacute;n de riesgo determinando la gravedad y probabilidad de los hallazgos encontrados.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: center;"><strong>GRAVEDAD X PROBABILIDAD= RIESGO</strong></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.6Se determinar&aacute; el grado de gravedad de acuerdo a la clasificaci&oacute;n descrita en el Anexo 1.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.7Para el caso de la probabilidad se determinara de acuerdo al n&uacute;mero de c&iacute;rculos de seguridad que el &aacute;rea presente y se calificara de acuerdo a la clasificaci&oacute;n descrita en el Anexo 1.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.8Determinado estos dos valores se realiza la determinaci&oacute;n del nivel riesgo de acuerdo a la matriz Anexo 1.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;<strong><span style="text-decoration: underline;">GRAVEDAD</span></strong></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">*<strong>Catastr&oacute;fica</strong>- Colapso total del negocio, muerte.</p>\n<p style="text-align: justify;">*<strong>Cr&iacute;tica-</strong> Degradaci&oacute;n mayor del negocio, da&ntilde;os y enfermedad grave.</p>\n<p style="text-align: justify;">*<strong>Moderada-</strong> Degradaci&oacute;n menor del negocio, da&ntilde;os o enfermedad menor.</p>\n<p style="text-align: justify;">*<strong>Insignificante</strong>- Menos que degradaci&oacute;n menor del negocio, menos que da&ntilde;os o enfermedades menores.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><span style="text-decoration: underline;"><strong>&nbsp; PROBABILIDAD</strong></span></p>\n<p style="text-align: justify;">* &nbsp;<strong>Frecuente</strong>- Ocurren muchas veces, la poblaci&oacute;n est&aacute; continuamente expuesta.</p>\n<p style="text-align: justify;">* &nbsp;<strong>Probable</strong>- Ocurre varias veces; la poblaci&oacute;n est&aacute; regularmente expuesta.</p>\n<p style="text-align: justify;">* &nbsp;<strong>Ocasional</strong>- Ocurrir&aacute;; ocurre espor&aacute;dicamente en una poblaci&oacute;n.</p>\n<p style="text-align: justify;">* &nbsp;<strong>Raramente</strong>-Puede ocurrir; rara vez ocurre en una poblaci&oacute;n.</p>\n<p style="text-align: justify;">* &nbsp;<strong>Poco Probable</strong>-Tan inesperado que se puede asumir que nunca ocurrir&aacute;; ocurre muy raramente en una poblaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4Una vez determinado el nivel de riesgos se realizara la evaluaci&oacute;n del hallazgo para determinar los controles a implementar, los cuales se presentaran al comit&eacute; gerencial de la planta los cuales determinaran la fecha de finalizaci&oacute;n para la soluci&oacute;n de hallazgos.</p>', '<p>N/A</p>', '<p><strong>1.- CALIFICACI&Oacute;N DEL RIESGO</strong></p>\n<p><img src="source/yuri.png" alt="" width="592" height="389" /></p>', ''),
(207, 'A', 'Aprobación', '19/08/2014', '<p style="text-align: justify;">Asegurar la satisfacci&oacute;n del cliente mediante la atenci&oacute;n apropiada de Consumidores que presenta quejas relacionadas con la calidad y/o inocuidad de los productos elaborados por Procesa, no incluye el seguimiento acerca de contactos con el consumidor relacionados con promociones, distribuci&oacute;n ubicaci&oacute;n y/o precios de los mismos.</p>', '<p>Este procedimiento aplica &uacute;nicamente a los productos elaborados y/o comercializados por Procesa.</p>', '<p style="text-align: justify;"><strong>ATENCI&Oacute;N AL CLIENTE:</strong> Es el conjunto de actividades interrelacionadas que ofrece un suministro con el fin de que el cliente obtenga el producto en el momento y lugar adecuado y se asegure que se le d&eacute; el uso correcto del mismo.</p>\n<p style="text-align: justify;"><strong>CONSUMIDOR:</strong> Persona o conjunto de personas que satisface sus necesidades mediante el uso de los bienes y servicios generados en el proceso productivo. Este es el cliente final.</p>\n<p style="text-align: justify;"><strong>CLIENTE:</strong> Es quien accede a un producto o servicio por medio de una transacci&oacute;n financiera (dinero) u otro medio de pago.</p>\n<p style="text-align: justify;"><strong>&nbsp;ENCUESTA:</strong> Investigaci&oacute;n que se lleva a cabo para obtener informaci&oacute;n de retorno, tanto positiva como negativa de los clientes.</p>\n<p style="text-align: justify;"><strong>RECLAMACION:</strong> es una expresi&oacute;n de insatisfacci&oacute;n cuando no se cumple con las especificaciones del producto o cuando el producto presenta condiciones no seguras para el consumidor.</p>\n<p style="text-align: justify;"><strong>&nbsp;DUDA:</strong> es una&nbsp;expresi&oacute;n deindeterminaci&oacute;n de un cliente entre dos juicios con respecto al producto.</p>\n<p style="text-align: justify;"><strong>&nbsp;SUGERENCIA:</strong> es una expresi&oacute;n de propuesta hecha por el cliente para una determinada presentaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>', '<p style="text-align: justify;">5.1Las Recepci&oacute;n de reclamaciones, sugerencias y/o dudas ser&aacute;n clasificadas en:</p>\n<p style="text-align: justify;">a) Calidad.</p>\n<p style="text-align: justify;">b) Inocuidad.</p>\n<p style="text-align: justify;">5.2&nbsp;El cliente y/o consumidor se comunicar&aacute; a PROCESA mediante alguno de los siguientes medios:</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">a)&nbsp;&nbsp;&nbsp; Tel&eacute;fono al 01 800.</p>\n<p style="text-align: justify;">b)&nbsp;&nbsp;&nbsp; Internet.</p>\n<p style="text-align: justify;">c)&nbsp;&nbsp;&nbsp; Personal de Ventas.</p>\n<p style="text-align: justify;">d)&nbsp;&nbsp;&nbsp; Llamando directamente a nuestras oficinas.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.3El ing. de anal&iacute;tica e inocuidad recibir&aacute; la llamada y&nbsp; escuchar&aacute; las inquietudes de los clientes y/o consumidor, y registrando la informaci&oacute;n del cliente&nbsp; como nombre, direcci&oacute;n&nbsp; tel&eacute;fono, lote de producto y causa de la llamada en la base de quejas 2014 ubicada en el&nbsp; siguiente link: <a href="https://procesa.sharepoint.com/calidad/Atencion%20a%20Clientes/Forms/AllItems.aspx">https://procesa.sharepoint.com/calidad/Atencion%20a%20Clientes/Forms/AllItems.aspx</a></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.4&nbsp;La informaci&oacute;n obtenida ser&aacute; enviada electr&oacute;nicamente al jefe de calidad o Ing. de anal&iacute;tica e inocuidad para su seguimiento posterior.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.5Cuando la llamada sea solo para pedir informaci&oacute;n del producto el ing. de calidad e inocuidad consultar&aacute; el procedimiento de Atenci&oacute;n a Clientes y se le dar&aacute; respuesta al cuestionamiento.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.6Si la duda del cliente es referente a una reposici&oacute;n de producto, faltantes, distribuci&oacute;n del producto, la llamada se canaliza al jefe de calidad o ing de anal&iacute;tica e inocuidad. Este seguimiento lo registrara en la base de datos que se encuentra en el share point.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.7Si la llamada es referente a promociones o ventas, se canaliza al Gerente de comercializaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.8Si la queja recibida es por cuestiones de calidad o inocuidad en el producto, defecto o desempe&ntilde;o, se deber&aacute; enviar la informaci&oacute;n capturada mediante correo electr&oacute;nico o contactar por tel&eacute;fono a los siguientes destinatarios: jefe de Calidad, Ingeniero de Anal&iacute;tica e Inocuidad.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.9El ingeniero en anal&iacute;tica e inocuidad debe rastrear la clave del producto e identificar la posible causa ra&iacute;z.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El ingeniero en anal&iacute;tica e inocuidad que da seguimiento a la queja debe contactar al consumidor, verificar cu&aacute;l fue el motivo de la queja, llenar la base de datos.&nbsp; Se debe dar una explicaci&oacute;n al consumidor de la posible causa del problema y si es necesario pedir ayuda al Departamento de I+D de la compa&ntilde;&iacute;a para despejar cualquier duda del consumidor.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Se le ofrece reposici&oacute;n del producto al consumidor. Si &eacute;ste acepta, el responsable de dar seguimiento a la queja, entrega el paquete al &aacute;rea de compras, llevando este un marbete donde se indique la direcci&oacute;n completa del cliente para que este env&iacute;e por mensajer&iacute;a y junto con ello se env&iacute;a la carta de agradecimiento al consumidor.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Si se requiere an&aacute;lisis o recolecci&oacute;n del producto, se le informa al consumidor que se enviar&aacute; una gu&iacute;a pre pagada por mensajer&iacute;a con una carta de instrucciones para que en el sobre anexo se mande el producto a la planta. El responsable de seguimiento de la queja debe asegurarse de la ejecuci&oacute;n de esta acci&oacute;n y de las actividades relacionadas hasta la obtenci&oacute;n de la muestra, Adem&aacute;s de realizar la recopilaci&oacute;n de los datos del lote implicado.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Se verifica el problema y se le comunica al jefe de aseguramiento de calidad para que se definan las causas de dicha desviaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Se informa al &aacute;rea de producci&oacute;n, o el &aacute;rea respectiva donde se origin&oacute; el problema los cuales tendr&aacute;n que generar una acci&oacute;n correctiva con el fin de evitar una nueva incidencia y se audita esta acci&oacute;n 30 d&iacute;as despu&eacute;s de su implementaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Si el defecto del producto es de calidad, verifica el lote de producci&oacute;n, se valora si el defecto fue puntual o implica toda la fabricaci&oacute;n o m&aacute;s lotes para en caso necesario hacer una recall del producto.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Se eval&uacute;a con la Gerencia de Aseguramiento de Calidad y Direcci&oacute;n de Operaciones si es necesario un recall del producto.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Si la queja recibida implica la muerte o enfermedad grave, debe de contactar v&iacute;a telef&oacute;nica al jefe de Aseguramiento de Calidad y enviar datos del consumidor v&iacute;a correo electr&oacute;nico.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El responsable de dar seguimiento a la queja debe hablar inmediatamente al consumidor para conocer la situaci&oacute;n y tener m&aacute;s elementos para dar seguimiento efectivo.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.19&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Se debe de comunicar inmediatamente al Director operaciones en caso de riesgos de demanda o involucramiento de medios de comunicaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Si se confirma que el producto caus&oacute; la muerte o enfermedad:</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.20.1&nbsp; Se informa al Director General para realizar un Recall del producto de manera inmediata. S&oacute;lo el Director General puede autorizar la realizaci&oacute;n de un Recall de producto, conforme al procedimiento de Retiro.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.20.2&nbsp; Se realiza el rastreo y recall del producto siguiendo el procedimiento de Retiro PR-RT-001-A y procedimiento de Trazabilidad. (PR-TR-001-A)</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.20.3&nbsp; Se debe de afrontar la demanda cuando &eacute;sta proceda y tenga sustento cient&iacute;fico.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.20.4&nbsp; Se elaborar&aacute; un reporte del incidente de Calidad y se eval&uacute;a su costo.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.20.5&nbsp;En caso de que se determine que el producto no es el causante del da&ntilde;o al consumidor:&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.20.5.1&nbsp;&nbsp;&nbsp;&nbsp; Se informa del resultado al consumidor sin proporcionarle copias de informes ni escritos. Solo se podr&aacute;n proporcionar copias o documentos con la autorizaci&oacute;n del Director General.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p>5.20.5.2&nbsp;&nbsp;&nbsp;&nbsp; En caso de ser necesario, se le hace saber al quejoso que cualquier querella o infundio ser&aacute; respondido legalmente y que se ha llegado al t&eacute;rmino de las averiguaciones pertinentes para el seguimiento a su queja.</p>\n<p>&nbsp;</p>\n<p>5.20.6&nbsp;A las cuatro semanas de haber recibido la llamada por parte del consumidor quejoso, el Ing. de anal&iacute;tica e inocuidad debe llamarlo para conocer su punto de vista en relaci&oacute;n a la respuesta que le dieron y si sigue consumiendo nuestros productos</p>\n<p>&nbsp;</p>\n<p>5.20.7&nbsp;Se completar&aacute; la base de datos de Quejas del Consumidor con la informaci&oacute;n anterior, la cual se comunicar&aacute; al grupo HACCP. Y determinar&aacute; junto con el grupo las acciones para desarrollar un plan de Mejora Continua al proceso.</p>\n<p><img style="undefined" src="source/DIAGRAMA 1.png" alt="" width="888" height="954" /></p>\n<p>&nbsp;</p>\n<p><img src="source/DIAGRAMA 2.png" alt="" width="890" height="1043" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '<p>ISO 9001:2008</p>\n<p>FSSC 22000: 2010&nbsp;</p>\n<p>PR-RT-001-A Retiro</p>\n<p>PR-TR-001-A Trazabilidad&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', '<p>N/A</p>', ''),
(209, 'A', 'Edición', '20/08/2014', '<p style="text-align: justify;">Monitorear la calidad e inocuidad de las materias primas y producto semiterminado para la verificaci&oacute;n de su cumplimiento a trav&eacute;s de una programaci&oacute;n de an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos.</p>', '<p style="text-align: justify;">Este documento aplica toda vez que se realice muestreo para an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos.</p>', '<p style="text-align: justify;"><strong>CALIDAD:</strong> Grado de excelencia que posee un producto.&nbsp; Un producto ser&aacute; de buena calidad cuando cubra los requisitos establecidos por el cliente, re&uacute;na las caracter&iacute;sticas esperadas por los consumidores, se acoja a la legislaci&oacute;n vigente e incorpore a lo largo del tiempo todas las nuevas y cambiantes exigencias.</p>\n<p style="text-align: justify;"><strong>INOCUO:</strong> Aquello que no hace o causa da&ntilde;o a la salud.</p>\n<p style="text-align: justify;"><strong>MICROBIOLOGIA:</strong> Ciencia que trata de los seres vivos muy peque&ntilde;os, concretamente de aquellos cuyo tama&ntilde;o se encuentra por debajo del poder resolutivo del ojo humano.</p>\n<p style="text-align: justify;"><strong>MUESTRA</strong>: N&uacute;mero total de unidades provenientes de un lote y que representan las caracter&iacute;sticas y condiciones del mismo.</p>\n<p style="text-align: justify;"><strong>PLAN O PROGRAMA DE MUESTREO:</strong> La toma de muestra no s&oacute;lo es el procedimiento de tomar un n&uacute;mero determinado de muestras, su objetivo es suministrar informaci&oacute;n sobre las caracter&iacute;sticas microbiol&oacute;gicas o fisicoqu&iacute;micas del producto. As&iacute;, despu&eacute;s del an&aacute;lisis de esas unidades de muestra, se obtienen resultados que se confrontar&aacute;n con determinados criterios o especificaciones oficialmente reconocidas, que permiten decidir si el lote debe aceptarse o rechazarse.</p>\n<p style="text-align: justify;">Toma de muestras:Es el acto de separar de una partida determinada, una muestra representativa, a efectos de determinar mediante an&aacute;lisis organol&eacute;ptico y/o de laboratorio la aptitud o no del alimento puesto a consideraci&oacute;n. Plan de muestreo es un criterio de aceptaci&oacute;n del punto de vista microbiol&oacute;gico para un determinado lote de alimento. Para elegir un plan de muestreo se tiene en cuenta:</p>\n<p style="text-align: justify;">1. la peligrosidad del microorganismo.</p>\n<p style="text-align: justify;">2. la cantidad de microorganismos presentes en el alimento.</p>\n<p style="text-align: justify;">3. las condiciones que ser&aacute; sometido el alimento antes de consumir.</p>\n<p style="text-align: justify;">4. la poblaci&oacute;n que va a consumir ese alimento.</p>', '<p style="text-align: justify;">5.1 El ingeniero en Anal&iacute;tica e Inocuidad deber&aacute; verificar la calendarizaci&oacute;n de los an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos de las materias primas y productos semiterminado insumos apoy&aacute;ndose en el cronograma de muestreo (FO-AI-001-A).</p>\n<p style="text-align: justify;">5.2 El ingeniero en Anal&iacute;tica e Inocuidad, coordinar&aacute; &eacute;l envi&oacute; de muestras al laboratorio externo.</p>\n<p style="text-align: justify;">5.3. El ingeniero en Anal&iacute;tica e Inocuidad dar&aacute; seguimiento del an&aacute;lisis e informes de resultados emitidos por el laboratorio externo, comparando dichos resultados con los l&iacute;mites establecidos seg&uacute;n las especificaciones que apliquen al producto en cuesti&oacute;n (<em>ver Especificaciones de cada materia prima y producto semiterminado</em>).</p>\n<p style="text-align: justify;">5.4 De encontrarse los resultados del informe de an&aacute;lisis dentro de especificaciones, deber&aacute;n guardarse en la carpeta correspondiente.&nbsp; De lo contrario el producto ser&aacute; rechazado y se deber&aacute; informarse al responsable del &aacute;rea en cuesti&oacute;n para que recabe la informaci&oacute;n necesaria y realice un an&aacute;lisis de la desviaci&oacute;n, determinando las causas que llevaron a estos resultados.&nbsp; Si la investigaci&oacute;n demuestra que el producto no pas&oacute; por un proceso posterior que normaliz&oacute; la calidad y/&oacute; inocuidad del mismo, se proceder&aacute; a retener todo el producto considerado como sospechoso, adem&aacute;s de realizar un informe en el cual se buscar&aacute; la normalizaci&oacute;n del proceso o de ser posible aplicar un nuevo control durante la elaboraci&oacute;n del producto laboratorio.</p>\n<p>&nbsp;</p>', '<p>NOM-127-SSA1-1994 salud ambiental, agua para uso y consumo humano l&iacute;mites permisibles de calidad y tratamientos a que debe someterse el agua para su potabilizaci&oacute;n.</p>\n<p>NOM-130-SSA1-1995 alimentos envasados en recipientes de cierre herm&eacute;tico y sometido a tratamiento t&eacute;rmico. Disposiciones y especificaciones sanitarias.</p>\n<p>NOM-251-SSA1-2009, Pr&aacute;cticas de higiene para el proceso de alimentos, bebidas o suplementos alimenticios</p>\n<p>NOM-242-SSA1-2009, Productos y servicios. Productos de la pesca frescos, refrigerados, congelados y procesados. Especificaciones sanitarias y m&eacute;todos de prueba.</p>', '<p>N/A</p>', '');
INSERT INTO `plantilla_completa` (`id_documento`, `rev`, `estado`, `fecha`, `objetivo`, `alcance`, `definiciones`, `desarrollo`, `referencias`, `anexos`, `revision`) VALUES
(210, 'A', 'Edición', '20/08/2014', '<p style="text-align: justify;">Verificar las especificaciones del producto semiterminado y terminado para su distribuci&oacute;n y venta.&nbsp;</p>', '<p style="text-align: justify;">Este documento aplica para cada lote de producci&oacute;n elaborado en Procesa.</p>', '<p><strong>Autoridad de proceso</strong>: Es la persona encargada de validar que los proceso t&eacute;rmicos realizados sean los correctos para lograr una inocuidad en el producto.</p>\n<p>&nbsp;<strong>Cuarentena:</strong> retenci&oacute;n temporal de las muestras representativas de los productos bajo condiciones de tiempo y temperatura establecidas para verificar la esterilidad comercial de los mismos.</p>\n<p><strong>Evaluaci&oacute;n sensorial</strong>: Es el an&aacute;lisis de los alimentos realizada a trav&eacute;s de los sentidos.</p>\n<p><strong>Grado de Calidad:</strong> Se traduce en los requisitos&nbsp; que debera cumplir un lote a traves de los parametros de&nbsp; evaluacion sensorial y fisicoquimicos del producto terminado, obteneniendo una calificacion de&nbsp; 85-100%.</p>\n<p><strong>&nbsp;Inspeccion:</strong> Es el proceso de verificar, revisar e informar el estado de los lotes que hayan cumplido con el per&iacute;odo de cuarentena, para su posterior liberaci&oacute;n o rechazo del mismo.</p>\n<p><strong>&nbsp;Liberaci&oacute;n:</strong> consiste&nbsp; en dar&nbsp; por bueno un lote,&nbsp; cumpliendo con los parametros de&nbsp; calidad e inocuidad.</p>\n<p><strong>&nbsp;Lotes de producci&oacute;n:</strong> cantidad de producto elaborado en un mismo lapso para garantizar su homogeneidad.</p>\n<p><strong>&nbsp;pH:</strong> Es una <span style="color: #000000;">medida de&nbsp;<a href="http://es.wikipedia.org/wiki/Acidez"><span style="color: #000000;">acidez</span></a>&nbsp;o&nbsp;<a href="http://es.wikipedia.org/wiki/Base_(qu%C3%ADmica)"><span style="color: #000000;">alcalinidad</span></a>&nbsp;de una&nbsp;<a href="http://es.wikipedia.org/wiki/Disoluci%C3%B3n"><span style="color: #000000;">disoluci&oacute;n</span></a>.</span> El&nbsp; pH en fase acuosa se define como el logaritmo negativo de la actividad del ion hidrogeno (prot&oacute;n hidratado:&nbsp; pH = -log [H<sup>+</sup>].</p>\n<p><strong>&nbsp;Penetraci&oacute;n de calor:</strong> en alimentos es definida como el cambio de la temperatura en un determinado punto del producto, en virtud de la influencia de la temperatura de los puntos vecinos&nbsp; del mismo.</p>', '<p>EVALUACI&Oacute;N SENSORIAL, FISICOQU&Iacute;MICOS Y GRADO CLIENTE</p>\n<p>&nbsp;</p>\n<p>a)&nbsp;&nbsp;&nbsp; El personal del &aacute;rea de esterilizado realizar&aacute; el muestreo de 5 piezas del punto fr&iacute;o por cada ciclo de producci&oacute;n y estas piezas ser&aacute;n enviadas al laboratorio de Calidad al siguiente d&iacute;a de la producci&oacute;n para realizar su an&aacute;lisis.</p>\n<p>&nbsp;</p>\n<p>b)&nbsp;&nbsp;&nbsp; El analista de laboratorio con base a las especificaciones de producto terminado realizar&aacute; la evaluaci&oacute;n sensorial as&iacute; como tambi&eacute;n analizar&aacute; los par&aacute;metros fisicoqu&iacute;micos de contenido neto y masa drenada (seg&uacute;n IT-LB-006-A), porcentaje de trozos (IT-LB-007-A), presencia de defectos de calidad (espinas, escamas, carne negra, piel) y porcentaje de cloruro de sodio (evaluar en dos piezas de producto terminado por cada ciclo de producci&oacute;n de acuerdo al procedimiento de Verificaci&oacute;n de materia prima y producto semiterminado PR-AI-001-A. El rango l&iacute;mite de cloruros&nbsp;&nbsp; aceptados para cada presentaci&oacute;n ser&aacute; de acuerdo al anexo 1.</p>\n<p>&nbsp;</p>\n<p>c)&nbsp;&nbsp;&nbsp; Para determinar el grado de cliente el t&eacute;cnico de calidad e inocuidad deber&aacute; considerar los resultados obtenidos de la evaluaci&oacute;n sensorial y fisicoqu&iacute;mica reduciendo puntaje de un valor inicial de 100 puntos de acuerdo a lo descrito en el instructivo de trabajo de determinaci&oacute;n del grado cliente del producto semiterminado IT-LB-013-A.</p>\n<p>&nbsp;</p>\n<p>d)&nbsp;&nbsp;&nbsp; El t&eacute;cnico en calidad e inocuidad deber&aacute; registrar estos resultados en el formato An&aacute;lisis Sensorial y Fisicoqu&iacute;mico del producto terminado (FO-AI-003-A) y determinar el grado cliente, considerando que el grado m&iacute;nimo aprobatorio es de 85%.</p>\n<p>&nbsp;</p>\n<p>INSPECCI&Oacute;N DE DEFECTOS DE SELLOS Y CONTENIDO NETO</p>\n<p>&nbsp;</p>\n<p>a)&nbsp;&nbsp;&nbsp; El operario del&nbsp; &aacute;rea de acondicionado &nbsp;asignado para el monitoreo de defectos de sello y contenido neto es el responsable de realizar el muestreo y registrar los datos en el sistema de conformidad de microholding FO-RX-001-A&nbsp; y sistema de conformidad de verificaci&oacute;n de pesos FO-RX-003-A.</p>\n<p>&nbsp;</p>\n<p>&nbsp;DETERMINACI&Oacute;N DE pH DE PRODUCTO</p>\n<p>&nbsp;</p>\n<p>1)&nbsp;&nbsp;&nbsp; SIN INCUBACI&Oacute;N</p>\n<p>&nbsp;</p>\n<p>a)&nbsp;&nbsp;&nbsp; El analista de laboratorio realizar&aacute; la determinaci&oacute;n de pH al d&iacute;a siguiente de la fabricaci&oacute;n por cada lote producido y registrar&aacute; el resultado en el formato DE Analisis sensorial y Fisicoquimico de Producto terminado FO-AI-003-A</p>\n<p>b)&nbsp;&nbsp;&nbsp; El Ingeniero en Anal&iacute;tica e Inocuidad revisar&aacute; el cumplimiento de los resultados y lo integrar&aacute; en la base de liberaci&oacute;n de producto FO-AI-004-A.</p>\n<p>&nbsp;</p>\n<p>2)&nbsp;&nbsp;&nbsp; CON INCUBACI&Oacute;N</p>\n<p>&nbsp;a)&nbsp;&nbsp;&nbsp; El analista de laboratorio realizar&aacute; la incubaci&oacute;n de 3 piezas de producto&nbsp; por cada ciclo de producci&oacute;n durante 10&nbsp; d&iacute;as a una temperatura entre 35 &nbsp;y 37 &deg;C.</p>\n<p>b)&nbsp;&nbsp;&nbsp; Despu&eacute;s del tiempo de incubaci&oacute;n el analista de laboratorio&nbsp; determinar&aacute; el pH y realizar&aacute; evaluaci&oacute;n sensorial del producto semiterminado.</p>\n<p>c)&nbsp;&nbsp;&nbsp; El&nbsp; analista de laboratorio deber&aacute; registrar los resultados obtenidos de pH y evaluaci&oacute;n sensorial en el formato An&aacute;lisis de pH en el producto semiterminado (FO-AI-006-A), determinando si Cumple o No, asegurando el cumplimiento de las especificaciones del producto&nbsp; de acuerdo al anexo 1.</p>\n<p>d)&nbsp;&nbsp;&nbsp; El Ingeniero en Anal&iacute;tica e Inocuidad deber&aacute; revisar todos los resultados obtenidos por el laboratorio y asegurar el cumplimiento registrando los datos en la base de liberaci&oacute;n de producto. FO-AI-004-A</p>\n<p>&nbsp;</p>\n<p>VERIFICACI&Oacute;N DE LOS PUNTOS CR&Iacute;TICOS DE CONTROL</p>\n<p>&nbsp;</p>\n<p>PCC 1. Histamina.</p>\n<p>El ingeniero de procesos revisar&aacute; que los l&iacute;mites cr&iacute;ticos de histamina del pescado procesado durante el d&iacute;a de producci&oacute;n se encuentren en cumplimiento registrando los datos en la base de liberaci&oacute;n de producto.</p>\n<p>PCC 2.&nbsp; SELLADO</p>\n<p>El ingeniero de procesos deber&aacute; verificar el cumplimiento del sistema&nbsp; de conformidad&nbsp; de envasado FO-EN-001-A verificando los resultados de los defectos de acuerdo&nbsp; a los instructivos de trabajo de envasado, asegurando el cumplimiento, firmando de conformidad los registros e integrando los resultados en la base de liberaci&oacute;n de producto.</p>\n<p>PCC3. ESTERILIZADO</p>\n<p>El Ingeniero de procesos t&eacute;rmicos deber&aacute; realizar la Revisi&oacute;n de los gr&aacute;ficos de esterilizado del producto, verificando que cumpla con los par&aacute;metros autorizados para cada presentaci&oacute;n de acuerdo a lo descrito en programaci&oacute;n de equipos autoclaves (FO-PT-003-A) de cada presentaci&oacute;n.</p>\n<p>El Ingeniero de procesos t&eacute;rmicos deber&aacute; registrar los resultados en el sistema de conformidad de esterilizado&nbsp; (FO-PT-002-A) e integrarlo a la base de liberaci&oacute;n de producto.</p>\n<p>PCC4. RAYOS X</p>\n<p>El ingeniero de procesos deber&aacute; revisar el cumplimiento del sistema de conformidad&nbsp; de Rayos X, FO-RX-002-A, al d&iacute;a siguiente de la fabricaci&oacute;n, as&iacute; como los hallazgos encontrados del producto retenido para asegurar que el material extra&ntilde;o encontrado no sea un peligro potencial firmando de conformidad todos los registros obtenidos de cada d&iacute;a de fabricaci&oacute;n. Los resultados deber&aacute;n ser integrados en la base de liberaci&oacute;n de producto.</p>\n<p>&nbsp;</p>\n<p>CONDICIONES DE PROCESO</p>\n<p>&nbsp;El ingeniero de procesos revisar&aacute; diariamente los Sistemas de conformidad del proceso para asegurar que toda la fabricaci&oacute;n cumpli&oacute; con las especificaciones y deber&aacute; firmar de conformidad generando una calificaci&oacute;n por cada registro y deber&aacute; concentrar los resultados en la base de liberaci&oacute;n de producto para su env&iacute;o al Jefe de Aseguramiento de Calidad y al Ing. En anal&iacute;tica e inocuidad para su dictamen de liberaci&oacute;n o rechazo.</p>\n<p>&nbsp;</p>\n<p>DICTAMEN DE PRODUCTO TERMINADO</p>\n<p>&nbsp;El ingeniero en anal&iacute;tica e inocuidad deber&aacute; actualizar diariamente la base de liberaci&oacute;n de producto FO-AI-004-A en el share point.</p>\n<p>El Jefe de Aseguramiento de Calidad deber&aacute; revisar los resultados obtenidos de cada lote fabricado y emitir el dictamen con base a las especificaciones de producto e informar al &aacute;rea de Operaciones.</p>', '<p>NOM-002-SCFI-1993. Norma Oficial Mexicana productos preenvasados contenido neto tolerancias y m&eacute;todos de verificaci&oacute;n.</p>\n<p>NOM-084-SCFI-1994, Informaci&oacute;n comercial.- Especificaciones de informaci&oacute;n comercial y sanitaria para productos de at&uacute;n y bonita pre envasados.&nbsp; &nbsp;</p>\n<p>NMX-F-315-1978. Determinaci&oacute;n de la masa drenada o escurrida en alimentos envasados.</p>\n<p>NMX-F-317-S-1978. Determinaci&oacute;n&nbsp; pH en alimentos.</p>\n<p>NMX-F-220-1982 Alimentos para uso humano, pesca, at&uacute;n y pescado similares en aceite enlatados.</p>\n<p>ACRM-E008 Clasificaci&oacute;n de defectos de pouch en producto terminado.</p>\n<p>TABLAS MIL-STD-105 D. Tabla para Inspecci&oacute;n por atributos.</p>\n<p>NOM-130-SSA1-1995, Bienes y servicios. Alimentos envasados en recipientes de cierre herm&eacute;tico y sometido a tratamiento t&eacute;rmico. Disposiciones y especificaciones sanitarias.</p>', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="source/phok.png" alt="" width="604" height="439" /></p>', ''),
(211, 'A', 'Edición', '20/08/2014', '<p style="text-align: justify;">Verificar la calidad de los servicios que se proporcionan a la Planta Procesa y al &aacute;rea proceso de producci&oacute;n.</p>', '<p>Este documento aplica toda vez que se realice an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos de agua.</p>\n<p>&nbsp;</p>', '<p><strong>CPRE</strong> Coordinador del prerrequisito.</p>\n<p><strong>&nbsp;AGUA DURA:</strong> Cuando el agua contiene una cantidad significante de calcio y magnesio.</p>\n<p>&nbsp;<strong>AGUA SUAVIZADA</strong>: Agua libre de iones Calcio y Magnesio.</p>\n<p><strong>&nbsp;SUAVIZADOR:</strong> Unidad que se utiliza para ablandar el agua, eliminando minerales que hacen que dicha agua sea dura.</p>\n<p>&nbsp;<strong>RETROLAVADO O REGENERADO</strong>: Limpieza del filtro mediante el flujo inverso de agua.</p>\n<p><strong>&nbsp;AIRE COMPRIMIDO</strong>:Se denomina comprimido el aire que se encuentra a una presi&oacute;n superior a la atmosf&eacute;rica; esta condici&oacute;n del aire se obtiene mediante bombas o compresores. El empleo del aire comprimido es principalmente en las f&aacute;bricas para el accionamiento de las m&aacute;quinas.</p>\n<p><strong>&nbsp;VAPOR</strong>:El vapor de agua es un gas que se obtiene por evaporaci&oacute;n o ebullici&oacute;n del agua l&iacute;quida. Es inodoro e incoloro y, a pesar de lo que pueda parecer. El vapor de agua se usa como transmisor de calor en la industria, generado principalmente por calderas.</p>\n<p><strong>&nbsp;AIRE ACONDICIONADO:</strong> es el proceso que se considera m&aacute;s completo de tratamiento del aire ambiente de los locales habitados; consiste en regular las condiciones en cuanto a la temperatura<span style="color: #000000;"> (<a href="http://es.wikipedia.org/wiki/Calefacci%C3%B3n"><span style="color: #000000;">calefacci&oacute;n</span></a> o <a href="http://es.wikipedia.org/wiki/Refrigeraci%C3%B3n"><span style="color: #000000;">refrigeraci&oacute;n</span></a>), <a href="http://es.wikipedia.org/wiki/Humedad"><span style="color: #000000;">humedad</span></a>, limpieza (renovaci&oacute;n, filtrado) y el movimiento del aire adentro de los locales.</span></p>\n<p>&nbsp;</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>', '<p><strong>5.1SUMINISTRO DE AGUA</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><a name="OLE_LINK2"></a><a name="OLE_LINK1"></a>La planta Procesa se abastece de agua potable de la red municipal.</p>\n<p>&nbsp;5.1.1 El agua antes de ser distribuida a toda la planta debe cumplir con lo especificado en el procedimiento Tratamiento de Agua PR-MT-004-A.</p>\n<p>&nbsp;5.1.2 El Jefe de mantenimiento debe asegurar que todas las tuber&iacute;as deben estar debidamente identificadas con un color de acuerdo al uso que se le da, como se indica en el C&oacute;digo de Tuber&iacute;as FO-MT-020-A</p>\n<p>&nbsp;5.1.3 El Jefe de mantenimiento debe revisar y asegurar que en la planta no haya contra flujo o conexiones cruzadas entre los diferentes sistemas de tuber&iacute;as. As&iacute; como verificar que no exista fuga de agua en grifos o tuber&iacute;as localizadas en la empresa.</p>\n<p>&nbsp;5.1.4 Los puntos 5.1.2, 5.1.3 deben estar contenidos en el layout de la planta que est&aacute; bajo el cargo del Jefe de mantenimiento.</p>\n<p>&nbsp;El CPRE y el responsable de control de Calidad deben verificar que lo siguiente se cumpla:</p>\n<p><strong>&nbsp;</strong>5.1.5 Personal de mantenimiento realiza determinaciones diarias de la calidad fisicoqu&iacute;mica del agua. Y lo registra en el formato FO-MT-007-A.</p>\n<p>&nbsp;5.1.6 El ingeniero de proceso debe evaluar al cambio de cada presentaci&oacute;n el agua utilizada para la preparaci&oacute;n de l&iacute;quidos de cobertura que no contengan cloro residual y lo documentar&aacute; en el sistema de conformidad preparaci&oacute;n de l&iacute;quidos sin vitaminas y con vitaminas FO-PL-001-A.</p>\n<p>&nbsp;5.1.7 el personal del &aacute;rea de descongelado debe evaluar la concentraci&oacute;n del cloro del agua diariamente utilizada para descongelar la materia prima y deber&aacute; registrar los datos en el sistema de conformidad &aacute;rea de descongelado de pescado entero FO-DE-001-A.</p>\n<p><strong>&nbsp;</strong>5.1.6 Los an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos que se realizan al agua, se hacen de acuerdo al cronograma de muestreo establecido FO-AI-001-A.</p>\n<p>&nbsp;</p>\n<p>5.1.7 Revisi&oacute;n de filtros</p>\n<p><strong>&nbsp;</strong>5.1.7.1 Semanalmente personal de mantenimiento debe realizar los retrolavados y regenerados de los filtros y suavizadores seg&uacute;n corresponda ubicados en sala de maquinas y documentar la actividad como realizada en el formato de Monitoreo de Tratamiento de Agua FO-MT-007-A</p>\n<p>&nbsp;5.1.7.2 Para los filtros utilizados en sala de producci&oacute;n el Supervisor de sanidad debe llevar a cabo el lavado de los filtros de agua como se especifica en el procedimiento de Operaci&oacute;n Est&aacute;ndar de Sanidad PR-SA-001-A y se deber&aacute; registrar en el formato FO-SA-005-A Formato de inspecci&oacute;n preoperativa de las &aacute;reas de proceso.</p>\n<p>&nbsp;5.1.7.3 EL ingeniero de proceso revisar&aacute; diariamente el funcionamiento de la l&aacute;mpara UV y lo documentar&aacute; en el sistema de conformidad preparaci&oacute;n de l&iacute;quidos sin vitaminas y con vitaminas FO-PL-001-A .</p>\n<p>&nbsp;5.1.8.3 Para el de caso de las l&aacute;mparas UV, estas son revisadas de acuerdo al cronograma de mantenimiento preventivoFO-MT-001-A de adici&oacute;n de l&iacute;quidos&nbsp;<a name="OLE_LINK4"></a><a name="OLE_LINK3"></a>y se documenta en el formato Mantenimiento Preventivo Semanal de Linea de Producci&oacute;n FO-MT-017-A.</p>\n<p>&nbsp;5.1.8.4 El CPRE del verificar que los puntos 5.1.8.1,5.1.8.2 y 5.1.8.3 se realicen.</p>\n<p>&nbsp;</p>\n<p><strong>5.2 SUMINISTRO DE AIRE</strong></p>\n<p><strong>&nbsp;</strong><strong>5.2.1 Sistema de aire comprimido.</strong></p>\n<p>&nbsp;La planta de Procesa abastece aire comprimido a trav&eacute;s de dos compresores de aire que se utilizan de forma alterna.</p>\n<p>&nbsp;5.2.1.1 El aire comprimido antes de ser distribuida a toda la planta debe cumplir con lo especificado en el procedimiento de Unidades Manejadoras de Aire PR-MT-008-A.</p>\n<p>&nbsp;5.2.1.2 El Jefe de mantenimiento debe asegurar que todas las tuber&iacute;as deben estar debidamente identificadas con un color de acuerdo al uso que se le da, como se indica en el c&oacute;digo de colores de la planta procesa FO-MT-020-A.</p>\n<p>&nbsp;5.2.1.3 El Jefe de mantenimiento debe revisar y asegurar que en la planta no haya contra flujo o conexiones cruzadas entre los diferentes sistemas de tuber&iacute;as. As&iacute; como verificar que no exista fuga de aire en grifos o tuber&iacute;as localizadas en la empresa, de acuerdo a lo descrito en el lay out de tuber&iacute;as FO-MT-023-A.</p>\n<p>&nbsp;5.2.1.4 Los puntos 5.1.2, 5.1.3 deben estar contenidos en el layout de la planta que est&aacute; bajo el cargo del Jefe de mantenimiento.</p>\n<p>&nbsp;El CPRE y el responsable de control de Calidad de servicios deben verificar que lo siguiente se cumpla:</p>\n<p><strong>&nbsp;</strong>5.2.1.5 El Personal de mantenimiento realiza actividades de mantenimiento preventivo&nbsp; de acuerdo al cronograma FO-MT-001-A y se documenta mediante &oacute;rdenes de trabajo con folio FO-MT-003-A.</p>\n<p><strong>&nbsp;</strong>5.2.1.6 Los an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos que se realizan al aire comprimido, se hacen de acuerdo al cronograma de muestreo de la calidad de servicios establecido.</p>\n<p><strong>&nbsp;</strong></p>\n<p>5.2.1.7 Revisi&oacute;n de filtros</p>\n<p><strong>&nbsp;</strong>&nbsp;La revisi&oacute;n de los filtros se ejecutara de acuerdo&nbsp; a lo designado en las rutinas de mantenimiento para el sistema de aire comprimido establecido en el cronograma de mantenimiento preventivo FO-MT-001-A y &nbsp;se documenta en el formato DE Mantenimiento Preventivo semanal de compresores de aire FO-MT-12-A.</p>\n<p>&nbsp;</p>\n<p><strong>5.2.2 Sistema de aire acondicionado producci&oacute;n</strong>.</p>\n<p>&nbsp;La planta Procesa abastece aire acondicionado a la sala de producci&oacute;n a trav&eacute;s de dos climas de paquete de 20 TR cada uno.</p>\n<p>&nbsp;5.2.2.1 El aire acondicionado antes de ser distribuida a toda la planta se debe cumplir con lo especificado en el procedimiento PR-MT-001-A, unidades manejadoras de aire.</p>\n<p>&nbsp;El CPRE y el responsable de control de Calidad de servicios deben verificar que lo siguiente se cumpla:</p>\n<p><strong>&nbsp;</strong>5.2.2.2 El Jefe de mantenimiento debe asegurar que todos los ductos se encuentren en buen estado, para ello el personal de mantto realiza actividades de mantenimiento preventivo de acuerdo al cronograma FO-MT-001-A y se documenta mediante &oacute;rdenes de trabajo con folio FO-MT-003-A para los equipos unidades manejadoras de aire.</p>\n<p>&nbsp;<strong>&nbsp;</strong></p>\n<p>5.2.2.3 Los an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos que se realizan al aire ambiental, se hacen de acuerdo al cronograma de muestreo establecido.</p>\n<p><strong>&nbsp;</strong>5.2.2.4 Revisi&oacute;n de filtros</p>\n<p><strong>&nbsp;</strong>La revisi&oacute;n de los filtros se ejecutara de acuerdo a lo designado en las rutinas de mantenimiento para el sistema de aire acondicionado de los equipos de paquete.</p>\n<p>&nbsp;</p>\n<p><strong>5.3 SUMINISTRO DE VAPOR</strong></p>\n<p>&nbsp;La planta Procesa abastece vapor a trav&eacute;s de una caldera con capacidad de 150 C.C</p>\n<p>&nbsp;5.2.1.1 El vapor antes de ser distribuida a toda la planta, se debe cumplir con lo especificado en el procedimiento de operaci&oacute;n de calderas PR-MT-009-A.</p>\n<p>&nbsp;5.2.1.2 El Jefe de mantenimiento debe asegurar que todas las tuber&iacute;as deben estar debidamente identificadas con un color de acuerdo al uso que se le da, como se indica en el c&oacute;digo de Colores de tuber&iacute;as FO-MT-023-A.</p>\n<p>&nbsp;5.2.1.3 El Jefe de mantenimiento debe revisar y asegurar que en la planta no haya contra flujo o conexiones cruzadas entre los diferentes sistemas de tuber&iacute;as. As&iacute; como verificar que no exista fuga de vapor en grifos o tuber&iacute;as localizadas en la empresa.</p>\n<p>&nbsp;5.2.1.4 Los puntos 5.1.2, 5.1.3 deben estar contenidos en el layout de la planta FO-MT-025-A que est&aacute; bajo el cargo del Jefe de mantenimiento.</p>\n<p>&nbsp;El CPRE y el responsable de control de Calidad de servicios deben verificar que lo siguiente se cumpla:</p>\n<p><strong>&nbsp;</strong>5.2.1.5 El Personal de mantenimiento realiza actividades de mantenimiento preventivo&nbsp; de acuerdo al cronograma FO-MT-001-A y se documenta mediante &oacute;rdenes de trabajo con folio FO-MT-003-A.</p>\n<p><strong>&nbsp;</strong>5.2.1.6 Los an&aacute;lisis fisicoqu&iacute;micos y microbiol&oacute;gicos que se realizan al vapor, se hacen de acuerdo al cronograma de muestreo de la calidad de servicios establecido. FO-AI-001-A</p>\n<p><strong>&nbsp;</strong></p>', '<p>NOM-251-SSA1-2009, Pr&aacute;cticas de higiene para el proceso de alimentos, bebidas o suplementos alimenticios.</p>\n<p>MODIFICACION a la Norma Oficial Mexicana NOM-127-SSA1-1994, Salud ambiental. Agua para uso y consumo humano. L&iacute;mites permisibles de calidad y tratamientos a que debe someterse el agua para su potabilizaci&oacute;n<strong>.</strong></p>', '<p>N/A</p>', ''),
(219, 'A', 'Autorizado', '20/08/2014', '<p>Asegurar los conocimientos y habilidades que el personal necesita para poder elevar su productividad y nivel de vida de acuerdo a los lineamientos de la organizaci&oacute;n.</p>', '<p>&nbsp;Este documento aplica a todo el personal de Procesa.</p>', '<p><strong>CH:</strong> Capital Humano.</p>\n<p>&nbsp;<strong>DNC</strong>: Detecci&oacute;n de necesidades de capacitaci&oacute;n.</p>\n<p>&nbsp;<strong>CDT</strong>: Coordinador de Desarrollo y Talento</p>\n<p><strong>&nbsp;INDUCCION:</strong> Es la adquisici&oacute;n de conocimientos t&eacute;cnicos, te&oacute;ricos y pr&aacute;cticos que van a contribuir al desarrollo de los individuos en el desempe&ntilde;o de una actividad</p>\n<p><strong>&nbsp;CAPACITACI&Oacute;N:</strong> Es un proceso continuo de ense&ntilde;anza-aprendizaje, mediante el cual se desarrolla las habilidades y destrezas, que les permitan un mejor desempe&ntilde;o en sus labores habituales.</p>\n<p>&nbsp;<strong>DETECCION DE NECESIDADES</strong>: Proceso que permite conocer las deficiencias existentes en una empresa a fin de establecerlos objetivos y acciones a considerar en el plan.</p>\n<p><strong>&nbsp;CURSOS INTERNOS</strong>: Capacitaciones que se realizaran en planta con instructores internos y/o replicar los cursos recibidos de forma externa.</p>\n<p><strong>&nbsp;CURSOS EXTERNOS:</strong> Capacitaciones que se realizaran fuera de planta con proveedores externos.</p>\n<p>&nbsp;</p>', '<p style="text-align: justify;">El &nbsp;CDT elaborar&aacute; la DNCal personal de procesa anualmente.PR-CP-001-A</p>\n<p style="text-align: justify;">&nbsp;1.1.Se&nbsp; realizara la selecci&oacute;n de cursos de acuerdo a los resultados obtenidos en la elaboraci&oacute;n de DNC.</p>\n<p style="text-align: justify;">&nbsp;1.2.Se realizara la definici&oacute;n de cursos internos y externos de acuerdo a lo descrito en este procedimiento.</p>\n<p style="text-align: justify;">&nbsp;1.3.Se verificara con diversos proveedores los costos para cada evento de capacitaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;1.4.La Direcci&oacute;n de cada &aacute;rea a capacitar deber&aacute; dar la autorizaci&oacute;n del plan de capacitaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;1.5.Se realizara la ejecuci&oacute;n del plan de capacitaci&oacute;n autorizado.</p>\n<p style="text-align: justify;">&nbsp;1.6.Cada vez que exista un evento de capacitaci&oacute;n se realizara la selecci&oacute;n previa del instructor y del personal que asistir&aacute;.</p>\n<p style="text-align: justify;">&nbsp;1.7.Al t&eacute;rmino de la capacitaci&oacute;n se realizara las evaluaciones correspondientes. El personal ser&aacute; evaluado de acuerdo a los conocimientos obtenidos, y los participantes eval&uacute;an al evento de acuerdo contenido, cuando las capacitaciones sean realizadas por capacitadores externos. &nbsp;FO-CP-005-A</p>\n<p style="text-align: justify;">&nbsp;1.8.De ser acreditado el curso se realizaran las constancias de habilidades laborales los cuales se archivan en el expediente de colaborador capacitaci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;1.9.Posterior a cada capacitaci&oacute;n interna, se aplicar&aacute; una evaluaci&oacute;n para detectar si la exposici&oacute;n fue entendida.</p>\n<p style="text-align: justify;">&nbsp;1.10.En caso que la calificaci&oacute;n de la evaluaci&oacute;n sea inferior a 8.0, se programar&aacute; otra capacitaci&oacute;n para el personal.</p>\n<p style="text-align: justify;">&nbsp;1.11.La capacitaci&oacute;n en BPM deber&aacute; darse al personal, en&nbsp; periodos de 3 meses; o &nbsp;cuando suceda alguna modificaci&oacute;n en las regulaciones.</p>\n<p style="text-align: justify;">&nbsp;1.12.Todo evento de capacitaci&oacute;n externa ser&aacute; replicado de acuerdo al plan ROI de capacitaci&oacute;n. FO-CP-004-A</p>\n<p style="text-align: justify;">&nbsp;1.13.Dentro del proceso de capacitaci&oacute;n todo personal que ingrese a laborar a Procesa deber&aacute; de cumplir con su&nbsp; proceso de Inducci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;5.14Toda persona que ingresa a laborar a Procesa &nbsp;debe tener un proceso de inducci&oacute;n dependiendo del &aacute;rea y puesto. Por lo que se ha dividido en 3 tipos:</p>\n<p style="text-align: justify;">&nbsp;</p>\n<ul style="text-align: justify;">\n<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INDUCCION OPERATIVA</li>\n</ul>\n<p style="text-align: justify;">&nbsp;</p>\n<ul style="text-align: justify;">\n<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INDUCCION PLANTA</li>\n</ul>\n<p style="text-align: justify;">&nbsp;&nbsp;</p>\n<ul style="text-align: justify;">\n<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INDUCCION EJECUTIVA</li>\n</ul>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.15 La inducci&oacute;n operativa se le otorga a todos los operarios que se integrar&aacute;n a alg&uacute;n&nbsp; &aacute;rea de la planta y consiste en:</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Historia de Empresa</p>\n<p style="text-align: justify;">BPM&acute;S</p>\n<p style="text-align: justify;">HACCP b&aacute;sico</p>\n<p style="text-align: justify;">Pre-requisitos</p>\n<p style="text-align: justify;">Programa de Bioseguridad</p>\n<p style="text-align: justify;">Control de Al&eacute;rgenos</p>\n<p style="text-align: justify;">Control de Material Extra&ntilde;o</p>\n<p style="text-align: justify;">Higiene y Seguridad Industrial</p>\n<p style="text-align: justify;">Cultura Organizacional</p>\n<p style="text-align: justify;">Reglamento Interior de Trabajo</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Esta inducci&oacute;n se impartir&aacute; todos los viernes, y se realizar&aacute; previamente al ingreso de la persona.</p>\n<p style="text-align: justify;">&nbsp;5.16La inducci&oacute;n a planta se otorga a todo el personal de nivel mando medio y que su lugar de trabajo ser&aacute; la planta, esta inducci&oacute;n se realizar&aacute; mediante un programa de capacitaci&oacute;n de 5 d&iacute;as que incluye un d&iacute;a para cada &aacute;rea de la planta y un d&iacute;a para lectura de procedimientos.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;D&iacute;a 1= Capital Humano</p>\n<p style="text-align: justify;">D&iacute;a 2= Operaciones</p>\n<p style="text-align: justify;">D&iacute;a 3= Cadena de Suministro</p>\n<p style="text-align: justify;">D&iacute;a 4= Aseguramiento de Calidad</p>\n<p style="text-align: justify;">D&iacute;a 5= Procedimientos de su &aacute;rea&nbsp;</p>\n<p style="text-align: justify;">&nbsp;5.17 La inducci&oacute;n ejecutiva aplica a todas aquellas personas que se integran a la organizaci&oacute;n y que por la naturaleza de su puesto y &aacute;rea necesitan conocer la planta, y consiste en una sesi&oacute;n de un d&iacute;a donde tendr&aacute; contacto con las 4 &aacute;reas de la planta de acuerdo con lo programado en un plan de inducci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">Capital Humano</p>\n<p style="text-align: justify;">Operaciones (recorrido a planta)</p>\n<p style="text-align: justify;">Cadena de suministro</p>\n<p style="text-align: justify;">Aseguramiento de Calidad</p>\n<p style="text-align: justify;">Pr&aacute;ctica en &Aacute;rea Operativa</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>', '<p>DC3. Constancia de Habilidades Laborales. (Este formato es dado por la Secretaria del Trabajo)</p>\n<p>&nbsp;</p>', '<p>N/A</p>', ''),
(228, 'A', 'Edición', '22/08/2014', '<p style="text-align: justify;">Establecer un control y reorganizar las actividades del personal que se le diagnostica &oacute; presenta s&iacute;ntomas de una enfermedad, lesiones u otras aflicciones que puedan ser fuente de contaminaci&oacute;n microbiana del alimento &oacute; superficies en contacto con los alimentos.</p>', '<p>A todo el personal que labora en Procesa.</p>', '<p><strong>ENFERMEDAD INFECTO-CONTAGIOSA:</strong> Cualquier enfermedad debida a un agente infeccioso o productos t&oacute;xicos que se puede transmitir de una persona a otra.</p>\n<p>&nbsp;<strong>IMSS:</strong> Instituto Mexicano del Seguro Social.</p>\n<p>&nbsp;<strong>BPM:</strong> Buenas pr&aacute;cticas de Manufactura.</p>', '<p><strong>&nbsp;</strong>1.1.El responsable de Salud Ocupacional realizara el cronograma anual de los an&aacute;lisis del personal que se encuentra en contacto con el producto.</p>\n<p>&nbsp;1.2.&nbsp;El programa de muestreo se realizara de forma anual y consta del 30% del total de &nbsp;&nbsp;las &nbsp;&nbsp;personas &nbsp;se encuentra en contacto de forma directa &nbsp;con el producto&nbsp; que&nbsp; para efectos de&nbsp; este procedimientos ser&aacute;n el &aacute;rea de preparaci&oacute;n de pescado, limpieza, adici&oacute;n de l&iacute;quidos, conos y sellado.</p>\n<p>&nbsp;1.3.El muestreo deber&aacute; ser realizado aleatoriamente entre el personal.</p>\n<p>&nbsp;1.4.Los an&aacute;lisis que se realizaran en un laboratorio externo son: reacciones febriles, Exudado far&iacute;ngeo, cultivo de u&ntilde;as, coprocultivo, coproparasitoscopico.</p>\n<p>&nbsp;1.5.Una vez que se recibe los resultados de laboratorio el responsable de salud ocupacional los verifica y cuando alguna persona seleccionada presenta alguna enfermedad infecto-contagiosa se le comunicara al supervisor y solicitara la presencia de la persona afectada para hacer una evaluaci&oacute;n dependiendo de la enfermedad detectada.</p>\n<p>&nbsp;</p>\n<p>1.6.Se enviara al IMSS para hacer una evaluaci&oacute;n y se reubicara de &aacute;rea document&aacute;ndose en el FO-SP-002-A.</p>\n<p>&nbsp;</p>\n<p>1.7.Cuando el personal termine su tratamiento deber&aacute; ser evaluado nuevamente y los resultados son satisfactorios se regresara a su &aacute;rea, registr&aacute;ndolo en el formato Bit&aacute;cora de atenci&oacute;n Medica (PR-SP-001-A).</p>\n<p>&nbsp;</p>\n<p>1.8.El responsable de salud ocupacional le avisara al supervisor de producci&oacute;n los resultados obtenidos y que el personal puede regresar a su &aacute;rea original.</p>\n<p>&nbsp;</p>\n<p>1.9.El supervisor de calidad en l&iacute;nea deber&aacute; verificar diariamente que no se presente signos de problemas m&eacute;dicos en los empleados que manipulan el producto, document&aacute;ndolo en el formato de Acciones Correctivas de Buenas Pr&aacute;cticas de Manufacturas (FO-AA-001-A). En caso de detectarse alguna condici&oacute;n an&oacute;mala se da aviso al supervisor de producci&oacute;n y se env&iacute;a el personal al &aacute;rea de enfermer&iacute;a.</p>\n<p>&nbsp;</p>\n<p>1.10.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; De acuerdo al diagn&oacute;stico deciden si es necesario reubicar al personal en el &aacute;rea donde no se encuentre expuesto el producto llenado el formato Bit&aacute;cora de atenci&oacute;n M&eacute;dica FO-SP-001-A.</p>\n<p>&nbsp;</p>\n<p>1.11.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Durante la capacitaci&oacute;n en BPM el instructor deber&aacute; indicarle al personal que cuando presenten alg&uacute;n s&iacute;ntoma de deterioro de su salud y que puede contaminar el producto, avise inmediatamente a su jefe inmediato.</p>', '<p>AIB Normas consolidadas para la seguridad del alimento.</p>\n<p>&nbsp;NOM-120-SSA1-1994 Norma Oficial Mexicana, Bienes y servicios. Practicas de higiene y sanidad para el proceso de alimentos, bebidas no alcoh&oacute;licas y alcoh&oacute;licas.</p>', '<p>N/A</p>', ''),
(231, 'A', 'Edición', '22/08/2014', '<p>Describir los pasos a seguir para la Toma de Muestras de Pescado Entero y Lomos Precocidos Congelados asegurando su representatividad.</p>', '<p>Este documento aplica toda vez que lleguen Pescado entero y Lomo congelado a la planta Procesa Chiapas.</p>', '<p><strong>CUARENTENA</strong> Aislamientos de pescado entero, que se encuentra en evaluaci&oacute;n y espera de dictamen de su aprobaci&oacute;n o rechazo.</p>\n<p>&nbsp;</p>\n<p><strong>REGISTRO:</strong>Recopilaci&oacute;n manual o inform&aacute;tica de todos los datos relativos a las materias primas, productos intermedios y productos terminados.</p>\n<p>&nbsp;</p>\n<p><strong>CERTIFICADO DE CALIDAD:</strong> Documento enviado por el proveedor, que respalda los an&aacute;lisis y est&aacute;ndares que se emiten de acuerdo al lote producido.</p>\n<p><strong>AVISO DE ARRIBO: </strong>Documento emitido por la Secretaria de Pesca, que describe las toneladas descargadas de cada especie, zona de captura, fecha de salida y atraque de la embarcaci&oacute;n.</p>\n<p>&nbsp;<strong>LOTE:</strong>Volumen determinado de cada especie, para realizar un muestreo.</p>\n<p>&nbsp;<strong>MUESTRA:</strong> N&uacute;mero total de unidades de pescado o lomos provenientes de un lote que representan las caracter&iacute;sticas y condiciones del mismo.</p>\n<p>&nbsp;<strong>RECHAZO:</strong> pescado o Lomoque no cumple con las especificaciones y deber&aacute; ser desechado o reenviado al proveedor.</p>\n<p><strong>&nbsp;</strong><strong>LIBERADO:</strong> Pescado o Lomo que cumple con las especificaciones que puede ser usado y envido al cliente.</p>\n<p><strong>&nbsp;</strong><strong>OBSERVACION:</strong> Pescado o Lomo que no cumple parcialmente con las especificaciones y que se quedara en observaci&oacute;n hasta el cumplimiento de tratamiento a realizar para determinar su destino.</p>', '<p style="text-align: justify;">&nbsp;<strong>5.1.</strong><strong>RECEPCI&Oacute;N DE TRANSPORTE TERRESTRE</strong></p>\n<p style="text-align: justify;">&nbsp;5.1.1.&nbsp;&nbsp; Jefe de almac&eacute;n solicita la documentaci&oacute;n de la recepci&oacute;n: Carta porte, aviso de arribo, factura, Nota de Remisi&oacute;n, Solicitud de compra y Certificado de calidad y realizara entrega al supervisor de almac&eacute;n en turno.</p>\n<p style="text-align: justify;">&nbsp;5.1.2.&nbsp;&nbsp; El Supervisor verifica el &aacute;rea de descarga de acuerdo a las BPM, y cumplimiento HACCP.</p>\n<p style="text-align: justify;">&nbsp;5.1.3.&nbsp;&nbsp; El supervisor de almac&eacute;n deber&aacute; de realizar la verificaci&oacute;n de transporte de acuerdo a las BPM, y cumplimiento HACCP, &eacute;ste no debe estar contaminado por al&eacute;rgenos en el caso que amerite, debe estar libre de materia fecal, plagas, materiales extra&ntilde;os, di&eacute;sel, aceites&nbsp; y otros contaminantes t&oacute;xicos que da&ntilde;en la calidad e inocuidad de la materia prima secundaria, insumos o empaque, esto deber&aacute; ser registrado en el formato FO-RE-005-A, para Pescado entero y FO-RE-006-A, para Lomos.</p>\n<p style="text-align: justify;">&nbsp;5.1.4.&nbsp;&nbsp; Una vez terminada la verificaci&oacute;n del transporte, se procede a la descarga.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>5.2.</strong><strong>RECEPCI&Oacute;N DE BARCO</strong></p>\n<p style="text-align: justify;">5.2.1.&nbsp;&nbsp; Cuando se realice una descarga de barco, el Inspector de recepciones y embarques deber&aacute; verificar que el &aacute;rea para descarga cumpla con las BPM&acute;S, as&iacute; como el personal de la descarga. Deber&aacute; asegurar que todo el pescado sea manipulado correctamente durante la descarga de cada tanque.</p>\n<p style="text-align: justify;">5.2.2.&nbsp;&nbsp; El inspector de recepciones y embarques deber&aacute; indicarle al muestreador la cantidad de muestras a tomar por cada especie, talla y tanque, asign&aacute;ndole el n&uacute;mero de lote o RMP por cada tanque descargado.</p>\n<p style="text-align: justify;">5.2.3.&nbsp;&nbsp; Para identificar cada especie de pescado, el inspector de recepciones y muestreador deber&aacute;n utilizar el cat&aacute;logo de especies.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong><strong>5.3.</strong><strong>T&Eacute;CNICA PARA PESCADO ENTERO</strong></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong><strong>5.3.1.&nbsp;&nbsp; </strong>El inspector de recepciones y embarques deber&aacute;&nbsp; inspeccionar la materia prima, de acuerdo a la especificaci&oacute;n descrita y tomar muestras para determinaci&oacute;n de histamina, cloruros,&nbsp; An&aacute;lisis sensoriales, An&aacute;lisis microbiol&oacute;gicos, An&aacute;lisis de Metales Pesados y humedad, bajo la siguiente metodolog&iacute;a:</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong></p>\n<p style="text-align: justify;"><strong>5.3.2.&nbsp;&nbsp; </strong>Preparar el material requerido para la toma de muestras, como son: Taladro, broca, guantes y bolsas de pl&aacute;stico marcadas previamente con el n&uacute;mero de tanque (cuando proceda de barco), n&uacute;mero de muestra, especie, talla.</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong></p>\n<p style="text-align: justify;"><strong>5.4.</strong><strong>ANALISIS&nbsp; DE HISTAMINA:</strong></p>\n<p style="text-align: justify;"><strong>&nbsp;</strong></p>\n<p style="text-align: justify;"><strong>5.4.1.&nbsp;&nbsp; </strong>MUESTREO EN TR&Aacute;ILER: Se toma una muestra de 200 g a m&iacute;nimo 18 pescados por cada 25 toneladas y especie de la cabeza de cada pescado distribuyendo cada contenedor en 3 partes iguales: principio, medio y final.</p>\n<p style="text-align: justify;"><span lang="ES"><strong>5.4.1.1 MUESTREO EN BARCO</strong>: Se toman 18 muestras por tanque, distribuidos en 3 partes iguales: principio, medio y fondo por cada especie</span></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p><span lang="ES"><img style="display: block; margin-left: auto; margin-right: auto;" src="source/muestras.png" alt="" width="372" height="271" /><br /></span></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p><strong>5.1.1.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>Una vez seleccionados los pescados, con la ayuda de un sacabocados tomar muestras de la cabeza, regresando al embarque los pescados muestreados.</p>\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="source/dkf.jpg" alt="" width="513" height="157" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;<strong>5.1.1.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>Colocar las muestras en las bolsas de pl&aacute;stico y etiquetarlas correctamente, &nbsp;(previamente numeradas 1 al 18) y trasladar al laboratorio para realizar las pruebas correspondientes.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>5.1.2.</strong><strong>ANALISIS MICROBIOLOGICOS Y METALES PESADOS</strong></p>\n<p style="text-align: justify;">&nbsp;<strong>5.1.2.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>Para an&aacute;lisis microbiol&oacute;gicos y de metales pesados se realizar&aacute; de acuerdo al calendario de an&aacute;lisis Externo.</p>\n<p style="text-align: justify;">&nbsp;<strong>5.1.2.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>La t&eacute;cnica de muestreo se realiza tomando 1kg del lomo del Pescado entero congelado en bolsas est&eacute;riles.</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong></p>\n<p style="text-align: justify;"><strong>5.1.3.&nbsp;&nbsp; </strong><strong>CLORUROS Y HUMEDAD</strong></p>\n<p style="text-align: justify;">&nbsp;<strong>5.1.3.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>Para barco: Tomar muestras de cabeza, lomo y cola por talla y especie por cada tanque. Para cloruros se realizar&aacute; el an&aacute;lisis solamente a tallas menores a 12 Kg y para humedad ser&aacute; para cada talla.</p>\n<p style="text-align: justify;"><strong>5.1.3.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>Para contenedor: Tomar muestras de cabeza, lomo y cola por talla y especie del contenedor. Para cloruros se realizar&aacute; el an&aacute;lisis solamente a tallas menores a 12 Kg y para humedad ser&aacute; para cada talla.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>5.1.4.&nbsp;&nbsp; </strong><strong>ANALISIS SENSORIAL</strong></p>\n<p style="text-align: justify;"><strong>5.1.4.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>MUESTREO EN TR&Aacute;ILER: Se toma una muestra de al menos de 118 pescados por especie y talla, en caso de no cumplir con los 118 pescados se tomar&aacute; todo el contenedor como muestra.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><span lang="ES"><img style="display: block; margin-left: auto; margin-right: auto;" src="source/analisis sensorial.png" alt="" width="412" height="108" /></span></p>\n<p style="text-align: justify;"><strong>&nbsp;5.1.1.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MUESTREO EN BARCO:</strong> Se toman 118 muestras por cada 25 ton., cubriendo las tallas representativas de cada especie.</p>\n<p style="text-align: justify;"><span lang="ES">&nbsp;</span></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">5.1.1.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Una vez seleccionados los pescados uno a uno se realizar&aacute; el an&aacute;lisis sensorial de acuerdo a la T&eacute;cnica de pruebas sensoriales ACRM-T002 en el &aacute;rea de eviscerado marcando cada tina con la especie, talla, fecha, n&uacute;mero de tanque y el an&aacute;lisis a realizar en planta.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>5.2.</strong><strong>T&Eacute;CNICA PARA LOMOS</strong></p>\n<p style="text-align: justify;"><strong>&nbsp;</strong>5.2.1.&nbsp;&nbsp; Una vez llegado el embarque, el Inspector de recepciones y embarques deber&aacute; inspeccionar la materia prima de acuerdo a su ficha de especificaci&oacute;n y tomar&nbsp; muestras para determinaci&oacute;n de temperaturas, pruebas sensoriales, histamina, cloruros y humedad bajo la siguiente metodolog&iacute;a:</p>\n<p style="text-align: justify;">&nbsp;5.2.1.1.&nbsp;&nbsp; Tomar 200g de 18 muestras por cada 25 toneladas recibidas, de las diferentes secciones del contenedor (Principio, medio, final).</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="source/muestras s.png" alt="" width="452" height="134" /></p>\n<p style="text-align: justify;">5.1.1.&nbsp;&nbsp; Una vez que se han tomado las bolsas con lomos, con la ayuda de un sacabocados tomar muestras de cada uno y colocarlas en las bolsas de pl&aacute;stico (previamente numeradas) y etiquetadas, se traslada al laboratorio para realizar las pruebas correspondientes: Cloruros, Humedad, Histamina.</p>\n<p style="text-align: justify;">&nbsp;5.1.2.&nbsp;&nbsp; Despu&eacute;s de realizar la toma de muestras de los lomos se deber&aacute; retirar la bolsa de cada tarima muestreada y se colocaran los lomos en una tina as&iacute; mismo cada lomo se identificara como &ldquo;Muestreada por AC&rdquo; con la fecha correspondiente del muestreo y lote interno asignado.</p>\n<p style="text-align: justify;">&nbsp;5.1.3.&nbsp;&nbsp; Las tarimas muestreadas deber&aacute;n identificarse con la leyenda de &ldquo;Muestreada por AC&rdquo;.</p>\n<p style="text-align: justify;">&nbsp;5.1.4.&nbsp;&nbsp; Se deber&aacute; asegurar que las bolsas muestreadas sean programadas para el d&iacute;a siguiente de producci&oacute;n o para la producci&oacute;n m&aacute;s pr&oacute;xima para evitar que estas bolsas permanezcan en la c&aacute;mara por mucho tiempo y se oxiden.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>5.2.</strong><strong>RESULTADOS</strong></p>\n<p style="text-align: justify;"><strong>&nbsp;</strong>El analista de laboratorio deber&aacute; emitir los resultados de todos los par&aacute;metros determinados y deber&aacute;n ser enviados al Jefe de Aseguramiento de Calidad para que dictamine el estatus de cada lote recibido.</p>\n<p style="text-align: justify;">&nbsp;Si el resultado de la evaluaci&oacute;n sensorial indica que el lote contiene m&aacute;s del 2.5% de pescados con desviaci&oacute;n, se deber&aacute; identificar como PNC y analizar 60 muestras para histamina compuestas m&aacute;ximo de 3 pescados cada muestra para asegurar que no existan 17ppm por cada muestra compuesta &oacute; m&aacute;s de 50 ppm por cada muestra simple. Si el resultado de histamina cumple, el lote ser&aacute; liberado, si no, deber&aacute; ser rechazado.</p>\n<p style="text-align: justify;">&nbsp;Cuando los resultados de los an&aacute;lisis realizados al pescado cumplen con los par&aacute;metros de calidad e inocuidad, se dictaminar&aacute; como pescado liberado para su uso en la producci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><span lang="ES">&nbsp;</span></p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;</p>', '<p>* ISO 22000:2010.&nbsp;&nbsp;</p>\n<p>* &nbsp; AIB International, 2005.</p>\n<p>* Norma Oficial Mexicana NOM-242-SSA1-2009, Productos y servicios. Productos de la pesca frescos, refrigerados, congelados y procesados. Especificaciones sanitarias y m&eacute;todos de prueba.</p>\n<p>* Fish and Fishery Products Hazards and Controls Guidance Fourth Edition &ndash; APRIL 2011</p>', '<p>Cat&aacute;logo de Especies</p>', '');
INSERT INTO `plantilla_completa` (`id_documento`, `rev`, `estado`, `fecha`, `objetivo`, `alcance`, `definiciones`, `desarrollo`, `referencias`, `anexos`, `revision`) VALUES
(232, 'A', 'Edición', '22/08/2014', '<p>Asegurar la correcta recepci&oacute;n del material de empaque recibido en la Planta Procesa Chiapas.</p>', '<p>Todo material de empaque recibido en la Planta Procesa Chiapas.</p>', '<p><strong>Empaque</strong>:contiene, protege y/o preserva el producto permitiendo que este llegue en &oacute;ptimas condiciones al consumidor final.</p>\n<p>&nbsp;<strong>Cuarentena:</strong> Aislamientos de materia prima, que se encuentra en evaluaci&oacute;n y espera de dictamen de su aprobaci&oacute;n o rechazo.</p>\n<p>&nbsp;<strong>Registro:</strong>Recopilaci&oacute;n manual o inform&aacute;tica de todos los datos relativos a las materias primas, productos intermedios y productos terminados.</p>\n<p>&nbsp;<strong>Certificado de calidad:</strong> Documento enviado por el proveedor, que respalda los an&aacute;lisis y est&aacute;ndares que se emiten de acuerdo al lote producido.</p>\n<p>&nbsp;<strong>Lote:</strong>Volumen de producci&oacute;n (d&iacute;a completo o varias partidas en un d&iacute;a)&nbsp; cu&aacute;l es sometido a inspecci&oacute;n.&nbsp; Cantidad de producto elaborado en un mismo lapso para garantizar su homogeneidad.</p>\n<p>&nbsp;<strong>MILITARY STANDARD:</strong> Procedimiento que establece planes de muestreo por atributos y que determinan la validez de la inspecci&oacute;n, realizada a un producto determinado indicando los criterios para determinar si son aceptados o rechazados.</p>\n<p>&nbsp;<strong>Muestra:</strong> N&uacute;mero total de unidades de materia prima provenientes de un lote que representan las caracter&iacute;sticas y condiciones del mismo.</p>\n<p>&nbsp;<strong>NAC:</strong> Nivel Aceptable de calidad.</p>\n<p>&nbsp;<strong>Nivel de inspecci&oacute;n:</strong> Determinar la relaci&oacute;n entre el tama&ntilde;o del lote y el tama&ntilde;o de la muestra y depende del costo y complejidad del producto a inspecci&oacute;n.</p>\n<p>&nbsp;<strong>Rechazo:</strong> Empaqueque no cumple con las especificaciones y deber&aacute; ser desechado o reenviado al proveedor.</p>\n<p><strong>&nbsp;</strong><strong>Liberado:</strong> Empaque que cumple con las especificaciones, puede ser usado y envido al cliente.</p>\n<p><strong>&nbsp;</strong><strong>Observaci&oacute;n:</strong> Empaque que no cumple parcialmente con las especificaciones y que se quedara en observaci&oacute;n hasta el cumplimiento de tratamiento a realizar para determinar su destino.</p>\n<p><strong>&nbsp;</strong></p>', '<p>pendiente</p>', '<p>pendiente</p>', '<p>pendiente</p>', ''),
(233, 'A', 'Edición', '22/08/2014', '', '', '', '', '', '', ''),
(234, 'A', 'Edición', '22/08/2014', '<p>Describir los pasos a seguir para una correcta recepci&oacute;n de las materias primas y aceptaci&oacute;n de las mismas previo control de conformidad, as&iacute; como establecer un sistema de organizaci&oacute;n, destinada a almacenamiento, que nos permita una localizaci&oacute;n r&aacute;pida y f&aacute;cil, as&iacute; como un m&aacute;ximo aprovechamiento del espacio respetando las condiciones de almacenamiento.</p>\n<p>&nbsp;</p>', '<p><span lang="ES">Este documento aplica toda vez que lleguen materias primas secundarias a la planta Procesa Chiapas.</span></p>', '<p><strong>CERTIFICADO DE CALIDAD:</strong> Documento enviado por el proveedor, que respalda los an&aacute;lisis y est&aacute;ndares que se emiten de acuerdo al lote producido.</p>\n<p>&nbsp;<strong>CUARENTENA</strong> Aislamientos de materia prima, que se encuentra en evaluaci&oacute;n y espera de dictamen de su aprobaci&oacute;n o rechazo.</p>\n<p><strong>&nbsp;</strong><strong>ESTATUS LIBERADO:</strong> Materia prima, o empaque que cumple con las especificaciones que puede ser usado y envido al cliente.</p>\n<p><strong>&nbsp;</strong><strong>ESTATUS </strong><strong>OBSERVACION:</strong> Materia prima, ingrediente o empaque que no cumple parcialmente con las especificaciones y que se quedar&aacute; en observaci&oacute;n hasta el cumplimiento de tratamiento a realizar para determinar su destino.</p>\n<p><strong>&nbsp;</strong><strong>ESTATUS </strong><strong>RECHAZO:</strong> Mater&iacute;a prima, o empaque que no cumple con las especificaciones y deber&aacute; ser desechado o reenviado al proveedor.</p>\n<p>&nbsp;<strong>INSUMOS:</strong>Toda sustancia activa o inerte empleada en la fabricaci&oacute;n del producto, ya sea que permanezca inalterada, se modifique o desaparezca en el transcurso del proceso.</p>\n<p>&nbsp;<strong>LOTE:</strong>Volumen de producci&oacute;n (d&iacute;a completo o varias partidas en un d&iacute;a)&nbsp; cu&aacute;l es sometido a inspecci&oacute;n.&nbsp; Cantidad de producto elaborado en un mismo lapso para garantizar su homogeneidad.</p>\n<p><strong>&nbsp;</strong><strong>MATERIA PRIMA</strong>: Materia extra&iacute;da de la naturaleza y que se transforma para elaborar materiales que m&aacute;s tarde se convertir&aacute;n en bienes de consumo.</p>\n<p><strong>&nbsp;</strong><strong>MILITARY STANDARD:</strong> Procedimiento de muestreo que determina la validez de la inspecci&oacute;n realizada a un producto determinado y nos indica el n&uacute;mero de productos de cada lote que habr&aacute;n de ser inspeccionados y los criterios para determinar si son aceptados o rechazados.</p>\n<p>&nbsp;<strong>MUESTRA:</strong> N&uacute;mero total de unidades de materia prima provenientes de un lote que representan las caracter&iacute;sticas y condiciones del mismo.</p>\n<p>&nbsp;<strong>NAC:</strong> Es el n&uacute;mero m&aacute;ximo de unidades defectuosas por cada cien unidades que son aceptadas dentro de la muestra analizada, es el nivel de calidad manejado y adoptado por la empresa.</p>\n<p>&nbsp;<strong>NIVEL DE INSPECCI&Oacute;N:</strong> Determina la relaci&oacute;n entre el tama&ntilde;o del lote y el tama&ntilde;o de la muestra y depende del costo y complejidad del producto a inspecci&oacute;n.</p>\n<p>&nbsp;<strong>REGISTRO:</strong>Recopilaci&oacute;n manual o inform&aacute;tica de todos los datos relativos a las materias primas, productos intermedios y productos terminados.</p>', '<p>pendiente</p>', '<p>p</p>', '<p>p</p>', ''),
(235, 'A', 'Edición', '22/08/2014', '<p style="text-align: justify;">Tiene como finalidad describir los lineamientos que el personal&nbsp; debe de tomar para tener acceso a las&nbsp; &aacute;reas de la &nbsp;planta PROCESA, as&iacute; como&nbsp; reducir las amenazas&nbsp; y &nbsp;evitar contratiempos por peligro de contaminaci&oacute;n cruzada y/o accidentes de trabajo que puedan poner en&nbsp; riesgo y/o &nbsp;la inocuidad de nuestros productos, empleados, equipos e instalaciones.&nbsp;&nbsp;</p>', '<p>&nbsp;</p>\n<p>Este documento aplica a todo personal &nbsp;que&nbsp; labora&nbsp; en Procesa.</p>', '<p><strong>Uniformes: </strong>es un conjunto estandarizado de<span style="color: #000000;"> <a href="http://es.wikipedia.org/wiki/Ropa"><span style="color: #000000;">ropa</span></a> </span>usado por miembros de una organizaci&oacute;n mientras participan en la actividad de &eacute;sta.</p>\n<p><strong>&nbsp;</strong><strong>Inocuidad: </strong>Es la condici&oacute;n de los alimentos que garantiza que no causara da&ntilde;o al consumidor cuando se preparen y/o consuman de acuerdo con el uso al que se destina.</p>\n<p>&nbsp;</p>', '<ol>\n<li><strong>&nbsp;&nbsp;&nbsp; </strong>Toda persona&nbsp; que labora en procesa deber&aacute;&nbsp; de portar&nbsp; el uniforme de acuerdo&nbsp; al&nbsp; &aacute;rea&nbsp;&nbsp; donde&nbsp; se encuentra&nbsp; laborando.</li>\n</ol>\n<p>&nbsp;1.1.El&nbsp; colaborador&nbsp;&nbsp; que &nbsp;por alguna&nbsp; raz&oacute;n&nbsp; no porte&nbsp; el uniforme de acuerdo al c&oacute;digo de colores correspondiente al &aacute;rea (Ver anexo)&nbsp; deber&aacute;&nbsp; de ser retirado del&nbsp; &aacute;rea.</p>\n<p>&nbsp;1.2.El&nbsp; colaborador&nbsp; deber&aacute;&nbsp; de portar su&nbsp; uniforme&nbsp; en condiciones &oacute;ptimas.</p>\n<p>&nbsp;1.3.&nbsp;El&nbsp; colaborador&nbsp; deber&aacute;&nbsp; de&nbsp; reportar&nbsp;&nbsp; a&nbsp; su jefe&nbsp; inmediato&nbsp; el&nbsp; deterioro&nbsp;&nbsp; de sus&nbsp; uniformes.</p>\n<p>&nbsp;1.4.&nbsp;La&nbsp; empresa&nbsp; deber&aacute; de&nbsp; realizar&nbsp; el&nbsp; cambio de uniformes&nbsp; cada&nbsp; a&ntilde;o.</p>\n<p>&nbsp;1.5.El&nbsp; coordinador&nbsp; SHYMA, es&nbsp; responsable&nbsp; de&nbsp; hacer&nbsp; la entrega de&nbsp; los&nbsp; uniformes.</p>\n<p>1.6.El&nbsp; colaborador&nbsp; deber&aacute;&nbsp; de&nbsp; firmar&nbsp; la&nbsp; responsiva correspondiente, para&nbsp; su evidencia&nbsp; FO-SH-004-A .</p>\n<p>&nbsp;1.7.&nbsp;El&nbsp; vigilantees responsable&nbsp; de&nbsp; verificar&nbsp; en sus rondines que&nbsp; el&nbsp; colaborador&nbsp; porte&nbsp; el&nbsp; uniforme&nbsp; correspondiente.</p>\n<p>&nbsp;1.8.El vigilante deber&aacute;&nbsp; informar&nbsp; al&nbsp; jefe&nbsp; inmediato&nbsp; cuando&nbsp; alg&uacute;n&nbsp; colaborador&nbsp; se encuentre&nbsp; en un &aacute;rea&nbsp; donde&nbsp;&nbsp; no&nbsp; le&nbsp; corresponda.</p>\n<p><strong>&nbsp;</strong>1.9.&nbsp;El &aacute;rea de Aseguramiento de Calidad, deber&aacute;&nbsp; de realizar&nbsp; &nbsp;&nbsp;inspecci&oacute;n &nbsp;al&nbsp; personal &nbsp;durante la jornada de&nbsp; trabajo, para&nbsp; verificar&nbsp; que&nbsp; el personal&nbsp; porte el&nbsp; uniforme&nbsp; correspondiente.&nbsp;</p>\n<p><strong>&nbsp;</strong></p>\n<ol start="2">\n<li><strong>&nbsp;&nbsp;&nbsp; </strong><strong>ACCIONES CORRECTIVAS</strong></li>\n</ol>\n<p><strong>&nbsp;</strong>2.1.&nbsp;En caso de encontrar &nbsp;a personal&nbsp; que&nbsp; no&nbsp; cumpla&nbsp; con&nbsp; portar el&nbsp; uniforme&nbsp; correspondiente,&nbsp; se&nbsp; hablara con &eacute;l para&nbsp; investigar&nbsp; la raz&oacute;n y si vuelve a reincidir&nbsp;&nbsp; se levantara&nbsp; sanci&oacute;n correspondiente.</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(236, 'A', 'Edición', '22/08/2014', '<p>Tiene como finalidad describir los lineamientos que el personal&nbsp; debe de seguir en el&nbsp; uso de&nbsp; los&nbsp; lockers de la &nbsp;planta PROCESA, as&iacute; como&nbsp; reducir las amenazas&nbsp; &nbsp;&nbsp;de&nbsp; proliferaci&oacute;n&nbsp; de&nbsp; plagas y posesi&oacute;n de cualquier objeto que&nbsp; pueda &nbsp;poner en&nbsp; riesgo la inocuidad y/o integridad de nuestros productos, empleados, equipo y materias primas.&nbsp;</p>\n<p><strong>&nbsp;</strong></p>', '<p>Este documento aplica a todo personal&nbsp; usuario de&nbsp; los lockers en Procesa.</p>', '<p><strong>Lockers</strong><strong>: </strong>Es &nbsp;un &nbsp;caj&oacute;n o casillero &nbsp;con&nbsp; llave&nbsp; de &nbsp;metal o madera de consigna,&nbsp; donde puedes&nbsp; guardar&nbsp; tus objetos&nbsp; personales.</p>\n<p><strong>Usuario:</strong>Es <strong>quien usa ordinariamente algo</strong>. El t&eacute;rmino, que procede del lat&iacute;n <em>usuarĭus</em>, hace menci&oacute;n a la<span style="color: #000000;"> <a href="http://definicion.de/persona"><span style="color: #000000;">persona</span></a> que utiliza alg&uacute;n tipo de objeto o que es destinataria de un <a href="http://definicion.de/servicio/"><span style="color: #000000;">servicio</span></a>, ya sea privado o p&uacute;blico.</span></p>\n<p><strong>&nbsp;</strong><strong>Inocuidad: </strong>Es la condici&oacute;n de los alimentos que garantiza que no causara da&ntilde;o al consumidor cuando se preparen y/o consuman de acuerdo con el uso al que se destina.</p>', '<ol>\n<li style="text-align: justify;"><strong>&nbsp;&nbsp;&nbsp; </strong>Toda persona usuario&nbsp; de&nbsp; los&nbsp; lockers &nbsp;en procesa Chiapas&nbsp; deber&aacute;&nbsp; de hacer&nbsp; el uso correcto&nbsp; para el&nbsp; cual&nbsp; fue&nbsp; dise&ntilde;ado.</li>\n</ol>\n<p style="text-align: justify;">&nbsp;1.1.cuando&nbsp; una persona&nbsp;&nbsp; sea&nbsp; contratada &nbsp;por la empresa&nbsp; la misma deber&aacute;&nbsp; de asignarle un locker para&nbsp; resguardo de sus&nbsp; pertenencias.</p>\n<p style="text-align: justify;">&nbsp;1.2.&nbsp;El coordinador SHYMA le asignar&aacute; un locker&nbsp; individual o compartido&nbsp; en&nbsp; un lapso&nbsp; no mayor a una&nbsp; semana&nbsp; a &nbsp;la &nbsp;fecha de ingreso&nbsp; a&nbsp; la planta, esto se registra en el formato de asignaci&oacute;n de lockers FO-SH-001-A</p>\n<p style="text-align: justify;">&nbsp;1.3.El &nbsp;coordinador&nbsp; SHYMA,&nbsp; deber&aacute; de&nbsp; mantenerlos identificado con etiquetas (nombre, numero de nomina)</p>\n<p style="text-align: justify;">&nbsp;1.4.El&nbsp; coordinador&nbsp; deber&aacute;&nbsp; de realizar&nbsp; inspecciones &nbsp;de&nbsp; manera&nbsp; aleatoria una vez&nbsp; por semana tanto&nbsp; en locker&nbsp; del &aacute;rea&nbsp; de hombres&nbsp; como de las&nbsp; mujeres. Para&nbsp; control de las&nbsp; BPM&acute;s, dejando evidencia&nbsp;&nbsp; en el formato&nbsp; Limpieza de ba&ntilde;o FO-SH-003-A</p>\n<p style="text-align: justify;">&nbsp;1.5.Cuando&nbsp; en la&nbsp; inspecci&oacute;n&nbsp; realizada&nbsp; &nbsp;a los &nbsp;&nbsp;locker se encuentra&nbsp; alg&uacute;n hallazgo&nbsp; de&nbsp; incumplimiento a&nbsp; el&nbsp; uso del mismo, se aplicara&nbsp; la sanci&oacute;n&nbsp; correspondiente&nbsp; e informando de manera&nbsp; inmediata&nbsp; a su&nbsp;&nbsp; jefe y/o supervisor. Anex&aacute;ndola&nbsp; al expediente&nbsp; personal&nbsp; del&nbsp; colaborador.</p>\n<p style="text-align: justify;">&nbsp;1.6.El&nbsp; colaborador&nbsp;&nbsp; que &nbsp;tenga en consigna&nbsp; un lockers deber&aacute;&nbsp; de&nbsp; cumplir&nbsp; con las siguientes&nbsp; lineamientos&nbsp; de&nbsp; uso:</p>\n<p style="text-align: justify;">&nbsp;a)&nbsp;&nbsp;&nbsp; Mantenerlo&nbsp; en condiciones Higi&eacute;nicas</p>\n<p style="text-align: justify;">b)&nbsp;&nbsp;&nbsp; Mantenerlo&nbsp;&nbsp; con&nbsp; candado.</p>\n<p style="text-align: justify;">c)&nbsp;&nbsp;&nbsp; Queda&nbsp; estrictamente prohibido&nbsp; rayarlos.</p>\n<p style="text-align: justify;">d)&nbsp;&nbsp;&nbsp; Pegarles&nbsp; figuras.</p>\n<p style="text-align: justify;">e)&nbsp;&nbsp;&nbsp; Pintarlos&nbsp; o escribir textos dentro y fuera del mismo.</p>\n<p style="text-align: justify;">f)&nbsp;&nbsp;&nbsp;&nbsp; Queda estrictamente prohibido&nbsp; guardar&nbsp; cualquier tipo&nbsp; de alimentos.</p>\n<p style="text-align: justify;">g)&nbsp;&nbsp;&nbsp; Queda&nbsp; prohibido guarda&nbsp; trastes&nbsp; de comida vacios.</p>\n<p style="text-align: justify;">h)&nbsp;&nbsp; Queda&nbsp; prohibido&nbsp; romper&nbsp; etiquetas.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">1.7.El&nbsp; colaborador&nbsp; deber&aacute;&nbsp; de reportar cualquier&nbsp; deterioro&nbsp; o alteraci&oacute;n &nbsp;&nbsp;del&nbsp; mismo de manera&nbsp; inmediata al coordinador&nbsp; SHYMA, para&nbsp; su&nbsp; correcci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;1.8.&nbsp;El&nbsp; colaborador&nbsp; deber&aacute;&nbsp; de&nbsp; reportar al&nbsp; coordinador de SHYMA, &nbsp;cuando&nbsp; por alguna raz&oacute;n&nbsp; tenga&nbsp; que&nbsp; romper el candado.</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(253, 'A', 'Edición', '22/08/2014', '<p>Asegurar que el proceso de Pesado de Porciones cumpla con las especificaciones requeridas por cada formulaci&oacute;n.</p>', '<p>Este documento aplica &nbsp;para todos los lotes elaborados en el proceso de fabricaci&oacute;n.</p>', '<p><strong>AP:</strong> Auxiliar de Producci&oacute;n.</p>\n<p><strong>IP:</strong> Ingeniero de Procesos.</p>\n<p><strong>OPP:</strong> Operador de Pesado de Porciones.</p>\n<p><strong>OLR:</strong> Operador de Lavado de Recipientes.</p>\n<p><strong>OLL:</strong> Operador de Llenado de Pouch.</p>\n<p><strong>OG</strong>: Operador General</p>\n<p><strong>TARAR:</strong> Llevar a cero el indicador de peso de la b&aacute;scula.</p>\n<p><strong>AJUSTE</strong>: Centrar burbuja de aire.</p>\n<p><strong>PROCESO:</strong> Conjunto de actividades relativas a la obtenci&oacute;n, elaboraci&oacute;n, fabricaci&oacute;n, preparaci&oacute;n, conservaci&oacute;n, mezclado, acondicionamiento, envasado, manipulaci&oacute;n, transporte, distribuci&oacute;n, almacenamiento y expendio o suministro al p&uacute;blico de productos.</p>', '<p><strong>5.1. </strong>PESADO DE PORCI&Oacute;N</p>\n<p>5.1.1.&nbsp;&nbsp;&nbsp; El OPP debe revisar que la b&aacute;scula y su lugar de trabajo se encuentre limpia y seca. El OPP&nbsp; preparar&aacute; la b&aacute;scula de acuerdo a las recomendaciones descritas en el Instructivo de Trabajo Ajuste de B&aacute;scula (IT-LL-001-A)</p>\n<p>&nbsp;5.1.2.&nbsp;&nbsp;&nbsp; El Jefe de Mantenimiento es el responsable de coordinar el mantenimiento de las b&aacute;sculas de acuerdo a lo establecido en el Procedimiento de Mantenimiento Preventivo y Correctivo (PR-MT-001-A.)</p>\n<p>&nbsp;5.1.3.&nbsp;&nbsp;&nbsp; El OPP deber&aacute;&nbsp; realizar el pesado de la porci&oacute;n de acuerdo a lo establecido en el Instructivo de Trabajo Pesado de Porciones (IT-LL-002-A.)</p>\n<p>&nbsp;5.1.4.&nbsp;&nbsp;&nbsp; El OPP deber&aacute; solicitar al OLR que mantenga los recipientes limpios.</p>\n<p>&nbsp;5.1.5.&nbsp;&nbsp;&nbsp; Una vez terminado el proceso, el OPP&nbsp; deber&aacute; limpiar su b&aacute;scula, evitar ponerla de cabeza y dejarla en el lugar que le corresponda.</p>\n<p>&nbsp;</p>\n<p><strong>Nota<strong>: En caso de cambiar de proceso de un producto que contenga alg&uacute;n ingrediente al&eacute;rgeno a otro que no contenga, el OPP deber&aacute; limpiar su b&aacute;scula hasta&nbsp; retirar totalmente los residuos de &eacute;ste, posteriormente la sanitizar&aacute; con toallas Sani Wipe</strong>.</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>5.2.&nbsp; </strong>LLENADO DE POUCH</p>\n<p>&nbsp;5.2.1.&nbsp;&nbsp;&nbsp; Es responsabilidad del Auxiliar de Suministro de Materiales recibir cualquier material necesario para la operaci&oacute;n y de validar que este corresponda a la presentaci&oacute;n programada.</p>\n<p>&nbsp;5.2.2.&nbsp;&nbsp;&nbsp; Los pouches ser&aacute;n entregados al OLL por parte del Auxiliar de Suministro de Materiales.</p>\n<p>&nbsp;5.2.3.&nbsp;&nbsp;&nbsp; Las toallas desechables ser&aacute;n entregados al OLL, OG de verificado y limpieza de pouch por parte del Auxiliar de Suministro de Materiales.</p>\n<p>&nbsp;5.2.4.&nbsp;&nbsp;&nbsp; El OLL deber&aacute; realizar el llenado de pouch de acuerdo a lo establecido en el Instructivo de Trabajo Llenado de Pouch IT-LL-003-A</p>\n<p>&nbsp;5.2.5.&nbsp;&nbsp;&nbsp; El Auxiliar de suministro de materiales llevar&aacute; el registro de pouches en el formato Control de pouches FO-LL-001-A.</p>\n<p>&nbsp;</p>\n<p><strong>5.3.&nbsp; </strong>VERIFICACION DE PESOS</p>\n<p>5.3.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El OG deber&aacute; realizar la verificaci&oacute;n de pesos de acuerdo a lo establecido en el Instructivo de Trabajo Verificaci&oacute;n de Pesos y Limpieza de Pouch IT-LL-004-A</p>\n<p>5.3.1.&nbsp;&nbsp;&nbsp; El OG deber&aacute; asegurarse que el producto cumpla con la tolerancia de pesos autorizados (ver tabla1).</p>\n<p>&nbsp;</p>\n<p style="text-align: center;"><strong>T a b l a&nbsp; 1 Tolerancia de Contenido Neto</strong></p>\n<p style="text-align: center;"><strong><img src="source/tolerancia de contenido neto.png" alt="" width="481" height="228" /></strong></p>\n<p style="text-align: center;">&nbsp;</p>\n<p style="text-align: center;">&nbsp;</p>\n<p><strong>5.4.&nbsp; </strong>LIMPIEZA DE POUCH</p>\n<p>&nbsp;5.4.1.&nbsp;&nbsp;&nbsp; El OG deber&aacute; realizar la limpieza del pouch de acuerdo a lo establecido en el Instructivo de Trabajo Verificaci&oacute;n de Pesos y Limpieza de Pouch IT-LL-004-A.</p>\n<p>&nbsp;5.4.2.&nbsp;&nbsp;&nbsp; El OP, OLL, y OG deber&aacute;n cumplir con las BPM&acute;s de acuerdo a lo descrito en el Manual de Buenas Pr&aacute;cticas de Manufactura MA-BM-001-A</p>\n<p>&nbsp;5.4.3.&nbsp;&nbsp;&nbsp; Una vez terminado los procesos cada operador deber&aacute; limpiar su estaci&oacute;n de trabajo retirando la materia org&aacute;nica.</p>\n<p>&nbsp;5.4.4.&nbsp;&nbsp;&nbsp; Finalmente, el Departamento de Sanidad deber&aacute; lavar y sanear el &Aacute;rea seg&uacute;n el Procedimiento de Operaci&oacute;n Est&aacute;ndar de Sanidad (POES) PR-SA-001-A.</p>\n<p>5.4.5.&nbsp;&nbsp;&nbsp; Cualquier desviaci&oacute;n ocurrida en proceso, deber&aacute;n informar al Ingeniero de Procesos en turno, quien indicara las acciones correctivas a realizar para la correcci&oacute;n de la desviaci&oacute;n.</p>\n<p><strong>&nbsp;</strong></p>\n<p style="text-align: center;">&nbsp;</p>', '<p>PR-LL-001-A. Instructivo de Trabajo Ajuste de B&aacute;scula.</p>\n<p>PR-MT-001-A. Procedimiento de Mantenimiento Preventivo y Correctivo.</p>\n<p>IT-LL-002-A. Instructivo de Trabajo Pesado de Porciones</p>\n<p>IT-LL-003-A. Instructivo de Trabajo Llenado de Pouch.</p>\n<p>MA-BP-001-A. Manual de Buenas Pr&aacute;cticas de Manufactura</p>\n<p>IT-LL-004-A. Instructivo de Trabajo Verificaci&oacute;n de Pesos y Limpieza de Pouch.</p>\n<p>PR-SA-001-A. Procedimiento de Operaci&oacute;n Est&aacute;ndar de Sanidad (POES)</p>', '<p>N/a</p>', ''),
(254, 'A', 'Edición', '22/08/2014', '<p>Asegurar la eliminaci&oacute;n de materiales inherentes y no inherentes de la materia prima y garantizar el suministro de carne blanca al &aacute;rea de Preparaci&oacute;n de Mezcla.&nbsp;</p>', '<p>Este documento aplica toda vez que se realice el Proceso de Limpieza de Pescado Entero.</p>', '<p><strong>LIMPIEZA DE AT&Uacute;N:</strong>Conjunto de actividades que tienen por objeto eliminar piel, espinas, grasa, carne negra, venas y dem&aacute;s residuos que no sea carne blanca manualmente.</p>\n<p><strong>MATERIA PRIMA:</strong> At&uacute;n Aleta Amarilla, Barrilete y Bonita.</p>\n<p><strong>PEPS:</strong> Primeras Entradas y Primeras Salidas.</p>\n<p><strong>GUANERO:</strong> Persona que se encarga de recoger todo el desperdicio generado en la limpieza del pescado y/o lomos precocidos.</p>\n<p><strong>RMP:</strong> Recepci&oacute;n de Materias Primas.</p>\n<p><strong>PESCADO ENTERO:</strong> At&uacute;n de diferentes tallas y/o pesos.</p>\n<p><strong>LOMO PRECOCIDO</strong>: C&aacute;rnico pre-limpio y pre-cocido, envasado en bolsas de pl&aacute;stico.</p>\n<p><strong>GUANO:</strong> Desperdicio resultante de la limpieza del pescado entero.</p>\n<p><strong>MATERIAL EXTRA&Ntilde;O:</strong> Material que puede causar da&ntilde;o en la calidad o inocuidad del producto final e inclusive al consumidor final.</p>\n<p><strong>INHERENTE:</strong> Propio de la materia prima (escamas, espina, piel, etc)</p>\n<p><strong>NO INHERENTE:</strong> Ajeno a la materia prima (vidrio, pl&aacute;stico, madera, etc)</p>\n<p><strong>IP:</strong> Ingeniero de Proceso</p>', '<p>pendiente</p>', '<p>pendiente</p>', '<p>pendiente</p>', ''),
(255, 'A', 'Edición', '22/08/2014', '<p><strong>&nbsp;</strong>Asegurar que el proceso de Pesado de Porciones cumpla con las especificaciones requeridas por cada formulaci&oacute;n.</p>', '<p>Este documento aplica &nbsp;para todos los lotes elaborados en el proceso de fabricaci&oacute;n.</p>', '<p><strong>HOJUELA O MIGA:</strong> Mezclas de part&iacute;culas y pedazos en donde la mayor parte de estos tienen como m&aacute;ximo 1.2 cm de longitud.</p>\n<p><strong>TROZO:</strong> Pedazos con longitud m&iacute;nima de 1.2 cm en cada lado que mantienen la estructura original del musculo.</p>\n<p><strong>IP:</strong> Ingeniero de Procesos.</p>\n<p><strong>AP:</strong> Auxiliar de Producci&oacute;n.</p>\n<p><strong>OPP:</strong> Operador de Pesado de Porciones.</p>\n<p><strong>PROCESO:</strong> Conjunto de actividades relativas a la obtenci&oacute;n, elaboraci&oacute;n, fabricaci&oacute;n, preparaci&oacute;n, conservaci&oacute;n, mezclado, acondicionamiento, envasado, manipulaci&oacute;n, transporte, distribuci&oacute;n, almacenamiento y expendio o suministro al p&uacute;blico de productos.</p>\n<p><strong>INGREDIENTE</strong>: Sal, mezcla de verdura, aceite, vinagre, etc.</p>\n<p><strong>MATERIAL EXTRA&Ntilde;O</strong>: Vidrio, pl&aacute;stico, fierro, etc.</p>\n<p><strong>&nbsp;</strong></p>', '<p>PENDIENTE</p>', '<p>PENDIENTE</p>', '<p>N/A</p>', ''),
(256, 'A', 'Edición', '22/08/2014', '<p>Asegurar que el proceso de preparaci&oacute;n de l&iacute;quidos cumpla con las especificaciones requeridas por cada formulaci&oacute;n.</p>\n<p><strong>&nbsp;</strong></p>', '<p>Este documento aplica para todos los lotes elaborados en el proceso de fabricaci&oacute;n.</p>', '<p><strong>AP</strong>: Auxiliar de Producci&oacute;n.</p>\n<p><strong>ASM:</strong> Auxiliar de Suministro de Materiales.</p>\n<p><strong>CALDO VEGETAL:</strong> Extractos vegetales preparados de dos o m&aacute;s vegetales.</p>\n<p><strong>IP:</strong> Ingeniero de Procesos.</p>\n<p><strong>MATERIAS SECUNDARIAS:</strong> Pouches, fibra de soya, soya texturizada, sal, etc.</p>\n<p><strong>&nbsp;MATERIAL EXTRA&Ntilde;O:</strong> Material que no es propio del producto (pl&aacute;stico, madera, fierro, etc)</p>\n<p>&nbsp;<strong>OPL</strong>: Operador de Preparaci&oacute;n de L&iacute;quidos.</p>\n<p><strong>PROCESO:</strong> Conjunto de actividades relativas a la obtenci&oacute;n, elaboraci&oacute;n, fabricaci&oacute;n, &nbsp;&nbsp;&nbsp;preparaci&oacute;n conservaci&oacute;n, mezclado, acondicionamiento, envasado, manipulaci&oacute;n, transporte, distribuci&oacute;n, almacenamiento y expendio o suministro al p&uacute;blico de productos.</p>', '<p>5.1.&nbsp; El ASM entregar&aacute; al OPL las materias secundarias a utilizar para la preparaci&oacute;n del caldo vegetal. El ASM deber&aacute; verificar que los materiales entregados est&eacute;n libres de cualquier material extra&ntilde;o, en caso de presentarse alguna desviaci&oacute;n, deber&aacute; registrarlo en el formato (FO-ME-002-A)</p>\n<p>&nbsp;5.2.&nbsp; El ASM deber&aacute; de llenar el formato Control de recepci&oacute;n y entrega de materiales auxiliares PDSM-F002 al inicio y fin del proceso.</p>\n<p>&nbsp;5.3.&nbsp; El ASM debe verificar que la luz UV del filtro de agua se encuentre encendida y debe registrarlo en el Sistema de Conformidad de Preparaci&oacute;n de L&iacute;quidos<span style="background-color: rgb(255, 255, 0);"> (FO-PL-001-A).</span></p>\n<p>&nbsp;</p>\n<p>&nbsp;5.4.&nbsp; La formulaci&oacute;n a preparar ser&aacute; entregada por el IP. Dicha formulaci&oacute;n ser&aacute; obtenida de la f&oacute;rmula autorizada por parte de Investigaci&oacute;n y desarrollo.</p>\n<p>&nbsp;5.5.&nbsp; El OPL deber&aacute; esperar la instrucci&oacute;n del Jefe y/o Auxiliar&nbsp; de Producci&oacute;n para iniciar la preparaci&oacute;n de l&iacute;quidos de acuerdo a lo establecido en el Instructivo de Trabajo: Preparaci&oacute;n de Caldo Vegetal <span style="background-color: rgb(255, 255, 0);">(IT-PL-001-A)&nbsp;</span></p>\n<p>&nbsp;5.6.&nbsp; El OPL deber&aacute; dar seguimiento a lo indicado en el Procedimiento de Buenas Pr&aacute;cticas de Manufactura MA-BP-001-A.</p>\n<p>&nbsp;5.7.&nbsp; El ASM verificar&aacute; los pesos y los RMP de todos los ingredientes utilizados en el proceso y lo registrara en el Sistema de Conformidad de preparaci&oacute;n de L&iacute;quidos <span style="background-color: rgb(255, 255, 0);">(FO-PL-001-A).</span></p>\n<p>&nbsp;5.8.&nbsp; El OPL&nbsp; deber&aacute; asegurarse de realizar las actividades necesarias para evitar la contaminaci&oacute;n con material extra&ntilde;o, siguiendo las recomendaciones descritas en el Procedimiento de Control de Material Extra&ntilde;o PR-ME-001-A.</p>\n<p>&nbsp;5.9.&nbsp; Finalmente, el Departamento de Sanidad deber&aacute; lavar y sanear el &Aacute;rea seg&uacute;n el Procedimiento de Operaci&oacute;n Est&aacute;ndar de Sanidad (POES) PR-SA-001-A.</p>\n<p>&nbsp;5.10.&nbsp;&nbsp;&nbsp;&nbsp; Cualquier desviaci&oacute;n ocurrida en proceso, deber&aacute;n informar al Ingeniero de Procesos en turno, quien indicara las acciones correctivas a realizar para la correcci&oacute;n de la desviaci&oacute;n.</p>\n<p>&nbsp;</p>', '<p><span style="background-color: #ffff00;">IT- PL-001-A</span> Carta Operativa de Preparaci&oacute;n de Caldo Vegetal.</p>\n<p>PR-ME-001-A. Procedimiento de Control de Material Extra&ntilde;o</p>\n<p>PR-SA-001-A. Procedimiento de Operaci&oacute;n Est&aacute;ndar de Sanidad (POES)</p>', '<p>N/A</p>', ''),
(257, 'A', 'Edición', '22/08/2014', '<p>Asegurar que el proceso de Sellado, Codificado y Paletizado del Pouch cumpla con las especificaciones requeridas por cada producto.</p>', '<p>Este documento aplica para todos los lotes elaborados en el proceso de fabricaci&oacute;n.</p>', '<p><strong>AP</strong>: Auxiliar de Producci&oacute;n</p>\n<p><strong>CICLO DE SELLADO:</strong> Es el periodo de tiempo que comprende del primer pouch sellado hasta el inicio de su esterilizaci&oacute;n</p>\n<p><strong>DEFECTO CR&Iacute;TICO</strong>: Es aqu&eacute;l que compromete la inocuidad del producto y no puede salir a la venta.</p>\n<p><strong>DEFECTO COSMETICO:</strong> Es aqu&eacute;l que afecta la est&eacute;tica del Pouch, generalmente son defectos que pueden salir a la venta.</p>\n<p><strong>IP:</strong> Ingeniero de Procesos.</p>\n<p><strong>OG:</strong> Operador General</p>\n<p><strong>JP:</strong> Jefe de Producci&oacute;n</p>\n<p><strong>&nbsp;OC:</strong> Operador de Codificado</p>\n<p><strong>&nbsp;OP:</strong> Operador de Paletizado</p>\n<p><strong>&nbsp;ORP:</strong> Operador de Recepci&oacute;n de Pouch</p>\n<p>&nbsp;<strong>OS:</strong> Operador de Sellado</p>\n<p><strong>&nbsp;OSC:</strong> Operador de Sistema de Conformidad</p>\n<p><strong>&nbsp;PEPS:</strong> Primeras Entradas y Primeras Salidas.</p>\n<p><strong>PALETIZADO:</strong> Acomodo de piezas selladas en tapetes</p>\n<p><strong>OC</strong>: Operador de Codificado</p>\n<p><strong>C&Oacute;DIGO</strong>: Conjunto de caracteres que permiten llevar la trazabilidad del producto (fecha de producci&oacute;n, hora, materia prima utilizada, etc)</p>\n<p><strong>PALETIZAR:</strong> Es colocar&nbsp; de manera ordenada un determinado n&uacute;mero de piezas de producto en tapetes para su posterior esterilizaci&oacute;n.</p>\n<p><strong>VAC&Iacute;O</strong>: Es la diferencia entre la presi&oacute;n atmosf&eacute;rica y la presi&oacute;n interna del envase, referidas a condiciones normales (20&ordm; C y 760 mmHg).</p>\n<p>&nbsp;</p>', '<p>pendiente</p>', '<p>pendiente</p>', '<p>pendiente</p>', ''),
(276, 'A', 'Edición', '25/08/2014', '', '', '', '', '', '', ''),
(277, 'A', 'Eliminado', '25/08/2014', '', '', '', '', '', '', ''),
(278, 'A', 'Edición', '25/08/2014', '', '', '', '', '', '', ''),
(279, 'A', 'Edición', '25/08/2014', '<p>Describir los pasos para realizar el proceso de descongelado de Pescado Entero.</p>\n<p><strong>&nbsp;</strong></p>', '<p>Este procedimiento aplica para todo el pescado entero destinado a descongelarse para su transformaci&oacute;n.</p>\n<p><strong>&nbsp;</strong></p>', '<p><strong>CONGELACI&Oacute;N:</strong> &nbsp;M&eacute;todo de conservaci&oacute;n f&iacute;sico que se efect&uacute;a por medio de equipo especial para lograr una reducci&oacute;n de la temperatura de los productos en su centro t&eacute;rmico a -18&plusmn;3&ordm; C.</p>\n<p>&nbsp;<strong>DESCONGELACI&Oacute;N</strong>: M&eacute;todo de p&eacute;rdida de fr&iacute;o que se puede efectuar con m&eacute;todos especiales o a temperatura ambiente y que consiste en aumentar la temperatura de los productos en su centro t&eacute;rmico.</p>\n<p>&nbsp;<strong>M&Eacute;TODOS DE PRUEBA:</strong> Procedimientos anal&iacute;ticos utilizados para comprobar que un producto satisface las especificaciones establecidas.</p>\n<p>&nbsp;<strong>PEPS:</strong> Primeras Entradas, Primeras Salidas.</p>\n<p>&nbsp;<strong>JPP:</strong> &nbsp;&nbsp;Jefe de Preparaci&oacute;n de Pescado.</p>\n<p>&nbsp;<strong>OD:&nbsp;&nbsp;&nbsp;</strong>&nbsp; Operador de descongelado.</p>\n<p>&nbsp;<strong>&nbsp;</strong><strong>PROCESO</strong>: Conjunto de actividades relativas a la obtenci&oacute;n, elaboraci&oacute;n, fabricaci&oacute;n, preparaci&oacute;n, conservaci&oacute;n, mezclado, acondicionamiento, envasado, manipulaci&oacute;n, transporte, distribuci&oacute;n, almacenamiento y expendio o suministro al p&uacute;blico de productos.</p>\n<p>&nbsp;</p>\n<p><strong>&nbsp;</strong></p>', '<p>5.1.&nbsp;El Jefe de producci&oacute;n deber&aacute; enviar por v&iacute;a electr&oacute;nica el plan de producci&oacute;n semanal a los Departamentos operativos, en caso de alg&uacute;n cambio, notificar&aacute; a los Gerentes de Departamento.</p>\n<p>&nbsp;</p>\n<p>5.2.&nbsp;El Supervisor de Preparaci&oacute;n de Pescado Entero, solicitar&aacute; los requerimientos diarios de materia prima y entregar&aacute; al operador de descongelado el programa de producci&oacute;n diario y semanal.</p>\n<p>&nbsp;</p>\n<p>5.3.El Jefe de Almac&eacute;n o auxiliar, deber&aacute; encender y tarar la b&aacute;scula antes de sacar el pescado congelado de la c&aacute;mara y despu&eacute;s entregar al encargado de descongelado seg&uacute;n la orden o solicitud de materia prima.</p>\n<p>&nbsp;</p>\n<p>5.4.El Operador de Descongelado deber&aacute; verificar que el &aacute;rea de descongelado se encuentre limpia y debe asegurar el correcto llenado de la cisterna. Recibir&aacute; el pescado entero verificando que se respeten las PEPS y que las cantidades sean correctas</p>\n<p>&nbsp;</p>\n<p>5.5.El Operador de Descongelado y el Jefe de almac&eacute;n, deber&aacute;n coordinar las actividades en conjunto con el Operador de Montacargas.</p>\n<p>&nbsp;&nbsp;</p>\n<p>5.6.El Jefe de Almac&eacute;n o el auxiliar verificar&aacute; que saquen las tinas de acuerdo a los RMP y volumen.</p>\n<p>&nbsp;</p>\n<p>5.7.El Operador de Descongelado sacar&aacute; por bloques el pescado de la C&aacute;mara de Congelaci&oacute;n de acuerdo a los tiempos seg&uacute;n la talla a descongelar Tabla: Seguimiento de preparaci&oacute;n de pescado secci&oacute;n A &nbsp;&ldquo;Descongelado&rdquo;.&nbsp;</p>\n<p>&nbsp;</p>\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="source/DESCONGELADO PESCADO ENTERO.png" alt="" width="841" height="638" /></p>\n<p>5.8.El Operador de Descongelado registrar&aacute; el n&uacute;mero de tina de almac&eacute;n en el sistema de conformidad FO-DE-001-A. Las tinas desde su recepci&oacute;n deber&aacute;n ser taradas e identificadas por el Jefe de almac&eacute;n o el auxiliar.</p>\n<p>&nbsp;</p>\n<p>5..9.El Operador de Descongelado deber&aacute; registrar los datos de peso, identificaci&oacute;n de tinas de descongelado, el RMP, la talla y temperatura en el sistema de conformidad FO-DE-001-A y dar&aacute; instrucciones al operador de montacargas de vaciar el at&uacute;n a las tinas de descongelado.</p>\n<p>&nbsp;</p>\n<p>5.10.El Operador de Descongelado verificar&aacute; el traslado inmediato de las tinas al cuarto de descongelado y verificar&aacute; la temperatura. La especificaci&oacute;n establecida de temperatura de recepci&oacute;n de at&uacute;n a descongelar es de -18&plusmn;3 &ordm;C.</p>\n<p>&nbsp;</p>\n<p>5.11.El Operador de Descongelado asegurar&aacute; que el acomodo de las tinas en el &aacute;rea de descongelado sea de acuerdo a la talla del pescado. Deber&aacute; colocar la manguera del sistema de descongelado dentro de los esquineros de las tinas. Utilizar&aacute; dos para llenar, y una sola para todo el proceso de descongelado en la recirculaci&oacute;n.</p>\n<p>&nbsp;</p>\n<p>5-12 El Operador de Descongelado deber&aacute; de encender las bombas de suministro de agua y verificar que el dosificador de cloro este encendido. Deber&aacute; llevar el registro del cloro consumido en el sistema de conformidad&nbsp; FO-DE-001-A. Llenar la cisterna de acuerdo al tonelaje de pescado a descongelar.</p>\n<p>&nbsp;</p>\n<p>&nbsp;5.13.El Operador de Descongelado deber&aacute; monitorear la temperatura en los intervalos de tiempo que especifica la tabla 1 y deber&aacute; registrar los datos en el sistema de conformidad FO-DE-001-A.</p>\n<p>&nbsp;</p>\n<p style="text-align: center;">&nbsp;</p>\n<table style="height: 119px;" width="408">\n<tbody>\n<tr>\n<td colspan="2" width="517">\n<table>\n<tbody>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p>TABLA 1. MONITOREO DE TEMPERATURA</p>\n</td>\n</tr>\n<tr>\n<td width="241">\n<p>TALLA</p>\n</td>\n<td width="277">\n<p>PERIODOS DE MONITOREO</p>\n</td>\n</tr>\n<tr>\n<td width="241">\n<p>Chica (1 a 5 kg)</p>\n</td>\n<td width="277">\n<p>Cada 30 minutos</p>\n</td>\n</tr>\n<tr>\n<td width="241">\n<p>Mediana (5 a 30 kg)</p>\n</td>\n<td width="277">\n<p>Cada 45 minutos</p>\n</td>\n</tr>\n<tr>\n<td width="241">\n<p>Grande (+30)</p>\n</td>\n<td width="277">\n<p>Cada 60 minutos</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p>5.14.Cuando el pescado llegue a un rango de&nbsp; temperatura de -3&deg;C&nbsp; a &ndash;2&deg;C, el Operador de Descongelado dar&aacute; por terminado el proceso de descongelado (IT&ndash;MT-001-A) Una vez terminado este proceso, deber&aacute; vaciar la cisterna inmediatamente.</p>\n<p>&nbsp;</p>\n<p>5.15.El Operador de Descongelado deber&aacute; dar aviso al Operador del Montacargas para que lleve las tinas al &aacute;rea de eviscerado.</p>\n<p>&nbsp;</p>\n<p>1.3.Una vez finalizado el proceso de descongelado, se informara al Departamento de Sanidad quien deber&aacute; limpiar el &Aacute;rea de acuerdo al Procedimiento de Operaci&oacute;n Est&aacute;ndar de Sanidad PR-SA-001-A.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;</strong></p>\n<ol start="2">\n<li><strong>&nbsp;&nbsp;&nbsp; </strong><strong>ACCIONES CORRECTIVAS</strong></li>\n</ol>\n<p><strong>&nbsp;</strong></p>\n<ul>\n<li>Cuando exista alguna desviaci&oacute;n de calidad e inocuidad deber&aacute; de informar al Ingeniero de Procesos para que indique el procedimiento a seguir.</li>\n</ul>\n<p>&nbsp;</p>\n<p><strong>&nbsp;</strong></p>', '<p>XCS</p>', '<p>DDF</p>', ''),
(280, 'A', 'Edición', '25/08/2014', '', '', '', '', '', '', ''),
(283, 'A', 'Eliminado', '25/08/2014', '', '', '', '', '', '', ''),
(286, 'A', 'Autorizado', '26/08/2014', '<p>Describir las actividades para el Mantenimiento Preventivo de la infraestructura, mobiliario y equipo de la planta Procesa &nbsp;con personal interno del Departamento de Mantenimiento.</p>', '<p>Aplica a los trabajos de mantenimiento preventivo realizado a la infraestructura, mobiliario y equipo, propiedad de Procesa por parte del Departamento de Mantenimiento.</p>', '<p><strong>MANTENIMIENTO PREVENTIVO:</strong> Son los servicios de inspecci&oacute;n, control, conservaci&oacute;n y restauraci&oacute;n de un equipo o &aacute;rea con la finalidad de prevenir, detectar o corregir defectos tratando de evitar fallas.</p>\n<p>&nbsp;</p>\n<p><strong>MANTENIMIENTO CORRECTIVO</strong>:ES &nbsp;aquel que corrige los defectos observados en los equipos o instalaciones, es la forma m&aacute;s b&aacute;sica de mantenimiento y consiste en localizar aver&iacute;as o defectos y corregirlos o repararlos.</p>\n<p>&nbsp;</p>\n<p><strong>PROGRAMA DE MANTENIMIENTO PREVENTIVO:</strong> Es la programaci&oacute;n de una serie de inspecciones (de funcionamiento y de seguridad), ajustes, reparaciones, an&aacute;lisis, limpieza, lubricaci&oacute;n, calibraci&oacute;n, que deben llevarse a cabo en forma peri&oacute;dica en base a un plan y no a una demanda del operario o usuario, por lo que tambi&eacute;n es conocido como Mantenimiento Preventivo Planificado (MPP), y su prop&oacute;sito es prever las fallas manteniendo los sistemas de infraestructura, equipos e instalaciones en completa operaci&oacute;n a los niveles y eficiencia &oacute;ptimos.</p>\n<p>&nbsp;</p>\n<p><strong>PROGRAMA DE REQUERIMIENTO DE MATERIALES:</strong> Es la planeaci&oacute;n detallada y calendarizada de los recursos materiales requeridos, destinados a la conservaci&oacute;n de la infraestructura, mobiliario y equipos.</p>\n<p>&nbsp;</p>\n<p><strong>CPRE:</strong> Coordinador de Prerrequisito.</p>\n<p><strong>&nbsp;</strong></p>', '<p>El&nbsp; CPRE deber&aacute; Revisar e imprimir el Cronograma de Mantenimiento Preventivo &nbsp;(FO-MT-001-A) anualmente de &aacute;reas y equipos generado por el Software MP ver 9.6 profesional, deber&aacute; ser presentarlo al jefe de Mantenimiento para su autorizaci&oacute;n. As&iacute; como tambi&eacute;n se generara el Cronograma Anual de Calibraci&oacute;n de Instrumentaci&oacute;n de medici&oacute;n (FO-MT-002-A)</p>\n<p>&nbsp; &nbsp;&nbsp;</p>\n<p><strong>5.1.&nbsp;&nbsp; </strong><strong>MANTENIMIENTO PREVENTIVO Y CORRECTIVO A EQUIPO E INSTALACIONES</strong></p>\n<p>&nbsp;5.1.1.El CPRE deber&aacute; analizar las necesidades estableciendo prioridades en materia de conservaci&oacute;n de los bienes y equipos de cada una de las &aacute;reas.</p>\n<p style="text-align: justify;">&nbsp;5.1.2.El CPRE deber&aacute; proporcionar al Software MP toda la informaci&oacute;n necesaria para que este puede programar el Mantenimiento Preventivo considerando informaci&oacute;n obtenida de manuales y operaci&oacute;n. La informaci&oacute;n ser&aacute; impresa en el formato Orden de trabajo(FO-MTI-003-A)&nbsp;<strong>&nbsp;</strong>y entregada a todo el personal de mantenimiento para su seguimiento y ejecuci&oacute;n.</p>\n<p>&nbsp;5.1.3.El Jefe de Mantenimiento deber&aacute; informar al Departamento de Compras las necesidades de refacciones y/o equipo para llevar a cabo el Mantenimiento Preventivo y/o correctivo seg&uacute;n sea el caso. Todos los&nbsp; materiales solicitados&nbsp; deben de cumplir con las siguientes caracter&iacute;sticas, con la finalidad de mantener siempre la inocuidad del producto.</p>\n<p>&nbsp;5.1.3.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Todas las refacciones y equipos adquiridos deber&aacute;n estar dise&ntilde;ados y construidos para facilitar la limpieza, la desinfecci&oacute;n y su mantenimiento</p>\n<p>&nbsp;5.1.3.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Todas las refacciones, equipos y materiales para construcci&oacute;n, las &nbsp;superficies de contacto no deben afectar ni ser afectadas por el producto o los sistemas de limpieza. Estos insumos deben ser construidos de material durable resistente a las limpiezas repetidas requeridas.</p>\n<p>&nbsp;5.1.3.3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Todo material que sirva para construcci&oacute;n y/o reparaci&oacute;n de equipos e instalaciones, Las superficies de contacto deben ser construidas de materiales para uso alimentario, impermeables y libres de<span style="color: rgb(0, 0, 0);"> <a href="http://www.monografias.com/trabajos3/corrosion/corrosion.shtml"><span style="color: rgb(0, 0, 0);">corrosi&oacute;n</span></a>.</span></p>\n<p>&nbsp;5.1.4.El CPRE deber&aacute; girar instrucciones a su personal sobre los trabajos asignados y solicitados por las dem&aacute;s &aacute;reas mediante el formato de SOLICITUD DE TRABAJO (FO-MT-004-A). Adem&aacute;s en conjunto con el coordinador de almac&eacute;n de refacciones &nbsp;deber&aacute; entregar materiales para la realizaci&oacute;n del Mantenimiento Preventivo y/o correctivo&nbsp; en caso de ser necesario.</p>\n<p>&nbsp;5.1.5.El Personal de Mantenimiento deber&aacute; realizar los trabajos en tiempo y forma, cuidando que el &aacute;rea de trabajo quede completamente libre de residuos, materiales extra&ntilde;os y herramientas de trabajo.</p>\n<p>&nbsp;5.1.6.Deber&aacute; registrar el trabajo realizado en el formato correspondiente al &aacute;rea donde se realiz&oacute; la actividad, tomando en cuenta las siguientes instrucciones:</p>\n<p style="text-align: justify;">&nbsp;5.1.6.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Despu&eacute;s de haber realizado las actividades de mantenimiento el personal de sanidad realiza la limpieza y sanitizaci&oacute;n correspondiente ya sea equipo o &nbsp;instalaciones&nbsp; que mantenimiento&nbsp; ha intervenido y deber&aacute;n realizarlo de acuerdo a los&nbsp; procedimientos de Operaci&oacute;n Est&aacute;ndar de Sanidad POES (PR-SA-001-A) y&nbsp; registrarlo en el formato( FT-SA-005-A) (Aplica &uacute;nicamente en &aacute;reas de proceso) para las &aacute;reas externas el responsable de realizar limpieza de los equipos es el departamento de mantenimiento y se documenta en los formatos Orden de Trabajo del software MP con folio FO-MT-003-A y en el formato Solicitud de Trabajo con folio FO-MT-004-A seg&uacute;n sea el caso.</p>\n<p>&nbsp;5.1.7.Para el caso de actividades de mantenimiento correctivo por aver&iacute;a de alg&uacute;n equipo o instalaciones que sean ocurridas&nbsp; durante la operaci&oacute;n&nbsp; se deber&aacute; seguir los siguientes pasos:</p>\n<p>&nbsp;</p>\n<ol>\n<li>&nbsp;&nbsp;&nbsp;&nbsp; El CPRE comunica al supervisor de producci&oacute;n, aseguramiento de calidad y supervisor de sanidad de una actividad de mantto correctivo en zona de producto</li>\n<li>&nbsp;&nbsp;&nbsp;&nbsp; En coordinaci&oacute;n con los involucrados&nbsp; descritos en el punto No. 1 se despejara el &aacute;rea de tal manera que se tenga el espacio suficiente para realizar la correcci&oacute;n del equipo y as&iacute; mismo el &aacute;rea despejada debe ser tal que no pueda haber contacto con el producto</li>\n<li>&nbsp;&nbsp;&nbsp;&nbsp; Despu&eacute;s de haber realizado la reparaci&oacute;n, el personal de sanidad realiza la limpieza y sanitizacion de acuerdo a lo descrito en la secci&oacute;n 5.1.6.1.</li>\n</ol>\n<p>&nbsp;</p>\n<p>&nbsp;5.1.8.Para el caso de actividades de mantenimiento a edificios que implique construcci&oacute;n&nbsp; y/o remodelaci&oacute;n de las instalaciones este deber&aacute; considerar un&nbsp; dise&ntilde;o higi&eacute;nico, incluyendo: ser liso, accesible, limpiable, autodrenante en &aacute;reas de proceso h&uacute;medo y debe ser construido de materiales compatibles con el producto y con los productos de lavado y enjuague, de acuerdo a lo descrito en el procedimiento de Planificaci&oacute;n y Construcci&oacute;n de Equipos e Instalaciones (PR-MT-003-A)</p>\n<p>&nbsp;5.1.9.&nbsp;El Jefe de Mantenimiento y/o Encargado de CPRE deber&aacute; elaborar mensualmente el reporte de los servicios de las &aacute;reas atendidas y actualizar los avances del Programa Anual de Mantenimiento&nbsp; y presentarlo al Gerente de Operaciones</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '<p>Tutorial del software MP ver 9.6 profesional instalado en PC de Jefe de Mantenimiento y PC de CPRE</p>\n<p>&nbsp;</p>', '<p>N/A</p>\n<p>&nbsp;</p>', '');
INSERT INTO `plantilla_completa` (`id_documento`, `rev`, `estado`, `fecha`, `objetivo`, `alcance`, `definiciones`, `desarrollo`, `referencias`, `anexos`, `revision`) VALUES
(287, 'A', 'Autorizado', '26/08/2014', '<p>Describir las actividades para la Calibraci&oacute;n de Instrumentos de Medici&oacute;n de Temperatura, Presi&oacute;n y Masa.</p>', '<p>Aplica a todos los Instrumentos de Medici&oacute;n de Temperatura, Presi&oacute;n y Masa usados en planta.</p>', '<p><strong>CALIBRACI&Oacute;N</strong>: Es la comparaci&oacute;n de un instrumento o sistema de medici&oacute;n de exactitud no verificada con un instrumento o sistema de exactitud conocida para detectar cualquier desviaci&oacute;n del comportamiento requerido.</p>\n<p><strong>MPI:</strong> Microprocesador Programable Inteligente</p>', '<p style="text-align: justify;">1.1.El Jefe de Mantenimiento deber&aacute; elaborar el Cronograma Anual de Calibraci&oacute;n de los Instrumentos de Medici&oacute;n de acuerdo a los manuales de usuario y presentarlo al Gerente de Operaciones&nbsp; para su autorizaci&oacute;n (FO-MT-002-A), del cual el responsable de calibraci&oacute;n deber&aacute; apegarse para realizar las calibraciones necesarias.</p>\n<p style="text-align: justify;">&nbsp;1.2.El Responsable de Calibraci&oacute;n deber&aacute; llenar los siguientes formatos Revisi&oacute;n Mensual de B&aacute;sculas de Proceso(FO-MT-005-A) y Revisi&oacute;n Mensual de los Term&oacute;metros de Proceso (FO-MT-006-A) para verificar correcto funcionamiento y calibraci&oacute;n de masa y temperatura respectivamente. Otros equipos ser&aacute;n revisados con patrones externos debidamente certificados, estos deber&aacute;n ser calibrados m&iacute;nimamente una vez por a&ntilde;o.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>1.2.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REVISION MENSUAL DE LOS TERMOMETROS DE PROCESO</strong></p>\n<p style="text-align: justify;">&nbsp;1.2.1.1.&nbsp;&nbsp; El Responsable de Calibraci&oacute;n deber&aacute; conseguir los siguientes materiales y condiciones para llevar a cabo este procedimiento.</p>\n<p style="text-align: justify;">&nbsp;1.2.1.1.1.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Term&oacute;metro patr&oacute;n para comparaci&oacute;n de temperatura debidamente certificado</p>\n<p style="text-align: justify;">1.2.1.1.1.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Recipiente de acero inoxidable para realizar comparativos</p>\n<p style="text-align: justify;">1.2.1.1.1.3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &Aacute;rea libre de vibraciones y viento</p>\n<p style="text-align: justify;">1.2.1.1.1.4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hielo</p>\n<p style="text-align: justify;">1.2.1.1.1.5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Agua</p>\n<p style="text-align: justify;">1.2.1.1.1.6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Term&oacute;metros a calibrar</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">1.2.1.2.&nbsp;&nbsp; Se deber&aacute; colocar hielo y agua en el recipiente hasta homogenizarlo en todos sus puntos logrando alcanzar la temperatura de 0 &deg;C, lectura registrada con el term&oacute;metro patr&oacute;n</p>\n<p style="text-align: justify;">&nbsp;1.2.1.3.&nbsp;&nbsp; Se deber&aacute; introducir term&oacute;metro a calibrar para realizar el comparativo anotar valores como lo indica el Formato Revisi&oacute;n Mensual de los Term&oacute;metros de Proceso (FO-MT-006-A)</p>\n<p style="text-align: justify;">&nbsp;1.2.1.4.&nbsp;&nbsp; Estos registros deber&aacute;n ser guardados y archivados por el departamento de mantenimiento.</p>\n<p style="text-align: justify;">&nbsp;&nbsp;1.3.El Jefe de Mantenimiento deber&aacute; revisar y autorizar el Informe de Calibraci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>1.3.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PARA AUTOCLAVES</strong></p>\n<p style="text-align: justify;"><strong>&nbsp;</strong>1.3.1.1.&nbsp;&nbsp; El Responsable de Calibraci&oacute;n deber&aacute; programar junto con el Supervisor de Esterilizado la calibraci&oacute;n de los instrumentos de temperatura de las autoclaves.</p>\n<p style="text-align: justify;">&nbsp;1.3.1.2.&nbsp;&nbsp; El Responsable de Calibraci&oacute;n deber&aacute; comparar las lecturas del MPI y el graficador con el term&oacute;metro de mercurio y/o digital de referencia, seg&uacute;n sea el caso.</p>\n<p style="text-align: justify;">&nbsp;1.3.1.3.&nbsp;&nbsp; El Responsable de Calibraci&oacute;n deber&aacute; realizar el ajuste del MPI para igualar las temperaturas cuando sea necesario.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;"><strong>1.3.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PARA INSTRUMENTOS DE MEDICI&Oacute;N DE PRESI&Oacute;N</strong></p>\n<p style="text-align: justify;">&nbsp;1.3.2.1.&nbsp;&nbsp; Todos los equipos de medici&oacute;n de presi&oacute;n de la planta usados en proceso son calibradas mediante el servicio de un Laboratorio acreditado para su calibraci&oacute;n</p>\n<p style="text-align: justify;">&nbsp;1.3.3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PARA INSTRUMENTOS DE DETERMINACI&Oacute;N DE MASAS</p>\n<p style="text-align: justify;">&nbsp;1.3.3.1.&nbsp;&nbsp; Todas las b&aacute;sculas de la planta son calibradas mediante el servicio de un Laboratorio acreditado para su calibraci&oacute;n. Estas mismas ser&aacute;n revisadas por un periodo mensual por el personal de mantenimiento para verificar su correcto funcionamiento, esta actividad se deber&aacute; documentar en el formato formatos Revisi&oacute;n Mensual de B&aacute;sculas de Proceso(FO-MT-005-A)</p>\n<p style="text-align: justify;">&nbsp;1.3.3.2.&nbsp;&nbsp; El informe de calibraci&oacute;n de estos instrumentos son elaborados por el laboratorio acreditado que realiz&oacute; la calibraci&oacute;n y son entregados al Jefe y/o Encargado de la Jefatura&nbsp; de Mantenimiento.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(288, 'A', 'Edición', '26/08/2014', '', '', '', '', '', '', ''),
(289, 'A', 'Aprobación', '26/08/2014', '<p>Describir las actividades para la Planificaci&oacute;n y Construcci&oacute;n de Edificios dentro de la Planta Procesa.</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>', '<p>Aplica a las actividades de planificaci&oacute;n y construcci&oacute;n de&nbsp; edificios que se realicen dentro de la&nbsp; propiedad de Procesa por parte del Departamento de Mantenimiento</p>\n<p>&nbsp;</p>', '<p><strong>PLANIFICACION:</strong> Plan general, cient&iacute;ficamente organizado y frecuentemente de gran amplitud, para obtener un objetivo determinado</p>\n<p><strong>COSTRUCCION:</strong> Arte o t&eacute;cnica de construir o edificar una obra de&nbsp; ingenier&iacute;a, arquitectura o alba&ntilde;iler&iacute;a</p>\n<p>&nbsp;<strong>EDIFICIO:</strong>Construcci&oacute;n hecha con materiales resistentes para albergar a personas, cosas o actividades.</p>\n<p><strong>COMIT&Eacute; GERENCIAL OPERATIVO:&nbsp; </strong>Gerencia Operativa, Calidad, Suministros, Log&iacute;stica, Capital Humano.</p>', '<p>5.1. Surge una Necesidad de Construcci&oacute;n/Adquisici&oacute;n de Instalaci&oacute;n&nbsp; (Proyecto) Propio o de Auditoria en &Aacute;reas Operativas/Administrativas.</p>\n<p>&nbsp;5.2. El Jefe de Mantenimiento genera una Orden de Trabajo para el Proyecto requerido mediante el Formato Orden de Trabajo (FO-MT-003-A).</p>\n<p>&nbsp;5.3. La Orden de Trabajo emitida se entrega a la Gerencia de Operaciones&nbsp; para que otorgue su Vo.Bo.</p>\n<p>5.3.1 Si la Orden de Trabajo es Autorizada por la Gerencia de Operaciones pasa al punto 5.4 de este Procedimiento.</p>\n<p>5.3.2. Si la Orden de Trabajo No es Autorizada por la Gerencia de Operaciones, el Jefe de Mantenimiento coloca en la Orden de Trabajo (FO-MT-003-A)</p>\n<p>&nbsp;5.4. Autorizada la Orden de Trabajo por la Gerencia de Operaciones el Jefe de Mantenimiento en conjunto con el departamento de compras inicia la b&uacute;squeda de Proveedores y la cotizaci&oacute;n para la realizaci&oacute;n de la Orden de Trabajo considerando los Puntos Normativos de la FSCC 22000 (Pto 7.2.3.).</p>\n<p>&nbsp;5.5. El Jefe de Mantenimiento presenta como m&iacute;nimo 2 Cotizaciones de lo requerido en la Orden de Trabajo y lo presenta al Comit&eacute; Gerencial Operativo para su Vo.Bo.</p>\n<p>5.5.1. El Comit&eacute; Gerencial Operativo selecciona una Cotizaci&oacute;n y otorga el Vo.Bo., pasa al punto 5.6 de este procedimiento.</p>\n<p>5.5.2. El Comit&eacute; Gerencial no otorga su Vo.Bo. del Proyecto y el Jefe de Mantenimiento cierra la Orden de Trabajo (FO-MT-003-A) emitida e Informa al Solicitante del mismo.</p>\n<p>&nbsp;5.6. Autorizada la Orden de Trabajo por el Comit&eacute; Gerencial Operativo, este mismo o la Gerencia de Operaciones solicita Autorizaci&oacute;n a la Alta Direcci&oacute;n el Vo.Bo.</p>\n<p>5.6.1. La Alta Direcci&oacute;n Otorga su Vo.Bo. pasa al punto 5.7. de este procedimiento.</p>\n<p>5.6.2. La Alta Direcci&oacute;n No Otorga su Vo.Bo., el Jefe de Mantenimiento cierra la Orden de Trabajo (FO-MT-003-A) emitida e Informa al Solicitante del mismo.</p>\n<p>&nbsp;5.7. El Jefe de Mantenimiento genera la Requisici&oacute;n del Servicio de Compras al Departamento de Suministros por medio del Formato Generador de &Oacute;rdenes de Compra para Bienes y Servicios (FO-CO-001-A)</p>\n<p>&nbsp;5.8. Una vez Generada la Orden de Compra de acuerdo a las fechas de entrega por parte del Proveedor el Jefe de Mantenimiento programa la Actividad realizando un Diagrama de Gantt para definir actividades principales y tiempos de ejecuci&oacute;n.</p>\n<p>&nbsp;5.9. El Jefe de Mantenimiento supervisa el cumplimiento de las actividades y de los tiempos de ejecuci&oacute;n asegurando el cumplimiento de los Lineamientos declarados en la Norma FSCC 22000 (Pto 7.2.3.)</p>\n<p>&nbsp;5.10 Concluida las Actividades de la Orden de Trabajo el Proveedor entrega al &nbsp;Jefe de Mantenimiento junto al Solicitante para su Vo.Bo.</p>\n<p>&nbsp;5.11. El Jefe de Mantenimiento cierra la Orden de Trabajo de la Actividad.</p>', '<p>FSCC 22000 Punto 7.2.3.</p>\n<p>&nbsp;</p>', '<p>NA</p>', ''),
(290, 'A', 'Autorizado', '26/08/2014', '<p>Este procedimiento tiene como prop&oacute;sito describir el Proceso Interno de Tratamiento de Agua de Planta Procesa.</p>', '<p>Este documento aplica toda vez que se realice el Proceso de Tratamiento de Agua desde que se recibe del tanque elevado hasta la distribuci&oacute;n en todas las &aacute;reas de la planta Procesa Chiapas.</p>\n<p>&nbsp;</p>', '<p><strong>AGUA DURA:</strong> Cuando el agua contiene una cantidad significante de Calcio y Magnesio.</p>\n<p>&nbsp;</p>\n<p><strong>AGUA SUAVIZADA:</strong> Agua libre de iones Calcio y Magnesio.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>SUAVIZADOR:</strong> Unidad que se utiliza para ablandar el agua, eliminando los minerales que hacen que dicha agua sea dura.</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>RETROLAVADO o REGENERADO:</strong> Limpieza del filtro mediante el flujo inverso del agua.</p>\n<p><strong>&nbsp;</strong></p>', '<h5 style="text-align: justify;"><a name="_Toc374359368"></a>La Planta Procesa se abastece de agua potable de la red municipal de COAPATAP del parque industrial.</h5>\n<h5 style="text-align: justify;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>\n<h5 style="text-align: justify;"><a name="_Toc374359369"></a>El tratamiento Fisicoqu&iacute;mico y Microbiol&oacute;gico del agua que se distribuye en toda la Planta es&nbsp; el siguiente:</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;"><a name="_Toc374359370"></a>Para la desinfecci&oacute;n del agua se utiliza el Tratamiento Qu&iacute;mico mediante la dosificaci&oacute;n (bomba dosificadora) con cloro el cual se introduce en la tuber&iacute;a antes de&nbsp; almacenarse en la cisterna general. El Operador de Calderas deber&aacute; monitorear y verificar que no falte cloro para la cisterna as&iacute; como el buen funcionamiento de la bomba dosificadora</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">El agua es filtrada a trav&eacute;s del Filtro de Arena 1 cuya funci&oacute;n es retener y eliminar las part&iacute;culas s&oacute;lidas suspendidas en el agua. Cuando el caudal del agua que cae a la cisterna no es el adecuado, el Operador de Calderas deber&aacute; realizar un retrolavado a este filtro y lo registrar&aacute; en el formato Monitoreo del Tratamiento de Agua. (FO-MT-007-A).</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.1.1.&nbsp;&nbsp; El agua se almacena en una cisterna con capacidad de 120,000 litros. La concentraci&oacute;n de cloro que deber&aacute; tener el agua es de 0.2-1.5 ppm para eliminar cualquier tipo de microorganismos pat&oacute;genos que pudieran haber ingresado despu&eacute;s del Filtro de Arena 1. El Operador de Calderas deber&aacute; realizar pruebas de cloro y alcalinidad (pH) del agua de la cisterna para determinar el porcentaje presente en el agua, de acuerdo a su instructivo IT-MT-001-A &nbsp;y deber&aacute; registrarlo en el formato Monitoreo del tratamiento de agua (FO-MT-007-A).</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.1.2.El agua clorada es bombeada &nbsp;hacia el Filtro de Arena 2 para eliminar turbiedad. El Operador de Calderas deber&aacute; regenerar este filtro una vez por semana para limpiarlo, determinar la concentraci&oacute;n de cloro, pH y lo registrar&aacute; en el formato Monitoreo del tratamiento de agua (FO-MT-007-A).</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.1.3.&nbsp;&nbsp; Posteriormente, el agua pasa por un Filtro de Carb&oacute;n donde se eliminan cloro, sabor, olor y color. El Operador de Calderas deber&aacute; determinar la concentraci&oacute;n de cloro, as&iacute; como medir el pH de este filtro y regenerarlo para limpiarlo, lo cual se registra en el formato Monitoreo del tratamiento de agua (FO-MT-007-A).</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.1.4.&nbsp;&nbsp; Despu&eacute;s que el agua ha pasado por el Filtro de Carb&oacute;n,&nbsp; pasa por un Filtro Suavizador para eliminar la dureza. El agua suavizada es mantenida de 0 a 120 ppm de dureza y es distribuida por toda la Planta Procesa Chiapas. El Operador de Calderas deber&aacute; determinar la dureza a este filtro de acuerdo a su instructivo IT-MT-001-A y lo registrar&aacute; en el formato Monitoreo del tratamiento de agua (FO-MT-007-A)</h5>\n<h5 style="text-align: justify;">&nbsp;1.1.5.&nbsp;&nbsp; El Operador de Calderas deber&aacute; monitorear los siguientes&nbsp; par&aacute;metros fisicoqu&iacute;micos en cada uno de los puntos del Tratamiento de Aguas de acuerdo al horario que se indica en el formato Monitoreo del Tratamiento de Agua (FO-MT-007-A):</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;"><strong>&nbsp;1.2.REGENERACION DEL SUAVIZADOR</strong></h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.2.1.&nbsp;&nbsp; El Operado de Calderas deber&aacute; preparar en el tanque destinado la soluci&oacute;n salina agregando aprox. 100 kg de Sal en grano.</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.2.2.&nbsp;&nbsp; Cuando se detecta que hay dureza cerca del l&iacute;mite superior indicado, el Operador de Calderas deber&aacute; preparar el equipo para su regenerado autom&aacute;tico el fin de semana.</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.2.3.&nbsp;&nbsp; El&nbsp; equipo succiona la soluci&oacute;n salina hacia el suavizador inund&aacute;ndolo lentamente, distribuyendo la soluci&oacute;n salina en todo el tanque desplazando as&iacute; el agua dura.</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.2.4.&nbsp;&nbsp; Se realiza un enjuague a toda la cama de resina. La resina retiene el Sodio, el Calcio y Magnesio para ser drenados.</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.2.5.&nbsp;&nbsp; El enjuague&nbsp; lava la resina en un flujo hacia abajo para asegurar que toda la soluci&oacute;n salina ha sido eliminada de la resina.</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<h5 style="text-align: justify;">1.2.6.&nbsp;&nbsp; El agua fluye a trav&eacute;s de la cama de resina en un flujo hacia arriba, previendo agua suave a las l&iacute;neas de servicio de la planta Procesa Chiapas.</h5>\n<h5 style="text-align: justify;">&nbsp;</h5>\n<p style="text-align: justify;">&nbsp;</p>', '<p>Manual de Servicio Mod. 3900 (Proveedor&nbsp; Pentair Water Treatment)</p>\n<p>&nbsp;</p>\n<p><a name="_Toc374359373"></a>NOM-041-SSA1-1993. Bienes y Servicios. Agua purificada envasada. Especificaciones Sanitarias.</p>\n<p>&nbsp;</p>', '<p>N/A</p>', ''),
(291, 'A', 'Autorizado', '26/08/2014', '<p><a name="OLE_LINK2"></a><a name="OLE_LINK1"></a>Este procedimiento tiene como prop&oacute;sito describir los pasos a seguir para realizar una solicitud de trabajo y su seguimiento.</p>\n<p>&nbsp;</p>', '<p>Este documento aplica desde que se solicita el trabajo hasta que se entrega realizado.</p>\n<p>&nbsp;</p>', '<p>N/A</p>', '<p>1.1.Es responsabilidad de todas las &aacute;reas cuando se requiera alg&uacute;n trabajo de reparaci&oacute;n, compostura, revisi&oacute;n, enviar el formato Solicitud de Trabajo (FO-MT-004-A) al supervisor y/o&nbsp; Jefe&nbsp; de Mantenimiento.</p>\n<p>&nbsp;</p>\n<p>1.2.Una vez recibida la solicitud de trabajo, el supervisor de Mantenimiento procede a generar la orden de trabajo individual para el personal de mantenimiento mediante el formato Orden de trabajo (FO-MT-003-A) expedida por el software MP9, el supervisor de&nbsp; Mantenimiento deber&aacute; realizar en conjunto con ellos la lista de los materiales que son necesarios comprar.</p>\n<p>&nbsp;&nbsp;</p>\n<p>1.3.Cuando sea necesario comprar material, el Jefe de Mantenimiento deber&aacute; gestionar el recurso y enviar la requisici&oacute;n al Departamento de Compras por medio de la Solicitud de Materiales (FO-CO-002-A).</p>\n<p>&nbsp;</p>\n<p>&nbsp;1.4.El tiempo de realizaci&oacute;n de la solicitud depender&aacute; de varios factores:</p>\n<p>&nbsp;a)&nbsp;&nbsp;&nbsp; De ser una reparaci&oacute;n urgente que ocasion&oacute; un paro en producci&oacute;n se realizar&aacute; la solicitud de manera inmediata y de no tener el material para realizar una reparaci&oacute;n definitiva se realizar&aacute; una temporal&nbsp; de acuerdo a como lo describe el Procedimiento de Reparaciones Temporales (PR-MT-007-A) y se programa la reparaci&oacute;n definitiva que se realizar&aacute;&nbsp; posteriormente.</p>\n<p>&nbsp;b)&nbsp;&nbsp;&nbsp; De ser una solicitud no urgente se realizar&aacute; en un lapso de una semana, partiendo de la recepci&oacute;n del material (por parte del Departamento de Compras) necesario para realizar la misma. Si se tiene existencia&nbsp; del material a utilizar, la orden&nbsp; se realizar&aacute; en una semana a partir de la fecha de recepci&oacute;n de la solicitud.</p>\n<p>&nbsp;&nbsp;</p>\n<p>1.5.El personal de mantenimiento una vez terminada la solicitud de trabajo le har&aacute; entrega a la persona que lo solicit&oacute; para que d&eacute; su visto bueno y se archivara en la carpeta de &oacute;rdenes correctivas.</p>\n<p>&nbsp;</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(292, 'A', 'Autorizado', '26/08/2014', '<p><a name="OLE_LINK2"></a><a name="OLE_LINK1"></a>Establecer los lineamientos m&iacute;nimos necesarios para asegurar que las reparaciones temporales de mantenimiento no se conviertan en un potencial riesgo de contaminaci&oacute;n del producto.</p>\n<p>&nbsp;</p>', '<p>Este procedimiento es aplicable a todo el personal de mantenimiento en todas las &aacute;reas de producci&oacute;n y almacenes de&nbsp; Procesamiento Especializado de Alimentos S.A.P.I.&nbsp; DE C.V.&nbsp;&nbsp;</p>', '<p><strong>Reparaci&oacute;n Permanente</strong>.- Acci&oacute;n f&iacute;sica realizada para permitir a un elemento, equipo o instalaciones averiados desarrollar su funci&oacute;n requerida original para la que fue creado restituyendo &iacute;ntegramente los materiales, las partes&nbsp; y&nbsp; las condiciones f&iacute;sicas con las que fue creado.</p>\n<p><strong>&nbsp;</strong><strong>Reparaci&oacute;n Temporal.</strong>- Acci&oacute;n f&iacute;sica realizada de emergencia para permitir a un elemento o equipo averiado desarrollar su funci&oacute;n requerida original durante un intervalo de tiempo limitado y hasta una reparaci&oacute;n permanente en un&nbsp; paro programado de la l&iacute;nea o equipo.</p>', '<p style="text-align: justify;">5.1De acuerdo al Procedimiento de Mantenimiento Preventivo/Correctivo a Equipos y Edificios &nbsp;(PR-MT-001-A) ser&aacute;n comunicados al departamento de mantenimiento a trav&eacute;s de la Solicitud de Trabajo (FO-MT-004-A).</p>\n<p style="text-align: justify;">El personal de mantenimiento atender&aacute; la solicitud emprendiendo acciones para realizar las reparaciones oportunamente evaluando en base al tiempo estimado de reparaci&oacute;n, a las existencias de los materiales en el almac&eacute;n de refacciones y al personal necesario&nbsp; si se realiza una reparaci&oacute;n permanente o una reparaci&oacute;n temporal.</p>\n<p style="text-align: justify;">&nbsp;5.2 En caso de realizar una reparaci&oacute;n permanente no se debe usar cinta, alambre, hilo, cart&oacute;n, pl&aacute;stico o ning&uacute;n otro material temporal y se proceder&aacute; de acuerdo a la secci&oacute;n de mantenimiento &nbsp;preventivo&nbsp; 5.6.</p>\n<p style="text-align: justify;">&nbsp;5.3 En caso de ser necesario una reparaci&oacute;n temporal se dar&aacute; aviso al Jefe de &aacute;rea y/o al Jefe de mantenimiento antes de realizar cualquier acci&oacute;n.</p>\n<p style="text-align: justify;">&nbsp;5.4 El Jefe del &aacute;rea solicitante de la reparaci&oacute;n&nbsp; se comunicar&aacute; inmediatamente con el Jefe de Mantenimiento para definir que&nbsp; materiales se van a utilizar en la reparaci&oacute;n temporal teniendo cuidado de que:</p>\n<p style="text-align: justify;">&nbsp;a) Cualquier reparaci&oacute;n temporal en superficies de contacto con los alimentos se realice con materiales grado alimenticio.</p>\n<p style="text-align: justify;">b) En caso de reparaciones temporales en superficies que no son de contacto con los alimentos se podr&aacute;n utilizar los&nbsp; materiales se&ntilde;alados en el punto 5.2.</p>\n<p style="text-align: justify;">&nbsp;5.5 El Jefe de Mantenimiento colocar&aacute; en el equipo que se repar&oacute; una etiqueta FO-MT-022-A con la fecha en que se hizo la reparaci&oacute;n temporal&nbsp; adem&aacute;s escribir&aacute;&nbsp; la fecha&nbsp; programada&nbsp; para&nbsp; remplazar dicha reparaci&oacute;n temporal por una permanente.&nbsp; No se deber&aacute;n colocar etiquetas en zonas de producto o en las &aacute;reas de producto que pongan en riesgo la integridad del producto.</p>\n<p style="text-align: justify;">&nbsp;5.6&nbsp; El Jefe de Mantenimiento y/o Encargado de la Jefatura&nbsp; de Mantenimiento&nbsp; deber&aacute; Solicitar al Departamento de Compras las necesidades de refacciones y/o equipo en caso de ser necesario&nbsp; para llevar a cabo la reparaci&oacute;n permanente, la requisici&oacute;n de materiales deber&aacute; llevarse acabo a trav&eacute;s del formato Solicitud de Materiales (FO-CO-002-A).</p>\n<p style="text-align: justify;">&nbsp;5.7 Todas y cada una de las reparaciones temporales que se lleven a cabo en la planta&nbsp; se registraran en el formato de Orden de&nbsp; Trabajo (FO-MT-003-A). La orden de trabajo de mantenimiento correctivo deber&aacute; llevar&nbsp; la fecha programada para&nbsp; remplazar la reparaci&oacute;n temporal por una permanente.</p>\n<p style="text-align: justify;">&nbsp;5.8 Cuando se realice la reparaci&oacute;n permanente se registrar&aacute; la fecha de finalizaci&oacute;n en el formato de orden de trabajo&nbsp; Orden de&nbsp; Trabajo (FO-MT-003-A)y se archivara con las &oacute;rdenes de trabajo de mantenimiento correctivo.&nbsp;</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(293, 'A', 'Autorizado', '26/08/2014', '<p>Este documento tiene la finalidad de indicar las actividades del Operador de Calderas con los Compresores &nbsp;de Aire.</p>', '<p>El presente documento aplica a los Compresores de Aire existentes en la Planta, propiedad de Procesamiento Especializado de Alimentos S.A.P.I. de C.V.</p>', '<p><strong>BAR</strong>: Unidad francesa de medici&oacute;n de presi&oacute;n (bar).</p>\n<p><strong>&nbsp;CONDENSACI&Oacute;N</strong>: Es el cambio de estado que ocurre cuando una sustancia pasa del estado de vapor a l&iacute;quido, por disminuci&oacute;n de la temperatura.</p>\n<p>&nbsp;<strong>MONITOREO</strong>: Acci&oacute;n de revisar datos que definan el comportamiento de un equipo o un sistema.</p>\n<p><strong>&nbsp;PULM&Oacute;N DE AIRE:</strong> Es el tanque vertical de almacenamiento de aire.</p>\n<p><strong>&nbsp;PURGA:</strong> Es la acci&oacute;n de abrir o cerrar v&aacute;lvulas de paso de aire para retirar un poco del fluido y evitar sobrepresiones. As&iacute; el agua almacenada se tira para evitar que se tape la salida del aire.</p>\n<p><strong>&nbsp;</strong></p>', '<p style="text-align: justify;">5.1.&nbsp;&nbsp; El Operador de Calderas deber&aacute; inspeccionar que el Compresor de Aire est&eacute; bien cerrado y limpio; de lo contrario deber&aacute; cerrar las puertas y limpiarlo con un trapo h&uacute;medo.</p>\n<p style="text-align: justify;">&nbsp;5.2.El Operador de Calderas deber&aacute; inspeccionar que los filtros a la salida del compresor est&eacute;n limpios y libres de humedad, caso contario deber&aacute; limpiar y purgar los condensados, esta actividad se registrara en el formato FO-MT-012-A</p>\n<p style="text-align: justify;">&nbsp; 5.3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El Operador de Calderas deber&aacute; arrancar el Compresor de Aire y visualizar la temperatura y registrarla en el formato FO-MT-012-A</p>\n<p style="text-align: justify;">5.4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El Operador de Calderas deber&aacute; revisar la presi&oacute;n de salida de aire del Compresor y&nbsp; registrar el dato en el formato FO-MT-012-A</p>\n<p style="text-align: justify;">&nbsp;5.5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El Operador de Calderas deber&aacute; visualizar que el nivel de aceite del Compresor de Aire sea el correcto (no menor a &frac34; de su capacidad total). Este dato se registra en el formato FO-MT-012-A</p>\n<p style="text-align: justify;">&nbsp;5.6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El Operador de Calderas deber&aacute; revisar el estado f&iacute;sico de la banda del Compresor de Aire No.1 o el estado del acoplamiento para el compresor No. 2, as&iacute; como &nbsp;las horas de trabajo y registrarlo en el formato FO-MT-012-A.</p>\n<p style="text-align: justify;">&nbsp;5.7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El Operador de Calderas deber&aacute; realizar una prueba de funcionamiento a las v&aacute;lvulas de alivio tanto del Compresor como del Pulm&oacute;n de Aire.</p>\n<p style="text-align: justify;">&nbsp;5.8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El Operador de Calderas deber&aacute; purgar el secador de aire del Compresor las veces que considere necesarias para no generar condensaci&oacute;n en el Compresor de Aire.</p>\n<p style="text-align: justify;">&nbsp;5.9.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Al realizar la purga del tanque del Compresor de Aire, el Operador de Calderas deber&aacute; usar el grifo que se ubica en la parte inferior del tanque y esperar hasta que se retire toda el agua.</p>\n<p style="text-align: justify;">&nbsp;5.10.&nbsp;&nbsp;&nbsp; El Operador de Calderas deber&aacute; realizar una purga al grifo del Pulm&oacute;n de Aire para evitar que &eacute;ste genere condensaci&oacute;n y pueda da&ntilde;ar a los equipos.</p>\n<p style="text-align: justify;">&nbsp;Nota: Los compresores de Aire se detiene cuando alcanza la presi&oacute;n de 8 kg/cm2. Y arrancan cuando la presi&oacute;n desciende a 7 kg/cm2.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp;6.<strong>&nbsp; &nbsp; &nbsp;</strong>Tren de filtrado Chill-Rom</p>\n<p style="text-align: justify;"><strong>&nbsp;</strong>6.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El Personal de Calderas deber&aacute; inspeccionar y purgar los filtros que suministran aire al sistema Chill-Rom y registrarlo en el formato FO-MT-012-A.</p>\n<p style="text-align: justify;">&nbsp;6.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El personal de calderas deber&aacute; revisar que la presi&oacute;n de operaci&oacute;n sea la adecuada de 3 kg/cm2 a 4 kg/cm2, ajustar de ser necesario y registrar el valor en el formato FO-MT-012-A.</p>\n<p style="text-align: justify;">&nbsp;&nbsp;6.3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Los filtros se remplazar&aacute;n de forma anual de acuerdo al cronograma de mantenimiento preventivo FO-MT-001-A y se documentara mediante la orden de trabajo con folio FO-MT-003-A.</p>\n<p style="text-align: justify;">&nbsp;</p>\n<p style="text-align: justify;">&nbsp; 7.&nbsp; &nbsp; &nbsp;El Personal de Calderas deber&aacute; realizar las actividades de mantenimiento preventivo&nbsp; de acuerdo al cronograma FO-MT-001-A y se documenta mediante &oacute;rdenes de trabajo con folio FO-MT-003-A.</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(294, 'A', 'Autorizado', '26/08/2014', '<p>Describir las actividades del Mec&aacute;nico en L&iacute;nea y T&eacute;cnico en Refrigeraci&oacute;n en el funcionamiento de las Unidades Manejadoras de Aire (UMA).</p>', '<p>El presente documento aplica a las Unidades Manejadoras de Aire existentes en la Planta y son propiedad de Procesamiento Especializado de Alimentos S.A.P.I. de C.V.</p>', '<p><strong>BAR:</strong> Unidad francesa de medici&oacute;n de presi&oacute;n (bar).</p>\n<p>&nbsp;<strong>CONDENSADOR:</strong>El condensador&nbsp; del circuito frigor&iacute;fico es un intercambiador de calor que cede el calor del sistema hacia otro medio. Este calor consiste en el absorbido por el evaporador m&aacute;s el calor proveniente de la energ&iacute;a derivada de la compresi&oacute;n. El refrigerante comprimido por el compresor a alta presi&oacute;n y temperatura ingresa al condensador donde elimina el calor a un medio m&aacute;s fr&iacute;o. Este gas condensado se vuelve l&iacute;quido, y deja el condensador para continuar el ciclo.</p>\n<p><strong>&nbsp;DISPLAY:</strong> Es la Pantalla de Cristal L&iacute;quido (LCD) donde se visualizan los par&aacute;metros de operaci&oacute;n de la C&aacute;mara de Congelaci&oacute;n en el tablero de control.</p>\n<p><strong>&nbsp;EVAPORADOR</strong>: El evaporador del circuito frigor&iacute;fico es un intercambiador t&eacute;rmico que tiene por funci&oacute;n enfriar y deshumidificar el aire que lo atraviesa absorbiendo calor del mismo, produci&eacute;ndose dos fen&oacute;menos f&iacute;sicos: 1) el aire se enfr&iacute;a y el vapor de aire presente se condensa en las aletas del evaporador, 2) el fluido se evapora y se recalienta.</p>\n<p><strong>&nbsp;MONITOREO:</strong> Acci&oacute;n de revisar datos que definan el comportamiento de un equipo o un sistema.</p>', '<p>5.1.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; encender el equipo de la siguiente manera:</p>\n<p>&nbsp;</p>\n<p>5.1.1.Subir el interruptor de la UMA No.1 y despu&eacute;s el Interruptor de la UMA No.2, los interruptores se encuentran a un costado de los equipos.</p>\n<p>&nbsp;</p>\n<p>5.1.2.Revisar que las turbinas y compresores est&eacute;n funcionando correctamente.</p>\n<p>&nbsp;</p>\n<p>5.2.&nbsp;&nbsp; Una vez encendido la UMA, el T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; realizar la revisi&oacute;n de funcionamiento de los climas y deber&aacute; registrar los par&aacute;metros de funcionamiento en el formato FO-MT-010-A</p>\n<p>&nbsp;</p>\n<p>5.3.&nbsp;&nbsp; Una vez terminada la jornada de trabajo se apagar&aacute;n las UMA de la siguiente manera:</p>\n<p>&nbsp;</p>\n<p>5.3.1.Bajar los interruptores de forma secuencial de la UMA No.1 y No.2.</p>\n<p>&nbsp;</p>\n<p>5.4 El Personal de mantenimiento realiza actividades de mantenimiento preventivo&nbsp; de acuerdo al cronograma FO-MT-01-A y se documenta mediante &oacute;rdenes de trabajo con folio FO-MT-03-A.</p>\n<p>&nbsp;</p>\n<p>5.5 Para la limpieza de filtros&nbsp; de las UMAS y sala de producci&oacute;n se ejecutaran de forma semanal y se documentara en el formato FO-MT-010-A Revisi&oacute;n t&eacute;cnica de los equipos c&aacute;mara de congelaci&oacute;n, UMAS, y subestaciones.</p>\n<p>&nbsp;</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(295, 'A', 'Autorizado', '26/08/2014', '<p>Describir las actividades del Operador de Calderas en el funcionamiento de la misma</p>', '<p>El presente documento aplica a la Caldera existente en la Planta, propiedad de Procesamiento Especializado de Alimentos S.A.P.I. de C.V.</p>', '<p><strong>BAR:</strong> Unidad francesa de medici&oacute;n de presi&oacute;n.</p>\n<p><strong>&nbsp;CONDENSACI&Oacute;N:</strong> Es el cambio de estado que ocurre cuando una sustancia pasa del estado de vapor a l&iacute;quido, por disminuci&oacute;n de la temperatura.</p>\n<p><strong>&nbsp;MANIFUL</strong>: Son las v&aacute;lvulas de paso en el sistema de purga de la tuber&iacute;a de vapor del distribuidor del mismo.</p>\n<p><strong>&nbsp;MONITOREO:</strong> Acci&oacute;n de revisar datos que definan el comportamiento de un equipo o un sistema.</p>\n<p><strong>&nbsp;PURGA:</strong> Es la acci&oacute;n de abrir o cerrar v&aacute;lvulas de paso en el sistema de la tuber&iacute;a de vapor o de agua para retirar un poco del fluido y evitar que se fracture la tuber&iacute;a por exceso de presi&oacute;n.</p>', '<p>1.1.&nbsp; El Operador de Calderas deber&aacute; revisar el nivel de diesel en el dep&oacute;sito, despu&eacute;s de esto, verificar&aacute; que las v&aacute;lvulas de paso hacia la bomba de diesel se encuentren abiertas.</p>\n<p>&nbsp;</p>\n<p>1.2.El Operador de Calderas deber&aacute; realizar una purga de fondo antes de encender cualquier equipo que se conecte a la caldera y deber&aacute; registrarlo en el formato FO-MT-009-A</p>\n<p>&nbsp;</p>\n<p>1.3.El Operador de Calderas deber&aacute; &nbsp;realizar la purga de columna de nivel de agua para que no quede nada dentro de la Caldera y pueda provocar un falso arranque registr&aacute;ndolo en el formato FO-MT-009-A.</p>\n<p>&nbsp;</p>\n<p>1.4.&nbsp;&nbsp; &nbsp;&nbsp;El Operador de Calderas deber&aacute; activar el interruptor de la bomba de combustible desde el tablero el&eacute;ctrico en sala de m&aacute;quinas.</p>\n<p>&nbsp;</p>\n<p>1.5.&nbsp;&nbsp; &nbsp;El Operador de Calderas deber&aacute; activar el interruptor del control electr&oacute;nico de la Caldera desde el tablero el&eacute;ctrico&nbsp; en &nbsp;sala de m&aacute;quinas.</p>\n<p>&nbsp;</p>\n<p>1.6.&nbsp;&nbsp; &nbsp;El Operador de Calderas deber&aacute; activar el interruptor de la bomba de agua caliente del tanque de condensados que a su vez es el mismo para el control de nivel de agua caliente de la Caldera.</p>\n<p>&nbsp;</p>\n<p>1.7.&nbsp;&nbsp; &nbsp;El Operador de Calderas deber&aacute; encender el supresor de picos ubicado a un costado del tablero el&eacute;ctrico de la sala de m&aacute;quinas para que se enciendan los controles de la Caldera No.1, para la caldera No. 2 no aplica.</p>\n<p>&nbsp;</p>\n<p>1.8.&nbsp;&nbsp; El Operador de Calderas deber&aacute; abrir&nbsp; la v&aacute;lvula de alimentaci&oacute;n de agua del tanque de condensado hacia la Caldera ubicada en un costado del cuerpo de la misma.</p>\n<p>&nbsp;</p>\n<p>1.9.&nbsp;&nbsp; &nbsp;El Operador de Calderas deber&aacute; visualizar en el control de nivel de agua caliente un nivel &oacute;ptimo para arrancar la Caldera y presionar&aacute; el bot&oacute;n RESET/MENU hasta que aparezca CLOCK NO SET en el control de la columna de agua, de lo contrario no arrancar&aacute;, esto para la caldera No.1 , para la caldera No. 2 no aplica.</p>\n<p>&nbsp;</p>\n<p>1.10.Antes de arrancar la Caldera, el Operador deber&aacute; desmontar el electrodo que genera la chispa de arranque y limpiar la punta totalmente.</p>\n<p>&nbsp;</p>\n<p>1.11.Una vez encendidos los controles electr&oacute;nicos de Calderas, el Operador deber&aacute; subir el interruptor de la Caldera ubicado en la parte frontal para&nbsp; que arranque.</p>\n<p>&nbsp;</p>\n<p>1.12.Posteriormente, el Operador de Calderas deber&aacute; abrir la v&aacute;lvula del cabezal de distribuci&oacute;n de vapor para retirar el agua generada por el efecto de la condensaci&oacute;n del vapor al enfriarse.</p>\n<p>&nbsp;</p>\n<p>1.13.El Operador de Calderas deber&aacute; abrir una v&aacute;lvula del cabezal de vapor para proporcionarle vapor caliente al tanque de condensados y as&iacute; calentar a una temperatura de 60 &deg;C el agua del tanque.</p>\n<p>&nbsp;</p>\n<p>1.14.Una vez arrancada y operando la Caldera se espera a que alcance la presi&oacute;n de trabajo (7 Kg/cm2) y pare en autom&aacute;tico.</p>\n<p>&nbsp;</p>\n<p>1.15.El Operador de Calderas deber&aacute; abrir las v&aacute;lvulas de servicio en el cabezal de vapor para poder enviarlo a las &aacute;reas de proceso. A esta presi&oacute;n ya se puede disponer del vapor para sus diversas aplicaciones en la Planta como es el &aacute;rea de Autoclaves y Cocedores.</p>\n<p>&nbsp;</p>\n<p>&nbsp;5.16 El Personal de mantenimiento realiza actividades de mantenimiento preventivo&nbsp; de acuerdo al cronograma FO-MT-001-A y se documenta mediante &oacute;rdenes de trabajo con folio FO-MT-003-A.</p>', '<p>N/A</p>', '<p>N/A</p>', ''),
(296, 'A', 'Autorizado', '26/08/2014', '<p>Describir las actividades del Mec&aacute;nico en L&iacute;nea dentro de la sala de Producci&oacute;n de la Planta Procesa</p>', '<p>El presente documento aplica a los equipos que se encuentran dentro de la sala de Producci&oacute;n, propiedad de Procesamiento Especializado de Alimentos S.A.P.I. de C.V.</p>', '<p>UMAS: Unidades Manejadoras de Aire</p>\n<p><strong>&nbsp;</strong></p>', '<p style="text-align: justify;">1.1.&nbsp;&nbsp; El Mec&aacute;nico de L&iacute;nea a su llegada a la Sala de Producci&oacute;n deber&aacute; retirar las fundas de protecci&oacute;n de equipos y deber&aacute; encender las UMAS y cortinas de aire.</p>\n<p style="text-align: justify;">&nbsp;1.2.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; habilitar interruptores de producci&oacute;n y habilitar las bandas que transportan el pouch en las diferentes estaciones del proceso.</p>\n<p style="text-align: justify;">&nbsp;1.3.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; armar los conos y realizar los ajustes necesarios.</p>\n<p style="text-align: justify;">&nbsp;1.4.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; encender la l&aacute;mpara UV y verificar el correcto funcionamiento</p>\n<p style="text-align: justify;">&nbsp;1.5.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; habilitar las Selladoras al vac&iacute;o; encender las bombas de vac&iacute;o y verificar la circulaci&oacute;n de agua en el equipo.</p>\n<p style="text-align: justify;">&nbsp;1.6.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; encender los rodillos aplanadores para verificar su funcionamiento y corregir la altura para el aplanado del pouch. Adem&aacute;s de que deber&aacute; limpiarlos y lubricar sus partes m&oacute;viles y registrarlo en el formato Mantenimiento preventivo diario de la l&iacute;nea de producci&oacute;n FO-MT-017-A</p>\n<p style="text-align: justify;">&nbsp;1.7.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; encender los codificadores para realizar la configuraci&oacute;n correspondiente al d&iacute;a de producci&oacute;n y deber&aacute; lavar con solvente el cabezal de impresi&oacute;n y registrar los datos en el formato mantenimiento preventivo diario del codificador FO-MT-011-A</p>\n<p style="text-align: justify;">&nbsp;1.8.&nbsp;&nbsp; El Mec&aacute;nico en L&iacute;nea deber&aacute; ajustar la distancia entre la barras de la m&aacute;quina de Vac&iacute;o-Sellado para que exista un buen sellado al momento de colocar el pouch. Los datos de este ajuste los deber&aacute; registrar en el formato registro de ajustes de selladoras al vac&iacute;o FO-MT-013-A</p>\n<p style="text-align: justify;">&nbsp;1.9.&nbsp;&nbsp; &nbsp;El Mec&aacute;nico en L&iacute;nea deber&aacute; ajustar las barras cuantas veces sean necesarias durante el transcurso del turno de operaci&oacute;n de las m&aacute;quinas de Vac&iacute;o-Sellado y registrar los datos en el formato registro de ajustes de selladoras al vac&iacute;o FO-MT-013-A</p>\n<p style="text-align: justify;">&nbsp;1.10.Una vez ajustada la m&aacute;quina de Vac&iacute;o-Sellado, el Operador en conjunto con el Mec&aacute;nico en L&iacute;nea deber&aacute; realizar una prueba para verificar que las m&aacute;quinas est&eacute;n sellando bien.</p>\n<p style="text-align: justify;">&nbsp;1.11.&nbsp;&nbsp;&nbsp;&nbsp; El Mec&aacute;nico en l&iacute;nea deber&aacute; ajustar los conos de llenado de Pouch de acuerdo a las necesidades del personal operario. Esto lo realiza cada vez que los supervisores y/o personal se lo solicite.</p>\n<p style="text-align: justify;">&nbsp;1.12.El Mec&aacute;nico en l&iacute;nea deber&aacute; revisar todas las bandas transportadoras de la maquinaria de la sala de Producci&oacute;n para evitar que alguna est&eacute; pr&oacute;xima a romperse y pueda ocasionar un paro de la l&iacute;nea registrando los datos en el formato Mantenimiento Preventivo Diario de la L&iacute;nea de Producci&oacute;n FO-MT-017-A</p>\n<p style="text-align: justify;">&nbsp;1.13.El Mec&aacute;nico en L&iacute;nea deber&aacute; realizar el recorrido en la Sala de Esterilizado, Secado y Encartonado para realizar las actividades descritas en el formato FO-MT-018-A Actividades Diarias de Revisi&oacute;n en Sala de Autoclaves, Encartonado, 4-pack y Rx y realizar el registro.</p>\n<p style="text-align: justify;">&nbsp;1.14.EL Mec&aacute;nico en l&iacute;nea realizar&aacute; actividades de mantenimiento preventivo asignadas por el Jefe de Mantenimiento de acuerdo al Cronograma de Mantenimiento Preventivo FO-MT-001-A, registrando la actividad en el formato orden de mantenimiento preventivo FO-MT-003-A que corresponda a cada equipo.</p>', '<p><a name="_Toc394862046"></a>N/A</p>', '<p>N/A</p>', ''),
(297, 'A', 'Autorizado', '26/08/2014', '<p>Describir las actividades del T&eacute;cnico en Refrigeraci&oacute;n en el funcionamiento y mantenimiento de la C&aacute;mara de Congelaci&oacute;n.</p>\n<p>&nbsp;</p>', '<h1>&nbsp;</h1>\n<p>Este procedimiento aplica a la C&aacute;mara de Congelaci&oacute;n de la Planta, propiedad de Procesamiento Especializado de Alimentos S.A.P.I. de C.V.</p>', '<p><strong>BAR:</strong> Unidad francesa de medici&oacute;n de presi&oacute;n.</p>\n<p><strong>&nbsp;CONDENSADOR:</strong> El condensador&nbsp; del circuito frigor&iacute;fico es un intercambiador de calor que cede el calor del sistema hacia otro medio. Este calor consiste en el absorbido por el evaporador m&aacute;s el calor proveniente de la energ&iacute;a derivada de la compresi&oacute;n. El refrigerante comprimido por el compresor a alta presi&oacute;n y temperatura ingresa al condensador donde elimina el calor a un medio m&aacute;s fr&iacute;o. Este gas condensado se vuelve l&iacute;quido, y deja el condensador para continuar el ciclo.</p>\n<p><strong>&nbsp;DISPLAY:</strong> Es la Pantalla de Cristal L&iacute;quido (LCD) donde se visualizan los par&aacute;metros de operaci&oacute;n de la C&aacute;mara de Congelaci&oacute;n en el tablero de control.</p>\n<p><strong>&nbsp;EVAPORADOR:</strong> El evaporador del circuito frigor&iacute;fico es un intercambiador t&eacute;rmico que tiene por funci&oacute;n enfriar y deshumidificar el aire que lo atraviesa absorbiendo calor del mismo, produci&eacute;ndose dos fen&oacute;menos f&iacute;sicos: 1) el aire se enfr&iacute;a y el vapor de aire presente se condensa en las aletas del evaporador, 2) el fluido se evapora y se recalienta.</p>\n<p><strong>&nbsp;MONITOREO:</strong> Acci&oacute;n de revisar datos que definan el comportamiento de un equipo o un sistema.</p>', '<p>5.1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; visualizar y anotar la temperatura promedio de la C&aacute;mara de Congelaci&oacute;n en el formato FO-MT-008-A que se indica en el display del tablero de control diariamente al realizar su recorrido de rutina.</p>\n<p>&nbsp;5.2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; presionar la tecla de navegaci&oacute;n hacia abajo para poder recorrer las ventanas y as&iacute; visualizar y anotar en el formato FO-MT-008-A &nbsp;las temperaturas de cada uno de los evaporadores que existen en la C&aacute;mara de Congelaci&oacute;n diariamente durante su recorrido de rutina.</p>\n<p>&nbsp;5.3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; presionar la tecla hacia abajo hasta que en el display se indique la temperatura promedio y deber&aacute; permanecer en esta ventana para que se pueda visualizar la temperatura interna de la c&aacute;mara.</p>\n<p>&nbsp;5.4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n se trasladar&aacute; a la parte trasera de la C&aacute;mara de Congelaci&oacute;n para monitorear la temperatura y la presi&oacute;n de las unidades condensadoras No. 1 y No. 2.</p>\n<p>&nbsp;5.5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; abrir el gabinete correspondiente a cada unidad (indicada en la parte superior de cada gabinete) girando la perilla hacia el lado correspondiente a la apertura de la puerta para poder visualizar las lecturas indicadas en el punto 5.4.</p>\n<p>&nbsp;5.6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; En el formato FO-MT-010-A el T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; registrar las presiones de aspiraci&oacute;n (succi&oacute;n) y descarga (salida) medidas en bar que corresponde a la entrada y salida de gas refrigerante (R- 404A) del sistema de refrigeraci&oacute;n (compresor, tuber&iacute;a) durante su recorrido de rutina. Para esta actividad deber&aacute; ocupar los man&oacute;metros (manifold) adecuados.</p>\n<p>&nbsp;5.7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; presionar la tecla ENTER para dejar que en el display se indique la presi&oacute;n de operaci&oacute;n del equipo y compararla con los datos obtenidos en el punto 5.6, en caso de tener diferencias realizar los ajustes necesarios.</p>\n<p>&nbsp;5.8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; regresar al display del tablero de control de evaporadores.</p>\n<p>&nbsp;5.9.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; oprimir al mismo tiempo las teclas de navegaci&oacute;n (hacia arriba y hacia abajo)&nbsp; para visualizar los tiempos de funcionamiento y deshielo de cada uno de los&nbsp; evaporadores.</p>\n<p>&nbsp;5.10.&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; presionar las veces que sean necesarias la tecla hacia abajo para ir visualizando el estado de operaci&oacute;n&nbsp; de cada uno de los evaporadores en cuanto a tiempos de refiere.</p>\n<p>&nbsp;5.11.&nbsp;&nbsp; Para mandar a deshielo un evaporador, el T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; presionar la tecla ENTER cuando en el display se visualice el n&uacute;mero de evaporador a deshielar.</p>\n<p>&nbsp;5.12.&nbsp;&nbsp; Presionar la tecla ESC (escape) para salir de la operaci&oacute;n de deshielo. .</p>\n<p>&nbsp;5.13.&nbsp;&nbsp; Presionar la tecla hacia abajo hasta que el display indique la temperatura promedio de la c&aacute;mara de congelaci&oacute;n.</p>\n<p>&nbsp;5.14.&nbsp;&nbsp; El T&eacute;cnico en Refrigeraci&oacute;n deber&aacute; realizar este recorrido diariamente de acuerdo a las horas programadas &nbsp;y anotarla en el formato FO-MT-008-A y FO-MT-010-A</p>\n<p>&nbsp;5.15.&nbsp;&nbsp; El Personal de mantenimiento realiza actividades de mantenimiento preventivo&nbsp; de acuerdo al cronograma FO-MT-001-A y se documenta mediante &oacute;rdenes de trabajo con folio FO-MT-003-A</p>\n<p>&nbsp;</p>', '<p>N/A</p>', '<p>N/A</p>', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_comentarios`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_comentarios` (
  `id_documento` int(6) NOT NULL,
  `id_usuario` int(6) NOT NULL,
  `objetivo` text NOT NULL,
  `alcance` text NOT NULL,
  `definiciones` text NOT NULL,
  `desarrollo` text NOT NULL,
  `referencias` text NOT NULL,
  `responsabilidades` text NOT NULL,
  `registros` text NOT NULL,
  `anexos` text NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa_comentarios`
--

INSERT INTO `plantilla_completa_comentarios` (`id_documento`, `id_usuario`, `objetivo`, `alcance`, `definiciones`, `desarrollo`, `referencias`, `responsabilidades`, `registros`, `anexos`) VALUES
(205, 66, '', '', '', '', '', '', '', ''),
(209, 87, '', '', '', '', '', '', '', ''),
(294, 55, '', '', '', '', '', '', '', ''),
(295, 71, '', '', '', '', '', '', '', ''),
(219, 96, '', '', '', '', '', '', '', ''),
(219, 27, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_obsoletos`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_obsoletos` (
  `consecutivo` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento` int(11) NOT NULL,
  `rev` varchar(3) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `objetivo` text NOT NULL,
  `alcance` text NOT NULL,
  `definiciones` text NOT NULL,
  `desarrollo` text NOT NULL,
  `referencias` text NOT NULL,
  `anexos` text NOT NULL,
  PRIMARY KEY (`consecutivo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `plantilla_completa_obsoletos`
--

INSERT INTO `plantilla_completa_obsoletos` (`consecutivo`, `id_documento`, `rev`, `estado`, `objetivo`, `alcance`, `definiciones`, `desarrollo`, `referencias`, `anexos`) VALUES
(1, 16, 'A', 'Obsoleto', '<p>kdjd</p>', '<p>djdj</p>', '<p>dkdk</p>', '<p><img src="source/ESPECIFICACIONES/sal molida.jpg" alt="" width="189" height="267" /></p>\n<p>&nbsp;</p>\n<p>kjjklfkfkflrlkjdgklgjkldfjgkldg</p>', '<p>k</p>', '<p>k</p>'),
(2, 18, 'A', 'Obsoleto', '<p>m</p>', '<p>v</p>', '<p>v</p>', '<p><img src="source/ESPECIFICACIONES/sal molida.jpg" alt="" width="189" height="267" />v&nbsp;</p>', '<p>v</p>', '<p>v</p>'),
(3, 16, 'B', 'Autorizado', '<p>kdjd</p>', '<p>djdj</p>', '<p>dkdk</p>', '<p><img src="source/ESPECIFICACIONES/sal molida.jpg" alt="" width="189" height="267" /></p>\n<p>&nbsp;</p>\n<p>kjjklfkfkflrlkjdgklgjkldfjgkldklsdnfksdnfjksdnjkdsnkjdfvndjfkbndkjv</p>', '<p>k</p>', '<p>k</p>'),
(4, 17, 'A', 'Obsoleto', '<p>v</p>', '<p>v</p>', '<p>v</p>', '<p>v<img src="source/Scan_20140527_102949.jpg" alt="" width="438" height="808" /></p>\n<p>&nbsp;</p>', '<p>v</p>', '<p>v</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_registros`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_registros` (
  `id_documento` int(6) NOT NULL,
  `nombre_registro` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `responsable` varchar(255) NOT NULL,
  `tiempo_resguardo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa_registros`
--

INSERT INTO `plantilla_completa_registros` (`id_documento`, `nombre_registro`, `codigo`, `responsable`, `tiempo_resguardo`) VALUES
(16, 'j', 'k', '', ''),
(113, 'REVISION AREAS', 'FO-NV-001-A', 'MELISSA', '5 A?OS'),
(113, '', '', '', ''),
(113, '', '', '', ''),
(206, 'Evaluación de riesgos', 'FO-BS-001-A', 'Analítica e Inocuidad', '5 años'),
(209, 'Cronograma de Muestreo', 'FO-AI-001-A', 'Analítica e Inocuidad', '5 años'),
(210, 'Sistema de conformidad de esterilizado', 'FO-PT-002-A', 'Ingeniero de Procesos Térmicos', '5 años'),
(210, 'Programación de equipos de autoclaves', 'FO-PT-003-A', 'Ingeniero de Procesos Térmicos', '5 años'),
(210, 'Sistema de conformidad de envasado', 'FO-EN-001-A', 'Ingeniero de Procesos', '5 años'),
(210, 'Análisis de pH del producto semiterminado', 'FO-A1-006-A', 'Ingenierio de Analítica e Inocuidad', '5 años'),
(210, 'Análisis sensorial y fisicoquimico del producto semiterminado', 'FO-AI-003-A', 'Ingeniero de Analítica e Inocuidad', '5 años'),
(210, 'Sistema de conformidad de rayos x.', 'FO-RX-002-A', 'Ingeniero de Procesos', '5 años'),
(211, 'Monitoreo del tratamiento de agua.', '', '', ''),
(211, 'Código de colores de tuberías de la planta procesa.', 'FO-MT-020-A', '', ''),
(211, 'Cronograma de muestreo', 'FO-AI-001-A', '', ''),
(211, 'Cronogramas de mantto preventivo', 'FO-MT-001-A', '', ''),
(211, 'Formato de orden de mantto preventivo.', '', '', ''),
(211, 'procedimientos operativos estándares de saneamiento', '', '', ''),
(211, 'Formato de inspección preoperativa de las áreas de proceso.', 'FO-SA-005-A', '', ''),
(211, 'Mantenimiento preventivo diario del compresor de aire y unidad hidráulica', '', '', ''),
(211, 'Revisión técnica de los \nequipos cámara de congelación, UMAS, y subestaciones .', 'FO-MT-019-A', '', ''),
(228, 'Bitácora de atención Médica', 'FO-SP-001-A', 'Pablo Pascual', '36 meses'),
(231, 'Formato de Recibo de Lomos', 'FO-RE-006-A', 'Inspector de Recepecion y Embarques', '5 años'),
(231, 'Formato Recibo de Pescado Entero', 'FO-RE-005-A', 'Inspector de Recepcion y Embarques', '5 años'),
(235, 'RESPONSIVA DE UNIFORMES, E.P.P., MATERIALES Y HERRAMIENTAS.', 'FO-SH-004-A', 'SHyMA', ''),
(236, 'Asignación de Lockers', 'FO-SH-001-A', 'SHYMA', '36 MESES'),
(287, 'Cronograma Anual de Calibración  de los Instrumentos de Medición', 'FO-MT-002-A.', 'Jefe de Mantenimiento', '60 meses'),
(287, 'Revisión Mensual  De Basculas De Proceso', 'FO-MT-005-A', 'Técnico de mantenimiento', '60 meses'),
(287, 'Revisión Mensual De Los Termómetros De Proceso', 'FO-MT-006-A', 'Supervisor de mantenimiento', '60 meses'),
(286, 'Cronograma Anual de Mantenimiento Preventivo                  (FT Electrónico)', 'FO-MT-001-A', 'Jefe de Mantenimiento', '60 Meses'),
(286, 'Cronograma Anual de Calibración de Instrumentación de medición', 'FO-MT-002-A', 'Jefe de mantenimiento', '60 Meses'),
(286, 'Orden de trabajo (FT Electrónico)', 'FO-MT-003-A', 'jefe de mantenimiento', '60 Meses'),
(286, 'Solicitud de Trabajo', 'FO-MT-004-A', 'Técnico de Mantenimiento', '60 Meses'),
(289, 'Orden de Trabajo (FT Electrónico)', 'FO-MT-003-A', 'Jefe de mantenimiento', '60 meses'),
(290, 'Monitoreo del tratamiento de agua.', 'FO-MT-007-A', 'Supervisor de Mantenimiento', '60 meses'),
(291, 'Solicitud de Trabajo', 'FO-MT-004-A', 'Técnico de mantenimiento', '60 Meses'),
(291, 'Orden de trabajo (FT Electrónico)', 'FO-MT-003-A', 'Jefe de mantenimiento', '60 Meses'),
(291, 'Solicitud de Materiales.', 'FO-CO-002-A', 'Jefe de mantenimiento', '60 Meses'),
(292, 'Solicitud de Trabajo', 'FO-MT-004-A', 'Técnico de mantenimiento', '60 meses'),
(292, 'Orden de trabajo (FT Electrónico)', 'FO-MT-003-A', 'Jefe de mantenimiento', '60 meses'),
(292, 'Solicitud de Materiales.', 'FO-CO-002-A', 'jefe de mantenimiento', '60 meses'),
(292, 'Reparación temporal', 'FO-MT-022-A', 'supervisor de mantenimiento', '60 meses'),
(297, 'Bitácora de Refrigeración', 'FO-MT-008-A.', 'Técnico de refrigeración', '60 Meses'),
(297, 'Revisión técnica de los equipos cámara de congelación, UMAS, y subestaciones', 'FO-MT-010-A', 'Técnico de refrigeración', '60 Meses'),
(297, 'Cronogramas de mantto preventivo', 'FO-MT-001-A', 'Jefe de mantenimiento', '60 Meses'),
(297, 'Formato de orden de mantto preventivo', 'FO-MT-003-A', 'Supervisor de mantenimiento', '60 Meses'),
(296, 'Cronograma de Mantenimiento Preventivo', 'FO-MT-001-A', 'Jefe de mantenimiento', '60 meses'),
(296, 'Mantenimiento Preventivo Diario de las Selladoras al Vacío.', 'FO-MT-013-A', 'Técnico de mantenimiento', '60 meses'),
(296, 'Orden de trabajo (FT Electrónico)', 'FO-MT-003-A', 'Jefe de mantenimiento', '60 meses'),
(296, 'Actividades Diarias de Revisión en Sala de Autoclaves, Encartonado y 4-pack', 'FO-MT-018-A', 'Técnico de mantenimiento', '60 meses'),
(296, 'Mantenimiento Preventivo Diario de la Línea de Producción.', 'FO-MT-018-A', 'Técnico de mantenimiento', '60 meses'),
(296, 'Mantenimiento Preventivo Diario del Codificador.', 'FO-MT-011-A', 'Técnico de mantenimiento', '60 meses'),
(293, 'Cronogramas de mantenimiento  preventivo', 'FO-MT-01-A', 'Jefe de mantenimiento', '12 meses'),
(293, 'Formato de orden de mantenimiento preventivo.', 'FO-MT-03-A.', 'Supervisor de mantenimiento', '12 meses'),
(293, 'Mantenimiento Preventivo Diario Compresor de aire.', 'FO-MT-12-A', 'Técnico de mantenimiento', '12 meses'),
(295, 'Bitácora de Caldera', 'FO-MT-009-A.', 'Técnico de mantenimiento', '60 Meses'),
(295, 'Cronograma Anual de Mantenimiento Preventivo                  (FT Electrónico)', 'FO-MT-001-A', 'Jefe de mantenimiento', '60 Meses'),
(295, 'Orden de trabajo (FT Electrónico)', 'FO-MT-003-A', 'Jefe de mantenimiento', '60 Meses'),
(294, 'Cronograma Anual de Mantenimiento Preventivo                  (FT Electrónico)', 'FO-MT-001-A', 'Jefe de mantenimiento', '60 Meses'),
(294, 'Orden de trabajo (FT Electrónico)', 'FO-MT-003-A', 'Jefe de mantenimiento', '60 Meses'),
(294, 'Revisión técnica de los equipos cámara de congelación, UMAS, y subestaciones', 'FO-MT-010-A', 'Jefe de mantenimiento', '60 Meses'),
(253, 'Control de pouches', 'FO-LL-001-A.', 'Gerente de Produccion', '60 meses'),
(256, 'Sistema de Conformidad Preparación de Líquidos.', 'FO-PL-001-A.', '', ''),
(219, 'Detección de Necesidades de Capacitación', 'FO-CP-001-A', 'Capital Humano', '24 meses'),
(219, 'Cronograma de Capacitación Programada.', 'FO-CP-002-A', 'Capital Humano', '24 meses'),
(219, 'Lista de Asistencia.', 'FO-CP-003-A', 'Capital Humano', '24 meses'),
(219, 'Convenio ROI', 'FO-CP-004-A', 'Capital Humano', '24 meses'),
(219, 'Formato de Evaluación de Capacitación', 'FO-CP-005-A', 'Capital Humano', '24 meses'),
(219, 'Plan de Inducción Planta', 'F0-CP-006-A', 'Capital Humano', '24 meses');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_registros_obsoletos`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_registros_obsoletos` (
  `consecutivo` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `nombre_registro` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `responsable` varchar(255) NOT NULL,
  `tiempo_resguardo` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa_registros_obsoletos`
--

INSERT INTO `plantilla_completa_registros_obsoletos` (`consecutivo`, `id_documento`, `nombre_registro`, `codigo`, `responsable`, `tiempo_resguardo`) VALUES
(1, 16, 'j', 'k', '', ''),
(2, 18, 'v', '', '', ''),
(3, 16, 'j', 'k', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_responsabilidades`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_responsabilidades` (
  `id_documento` int(6) NOT NULL,
  `area` varchar(250) NOT NULL,
  `acciones` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa_responsabilidades`
--

INSERT INTO `plantilla_completa_responsabilidades` (`id_documento`, `area`, `acciones`) VALUES
(16, 'ddd', 'dd'),
(113, 'CALIDAD', 'REVISAR DOCUMENTO'),
(101, 'DSDF', 'DFASDFDSF'),
(101, '', ''),
(114, '', ''),
(114, '', ''),
(114, '', ''),
(133, 'dfds', 'dwfdsfsd'),
(206, 'Coordinador SHYMA', 'Verificar que se realice lo descrito en el procedimiento'),
(205, 'Supervisores, jefes y gerentes de área', 'Verificar que se cumpla lo descrito en este procedimiento.'),
(206, 'Equipo bioseguridad', 'Realizar lo descrito en el procedimiento'),
(205, 'Equipo de Bioseguridad', 'Cumplir con lo descrito en este procedimiento.'),
(207, 'Jefe de Aseguramiento de la Calidad', 'Dar seguimiento al presente procedimiento, así como realizar las modificaciones al mismo, a fin de dar cumplimiento con los requerimientos establecidos en este prerrequisito'),
(209, 'Jefe de Calidad', 'Verificar que se cumpla este procedimiento'),
(209, 'Técnico en Calidad e Inocuidad\nIng. En Analítica e Inocuidad', 'Dar seguimiento a este procedimiento'),
(210, 'Técnico en calidad e inocuidad', 'cumplir con lo establecido en este procedimiento.'),
(210, 'Gerente de operaciones y del  Gerente  y/o jefe Aseguramiento de calidad', 'Verificar que se realice esta actividad.'),
(210, 'Ingeniero de Procesos', 'Garantizar el cumplimiento de lo establecido  en este documento asegurando que el producto semiterminado liberado cumpla con los estándares de calidad requeridos.'),
(211, 'Coordinador de Prerrequisitos', 'Es responsabilidad de control de calidad, CPRE que se dé cumplimiento a lo descrito en este documento.'),
(211, 'Jefe de Aseguramiento de la Calidad', 'Es responsabilidad del jefe de Aseguramiento de calidad y/o el coordinador del prerrequisito que lo descrito en este documento se lleve a cabo.'),
(211, 'Operador de Calderas', 'Es responsabilidad del Operador de calderas llevar a cabo lo descrito en este documento.'),
(219, 'Gerencias y Jefaturas de la Planta PROCESA', 'Cumplir con lo descrito en este procedimiento.'),
(219, 'Gerente de Administración de Personal la administración y Coordinador de Desarrollo y Talento', 'Aplicación de lo descrito en este procedimiento.'),
(228, 'Gerencias, jefaturas y Personal Operativo', 'Cumplir con lo descrito en este procedimiento.'),
(231, 'Jefes y Supervisores de Almacen', 'Tienen la responsabilidad de llevar a cabo lo descrito en este documento, e informar al Ing. de proceso en turno.'),
(231, 'Ingenieros de Proceso', 'Dar legalidad y seguimiento al cumplimiento de este documento.'),
(231, 'Gerente de Almacen y Logistica', 'Tienen la autoridad de hacer cumplir lo escrito en este procedimiento, así como las acciones correctivas inmediatas a realizar ante alguna desviación y/o incumplimiento del mismo.'),
(232, 'Gerente De Almacén y Logística', 'Tienen la autoridad de hacer cumplir lo escrito en este procedimiento, así como las acciones correctivas inmediatas a realizar ante alguna desviación y/o incumplimiento del mismo.'),
(232, 'Jefes y Supervisores, almacén.', 'Tienen la responsabilidad de llevar a cabo lo descrito en este documento, e informar al Ing. de proceso en turno.'),
(232, 'Inspector de Recepción y embarques', 'Cumplir con lo descrito en este documento.'),
(234, 'Jefe de Almacén', 'Cumplir con lo escrito en este procedimiento'),
(234, 'Supervisores y coordinadores de almacén.', 'Tienen la responsabilidad de llevar a cabo lo descrito en este documento, e informar al Ing. de proceso en turno.'),
(234, 'Inspector de recepción y embarques', 'Cumplir con lo descrito en este documento y dar seguimiento al estatus del producto recibido.'),
(235, 'Es responsabilidad de  las gerencias, jefes, supervisores y personal de vigilancia.', 'Verificar  el  cumplimiento de este procedimiento.'),
(236, 'Es responsabilidad de  las Gerencias, jefaturas y supervisores', 'verificar el  cumplimiento de este procedimiento.'),
(254, 'Mayordoma', 'llevar a cabo y verificar lo descrito en este documento.'),
(254, 'Parrillero y operador', 'llevar a cabo lo descrito en este documento.'),
(254, 'Jefe de producción, Ingeniero de procesos y gerente de operaciones', 'verificar que se lleven a cabo  las actividades descritas en este documento.'),
(287, 'Personal de Mantenimiento', 'Es responsable de la Calibración de Instrumentos de Medición y deberá cumplir con lo descrito en este documento'),
(287, 'Jefe de mantenimiento', 'Es responsabilidad del verificar el cumplimiento de este documento.'),
(286, 'Personal de Mantenimiento', 'Llevar a cabo lo establecido en este documento'),
(286, 'Jefe de mantenimiento', 'Verificar el cumplimiento de lo descrito en este documento.'),
(289, 'Jefe de mantenimiento', 'Llevar a cabo lo establecido en este documento y hacerlo cumplir.'),
(289, 'Jefe de mantenimiento', 'Cumplir con los Lineamientos que marca la FSCC 22000.'),
(290, 'Operador de calderas', 'Es responsabilidad del cumplir con lo descrito en este documento'),
(290, 'supervisor de mantenimiento', 'Verificar el cumplimiento de este documento.'),
(291, 'Jefe de mantenimiento', 'Es responsabilidad del y el personal de mantenimiento llevar a cabo lo descrito en este procedimiento'),
(291, 'Gerencias y Jefaturas', 'Es responsabilidad llevar a cabo lo descrito en este procedimiento.'),
(292, 'Personal de mantenimiento', 'Es responsabilidad del llevar a cabo lo establecido en este documento.'),
(292, 'Jefe de mantenimiento', 'Es responsabilidad verificar el cumplimiento de lo descrito en este documento'),
(297, 'Técnico en Refrigeracion', 'cumplir con lo descrito en este documento.'),
(297, 'Jefe de mantenimiento', 'Verificar el cumplimiento de este documento'),
(296, 'Mecánico en Linea', 'cumplir con lo descrito en este documento.'),
(296, 'Jefe de mantenimiento', 'verificar el cumplimiento de este documento.'),
(293, 'Operador de calderas', 'cumplir con lo descrito en este documento'),
(293, 'Jefe de mantenimiento', 'verificar el cumplimiento de este documento.'),
(295, 'Operador de calderas', 'cumplir con lo descrito en este documento'),
(295, 'Jefe de mantenimiento', 'verificar el cumplimiento de este documento'),
(294, 'Mecánico de Linea', 'cumplir con lo descrito en este documento.'),
(294, 'Jefe de mantenimiento', 'verificar el cumplimiento de este documento.'),
(279, 'Supervisor de Preparación de Pescado Entero.', 'Llevar a cabo lo descrito en este documento'),
(279, 'Jefe de Almacén', 'Suministrar correctamente la Materia Prima del proceso'),
(279, 'Operador de Descongelado', 'Garantizar que el proceso de descongelado cumpla con lo descrito en este documento'),
(253, 'Operador de Pesado de Porciones y Operador de Lavado de Recipientes', 'realizar las actividades descritas en este documento.'),
(253, 'Auxiliar de producción', 'verificar que se realicen las actividades descritas en este documento.'),
(253, 'Jefe de Producción, Gerente de Operaciones e Ing. de Procesos,', 'verificar que se dé cumplimiento a lo descrito en este documento.'),
(256, 'Operador de Preparacion de Liquidos', 'realizar las actividades descritas en este documento.'),
(256, '', ''),
(257, 'Operador de Sellado, Operador de Recepción de Pouch, Operador de Codificado y Operador de Paletizado', 'realizar las actividades descritas en este documento.'),
(257, 'Auxiliar de producción', 'dar seguimiento a las actividades descritas en este documento.'),
(257, 'Gerente de procesos e Ingeniero de Procesos', 'verificar el cumplimiento de este documento'),
(255, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_responsabilidades_obsoletos`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_responsabilidades_obsoletos` (
  `consecutivo` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `area` varchar(250) NOT NULL,
  `acciones` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa_responsabilidades_obsoletos`
--

INSERT INTO `plantilla_completa_responsabilidades_obsoletos` (`consecutivo`, `id_documento`, `area`, `acciones`) VALUES
(1, 16, 'ddd', 'dd'),
(2, 18, 'v', 'v'),
(3, 16, 'ddd', 'dd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_revisiones`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_revisiones` (
  `id_documento` int(11) NOT NULL,
  `fecha_cambio` varchar(50) NOT NULL,
  `descripcion_cambio` text NOT NULL,
  `descripcion_justificacion` text NOT NULL,
  `usuario` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa_revisiones`
--

INSERT INTO `plantilla_completa_revisiones` (`id_documento`, `fecha_cambio`, `descripcion_cambio`, `descripcion_justificacion`, `usuario`) VALUES
(16, '07/08/2014 - 11:41 hrs.', 'modificacion del punto 5.0', 'actualizaci?n del documento', 'auditor de calidad'),
(16, '12/08/2014 - 15:49 hrs.', 'cambio en el punto 5.0 desarrollo', 'actualizacion el documento', 'aseguramiento proveedores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla_completa_revisiones_obsoletos`
--

CREATE TABLE IF NOT EXISTS `plantilla_completa_revisiones_obsoletos` (
  `consecutivo` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `fecha_cambio` varchar(50) NOT NULL,
  `descripcion_cambio` text NOT NULL,
  `descripcion_justificacion` text NOT NULL,
  `usuario` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantilla_completa_revisiones_obsoletos`
--

INSERT INTO `plantilla_completa_revisiones_obsoletos` (`consecutivo`, `id_documento`, `fecha_cambio`, `descripcion_cambio`, `descripcion_justificacion`, `usuario`) VALUES
(1, 16, '07/08/2014 - 11:41 hrs.', 'modificacion del punto 5.0', 'actualizaci?n del documento', 'auditor de calidad'),
(3, 16, '07/08/2014 - 11:41 hrs.', 'modificacion del punto 5.0', 'actualizaci?n del documento', 'auditor de calidad'),
(3, 16, '12/08/2014 - 15:49 hrs.', 'cambio en el punto 5.0 desarrollo', 'actualizacion el documento', 'aseguramiento proveedores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE IF NOT EXISTS `puestos` (
  `id_puesto` int(2) NOT NULL AUTO_INCREMENT,
  `nombre_puesto` varchar(100) NOT NULL,
  `descripcion_puesto` varchar(250) NOT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=137 ;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`id_puesto`, `nombre_puesto`, `descripcion_puesto`) VALUES
(1, 'Jefe', 'Descripcion jefe'),
(2, 'Encargado', 'Descripcion encargado'),
(3, 'Gerente', 'Descripcion gerente'),
(4, 'Analista', 'Analista descripcion'),
(6, 'Contador', 'Contador'),
(7, 'Planeador', ''),
(8, 'Logistica', 'Des'),
(9, 'Director De Operaciones', 'Director de operaciones'),
(10, 'Gerente De Investigacion Y Desarrollo', 'Gerente de investigacion y desarrollo'),
(13, 'Gerente De Planeacion /produccion Y Suministros', 'Gerente de planeacion/produccion y suministro'),
(14, 'Gerente De Capital Humano', 'Gerente de capital humano'),
(15, 'Gerente Cadena Suministro', 'Gerente cadena suministro'),
(16, 'Gerente De Logistica Importacion Y Exportacion', 'Gerente de logistica importacion y exportacion'),
(17, 'Gerente Operaciones', 'Gerente operaciones'),
(20, 'Jefe De Bienestar Procesa', 'Jefe de bienestar procesa'),
(21, 'Jefe Mantenimiento', 'Jefe mantenimiento'),
(22, 'Jefe Produccion', 'Jefe produccion'),
(25, 'Jefe De Inventarios Y Almacen', 'Jefe de inventarios y almacen'),
(26, 'Jefe De Aseg De Calidad', 'Jefe de aseg de calidad'),
(27, 'Lider De Optim De Operaciones', 'Lider de optim de operaciones'),
(28, 'Jefe Proyectos', 'Jefe proyectos'),
(29, 'Supervisor Mantenimiento', 'Supervisor mantenimiento'),
(31, 'Supervisor Sanidad', 'Supervisor sanidad'),
(33, 'Coordinador Shyma', 'Coordinador shyma'),
(34, 'Supervisor Esterilizado', 'Supervisor esterilizado'),
(35, 'Coordinador Compras', 'Coordinador compras'),
(39, 'Auditor Calidad', 'Auditor calidad'),
(42, 'Nominas', 'Nominas'),
(44, 'Coordinador Eviscerado', 'Coordinador eviscerado'),
(45, 'Ingeniero En Procesos Termicos', 'Ingeniero en procesos termicos'),
(46, 'Chofer Mensajero', 'Chofer mensajero'),
(47, 'Chofer Mensajero', 'Chofer mensajero'),
(48, 'Supervisor Congelados', 'Supervisor congelados'),
(49, 'Coordinador De Atraccion De Talento Y Desarrollo', 'Coordinador de atraccion de talento y desarrollo'),
(50, 'Supervisor Tecnico Admivo', 'Supervisor tecnico admivo'),
(51, 'Tecnico Refrigeracion', 'Tecnico refrigeracion'),
(52, 'Soldador', 'Soldador'),
(53, 'Supervisor Calidad', 'Supervisor calidad'),
(54, 'Analista Control De Calidad', 'Analista control de calidad'),
(55, 'Mecanico Linea', 'Mecanico linea'),
(56, 'Analista De Laboratorio', 'Analista de laboratorio'),
(57, 'Fogonero', 'Fogonero'),
(58, 'Enfermera', 'Enfermera'),
(59, 'Auxiliar Refrigeracion', 'Auxiliar refrigeracion'),
(60, 'Vigilante', 'Vigilante'),
(61, 'Chofer Compras', 'Chofer compras'),
(62, 'Coordinador Sanidad', 'Coordinador sanidad'),
(63, 'Auxiliar Almacen', 'Auxiliar almacen'),
(64, 'Montacarguista', 'Montacarguista'),
(65, 'Analista Administrativo', 'Analista administrativo'),
(66, 'Operario General', 'Operario general'),
(67, 'Jardinero', 'Jardinero'),
(68, 'Sanitizador', 'Sanitizador'),
(69, 'Afanadora', 'Afanadora'),
(70, 'Gerente De Logistica  Importacion Y Exportacion', 'Gerente de logistica importacion y exportacion'),
(71, 'Serv A Clientes Canal Tradicional', 'Serv a clientes canal tradicional'),
(72, 'Coordinador Trafico', 'Coordinador trafico'),
(73, 'Analista De Trafico', 'Analista de trafico'),
(74, 'Director', ''),
(75, 'Supervisor', ''),
(76, 'Ejecutivo De Cuenta', ''),
(77, 'Ejecutivo', ''),
(78, 'Eviscerado', ''),
(79, 'Eviscerado', ''),
(80, 'Auxiliar De Almacen', 'AA'),
(81, 'Auxiliar De Logistica', ''),
(82, 'Contador De Costos', ''),
(85, 'Coordinado De Compras A', ''),
(87, 'Coordinado De Compras Mantenimiento', ''),
(101, 'Coordinador Compras Mexico', ''),
(88, 'Aseguramiento De Calidad', ''),
(95, 'Ejecutivo De Marketing', ''),
(90, 'Director Pesca', ''),
(91, 'Director De Comercializacion', ''),
(94, 'Direccion Procesa', ''),
(96, 'Ejecutivo De Ventas Gobierno', ''),
(97, 'Director De Capital Humano', ''),
(99, 'Gerente De I+d', ''),
(100, 'Gerente De Logistica', ''),
(102, 'Gerente De Logistica Mexico', ''),
(103, 'Analitica E Inocuidad', ''),
(104, 'Gerente De Planeacion', ''),
(105, 'Supervisor De Sanidad', ''),
(106, 'Gerente De Planeacion De La Demanda', ''),
(107, 'Gerente De Produccion', ''),
(108, 'Ingeniero De Procesos A', ''),
(109, 'Ingeniero De Procesos B', ''),
(110, 'Jefe De Administracion', ''),
(111, 'Jefe De Alamacen', ''),
(112, 'Jefe De Proyecto Autoservicios', ''),
(113, 'Jefe De Proyecto Gobierno', ''),
(114, 'Servicio A Cliente Canal Moderno', ''),
(115, 'Inspector De Calidad De Encartonado', ''),
(118, 'Supervisor De Calidad En Recepcion Y Embarque', ''),
(117, 'Supervisor De Acondicionamiento', ''),
(119, 'Supervisor De Maquila', ''),
(120, 'Supervisor De Esterilizado', ''),
(121, 'Preparacion De Eviscerado', ''),
(122, 'Aseguramiento De Proveedores', ''),
(123, 'Analista De Puestos', ''),
(124, 'Analista De Costos', ''),
(125, 'Auxiliar De Seguridad E Higiene', ''),
(126, 'Auxiliar De Seguridad E Higiene', ''),
(127, 'Auxiliar De Seguridad E Higiene', ''),
(128, 'Cordinador De Seguridad Patrimonial', 'Vigilancia'),
(129, 'Jefe De Servicio Al Personal', 'RH'),
(130, 'Auxiliar De Administracion', ''),
(131, 'Ingeniero De Procesos C', ''),
(132, 'Atraccion De Talento Y Desarrollo', ''),
(133, 'Adminprueba', ''),
(134, 'Autorizadorprueba', ''),
(135, 'Editorprueba', ''),
(136, 'Revisorprueba', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_menu`
--

CREATE TABLE IF NOT EXISTS `sub_menu` (
  `id_perfil` int(1) NOT NULL,
  `indice_menu` int(1) NOT NULL,
  `indice_submenu` int(1) NOT NULL,
  `opcion` varchar(25) NOT NULL,
  `url` varchar(120) NOT NULL,
  KEY `indice_menu` (`indice_submenu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sub_menu`
--

INSERT INTO `sub_menu` (`id_perfil`, `indice_menu`, `indice_submenu`, `opcion`, `url`) VALUES
(3, 2, 2, 'Aprobados', 'escritorio.documentos.aprobados'),
(2, 2, 2, 'Aprobados', 'escritorio.documentos.aprobados'),
(1, 2, 1, 'En borrador', 'escritorio.documentos.borrador'),
(1, 2, 2, 'Aprobados', 'escritorio.documentos.aprobados'),
(2, 2, 1, 'En borrador', 'escritorio.documentos.borrador'),
(2, 2, 3, 'Crear documento', 'escritorio.documentos.crear'),
(3, 2, 1, 'En borrador', 'escritorio.documentos.borrador'),
(0, 2, 1, 'En borrador', 'escritorio.documentos.borrador'),
(0, 2, 3, 'Aprobados', 'escritorio.documentos.aprobados'),
(0, 3, 1, 'Lista de usuarios', 'escritorio.usuarios.lista'),
(0, 3, 2, 'Agregar usuario', 'escritorio.usuarios.nuevo'),
(0, 2, 4, 'Obsoletos', 'escritorio.documentos.obsoletos'),
(0, 2, 6, 'Crear documento', 'escritorio.documentos.crear'),
(1, 2, 3, 'Crear documento', 'escritorio.documentos.crear'),
(3, 2, 3, 'Crear documento', 'escritorio.documentos.crear'),
(0, 2, 2, 'Permisos', 'escritorio.documentos.permisos'),
(0, 2, 5, 'Papelera', 'escritorio.documentos.papelera'),
(0, 7, 1, 'Mensajes', 'escritorio.configuracion.mensajes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_doc` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_doc` varchar(120) NOT NULL,
  `codigo_doc` varchar(2) NOT NULL,
  `descripcion_doc` varchar(250) NOT NULL,
  PRIMARY KEY (`id_tipo_doc`),
  KEY `codigo_doc` (`codigo_doc`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_doc`, `nombre_tipo_doc`, `codigo_doc`, `descripcion_doc`) VALUES
(1, 'Manual', 'MA', 'documentos_manual'),
(2, 'Procedimiento', 'PR', 'documentos_procedimiento'),
(3, 'Intructivo de Trabajo', 'IT', 'documentos_intructivo_trabajo'),
(4, 'Formato', 'FO', 'documentos_formato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `celular` varchar(25) NOT NULL,
  `id_puesto` int(2) NOT NULL,
  `user` varchar(60) NOT NULL,
  `password` varchar(150) NOT NULL,
  `id_perfil` int(1) NOT NULL,
  `id_area` int(4) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_perfil` (`id_perfil`),
  KEY `id_area` (`id_area`),
  FULLTEXT KEY `nombre` (`nombre`,`apellidos`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellidos`, `direccion`, `email`, `telefono`, `celular`, `id_puesto`, `user`, `password`, `id_perfil`, `id_area`) VALUES
(1, 'Admin', 'Administrador', '', 'davichay@gmail.com', '', '', 133, 'admin', 'administrador', 0, 40),
(2, 'Abdiel', 'Perez', '', 'trafico@procesa.mx', '', '', 110, 'analista de trafico 1', '123456', 1, 45),
(3, 'Jose', 'Juarez', '', 'trafico@procesa.mx', '', '', 73, 'analista de trafico 2', '123456', 2, 18),
(45, 'Yuridia', 'Arriola', '', 'yuridia.arriola@procesa.mx', '', '', 103, 'analitica e inocuidad', '123456', 2, 10),
(87, 'Melissa', 'Rendon', '', 'melissa.rendon@procesa.mx', '', '', 122, 'aseguramiento proveedores', '123456', 0, 10),
(16, 'Alberto', 'Juarez', '', 'alberto.juarez@procesa.mx', '', '', 80, 'auxiliar de almacen', '123456', 2, 33),
(22, 'Yaneth', 'Mejia', '', 'yaneth.mejia@procesa.mx', '', '', 85, 'coordinado de compras A', '123456', 2, 40),
(21, 'Blanca', 'Moreno', '', 'blanca.moreno@procesa.mx', '', '', 87, 'coordinado de compras mantenimiento', '123456', 2, 40),
(11, 'Yaneth', 'Mejia', '', 'yaneth.mejia@procesa.mx', '', '', 35, 'Coordinador de compras A', '123456', 2, 41),
(19, 'Deysi', 'Toledo', '', 'deysi.toledo@procesa.mx', '', '', 81, 'auxiliar de logistica', '123456', 2, 18),
(36, 'Pablo', 'Ramos', '', 'pablo.ramos@procesa.mx', '', '', 82, 'contador de costos', '123456', 2, 39),
(24, 'Maria  Jose', 'Martinez', '', 'mariajose.martinez@procesa.mx', '', '', 49, 'coordinador de atraccion de talento y desarrollo', '123456', 2, 9),
(37, 'Karina', 'Enriquez', '', 'karina.enriquez@procesa.mx', '', '', 101, 'coordinador compras mexico', '123456', 2, 40),
(26, 'Alejandro', 'Chaljub', '', 'alejandro.chaljub@procesa.mx', '', '', 90, 'director pesca', '123456', 2, 42),
(27, 'Caredy', 'Perezgomez', '', 'caredy.perezgomez@procesa.mx', '', '', 97, 'director de capital humano', '123456', 1, 9),
(28, 'Antonio', 'Rosado', '', 'antonio.rosado@procesa.mx', '', '', 91, 'director de comercializacion', '123456', 2, 30),
(29, 'Mauricio', 'Pariente', '', 'mauricio.pariente@procesa.mx', '', '', 94, 'direccion procesa', '123456', 1, 36),
(30, 'Carlos', 'Chang', '', 'carlos.chang@procesa.mx', '', '', 95, 'ejecutivo de marketing', '123456', 2, 43),
(31, 'Aldo', 'Velazquez', '', 'aldo.velazquez@procesa.mx', '', '', 76, 'ejecutivo de cuenta', '123456', 2, 43),
(32, 'Felipe', 'Guzman', '', 'felipe.guzman@procesa.mx', '', '', 96, 'ejecutivo de ventas gobierno', '123456', 2, 43),
(38, 'Juan Carlos', 'Abarca', '', 'juancarlos.abarca@procesa.mx', '', '', 33, 'coordinador shyma', '123456', 2, 9),
(39, 'Jorge', 'Cortines', '', 'jorge.cortinez@procesa.mx', '', '', 99, 'gerente i+d', '123456', 1, 21),
(40, 'Carla', 'Guzman', '', 'carla.guzman@procesa.mx', '', '', 102, 'gerente de logistica mexico', '123456', 1, 18),
(42, 'Ivan', 'Leyva', '', 'ivan.leyva@procesa.mx', '', '', 100, 'gerente de logistica', '123456', 1, 18),
(52, 'Uber', 'Morales', '', 'uber.morales@procesa.mx', '', '', 105, 'supervisor de sanidad', '123456', 2, 44),
(53, 'Ramses', 'Morales', '', 'ramses.moralez@procesa.mx', '', '', 104, 'gerente de planeacion', '123456', 1, 39),
(55, 'Cesar', 'Mejia', '', 'cesar.mejia@procesa.mx', '', '', 106, 'gerente de planeacion de la demanda', '123456', 1, 33),
(57, 'Ulises', 'Matias', '', 'ulises.matias@procesa.mx', '', '', 107, 'gerente de produccion', '123456', 1, 33),
(88, 'Dalila', 'Hernandez Jimenez', '', 'dalila.hernandez@procesa.mx', '', '', 39, 'auditor de calidad', '123456', 0, 10),
(61, 'Cinthia', 'Rodriguez', '', 'cinthia.rodriguez@procesa.mx', '', '', 109, 'ingeniero de procesos b', '123456', 2, 33),
(63, 'Sandra', 'Escobar', '', 'sandra.escobar@procesa.mx', '', '', 108, 'ingeniero de procesos a', '123456', 2, 33),
(64, 'Abigaiel', 'Proneda', '', 'abigaiel.proneda@procesa.mx', '', '', 21, 'jefe de administracion', '123456', 1, 40),
(90, 'Ivon', 'Villanueva', '', 'ivon.villanueva@procesa.com', '', '', 56, 'analista de laboratorio', '123456', 3, 24),
(66, 'Elizabeth', 'Hilerio', '', 'elizabeth.hilerio@procesa.mx', '', '', 26, 'jefe de aseguramiento de calidad', '123456', 1, 10),
(70, 'Pablo', 'Pascual', '', 'pablo.pascual@procesa.mx', '', '', 20, 'jefe de bienestar', '123456', 1, 9),
(68, 'Alfredo', 'Martinez', '', 'alfredo.martinez@procesa.mx', '', '', 111, 'jefe de almacen', '123456', 1, 33),
(71, 'Danni', 'Gonzalez', '', 'danni.gonzale@procesa.mx', '', '', 21, 'jefe de mantenimiento', '123456', 1, 33),
(72, 'Tomaz', 'Sanchez', '', 'tomas.sacnchez@procesa.mx', '', '', 22, 'jefe de produccion', '123456', 1, 33),
(74, 'Francisco', 'Mendoza', '', 'francisco.mendoza@procesa.mx', '', '', 112, 'jefe de proyecto autoservicios', '123456', 1, 21),
(75, 'Rigoberto', 'Altamirano', '', 'rigoberto.altamirano@procesa.mx', '', '', 113, 'jefe de proyecto gobierno', '123456', 1, 21),
(76, 'Adrian', 'Cruz', '', 'adrian.cruz@procesa.mx', '', '', 27, 'lider de optim de operaciones', '123456', 2, 33),
(77, 'Aranzazu', 'Gomez', '', 'aranza.gomez@procesa.mx', '', '', 42, 'nominas', '123456', 2, 9),
(78, 'Jose Manuel', 'Chew', '', 'jose.chew@procesa.mx', '', '', 114, 'servicio a cliente canal moderno', '123456', 2, 18),
(79, 'Elizabeth', 'Moreno', '', 'elizabeth.moreno@procesa.mx', '', '', 71, 'servicio a cliente canal tradicional', '123456', 2, 43),
(80, 'Avelina', 'Espinoza', '', 'avelina.espinoza@procesa.mx', '', '', 115, 'inspector de calidad de encartonado', '123456', 2, 10),
(81, 'Pablo', 'Aguilar', '', 'pablo.aguilar@procesa.mx', '', '', 117, 'supervisor de acondicionamiento', '123456', 2, 33),
(82, 'Guadalupe', 'Zea', '', 'guadalupe.zea@procesa.mx', '', '', 118, 'supervisor de calidad en recepcion y embarque', '123456', 2, 10),
(83, 'Karla', 'Zazueta', '', 'karla.zazueta@procesa.mx', '', '', 119, 'supervisor de maquila', '123456', 2, 10),
(84, 'Ervin', 'Mejia', '', 'ervin.mejia@procesa.mx', '', '', 120, 'supervisor de esterilizado', '123456', 2, 33),
(85, 'Alexis', 'Ortiz', '', 'alexis.ortiz@procesa.mx', '', '', 121, 'preparacion de eviscerado', '123456', 2, 33),
(91, 'Jose Manuel', 'Martinez', '', 'josemanuel.martinez@procesa.mx', '', '', 29, 'supervisor de mantenimiento', '123456', 2, 44),
(92, 'Alma', 'Centeno', '', 'alma.centeno@procesa.mx', '', '', 124, 'analista de costos', '123456', 2, 39),
(93, 'Prueba', 'Prueba', '', 'prueba@procesa.mx', '', '', 1, 'prueba', '123456', 1, 40),
(94, 'Meyfa', 'Cancino', '', 'meyfa.cancino@procesa.mx', '', '', 125, 'seguridad e higiene', '123456', 2, 68),
(95, 'Daniel', 'S', '', 'vigilancia@procesa.mx', '', '', 128, 'coordinador de seguridad patrimonial', '123456', 2, 69),
(96, 'Alicia', 'Santiago', '', 'alicia.santiago@procesa.mx', '', '', 129, 'jefe de servicio al personal', '123456', 1, 9),
(97, 'Ursula', 'Hernandez', '', 'ursula.hernandez@procesa.mx', '', '', 130, 'auxiliar de administracion', '123456', 3, 70),
(98, 'Cristhian', 'Perez', '', 'cristhian.perez@procesa.mx', '', '', 131, 'ingeniero de procesos C', '123456', 2, 33),
(99, 'Jacqueline', 'Dieguez', '', 'jacqueline.dieguez@procesa.mx', '', '', 132, 'atraccion de talento y desarrollo', '123456', 2, 9),
(100, 'Prueba Administrador', 'Prueba', '', 'davichay@gmail.com', '', '', 133, 'pruebaAdmin', '123456', 0, 38),
(101, 'Prueba Aurorizador', 'Hotmail', '', 'davichay@hotmail.com', '', '', 134, 'pruebaAutorizador', '123456', 1, 3),
(102, 'Prueba Revisor', 'Chd2al', '', 'chd2al@gmail.com', '', '', 136, 'pruebaRevisor', '123456', 2, 40),
(103, 'Prueba Editor', 'Ccconectados', '', 'cconecta2@outlook.com', '', '', 135, 'editorPrueba', '123456', 3, 38);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
