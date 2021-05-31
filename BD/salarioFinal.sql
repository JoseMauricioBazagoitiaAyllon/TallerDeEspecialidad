CREATE DATABASE  IF NOT EXISTS `salarios` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
-- Temporary view structure for view `actividad_de_empleado`
--

DROP TABLE IF EXISTS `actividad_de_empleado`;
/*!50001 DROP VIEW IF EXISTS `actividad_de_empleado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `actividad_de_empleado` AS SELECT 
 1 AS `Nombre`,
 1 AS `Celular`,
 1 AS `Direccion`,
 1 AS `Horas_Extras`,
 1 AS `Dias_Puntual`,
 1 AS `Dias_Atrasado`,
 1 AS `Dias_que_Falto`,
 1 AS `Dias_Totales`,
 1 AS `Años_De_Antiguedad`,
 1 AS `Rol`,
 1 AS `Departamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `beneficios_informe`
--

DROP TABLE IF EXISTS `beneficios_informe`;
/*!50001 DROP VIEW IF EXISTS `beneficios_informe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `beneficios_informe` AS SELECT 
 1 AS `nombre`,
 1 AS `Años_Antiguedad`,
 1 AS `porcentaje_Antiguedad`,
 1 AS `Beneficio_Antiguedad`,
 1 AS `Horas_Extras`,
 1 AS `Pago_Horas_Extras`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Cod_Dep` int NOT NULL AUTO_INCREMENT,
  `Nombre_Dep` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Cod_Dep`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'financiero'),(2,'marketing'),(3,'comercial'),(4,'control de gestion'),(5,'Direccion general'),(6,'compras'),(7,'financiero11');
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
  `Nombre_Des` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Porcentaje_Des` float DEFAULT NULL,
  PRIMARY KEY (`Cod_Descuento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
-- Temporary view structure for view `descuentos_que_pagan`
--

DROP TABLE IF EXISTS `descuentos_que_pagan`;
/*!50001 DROP VIEW IF EXISTS `descuentos_que_pagan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `descuentos_que_pagan` AS SELECT 
 1 AS `Nro_Empleado`,
 1 AS `Empleado`,
 1 AS `Descuento`,
 1 AS `Porcentaje`,
 1 AS `Descuentos_a_Pagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Cod_Emp` int NOT NULL AUTO_INCREMENT,
  `Nombre_Emp` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Celular` int DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Horas_Extras` int DEFAULT NULL,
  `Dias_P` int DEFAULT NULL,
  `Dias_A` int DEFAULT NULL,
  `Dias_F` int DEFAULT NULL,
  `Dias_Totales` int DEFAULT NULL,
  `Años_Antiguedad` int DEFAULT NULL,
  `Cod_Dep` int DEFAULT NULL,
  `Cod_Rol` int DEFAULT NULL,
  `Cod_Sueldo` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Emp`),
  KEY `fk_IdRol_idx` (`Cod_Rol`),
  KEY `fk_IdDep_idx` (`Cod_Dep`),
  KEY `fk_IdSueldo_idx` (`Cod_Sueldo`),
  CONSTRAINT `fk_IdDep` FOREIGN KEY (`Cod_Dep`) REFERENCES `departamento` (`Cod_Dep`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_IdRol` FOREIGN KEY (`Cod_Rol`) REFERENCES `rol` (`Cod_Rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_IdSueldo_IdEmp` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'julian',78965421,'Loa #500',8,20,8,2,30,5,1,1,5),(2,'juan',78985421,'Loa #501',15,25,3,2,30,8,2,2,4),(3,'julia',79965421,'Loa #505',20,28,2,0,30,9,3,3,3),(4,'jose',79965721,'Loa #507',9,20,8,2,30,10,4,4,2),(5,'joel',79965721,'Loa #507',10,25,3,2,30,10,5,5,1),(6,'juanPablo3',78965432,'Loa #515',12,21,5,4,30,NULL,1,1,5);
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
  `Nombre_Imp` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Porcentaje_Imp` float DEFAULT NULL,
  PRIMARY KEY (`Cod_Imp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuesto`
--

LOCK TABLES `impuesto` WRITE;
/*!40000 ALTER TABLE `impuesto` DISABLE KEYS */;
INSERT INTO `impuesto` VALUES (1,'IVA',0.13),(2,'AFP GSP',0.05);
/*!40000 ALTER TABLE `impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `impuestos_que_pagan`
--

DROP TABLE IF EXISTS `impuestos_que_pagan`;
/*!50001 DROP VIEW IF EXISTS `impuestos_que_pagan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `impuestos_que_pagan` AS SELECT 
 1 AS `nro_Empleado`,
 1 AS `Empleado`,
 1 AS `Nombre_impuesto`,
 1 AS `Porcentaje_Impuesto`,
 1 AS `Impuestos_a_Pagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `Cod_Rol` int NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Cod_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'especialista'),(2,'El_lider'),(3,'El_coordinador'),(4,'El_investigador'),(5,'El_motivador'),(12,'financiero2'),(13,'financiero2'),(14,'financiero5'),(15,'limpieza6');
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
  `Cant_Sueldo_Horas_Extras` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Sueldo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo`
--

LOCK TABLES `sueldo` WRITE;
/*!40000 ALTER TABLE `sueldo` DISABLE KEYS */;
INSERT INTO `sueldo` VALUES (1,147,25),(2,160,25),(3,180,25),(4,185,25),(5,190,25);
/*!40000 ALTER TABLE `sueldo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_Enlaces_Sueldo` AFTER INSERT ON `sueldo` FOR EACH ROW BEGIN
	insert	into sueldo_paga_descuento (Cod_Sueldo,Cod_Descuentos) value (new.Cod_Sueldo, 1),(new.Cod_Sueldo, 2);
    insert	into sueldo_paga_impuesto (Cod_Sueldo,Cod_Imp) value (new.Cod_Sueldo, 1),(new.Cod_Sueldo, 2);
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `eliminar_Enlaces_Sueldo` AFTER DELETE ON `sueldo` FOR EACH ROW BEGIN
	DELETE FROM sueldo_paga_descuento WHERE Cod_Sueldo = old.Cod_Sueldo;
    DELETE FROM sueldo_paga_impuesto WHERE Cod_Sueldo = old.Cod_Sueldo;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sueldo_paga_descuento`
--

DROP TABLE IF EXISTS `sueldo_paga_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldo_paga_descuento` (
  `Cod_Sueldo` int NOT NULL,
  `Cod_Descuentos` int NOT NULL,
  PRIMARY KEY (`Cod_Sueldo`,`Cod_Descuentos`),
  KEY `fk_CodDescuentos_idx` (`Cod_Descuentos`),
  CONSTRAINT `fk_CodDescuentos` FOREIGN KEY (`Cod_Descuentos`) REFERENCES `descuento` (`Cod_Descuento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CodSueldo_SPD` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo_paga_descuento`
--

LOCK TABLES `sueldo_paga_descuento` WRITE;
/*!40000 ALTER TABLE `sueldo_paga_descuento` DISABLE KEYS */;
INSERT INTO `sueldo_paga_descuento` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2);
/*!40000 ALTER TABLE `sueldo_paga_descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldo_paga_impuesto`
--

DROP TABLE IF EXISTS `sueldo_paga_impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldo_paga_impuesto` (
  `Cod_Sueldo` int NOT NULL,
  `Cod_Imp` int NOT NULL,
  PRIMARY KEY (`Cod_Sueldo`,`Cod_Imp`),
  KEY `fk_CodDescuentos_idx` (`Cod_Imp`),
  CONSTRAINT `fk_CodImp` FOREIGN KEY (`Cod_Imp`) REFERENCES `impuesto` (`Cod_Imp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CodSueldo_SPI` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo_paga_impuesto`
--

LOCK TABLES `sueldo_paga_impuesto` WRITE;
/*!40000 ALTER TABLE `sueldo_paga_impuesto` DISABLE KEYS */;
INSERT INTO `sueldo_paga_impuesto` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2);
/*!40000 ALTER TABLE `sueldo_paga_impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `total_sueldo_dias`
--

DROP TABLE IF EXISTS `total_sueldo_dias`;
/*!50001 DROP VIEW IF EXISTS `total_sueldo_dias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_sueldo_dias` AS SELECT 
 1 AS `Empleado`,
 1 AS `Sueldo_Total`,
 1 AS `Pago_Horas_Extras`,
 1 AS `Beneficio_Antiguedad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_sueldo_dias_informe`
--

DROP TABLE IF EXISTS `total_sueldo_dias_informe`;
/*!50001 DROP VIEW IF EXISTS `total_sueldo_dias_informe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_sueldo_dias_informe` AS SELECT 
 1 AS `nombre`,
 1 AS `Dias_Puntual`,
 1 AS `Pago_Dias_Puntual`,
 1 AS `Dias_Atrasado`,
 1 AS `Pago_Dias_Atraso`,
 1 AS `Dias_No_Cobrados`,
 1 AS `Pago_Dias_Faltados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_sueldo_informe`
--

DROP TABLE IF EXISTS `total_sueldo_informe`;
/*!50001 DROP VIEW IF EXISTS `total_sueldo_informe`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_sueldo_informe` AS SELECT 
 1 AS `Empleado`,
 1 AS `Sueldo_Total`,
 1 AS `Pago_Horas_Extras`,
 1 AS `Beneficio_Antiguedad`,
 1 AS `Descuentos`,
 1 AS `Impuestos`,
 1 AS `Total_a_pagar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_bd_completa`
--

DROP TABLE IF EXISTS `vista_bd_completa`;
/*!50001 DROP VIEW IF EXISTS `vista_bd_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_bd_completa` AS SELECT 
 1 AS `Cod_Emp`,
 1 AS `Nombre_Emp`,
 1 AS `Celular`,
 1 AS `Direccion`,
 1 AS `Horas_Extras`,
 1 AS `Dias_Totales`,
 1 AS `Años_Antiguedad`,
 1 AS `Nombre_Rol`,
 1 AS `Nombre_Dep`,
 1 AS `Cant_Sueldo_Dia`,
 1 AS `Cant_Sueldo_Horas_Extras`,
 1 AS `Nombre_Des`,
 1 AS `Porcentaje_Des`,
 1 AS `Nombre_imp`,
 1 AS `Porcentaje_Imp`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'salarios'
--

--
-- Dumping routines for database 'salarios'
--
/*!50003 DROP FUNCTION IF EXISTS `AntiguedadB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `AntiguedadB`(Años int) RETURNS float
    DETERMINISTIC
BEGIN
declare PB float;
Select if(años >= 2 && años <= 4, 0.05, if(años >= 5 && años <= 7, 0.11,if(años >= 8 && años <= 10,0.18,if(años >= 11 && años <= 14,0.26,
0.00)))) into PB;
RETURN PB;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DescuentosT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `DescuentosT`() RETURNS float
    DETERMINISTIC
BEGIN
declare  total float ;
select sum(Porcentaje_Des) as descuentos_Totales into total from descuento;
RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `impuestosT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `impuestosT`() RETURNS float
    DETERMINISTIC
BEGIN
declare  total float ;
select sum(Porcentaje_Imp) as Impuestos_Totales into total from Impuesto;
RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sueldoTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `sueldoTotal`() RETURNS float
    DETERMINISTIC
BEGIN
declare total float;
select s.Cant_Sueldo_Dia*e.Dias_P +(Cant_Sueldo_Dia * 0.5 * e.Dias_A) into total
from empleados as e
inner join sueldo as s on e.Cod_Sueldo = s.Cod_Sueldo
;
RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `actividad_de_empleado`
--

/*!50001 DROP VIEW IF EXISTS `actividad_de_empleado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `actividad_de_empleado` AS select `e`.`Nombre_Emp` AS `Nombre`,`e`.`Celular` AS `Celular`,`e`.`Direccion` AS `Direccion`,`e`.`Horas_Extras` AS `Horas_Extras`,`e`.`Dias_P` AS `Dias_Puntual`,`e`.`Dias_A` AS `Dias_Atrasado`,`e`.`Dias_F` AS `Dias_que_Falto`,`e`.`Dias_Totales` AS `Dias_Totales`,`e`.`Años_Antiguedad` AS `Años_De_Antiguedad`,`r`.`Nombre_Rol` AS `Rol`,`d`.`Nombre_Dep` AS `Departamento` from ((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `beneficios_informe`
--

/*!50001 DROP VIEW IF EXISTS `beneficios_informe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `beneficios_informe` AS select `e`.`Nombre_Emp` AS `nombre`,`e`.`Años_Antiguedad` AS `Años_Antiguedad`,`AntiguedadB`(`e`.`Años_Antiguedad`) AS `porcentaje_Antiguedad`,round((`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`))),2) AS `Beneficio_Antiguedad`,`e`.`Horas_Extras` AS `Horas_Extras`,(`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`) AS `Pago_Horas_Extras` from (((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) join `sueldo` `s` on((`e`.`Cod_Sueldo` = `s`.`Cod_Sueldo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `descuentos_que_pagan`
--

/*!50001 DROP VIEW IF EXISTS `descuentos_que_pagan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `descuentos_que_pagan` AS select `e`.`Cod_Emp` AS `Nro_Empleado`,`e`.`Nombre_Emp` AS `Empleado`,`des`.`Nombre_Des` AS `Descuento`,`des`.`Porcentaje_Des` AS `Porcentaje`,round((((((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)) + (`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)))) * `DescuentosT`()),2) AS `Descuentos_a_Pagar` from (((((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) join `sueldo` `s` on((`e`.`Cod_Sueldo` = `s`.`Cod_Sueldo`))) join `sueldo_paga_descuento` `spd` on((`s`.`Cod_Sueldo` = `spd`.`Cod_Sueldo`))) join `descuento` `des` on((`spd`.`Cod_Descuentos` = `des`.`Cod_Descuento`))) order by `e`.`Cod_Emp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `impuestos_que_pagan`
--

/*!50001 DROP VIEW IF EXISTS `impuestos_que_pagan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `impuestos_que_pagan` AS select `e`.`Cod_Emp` AS `nro_Empleado`,`e`.`Nombre_Emp` AS `Empleado`,`i`.`Nombre_Imp` AS `Nombre_impuesto`,`i`.`Porcentaje_Imp` AS `Porcentaje_Impuesto`,round((((((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)) + (`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)))) * `DescuentosT`()),2) AS `Impuestos_a_Pagar` from (((((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) join `sueldo` `s` on((`e`.`Cod_Sueldo` = `s`.`Cod_Sueldo`))) join `sueldo_paga_impuesto` `spi` on((`s`.`Cod_Sueldo` = `spi`.`Cod_Sueldo`))) join `impuesto` `i` on((`spi`.`Cod_Imp` = `i`.`Cod_Imp`))) order by `e`.`Cod_Emp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_sueldo_dias`
--

/*!50001 DROP VIEW IF EXISTS `total_sueldo_dias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_sueldo_dias` AS select `e`.`Cod_Emp` AS `Empleado`,((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) AS `Sueldo_Total`,(`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`) AS `Pago_Horas_Extras`,`AntiguedadB`(`e`.`Años_Antiguedad`) AS `Beneficio_Antiguedad` from (((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) join `sueldo` `s` on((`e`.`Cod_Sueldo` = `s`.`Cod_Sueldo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_sueldo_dias_informe`
--

/*!50001 DROP VIEW IF EXISTS `total_sueldo_dias_informe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_sueldo_dias_informe` AS select `e`.`Nombre_Emp` AS `nombre`,`e`.`Dias_P` AS `Dias_Puntual`,(`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) AS `Pago_Dias_Puntual`,`e`.`Dias_A` AS `Dias_Atrasado`,((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`) AS `Pago_Dias_Atraso`,`e`.`Dias_F` AS `Dias_No_Cobrados`,0 AS `Pago_Dias_Faltados` from (((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) join `sueldo` `s` on((`e`.`Cod_Sueldo` = `s`.`Cod_Sueldo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_sueldo_informe`
--

/*!50001 DROP VIEW IF EXISTS `total_sueldo_informe`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_sueldo_informe` AS select `e`.`Nombre_Emp` AS `Empleado`,((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) AS `Sueldo_Total`,(`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`) AS `Pago_Horas_Extras`,round((`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`))),2) AS `Beneficio_Antiguedad`,round((((((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)) + (`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)))) * `DescuentosT`()),2) AS `Descuentos`,round((((((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)) + (`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)))) * `impuestosT`()),2) AS `Impuestos`,round((((((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)) + (`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)))) - ((((((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)) + (`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)))) * `DescuentosT`()) + (((((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)) + (`AntiguedadB`(`e`.`Años_Antiguedad`) * (((`s`.`Cant_Sueldo_Dia` * `e`.`Dias_P`) + ((`s`.`Cant_Sueldo_Dia` * 0.5) * `e`.`Dias_A`)) + (`e`.`Horas_Extras` * `s`.`Cant_Sueldo_Horas_Extras`)))) * `impuestosT`()))),2) AS `Total_a_pagar` from (((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) join `sueldo` `s` on((`e`.`Cod_Sueldo` = `s`.`Cod_Sueldo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_bd_completa`
--

/*!50001 DROP VIEW IF EXISTS `vista_bd_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_bd_completa` AS select `e`.`Cod_Emp` AS `Cod_Emp`,`e`.`Nombre_Emp` AS `Nombre_Emp`,`e`.`Celular` AS `Celular`,`e`.`Direccion` AS `Direccion`,`e`.`Horas_Extras` AS `Horas_Extras`,`e`.`Dias_Totales` AS `Dias_Totales`,`e`.`Años_Antiguedad` AS `Años_Antiguedad`,`r`.`Nombre_Rol` AS `Nombre_Rol`,`d`.`Nombre_Dep` AS `Nombre_Dep`,`s`.`Cant_Sueldo_Dia` AS `Cant_Sueldo_Dia`,`s`.`Cant_Sueldo_Horas_Extras` AS `Cant_Sueldo_Horas_Extras`,`des`.`Nombre_Des` AS `Nombre_Des`,`des`.`Porcentaje_Des` AS `Porcentaje_Des`,`i`.`Nombre_Imp` AS `Nombre_imp`,`i`.`Porcentaje_Imp` AS `Porcentaje_Imp` from (((((((`empleados` `e` join `rol` `r` on((`e`.`Cod_Rol` = `r`.`Cod_Rol`))) join `departamento` `d` on((`e`.`Cod_Dep` = `d`.`Cod_Dep`))) join `sueldo` `s` on((`e`.`Cod_Sueldo` = `s`.`Cod_Sueldo`))) join `sueldo_paga_descuento` `spd` on((`s`.`Cod_Sueldo` = `spd`.`Cod_Sueldo`))) join `descuento` `des` on((`spd`.`Cod_Descuentos` = `des`.`Cod_Descuento`))) join `sueldo_paga_impuesto` `spi` on((`s`.`Cod_Sueldo` = `spi`.`Cod_Sueldo`))) join `impuesto` `i` on((`spi`.`Cod_Imp` = `i`.`Cod_Imp`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 23:07:12
