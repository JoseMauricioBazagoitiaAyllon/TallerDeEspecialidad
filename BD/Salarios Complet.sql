CREATE DATABASE  IF NOT EXISTS `salarios` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `salarios`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: salarios
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Cod_Dep` int NOT NULL AUTO_INCREMENT,
  `Nombre_Dep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Cod_Dep`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'financiero'),(2,'comercial'),(3,'marketing'),(4,'control de gestion'),(5,'Direccion general'),(6,'compras');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuento` (
  `Cod_Descuento` int NOT NULL AUTO_INCREMENT,
  `Nombre_Des` varchar(25) DEFAULT NULL,
  `Porcentaje_Des` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`Cod_Descuento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuento`
--

LOCK TABLES `descuento` WRITE;
/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
INSERT INTO `descuento` VALUES (1,'Pensiones',0.1271),(2,'Seguro_Salud',0.0171);
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Cod_Emp` int NOT NULL AUTO_INCREMENT,
  `Nombre_Emp` varchar(20) DEFAULT NULL,
  `Celular` int DEFAULT NULL,
  `Direccion` text,
  `Horas_Extras` int DEFAULT NULL,
  `Dias_P` int DEFAULT NULL,
  `Dias_A` int DEFAULT NULL,
  `Dias_F` int DEFAULT NULL,
  `Dias_totales` int DEFAULT NULL,
  `Anhos_Antiguedad` int DEFAULT NULL,
  `Cod_Dep` int DEFAULT NULL,
  `Cod_Rol` int DEFAULT NULL,
  `Cod_Sueldo` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Emp`),
  KEY `Cod_Dep` (`Cod_Dep`),
  KEY `Cod_Rol` (`Cod_Rol`),
  KEY `Cod_Sueldo` (`Cod_Sueldo`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`Cod_Dep`) REFERENCES `departamento` (`Cod_Dep`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`Cod_Rol`) REFERENCES `rol` (`Cod_Rol`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (2,'julian',78965421,'Loa #500',8,20,8,2,30,5,1,1,5),(3,'juan',78985421,'Loa #501',15,25,3,2,30,8,2,2,4),(4,'julia',79965421,'Loa #505',20,28,2,0,30,9,3,3,3),(5,'jose',79965721,'Loa #507',9,20,8,2,30,10,4,4,2),(6,'joel',79965721,'Loa #507',10,25,3,2,30,10,5,5,1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuesto`
--

DROP TABLE IF EXISTS `impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impuesto` (
  `Cod_Imp` int NOT NULL AUTO_INCREMENT,
  `Nombre_Imp` varchar(25) DEFAULT NULL,
  `Porcentaje_Imp` float(10,4) DEFAULT NULL,
  PRIMARY KEY (`Cod_Imp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuesto`
--

LOCK TABLES `impuesto` WRITE;
/*!40000 ALTER TABLE `impuesto` DISABLE KEYS */;
INSERT INTO `impuesto` VALUES (1,'IVA',0.1300),(2,'AFP GSP',0.0500);
/*!40000 ALTER TABLE `impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `Cod_Rol` int NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Cod_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'especialista'),(2,'El_lider'),(3,'El_coordinador'),(4,'El_investigador'),(5,'El_motivador'),(6,'Auxiliar');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo`
--

DROP TABLE IF EXISTS `sueldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldo` (
  `Cod_Sueldo` int NOT NULL AUTO_INCREMENT,
  `Cant_Sueldo_Dia` int DEFAULT NULL,
  `Cant_Sueldo_horas_extras` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Sueldo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo`
--

LOCK TABLES `sueldo` WRITE;
/*!40000 ALTER TABLE `sueldo` DISABLE KEYS */;
INSERT INTO `sueldo` VALUES (1,147,25),(2,160,25),(3,180,25),(4,185,25),(5,190,25);
/*!40000 ALTER TABLE `sueldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo_contiene_descuento`
--

DROP TABLE IF EXISTS `sueldo_contiene_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldo_contiene_descuento` (
  `Cod_SCD` int NOT NULL AUTO_INCREMENT,
  `Cod_Sueldo` int DEFAULT NULL,
  `Cod_Descuento` int DEFAULT NULL,
  PRIMARY KEY (`Cod_SCD`),
  KEY `Cod_Sueldo` (`Cod_Sueldo`),
  KEY `Cod_Descuento` (`Cod_Descuento`),
  CONSTRAINT `sueldo_contiene_descuento_ibfk_1` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`),
  CONSTRAINT `sueldo_contiene_descuento_ibfk_2` FOREIGN KEY (`Cod_Descuento`) REFERENCES `descuento` (`Cod_Descuento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo_contiene_descuento`
--

LOCK TABLES `sueldo_contiene_descuento` WRITE;
/*!40000 ALTER TABLE `sueldo_contiene_descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `sueldo_contiene_descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo_paga_impuesto`
--

DROP TABLE IF EXISTS `sueldo_paga_impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldo_paga_impuesto` (
  `Cod_SPI` int NOT NULL AUTO_INCREMENT,
  `Cod_Sueldo` int DEFAULT NULL,
  `Cod_Imp` int DEFAULT NULL,
  PRIMARY KEY (`Cod_SPI`),
  KEY `Cod_Sueldo` (`Cod_Sueldo`),
  KEY `Cod_Imp` (`Cod_Imp`),
  CONSTRAINT `sueldo_paga_impuesto_ibfk_1` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`),
  CONSTRAINT `sueldo_paga_impuesto_ibfk_2` FOREIGN KEY (`Cod_Imp`) REFERENCES `impuesto` (`Cod_Imp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo_paga_impuesto`
--

LOCK TABLES `sueldo_paga_impuesto` WRITE;
/*!40000 ALTER TABLE `sueldo_paga_impuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `sueldo_paga_impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'salarios'
--
/*!50003 DROP PROCEDURE IF EXISTS `DepartamentoAgregarOActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DepartamentoAgregarOActualizar`(
	in _Cod_Dep int,
    in _Nombre_Dep varchar(25)
)
BEGIN
IF _Cod_Dep = 0 THEN
    INSERT INTO departamento(Nombre_Dep)
    VALUES (_Nombre_Dep);
    SET _Cod_Dep = LAST_INSERT_ID();
  ELSE
    UPDATE departamento
    SET
    Nombre_Dep = _Nombre_Dep
    WHERE Cod_Dep = _Cod_Dep;
  END IF;

  SELECT _Cod_Dep AS 'Cod_Rol';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DescuentoAgregarOActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DescuentoAgregarOActualizar`(
	_Cod_Descuento int,
    _Nombre_Des varchar(25),
    _Porcentaje_Des float(10,4)
)
BEGIN

IF _Cod_Descuento = 0 THEN
    INSERT INTO descuento(Nombre_Des,Porcentaje_Des)
    VALUES (_Nombre_Des,_Porcentaje_Des);
    SET _Cod_Descuento = LAST_INSERT_ID();
  ELSE
    UPDATE descuento
    SET
    Nombre_Des = _Nombre_Des,
    Porcentaje_Des = _Porcentaje_Des
    WHERE Cod_Descuento = _Cod_Descuento;
  END IF;

  SELECT _Cod_Descuento AS 'Cod_Descuento';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EmpleadoAgregarOActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmpleadoAgregarOActualizar`(
	_Cod_Emp int ,
	_Nombre_Emp varchar(20),
	_Celular int,
	_Direccion text,
	_Horas_Extras int,
	_Dias_P int,
	_Dias_A int,
	_Dias_F int, 
	_Dias_totales int,
	_Anhos_Antiguedad int,
	_Cod_Dep int,
	_Cod_Rol int,
	_Cod_Sueldo int
)
BEGIN

IF _Cod_Emp = 0 THEN
    INSERT INTO empleados(Cod_Emp,Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Anhos_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo)
    VALUES (_Cod_Emp,_Nombre_Emp,_Celular,_Direccion,_Horas_Extras,_Dias_P,_Dias_A,_Dias_F,_Dias_totales,_Anhos_Antiguedad
    ,_Cod_Dep,_Cod_Rol,_Cod_Sueldo);
    SET _Cod_Emp = LAST_INSERT_ID();
  ELSE
    UPDATE empleados
    SET
    Cod_Emp = _Cod_Emp,
    Nombre_Emp= _Nombre_Emp,
    Celular = _Celular,
    Direccion= _Direccion,
    Horas_Extras = _Horas_Extras,
    Dias_P = _Dias_P,
    Dias_A = _Dias_A,
    Dias_F = _Dias_F,
    Dias_totales = _Dias_totales,
    Anhos_Antiguedad = _Anhos_Antiguedad ,
    Cod_Dep = _Cod_Dep,
    Cod_Rol = _Cod_Rol,
    Cod_Sueldo = _Cod_Sueldo
    WHERE Cod_Emp = _Cod_Emp;
  END IF;

  SELECT _Cod_Emp AS 'Cod_Emp';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImpuestoAgregarOActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ImpuestoAgregarOActualizar`(
	_Cod_Imp int,
    _Nombre_Imp varchar(25),
    _Porcentaje_Imp float(10,4)
)
BEGIN

IF _Cod_Imp = 0 THEN
    INSERT INTO impuesto(Nombre_Imp,Porcentaje_Imp)
    VALUES (_Nombre_Imp,_Porcentaje_Imp);
    SET _Cod_Imp = LAST_INSERT_ID();
  ELSE
    UPDATE impuesto
    SET
    Nombre_Imp = _Nombre_Imp,
    Porcentaje_Imp = _Porcentaje_Imp
    WHERE Cod_Imp = _Cod_Imp;
  END IF;

  SELECT _Cod_Imp AS 'Cod_Imp';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RolAgregarOActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RolAgregarOActualizar`(
	in _Cod_Rol int,
    in _Nombre_Rol varchar(20)
)
BEGIN
IF _Cod_Rol = 0 THEN
    INSERT INTO rol(Nombre_Rol)
    VALUES (_Nombre_Rol);
    SET _Cod_Rol = LAST_INSERT_ID();
  ELSE
    UPDATE rol
    SET
    Nombre_Rol = _Nombre_Rol
    WHERE Cod_Rol = _Cod_Rol;
  END IF;

  SELECT _Cod_Rol AS 'Cod_Rol';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SueldoAgregarOActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SueldoAgregarOActualizar`(
	_Cod_Sueldo int,
	_Cant_Sueldo_Dia int,
	_Cant_Sueldo_horas_extras int
)
BEGIN

IF _Cod_Sueldo = 0 THEN
    INSERT INTO Sueldo(Cant_Sueldo_Dia, Cant_Sueldo_horas_extras)
    VALUES (_Cant_Sueldo_Dia,_Cant_Sueldo_horas_extras);
    SET _Cod_Sueldo = LAST_INSERT_ID();
  ELSE
    UPDATE Sueldo
    SET
    Cant_Sueldo_Dia = _Cant_Sueldo_Dia,
    Cant_Sueldo_horas_extras = _Cant_Sueldo_horas_extras
    WHERE Cod_Sueldo = _Cod_Sueldo;
  END IF;

  SELECT _Cod_Sueldo AS 'Cod_Sueldo';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17  1:56:51
