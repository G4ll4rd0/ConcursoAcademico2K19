--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 04/08/2020 11:45:14
-- Server version: 5.1.44-community
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP DATABASE IF EXISTS concurso;

CREATE DATABASE IF NOT EXISTS concurso
	CHARACTER SET utf8
	COLLATE utf8_general_ci;

--
-- Set default database
--
USE concurso;

--
-- Create table `usuarios`
--
CREATE TABLE IF NOT EXISTS usuarios (
  user_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  passwd VARCHAR(255) NOT NULL,
  grupo_id INT(11) UNSIGNED NOT NULL,
  tipo_id INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 29,
AVG_ROW_LENGTH = 585,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `username` on table `usuarios`
--
ALTER TABLE usuarios 
  ADD UNIQUE INDEX username(username);

--
-- Create table `user_round`
--
CREATE TABLE IF NOT EXISTS user_round (
  ronda_id INT(11) UNSIGNED NOT NULL,
  user_id INT(11) UNSIGNED NOT NULL
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `tipodeusuario`
--
CREATE TABLE IF NOT EXISTS tipodeusuario (
  tipo_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(255) NOT NULL,
  PRIMARY KEY (tipo_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `semestre`
--
CREATE TABLE IF NOT EXISTS semestre (
  semestre_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  semestre VARCHAR(255) NOT NULL,
  PRIMARY KEY (semestre_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `ronda`
--
CREATE TABLE IF NOT EXISTS ronda (
  ronda_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  round INT(10) UNSIGNED NOT NULL,
  activa TINYINT(1) NOT NULL,
  PRIMARY KEY (ronda_id),
  UNIQUE INDEX ronda_id_UNIQUE(ronda_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `preg_respon`
--
CREATE TABLE IF NOT EXISTS preg_respon (
  respuesta_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  pregunta_id INT(11) UNSIGNED NOT NULL,
  user_id INT(11) UNSIGNED NOT NULL,
  calificacion INT(11) UNSIGNED DEFAULT NULL,
  resp_al VARCHAR(255) DEFAULT NULL,
  hora_entrada TIME NOT NULL,
  hora_resp TIME DEFAULT NULL,
  PRIMARY KEY (respuesta_id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `pregunta_id` on table `preg_respon`
--
ALTER TABLE preg_respon 
  ADD UNIQUE INDEX pregunta_id(pregunta_id);

--
-- Create table `preguntas`
--
CREATE TABLE IF NOT EXISTS preguntas (
  pregunta_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  pregunta VARCHAR(10000) NOT NULL,
  respuesta VARCHAR(255) NOT NULL,
  ronda INT(11) UNSIGNED NOT NULL,
  semestre_id INT(11) UNSIGNED NOT NULL,
  uso TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (pregunta_id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `grupos`
--
CREATE TABLE IF NOT EXISTS grupos (
  grupo_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(255) NOT NULL,
  semestre_id VARCHAR(255) NOT NULL,
  PRIMARY KEY (grupo_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 17,
AVG_ROW_LENGTH = 1170,
CHARACTER SET utf8,
COLLATE utf8_general_ci;


-- 
-- Dumping data for table usuarios
--
INSERT INTO usuarios VALUES
(1, '1AEquipo', 'calorificacion', 1, 1),
(2, '1BEquipo', 'galponero', 2, 1),
(3, '1CEquipo', 'bronceado', 3, 1),
(4, '1DEquipo', 'balneario', 4, 1),
(5, '3AEquipo', 'desconcertar', 5, 1),
(6, '3BEquipo', 'incomparable', 6, 1),
(7, '3CEquipo', 'sablear', 7, 1),
(8, '3DEquipo', 'ventorrillo', 8, 1),
(9, '5AEquipo', 'mango', 9, 1),
(10, '5BEquipo', 'apacentar', 10, 1),
(11, '5CEquipo', 'termopar', 11, 1),
(12, '5DEquipo', 'excluible', 12, 1),
(13, '1AGrupo', 'cincograbado', 1, 2),
(14, '1BGrupo', 'nerviosamente', 2, 2),
(15, '1CGrupo', 'ciclistico', 3, 2),
(16, '1DGrupo', 'prestancia', 4, 2),
(17, '3AGrupo', 'biogas', 5, 2),
(18, '3BGrupo', 'quinquefolio', 6, 2),
(19, '3CGrupo', 'cincoenrrama', 7, 2),
(20, '3DGrupo', 'manzanal', 8, 2),
(21, '5AGrupo', 'rebalaje', 9, 2),
(22, '5BGrupo', 'almojarifazgo', 10, 2),
(23, '5CGrupo', 'desembargar', 11, 2),
(24, '5DGrupo', 'malbaratillo', 12, 2),
(25, 'juez1', 'eleccionario', 15, 3),
(26, 'juez2', 'cicahuite', 15, 3),
(27, 'juez3', 'supraclavicular', 15, 3),
(28, 'administrador', 'organologia', 16, 4);

-- 
-- Dumping data for table user_round
--
-- Table concurso.user_round does not contain any data (it is empty)

-- 
-- Dumping data for table tipodeusuario
--
INSERT INTO tipodeusuario VALUES
(1, 'equipo'),
(2, 'grupo'),
(3, 'jurado'),
(4, 'admin');

-- 
-- Dumping data for table semestre
--
INSERT INTO semestre VALUES
(1, 'Primer semestre'),
(2, 'Tercer semestre'),
(3, 'Quinto semestre'),
(5, 'Jueces'),
(6, 'Administrador');

-- 
-- Dumping data for table ronda
--
INSERT INTO ronda VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 1);

-- 
-- Dumping data for table preg_respon
--
-- Table concurso.preg_respon does not contain any data (it is empty)

-- 
-- Dumping data for table preguntas
--
-- Table concurso.preguntas does not contain any data (it is empty)

-- 
-- Dumping data for table grupos
--
INSERT INTO grupos VALUES
(1, '1A', '1'),
(2, '1B', '1'),
(3, '1C', '1'),
(4, '1D', '1'),
(5, '3A', '2'),
(6, '3B', '2'),
(7, '3C', '2'),
(8, '3D', '2'),
(9, '5A', '3'),
(10, '5B', '3'),
(11, '5C', '3'),
(12, '5D', '3'),
(15, 'Jueces', '5'),
(16, 'Administrador', '6');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;