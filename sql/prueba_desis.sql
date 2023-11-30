-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2023 a las 23:43:46
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_desis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `id` int(11) NOT NULL,
  `msg` varchar(80) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidato`
--

INSERT INTO `candidato` (`id`, `msg`, `status`) VALUES
(1, 'Pia Aravena', 0),
(2, 'Manuel Aguilar', 0),
(3, 'Claudia Henriquez', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id` int(11) NOT NULL,
  `region` int(11) NOT NULL,
  `msg` varchar(80) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `region`, `msg`, `status`) VALUES
(1, 1, 'Arica', 0),
(2, 1, 'Camarones', 0),
(3, 1, 'General Lagos', 0),
(4, 1, 'Putre', 0),
(5, 2, 'Alto Hospicio', 0),
(6, 2, 'Iquique', 0),
(7, 2, 'Camiña', 0),
(8, 2, 'Colchane', 0),
(9, 2, 'Huara', 0),
(10, 2, 'Pica', 0),
(11, 2, 'Pozo Almonte', 0),
(12, 3, 'Antofagasta', 0),
(13, 3, 'Mejillones', 0),
(14, 3, 'Sierra Gorda', 0),
(15, 3, 'Taltal', 0),
(16, 3, 'Calama', 0),
(17, 3, 'Ollague', 0),
(18, 3, 'San Pedro de Atacama', 0),
(19, 3, 'Maria Elena', 0),
(20, 3, 'Tocopilla', 0),
(21, 4, 'Chanaral', 0),
(22, 4, 'Diego de Almagro', 0),
(23, 4, 'Caldera', 0),
(24, 4, 'Copiapo', 0),
(25, 4, 'Tierra Amarilla', 0),
(26, 4, 'Alto del Carmen', 0),
(27, 4, 'Freirina', 0),
(28, 4, 'Huasco', 0),
(29, 4, 'Vallenar', 0),
(30, 5, 'Canela', 0),
(31, 5, 'Illapel', 0),
(32, 5, 'Los Vilos', 0),
(33, 5, 'Salamanca', 0),
(34, 5, 'Andacollo', 0),
(35, 5, 'Coquimbo', 0),
(36, 5, 'La Higuera', 0),
(37, 5, 'La Serena', 0),
(38, 5, 'Paihuano', 0),
(39, 5, 'Vicuna', 0),
(40, 5, 'Combarbala', 0),
(41, 5, 'Monte Patria', 0),
(42, 5, 'Ovalle', 0),
(43, 5, 'Punitaqui', 0),
(44, 5, 'Rio Hurtado', 0),
(45, 6, 'Isla de Pascua', 0),
(46, 6, 'Calle Larga', 0),
(47, 6, 'Los Andes', 0),
(48, 6, 'Rinconada', 0),
(49, 6, 'San Esteban', 0),
(50, 6, 'Cabildo', 0),
(51, 6, 'La Ligua', 0),
(52, 6, 'Papudo', 0),
(53, 6, 'Petorca', 0),
(54, 6, 'Zapallar', 0),
(55, 6, 'Hijuelas', 0),
(56, 6, 'La Calera', 0),
(57, 6, 'La Cruz', 0),
(58, 6, 'Nogales', 0),
(59, 6, 'Quillota', 0),
(60, 6, 'Algarrobo', 0),
(61, 6, 'Cartagena', 0),
(62, 6, 'El Quisco', 0),
(63, 6, 'El Tabo', 0),
(64, 6, 'San Antonio', 0),
(65, 6, 'Santo Domingo', 0),
(66, 6, 'Catemu', 0),
(67, 6, 'Llay-Llay', 0),
(68, 6, 'Panquehue', 0),
(69, 6, 'Putaendo', 0),
(70, 6, 'San Felipe', 0),
(71, 6, 'Santa María', 0),
(72, 6, 'Casablanca', 0),
(73, 6, 'Concon', 0),
(74, 6, 'Juan Fernandez', 0),
(75, 6, 'Puchuncavi', 0),
(76, 6, 'Quintero', 0),
(77, 6, 'Valparaiso', 0),
(78, 6, 'Vina del Mar', 0),
(79, 6, 'Limache', 0),
(80, 6, 'Olmue', 0),
(81, 6, 'Quilpue', 0),
(82, 6, 'Villa Alemana', 0),
(83, 7, 'Colina', 0),
(84, 7, 'Lampa', 0),
(85, 7, 'Til Til', 0),
(86, 7, 'Pirque', 0),
(87, 7, 'Puente Alto', 0),
(88, 7, 'San José de Maipo', 0),
(89, 7, 'Buin', 0),
(90, 7, 'Calera de Tango', 0),
(91, 7, 'Paine', 0),
(92, 7, 'San Bernardo', 0),
(93, 7, 'Alhue', 0),
(94, 7, 'Curacavi', 0),
(95, 7, 'Maria Pinto', 0),
(96, 7, 'Melipilla', 0),
(97, 7, 'San Pedro', 0),
(98, 7, 'Cerrillos', 0),
(99, 7, 'Cerro Navia', 0),
(100, 7, 'Conchali', 0),
(101, 7, 'El Bosque', 0),
(102, 7, 'Estacion Central', 0),
(103, 7, 'Huechuraba', 0),
(104, 7, 'Independencia', 0),
(105, 7, 'La Cisterna', 0),
(106, 7, 'La Granja', 0),
(107, 7, 'La Florida', 0),
(108, 7, 'La Pintana', 0),
(109, 7, 'La Reina', 0),
(110, 7, 'Las Condes', 0),
(111, 7, 'Lo Barnechea', 0),
(112, 7, 'Lo Espejo', 0),
(113, 7, 'Lo Prado', 0),
(114, 7, 'Macul', 0),
(115, 7, 'Maipu', 0),
(116, 7, 'Nunoa', 0),
(117, 7, 'Pedro Aguirre Cerda', 0),
(118, 7, 'Penalolen', 0),
(119, 7, 'Providencia', 0),
(120, 7, 'Pudahuel', 0),
(121, 7, 'Quilicura', 0),
(122, 7, 'Quinta Normal', 0),
(123, 7, 'Recoleta', 0),
(124, 7, 'Renca', 0),
(125, 7, 'San Miguel', 0),
(126, 7, 'San Joaquin', 0),
(127, 7, 'San Ramon', 0),
(128, 7, 'Santiago', 0),
(129, 7, 'Vitacura', 0),
(130, 7, 'El Monte', 0),
(131, 7, 'Isla de Maipo', 0),
(132, 7, 'Padre Hurtado', 0),
(133, 7, 'Penaflor', 0),
(134, 7, 'Talagante', 0),
(135, 8, 'Codegua', 0),
(136, 8, 'Coinco', 0),
(137, 8, 'Coltauco', 0),
(138, 8, 'Doñihue', 0),
(139, 8, 'Graneros', 0),
(140, 8, 'Las Cabras', 0),
(141, 8, 'Machali', 0),
(142, 8, 'Malloa', 0),
(143, 8, 'Mostazal', 0),
(144, 8, 'Olivar', 0),
(145, 8, 'Peumo', 0),
(146, 8, 'Pichidegua', 0),
(147, 8, 'Quinta de Tilcoco', 0),
(148, 8, 'Rancagua', 0),
(149, 8, 'Rengo', 0),
(150, 8, 'Requinoa', 0),
(151, 8, 'San Vicente de Tagua Tagua', 0),
(152, 8, 'La Estrella', 0),
(153, 8, 'Litueche', 0),
(154, 8, 'Marchihue', 0),
(155, 8, 'Navidad', 0),
(156, 8, 'Paredones', 0),
(157, 8, 'Pichilemu', 0),
(158, 8, 'Chepica', 0),
(159, 8, 'Chimbarongo', 0),
(160, 8, 'Lolol', 0),
(161, 8, 'Nancagua', 0),
(162, 8, 'Palmilla', 0),
(163, 8, 'Peralillo', 0),
(164, 8, 'Placilla', 0),
(165, 8, 'Pumanque', 0),
(166, 8, 'San Fernando', 0),
(167, 8, 'Santa Cruz', 0),
(168, 9, 'Cauquenes', 0),
(169, 9, 'Chanco', 0),
(170, 9, 'Pelluhue', 0),
(171, 9, 'Curico', 0),
(172, 9, 'Hualane', 0),
(173, 9, 'Licanten', 0),
(174, 9, 'Molina', 0),
(175, 9, 'Rauco', 0),
(176, 9, 'Romeral', 0),
(177, 9, 'Sagrada Familia', 0),
(178, 9, 'Teno', 0),
(179, 9, 'Vichuquen', 0),
(180, 9, 'Colbun', 0),
(181, 9, 'Linares', 0),
(182, 9, 'Longavi', 0),
(183, 9, 'Parral', 0),
(184, 9, 'Retiro', 0),
(185, 9, 'San Javier', 0),
(186, 9, 'Villa Alegre', 0),
(187, 9, 'Yerbas Buenas', 0),
(188, 9, 'Constitucion', 0),
(189, 9, 'Curepto', 0),
(190, 9, 'Empedrado', 0),
(191, 9, 'Maule', 0),
(192, 9, 'Pelarco', 0),
(193, 9, 'Pencahue', 0),
(194, 9, 'Rio Claro', 0),
(195, 9, 'San Clemente', 0),
(196, 9, 'San Rafael', 0),
(197, 9, 'Talca', 0),
(198, 10, 'Cobquecura', 0),
(199, 10, 'Coelemu', 0),
(200, 10, 'Ninhue', 0),
(201, 10, 'Portezuelo', 0),
(202, 10, 'Quirihue', 0),
(203, 10, 'Ranquil', 0),
(204, 10, 'Treguaco', 0),
(205, 10, 'Coihueco', 0),
(206, 10, 'Niquen', 0),
(207, 10, 'San Carlos', 0),
(208, 10, 'San Fabian', 0),
(209, 10, 'San Nicolas', 0),
(210, 10, 'Bulnes', 0),
(211, 10, 'Chillan', 0),
(212, 10, 'Chillan Viejo', 0),
(213, 10, 'El Carmen', 0),
(214, 10, 'Pemuco', 0),
(215, 10, 'Pinto', 0),
(216, 10, 'Quillon', 0),
(217, 10, 'San Ignacio', 0),
(218, 10, 'Yungay', 0),
(219, 11, 'Arauco', 0),
(220, 11, 'Canete', 0),
(221, 11, 'Contulmo', 0),
(222, 11, 'Curanilahue', 0),
(223, 11, 'Lebu', 0),
(224, 11, 'Los Alamos', 0),
(225, 11, 'Tirua', 0),
(226, 11, 'Alto Biobio', 0),
(227, 11, 'Antuco', 0),
(228, 11, 'Cabrero', 0),
(229, 11, 'Laja', 0),
(230, 11, 'Los Angeles', 0),
(231, 11, 'Mulchen', 0),
(232, 11, 'Nacimiento', 0),
(233, 11, 'Negrete', 0),
(234, 11, 'Quilaco', 0),
(235, 11, 'Quilleco', 0),
(236, 11, 'San Rosendo', 0),
(237, 11, 'Santa Barbara', 0),
(238, 11, 'Tucapel', 0),
(239, 11, 'Yumbel', 0),
(240, 11, 'Chiguayante', 0),
(241, 11, 'Concepcion', 0),
(242, 11, 'Coronel', 0),
(243, 11, 'Florida', 0),
(244, 11, 'Hualpen', 0),
(245, 11, 'Hualqui', 0),
(246, 11, 'Lota', 0),
(247, 11, 'Penco', 0),
(248, 11, 'San Pedro de la Paz', 0),
(249, 11, 'Santa Juana', 0),
(250, 11, 'Talcahuano', 0),
(251, 11, 'Tome', 0),
(252, 12, 'Carahue', 0),
(253, 12, 'Cholchol', 0),
(254, 12, 'Cunco', 0),
(255, 12, 'Curarrehue', 0),
(256, 12, 'Freire', 0),
(257, 12, 'Galvarino', 0),
(258, 12, 'Gorbea', 0),
(259, 12, 'Lautaro', 0),
(260, 12, 'Loncoche', 0),
(261, 12, 'Melipeuco', 0),
(262, 12, 'Nueva Imperial', 0),
(263, 12, 'Padre Las Casas', 0),
(264, 12, 'Perquenco', 0),
(265, 12, 'Pitrufquen', 0),
(266, 12, 'Pucon', 0),
(267, 12, 'Puerto Saavedra', 0),
(268, 12, 'Temuco', 0),
(269, 12, 'Teodoro Schmidt', 0),
(270, 12, 'Tolten', 0),
(271, 12, 'Vilcun', 0),
(272, 12, 'Villarrica', 0),
(273, 12, 'Angol', 0),
(274, 12, 'Collipulli', 0),
(275, 12, 'Curacautin', 0),
(276, 12, 'Ercilla', 0),
(277, 12, 'Lonquimay', 0),
(278, 12, 'Los Sauces', 0),
(279, 12, 'Lumaco', 0),
(280, 12, 'Puren', 0),
(281, 12, 'Renaico', 0),
(282, 12, 'Traiguen', 0),
(283, 12, 'Victoria', 0),
(284, 13, 'Corral', 0),
(285, 13, 'Lanco', 0),
(286, 13, 'Los Lagos', 0),
(287, 13, 'Mafil', 0),
(288, 13, 'Mariquina', 0),
(289, 13, 'Paillaco', 0),
(290, 13, 'Panguipulli', 0),
(291, 13, 'Valdivia', 0),
(292, 13, 'Futrono', 0),
(293, 13, 'La Union', 0),
(294, 13, 'Lago Ranco', 0),
(295, 13, 'Rio Bueno', 0),
(296, 14, 'Ancud', 0),
(297, 14, 'Castro', 0),
(298, 14, 'Chonchi', 0),
(299, 14, 'Curaco de Velez', 0),
(300, 14, 'Dalcahue', 0),
(301, 14, 'Puqueldon', 0),
(302, 14, 'Queilen', 0),
(303, 14, 'Quemchi', 0),
(304, 14, 'Quellon', 0),
(305, 14, 'Quinchao', 0),
(306, 14, 'Calbuco', 0),
(307, 14, 'Cochamo', 0),
(308, 14, 'Fresia', 0),
(309, 14, 'Frutillar', 0),
(310, 14, 'Llanquihue', 0),
(311, 14, 'Los Muermos', 0),
(312, 14, 'Maullin', 0),
(313, 14, 'Puerto Montt', 0),
(314, 14, 'Puerto Varas', 0),
(315, 14, 'Osorno', 0),
(316, 14, 'Puerto Octay', 0),
(317, 14, 'Purranque', 0),
(318, 14, 'Puyehue', 0),
(319, 14, 'Rio Negro', 0),
(320, 14, 'San Juan de la Costa', 0),
(321, 14, 'San Pablo', 0),
(322, 14, 'Chaiten', 0),
(323, 14, 'Futaleufu', 0),
(324, 14, 'Hualaihue', 0),
(325, 14, 'Palena', 0),
(326, 15, 'Aysen', 0),
(327, 15, 'Cisnes', 0),
(328, 15, 'Guaitecas', 0),
(329, 15, 'Cochrane', 0),
(330, 15, 'O\'Higgins', 0),
(331, 15, 'Tortel', 0),
(332, 15, 'Coyhaique', 0),
(333, 15, 'Lago Verde', 0),
(334, 15, 'Chile Chico', 0),
(335, 15, 'Rio Ibanez', 0),
(336, 16, 'Antartica', 0),
(337, 16, 'Cabo de Hornos', 0),
(338, 16, 'Laguna Blanca', 0),
(339, 16, 'Punta Arenas', 0),
(340, 16, 'Rio Verde', 0),
(341, 16, 'San Gregorio', 0),
(342, 16, 'Porvenir', 0),
(343, 16, 'Primavera', 0),
(344, 16, 'Timaukel', 0),
(345, 16, 'Natales', 0),
(346, 16, 'Torres del Paine', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `msg` varchar(60) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `msg`, `status`) VALUES
(1, 'Region de Arica y Parinacota', 0),
(2, 'Region de Tarapaca', 0),
(3, 'Region de Antofagasta', 0),
(4, 'Region de Atacama', 0),
(5, 'Region de Coquimbo', 0),
(6, 'Region de Valparaiso', 0),
(7, 'Region Metropolitana de Santiago', 0),
(8, 'Region del Libertador General Bernardo O\'Higgins', 0),
(9, 'Region del Maule', 0),
(10, 'Region de Nuble', 0),
(11, 'Region del Biobio', 0),
(12, 'Region de La Araucania', 0),
(13, 'Region de Los Rios', 0),
(14, 'Region de Los Lagos', 0),
(15, 'Region de Aysen del General Carlos Ibanez del Campo', 0),
(16, 'Region de Magallanes y de la Antartica Chilena', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votacion`
--

CREATE TABLE `votacion` (
  `id` int(11) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `alias` varchar(80) NOT NULL,
  `rut` varchar(10) NOT NULL,
  `email` varchar(80) NOT NULL,
  `comuna` int(11) NOT NULL,
  `candidato` int(11) NOT NULL,
  `howto` varchar(80) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reg` (`region`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votacion_comuna` (`comuna`),
  ADD KEY `votacion_candidato` (`candidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidato`
--
ALTER TABLE `candidato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `votacion`
--
ALTER TABLE `votacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `Comuna_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`id`);

--
-- Filtros para la tabla `votacion`
--
ALTER TABLE `votacion`
  ADD CONSTRAINT `votacion_candidato` FOREIGN KEY (`candidato`) REFERENCES `candidato` (`id`),
  ADD CONSTRAINT `votacion_comuna` FOREIGN KEY (`comuna`) REFERENCES `comuna` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
