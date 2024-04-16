-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-04-2024 a las 04:25:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `idBodega` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `registroActivo` varchar(45) DEFAULT NULL,
  `registroInactivo` varchar(45) DEFAULT NULL,
  `inventario_idinventario` int(11) NOT NULL,
  `Insumos_IDproducto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega_has_proveedor`
--

CREATE TABLE `bodega_has_proveedor` (
  `Bodega_idBodega` int(11) NOT NULL,
  `Bodega_inventario_idinventario` int(11) NOT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Cedula` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_has_ciudad`
--

CREATE TABLE `cliente_has_ciudad` (
  `Cliente_idCliente` int(11) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `numeroFactura` varchar(45) DEFAULT NULL,
  `fechaYhora` datetime DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `monitoreo_idmonitoreo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `IDproducto` int(10) UNSIGNED NOT NULL,
  `producto` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idinventario` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Bodega_idBodega` int(11) NOT NULL,
  `Bodega_inventario_idinventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `idFinca` int(11) NOT NULL,
  `Propietario` varchar(45) DEFAULT NULL,
  `Lote` varchar(45) DEFAULT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  `Bodega_idBodega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitoreo`
--

CREATE TABLE `monitoreo` (
  `idmonitoreo` int(11) NOT NULL,
  `fungisida` tinyint(4) DEFAULT NULL,
  `cantidadFungisida` varchar(45) DEFAULT NULL,
  `nombreFungisida` varchar(45) DEFAULT NULL,
  `fertilizantes` tinyint(4) DEFAULT NULL,
  `cantidadFertilizantes` varchar(45) DEFAULT NULL,
  `nombreFertilizante` varchar(45) DEFAULT NULL,
  `agua` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `numReferencia` varchar(45) DEFAULT NULL,
  `fechaDeElaboracion` datetime DEFAULT NULL,
  `fechaDeVencimiento` datetime DEFAULT NULL,
  `monitoreo_idmonitoreo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_factura`
--

CREATE TABLE `producto_has_factura` (
  `Producto_idProducto` int(11) NOT NULL,
  `Factura_idFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nit` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correoElectronico` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `factura` varchar(45) DEFAULT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contrasena`) VALUES
(1, 'carlos', '2345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`idBodega`,`inventario_idinventario`,`Insumos_IDproducto`),
  ADD KEY `fk_Bodega_Insumos1_idx` (`Insumos_IDproducto`);

--
-- Indices de la tabla `bodega_has_proveedor`
--
ALTER TABLE `bodega_has_proveedor`
  ADD PRIMARY KEY (`Bodega_idBodega`,`Bodega_inventario_idinventario`,`Proveedor_idProveedor`),
  ADD KEY `fk_Bodega_has_Proveedor_Proveedor1_idx` (`Proveedor_idProveedor`),
  ADD KEY `fk_Bodega_has_Proveedor_Bodega1_idx` (`Bodega_idBodega`,`Bodega_inventario_idinventario`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `cliente_has_ciudad`
--
ALTER TABLE `cliente_has_ciudad`
  ADD PRIMARY KEY (`Cliente_idCliente`,`Ciudad_idCiudad`),
  ADD KEY `fk_Cliente_has_Ciudad_Ciudad1_idx` (`Ciudad_idCiudad`),
  ADD KEY `fk_Cliente_has_Ciudad_Cliente1_idx` (`Cliente_idCliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`,`Cliente_idCliente`,`monitoreo_idmonitoreo`),
  ADD KEY `fk_Factura_Cliente1_idx` (`Cliente_idCliente`),
  ADD KEY `fk_Factura_monitoreo1_idx` (`monitoreo_idmonitoreo`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`IDproducto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idinventario`,`Bodega_idBodega`,`Bodega_inventario_idinventario`),
  ADD KEY `fk_inventario_Bodega1_idx` (`Bodega_idBodega`,`Bodega_inventario_idinventario`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`idFinca`,`Bodega_idBodega`),
  ADD KEY `fk_Finca_Bodega_idx` (`Bodega_idBodega`);

--
-- Indices de la tabla `monitoreo`
--
ALTER TABLE `monitoreo`
  ADD PRIMARY KEY (`idmonitoreo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`,`monitoreo_idmonitoreo`),
  ADD KEY `fk_Producto_monitoreo1_idx` (`monitoreo_idmonitoreo`);

--
-- Indices de la tabla `producto_has_factura`
--
ALTER TABLE `producto_has_factura`
  ADD PRIMARY KEY (`Producto_idProducto`,`Factura_idFactura`),
  ADD KEY `fk_Producto_has_Factura_Factura1_idx` (`Factura_idFactura`),
  ADD KEY `fk_Producto_has_Factura_Producto1_idx` (`Producto_idProducto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`,`Ciudad_idCiudad`),
  ADD KEY `fk_Proveedor_Ciudad1_idx` (`Ciudad_idCiudad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `fk_Bodega_Insumos1` FOREIGN KEY (`Insumos_IDproducto`) REFERENCES `insumos` (`IDproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bodega_has_proveedor`
--
ALTER TABLE `bodega_has_proveedor`
  ADD CONSTRAINT `fk_Bodega_has_Proveedor_Bodega1` FOREIGN KEY (`Bodega_idBodega`,`Bodega_inventario_idinventario`) REFERENCES `bodega` (`idBodega`, `inventario_idinventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Bodega_has_Proveedor_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente_has_ciudad`
--
ALTER TABLE `cliente_has_ciudad`
  ADD CONSTRAINT `fk_Cliente_has_Ciudad_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cliente_has_Ciudad_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_monitoreo1` FOREIGN KEY (`monitoreo_idmonitoreo`) REFERENCES `monitoreo` (`idmonitoreo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_inventario_Bodega1` FOREIGN KEY (`Bodega_idBodega`,`Bodega_inventario_idinventario`) REFERENCES `bodega` (`idBodega`, `inventario_idinventario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `fk_Finca_Bodega` FOREIGN KEY (`Bodega_idBodega`) REFERENCES `bodega` (`idBodega`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_monitoreo1` FOREIGN KEY (`monitoreo_idmonitoreo`) REFERENCES `monitoreo` (`idmonitoreo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_factura`
--
ALTER TABLE `producto_has_factura`
  ADD CONSTRAINT `fk_Producto_has_Factura_Factura1` FOREIGN KEY (`Factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_Factura_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_Proveedor_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
