-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2026 a las 03:08:36
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
-- Base de datos: `mundial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confederacion`
--

CREATE TABLE `confederacion` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Siglas` varchar(10) NOT NULL,
  `Region` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `confederacion`
--

INSERT INTO `confederacion` (`id`, `Nombre`, `Siglas`, `Region`) VALUES
(1, 'Unión de Asociaciones Europeas de Fútbol', 'UEFA', 'Europa'),
(2, 'Confederación Sudamericana de Fútbol', 'CONMEBOL', 'Sudamérica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Codigo_Fifa` char(3) NOT NULL,
  `Entrenador` varchar(100) NOT NULL,
  `Confederacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `Nombre`, `Codigo_Fifa`, `Entrenador`, `Confederacion_id`) VALUES
(1, 'Barcelona', '241', 'Hansi Flick', 1),
(2, 'Boca Juniors', '187', 'Rodolfo Arruabarrena', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadio`
--

CREATE TABLE `estadio` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Ciudad` varchar(80) NOT NULL,
  `Pais` varchar(80) NOT NULL,
  `Capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estadio`
--

INSERT INTO `estadio` (`id`, `Nombre`, `Ciudad`, `Pais`, `Capacidad`) VALUES
(1, 'Estadio Azteca', 'Ciudad de México', 'México', 87523),
(2, 'Camp Nou', 'Barcelona', 'España', 62000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Posición` varchar(30) NOT NULL,
  `Numero_Dorsal` tinyint(4) NOT NULL,
  `Fecha_Nac` date NOT NULL,
  `Equipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `Nombre`, `Posición`, `Numero_Dorsal`, `Fecha_Nac`, `Equipo_id`) VALUES
(1, 'Lionel Messi', 'Extremo Derecho', 10, '2022-12-12', 1),
(2, 'Roman Riquelme', 'Medio centro Ofensivo', 10, '2018-11-10', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `id` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Fase` varchar(30) NOT NULL,
  `Goles_local` tinyint(4) NOT NULL,
  `Goles_Visitante` tinyint(4) NOT NULL,
  `Estadio_id` int(11) NOT NULL,
  `Local_id` int(11) NOT NULL,
  `Visitante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `partido`
--

INSERT INTO `partido` (`id`, `Fecha`, `Fase`, `Goles_local`, `Goles_Visitante`, `Estadio_id`, `Local_id`, `Visitante_id`) VALUES
(1, '2026-07-10 02:55:12', 'Final', 8, 3, 2, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `confederacion`
--
ALTER TABLE `confederacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Confederacion_id` (`Confederacion_id`);

--
-- Indices de la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Equipo_id` (`Equipo_id`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Local_id` (`Local_id`),
  ADD KEY `Visitante_id` (`Visitante_id`),
  ADD KEY `Estadio_id` (`Estadio_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `confederacion`
--
ALTER TABLE `confederacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estadio`
--
ALTER TABLE `estadio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `partido`
--
ALTER TABLE `partido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`Confederacion_id`) REFERENCES `confederacion` (`id`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`Equipo_id`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`Estadio_id`) REFERENCES `estadio` (`id`),
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`Local_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `partido_ibfk_3` FOREIGN KEY (`Visitante_id`) REFERENCES `equipo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
