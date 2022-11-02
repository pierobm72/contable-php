-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sistema_contable
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `dni_admin` char(8) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`dni_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('12121212','jhoana','Garcia','maria12@gmail.com','202cb962ac59075b964b07152d234b70',0),('12312313','asdadasdasd','fsfsf','gato@gmail.com','9cdfeb19745e3896231b2c3d28f6ffb9',0),('12345678','leonardo','lazo','leonardo@gmail.com','202cb962ac59075b964b07152d234b70',0),('20000000','juan','Aguirre','juan@gmail.com','202cb962ac59075b964b07152d234b70',0),('25853222','Piero','asdasd','piero232@sdsd.com','855916eee9e64bed1346ecf5244ddb37',0),('32145678','Piero','Bayona Monsalve','piero_pis@gmail.com','44f181f940d44f9e97b5918dc686fabc',0),('40000000','Maria','Aguirre','maria123@gmail.com','202cb962ac59075b964b07152d234b70',0),('45164217','Piero','asd','piero1@sdsd.com','5e068c1fa4467948b5564157eda25af2',0),('47051406','Leonardo Wiliams','Lazo Tenorio','leo_300_112312@hotmail.com','8692f74186db5f59825907c956021e70',1),('56897412','Maria','Jaur','maria@asd.co','b1a9ca934edf1b11e45e40041dbd1c1c',1),('75162626','michale','enciso yancce','mihcael@gmail.com','202cb962ac59075b964b07152d234b70',1),('78945612','Jose','borges','jose245@sdsd.com','8c70daaa8607370bf3e05ddefc733fb6',0),('98745632',' ',' ','piero@sdsd.com','59a23f9dbe4d4597c1d923abc1dff1b4',0);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `total_monto` double NOT NULL,
  PRIMARY KEY (`id_caja`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `caja_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (16,4,'2022-09-13',4988),(17,1,'2022-09-22',1121),(18,2,'2022-09-30',5428),(19,3,'2022-09-20',4248),(20,6,'2022-09-23',510.4),(21,7,'2022-09-21',1180),(22,8,'2022-09-23',5192),(23,5,'2022-09-17',2436),(24,9,'2022-09-17',3990),(25,11,'2022-09-17',9120),(26,13,'2022-09-28',35.4),(27,14,'2022-09-28',414.18),(28,16,'2022-09-30',3540),(29,17,'2022-10-10',7552),(30,19,'2022-10-10',7080),(31,22,'2022-10-10',23600),(32,23,'2022-10-10',12036),(33,24,'2022-10-10',11800),(34,29,'2022-10-14',2320),(35,27,'2022-10-25',1160),(36,30,'2022-10-25',1160),(37,31,'2022-10-25',928),(38,32,'2022-10-25',1160);
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ruc_cliente` char(11) NOT NULL,
  `nombre_clie` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `id_rubro` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ruc_cliente`),
  KEY `id_rubro` (`id_rubro`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_rubro`) REFERENCES `rubro` (`id_rubro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('123123213','Piero','bm','piero@sdsd.com','78965412',2,0),('12331231232','Piero','bm','piero32@sdsd.com','78965412',2,1),('12345678910','juans','Lazo','leo@gmail.com','999999999',1,0),('56465151531','kaels','quispe','kaelqgmail.com','959595656',3,0),('56651526562','kevin','quispe','kevin@gmail.com','846616515',3,0),('88888888888','Fernando','Martinez','fernando@gmail.com','333333333',1,0),('88997711122','Jacinto','Aguirre','juan@gmail.com','987654321',2,0);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egreso`
--

DROP TABLE IF EXISTS `egreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egreso` (
  `id_egreso` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `t_egreso` int(11) NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`id_egreso`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `t_egreso` (`t_egreso`),
  CONSTRAINT `egreso_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`),
  CONSTRAINT `egreso_ibfk_2` FOREIGN KEY (`t_egreso`) REFERENCES `tipo_egreso` (`t_egreso`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egreso`
--

LOCK TABLES `egreso` WRITE;
/*!40000 ALTER TABLE `egreso` DISABLE KEYS */;
INSERT INTO `egreso` VALUES (66,1,'mesas','2022-09-08',1,200),(67,1,'sillas','2022-09-08',1,150),(68,2,'Lapices','2022-09-08',1,300),(69,2,'laptop','2022-09-08',1,4000),(70,1,'Medicina','2022-09-09',1,400),(71,1,'Carpinteria','2022-09-10',1,200),(72,2,'libreria','2022-09-16',2,100),(73,2,'Muebles','2022-09-17',1,200),(74,3,'Clavos','2022-09-09',1,200),(75,3,'Fierros','2022-09-16',1,1400),(76,3,'Madera','2022-09-16',2,2000),(77,4,'Zapatos','2022-09-14',2,3000),(78,4,'Zapatillas','2022-09-15',1,1300),(79,6,'Cuzco','2022-09-16',2,200),(80,6,'Amazonas','2022-09-16',2,240),(81,7,'Harina','2022-09-16',1,1000),(82,8,'Analgesicos','2022-09-24',2,400),(83,8,'miel','2022-09-17',1,4000),(84,5,'botellas de agua','2022-09-17',1,100),(85,5,'aire comprimido','2022-09-17',1,2000),(86,9,'tela','2022-09-17',1,1000),(87,9,'costureros','2022-09-17',1,1000),(88,9,'maquinas','2022-09-17',1,1500),(89,11,'ladrillos','2022-09-17',1,3000),(90,11,'acero','2022-09-17',1,2000),(91,11,'cemento','2022-09-17',1,3000),(92,13,'nose','2022-09-28',1,10),(93,13,'nose','2022-09-28',1,20),(94,14,'uiyiug','2022-09-28',1,351),(95,15,'Mesas','2022-09-30',1,1200),(96,15,'Sillas','2022-09-30',1,2000),(97,15,'Ingredientes','2022-09-30',1,323),(98,16,'Guitarras','2022-09-30',1,1000),(99,16,'Piano','2022-09-30',1,2000),(100,17,'Piero','2022-10-10',1,2000),(101,17,'Maquinas','2022-10-10',1,2000),(102,17,'maquinas','2022-10-10',2,1000),(103,17,'maquinas','2022-10-10',2,1000),(104,17,'procesador','2022-10-10',2,200),(105,17,'Teclado','2022-10-10',2,100),(106,17,'Teclado','2022-10-10',2,100),(107,17,'Teclado','2022-10-10',2,100),(108,19,'laptop ryzen','2022-10-10',1,2000),(109,17,'Teclado','2022-10-10',2,100),(110,19,'laptop ryzen','2022-10-10',1,2000),(111,19,'cpu intel','2022-10-10',1,2000),(112,15,'zanahoria','2022-10-10',1,20000),(113,20,'pan','2022-10-10',1,1000),(114,20,'levadura','2022-10-10',1,2000),(115,21,'Piero','2022-10-10',1,1000),(116,21,'pez','2022-10-10',1,1000),(117,21,'pez','2022-10-10',1,1000),(118,21,'Pez','2022-10-10',1,1000),(119,21,'mar','2022-10-10',1,1000),(120,21,'Nada','2022-10-10',1,20000),(121,22,'panes','2022-10-10',1,20000),(122,20,'Caramelos','2022-10-10',1,5000),(123,20,'Caramelos','2022-10-10',1,5000),(124,20,'asdasd','2022-10-10',1,2000),(125,20,'asdsad','2022-10-10',1,2000),(126,20,'bbbb','2022-10-10',1,2000),(127,20,'ccccc','2022-10-10',1,2000),(128,20,'ddd','2022-10-10',1,123),(129,20,'gggg','2022-10-10',1,20000),(130,20,'ggggg','2022-10-10',1,5000),(131,20,'ggg','2022-10-10',1,2000),(132,20,'eeee','2022-10-10',1,20000),(133,20,'ttttt','2022-10-10',1,5000),(134,20,'fffg','2022-10-10',1,4000),(135,20,'ggggg','2022-10-10',1,4000),(136,20,'dfff','2022-10-10',1,400),(137,20,'ffff','2022-10-10',1,200),(138,20,'ffgfg','2022-10-10',1,10),(139,20,'Piero','2022-10-10',1,200),(140,20,'dd','2022-10-10',1,1000),(141,20,'fff','2022-10-10',1,2000),(142,20,'sd','2022-10-10',1,10),(143,20,'cvff','2022-10-10',1,10000),(144,20,'dfgdfgf','2022-10-10',1,1000),(145,20,'asas','2022-10-10',1,2000),(146,23,'Manzanas','2022-10-10',1,10000),(147,23,'jo','2022-10-10',1,200),(148,24,'pc','2022-10-10',1,10000),(149,25,'Guitarras','2022-10-12',1,10000),(150,25,'Flauta','2022-10-29',2,1000),(151,18,'pc','2022-10-12',1,1000),(152,25,'Piero','2022-10-12',1,123123),(153,29,'Piero','2022-10-14',1,2000),(154,27,'asdasd','2022-10-25',1,1000),(155,20,'Piero','2022-10-25',1,123),(156,28,'asdsa','2022-10-25',1,123),(157,30,'Trabajadores','2022-10-25',1,1000),(158,31,'Trabajador','2022-10-25',1,100),(159,31,'Alumnos','2022-10-25',1,200),(160,31,'Bus','2022-10-25',1,500),(161,32,'Computadoras','2022-10-25',1,200),(162,32,'Redes','2022-10-25',1,500),(163,32,'Trabajores','2022-10-25',1,300);
/*!40000 ALTER TABLE `egreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto_ingreso` double NOT NULL,
  PRIMARY KEY (`id_ingreso`),
  KEY `id_caja` (`id_caja`),
  CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (6,17,'2022-09-12',8879),(7,18,'2022-09-12',14572),(8,19,'2022-09-12',25752),(9,20,'2022-09-15',39489.6),(10,21,'2022-09-15',898820),(11,22,'2022-09-16',34808),(12,23,'2022-09-17',47564),(13,24,'2022-09-17',-990),(14,25,'2022-09-17',50880),(15,26,'2022-09-28',164.6),(16,27,'2022-09-28',585.8199999999999),(17,28,'2022-09-30',16460),(18,29,'2022-10-10',12448),(19,30,'2022-10-10',-7068),(20,33,'2022-10-10',-9800),(21,34,'2022-10-14',-2107),(22,35,'2022-10-25',212053),(23,36,'2022-10-25',-1060),(24,37,'2022-10-25',72),(25,38,'2022-10-25',-160);
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `ruc_cliente` char(11) NOT NULL,
  `n_proyecto` varchar(100) NOT NULL,
  `inversion` double NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `ruc_cliente` (`ruc_cliente`),
  CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`ruc_cliente`) REFERENCES `cliente` (`ruc_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,'12345678910','Sistema',10000,2),(2,'12345678910','Contador',20000,0),(3,'12345678910','Ferreteria',30000,0),(4,'88997711122','Calzados',30000,0),(5,'88997711122','Mantenimiento',50000,0),(6,'88997711122','Viajes',40000,0),(7,'88888888888','Panaderia',900000,2),(8,'88888888888','Farmacia',40000,2),(9,'56465151531','cortina',3000,0),(10,'56651526562','almacen',3000,1),(11,'56651526562','construccion',60000,0),(12,'88888888888','ingrese nombre',50000,2),(13,'12345678910','almacén de víveres ',200,0),(14,'12345678910','asdas',1000,0),(15,'12345678910','Cocina',19000,1),(16,'12345678910','Musica',20000,0),(17,'12345678910','Laptops',20000,0),(18,'56465151531','Maquinas',20000,1),(19,'12345678910','Informatica',12,0),(20,'12345678910','panadera',20000,1),(21,'56651526562','Pezca',100000,1),(22,'12345678910','Tienda',50000,0),(23,'12345678910','Fruteria',10000,0),(24,'12345678910','Sistemas',2000,0),(25,'123123213','Musica2',213123,1),(26,'123123213','Construccion',3123123123,1),(27,'12331231232','Construccion',213213,0),(28,'12331231232','Caja',20000,1),(29,'12331231232','Construccion2',213,0),(30,'12331231232','ROPA',100,0),(31,'12331231232','SENATI',1000,0),(32,'12331231232','Informatica3',1000,0);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubro`
--

DROP TABLE IF EXISTS `rubro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubro` (
  `id_rubro` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_empresa` varchar(50) NOT NULL,
  `igv` double NOT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubro`
--

LOCK TABLES `rubro` WRITE;
/*!40000 ALTER TABLE `rubro` DISABLE KEYS */;
INSERT INTO `rubro` VALUES (1,'Grande',0.18),(2,'Mediana',0.16),(3,'Pequeña',0.14);
/*!40000 ALTER TABLE `rubro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguridad`
--

DROP TABLE IF EXISTS `seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguridad` (
  `ip` char(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `contador` char(1) NOT NULL,
  `r_h` char(2) NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguridad`
--

LOCK TABLES `seguridad` WRITE;
/*!40000 ALTER TABLE `seguridad` DISABLE KEYS */;
INSERT INTO `seguridad` VALUES ('138.185.15.82','2022-10-24 23:37:00','0','3'),('38.43.130.114','2022-09-30 13:31:51','1','6');
/*!40000 ALTER TABLE `seguridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_egreso`
--

DROP TABLE IF EXISTS `tipo_egreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_egreso` (
  `t_egreso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`t_egreso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_egreso`
--

LOCK TABLES `tipo_egreso` WRITE;
/*!40000 ALTER TABLE `tipo_egreso` DISABLE KEYS */;
INSERT INTO `tipo_egreso` VALUES (1,'Egreso recurrente'),(2,'Egreso Fijo');
/*!40000 ALTER TABLE `tipo_egreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistema_contable'
--
/*!50003 DROP PROCEDURE IF EXISTS `insertar_datos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_datos`(IN `id_caja` INT, IN `monto_ingreso` DOUBLE)
BEGIN


INSERT INTO ingreso(id_caja,fecha,monto_ingreso)


VALUES(id_caja,CURRENT_DATE,monto_ingreso);





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

-- Dump completed on 2022-11-01 17:13:26
