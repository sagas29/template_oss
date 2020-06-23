-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-06-2020 a las 10:29:33
-- Versión del servidor: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.31-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `invertec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `imagen` text NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `nombre`, `apellido`, `usuario`, `imagen`, `activo`) VALUES
(-1, 'Jesus', 'Sagastume', 'super_admin', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`, `imagen`, `activo`, `deleted`) VALUES
(1, 'PUPUSERIAS 1', '1VENTA DE PUPUSAS', 'assets/img/productos/1306202017495ee557ec1473f.png', 1, 0),
(2, 'RESTAURANTES', 'VENTA DE COMIDAS ELABORADAS', 'assets/admin/img/categorias/3105202011085ed3d6653f77e.jpg', 1, 0),
(3, 'COMIDA RAPIDA', 'HAMBURGUESAS, PIZZAS , ETC.', 'assets/img/productos/1306202017485ee557d54d723.png', 1, 0),
(4, 'COMIDA TIPICA', 'EMPANADAS, ENCHILADAS, PASTELITOS', 'assets/admin/img/categorias/3105202011105ed3d6d939dbd.jpg', 0, 1),
(6, 'PRUEBA 2', 'HOLA 2', 'assets/img/categorias/0706202021305edda2dc5af91.jpg', 0, 1),
(7, 'PRUEBA', 'DASHD', 'assets/img/categorias/0706202021385edda4bbd50ef.png', 1, 0),
(8, 'DASDAS', 'DASD', 'assets/img/productos/1306202017435ee5569036c66.png', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_cliente`
--

CREATE TABLE `categoria_cliente` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `percibe` int(11) NOT NULL,
  `retiene` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_cliente`
--

INSERT INTO `categoria_cliente` (`id_categoria`, `nombre`, `descripcion`, `percibe`, `retiene`) VALUES
(0, 'PEQUEÑO CONTRIBUYENTE', '', 0, 0),
(2, 'MEDIANO CONTRIBUYENTE', '', 0, 0),
(3, 'GRAN CONTRIBUYENTE', '', 0, 0),
(4, 'OTRO', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_proveedor`
--

CREATE TABLE `categoria_proveedor` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `percibe` int(11) NOT NULL,
  `retiene` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_proveedor`
--

INSERT INTO `categoria_proveedor` (`id_categoria`, `nombre`, `descripcion`, `percibe`, `retiene`) VALUES
(1, 'CONSUMIDOR FINAL', '', 0, 0),
(2, 'CONTRIBUYENTE', '', 0, 0),
(3, 'GRAN CONTRIBUYENTE', '', 0, 0),
(4, 'CONTRIBUYENTE EXENTO', '', 0, 0),
(5, 'OTRO', '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre_comercial` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `departamento` int(11) NOT NULL,
  `municipio` int(11) NOT NULL,
  `dui` int(15) NOT NULL,
  `nit` int(20) NOT NULL,
  `nrc` int(20) NOT NULL,
  `giro` int(11) NOT NULL,
  `telefono1` int(12) NOT NULL,
  `telefono2` int(12) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `dias_credito` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `facturacion` tinyint(1) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `contacto_telefono` varchar(15) NOT NULL,
  `contacto_correo` varchar(50) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `observaciones` text NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `categoria`, `codigo`, `nombre`, `nombre_comercial`, `direccion`, `departamento`, `municipio`, `dui`, `nit`, `nrc`, `giro`, `telefono1`, `telefono2`, `fax`, `email`, `tipo`, `descuento`, `dias_credito`, `tipo_documento`, `facturacion`, `contacto`, `contacto_telefono`, `contacto_correo`, `vendedor`, `observaciones`, `activo`, `deleted`) VALUES
(1, 0, '', 'Prueba', '', '0', 0, 0, 0, 0, 0, 0, 0, 0, '', '0', 0, 0, 0, 0, 0, '0', '', '', 0, '', 0, 1),
(2, 2, '', 'DASD', 'dasd', '0', 3, 28, 0, 4234, 0, 1, 4324, 0, '', '0', 2, 1, 0, 0, 0, '0', '', '', 0, '', 0, 1),
(3, 0, '', 'PRUEBA', 'Prueba comercial', '0', 12, 89, 1255656, 1548, 51515, 1, 8798, 6484, '868718671', '0', 1, 3, 10, 2, 0, '0', '1854-8348', 'h@hass.com', 0, 'Hola ifhsdkjnk', 1, 0),
(4, 0, '', 'PRUEBA NUEVABAN', 'Pruo', 'Holdalsjgd', 2, 13, 13423424, 4234, 2147483647, 1, 4234, 2342, '234234234', 'hou@gmaill.com', 1, 1, 14, 2, 0, 'Mauricio', '3242-3423', 'h@hass.com', 0, 'Hola como eta', 0, 1),
(5, 0, '', 'PRUEBA NUEVABAN', 'Pruo', 'Holdalsjgd', 2, 13, 13423424, 4234, 2147483647, 1, 4234, 2342, '234234234', 'hou@gmaill.com', 1, 1, 14, 2, 0, 'Mauricio', '3242-3423', 'h@hass.com', 0, 'Hola como eta', 1, 0),
(6, 4, '', 'SUBURBAN', 'PRO', 'Barrio el Calvario', 4, 129, 13423424, 4234, 2147483647, 9, 7250, 2342, '234234234', 'guada6190@gmail.com', 2, 4, 10, 2, 0, 'Mauricio', '3242-3423', 'h@hass.com', 0, 'Hola como eesta', 1, 0),
(7, 4, '', 'SUBURBAN', 'PRO', 'Barrio el Calvario', 4, 129, 13423424, 4234, 2147483647, 9, 7250, 2342, '234234234', 'guada6190@gmail.com', 2, 4, 10, 2, 0, 'Mauricio', '3242-3423', 'h@hass.com', 0, 'Hola como eesta', 1, 0),
(8, 4, '', 'SUBURBAN', 'PRO', 'Barrio el Calvario', 4, 129, 13423424, 4234, 2147483647, 9, 7250, 2342, '234234234', 'guada6190@gmail.com', 2, 4, 10, 2, 0, 'Mauricio', '3242-3423', 'h@hass.com', 0, 'Hola como eesta', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_compras`
--

CREATE TABLE `conf_compras` (
  `conf_compras` int(11) NOT NULL,
  `garantias_proveedor` tinyint(1) NOT NULL,
  `libro_ventas_cf` tinyint(1) NOT NULL,
  `ticket_auditoria` tinyint(1) NOT NULL,
  `vouchers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_pos`
--

CREATE TABLE `conf_pos` (
  `conf_pos` int(11) NOT NULL,
  `credito` tinyint(1) NOT NULL,
  `libro_compras` tinyint(1) NOT NULL,
  `libro_ventas_contribuyente` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conf_productos`
--

CREATE TABLE `conf_productos` (
  `conf_productos` int(11) NOT NULL,
  `pos` tinyint(1) NOT NULL,
  `cotizaciones` tinyint(1) NOT NULL,
  `pagos` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL COMMENT 'ID del departamento',
  `nombre` varchar(30) NOT NULL COMMENT 'Nombre del departamento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Departamentos de El Salvador';

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre`) VALUES
(1, 'Ahuachapán'),
(2, 'Santa Ana'),
(3, 'Sonsonate'),
(4, 'La Libertad'),
(5, 'Chalatenango'),
(6, 'San Salvador'),
(7, 'Cuscatlán'),
(8, 'La Paz'),
(9, 'Cabañas'),
(10, 'San Vicente'),
(11, 'Usulután'),
(12, 'Morazán'),
(13, 'San Miguel'),
(14, 'La Unión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `codvende` int(2) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nombre_abreviado` varchar(30) NOT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `municipio` tinyint(3) DEFAULT NULL,
  `depto` tinyint(3) DEFAULT NULL,
  `pais` tinyint(3) DEFAULT NULL,
  `telefono1` varchar(12) DEFAULT NULL,
  `telefono2` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fechan` date DEFAULT NULL,
  `fechaing` date DEFAULT NULL,
  `fecharet` date NOT NULL,
  `sexo` int(1) DEFAULT NULL,
  `edad` int(2) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `profesion` varchar(25) DEFAULT NULL,
  `dui` varchar(12) DEFAULT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `noisss` varchar(10) DEFAULT NULL,
  `noafp` varchar(10) DEFAULT NULL,
  `isss` int(1) DEFAULT NULL,
  `afp` float(2,1) DEFAULT NULL,
  `renta` int(1) DEFAULT NULL,
  `prestamo` int(1) DEFAULT NULL,
  `otro` int(1) DEFAULT NULL,
  `cuentabco` varchar(10) DEFAULT NULL,
  `contacto` varchar(10) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `salarioant` int(1) DEFAULT NULL,
  `inactivo` varchar(5) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL,
  `acceso_sistema` tinyint(1) NOT NULL,
  `imagen` varchar(500) NOT NULL,
  `vendedor` tinyint(1) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `tipo_empleado` int(11) NOT NULL,
  `nup` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `codvende`, `nombre`, `nombre_abreviado`, `direccion`, `municipio`, `depto`, `pais`, `telefono1`, `telefono2`, `email`, `fechan`, `fechaing`, `fecharet`, `sexo`, `edad`, `salario`, `cargo`, `profesion`, `dui`, `nit`, `noisss`, `noafp`, `isss`, `afp`, `renta`, `prestamo`, `otro`, `cuentabco`, `contacto`, `usuario`, `password`, `salarioant`, `inactivo`, `admin`, `acceso_sistema`, `imagen`, `vendedor`, `id_sucursal`, `tipo_empleado`, `nup`) VALUES
(1, 1, 'GERENCIA', '', 'SANTA TECLA', NULL, NULL, NULL, '', '', NULL, '0000-00-00', '0000-00-00', '0000-00-00', NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'admin', 'f90d1250fd96b918b6d474a2e549510c', NULL, NULL, 1, 1, '', 0, 0, 2, ''),
(2, 2, 'SERGIO ARNOLDO ORTIZ', '', 'URB NUEVO LOURDES SENDA 7 BLOCK 50 # 45,', NULL, NULL, NULL, '7021-7125', '7021-7125', NULL, '1969-04-26', '0000-00-00', '0000-00-00', NULL, NULL, NULL, '', '', '00839903 -9', '0614-260469-114-2', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, 0, 'SERGIOFOTO.PNG', 0, 0, 2, ''),
(3, 3, 'GUNNAR SALVADOR FRANCO', '', 'SANTA TECLA', NULL, NULL, NULL, '2233-0891', '7396-6037', NULL, '1970-12-19', '2016-08-01', '0000-00-00', NULL, NULL, NULL, '', '', '003828191-5', '9483-191270-001-2', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, 0, 'GUNNARFOTO.PNG', 0, 0, 0, '0025-91917'),
(4, 4, 'JUAN GABRIEL FRANCO', '', 'MIRALVALLE', NULL, NULL, NULL, '', '7210-0741', NULL, '1972-09-17', '2015-09-06', '0000-00-00', NULL, NULL, NULL, '', '', '00366716 -0', '0511-170972-001-3', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, 0, 'FOTOJGABRIEL.PNG', 0, 0, 0, ''),
(5, 5, 'DIEGO ALEJANDRO LOPEZ TORRES', '', 'AV JOSE SIMEON CAÑAS 1-7 LOURDES COLON', NULL, NULL, NULL, '7145-0927', '7145-0927', NULL, '1995-11-06', '2017-07-01', '0000-00-00', NULL, NULL, NULL, '', '', '05263220 -1', '0503-061195-101-3', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, 0, 'DIEGO.JPG', 0, 0, 2, ''),
(6, 6, 'HUGO ERNESTO MONTANO CALLES', '', 'CARR A COMASAGUACOL MATAZANO SECTOR CENT', NULL, NULL, NULL, '', '7308-1670', NULL, '1975-11-16', '2018-04-19', '0000-00-00', NULL, NULL, NULL, '', '', '02113865 -6', '0511-101076-105-5', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, 0, '', 0, 0, 2, ''),
(7, 7, 'CENIA MARIEL GARCIA RODRIGUEZ  ', '', 'RES SAN LUIS PJE 6 # 25A SAN SALVADOR  ', 127, 6, NULL, '-  ', '7795-3293  ', '  ', '1974-09-19', '2018-07-02', '0000-00-00', 1, 46, 0, '', '', '02422364 -6 ', '0821-190974-104-1  ', '', '', NULL, NULL, NULL, NULL, NULL, '', '', 'cenia', '55346ac39cb1a877ca0256934037e8c3', NULL, NULL, 0, 1, '', 0, 1, 2, ''),
(8, 8, 'JOSE REINALDO HERNANDEZ GUERRERO', '', 'UBRB ESPAÑA SENDA SEVILLA POL 20 CASA 2', NULL, NULL, NULL, '2667-8773', '7569-7101', NULL, '1990-12-28', '2019-02-11', '0000-00-00', NULL, NULL, NULL, '', '', '004420785-6', '1217-281290-103-7', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, 0, '', 0, 0, 2, ''),
(9, 9, 'DIEGO FERNANDO TABLAS DURAN', '', 'RES LA GLORIA POL F-1 CASA 4 MEJICANOS', NULL, NULL, NULL, '7105-1854', '', NULL, '1994-08-29', '2019-07-15', '0000-00-00', NULL, NULL, NULL, '', '', '005056142-0', '0501-290894-101-9', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, 0, 0, '', 0, 0, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `color` int(11) NOT NULL,
  `icono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion`, `color`, `icono`) VALUES
(1, 'RECIBIDA', 0, 0),
(2, 'ASIGNADA', 0, 0),
(3, 'ACEPTADA', 0, 0),
(4, 'EN TRANSITO', 0, 0),
(5, 'ENTREGADA', 0, 0),
(6, 'CANCELADA', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `giro`
--

CREATE TABLE `giro` (
  `id_giro` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `codigo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `giro`
--

INSERT INTO `giro` (`id_giro`, `descripcion`, `codigo`) VALUES
(1, 'Cultivo de cereales excepto arroz y para forrajes', '01111'),
(2, 'Cultivo de legumbres', '01112'),
(3, 'Cultivo de semillas oleaginosas', '01113'),
(4, 'Cultivo de plantas para la preparación de semillas', '01114'),
(5, 'Cultivo de otros cereales excepto arroz y forrajeros n.c.p.', '01119'),
(6, 'Cultivo de arroz', '01120'),
(7, 'Cultivo de raíces y tubérculos', '01131'),
(8, 'Cultivo de brotes, bulbos, vegetales tubérculos y cultivos similares', '01132'),
(9, 'Cultivo hortícola de fruto', '01133'),
(10, 'Cultivo de hortalizas de hoja y otras hortalizas ncp', '01134'),
(11, 'Cultivo de caña de azúcar', '01140'),
(12, 'Cultivo de tabaco', '01150'),
(13, 'Cultivo de algodón', '01161'),
(14, 'Cultivo de fibras vegetales excepto algodón', '01162'),
(15, 'Cultivo de plantas no perennes  para la producción de semillas y flores', '01191'),
(16, 'Cultivo de cereales y pastos para la alimentación animal', '01192'),
(17, 'Producción de cultivos no estacionales  ncp', '01199'),
(18, 'Cultivo de frutas tropicales', '01220'),
(19, 'Cultivo de cítricos', '01230'),
(20, 'Cultivo de frutas de pepita y hueso', '01240'),
(21, 'Cultivo de frutas ncp', '01251'),
(22, 'Cultivo de otros frutos  y nueces de árboles y arbustos', '01252'),
(23, 'Cultivo de frutos oleaginosos', '01260'),
(24, 'Cultivo de café', '01271'),
(25, 'Cultivo de plantas para la elaboración de bebidas excepto café', '01272'),
(26, 'Cultivo de especias y aromáticas', '01281'),
(27, 'Cultivo de plantas para la obtención de productos medicinales y farmacéuticos', '01282'),
(28, 'Cultivo de árboles de hule (caucho) para la obtención de látex', '01291'),
(29, 'Cultivo de plantas para la obtención de productos químicos y colorantes', '01292'),
(30, 'Producción de cultivos perennes ncp', '01299'),
(31, 'Propagación de plantas', '01300'),
(32, 'Cultivo de plantas y flores ornamentales', '01301'),
(33, 'Cría y engorde de ganado bovino', '01410'),
(34, 'Cría de caballos y otros equinos', '01420'),
(35, 'Cría de ovejas y cabras', '01440'),
(36, 'Cría de cerdos', '01450'),
(37, 'Cría de aves de corral y producción de huevos', '01460'),
(38, 'Cría de abejas apicultura para la obtención de miel y otros productos apícolas', '01491'),
(39, 'Cría de conejos', '01492'),
(40, 'Cría de iguanas y garrobos', '01493'),
(41, 'Cría de mariposas y otros insectos', '01494'),
(42, 'Cría y obtención de productos animales n.c.p.', '01499'),
(43, 'Cultivo de productos agrícolas en combinación con la cría de animales', '01500'),
(44, 'Servicios de maquinaria agrícola', '01611'),
(45, 'Control de plagas', '01612'),
(46, 'Servicios de riego', '01613'),
(47, 'Servicios de contratación de mano de obra para la agricultura', '01614'),
(48, 'Servicios agrícolas ncp', '01619'),
(49, 'Actividades para mejorar la reproducción, el crecimiento y el rendimiento de los animales y sus productos', '01621'),
(50, 'Servicios de mano de obra pecuaria', '01622'),
(51, 'Servicios pecuarios ncp', '01629'),
(52, 'Labores post cosecha de preparación de los productos agrícolas para su comercialización o para la industria', '01631'),
(53, 'Servicio de beneficio de café', '01632'),
(54, 'Servicio de beneficiado de plantas textiles (incluye el beneficiado cuando este es realizado en la misma explotación agropecuaria)', '01633'),
(55, 'Tratamiento de semillas para la propagación', '01640'),
(56, 'Caza ordinaria y mediante trampas, repoblación de animales de caza y servicios conexos', '01700'),
(57, 'Silvicultura y otras actividades forestales', '02100'),
(58, 'Extracción de madera', '02200'),
(59, 'Recolección de productos diferentes a la madera', '02300'),
(60, 'Servicios de apoyo a la silvicultura', '02400'),
(61, 'Pesca marítima de altura y costera', '03110'),
(62, 'Pesca de agua dulce', '03120'),
(63, 'Acuicultura marítima', '03210'),
(64, 'Acuicultura de agua dulce', '03220'),
(65, 'Servicios de apoyo a la pesca y acuicultura', '03300'),
(66, 'Extracción de hulla', '05100'),
(67, 'Extracción y aglomeración de lignito', '05200'),
(68, 'Extracción de petróleo crudo', '06100'),
(69, 'Extracción de gas natural', '06200'),
(70, 'Extracción de minerales  de hierro', '07100'),
(71, 'Extracción de minerales de uranio y torio', '07210'),
(72, 'Extracción de minerales metalíferos no ferrosos', '07290'),
(73, 'Extracción de piedra, arena y arcilla', '08100'),
(74, 'Extracción de minerales para la fabricación de abonos y productos químicos', '08910'),
(75, 'Extracción y aglomeración de turba', '08920'),
(76, 'Extracción de sal', '08930'),
(77, 'Explotación de otras minas y canteras ncp', '08990'),
(78, 'Actividades de apoyo a la extracción de petróleo y gas natural', '09100'),
(79, 'Actividades de apoyo a la explotación de minas y canteras', '09900'),
(80, 'Servicio de rastros y mataderos de bovinos y porcinos', '10101'),
(81, 'Matanza y procesamiento de bovinos y porcinos', '10102'),
(82, 'Matanza y procesamientos de aves de corral', '10103'),
(83, 'Elaboración y conservación de embutidos y tripas naturales', '10104'),
(84, 'Servicios de conservación y empaque de carnes', '10105'),
(85, 'Elaboración y conservación de grasas y aceites animales', '10106'),
(86, 'Servicios de molienda de carne', '10107'),
(87, 'Elaboración de productos de carne ncp', '10108'),
(88, 'Procesamiento y conservación de pescado, crustáceos y moluscos', '10201'),
(89, 'Fabricación de productos de pescado ncp', '10209'),
(90, 'Elaboración de jugos de frutas y hortalizas', '10301'),
(91, 'Elaboración y envase de jaleas, mermeladas y frutas deshidratadas', '10302'),
(92, 'Elaboración de productos de frutas y hortalizas n.c.p.', '10309'),
(93, 'Fabricación de aceites y grasas vegetales y animales comestibles', '10401'),
(94, 'Fabricación de aceites y grasas vegetales y animales no comestibles', '10402'),
(95, 'Servicio de maquilado de aceites', '10409'),
(96, 'Fabricación de productos lácteos excepto sorbetes y quesos sustitutos', '10501'),
(97, 'Fabricación de sorbetes y helados', '10502'),
(98, 'Fabricación de quesos', '10503'),
(99, 'Molienda de cereales', '10611'),
(100, 'Elaboración de cereales para el desayuno y similares', '10612'),
(101, 'Servicios de beneficiado de productos agrícolas ncp (excluye Beneficio de azúcar rama 1072  y beneficio de café rama 0163)', '10613'),
(102, 'Fabricación de almidón', '10621'),
(103, 'Servicio de molienda de maíz húmedo molino para nixtamal', '10628'),
(104, 'Elaboración de tortillas', '10711'),
(105, 'Fabricación de pan, galletas y barquillos', '10712'),
(106, 'Fabricación de repostería', '10713'),
(107, 'Ingenios azucareros', '10721'),
(108, 'Molienda de caña de azúcar para la elaboración de dulces', '10722'),
(109, 'Elaboración de jarabes de azúcar y otros similares', '10723'),
(110, 'Maquilado de azúcar de caña', '10724'),
(111, 'Fabricación de cacao, chocolates y  productos de confitería', '10730'),
(112, 'Elaboración de macarrones, fideos, y productos farináceos similares', '10740'),
(113, 'Elaboración de comidas y platos preparados para la reventa en locales y/o  para exportación', '10750'),
(114, 'Elaboración de productos de café', '10791'),
(115, 'Elaboración de especies, sazonadores y condimentos', '10792'),
(116, 'Elaboración de sopas, cremas y consomé', '10793'),
(117, 'Fabricación de bocadillos tostados y/o fritos', '10794'),
(118, 'Elaboración de productos alimenticios ncp', '10799'),
(119, 'Elaboración de alimentos preparados para animales', '10800'),
(120, 'Fabricación de aguardiente y licores', '11012'),
(121, 'Elaboración de vinos', '11020'),
(122, 'Fabricación de cerveza', '11030'),
(123, 'Fabricación de aguas gaseosas', '11041'),
(124, 'Fabricación y envasado  de agua', '11042'),
(125, 'Elaboración de refrescos', '11043'),
(126, 'Maquilado de aguas gaseosas', '11048'),
(127, 'Elaboración de bebidas no alcohólicas', '11049'),
(128, 'Elaboración de productos de tabaco', '12000'),
(129, 'Preparación de fibras textiles', '13111'),
(130, 'Fabricación de hilados', '13112'),
(131, 'Fabricación de telas', '13120'),
(132, 'Acabado de productos textiles', '13130'),
(133, 'Fabricación de tejidos de punto y  ganchillo', '13910'),
(134, 'Fabricación de productos textiles para el hogar', '13921'),
(135, 'Sacos, bolsas y otros artículos textiles', '13922'),
(136, 'Fabricación de artículos confeccionados con materiales textiles, excepto prendas de vestir n.c.p', '13929'),
(137, 'Fabricación de tapices y alfombras', '13930'),
(138, 'Fabricación de cuerdas de henequén y otras fibras naturales (lazos, pitas)', '13941'),
(139, 'Fabricación de redes de diversos materiales', '13942'),
(140, 'Maquilado de productos trenzables de cualquier material (petates, sillas, etc.)', '13948'),
(141, 'Fabricación de adornos, etiquetas y otros artículos para prendas de vestir', '13991'),
(142, 'Servicio de bordados en artículos y prendas de tela', '13992'),
(143, 'Fabricación de productos textiles ncp', '13999'),
(144, 'Fabricación de ropa  interior, para dormir y similares', '14101'),
(145, 'Fabricación de ropa para niños', '14102'),
(146, 'Fabricación de prendas de vestir para ambos sexos', '14103'),
(147, 'Confección de prendas a medida', '14104'),
(148, 'Fabricación de prendas de vestir para deportes', '14105'),
(149, 'Elaboración de artesanías de uso personal confeccionadas especialmente de materiales textiles', '14106'),
(150, 'Maquilado  de prendas de vestir, accesorios y otros', '14108'),
(151, 'Fabricación de prendas y accesorios de vestir n.c.p.', '14109'),
(152, 'Fabricación de artículos de piel', '14200'),
(153, 'Fabricación de calcetines, calcetas, medias (panty house) y otros similares', '14301'),
(154, 'Fabricación de ropa interior de tejido de punto', '14302'),
(155, 'Fabricación de prendas de vestir de tejido de punto ncp', '14309'),
(156, 'Curtido y adobo de cueros; adobo y teñido de pieles', '15110'),
(157, 'Fabricación de maletas, bolsos de mano y otros artículos de marroquinería', '15121'),
(158, 'Fabricación de monturas, accesorios y vainas talabartería', '15122'),
(159, 'Fabricación de artesanías principalmente de cuero natural y sintético', '15123'),
(160, 'Maquilado de artículos de cuero natural, sintético y de otros materiales', '15128'),
(161, 'Fabricación de calzado', '15201'),
(162, 'Fabricación de partes y accesorios de calzado', '15202'),
(163, 'Maquilado de calzado y partes de calzado', '15208'),
(164, 'Aserradero y acepilladura de madera', '16100'),
(165, 'Fabricación de madera laminada, terciada, enchapada y contrachapada, paneles para la construcción', '16210'),
(166, 'Fabricación de partes y piezas de carpintería para edificios y construcciones', '16220'),
(167, 'Fabricación de envases y recipientes de madera', '16230'),
(168, 'Fabricación de artesanías de madera, semillas,  materiales trenzables', '16292'),
(169, 'Fabricación de productos de madera, corcho, paja y materiales trenzables ncp', '16299'),
(170, 'Fabricación de pasta de madera, papel y cartón', '17010'),
(171, 'Fabricación de papel y cartón ondulado y envases de papel y cartón', '17020'),
(172, 'Fabricación de artículos de papel y cartón de uso personal y doméstico', '17091'),
(173, 'Fabricación de productos de papel ncp', '17092'),
(174, 'Impresión', '18110'),
(175, 'Servicios relacionados con la impresión', '18120'),
(176, 'Reproducción de grabaciones', '18200'),
(177, 'Fabricación de productos de hornos de coque', '19100'),
(178, 'Fabricación de combustible', '19201'),
(179, 'Fabricación de aceites y lubricantes', '19202'),
(180, 'Fabricación de materias primas para la fabricación de colorantes', '20111'),
(181, 'Fabricación de materiales curtientes', '20112'),
(182, 'Fabricación de gases industriales', '20113'),
(183, 'Fabricación de alcohol etílico', '20114'),
(184, 'Fabricación de sustancias químicas básicas', '20119'),
(185, 'Fabricación de abonos y fertilizantes', '20120'),
(186, 'Fabricación de plástico y caucho en formas primarias', '20130'),
(187, 'Fabricación de plaguicidas y otros productos químicos de uso agropecuario', '20210'),
(188, 'Fabricación de pinturas, barnices y productos de revestimiento similares; tintas de imprenta y masillas', '20220'),
(189, 'Fabricación de jabones, detergentes y similares para limpieza', '20231'),
(190, 'Fabricación de perfumes, cosméticos y productos de higiene y cuidado personal, incluyendo tintes, champú, etc.', '20232'),
(191, 'Fabricación de tintas y colores para escribir y pintar; fabricación de cintas para impresoras', '20291'),
(192, 'Fabricación de productos pirotécnicos, explosivos y municiones', '20292'),
(193, 'Fabricación de productos químicos n.c.p.', '20299'),
(194, 'Fabricación de fibras artificiales', '20300'),
(195, 'Manufactura de productos farmacéuticos, sustancias químicas y productos botánicos', '21001'),
(196, 'Maquilado de medicamentos', '21008'),
(197, 'Fabricación de cubiertas y cámaras; renovación y recauchutado de cubiertas', '22110'),
(198, 'Fabricación de otros productos de caucho', '22190'),
(199, 'Fabricación de envases plásticos', '22201'),
(200, 'Fabricación de productos plásticos para uso personal o doméstico', '22202'),
(201, 'Maquila de plásticos', '22208'),
(202, 'Fabricación de productos plásticos n.c.p.', '22209'),
(203, 'Fabricación de vidrio', '23101'),
(204, 'Fabricación de recipientes y envases de vidrio', '23102'),
(205, 'Servicio de maquilado', '23108'),
(206, 'Fabricación de productos de vidrio ncp', '23109'),
(207, 'Fabricación de productos refractarios', '23910'),
(208, 'Fabricación de productos de arcilla para la construcción', '23920'),
(209, 'Fabricación de productos de cerámica y porcelana no refractaria', '23931'),
(210, 'Fabricación de productos de cerámica y porcelana ncp', '23932'),
(211, 'Fabricación de cemento, cal y yeso', '23940'),
(212, 'Fabricación de artículos de hormigón, cemento y yeso', '23950'),
(213, 'Corte, tallado y acabado de la piedra', '23960'),
(214, 'Fabricación de productos minerales no metálicos ncp', '23990'),
(215, 'Industrias básicas de hierro y acero', '24100'),
(216, 'Fabricación de productos primarios de metales preciosos y metales no ferrosos', '24200'),
(217, 'Fundición de hierro y acero', '24310'),
(218, 'Fundición de metales no ferrosos', '24320'),
(219, 'Fabricación de productos metálicos para uso estructural', '25111'),
(220, 'Servicio de maquila para la fabricación de estructuras metálicas', '25118'),
(221, 'Fabricación de tanques, depósitos y recipientes de metal', '25120'),
(222, 'Fabricación de generadores de vapor, excepto calderas de agua caliente  para calefacción central', '25130'),
(223, 'Fabricación de armas y municiones', '25200'),
(224, 'Forjado, prensado, estampado y laminado de metales; pulvimetalurgia', '25910'),
(225, 'Tratamiento y revestimiento de metales', '25920'),
(226, 'Fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería', '25930'),
(227, 'Fabricación de envases y artículos conexos de metal', '25991'),
(228, 'Fabricación de artículos metálicos de uso personal y/o doméstico', '25992'),
(229, 'Fabricación de productos elaborados de metal ncp', '25999'),
(230, 'Fabricación de componentes electrónicos', '26100'),
(231, 'Fabricación de computadoras y equipo conexo', '26200'),
(232, 'Fabricación de equipo de comunicaciones', '26300'),
(233, 'Fabricación de aparatos  electrónicos de consumo para audio, video radio y televisión', '26400'),
(234, 'Fabricación de instrumentos y aparatos para medir, verificar, ensayar, navegar y de control de procesos industriales', '26510'),
(235, 'Fabricación de relojes y piezas de relojes', '26520'),
(236, 'Fabricación de equipo médico de irradiación y equipo electrónico de uso médico y terapéutico', '26600'),
(237, 'Fabricación de instrumentos de óptica y equipo fotográfico', '26700'),
(238, 'Fabricación de medios magnéticos y ópticos', '26800'),
(239, 'Fabricación de motores, generadores , transformadores eléctricos, aparatos de distribución y control de electricidad', '27100'),
(240, 'Fabricación de pilas, baterías y acumuladores', '27200'),
(241, 'Fabricación de cables de fibra óptica', '27310'),
(242, 'Fabricación de otros  hilos y cables eléctricos', '27320'),
(243, 'Fabricación de dispositivos de cableados', '27330'),
(244, 'Fabricación de equipo eléctrico de iluminación', '27400'),
(245, 'Fabricación de aparatos de uso doméstico', '27500'),
(246, 'Fabricación de otros tipos de equipo eléctrico', '27900'),
(247, 'Fabricación de motores y turbinas, excepto motores para aeronaves, vehículos automotores y motocicletas', '28110'),
(248, 'Fabricación de equipo hidráulico', '28120'),
(249, 'Fabricación de otras bombas, compresores, grifos y válvulas', '28130'),
(250, 'Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión', '28140'),
(251, 'Fabricación de hornos y quemadores', '28150'),
(252, 'Fabricación de equipo de elevación y manipulación', '28160'),
(253, 'Fabricación de maquinaria y equipo de oficina', '28170'),
(254, 'Fabricación de herramientas manuales', '28180'),
(255, 'Fabricación de otros tipos de maquinaria de uso general', '28190'),
(256, 'Fabricación de maquinaria agropecuaria y forestal', '28210'),
(257, 'Fabricación de máquinas para conformar metales y maquinaria herramienta', '28220'),
(258, 'Fabricación de maquinaria metalúrgica', '28230'),
(259, 'Fabricación de maquinaria para la explotación de minas y canteras y para obras de construcción', '28240'),
(260, 'Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco', '28250'),
(261, 'Fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros', '28260'),
(262, 'Fabricación de máquinas para imprenta', '28291'),
(263, 'Fabricación de maquinaria de uso especial ncp', '28299'),
(264, 'Fabricación vehículos automotores', '29100'),
(265, 'Fabricación de carrocerías para vehículos automotores; fabricación de remolques y semiremolques', '29200'),
(266, 'Fabricación de partes, piezas y accesorios para vehículos automotores', '29300'),
(267, 'Fabricación de buques', '30110'),
(268, 'Construcción y reparación de embarcaciones de recreo', '30120'),
(269, 'Fabricación de locomotoras y de material rodante', '30200'),
(270, 'Fabricación de aeronaves y naves espaciales', '30300'),
(271, 'Fabricación de vehículos militares de combate', '30400'),
(272, 'Fabricación de motocicletas', '30910'),
(273, 'Fabricación de bicicletas y sillones de ruedas para inválidos', '30920'),
(274, 'Fabricación de equipo de transporte ncp', '30990'),
(275, 'Fabricación de colchones y somier', '31001'),
(276, 'Fabricación de muebles y otros productos de madera a medida', '31002'),
(277, 'Servicios de maquilado de muebles', '31008'),
(278, 'Fabricación de muebles ncp', '31009'),
(279, 'Fabricación de joyas platerías y joyerías', '32110'),
(280, 'Fabricación de joyas de imitación (fantasía) y artículos conexos', '32120'),
(281, 'Fabricación de instrumentos musicales', '32200'),
(282, 'Fabricación de artículos de deporte', '32301'),
(283, 'Servicio de maquila de productos deportivos', '32308'),
(284, 'Fabricación de juegos de mesa y de salón', '32401'),
(285, 'Servicio de maquilado de juguetes y juegos', '32402'),
(286, 'Fabricación de juegos y juguetes n.c.p.', '32409'),
(287, 'Fabricación de instrumentos y materiales médicos y odontológicos', '32500'),
(288, 'Fabricación de lápices, bolígrafos, sellos y artículos de librería en general', '32901'),
(289, 'Fabricación de escobas, cepillos, pinceles y similares', '32902'),
(290, 'Fabricación de artesanías de materiales diversos', '32903'),
(291, 'Fabricación de artículos de uso personal y domésticos n.c.p.', '32904'),
(292, 'Fabricación de accesorios para las confecciones y la marroquinería n.c.p.', '32905'),
(293, 'Servicios de maquila ncp', '32908'),
(294, 'Fabricación de productos manufacturados n.c.p.', '32909'),
(295, 'Reparación y mantenimiento de productos elaborados de metal', '33110'),
(296, 'Reparación y mantenimiento de maquinaria', '33120'),
(297, 'Reparación y mantenimiento de equipo electrónico y óptico', '33130'),
(298, 'Reparación y mantenimiento  de equipo eléctrico', '33140'),
(299, 'Reparación y mantenimiento de equipo de transporte, excepto vehículos automotores', '33150'),
(300, 'Reparación y mantenimiento de equipos n.c.p.', '33190'),
(301, 'Instalación de maquinaria y equipo industrial', '33200'),
(302, 'Generación de energía eléctrica', '35101'),
(303, 'Transmisión de energía eléctrica', '35102'),
(304, 'Distribución de energía eléctrica', '35103'),
(305, 'Fabricación de gas, distribución de combustibles gaseosos por tuberías', '35200'),
(306, 'Suministro de vapor y agua caliente', '35300'),
(307, 'Captación, tratamiento y suministro de agua', '36000'),
(308, 'Evacuación de aguas residuales (alcantarillado)', '37000'),
(309, 'Recolección y transporte de desechos sólidos proveniente de hogares y  sector urbano', '38110'),
(310, 'Recolección de desechos peligrosos', '38120'),
(311, 'Tratamiento y eliminación de desechos inicuos', '38210'),
(312, 'Tratamiento y eliminación de desechos peligrosos', '38220'),
(313, 'Reciclaje de desperdicios y desechos textiles', '38301'),
(314, 'Reciclaje de desperdicios y desechos de plástico y caucho', '38302'),
(315, 'Reciclaje de desperdicios y desechos de vidrio', '38303'),
(316, 'Reciclaje de desperdicios y desechos de papel y cartón', '38304'),
(317, 'Reciclaje de desperdicios y desechos metálicos', '38305'),
(318, 'Reciclaje de desperdicios y desechos no metálicos  n.c.p.', '38309'),
(319, 'Actividades de Saneamiento y otros Servicios de Gestión de Desechos', '39000'),
(320, 'Construcción de edificios residenciales', '41001'),
(321, 'Construcción de edificios no residenciales', '41002'),
(322, 'Construcción de carreteras, calles y caminos', '42100'),
(323, 'Construcción de proyectos de servicio público', '42200'),
(324, 'Construcción de obras de ingeniería civil n.c.p.', '42900'),
(325, 'Demolición', '43110'),
(326, 'Preparación de terreno', '43120'),
(327, 'Instalaciones eléctricas', '43210'),
(328, 'Instalación de fontanería, calefacción y aire acondicionado', '43220'),
(329, 'Otras instalaciones para obras de construcción', '43290'),
(330, 'Terminación y acabado de edificios', '43300'),
(331, 'Otras actividades especializadas de construcción', '43900'),
(332, 'Fabricación de techos y materiales diversos', '43901'),
(333, 'Venta de vehículos automotores', '45100'),
(334, 'Reparación mecánica de vehículos automotores', '45201'),
(335, 'Reparaciones eléctricas del automotor y recarga de baterías', '45202'),
(336, 'Enderezado y pintura de vehículos automotores', '45203'),
(337, 'Reparaciones de radiadores, escapes y silenciadores', '45204'),
(338, 'Reparación y reconstrucción de vías, stop y otros artículos de fibra de vidrio', '45205'),
(339, 'Reparación de llantas de vehículos automotores', '45206'),
(340, 'Polarizado de vehículos (mediante la adhesión de papel especial a los vidrios)', '45207'),
(341, 'Lavado y pasteado de vehículos (carwash)', '45208'),
(342, 'Reparaciones de vehículos n.c.p.', '45209'),
(343, 'Remolque de vehículos automotores', '45211'),
(344, 'Venta de partes, piezas y accesorios nuevos para vehículos automotores', '45301'),
(345, 'Venta de partes, piezas y accesorios usados para vehículos automotores', '45302'),
(346, 'Venta de motocicletas', '45401'),
(347, 'Venta de repuestos, piezas y accesorios de motocicletas', '45402'),
(348, 'Mantenimiento y reparación  de motocicletas', '45403'),
(349, 'Venta al por mayor a cambio de retribución o por contrata', '46100'),
(350, 'Venta al por mayor de materias primas agrícolas', '46201'),
(351, 'Venta al por mayor de productos de la silvicultura', '46202'),
(352, 'Venta al por mayor de productos pecuarios y de granja', '46203'),
(353, 'Venta de productos para uso agropecuario', '46211'),
(354, 'Venta al por mayor de granos básicos (cereales, leguminosas)', '46291'),
(355, 'Venta  al por mayor de semillas mejoradas para cultivo', '46292'),
(356, 'Venta  al por mayor de café oro y uva', '46293'),
(357, 'Venta  al por mayor de caña de azúcar', '46294'),
(358, 'Venta al por mayor de flores, plantas  y otros productos naturales', '46295'),
(359, 'Venta al por mayor de productos agrícolas', '46296'),
(360, 'Venta  al por mayor de ganado bovino (vivo)', '46297'),
(361, 'Venta al por mayor de animales porcinos, ovinos, caprino, canículas, apícolas, avícolas vivos', '46298'),
(362, 'Venta de otras especies vivas del reino animal', '46299'),
(363, 'Venta al por mayor de alimentos', '46301'),
(364, 'Venta al por mayor de bebidas', '46302'),
(365, 'Venta al por mayor de tabaco', '46303'),
(366, 'Venta al por mayor de frutas, hortalizas (verduras), legumbres y tubérculos', '46371'),
(367, 'Venta al por mayor de pollos, gallinas destazadas, pavos y otras aves', '46372'),
(368, 'Venta al por mayor de carne bovina y porcina, productos de carne y embutidos', '46373'),
(369, 'Venta  al por mayor de huevos', '46374'),
(370, 'Venta al por mayor de productos lácteos', '46375'),
(371, 'Venta al por mayor de productos farináceos de panadería (pan dulce, cakes, respostería, etc.)', '46376'),
(372, 'Venta al por mayor de pastas alimenticas, aceites y grasas comestibles vegetal y animal', '46377'),
(373, 'Venta al por mayor de sal comestible', '46378'),
(374, 'Venta al por mayor de azúcar', '46379'),
(375, 'Venta al por mayor de abarrotes (vinos, licores, productos alimenticios envasados, etc.)', '46391'),
(376, 'Venta al por mayor de aguas gaseosas', '46392'),
(377, 'Venta al por mayor de agua purificada', '46393'),
(378, 'Venta al por mayor de refrescos y otras bebidas, líquidas o en polvo', '46394'),
(379, 'Venta al por mayor de cerveza y licores', '46395'),
(380, 'Venta al por mayor de hielo', '46396'),
(381, 'Venta al por mayor de hilados, tejidos y productos textiles de mercería', '46411'),
(382, 'Venta al por mayor de artículos textiles excepto confecciones para el hogar', '46412'),
(383, 'Venta al por mayor de confecciones textiles para el hogar', '46413'),
(384, 'Venta al por mayor de prendas de vestir y accesorios de vestir', '46414'),
(385, 'Venta al por mayor de ropa usada', '46415'),
(386, 'Venta al por mayor de calzado', '46416'),
(387, 'Venta al por mayor de artículos de marroquinería y talabartería', '46417'),
(388, 'Venta al por mayor de artículos de peletería', '46418'),
(389, 'Venta al por mayor de otros artículos textiles n.c.p.', '46419'),
(390, 'Venta al por mayor de instrumentos musicales', '46471'),
(391, 'Venta al por mayor de colchones, almohadas, cojines, etc.', '46472'),
(392, 'Venta al por mayor de artículos de aluminio para el hogar y para otros usos', '46473'),
(393, 'Venta al por mayor de depósitos y otros artículos plásticos para el hogar y otros usos, incluyendo los desechables de durapax  y no desechables', '46474'),
(394, 'Venta al por mayor de cámaras fotográficas, accesorios y materiales', '46475'),
(395, 'Venta al por mayor de medicamentos, artículos y otros productos de uso veterinario', '46482'),
(396, 'Venta al por mayor de productos y artículos de belleza  y de  uso personal', '46483'),
(397, 'Venta de produtos farmacéuticos y medicinales', '46484'),
(398, 'Venta al por mayor de productos medicinales, cosméticos, perfumería y productos de limpieza', '46491'),
(399, 'Venta al por mayor de relojes y artículos de joyería', '46492'),
(400, 'Venta al por mayor de electrodomésticos y artículos del hogar excepto bazar;  artículos de iluminación', '46493'),
(401, 'Venta al por mayor de artículos de bazar y similares', '46494'),
(402, 'Venta al por mayor de artículos de óptica', '46495'),
(403, 'Venta al por mayor de revistas, periódicos, libros, artículos de librería y artículos de papel y cartón en general', '46496'),
(404, 'Venta de artículos deportivos, juguetes y rodados', '46497'),
(405, 'Venta al por mayor de productos usados para el hogar o el uso personal', '46498'),
(406, 'Venta al por mayor de enseres domésticos y de uso personal n.c.p.', '46499'),
(407, 'Venta al por mayor de bicicletas, partes, accesorios y otros', '46500'),
(408, 'Venta al por mayor de computadoras, equipo periférico y programas informáticos', '46510'),
(409, 'Venta al por mayor de equipos de comunicación', '46520'),
(410, 'Venta al por mayor de maquinaria y equipo agropecuario, accesorios, partes y suministros', '46530'),
(411, 'Venta de equipos e instrumentos de uso profesional y cientÍfico y aparatos de medida y control', '46590'),
(412, 'Venta al por mayor de maquinaria equipo, accesorios y materiales para la industria de la madera y  sus  productos', '46591'),
(413, 'Venta al por mayor de maquinaria,  equipo, accesorios y materiales para las industria gráfica y del papel, cartón y productos de papel y cartón', '46592'),
(414, 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la  industria de  productos químicos, plástico y caucho', '46593'),
(415, 'Venta al por mayor de maquinaria, equipo, accesorios y materiales para la industria metálica y de sus productos', '46594'),
(416, 'Venta al por mayor de equipamiento para uso médico, odontológico, veterinario y servicios conexos', '46595'),
(417, 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria de la alimentación', '46596'),
(418, 'Venta al por mayor de maquinaria, equipo, accesorios y partes para la industria textil, confecciones y cuero', '46597'),
(419, 'Venta al por mayor de maquinaria, equipo y accesorios para la construcción y explotación de minas y canteras', '46598'),
(420, 'Venta al por mayor de otro tipo de maquinaria y equipo con sus accesorios y partes', '46599'),
(421, 'Venta al por mayor  de otros combustibles sólidos, líquidos, gaseosos y de productos conexos', '46610'),
(422, 'Venta al por mayor de combustibles para automotores, aviones, barcos, maquinaria  y otros', '46612'),
(423, 'Venta al por mayor de lubricantes, grasas y  otros aceites para automotores, maquinaria  industrial, etc.', '46613'),
(424, 'Venta al por mayor de gas propano', '46614'),
(425, 'Venta al  por mayor de leña y carbón', '46615'),
(426, 'Venta al por mayor de metales y minerales metalíferos', '46620'),
(427, 'Venta al por mayor de puertas, ventanas, vitrinas y similares', '46631'),
(428, 'Venta al por mayor de artículos de ferretería y pinturerías', '46632'),
(429, 'Vidrierías', '46633'),
(430, 'Venta al por mayor de maderas', '46634'),
(431, 'Venta al por mayor de materiales para la construcción n.c.p.', '46639'),
(432, 'Venta al por mayor de sal industrial sin yodar', '46691'),
(433, 'Venta al por mayor de productos intermedios y desechos de origen textil', '46692'),
(434, 'Venta al por mayor de productos intermedios y desechos de origen metálico', '46693'),
(435, 'Venta al por mayor de productos intermedios y desechos de papel y cartón', '46694'),
(436, 'Venta al por mayor fertilizantes, abonos, agroquímicos y productos similares', '46695'),
(437, 'Venta al por mayor de productos intermedios y desechos de origen plástico', '46696'),
(438, 'Venta al por mayor de tintas para imprenta, productos curtientes y materias y productos colorantes', '46697'),
(439, 'Venta de productos intermedios y desechos de origen químico y de caucho', '46698'),
(440, 'Venta al por mayor de productos intermedios y desechos ncp', '46699'),
(441, 'Venta de algodón en oro', '46701'),
(442, 'Venta al por mayor de otros productos', '46900'),
(443, 'Venta al por mayor de cohetes y otros productos pirotécnicos', '46901'),
(444, 'Venta al por mayor de articulos diversos para consumo humano', '46902'),
(445, 'Venta al por mayor de armas de fuego, municiones y accesorios', '46903'),
(446, 'Venta al por mayor de toldos y tiendas de campaña de cualquier material', '46904'),
(447, 'Venta al por mayor de exhibidores publicitarios y rótulos', '46905'),
(448, 'Venta al por mayor de artículos promociónales  diversos', '46906'),
(449, 'Venta en supermercados', '47111'),
(450, 'Venta en tiendas de articulos de primera necesidad', '47112'),
(451, 'Almacenes (venta de diversos artículos)', '47119'),
(452, 'Venta al por menor de otros productos en comercios no especializados', '47190'),
(453, 'Venta de establecimientos no especializados con surtido compuesto principalmente de alimentos, bebidas y tabaco', '47199'),
(454, 'Venta al por menor  de frutas y hortalizas', '47211'),
(455, 'Venta al por menor de carnes, embutidos y productos de granja', '47212'),
(456, 'Venta al por menor de pescado y mariscos', '47213'),
(457, 'Venta al por menor de productos  lácteos', '47214'),
(458, 'Venta al por menor de productos de panadería, repostería y galletas', '47215'),
(459, 'Venta al por menor de huevos', '47216'),
(460, 'Venta al por menor de carnes y productos cárnicos', '47217'),
(461, 'Venta al por menor  de granos básicos y otros', '47218'),
(462, 'Venta al por menor de alimentos n.c.p.', '47219'),
(463, 'Venta al por menor de hielo', '47221'),
(464, 'Venta de bebidas no alcohólicas, para su consumo fuera del establecimiento', '47223'),
(465, 'Venta de bebidas alcohólicas, para su consumo fuera del establecimiento', '47224'),
(466, 'Venta de bebidas alcohólicas para su consumo dentro del establecimiento', '47225'),
(467, 'Venta al por menor de tabaco', '47230'),
(468, 'Venta de combustibles, lubricantes y otros (gasolineras)', '47300'),
(469, 'Venta al por menor de computadoras y equipo periférico', '47411'),
(470, 'Venta de equipo y accesorios de telecomunicación', '47412'),
(471, 'Venta al por menor de equipo de audio y video', '47420'),
(472, 'Venta al por menor de hilados, tejidos y productos textiles de mercería; confecciones para el hogar y textiles n.c.p.', '47510'),
(473, 'Venta al por menor de productos de madera', '47521'),
(474, 'Venta al por menor de artículos de ferretería', '47522'),
(475, 'Venta al por menor de productos de pinturerías', '47523'),
(476, 'Venta al por menor en vidrierías', '47524'),
(477, 'Venta al por menor de materiales de construcción y artículos conexos', '47529'),
(478, 'Venta al por menor de tapices, alfombras y revestimientos de paredes y pisos en comercios  especializados', '47530'),
(479, 'Venta al por menor de muebles', '47591'),
(480, 'Venta al por menor de artículos de bazar', '47592'),
(481, 'Venta al por menor de aparatos electrodomésticos, repuestos y accesorios', '47593'),
(482, 'Venta al por menor de artículos eléctricos y de iluminación', '47594'),
(483, 'Venta al por menor de instrumentos musicales', '47598'),
(484, 'Venta al por menor de libros, periódicos y artículos de papelería en comercios especializados', '47610'),
(485, 'Venta al por menor de discos láser, cassettes, cintas de video y otros', '47620'),
(486, 'Venta al por menor de productos y equipos de deporte', '47630'),
(487, 'Venta al por menor de bicicletas, accesorios y repuestos', '47631'),
(488, 'Venta al por menor de juegos y juguetes  en comercios especializados', '47640'),
(489, 'Venta al por menor de prendas de vestir y accesorios de vestir', '47711'),
(490, 'Venta al por menor de calzado', '47712'),
(491, 'Venta al por menor de artículos de peletería, marroquinería y talabartería', '47713'),
(492, 'Venta al por menor de medicamentos farmacéuticos y otros materiales y artículos de uso médico, odontológico y veterinario', '47721'),
(493, 'Venta al por menor de productos cosméticos y de tocador', '47722'),
(494, 'Venta al por menor de productos de joyería, bisutería, óptica, relojería', '47731'),
(495, 'Venta al por menor de plantas, semillas, animales y artículos conexos', '47732'),
(496, 'Venta al por menor de combustibles de uso doméstico (gas propano y gas licuado)', '47733'),
(497, 'Venta al por menor de artesanías, artículos cerámicos y recuerdos en general', '47734'),
(498, 'Venta al por menor de ataúdes, lápidas y cruces, trofeos, artículos religiosos en general', '47735'),
(499, 'Venta al por menor de armas de fuego, municiones y accesorios', '47736'),
(500, 'Venta al por menor de artículos de cohetería y pirotécnicos', '47737'),
(501, 'Venta al por menor de artículos desechables de uso personal y doméstico (servilletas, papel higiénico, pañales, toallas sanitarias, etc.)', '47738'),
(502, 'Venta al por menor de otros productos  n.c.p.', '47739'),
(503, 'Venta al por menor de artículos usados', '47741'),
(504, 'Venta al por menor de textiles y confecciones usados', '47742'),
(505, 'Venta al por menor de libros, revistas, papel y cartón usados', '47743'),
(506, 'Venta al por menor de productos usados n.c.p.', '47749'),
(507, 'Venta al por menor de frutas, verduras y hortalizas', '47811'),
(508, 'Venta al por menor de carnes, embutidos y productos de granja', '47812'),
(509, 'Venta al por menor de productos lácteos', '47814'),
(510, 'Venta al por menor de productos de panadería, galletas y similares', '47815'),
(511, 'Venta al por menor de bebidas', '47816'),
(512, 'Venta al por menor en tiendas de mercado y puestos', '47818'),
(513, 'Venta al por menor de hilados, tejidos y productos textiles de mercería en puestos de mercados y ferias', '47821'),
(514, 'Venta al por menor de artículos textiles excepto confecciones para el hogar en puestos de mercados y ferias', '47822'),
(515, 'Venta al por menor de confecciones textiles para el hogar en puestos de mercados y ferias', '47823'),
(516, 'Venta al por menor de prendas de vestir, accesorios de vestir y similares en puestos de mercados y ferias', '47824'),
(517, 'Venta al por menor de ropa usada', '47825'),
(518, 'Venta al por menor de calzado, artículos de marroquinería y talabartería en puestos de mercados y ferias', '47826'),
(519, 'Venta al por menor de artículos de marroquinería y talabartería en puestos de mercados y ferias', '47827'),
(520, 'Venta al por menor de artículos textiles ncp en puestos de mercados y ferias', '47829'),
(521, 'Venta al por menor de animales, flores y productos conexos en puestos de feria y mercados', '47891'),
(522, 'Venta al por menor de productos medicinales, cosméticos, de tocador y de limpieza en puestos de ferias y mercados', '47892'),
(523, 'Venta al por menor de artículos de bazar en puestos de ferias y mercados', '47893'),
(524, 'Venta al por menor de artículos de papel, envases, libros, revistas y conexos en puestos de feria y mercados', '47894'),
(525, 'Venta al por menor de materiales de construcción, electrodomésticos, accesorios para autos y similares en puestos de feria y mercados', '47895'),
(526, 'Venta al por menor de equipos accesorios para las comunicaciones en puestos de feria y mercados', '47896'),
(527, 'Venta al por menor en puestos de ferias y mercados n.c.p.', '47899'),
(528, 'Venta al por menor por correo o Internet', '47910'),
(529, 'Otros tipos de venta al por menor no realizada, en almacenes, puestos de venta o mercado', '47990'),
(530, 'Transporte interurbano de pasajeros  por ferrocarril', '49110'),
(531, 'Transporte de carga por ferrocarril', '49120'),
(532, 'Transporte de pasajeros urbanos e interurbano mediante buses', '49211'),
(533, 'Transporte de pasajeros interdepartamental mediante microbuses', '49212'),
(534, 'Transporte de pasajeros urbanos e interurbano mediante microbuses', '49213'),
(535, 'Transporte de pasajeros interdepartamental mediante buses', '49214'),
(536, 'Transporte internacional de pasajeros', '49221'),
(537, 'Transporte de pasajeros mediante taxis y autos con chofer', '49222'),
(538, 'Transporte escolar', '49223'),
(539, 'Transporte de pasajeros para excursiones', '49225'),
(540, 'Servicios de transporte de personal', '49226'),
(541, 'Transporte de pasajeros por vía terrestre ncp', '49229'),
(542, 'Transporte de carga urbano', '49231'),
(543, 'Transporte nacional de carga', '49232'),
(544, 'Transporte de carga  internacional', '49233'),
(545, 'Servicios de  mudanza', '49234'),
(546, 'Alquiler de vehículos de carga con conductor', '49235'),
(547, 'Transporte por oleoducto o gasoducto', '49300'),
(548, 'Transporte de pasajeros marítimo y de cabotaje', '50110'),
(549, 'Transporte de carga marítimo y de cabotaje', '50120'),
(550, 'Transporte de pasajeros por vías de navegación interiores', '50211'),
(551, 'Alquiler de equipo de transporte de pasajeros por vías de navegación interior con conductor', '50212'),
(552, 'Transporte de carga por vías de navegación interiores', '50220'),
(553, 'Transporte aéreo de pasajeros', '51100'),
(554, 'Transporte de carga por vía aérea', '51201'),
(555, 'Alquiler de equipo de aerotransporte  con operadores para el propósito de transportar carga', '51202'),
(556, 'Alquiler de instalaciones de almacenamiento en zonas francas', '52101'),
(557, 'Alquiler de silos para conservación y almacenamiento de granos', '52102'),
(558, 'Alquiler de instalaciones con refrigeración para almacenamiento y conservación de alimentos y otros productos', '52103'),
(559, 'Alquiler de bodegas para almacenamiento y depósito n.c.p.', '52109'),
(560, 'Servicio de garaje y estacionamiento', '52211'),
(561, 'Servicios de terminales para el transporte por vía terrestre', '52212'),
(562, 'Servicios para el transporte por vía terrestre n.c.p.', '52219'),
(563, 'Servicios para el transporte acuático', '52220'),
(564, 'Servicios para el transporte aéreo', '52230'),
(565, 'Manipulación de carga', '52240'),
(566, 'Servicios para el transporte ncp', '52290'),
(567, 'Agencias de tramitaciones aduanales', '52291'),
(568, 'Servicios de  correo nacional', '53100'),
(569, 'Actividades de correo distintas a las actividades postales nacionales', '53200'),
(570, 'Actividades de alojamiento para estancias cortas', '55101'),
(571, 'Hoteles', '55102'),
(572, 'Actividades de campamentos, parques de vehículos de recreo y parques de caravanas', '55200'),
(573, 'Alojamiento n.c.p.', '55900'),
(574, 'Restaurantes', '56101'),
(575, 'Pupusería', '56106'),
(576, 'Actividades varias de restaurantes', '56107'),
(577, 'Comedores', '56108'),
(578, 'Merenderos ambulantes', '56109'),
(579, 'Preparación de comida para eventos especiales', '56210'),
(580, 'Servicios de provisión de comidas por contrato', '56291'),
(581, 'Servicios de concesión de cafetines y chalet en empresas e instituciones', '56292'),
(582, 'Servicios de preparación de comidas ncp', '56299'),
(583, 'Servicio de expendio de bebidas en salones y bares', '56301'),
(584, 'Servicio de expendio de bebidas en puestos callejeros, mercados y ferias', '56302'),
(585, 'Edición de libros, folletos, partituras y otras ediciones distintas a estas', '58110'),
(586, 'Edición de directorios y listas de correos', '58120'),
(587, 'Edición de periódicos, revistas y otras publicaciones periódicas', '58130'),
(588, 'Otras actividades de edición', '58190'),
(589, 'Edición de programas informáticos (software)', '58200'),
(590, 'Actividades de producción cinematográfica', '59110'),
(591, 'Actividades de post producción de películas, videos y programas  de televisión', '59120'),
(592, 'Actividades de distribución de películas cinematográficas, videos y programas de televisión', '59130'),
(593, 'Actividades de exhibición de películas cinematográficas y cintas de vídeo', '59140'),
(594, 'Actividades de edición y grabación de música', '59200'),
(595, 'Servicios de difusiones de radio', '60100'),
(596, 'Actividades de programación y difusión de televisión abierta', '60201'),
(597, 'Actividades de suscripción y difusión de televisión por cable y/o suscripción', '60202'),
(598, 'Servicios de televisión, incluye televisión por cable', '60299'),
(599, 'Programación y transmisión de radio y televisión', '60900'),
(600, 'Servicio de telefonía', '61101'),
(601, 'Servicio de Internet ', '61102'),
(602, 'Servicio de telefonía fija', '61103'),
(603, 'Servicio de Internet n.c.p.', '61109'),
(604, 'Servicios de telefonía celular', '61201'),
(605, 'Servicios de Internet inalámbrico', '61202'),
(606, 'Servicios de telecomunicaciones inalámbrico n.c.p.', '61209'),
(607, 'Telecomunicaciones satelitales', '61301'),
(608, 'Comunicación vía satélite n.c.p.', '61309'),
(609, 'Actividades de telecomunicación n.c.p.', '61900'),
(610, 'Programación Informática', '62010'),
(611, 'Consultorias y gestión de servicios informáticos', '62020'),
(612, 'Otras actividades de tecnología de información y servicios de computadora', '62090'),
(613, 'Procesamiento de datos y actividades relacionadas', '63110'),
(614, 'Portales WEB', '63120'),
(615, 'Servicios de Agencias de Noticias', '63910'),
(616, 'Otros servicios de información  n.c.p.', '63990'),
(617, 'Servicios provistos por el Banco Central de El salvador', '64110'),
(618, 'Bancos', '64190'),
(619, 'Entidades dedicadas al envío de remesas', '64192'),
(620, 'Otras entidades financieras', '64199'),
(621, 'Actividades de sociedades de cartera', '64200'),
(622, 'Fideicomisos, fondos y otras fuentes de financiamiento', '64300'),
(623, 'Arrendamiento financieros', '64910'),
(624, 'Asociaciones cooperativas de ahorro y crédito dedicadas a la intermediación financiera', '64920'),
(625, 'Instituciones emisoras de tarjetas de crédito y otros', '64921'),
(626, 'Tipos de crédito ncp', '64922'),
(627, 'Prestamistas y casas de empeño', '64928'),
(628, 'Actividades de servicios financieros, excepto la financiación de planes de seguros y de pensiones n.c.p.', '64990'),
(629, 'Planes de seguros de vida', '65110'),
(630, 'Planes de seguro excepto de vida', '65120'),
(631, 'Seguros generales de todo tipo', '65199'),
(632, 'Planes se seguro', '65200'),
(633, 'Planes de pensiones', '65300'),
(634, 'Administración de mercados financieros (Bolsa de Valores)', '66110'),
(635, 'Actividades bursátiles (Corredores de Bolsa)', '66120'),
(636, 'Actividades auxiliares de la intermediación financiera ncp', '66190'),
(637, 'Evaluación de riesgos y daños', '66210'),
(638, 'Actividades de agentes y corredores de seguros', '66220'),
(639, 'Otras actividades auxiliares de seguros y fondos de pensiones', '66290'),
(640, 'Actividades de administración de fondos', '66300'),
(641, 'Servicio de alquiler y venta de lotes en cementerios', '68101'),
(642, 'Actividades inmobiliarias realizadas con bienes propios o arrendados n.c.p.', '68109'),
(643, 'Actividades Inmobiliarias Realizadas a Cambio de una Retribución o por Contrata', '68200'),
(644, 'Actividades jurídicas', '69100'),
(645, 'Actividades de contabilidad, teneduría de libros y auditoría; asesoramiento en materia de impuestos', '69200'),
(646, 'Actividades de oficinas centrales de sociedades de cartera', '70100'),
(647, 'Actividades de consultoria en gestión empresarial', '70200'),
(648, 'Servicios de arquitectura y planificación urbana y servicios conexos', '71101'),
(649, 'Servicios de ingeniería', '71102'),
(650, 'Servicios de agrimensura, topografía, cartografía, prospección y geofísica y servicios conexos', '71103'),
(651, 'Ensayos y análisis técnicos', '71200'),
(652, 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingeniería', '72100'),
(653, 'Investigaciones científicas', '72199'),
(654, 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades científica y desarrollo', '72200'),
(655, 'Publicidad', '73100'),
(656, 'Investigación de mercados y realización de encuestas de opinión pública', '73200'),
(657, 'Actividades de diseño especializado', '74100'),
(658, 'Actividades de fotografía', '74200'),
(659, 'Servicios profesionales y científicos ncp', '74900'),
(660, 'Actividades veterinarias', '75000'),
(661, 'Alquiler de equipo de transporte terrestre', '77101'),
(662, 'Alquiler de equipo de transporte acuático', '77102'),
(663, 'Alquiler de equipo de transporte  por vía aérea', '77103'),
(664, 'Alquiler y arrendamiento de equipo de recreo y deportivo', '77210'),
(665, 'Alquiler de cintas de video y discos', '77220'),
(666, 'Alquiler de otros efectos personales y enseres domésticos', '77290'),
(667, 'Alquiler de maquinaria y equipo', '77300'),
(668, 'Arrendamiento de productos de propiedad intelectual', '77400'),
(669, 'Obtención y dotación de personal', '78100'),
(670, 'Actividades de las agencias de trabajo temporal', '78200'),
(671, 'Dotación de recursos humanos y gestión; gestión de las funciones de recursos humanos', '78300'),
(672, 'Actividades de agencias de viajes y organizadores de viajes; actividades de asistencia a turistas', '79110'),
(673, 'Actividades de los operadores turísticos', '79120'),
(674, 'Otros servicios de reservas y actividades relacionadas', '79900'),
(675, 'Servicios de seguridad privados', '80100'),
(676, 'Actividades de servicios de sistemas de seguridad', '80201'),
(677, 'Actividades para la prestación de sistemas de seguridad', '80202'),
(678, 'Actividades de investigación', '80300'),
(679, 'Actividades combinadas de mantenimiento de edificios e instalaciones', '81100'),
(680, 'Limpieza general de edificios', '81210'),
(681, 'Otras actividades combinadas de mantenimiento de edificios e instalaciones ncp', '81290'),
(682, 'Servicio de jardinería', '81300'),
(683, 'Servicios administrativos de oficinas', '82110'),
(684, 'Servicio de fotocopiado y similares, excepto en imprentas', '82190'),
(685, 'Actividades de las centrales de llamadas (call center)', '82200'),
(686, 'Organización de convenciones y ferias de negocios', '82300'),
(687, 'Actividades de agencias de cobro y oficinas de crédito', '82910'),
(688, 'Servicios de envase y empaque de productos alimenticios', '82921'),
(689, 'Servicios de envase y empaque de productos medicinales', '82922'),
(690, 'Servicio de envase y empaque ncp', '82929'),
(691, 'Actividades de apoyo empresariales ncp', '82990'),
(692, 'Actividades de la Administración Pública en general', '84110'),
(693, 'Alcaldías Municipales', '84111'),
(694, 'Regulación de las actividades de prestación de servicios sanitarios, educativos, culturales y otros servicios sociales, excepto seguridad social', '84120'),
(695, 'Regulación y facilitación de la actividad económica', '84130'),
(696, 'Actividades de administración y funcionamiento del Ministerio de Relaciones Exteriores', '84210'),
(697, 'Actividades de defensa', '84220'),
(698, 'Actividades de mantenimiento del orden público y de seguridad', '84230'),
(699, 'Actividades de planes de seguridad social de afiliación obligatoria', '84300'),
(700, 'Guardería educativa', '85101'),
(701, 'Enseñanza preescolar o parvularia', '85102'),
(702, 'Enseñanza primaria', '85103'),
(703, 'Servicio de educación preescolar y primaria integrada', '85104'),
(704, 'Enseñanza secundaria tercer ciclo (7°, 8° y 9° )', '85211'),
(705, 'Enseñanza secundaria  de formación general  bachillerato', '85212'),
(706, 'Enseñanza secundaria de formación técnica y profesional', '85221'),
(707, 'Enseñanza secundaria de formación técnica y profesional integrada con enseñanza primaria', '85222'),
(708, 'Enseñanza superior universitaria', '85301'),
(709, 'Enseñanza superior no universitaria', '85302'),
(710, 'Enseñanza superior integrada a educación secundaria y/o primaria', '85303'),
(711, 'Educación deportiva y recreativa', '85410'),
(712, 'Educación cultural', '85420'),
(713, 'Otros tipos de enseñanza n.c.p.', '85490'),
(714, 'Enseñanza formal', '85499'),
(715, 'Servicios de apoyo a la enseñanza', '85500'),
(716, 'Actividades de hospitales', '86100'),
(717, 'Clínicas médicas', '86201'),
(718, 'Servicios de Odontología', '86202'),
(719, 'Servicios médicos', '86203'),
(720, 'Servicios de análisis y estudios de diagnóstico', '86901'),
(721, 'Actividades de atención de la salud humana', '86902'),
(722, 'Otros Servicio relacionados con la salud ncp', '86909');
INSERT INTO `giro` (`id_giro`, `descripcion`, `codigo`) VALUES
(723, 'Residencias de ancianos con atención de enfermería', '87100'),
(724, 'Instituciones dedicadas al tratamiento del retraso mental, problemas de salud mental y el uso indebido de sustancias nocivas', '87200'),
(725, 'Instituciones dedicadas al cuidado de ancianos y discapacitados', '87300'),
(726, 'Actividades de asistencia a niños y jóvenes', '87900'),
(727, 'Otras actividades de atención en instituciones', '87901'),
(728, 'Actividades de asistencia sociales sin alojamiento para ancianos y discapacitados', '88100'),
(729, 'servicios sociales sin alojamiento ncp', '88900'),
(730, 'Actividades creativas artísticas y de esparcimiento', '90000'),
(731, 'Actividades de bibliotecas y archivos', '91010'),
(732, 'Actividades de museos y preservación de lugares y edificios históricos', '91020'),
(733, 'Actividades de jardínes botánicos, zoológicos y de reservas naturales', '91030'),
(734, 'Actividades de juegos y apuestas', '92000'),
(735, 'Gestión de instalaciones deportivas', '93110'),
(736, 'Actividades de clubes deportivos', '93120'),
(737, 'Otras actividades deportivas', '93190'),
(738, 'Actividades de parques de atracciones y parques temáticos', '93210'),
(739, 'Discotecas y salas de baile', '93291'),
(740, 'Centros vacacionales', '93298'),
(741, 'Actividades de esparcimiento ncp', '93299'),
(742, 'Actividades de organizaciones empresariales y de empleadores', '94110'),
(743, 'Actividades de organizaciones profesionales', '94120'),
(744, 'Actividades de sindicatos', '94200'),
(745, 'Actividades de organizaciones religiosas', '94910'),
(746, 'Actividades de organizaciones políticas', '94920'),
(747, 'Actividades de asociaciones n.c.p.', '94990'),
(748, 'Reparación de computadoras y equipo periférico', '95110'),
(749, 'Reparación de equipo de comunicación', '95120'),
(750, 'Reparación de aparatos electrónicos de consumo', '95210'),
(751, 'Reparación de aparatos doméstico y equipo de hogar y jardín', '95220'),
(752, 'Reparación de calzado y artículos de cuero', '95230'),
(753, 'Reparación de muebles y accesorios para el hogar', '95240'),
(754, 'Reparación de Instrumentos musicales', '95291'),
(755, 'Servicios de cerrajería y copiado de llaves', '95292'),
(756, 'Reparación de joyas y relojes', '95293'),
(757, 'Reparación de bicicletas, sillas de ruedas y rodados n.c.p.', '95294'),
(758, 'Reparaciones de enseres personales n.c.p.', '95299'),
(759, 'Lavado y limpieza de prendas de tela y de piel, incluso la limpieza en seco', '96010'),
(760, 'Peluquería y otros tratamientos de belleza', '96020'),
(761, 'Pompas fúnebres y actividades conexas', '96030'),
(762, 'Servicios de sauna y otros servicios para la estética corporal n.c.p.', '96091'),
(763, 'Servicios n.c.p.', '96092'),
(764, 'Actividad de los hogares en calidad de empleadores de personal doméstico', '97000'),
(765, 'Actividades indiferenciadas de producción de bienes de los hogares privados para uso propio', '98100'),
(766, 'Actividades indiferenciadas de producción de servicios de los hogares privados para uso propio', '98200'),
(767, 'Actividades de organizaciones y órganos extraterritoriales', '99000'),
(768, 'Empleados', '10001'),
(769, 'Jubilado', '10002'),
(770, 'Estudiante', '10003'),
(771, 'Desempleado', '10004'),
(772, 'Otros', '10005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `icono` varchar(250) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `nombre`, `prioridad`, `icono`, `visible`, `admin`) VALUES
(1, 'Productos', 1, 'mdi mdi-archive', 1, 0),
(3, 'Proveedores', 2, 'mdi mdi-truck-fast', 0, 0),
(5, 'Ajustes', 10, 'mdi mdi-cogs', 0, 0),
(9, 'Categorias', 3, 'mdi mdi-format-list-checks', 0, 0),
(11, 'Clientes', 6, 'mdi mdi-account-group', 0, 0),
(12, 'Sucursales', 9, 'mdi mdi-home-city-outline', 0, 0),
(13, 'Configurar Sistema', 20, 'mdi mdi-home-account', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `mostrarmenu` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_modulo`, `id_menu`, `nombre`, `descripcion`, `filename`, `mostrarmenu`, `admin`) VALUES
(1, 1, 'Gestionar', 'Gestionar Productos', 'productos', 1, 0),
(2, 1, 'Categorias', 'Gestionar Categorias', 'categorias', 1, 0),
(3, 2, 'Gestionar', 'Gestionar Usuarios', 'usuarios', 1, 0),
(6, 5, 'Usuarios', 'Gestionar Usuarios', 'usuarios', 1, 0),
(7, 3, 'Gestionar', 'Administrar proveedores', 'proveedores', 1, 0),
(10, 13, 'Roles', 'Gestionar Roles', 'roles', 1, 0),
(12, 11, 'Gestionar', 'Gestionar Clientes', 'clientes', 1, 0),
(13, 10, 'Historial', 'Historial de Mandados', 'mandados_historial', 1, 0),
(15, 5, 'Configuracion', 'Ajustes del sistema', 'configuracion', 1, 0),
(16, 3, 'Categorias', 'Gestionar Categorias de Proveedores', 'proveedores_categorias', 0, 0),
(17, 3, 'Tipos', 'Gestionar Tipos de Proveedores', 'proveedores_tipo', 0, 0),
(18, 1, 'Porcentajes', 'Porcentajes de precios', 'porcentajes_precios\r\n', 0, 0),
(20, 13, 'Sucursales', 'Administrar Sucursales', 'sucursales', 0, 0),
(21, 13, 'Modulos', 'Administrar Modulos', 'modulos', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id_moneda` int(8) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `simbolo` varchar(20) NOT NULL,
  `predeterminado` tinyint(1) NOT NULL,
  `diferencia` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'en base a dolar',
  `activo` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`id_moneda`, `nombre`, `simbolo`, `predeterminado`, `diferencia`, `activo`) VALUES
(1, 'USD', '$', 1, 1.0000, 'Active'),
(2, 'EUR', '€', 2, 0.9259, 'Inactive'),
(3, 'BRL', 'R$', 2, 5.8109, 'Inactive'),
(4, 'CAD', '$', 2, 1.4098, 'Inactive'),
(5, 'CLP', '$', 2, 824.7000, 'Inactive'),
(6, 'COP', '$', 2, 3945.7058, 'Inactive'),
(7, 'CRC', '₡', 2, 568.7842, 'Inactive'),
(8, 'DOP', 'RD$', 2, 54.9744, 'Inactive'),
(9, 'MXN', '$', 2, 23.9620, 'Inactive'),
(11, 'CNY', '¥', 2, 7.1074, 'Inactive'),
(12, 'HNL', 'L', 2, 24.8562, 'Inactive'),
(13, 'NIO', 'C$', 2, 33.7507, 'Inactive'),
(14, 'GTQ', 'Q', 2, 7.6964, 'Inactive'),
(15, 'PAB', 'B/.', 2, 1.0000, 'Inactive'),
(16, 'PEN', 'S/', 2, 3.2913, 'Inactive');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL COMMENT 'ID del municipio',
  `nombre` varchar(60) NOT NULL COMMENT 'Nombre del municipio',
  `id_departamento` int(11) NOT NULL COMMENT 'Departamento al cual pertenece el municipio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Municipios de El Salvador';

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id_municipio`, `nombre`, `id_departamento`) VALUES
(1, 'Ahuachapán', 1),
(2, 'Jujutla', 1),
(3, 'Atiquizaya', 1),
(4, 'Concepción de Ataco', 1),
(5, 'El Refugio', 1),
(6, 'Guaymango', 1),
(7, 'Apaneca', 1),
(8, 'San Francisco Menéndez', 1),
(9, 'San Lorenzo', 1),
(10, 'San Pedro Puxtla', 1),
(11, 'Tacuba', 1),
(12, 'Turín', 1),
(13, 'Candelaria de la Frontera', 2),
(14, 'Chalchuapa', 2),
(15, 'Coatepeque', 2),
(16, 'El Congo', 2),
(17, 'El Porvenir', 2),
(18, 'Masahuat', 2),
(19, 'Metapán', 2),
(20, 'San Antonio Pajonal', 2),
(21, 'San Sebastián Salitrillo', 2),
(22, 'Santa Ana', 2),
(23, 'Santa Rosa Guachipilín', 2),
(24, 'Santiago de la Frontera', 2),
(25, 'Texistepeque', 2),
(26, 'Acajutla', 3),
(27, 'Armenia', 3),
(28, 'Caluco', 3),
(29, 'Cuisnahuat', 3),
(30, 'Izalco', 3),
(31, 'Juayúa', 3),
(32, 'Nahuizalco', 3),
(33, 'Nahulingo', 3),
(34, 'Salcoatitán', 3),
(35, 'San Antonio del Monte', 3),
(36, 'San Julián', 3),
(37, 'Santa Catarina Masahuat', 3),
(38, 'Santa Isabel Ishuatán', 3),
(39, 'Santo Domingo de Guzmán', 3),
(40, 'Sonsonate', 3),
(41, 'Sonzacate', 3),
(42, 'Alegría', 4),
(43, 'Berlín', 11),
(44, 'California', 11),
(45, 'Concepción Batres', 11),
(46, 'El Triunfo', 11),
(47, 'Ereguayquín', 11),
(48, 'Estanzuelas', 11),
(49, 'Jiquilisco', 11),
(50, 'Jucuapa', 11),
(51, 'Jucuarán', 11),
(52, 'Mercedes Umaña', 11),
(53, 'Nueva Granada', 11),
(54, 'Ozatlán', 11),
(55, 'Puerto El Triunfo', 11),
(56, 'San Agustín', 11),
(57, 'San Buenaventura', 11),
(58, 'San Dionisio', 11),
(59, 'San Francisco Javier', 11),
(60, 'Santa Elena', 11),
(61, 'Santa María', 11),
(62, 'Santiago de María', 11),
(63, 'Tecapán', 11),
(64, 'Usulután', 11),
(65, 'Carolina', 13),
(66, 'Chapeltique', 13),
(67, 'Chinameca', 13),
(68, 'Chirilagua', 13),
(69, 'Ciudad Barrios', 13),
(70, 'Comacarán', 13),
(71, 'El Tránsito', 13),
(72, 'Lolotique', 13),
(73, 'Moncagua', 13),
(74, 'Nueva Guadalupe', 13),
(75, 'Nuevo Edén de San Juan', 13),
(76, 'Quelepa', 13),
(77, 'San Antonio del Mosco', 13),
(78, 'San Gerardo', 13),
(79, 'San Jorge', 13),
(80, 'San Luis de la Reina', 13),
(81, 'San Miguel', 13),
(82, 'San Rafael Oriente', 13),
(83, 'Sesori', 13),
(84, 'Uluazapa', 13),
(85, 'Arambala', 12),
(86, 'Cacaopera', 12),
(87, 'Chilanga', 12),
(88, 'Corinto', 12),
(89, 'Delicias de Concepción', 12),
(90, 'El Divisadero', 12),
(91, 'El Rosario', 12),
(92, 'Gualococti', 12),
(93, 'Guatajiagua', 12),
(94, 'Joateca', 12),
(95, 'Jocoaitique', 12),
(96, 'Jocoro', 12),
(97, 'Lolotiquillo', 12),
(98, 'Meanguera', 12),
(99, 'Osicala', 12),
(100, 'Perquín', 12),
(101, 'San Carlos', 12),
(102, 'San Fernando', 12),
(103, 'San Francisco Gotera', 12),
(104, 'San Isidro', 12),
(105, 'San Simón', 12),
(106, 'Sensembra', 12),
(107, 'Sociedad', 12),
(108, 'Torola', 12),
(109, 'Yamabal', 12),
(110, 'Yoloaiquín', 12),
(111, 'La Unión', 14),
(112, 'San Alejo', 14),
(113, 'Yucuaiquín', 14),
(114, 'Conchagua', 14),
(115, 'Intipucá', 14),
(116, 'San José', 14),
(117, 'El Carmen', 14),
(118, 'Yayantique', 14),
(119, 'Bolívar', 14),
(120, 'Meanguera del Golfo', 14),
(121, 'Santa Rosa de Lima', 14),
(122, 'Pasaquina', 14),
(123, 'ANAMOROS', 14),
(124, 'Nueva Esparta', 14),
(125, 'El Sauce', 14),
(126, 'Concepción de Oriente', 14),
(127, 'Polorós', 14),
(128, 'Lislique ', 14),
(129, 'Antiguo Cuscatlán', 4),
(130, 'Chiltiupán', 4),
(131, 'Ciudad Arce', 4),
(132, 'Colón', 4),
(133, 'Comasagua', 4),
(134, 'Huizúcar', 4),
(135, 'Jayaque', 4),
(136, 'Jicalapa', 4),
(137, 'La Libertad', 4),
(138, 'Santa Tecla', 4),
(139, 'Nuevo Cuscatlán', 4),
(140, 'San Juan Opico', 4),
(141, 'Quezaltepeque', 4),
(142, 'Sacacoyo', 4),
(143, 'San José Villanueva', 4),
(144, 'San Matías', 4),
(145, 'San Pablo Tacachico', 4),
(146, 'Talnique', 4),
(147, 'Tamanique', 4),
(148, 'Teotepeque', 4),
(149, 'Tepecoyo', 4),
(150, 'Zaragoza', 4),
(151, 'Agua Caliente', 5),
(152, 'Arcatao', 5),
(153, 'Azacualpa', 5),
(154, 'Cancasque', 5),
(155, 'Chalatenango', 5),
(156, 'Citalá', 5),
(157, 'Comapala', 5),
(158, 'Concepción Quezaltepeque', 5),
(159, 'Dulce Nombre de María', 5),
(160, 'El Carrizal', 5),
(161, 'El Paraíso', 5),
(162, 'La Laguna', 5),
(163, 'La Palma', 5),
(164, 'La Reina', 5),
(165, 'Las Vueltas', 5),
(166, 'Nueva Concepción', 5),
(167, 'Nueva Trinidad', 5),
(168, 'Nombre de Jesús', 5),
(169, 'Ojos de Agua', 5),
(170, 'Potonico', 5),
(171, 'San Antonio de la Cruz', 5),
(172, 'San Antonio Los Ranchos', 5),
(173, 'San Fernando', 5),
(174, 'San Francisco Lempa', 5),
(175, 'San Francisco Morazán', 5),
(176, 'San Ignacio', 5),
(177, 'San Isidro Labrador', 5),
(178, 'Las Flores', 5),
(179, 'San Luis del Carmen', 5),
(180, 'San Miguel de Mercedes', 5),
(181, 'San Rafael', 5),
(182, 'Santa Rita', 5),
(183, 'Tejutla', 5),
(184, 'Cojutepeque', 7),
(185, 'Candelaria', 7),
(186, 'El Carmen', 7),
(187, 'El Rosario', 7),
(188, 'Monte San Juan', 7),
(189, 'Oratorio de Concepción', 7),
(190, 'San Bartolomé Perulapía', 7),
(191, 'San Cristóbal', 7),
(192, 'San José Guayabal', 7),
(193, 'San Pedro Perulapán', 7),
(194, 'San Rafael Cedros', 7),
(195, 'San Ramón', 7),
(196, 'Santa Cruz Analquito', 7),
(197, 'Santa Cruz Michapa', 7),
(198, 'Suchitoto', 7),
(199, 'Tenancingo', 7),
(200, 'Aguilares', 6),
(201, 'Apopa', 6),
(202, 'Ayutuxtepeque', 6),
(203, 'Cuscatancingo', 6),
(204, 'Ciudad Delgado', 6),
(205, 'El Paisnal', 6),
(206, 'Guazapa', 6),
(207, 'Ilopango', 6),
(208, 'Mejicanos', 6),
(209, 'Nejapa', 6),
(210, 'Panchimalco', 6),
(211, 'Rosario de Mora', 6),
(212, 'San Marcos', 6),
(213, 'San Martín', 6),
(214, 'San Salvador', 6),
(215, 'Santiago Texacuangos', 6),
(216, 'Santo Tomás', 6),
(217, 'Soyapango', 6),
(218, 'Tonacatepeque', 6),
(219, 'Zacatecoluca', 8),
(220, 'Cuyultitán', 8),
(221, 'El Rosario', 8),
(222, 'Jerusalén', 8),
(223, 'Mercedes La Ceiba', 8),
(224, 'Olocuilta', 8),
(225, 'Paraíso de Osorio', 8),
(226, 'San Antonio Masahuat', 8),
(227, 'San Emigdio', 8),
(228, 'San Francisco Chinameca', 8),
(229, 'San Pedro Masahuat', 8),
(230, 'San Juan Nonualco', 8),
(231, 'San Juan Talpa', 8),
(232, 'San Juan Tepezontes', 8),
(233, 'San Luis La Herradura', 8),
(234, 'San Luis Talpa', 8),
(235, 'San Miguel Tepezontes', 8),
(236, 'San Pedro Nonualco', 8),
(237, 'San Rafael Obrajuelo', 8),
(238, 'Santa María Ostuma', 8),
(239, 'Santiago Nonualco', 8),
(240, 'Tapalhuaca', 8),
(241, 'Cinquera', 9),
(242, 'Dolores', 9),
(243, 'Guacotecti', 9),
(244, 'Ilobasco', 9),
(245, 'Jutiapa', 9),
(246, 'San Isidro', 9),
(247, 'Sensuntepeque', 9),
(248, 'Tejutepeque', 9),
(249, 'Victoria', 9),
(250, 'Apastepeque', 10),
(251, 'Guadalupe', 10),
(252, 'San Cayetano Istepeque', 10),
(253, 'San Esteban Catarina', 10),
(254, 'San Ildefonso', 10),
(255, 'San Lorenzo', 10),
(256, 'San Sebastián', 10),
(257, 'San Vicente', 10),
(258, 'Santa Clara', 10),
(259, 'Santo Domingo', 10),
(260, 'Tecoluca', 10),
(261, 'Tepetitán', 10),
(262, 'Verapaz', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_usuario`
--

CREATE TABLE `permisos_usuario` (
  `id_permiso_usuario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permisos_usuario`
--

INSERT INTO `permisos_usuario` (`id_permiso_usuario`, `id_usuario`, `id_modulo`) VALUES
(7, 0, 0),
(12, 2, 0),
(15, 3, 1),
(16, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porcentajes`
--

CREATE TABLE `porcentajes` (
  `id_porcentaje` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `porcentajes`
--

INSERT INTO `porcentajes` (`id_porcentaje`, `descripcion`, `porcentaje`, `activo`, `deleted`) VALUES
(1, 'Distribuidor', 5, 1, 0),
(2, 'Normal', 15, 1, 0),
(3, 'Especial', 20, 1, 0),
(4, 'Promocion', 15, 1, 0),
(5, 'Cliente Frecuente', 10, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo_generico` varchar(50) NOT NULL,
  `codigo_barra` varchar(200) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `costo_s_iva` decimal(10,4) NOT NULL,
  `costo_c_iva` decimal(10,6) NOT NULL,
  `cesc` tinyint(1) NOT NULL,
  `seguro` tinyint(1) NOT NULL,
  `dias_garantia` int(2) NOT NULL,
  `precio_sugerido` decimal(10,4) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria`, `codigo_generico`, `codigo_barra`, `nombre`, `marca`, `modelo`, `costo_s_iva`, `costo_c_iva`, `cesc`, `seguro`, `dias_garantia`, `precio_sugerido`, `activo`, `deleted`) VALUES
(13, 2, '4324', '312423423', 'SMARTPHONES', 'MARCA', 'MODELO', '0.2000', '0.250000', 0, 0, 10, '0.5000', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_imagen`
--

CREATE TABLE `producto_imagen` (
  `id_imagen` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_imagen`
--

INSERT INTO `producto_imagen` (`id_imagen`, `id_producto`, `url`) VALUES
(25, 13, 'assets/img/productos/0706202020475edd98c4863b3.png'),
(68, 13, 'assets/img/productos/0706202021135edd9ecabb499.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_precio`
--

CREATE TABLE `producto_precio` (
  `id_precio` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_precio_rank`
--

CREATE TABLE `producto_precio_rank` (
  `id_rank` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `desde` int(11) NOT NULL,
  `hasta` int(11) NOT NULL,
  `precio` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_proveedor`
--

CREATE TABLE `producto_proveedor` (
  `id_pp` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_proveedor`
--

INSERT INTO `producto_proveedor` (`id_pp`, `id_producto`, `id_proveedor`) VALUES
(6, 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` text NOT NULL,
  `municipio` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `nrc` varchar(25) NOT NULL,
  `nit` varchar(25) DEFAULT NULL,
  `dui` varchar(15) NOT NULL,
  `giro` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `tipo_proveedor` varchar(15) NOT NULL,
  `tipo` tinyint(1) NOT NULL COMMENT '1 nacional, 0 int',
  `activo` tinyint(1) NOT NULL,
  `nombre1` varchar(80) NOT NULL,
  `telefono1` varchar(25) NOT NULL,
  `correo1` varchar(40) NOT NULL,
  `comentario1` text NOT NULL,
  `nombre2` varchar(80) NOT NULL,
  `telefono2` varchar(25) NOT NULL,
  `correo2` varchar(40) NOT NULL,
  `comentario2` text NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `direccion`, `municipio`, `departamento`, `nrc`, `nit`, `dui`, `giro`, `categoria`, `tipo_proveedor`, `tipo`, `activo`, `nombre1`, `telefono1`, `correo1`, `comentario1`, `nombre2`, `telefono2`, `correo2`, `comentario2`, `deleted`) VALUES
(2, 'OSS 2', 'SM', 81, 13, '1234234', '0000-000000-000-0', '00000000-0', 589, 1, '1', 1, 1, 'NELSON', '0000000', 'nelson@oss.com', 'buen empleado', 'ALEXIS', '00000000', 'alexis@oss.com', 'buen empleado', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`, `activo`, `deleted`) VALUES
(1, 'VENDEDOR', 'CAJERO', 1, 0),
(12, 'CAJERO', '1', 1, 0),
(13, 'BARRENDERO', 'MEDIO TIEMPO', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_detalle`
--

CREATE TABLE `roles_detalle` (
  `id_rol_detalle` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles_detalle`
--

INSERT INTO `roles_detalle` (`id_rol_detalle`, `id_rol`, `id_modulo`) VALUES
(1, 3, 0),
(2, 3, 0),
(3, 3, 0),
(4, 4, 0),
(5, 4, 0),
(6, 4, 0),
(7, 5, 0),
(8, 5, 0),
(9, 5, 0),
(25, 12, 7),
(37, 1, 12),
(38, 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `telefono` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `website` varchar(150) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Pagina Web',
  `nrc` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `nit` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `logo` text COLLATE utf8_spanish_ci NOT NULL COMMENT 'URL de la imagen',
  `sms` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id_sucursal`, `nombre`, `direccion`, `id_departamento`, `id_municipio`, `telefono`, `correo`, `website`, `nrc`, `nit`, `logo`, `sms`, `activo`) VALUES
(1, 'Invertec', 'San Miguel', 0, 0, '2020-2020', 'invertec@correo.com', 'invertec.com', '', '', 'assets/img/logo.png', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodoc`
--

CREATE TABLE `tipodoc` (
  `idtipodoc` int(3) NOT NULL,
  `nombredoc` varchar(30) DEFAULT NULL,
  `cliente` int(1) DEFAULT NULL,
  `provee` int(1) DEFAULT NULL,
  `interno` int(1) DEFAULT NULL,
  `alias` char(4) DEFAULT NULL,
  `correlativo` int(1) DEFAULT NULL,
  `numerop` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipodoc`
--

INSERT INTO `tipodoc` (`idtipodoc`, `nombredoc`, `cliente`, `provee`, `interno`, `alias`, `correlativo`, `numerop`) VALUES
(1, 'TIQUETE', 0, 0, 0, 'TIK', 0, 0),
(2, 'FACTURA', 1, 1, 0, 'FAC', 0, 0),
(3, 'COMPROBANTE FISCAL', 0, 1, 0, 'CCF', 0, 0),
(4, 'DEVOLUCION', 0, 0, 0, 'DEV', 0, 0),
(5, 'IMPORTACION', 0, 1, 0, 'IMP', 0, 0),
(6, 'EXPORTACION', 0, 0, 0, 'EXP', 0, 0),
(7, 'NOTA DE REMISION', 0, 1, 0, 'REM', 0, 0),
(8, 'NOTA DE CREDITO', 0, 1, 0, 'NDC', 0, 0),
(9, 'NOTA DE DEBITO', 0, 1, 0, 'NDD', 0, 0),
(10, 'NOTA DE RETENCION', 0, 1, 0, 'NTR', 0, 0),
(11, 'ENTRADAS', 0, 0, 1, 'ENT', 0, 141),
(12, 'SALIDAS', 0, 0, 1, 'SAL', 0, 1463),
(13, 'CAPTURA FISICA', 0, 0, 1, 'FIS', 0, 0),
(14, 'CAMBIOS', 0, 0, 0, 'CM', 0, 0),
(15, 'CHEQUE', 0, 0, 0, 'CHQ', 0, 0),
(16, 'LISTA DE PEDIDO', 0, 0, 0, 'LPE', 0, 0),
(17, 'COMPRA', 0, 0, 0, 'COM', 0, 0),
(18, 'NOTA DE ABONO', 0, 0, 0, 'NDA', 0, 0),
(19, 'REPOSICION', 0, 0, 0, 'REP', 0, 0),
(20, 'SALIDA POR TRASLADO', 0, 0, 1, 'TRA', 0, 0),
(21, 'RESERVA PRODUCTO', 0, 0, 1, 'RES', 0, 0),
(22, 'ENTRADA POR TRASLADO', 0, 0, 1, 'EPT', 0, 0),
(23, 'ANULACION DE TRASLADO', 0, 0, 1, 'ADT', 0, 0),
(24, 'GARANTIA PROVEEDOR', NULL, 1, 0, 'GAP', 0, 0),
(25, 'INGRESO INVENTARIO', NULL, 1, NULL, 'INI', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `id_tipo` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`id_tipo`, `descripcion`) VALUES
(1, 'GOBIERNO'),
(2, 'EMPRESA'),
(3, 'PERSONA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_proveedor`
--

CREATE TABLE `tipo_proveedor` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_proveedor`
--

INSERT INTO `tipo_proveedor` (`id_tipo`, `nombre`, `descripcion`) VALUES
(1, 'Costo', ''),
(2, 'Gasto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `id_sucursal` int(11) NOT NULL,
  `super_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `usuario`, `password`, `id_rol`, `activo`, `admin`, `id_sucursal`, `super_admin`) VALUES
(-1, 'Super Admin', 'admin', '45bdc99004c6d4d432756f68b8e488a258dbc39b4418cb55480b486445b33e17955c0c4e6a5f97e6a24775601633121dc64586cdf286f0cd3b2c7608ca26a494VlKKor1aCKNMMZ5nAuVSzVpMNgc29BW3y0ail+WlKwo=', 0, 1, 0, 0, 1),
(2, 'Juan Perez', 'admin', '45bdc99004c6d4d432756f68b8e488a258dbc39b4418cb55480b486445b33e17955c0c4e6a5f97e6a24775601633121dc64586cdf286f0cd3b2c7608ca26a494VlKKor1aCKNMMZ5nAuVSzVpMNgc29BW3y0ail+WlKwo=', 0, 1, 1, 0, 1),
(3, 'Nelson', 'nelson', '45bdc99004c6d4d432756f68b8e488a258dbc39b4418cb55480b486445b33e17955c0c4e6a5f97e6a24775601633121dc64586cdf286f0cd3b2c7608ca26a494VlKKor1aCKNMMZ5nAuVSzVpMNgc29BW3y0ail+WlKwo=', 0, 1, 1, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categoria_cliente`
--
ALTER TABLE `categoria_cliente`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categoria_proveedor`
--
ALTER TABLE `categoria_proveedor`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `conf_compras`
--
ALTER TABLE `conf_compras`
  ADD PRIMARY KEY (`conf_compras`);

--
-- Indices de la tabla `conf_pos`
--
ALTER TABLE `conf_pos`
  ADD PRIMARY KEY (`conf_pos`);

--
-- Indices de la tabla `conf_productos`
--
ALTER TABLE `conf_productos`
  ADD PRIMARY KEY (`conf_productos`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `giro`
--
ALTER TABLE `giro`
  ADD PRIMARY KEY (`id_giro`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `permisos_usuario`
--
ALTER TABLE `permisos_usuario`
  ADD PRIMARY KEY (`id_permiso_usuario`);

--
-- Indices de la tabla `porcentajes`
--
ALTER TABLE `porcentajes`
  ADD PRIMARY KEY (`id_porcentaje`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  ADD PRIMARY KEY (`id_imagen`);

--
-- Indices de la tabla `producto_precio`
--
ALTER TABLE `producto_precio`
  ADD PRIMARY KEY (`id_precio`);

--
-- Indices de la tabla `producto_precio_rank`
--
ALTER TABLE `producto_precio_rank`
  ADD PRIMARY KEY (`id_rank`);

--
-- Indices de la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  ADD PRIMARY KEY (`id_pp`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `roles_detalle`
--
ALTER TABLE `roles_detalle`
  ADD PRIMARY KEY (`id_rol_detalle`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  ADD PRIMARY KEY (`idtipodoc`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `tipo_proveedor`
--
ALTER TABLE `tipo_proveedor`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `categoria_cliente`
--
ALTER TABLE `categoria_cliente`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `categoria_proveedor`
--
ALTER TABLE `categoria_proveedor`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `conf_compras`
--
ALTER TABLE `conf_compras`
  MODIFY `conf_compras` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `conf_pos`
--
ALTER TABLE `conf_pos`
  MODIFY `conf_pos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `conf_productos`
--
ALTER TABLE `conf_productos`
  MODIFY `conf_productos` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `giro`
--
ALTER TABLE `giro`
  MODIFY `id_giro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=773;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id_moneda` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `permisos_usuario`
--
ALTER TABLE `permisos_usuario`
  MODIFY `id_permiso_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `porcentajes`
--
ALTER TABLE `porcentajes`
  MODIFY `id_porcentaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `producto_imagen`
--
ALTER TABLE `producto_imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT de la tabla `producto_precio`
--
ALTER TABLE `producto_precio`
  MODIFY `id_precio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto_precio_rank`
--
ALTER TABLE `producto_precio_rank`
  MODIFY `id_rank` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto_proveedor`
--
ALTER TABLE `producto_proveedor`
  MODIFY `id_pp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `roles_detalle`
--
ALTER TABLE `roles_detalle`
  MODIFY `id_rol_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipodoc`
--
ALTER TABLE `tipodoc`
  MODIFY `idtipodoc` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_proveedor`
--
ALTER TABLE `tipo_proveedor`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
