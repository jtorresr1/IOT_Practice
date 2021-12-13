-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 13-12-2021 a las 03:21:01
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tSeriesDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thingData`
--

CREATE TABLE `thingData` (
  `id` int NOT NULL,
  `topic` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payload` varchar(2048) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timestamp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` binary(1) NOT NULL DEFAULT '\0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `thingData`
--

INSERT INTO `thingData` (`id`, `topic`, `payload`, `timestamp`, `deleted`) VALUES
(3, 'local', 'Acceso', '1637354316.687', 0x31),
(5, 'timestamp', '1639353529785', '1639353529.788', 0x30),
(6, 'timestamp', '1639353544793', '1639353544.796', 0x30),
(7, 'timestamp', '1639353559801', '1639353559.805', 0x30),
(8, 'timestamp', '1639353574813', '1639353574.816', 0x30),
(9, 'timestamp', '1639353589821', '1639353589.824', 0x30),
(10, 'timestamp', '1639353595793', '1639353595.797', 0x30),
(11, 'timestamp', '1639353599133', '1639353599.138', 0x30),
(12, 'timestamp', '1639353599764', '1639353599.772', 0x30),
(13, 'timestamp', '1639353600297', '1639353600.301', 0x30),
(14, 'timestamp', '1639353600714', '1639353600.718', 0x30),
(15, 'timestamp', '1639353600994', '1639353600.998', 0x30),
(16, 'timestamp', '1639353601532', '1639353601.537', 0x30),
(17, 'timestamp', '1639353602153', '1639353602.157', 0x30),
(18, 'timestamp', '1639353604821', '1639353604.824', 0x30),
(19, 'timestamp', '1639353619829', '1639353619.832', 0x30),
(20, 'timestamp', '1639353634841', '1639353634.843', 0x30),
(21, 'timestamp', '1639353649841', '1639353649.843', 0x30),
(22, 'timestamp', '1639353664853', '1639353664.855', 0x30),
(23, 'local', '1639354261191', '1639354261.192', 0x31),
(24, 'local', '1639354276192', '1639354276.193', 0x31),
(25, 'local', '1639354276690', '1639354276.692', 0x31),
(26, 'local', '1639354291701', '1639354291.704', 0x31),
(27, 'local', '1639354306702', '1639354306.705', 0x31),
(28, 'local', '1639354321712', '1639354321.715', 0x31),
(29, 'local', '1639354336713', '1639354336.716', 0x31),
(30, 'local', '1639354351723', '1639354351.726', 0x31),
(31, 'local', '1639354366733', '1639354366.734', 0x31),
(32, 'local', '1639354381742', '1639354381.744', 0x31),
(33, 'local', '1639354396744', '1639354396.747', 0x31),
(34, 'local', '1639354411753', '1639354411.756', 0x31),
(35, 'local', '1639354426757', '1639354426.760', 0x31),
(36, 'local', '1639354441765', '1639354441.767', 0x31),
(37, 'local', '1639354456765', '1639354456.767', 0x31),
(38, 'local', '1639354471774', '1639354471.775', 0x31),
(39, 'local', '1639354486781', '1639354486.783', 0x31),
(40, 'local', '1639354501782', '1639354501.784', 0x31),
(41, 'local', '1639354503998', '1639354504.001', 0x31),
(42, 'local', '1639354519000', '1639354519.003', 0x31),
(43, 'local', '1639354534009', '1639354534.012', 0x31),
(44, 'local', '1639354549010', '1639354549.013', 0x31),
(45, 'local', '1639354564021', '1639354564.024', 0x31),
(46, 'local', '1639354579021', '1639354579.025', 0x31),
(47, 'local', '1639354594024', '1639354594.027', 0x31),
(48, 'local', '1639354609024', '1639354609.026', 0x31);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `thingData`
--
ALTER TABLE `thingData`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `thingData`
--
ALTER TABLE `thingData`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
