-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2026 a las 03:04:29
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
-- Base de datos: `jueguito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `Nombre`, `Descripcion`) VALUES
(1, 'Aventura', 'Es un juego de explorar.'),
(2, 'Shooters', 'Es un juego de disparos'),
(3, 'RPG', 'Es un juego de subir de nivel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE `plataforma` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Fabricante` varchar(80) NOT NULL,
  `Anio_lanzamiento` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `plataforma`
--

INSERT INTO `plataforma` (`id`, `Nombre`, `Fabricante`, `Anio_lanzamiento`) VALUES
(1, 'PlayStation ', 'Sony', '1994'),
(2, 'Xbox', 'Microsoft', '2001'),
(3, 'NintendoSwitch', 'Nintendo', '2017'),
(4, 'Computadora', 'Charles Babbage', '1981');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego`
--

CREATE TABLE `videojuego` (
  `id` int(11) NOT NULL,
  `Titulo` varchar(120) NOT NULL,
  `Desarrolladora` varchar(100) NOT NULL,
  `Anio_lanzamiento` year(4) NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `Genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `videojuego`
--

INSERT INTO `videojuego` (`id`, `Titulo`, `Desarrolladora`, `Anio_lanzamiento`, `Precio`, `Genero_id`) VALUES
(1, 'Fortnite', 'Epic Games', '2017', 0.00, 2),
(2, 'Minecraft', 'Markus Persson', '2009', 530.00, 1),
(3, 'Elden Ring', 'Hidetaka Miyazaki', '2022', 1194.00, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuego_plataforma`
--

CREATE TABLE `videojuego_plataforma` (
  `Videojuego_id` int(11) NOT NULL,
  `Plataforma_id` int(11) NOT NULL,
  `Fecha_Disponible` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `videojuego_plataforma`
--

INSERT INTO `videojuego_plataforma` (`Videojuego_id`, `Plataforma_id`, `Fecha_Disponible`) VALUES
(1, 1, '2017-07-25'),
(2, 2, '2024-12-11'),
(3, 4, '2022-02-25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Genero_id` (`Genero_id`);

--
-- Indices de la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD KEY `Videojuego_id` (`Videojuego_id`),
  ADD KEY `Plataforma_id` (`Plataforma_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `plataforma`
--
ALTER TABLE `plataforma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `videojuego`
--
ALTER TABLE `videojuego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videojuego`
--
ALTER TABLE `videojuego`
  ADD CONSTRAINT `videojuego_ibfk_1` FOREIGN KEY (`Genero_id`) REFERENCES `genero` (`id`);

--
-- Filtros para la tabla `videojuego_plataforma`
--
ALTER TABLE `videojuego_plataforma`
  ADD CONSTRAINT `videojuego_plataforma_ibfk_1` FOREIGN KEY (`Videojuego_id`) REFERENCES `videojuego` (`id`),
  ADD CONSTRAINT `videojuego_plataforma_ibfk_2` FOREIGN KEY (`Plataforma_id`) REFERENCES `plataforma` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
