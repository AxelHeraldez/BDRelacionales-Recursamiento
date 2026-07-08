-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2026 a las 02:52:44
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
-- Base de datos: `restaurant`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `Nombre`, `Pais`) VALUES
(1, 'Italiana', 'Italia'),
(2, 'Americana', 'Estados Unidos'),
(3, 'Mexicana', 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `Nombre`, `Cantidad`) VALUES
(1, 'Pan', 1),
(2, 'Carne', 1),
(3, 'Lechuga', 1),
(4, 'Cebolla', 1),
(5, 'Queso', 1),
(6, 'Tocino', 1),
(7, 'Pepinillo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillo`
--

CREATE TABLE `platillo` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platillo`
--

INSERT INTO `platillo` (`id`, `Nombre`, `Especialidad_id`) VALUES
(3, 'Hamburguesa', 2),
(4, 'Ensalada Cesar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillo_ingredientes`
--

CREATE TABLE `platillo_ingredientes` (
  `platillo_id` int(11) NOT NULL,
  `ingredientes_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platillo_ingredientes`
--

INSERT INTO `platillo_ingredientes` (`platillo_id`, `ingredientes_id`) VALUES
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 3),
(4, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `platillo`
--
ALTER TABLE `platillo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Especialidad_id` (`Especialidad_id`);

--
-- Indices de la tabla `platillo_ingredientes`
--
ALTER TABLE `platillo_ingredientes`
  ADD KEY `platillo_id` (`platillo_id`),
  ADD KEY `ingredientes_id` (`ingredientes_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `platillo`
--
ALTER TABLE `platillo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `platillo`
--
ALTER TABLE `platillo`
  ADD CONSTRAINT `platillo_ibfk_1` FOREIGN KEY (`Especialidad_id`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `platillo_ingredientes`
--
ALTER TABLE `platillo_ingredientes`
  ADD CONSTRAINT `platillo_ingredientes_ibfk_1` FOREIGN KEY (`ingredientes_id`) REFERENCES `ingredientes` (`id`),
  ADD CONSTRAINT `platillo_ingredientes_ibfk_2` FOREIGN KEY (`platillo_id`) REFERENCES `platillo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
