-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2020 a las 09:33:30
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_archivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `extension` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_extension` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoarchivo`
--

CREATE TABLE `tipoarchivo` (
  `id_extension` bigint(20) UNSIGNED NOT NULL,
  `extension` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `tipoarchivo` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipoarchivo`
--

INSERT INTO `tipoarchivo` (`id_extension`, `extension`, `tipoarchivo`) VALUES
(1, 'pdf', 'Acrobat PDF'),
(2, 'doc', 'Microsoft Word'),
(3, 'url', 'Internet shortcut file'),
(4, 'xslt', 'Archivo de Estilos'),
(5, 'docx', 'Microsoft Word XML'),
(6, 'xxx', 'No identificado'),
(7, 'ico', 'Icono');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_extens` (`id_extension`);

--
-- Indices de la tabla `tipoarchivo`
--
ALTER TABLE `tipoarchivo`
  ADD PRIMARY KEY (`id_extension`),
  ADD UNIQUE KEY `id_extension` (`id_extension`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1258;
--
-- AUTO_INCREMENT de la tabla `tipoarchivo`
--
ALTER TABLE `tipoarchivo`
  MODIFY `id_extension` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `fk_extens` FOREIGN KEY (`id_extension`) REFERENCES `tipoarchivo` (`id_extension`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
