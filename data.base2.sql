-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-05-2014 a las 14:40:24
-- Versión del servidor: 5.5.37-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlador`
--

CREATE TABLE IF NOT EXISTS `controlador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controlador` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `controlador`
--

INSERT INTO `controlador` (`id`, `controlador`, `created`) VALUES
(1, 'permiso/ver_permisos', '2014-05-11 11:50:09'),
(2, 'controlador/actualizar', '2014-05-11 11:50:09'),
(3, 'usuario/login', '2014-05-11 11:50:09'),
(4, 'usuario/lista', '2014-05-11 11:50:09'),
(5, 'usuario/logout', '2014-05-11 11:50:09'),
(6, 'usuario/eliminar', '2014-05-11 11:50:09'),
(7, 'usuario/nuevo', '2014-05-11 11:50:09'),
(8, 'usuario/menus', '2014-05-11 11:50:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `controlador_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id`, `titulo`, `hidden`, `usuario_id`, `activo`, `controlador_id`) VALUES
(1, 'Autenticar Usuario', NULL, 1, 1, 3),
(2, 'Salir del Sistema', NULL, 1, 1, 5),
(3, 'entrar', 0, 2, 1, 3),
(4, 'Permisos de Usuarios', 1, 1, 1, 1),
(5, 'Actualizar Lista de Controladores', NULL, 1, 1, 2),
(6, 'Lista de Usuarios', NULL, 1, 1, 4),
(7, NULL, 1, 1, 1, 6),
(8, 'Nuevo Usuario', NULL, 1, 1, 7),
(9, 'Inicio de Usuario', NULL, 1, 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_usuario`, `password`, `created`, `admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2014-05-10 23:50:27', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
