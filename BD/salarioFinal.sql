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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `Cod_Admi` int NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `User_Email` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `User_password` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Cod_Emp` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Admi`),
  KEY `fk_idEmpleado_idx` (`Cod_Emp`),
  CONSTRAINT `fk_idEmpleado` FOREIGN KEY (`Cod_Emp`) REFERENCES `empleados` (`Cod_Emp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (2,'JuanAdmi','juan.admi@gmail.com','12345',1);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `Cod_Dep` int NOT NULL AUTO_INCREMENT,
  `Nombre_Dep` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`Cod_Dep`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'financiero'),(2,'marketing'),(3,'comercial'),(4,'control de gestion'),(5,'Direccion general'),(6,'compras');
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
  `Nombre_Des` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Porcentaje_Des` float DEFAULT NULL,
  PRIMARY KEY (`Cod_Descuento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
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
  `Nombre_Emp` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Celular` int DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Cod_Dep` int DEFAULT NULL,
  `Cod_Rol` int DEFAULT NULL,
  `Cod_Sueldo` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Emp`),
  KEY `fk_empl_rol_idx` (`Cod_Rol`),
  KEY `fk_empl_sueldo_idx` (`Cod_Sueldo`),
  KEY `fk_empl_dep_idx` (`Cod_Dep`),
  CONSTRAINT `fk_empl_dep` FOREIGN KEY (`Cod_Dep`) REFERENCES `departamento` (`Cod_Dep`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_empl_rol` FOREIGN KEY (`Cod_Rol`) REFERENCES `rol` (`Cod_Rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_empl_sueldo` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'julian',78965421,'Loa #500',1,1,5),(2,'juan',78985421,'Loa #501',2,2,4),(3,'julia',79965421,'Loa #505',3,3,3),(4,'jose',79965721,'Loa #507',4,4,2),(5,'joel',79965721,'Loa #507',5,5,1),(6,'julanPablo',78105421,'Loa #551',1,1,1);
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
  `Nombre_Imp` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Porcentaje_Imp` float DEFAULT NULL,
  PRIMARY KEY (`Cod_Imp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
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
-- Table structure for table `registros_emp`
--

DROP TABLE IF EXISTS `registros_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_emp` (
  `cod_Registros_Emp` int NOT NULL AUTO_INCREMENT,
  `Cod_Emp` int DEFAULT NULL,
  `Horas_Extras` int DEFAULT NULL,
  `Dias_P` int DEFAULT NULL,
  `Dias_A` int DEFAULT NULL,
  `Dias_F` int DEFAULT NULL,
  `Dias_Totales` int DEFAULT NULL,
  `Mes_vigente` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `Años_Antiguedad` int DEFAULT NULL,
  PRIMARY KEY (`cod_Registros_Emp`),
  KEY `fk_Reg_Emp_idx` (`Cod_Emp`),
  CONSTRAINT `fk_Reg_Emp` FOREIGN KEY (`Cod_Emp`) REFERENCES `empleados` (`Cod_Emp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_emp`
--

LOCK TABLES `registros_emp` WRITE;
/*!40000 ALTER TABLE `registros_emp` DISABLE KEYS */;
INSERT INTO `registros_emp` VALUES (1,1,15,25,1,4,30,'junio',8),(2,2,11,26,4,0,30,'junio',9),(3,3,10,25,4,1,30,'junio',10),(4,4,15,28,1,1,30,'junio',5),(5,5,10,24,4,2,30,'junio',10),(6,1,6,25,1,4,30,'julio',8),(7,2,15,26,4,0,30,'julio',9),(8,3,15,25,4,1,30,'julio',10),(9,4,10,28,1,1,30,'julio',5),(10,5,18,24,4,2,30,'julio',10);
/*!40000 ALTER TABLE `registros_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `Cod_Rol` int NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`Cod_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'especialista'),(2,'El_lider'),(3,'El_coordinador'),(4,'El_investigador'),(5,'El_motivador');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
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
-- Table structure for table `sueldo_paga_descuento`
--

DROP TABLE IF EXISTS `sueldo_paga_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldo_paga_descuento` (
  `Cod_Sueldo` int NOT NULL,
  `Cod_Descuentos` int NOT NULL,
  PRIMARY KEY (`Cod_Sueldo`,`Cod_Descuentos`),
  KEY `fk_sueldo_has_descuento_descuento1_idx` (`Cod_Descuentos`),
  KEY `fk_sueldo_has_descuento_sueldo1_idx` (`Cod_Sueldo`),
  CONSTRAINT `fk_sueldo_has_descuento_descuento1` FOREIGN KEY (`Cod_Descuentos`) REFERENCES `descuento` (`Cod_Descuento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sueldo_has_descuento_sueldo1` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
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
  KEY `fk_sueldo_has_impuesto_impuesto1_idx` (`Cod_Imp`),
  KEY `fk_sueldo_has_impuesto_sueldo1_idx` (`Cod_Sueldo`),
  CONSTRAINT `fk_sueldo_has_impuesto_impuesto1` FOREIGN KEY (`Cod_Imp`) REFERENCES `impuesto` (`Cod_Imp`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sueldo_has_impuesto_sueldo1` FOREIGN KEY (`Cod_Sueldo`) REFERENCES `sueldo` (`Cod_Sueldo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldo_paga_impuesto`
--

LOCK TABLES `sueldo_paga_impuesto` WRITE;
/*!40000 ALTER TABLE `sueldo_paga_impuesto` DISABLE KEYS */;
INSERT INTO `sueldo_paga_impuesto` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2);
/*!40000 ALTER TABLE `sueldo_paga_impuesto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-03 23:46:19
