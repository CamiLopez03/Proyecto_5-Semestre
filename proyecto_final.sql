-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2026 a las 01:13:42
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
-- Base de datos: `proyecto_final`
--
CREATE DATABASE IF NOT EXISTS `proyecto_final` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyecto_final`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_constructora`
--

DROP TABLE IF EXISTS `clientes_constructora`;
CREATE TABLE `clientes_constructora` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo` enum('Entidad pública','Empresa privada','Cliente particular') NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes_constructora`
--

INSERT INTO `clientes_constructora` (`id`, `nombre`, `tipo`, `telefono`, `correo`, `direccion`, `fecha_registro`) VALUES
(1, 'Alcaldía Municipal de San Juan', 'Entidad pública', '3001234567', 'infraestructura@sanjuan.gov', 'Centro administrativo San Juan', '2026-05-15 04:57:06'),
(2, 'Constructora Delta S.A.', 'Empresa privada', '3109876543', 'contacto@deltasa.com', 'Zona industrial Bogotá', '2026-05-15 04:57:06'),
(3, 'Inversiones Rivera', 'Cliente particular', '3204567890', 'rivera@email.com', 'Villa Campestre', '2026-05-15 04:57:06'),
(7, 'Maria', 'Cliente particular', '3345204163', 'dttj@gmail.com', NULL, '2026-05-22 13:35:46'),
(8, 'Eileen', 'Entidad pública', '3345204163', 'eileenandreap009@gmail.com', NULL, '2026-05-22 20:26:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_inmobiliaria`
--

DROP TABLE IF EXISTS `clientes_inmobiliaria`;
CREATE TABLE `clientes_inmobiliaria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `documento` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `tipo_interes` varchar(50) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes_inmobiliaria`
--

INSERT INTO `clientes_inmobiliaria` (`id`, `nombre`, `documento`, `telefono`, `email`, `direccion`, `tipo_interes`, `observacion`, `fecha_registro`) VALUES
(1, 'Lorena Calle', '1066280317', '3205178088', 'lorena2001@gmail.com', 'Monteria, cordoba', 'Arriendo', 'Interesado en arriendo urbina', '2026-05-15 03:36:42'),
(2, 'Camila', '2564416316546', '3044025028', 'dttj@gmail.com', 'ihbuaowbefo', 'Reserva', 'hbujcikolp´sxvkmlb', '2026-05-22 03:08:08'),
(3, 'Maria', '1201546461', '3345204163', 'dttj@gmail.com', 'Calle x #10-34', 'Arriendo', 'bhvduhvbeorbvogiug', '2026-05-22 13:27:14'),
(4, 'Sarith', '156546665', '3052260613', 'dttj@gmail.com', 'Dirección Sarith', 'Compra', 'idhiulvhfosgbfigebwfoeñgu', '2026-05-22 13:30:07'),
(5, 'Karolina', '122546553846', '3052260613', 'edtucvh@gmail.com', 'Dirección X', 'Reserva', 'ygficsnhjñkjiuytjrdcfhbkml', '2026-05-22 13:32:10'),
(6, 'Karolina', '122546553846', '3052260613', 'edtucvh@gmail.com', 'Dirección X', 'Reserva', 'klcnkasnbgvcuhyijkm', '2026-05-22 20:29:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_interesados`
--

DROP TABLE IF EXISTS `clientes_interesados`;
CREATE TABLE `clientes_interesados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `servicio` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Pendiente','Contactado','Prioridad Alta') DEFAULT 'Pendiente',
  `fecha_contacto` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes_interesados`
--

INSERT INTO `clientes_interesados` (`id`, `nombre`, `telefono`, `correo`, `servicio`, `mensaje`, `fecha_envio`, `estado`, `fecha_contacto`) VALUES
(1, 'Eileen', '3345204163', 'eileenandreap009@gmail.com', 'Diseño estructural', 'wgfhjoksjhgyugvbjnkm,dcygvhghf', '2026-05-19 08:51:36', 'Contactado', '2026-05-19 09:04:33'),
(2, 'Eileen', '3345204163', 'eileenandreap009@gmail.com', 'Interventoría', 'fewfuogefiogbañogbo', '2026-05-19 08:53:05', 'Contactado', '2026-05-19 09:17:19'),
(3, 'Eileen', '3345204163', 'eileenandreap009@gmail.com', 'Consultoría', 'dgiyfgiyvwefgogfwiuegfwiyefiyg', '2026-05-19 08:59:08', 'Prioridad Alta', NULL),
(4, 'Eileen', '3345204163', 'eileenandreap009@gmail.com', 'Construcción de obras', 'gdbuowagbfyie', '2026-05-19 09:04:23', 'Contactado', '2026-05-19 09:14:21'),
(5, 'Camila', '3345204163', 'eileenandreap009@gmail.com', 'Construcción de obras', 'njrfuwufwbvwulfvlewbvrjl', '2026-05-19 09:14:02', 'Prioridad Alta', NULL),
(6, 'Camila', '3345204163', 'eileenandreap009@gmail.com', 'Diseño estructural', 'aqsetiyuoggdyurddtfiyliñ', '2026-05-19 09:17:00', 'Prioridad Alta', NULL),
(7, 'Camila', '3345204163', 'eileenandreap009@gmail.com', 'Interventoría', 'eiyeevsiulboevsboesebo', '2026-05-19 09:18:56', 'Prioridad Alta', NULL),
(8, 'Sarith', '3345204163', 'eileenandreap009@gmail.com', 'Consultoría', 'wgyhuyerfiuliobfwi', '2026-05-19 09:27:11', 'Prioridad Alta', NULL),
(9, 'Sarith', '3345204163', 'eileenandreap009@gmail.com', 'Construcción de obras', 'tdiyuiyg', '2026-05-19 09:30:01', 'Prioridad Alta', NULL),
(10, 'Sarith', '3345204163', 'eileenandreap009@gmail.com', 'Interventoría', 'bireeruñoerr', '2026-05-19 09:37:13', 'Prioridad Alta', NULL),
(11, 'Camila', '3005059348', 'eileenandreap009@gmail.com', 'Construcción de obras', 'biuoaricbiewuoebwj', '2026-05-19 09:40:27', 'Prioridad Alta', NULL),
(12, 'Camila', '3005059348', 'eileenandreap009@gmail.com', 'Diseño estructural', 'vusjnoeeburbieebih', '2026-05-19 09:41:35', 'Contactado', '2026-05-22 14:07:49'),
(13, 'Camila', '3044025028', 'eileenandreap009@gmail.com', 'Diseño estructural', 'hhhyuy', '2026-05-22 13:50:41', 'Pendiente', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_proyecto`
--

DROP TABLE IF EXISTS `cliente_proyecto`;
CREATE TABLE `cliente_proyecto` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente_proyecto`
--

INSERT INTO `cliente_proyecto` (`id`, `cliente_id`, `proyecto_id`, `fecha_asignacion`) VALUES
(11, 1, 2, '2026-05-15 05:18:22'),
(13, 1, 4, '2026-05-22 20:21:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(150) NOT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `valor` decimal(15,2) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

DROP TABLE IF EXISTS `inmuebles`;
CREATE TABLE `inmuebles` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `ubicacion` varchar(150) NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'Disponible',
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `tipo_negocio` varchar(20) DEFAULT 'Venta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`id`, `titulo`, `tipo`, `ubicacion`, `precio`, `estado`, `descripcion`, `imagen`, `tipo_negocio`) VALUES
(4, 'Casa Amoblada en el recreo', 'Casa', 'Monteria', 580000000.00, 'Reservado', 'Hermosa casa ubicada en buen barrio de la ciudad de Monteria, con todas las comodidades!!!  ubicada en un prestigioso recinto residencial, diseñada para brindar comodidad, seguridad y calidad de vida. Cuenta con amplios espacios interiores, sala y comedor independientes, moderna cocina integral, cómodas habitaciones con clósets, baños con excelentes acabados y una agradable terraza ideal para compartir en familia.', 'inmueble_c026c05065b44660b960f4c698cebce4.jpg', 'Venta'),
(6, 'Apartamento Moderno Urbina', 'Apartamento', 'Sincelejo', 1800000.00, 'Disponible', 'Hermoso apartamento con excelente iluminación natural, amplios espacios y acabados modernos. Cuenta con sala-comedor de concepto abierto, cocina integral equipada, habitaciones cómodas con clósets amplios y baños elegantes. Dispone de balcón con agradable vista, zona de labores y excelente ventilación en todas sus áreas.', 'inmueble_e69de415ccdc480c82830c8dc258ed21.jpg', 'Arriendo'),
(11, 'Casa en excelente recinto', 'Casa', 'Monteria', 470000000.00, 'Reservado', 'Hermosa casa moderna ubicada en una zona residencial tranquila y segura. Cuenta con amplios espacios iluminados naturalmente, sala y comedor independientes, cocina integral equipada, habitaciones cómodas con clósets y acabados de excelente calidad. Dispone de patio, zona de lavandería, parqueadero privado y áreas verdes ideales para compartir en familia. Perfecta para quienes buscan comodidad, elegancia y una excelente ubicación cerca de supermercados, colegios y vías principales.', 'inmueble_908cc19e7dff482588db5abe61fd5206.jpg', 'Venta'),
(12, 'Apartamento en zona urbana', 'Apartamento', 'Monteria', 250000000.00, 'Disponible', 'Elegante apartamento ubicado en una zona urbana de alta valorización, diseñado para brindar confort y estilo. Cuenta con espacios modernos, cocina integral abierta, sala-comedor amplia, habitaciones con excelente iluminación y acabados contemporáneos. Incluye balcón panorámico, zona de lavandería y acceso a áreas comunes como piscina, gimnasio y vigilancia privada las 24 horas. Ideal para quienes desean vivir con comodidad, seguridad y cercanía a centros comerciales, universidades y vías principales.', 'inmueble_a6aae8a18c404827869bc737c164b662.jpg', 'Venta'),
(14, 'Casa residencial alquiler', 'Casa', 'Monteria', 1950000.00, 'Disponible', 'Hermosa casa familiar disponible para arriendo en un sector residencial tranquilo y seguro. La propiedad cuenta con amplios espacios interiores, sala y comedor independientes, cocina integral funcional, habitaciones cómodas con excelente iluminación natural y patio ideal para compartir en familia. Además, dispone de zona de lavandería, parqueadero privado y áreas verdes cercanas. Su ubicación estratégica permite fácil acceso a colegios, supermercados, parques y vías principales, brindando comodidad y bienestar para toda la familia.', 'inmueble_c0efc6a7d6f04cfca2b5a97afd5f717a.jpg', 'Arriendo'),
(19, 'ebfhfgbcv', 'Casa', 'btrshdb', 9999999999999.99, 'Disponible', 'jpiuytzxdcfvgbhnjkml,ñ.', 'inmueble_b51efb7c9c8f489697e70812217c573f.png', 'Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble_multimedia`
--

DROP TABLE IF EXISTS `inmueble_multimedia`;
CREATE TABLE `inmueble_multimedia` (
  `id` int(11) NOT NULL,
  `inmueble_id` int(11) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmueble_multimedia`
--

INSERT INTO `inmueble_multimedia` (`id`, `inmueble_id`, `archivo`, `tipo`) VALUES
(1, 4, 'inmueble_e1fe98271216475e82e7194228f4cd7c.jpg', 'imagen'),
(2, 4, 'inmueble_ab3743e02d8f49c1a97e4d2abfe651ab.jpg', 'imagen'),
(4, 4, 'inmueble_6b944988f61e4dcc8119cac07118f4b2.mp4', 'video'),
(6, 6, 'inmueble_cb0e450b8b344861a137604e5442d13d.jpg', 'imagen'),
(7, 6, 'inmueble_d25e63c794c440098f5cc109121b3b7f.jpg', 'imagen'),
(8, 6, 'inmueble_ef44668bbbe64850b2a16b20acae62e0.mp4', 'video'),
(10, 11, 'inmueble_6819513cda73483fb3cdc6cb8a14323f.jpg', 'imagen'),
(11, 11, 'inmueble_23230e477b794c46ae06f6b3c3e11f51.jpg', 'imagen'),
(12, 11, 'inmueble_8bc864d4a91347a39692ea072cc5b500.jpg', 'imagen'),
(13, 12, 'inmueble_31dd032df33e43f1b38da7e333604e10.jpg', 'imagen'),
(14, 12, 'inmueble_0c3fa66d82884e2699148996a27ad53c.jpg', 'imagen'),
(15, 12, 'inmueble_08ee6d28c0f545c985766e174b24fc6e.jpg', 'imagen'),
(19, 14, 'inmueble_29869155c42547449ccc17301430af2c.jpg', 'imagen'),
(20, 14, 'inmueble_1cfe779ca2cd452193e510ba9b762a3b.jpg', 'imagen'),
(21, 14, 'inmueble_5c71c6c581c94599ab3f21d922a6bae2.jpg', 'imagen'),
(30, 19, 'inmueble_0c8465d49d7a461eb7eec58b8b239bc9.jpeg', 'imagen'),
(31, 19, 'inmueble_36f03b5b97c34dfdba7a375f348a3962.jpeg', 'imagen'),
(32, 19, 'inmueble_3c841be547f445e6a547105ec9cf8f9c.jpeg', 'imagen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_constructora`
--

DROP TABLE IF EXISTS `proyectos_constructora`;
CREATE TABLE `proyectos_constructora` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `tipo_trabajo` varchar(150) NOT NULL,
  `ubicacion` varchar(150) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'Activo',
  `presupuesto` decimal(15,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyectos_constructora`
--

INSERT INTO `proyectos_constructora` (`id`, `nombre`, `tipo_trabajo`, `ubicacion`, `estado`, `presupuesto`, `descripcion`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Primer proyecto', 'Obras civiles', NULL, 'Activo', NULL, 'Descripcion del primer proyecto', NULL, NULL),
(2, 'Pavimentación Calle principal', 'Espacio público', NULL, 'Finalizado', NULL, 'Se pavimentó la calle principal del municipio de San Juan.', NULL, NULL),
(4, 'Proyecto 2', 'Diseño estructural', NULL, 'Activo', NULL, 'hdbnopsx{ñ., mdcjfhutie9sl,km dnbfhuwopl', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `inmueble_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_reserva` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_limite` date NOT NULL,
  `valor_reserva` decimal(15,2) NOT NULL DEFAULT 0.00,
  `estado` enum('Activa','Cancelada','Finalizada') NOT NULL DEFAULT 'Activa',
  `observacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `inmueble_id`, `cliente_id`, `fecha_reserva`, `fecha_limite`, `valor_reserva`, `estado`, `observacion`) VALUES
(1, 11, 4, '2026-05-22 13:33:10', '2026-05-30', 9999999999999.99, 'Activa', 'egfiuiufeihoj-oeihdoeoggogfovu'),
(2, 14, 5, '2026-05-22 13:33:50', '2026-05-31', 9999999999999.99, 'Cancelada', 'Observación 2'),
(3, 4, 1, '2026-05-22 13:34:59', '2026-06-10', 6000000000000.00, 'Activa', 'Observación 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rol` varchar(20) NOT NULL DEFAULT 'usuario',
  `email_confirmado` tinyint(4) DEFAULT 0,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password_hash`, `email`, `rol`, `email_confirmado`, `activo`) VALUES
(6, 'Jpipe', 'scrypt:32768:8:1$c5QdQ50ldi7lv36U$e54dbde025e054f1b5f7018c34ec922158c3961375150c6ba274c1b2946793e2e97b103dc281d5382155f0672902ac7bdb9703dcb057771d8518777984598786', 'juanfelipearbu7@gmail.com', 'usuario', 1, 1),
(19, 'sarith.10', 'scrypt:32768:8:1$RkBzBzVi5ZWExUq8$4d7314f1d09da6cb3a89be3ed3a294eff3eaed596d46bb5ea31dab1fcf639130f747d40f36fa801eb8f8ff7683fdddbf271bfe3748db272221aa53eb7e12fbf4', 'callessarith@gmail.com', 'usuario', 1, 1),
(20, 'KarolinaGarcia', 'scrypt:32768:8:1$jAZBI6bRXlgtZ8l5$25c1a719ce5b5a27c50d599ba2bd5755bf7b0c3e256a19823cfad68141e5a33d1d373b3761f542567350fc1080db66a35abcbc310c4bfd8a58c2777231437ef3', 'karolinaospina0311@gmail.com', 'usuario', 1, 1),
(28, 'FabianMuñoz', 'scrypt:32768:8:1$d7AAkUykHvQ8TClK$49fb10c48a8edb40f5dc975a7e09d6b3a3726f948b18bdd7045704d5edfedb123fefc394fe180d8891fcddb7790dfee129df2b350faba2957adc56d33028a882', 'fabianmunozpadilla2006@gmail.com', 'usuario', 1, 1),
(29, 'CamiLopez', 'scrypt:32768:8:1$c3jfznp1iUezZza9$c0ff16a7bf5daf9653c470620eab1cd8d333f53a94703ccc9d54ca160e56e96e77ba5105157961a688f2b60900f011e436adc5f3c0e6c8aa27a08fb090a23fc7', 'camila2001super@gmail.com', 'admin', 1, 1),
(31, 'EileenPeña', 'scrypt:32768:8:1$rpjYlxTb1dsHOu42$c946c47afa29414ca660923570d40805933e08b5cbff23d48d4939b3b3b3faaaf32dd88ecc78318b068a08621b05a6fbdfcf6caa95c5eaca7e26ec54390fc154', 'eileenandreap009@gmail.com', 'admin', 1, 1),
(36, 'eileen01', 'scrypt:32768:8:1$okzMF6VN7wyyebV6$2efd22fdafbe9d3db3a87daba412f831749bd1a316811ec6a5afed73a85fc82283c623e3f17f7b25c635fc3e5de08302ea2e99e49f47ffb995be22c5d2236a6d', 'lilac00917@gmail.com', 'usuario', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `inmueble_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `valor_venta` decimal(15,2) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` text DEFAULT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  `anticipo` decimal(15,2) DEFAULT NULL,
  `saldo` decimal(15,2) DEFAULT NULL,
  `estado_pago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `inmueble_id`, `cliente_id`, `valor_venta`, `fecha`, `observacion`, `metodo_pago`, `anticipo`, `saldo`, `estado_pago`) VALUES
(1, 4, 1, 580000000.00, '2026-05-02', 'Registrado con pago incial y proceso de venta ', NULL, 580000000.00, 0.00, 'Pagado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes_constructora`
--
ALTER TABLE `clientes_constructora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes_inmobiliaria`
--
ALTER TABLE `clientes_inmobiliaria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes_interesados`
--
ALTER TABLE `clientes_interesados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente_proyecto`
--
ALTER TABLE `cliente_proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `proyecto_id` (`proyecto_id`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inmueble_multimedia`
--
ALTER TABLE `inmueble_multimedia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inmueble_id` (`inmueble_id`);

--
-- Indices de la tabla `proyectos_constructora`
--
ALTER TABLE `proyectos_constructora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inmueble_id` (`inmueble_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inmueble_id` (`inmueble_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes_constructora`
--
ALTER TABLE `clientes_constructora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes_inmobiliaria`
--
ALTER TABLE `clientes_inmobiliaria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes_interesados`
--
ALTER TABLE `clientes_interesados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cliente_proyecto`
--
ALTER TABLE `cliente_proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inmueble_multimedia`
--
ALTER TABLE `inmueble_multimedia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `proyectos_constructora`
--
ALTER TABLE `proyectos_constructora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_proyecto`
--
ALTER TABLE `cliente_proyecto`
  ADD CONSTRAINT `cliente_proyecto_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_constructora` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cliente_proyecto_ibfk_2` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos_constructora` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `inmueble_multimedia`
--
ALTER TABLE `inmueble_multimedia`
  ADD CONSTRAINT `inmueble_multimedia_ibfk_1` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_inmobiliaria` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`inmueble_id`) REFERENCES `inmuebles` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_inmobiliaria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
