-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2021 a las 02:22:25
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webmunicipiosturisticos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `idmunicipio` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `km_distancia` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `subregion` varchar(30) NOT NULL,
  `autor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`idmunicipio`, `nombre`, `descripcion`, `km_distancia`, `telefono`, `fecha`, `subregion`, `autor`) VALUES
(1, 'Caceres', 'Cáceres es un municipio de Colombia, localizado en la subregión del Bajo Cauca del departamento de Antioquia. Limita por el norte con el departamento de Córdoba y el municipio de Caucasia, por el este con los municipios de Caucasia y Zaragoza, por el sur con los municipios de Anorí y Tarazá y por el oeste con Tarazá y el departamento de Córdoba. Su cabecera está a 230 kilómetros de Medellín.', 230, '447-84-62', '2021-06-08', 'Bajo Cauca', 'Andres0x90'),
(2, 'Caucasia', 'Caucasia es un municipio colombiano localizado en la subregión del Bajo Cauca del departamento de Antioquia. Es denominada la Capital del Bajo Cauca por ser el principal centro urbano y comercial de la subregión. Limita por el norte con el departamento de Córdoba, por el este con los municipios antioqueños de Nechí y El Bagre, por el sur con el municipio de Zaragoza, y por el oeste con el municipio de Cáceres.', 230, '497-12-11', '2021-06-08', 'Bajo Cauca', 'Andres0x90'),
(3, 'Envigado', 'Envigado es un municipio de Colombia ubicado en el sur del valle de Aburrá del departamento de Antioquia. Limita por el norte con el municipio de Medellín, por el este con los municipios de Rionegro y El Retiro, por el sur con los municipios de El Retiro y Caldas, y por el oeste con los municipios de Sabaneta e Itagüí.', 10, '597-12-36', '2021-06-08', 'Valle de Aburra', 'Andres0x90'),
(4, 'Carepa', 'Carepa es un municipio de Colombia, localizado en la subregión de Urabá en el departamento de Antioquia. Limita por el norte con el municipio de Apartadó, por el este con el departamento de Córdoba, por el sur con el municipio de Chigorodó y por el oeste con el municipio de Turbo. Su cabecera dista 317 kilómetros de la ciudad de Medellín, capital del departamento de Antioquia. Su extensión es de 380 kilómetros cuadrados.', 317, '698-74-51', '2021-06-08', 'Uraba', 'Juan07'),
(5, 'Rionegro', 'Rionegro es un municipio de Colombia, ubicado en el departamento de Antioquia. Se encuentra en el valle de San Nicolás o también llamado Altiplano del Oriente, en la subregión Oriente, siendo la ciudad con mayor población y la que concentra el movimiento económico de la subregión. Está ubicada a tan solo 15 minutos de Medellín, capital del departamento, gracias al túnel de interconexión Aburrá-Oriente. Su nombre oficial es Ciudad Santiago de Arma de Rionegro.', 6, '345-77-86', '2021-06-08', 'Oriente', 'Juan07'),
(6, 'Copacabana', 'Copacabana es un municipio de Colombia ubicado en el Valle de Aburrá del departamento de Antioquia. Limita al sur con Guarne, al oriente con Girardota, al norte con San Pedro de los Milagros y al occidente con el municipio de Bello. Su cabecera municipal está a 18 kilómetros de Medellín.', 18, '996-41-12', '2021-06-08', 'Valle de Aburra', 'Juan07'),
(7, 'Guatape', 'GuatapÃ© es un municipio de Colombia, localizado en la subregiÃ³n Oriente del departamento de Antioquia. Limita por el norte con el municipio de AlejandrÃ­a y ConcepciÃ³n, por el este con los municipios de San Rafael y San Carlos, por el sur con los municipios de Granada y El PeÃ±ol y por el Oeste con El PeÃ±ol. Su cabecera dista 79 kilÃ³metros de la ciudad de MedellÃ­n, capital del departamento de Antioquia. El municipio posee una extensiÃ³n de 76 kilÃ³metros cuadrados.', 79, '647-12-34', '2021-06-08', 'Oriente', 'Andres0x90');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cuenta` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cuenta`, `clave`, `nombre`, `apellido`) VALUES
('Andres0x90', '147123', 'Andres Mauricio', 'Cano Causil'),
('Juan07', 'contra45', 'Juan Jose', 'Perez');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idmunicipio`),
  ADD KEY `autor` (`autor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `idmunicipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `usuario` (`cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
