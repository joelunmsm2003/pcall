-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: perucall
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agentebase`
--

DROP TABLE IF EXISTS `agentebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentebase` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `agente` int(100) DEFAULT NULL,
  `base` int(100) DEFAULT NULL,
  `tiniciogestion` datetime DEFAULT NULL,
  `tfingestion` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT '0',
  `comentario` mediumtext,
  `facuerdo` datetime DEFAULT NULL,
  `macuerdo` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `tiniciollamada` datetime DEFAULT NULL,
  `tfinllamada` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agente` (`agente`),
  KEY `base` (`base`),
  KEY `status` (`status`),
  CONSTRAINT `agentebase_ibfk_1` FOREIGN KEY (`agente`) REFERENCES `agentes` (`id`),
  CONSTRAINT `agentebase_ibfk_2` FOREIGN KEY (`base`) REFERENCES `base` (`id`),
  CONSTRAINT `agentebase_ibfk_3` FOREIGN KEY (`status`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentebase`
--

LOCK TABLES `agentebase` WRITE;
/*!40000 ALTER TABLE `agentebase` DISABLE KEYS */;
INSERT INTO `agentebase` VALUES (1,14,6,'2015-11-27 21:33:32',NULL,0,'trtrt','2016-02-01 00:00:00',54534,3,'2015-12-31 04:11:00',NULL),(2,14,6,'2015-12-01 16:22:55',NULL,0,NULL,'2015-01-01 00:00:00',2,6,NULL,NULL),(3,21,7,'2015-11-29 18:34:14',NULL,0,'wewewewewewewewewewewewewe',NULL,NULL,6,NULL,NULL),(4,18,7,'2015-11-30 05:38:08',NULL,0,'ieuiurie',NULL,NULL,6,'2015-11-29 00:00:00',NULL);
/*!40000 ALTER TABLE `agentebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agentecalificacion`
--

DROP TABLE IF EXISTS `agentecalificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentecalificacion` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `pregunta` int(100) DEFAULT NULL,
  `nota` int(100) DEFAULT NULL,
  `agente` int(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pregunta` (`pregunta`),
  KEY `nota` (`nota`),
  KEY `agente` (`agente`),
  CONSTRAINT `agentecalificacion_ibfk_1` FOREIGN KEY (`pregunta`) REFERENCES `preguntas` (`id`),
  CONSTRAINT `agentecalificacion_ibfk_2` FOREIGN KEY (`nota`) REFERENCES `nota` (`id`),
  CONSTRAINT `agentecalificacion_ibfk_3` FOREIGN KEY (`agente`) REFERENCES `agentes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentecalificacion`
--

LOCK TABLES `agentecalificacion` WRITE;
/*!40000 ALTER TABLE `agentecalificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `agentecalificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agentes`
--

DROP TABLE IF EXISTS `agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anexo` int(11) DEFAULT NULL,
  `fono` int(11) DEFAULT NULL,
  `tiempo` time DEFAULT '00:00:00',
  `atendidas` int(11) DEFAULT '0',
  `contactadas` int(11) DEFAULT '0',
  `estado` int(11) DEFAULT '1',
  `user` int(100) DEFAULT NULL,
  `supervisor` int(100) DEFAULT NULL,
  `disponible` int(100) DEFAULT '0',
  `calificacion` int(100) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `supervisor` (`supervisor`),
  KEY `estado` (`estado`),
  KEY `calificacion` (`calificacion`),
  CONSTRAINT `agentes_ibfk_1` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `agentes_ibfk_3` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`),
  CONSTRAINT `agentes_ibfk_4` FOREIGN KEY (`supervisor`) REFERENCES `supervisor` (`id`),
  CONSTRAINT `agentes_ibfk_5` FOREIGN KEY (`calificacion`) REFERENCES `base` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentes`
--

LOCK TABLES `agentes` WRITE;
/*!40000 ALTER TABLE `agentes` DISABLE KEYS */;
INSERT INTO `agentes` VALUES (14,102,102,'00:00:00',10,350,2,89,NULL,NULL,NULL),(15,NULL,NULL,'00:00:00',0,0,1,90,NULL,NULL,NULL),(16,NULL,NULL,'00:00:00',0,0,1,96,NULL,NULL,NULL),(17,NULL,NULL,'00:00:00',0,0,1,97,NULL,NULL,NULL),(18,NULL,NULL,'00:00:00',0,0,2,98,NULL,NULL,NULL),(19,NULL,NULL,'00:00:00',0,0,1,99,NULL,NULL,NULL),(20,NULL,NULL,'00:00:00',0,0,1,100,NULL,NULL,NULL),(21,102,980698120,'00:00:00',0,0,2,101,NULL,NULL,NULL),(22,NULL,NULL,'00:00:00',0,0,1,107,NULL,NULL,NULL);
/*!40000 ALTER TABLE `agentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agentescampanias`
--

DROP TABLE IF EXISTS `agentescampanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentescampanias` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `agente` int(100) NOT NULL,
  `campania` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agente` (`agente`),
  KEY `campania` (`campania`),
  CONSTRAINT `agentescampanias_ibfk_1` FOREIGN KEY (`agente`) REFERENCES `agentes` (`id`),
  CONSTRAINT `agentescampanias_ibfk_2` FOREIGN KEY (`campania`) REFERENCES `campania` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentescampanias`
--

LOCK TABLES `agentescampanias` WRITE;
/*!40000 ALTER TABLE `agentescampanias` DISABLE KEYS */;
INSERT INTO `agentescampanias` VALUES (180,14,54),(181,15,54),(183,15,8),(187,14,57),(188,15,57),(189,14,63),(190,15,63),(199,19,66),(200,20,66),(201,21,66),(202,14,76),(203,15,76),(204,16,76);
/*!40000 ALTER TABLE `agentescampanias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add agentebase',7,'add_agentebase'),(20,'Can change agentebase',7,'change_agentebase'),(21,'Can delete agentebase',7,'delete_agentebase'),(22,'Can add agentecalificacion',8,'add_agentecalificacion'),(23,'Can change agentecalificacion',8,'change_agentecalificacion'),(24,'Can delete agentecalificacion',8,'delete_agentecalificacion'),(25,'Can add agentes',9,'add_agentes'),(26,'Can change agentes',9,'change_agentes'),(27,'Can delete agentes',9,'delete_agentes'),(28,'Can add agentescampanias',10,'add_agentescampanias'),(29,'Can change agentescampanias',10,'change_agentescampanias'),(30,'Can delete agentescampanias',10,'delete_agentescampanias'),(31,'Can add auth group',11,'add_authgroup'),(32,'Can change auth group',11,'change_authgroup'),(33,'Can delete auth group',11,'delete_authgroup'),(34,'Can add auth group permissions',12,'add_authgrouppermissions'),(35,'Can change auth group permissions',12,'change_authgrouppermissions'),(36,'Can delete auth group permissions',12,'delete_authgrouppermissions'),(37,'Can add auth permission',13,'add_authpermission'),(38,'Can change auth permission',13,'change_authpermission'),(39,'Can delete auth permission',13,'delete_authpermission'),(40,'Can add auth user',14,'add_authuser'),(41,'Can change auth user',14,'change_authuser'),(42,'Can delete auth user',14,'delete_authuser'),(43,'Can add auth user groups',15,'add_authusergroups'),(44,'Can change auth user groups',15,'change_authusergroups'),(45,'Can delete auth user groups',15,'delete_authusergroups'),(46,'Can add auth user user permissions',16,'add_authuseruserpermissions'),(47,'Can change auth user user permissions',16,'change_authuseruserpermissions'),(48,'Can delete auth user user permissions',16,'delete_authuseruserpermissions'),(49,'Can add base',17,'add_base'),(50,'Can change base',17,'change_base'),(51,'Can delete base',17,'delete_base'),(52,'Can add calificacion',18,'add_calificacion'),(53,'Can change calificacion',18,'change_calificacion'),(54,'Can delete calificacion',18,'delete_calificacion'),(55,'Can add campania',19,'add_campania'),(56,'Can change campania',19,'change_campania'),(57,'Can delete campania',19,'delete_campania'),(58,'Can add cartera',20,'add_cartera'),(59,'Can change cartera',20,'change_cartera'),(60,'Can delete cartera',20,'delete_cartera'),(61,'Can add carteraempresa',21,'add_carteraempresa'),(62,'Can change carteraempresa',21,'change_carteraempresa'),(63,'Can delete carteraempresa',21,'delete_carteraempresa'),(64,'Can add data',22,'add_data'),(65,'Can change data',22,'change_data'),(66,'Can delete data',22,'delete_data'),(67,'Can add django admin log',23,'add_djangoadminlog'),(68,'Can change django admin log',23,'change_djangoadminlog'),(69,'Can delete django admin log',23,'delete_djangoadminlog'),(70,'Can add django content type',24,'add_djangocontenttype'),(71,'Can change django content type',24,'change_djangocontenttype'),(72,'Can delete django content type',24,'delete_djangocontenttype'),(73,'Can add django migrations',25,'add_djangomigrations'),(74,'Can change django migrations',25,'change_djangomigrations'),(75,'Can delete django migrations',25,'delete_djangomigrations'),(76,'Can add django session',26,'add_djangosession'),(77,'Can change django session',26,'change_djangosession'),(78,'Can delete django session',26,'delete_djangosession'),(79,'Can add empresa',27,'add_empresa'),(80,'Can change empresa',27,'change_empresa'),(81,'Can delete empresa',27,'delete_empresa'),(82,'Can add estado',28,'add_estado'),(83,'Can change estado',28,'change_estado'),(84,'Can delete estado',28,'delete_estado'),(85,'Can add filtro',29,'add_filtro'),(86,'Can change filtro',29,'change_filtro'),(87,'Can delete filtro',29,'delete_filtro'),(88,'Can add header',30,'add_header'),(89,'Can change header',30,'change_header'),(90,'Can delete header',30,'delete_header'),(91,'Can add mascara',31,'add_mascara'),(92,'Can change mascara',31,'change_mascara'),(93,'Can delete mascara',31,'delete_mascara'),(94,'Can add nivel',32,'add_nivel'),(95,'Can change nivel',32,'change_nivel'),(96,'Can delete nivel',32,'delete_nivel'),(97,'Can add nota',33,'add_nota'),(98,'Can change nota',33,'change_nota'),(99,'Can delete nota',33,'delete_nota'),(100,'Can add preguntas',34,'add_preguntas'),(101,'Can change preguntas',34,'change_preguntas'),(102,'Can delete preguntas',34,'delete_preguntas'),(103,'Can add resultado',35,'add_resultado'),(104,'Can change resultado',35,'change_resultado'),(105,'Can delete resultado',35,'delete_resultado'),(106,'Can add supervisor',36,'add_supervisor'),(107,'Can change supervisor',36,'change_supervisor'),(108,'Can delete supervisor',36,'delete_supervisor'),(109,'Can add supervisorcartera',37,'add_supervisorcartera'),(110,'Can change supervisorcartera',37,'change_supervisorcartera'),(111,'Can delete supervisorcartera',37,'delete_supervisorcartera'),(112,'Can add troncales',38,'add_troncales'),(113,'Can change troncales',38,'change_troncales'),(114,'Can delete troncales',38,'delete_troncales'),(115,'Can add troncalesagentes',39,'add_troncalesagentes'),(116,'Can change troncalesagentes',39,'change_troncalesagentes'),(117,'Can delete troncalesagentes',39,'delete_troncalesagentes');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT NULL,
  `username` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  `empresa` int(100) DEFAULT '1',
  `nivel` int(11) NOT NULL DEFAULT '4',
  `telefono` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `nivel` (`nivel`),
  KEY `empresa` (`empresa`),
  CONSTRAINT `auth_user_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `auth_user_ibfk_2` FOREIGN KEY (`nivel`) REFERENCES `nivel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$15000$emGDFLEMc6GK$mfEdE/RXj7/Ixs7DSIY86vR4oHBYsjsTQ9tdLogTBI8=','2015-10-12 16:42:02',0,'joel','Joelinho','','',0,1,'2015-10-12 16:41:07',2,2,NULL),(3,'pbkdf2_sha256$12000$1ee3TNce9VKq$rmiUYRobIm+hIigZABIXDWGWkC6FUQiCECE8DHSh4a8=','2015-10-27 22:30:55',0,'viewCall','Berta','','',0,1,'2015-10-27 22:30:55',3,1,NULL),(8,'pbkdf2_sha256$15000$R6A1kAjrrj24$DKEGqrFG4doN/tvYg2A5p2NnunS3UBKymViGMXjP91A=','2015-12-02 23:36:28',0,'manager','Elizabet','','',0,1,'2015-10-30 17:28:49',2,4,NULL),(37,'pbkdf2_sha256$15000$l8MUv7ReZfZI$Dg3DXLA30+y3IYKUIKNWRxnvvBSgoNuBfifeAlyIXAo=','2015-11-04 23:22:35',0,'Carlota','','','carlota@perucall.com',0,1,'2015-11-04 23:22:35',53,1,NULL),(38,'pbkdf2_sha256$15000$fkRolrDbTOY2$W9DqqYy+u4pRznedSkxNhkYay7sjLNZqwHBZbN25VAQ=','2015-11-04 23:24:46',0,'asde','','','brujas@gmail.com',0,1,'2015-11-04 23:24:46',53,1,NULL),(39,'pbkdf2_sha256$15000$sK8ebMBxLGHq$vJfUpu8Mim13WLIVwkR3xBAZ5mFBXnSLsbbZq6s74xo=','2015-11-05 02:14:27',0,'lucho','lucho','','joelunmsm2@gmail.com',0,1,'2015-11-05 02:14:27',54,1,NULL),(86,'pbkdf2_sha256$15000$JAtGrjW1aWVC$B8Lcxz7SyPjNuWOjfmQDRRLXE9dqZl4ryMW3BiAagb4=','2015-12-03 20:41:23',0,'admin','Hugo','','',0,1,'2015-11-22 01:31:48',53,1,12121),(87,'pbkdf2_sha256$15000$G6eGxwyuxwOc$OW76zec9G73yDpkLDYeAqEj4fyfy/66L8UOwotEfNf8=','2015-12-03 20:55:37',0,'supervisor','Federica','','',0,1,'2015-11-22 01:45:57',53,2,123),(89,'pbkdf2_sha256$15000$S55ukFOMqFjT$QAq9ACzZEVgTxI6D47LzlhR2r6L6qrXYoJlyqQTef6Q=','2015-12-03 21:47:02',0,'agente','Cesar','','',0,1,'2015-11-22 01:56:00',53,3,32131),(90,'pbkdf2_sha256$15000$ur85YVflSuWh$0dfeb0I/My0hwsK9bgLAkyRySMqpxG/ypy8Rhc4xETk=','2015-11-22 01:59:43',0,'ania','Ania','','',0,1,'2015-11-22 01:59:43',53,3,33131),(91,'pbkdf2_sha256$15000$15Ziw4FUFv3M$DVoJUa2Fdbw01TjGgBgGF5815QM5qJZr/f4JwqObHr8=','2015-11-24 17:37:01',0,'joel123@gmail.com','joel','','',0,1,'2015-11-24 17:37:01',53,2,123),(92,'pbkdf2_sha256$15000$ynX8KopAjvgd$ku8w9XgLYRRdl7R5ub7cc0VLl4GGN5ZloCfWksfBlww=','2015-11-24 17:40:00',0,'dff','ew','','',0,1,'2015-11-24 17:40:00',53,2,122),(93,'pbkdf2_sha256$15000$jxfhJEU7WaeO$tvLL/mPqDUAWhEiY5wRUPcQGrqLpoNPqUjOjNSIYi64=','2015-11-24 17:40:50',0,'5656','656','','',0,1,'2015-11-24 17:40:50',53,2,123),(94,'pbkdf2_sha256$15000$ADSec2EQjLRf$wCw9zdstT0TPhFApX29xPIaqX5bh8qbeTwI99wEYIlM=','2015-11-24 17:45:10',0,'rtr','fdfd','','',0,1,'2015-11-24 17:45:10',53,2,1212),(95,'pbkdf2_sha256$15000$gBdNy5SlViIr$7+0T5vBuTETot8Nvm6T45P9iL/F84jNuJtdNATpCmfE=','2015-11-24 17:48:23',0,'kolo','Kolito','','',0,1,'2015-11-24 17:48:23',53,2,13),(96,'pbkdf2_sha256$15000$nfoidoYGu5k2$9W2sOgQsKlJtwDi6HWvXHqlcMyrq3TCbKq/Uk/Ewj5s=','2015-11-26 21:06:33',0,'joel1@gmail.com','Joel','','',0,1,'2015-11-26 21:06:33',53,3,123),(97,'pbkdf2_sha256$15000$SQpsthaJxwQk$8EuI1+Z40EW/AiHRl6kSPf26zjWVxnod5EVry2tM02I=','2015-11-26 21:06:56',0,'joel2@gmail.com','Joel2','','',0,1,'2015-11-26 21:06:56',53,3,123),(98,'pbkdf2_sha256$15000$gaTbS4VvL2I3$YHJdPuthIYPLTduGw5O8hVsbO8KdDMtsuhfjBMwf6kg=','2015-11-30 02:28:13',0,'joel3@gmail.com','Joel3','','',0,1,'2015-11-26 21:07:16',53,3,1234),(99,'pbkdf2_sha256$15000$7N8ByyjbDqid$HTbJAcjbXy9hTVTzgs/e0YI9qANPMXlE//9xAgHT4gU=','2015-11-26 21:07:48',0,'joel4@gmail.com','Joel4','','',0,1,'2015-11-26 21:07:48',53,3,123),(100,'pbkdf2_sha256$15000$DOiB6Ffmtzmz$8uZTUlCYJkNhB0nGy/lzyvl+ot7eiwMTUoEzxyvCLM4=','2015-11-26 21:08:07',0,'joel5@gmail.com','joel5','','',0,1,'2015-11-26 21:08:07',53,3,123),(101,'pbkdf2_sha256$15000$gOCf4era7C65$SfooVRf97Bch7fdOk7SzvCRR9QBvUyz13TNvsUWpXWY=','2015-11-29 17:18:55',0,'joel9@gmail.com','Pancrasia','','',0,1,'2015-11-26 21:20:19',53,3,323),(102,'pbkdf2_sha256$15000$4mHeOK9wcalf$pCQ6J18K+EX7DO0dc4zTVgP9GHHRkWNOKFsZ6U5Gdgo=','2015-11-29 05:56:35',0,'hshsh@gmail.com','Joelr','','',0,1,'2015-11-29 05:56:35',53,2,11234),(103,'pbkdf2_sha256$15000$P0xv7eXyjY15$wPQFBD8J78C+IZQsjB7xPezhcjdITvrq6ndjuvXoGuw=','2015-11-29 05:58:42',0,'agente2@gmail.com','agente','','',0,1,'2015-11-29 05:58:42',53,2,123),(104,'pbkdf2_sha256$15000$u7cDqktzUCos$imfs/A5sX+LUc8NWuaWWJmli0vOU1Hqi+1kNxvo8v18=','2015-11-29 06:02:19',0,'agente2','','','',0,1,'2015-11-29 06:02:19',1,4,NULL),(105,'pbkdf2_sha256$15000$XkoGmvQhDwPO$TehI+EuL6PHuGzo1ZEcbzqL5lmD29mj+zlIqmU2BqSA=','2015-11-29 06:04:30',0,'agente3','','','',0,1,'2015-11-29 06:04:30',1,4,NULL),(106,'pbkdf2_sha256$15000$BIjay9QZS5qt$9i6plvyenVzZqzMK2+ZGAAwLXSpgtaQS561TbMuOhW0=','2015-11-29 06:04:38',0,'agente4','','','',0,1,'2015-11-29 06:04:38',1,4,NULL),(107,'pbkdf2_sha256$15000$GcTvE5dMIIFN$bjKmPrM9wBu7HujOT3wLxLEXUJ6nYjfYnDA5sFTwTPU=','2015-12-03 20:30:31',0,'agente42','agente32','','',0,1,'2015-11-29 06:06:11',53,3,123),(108,'pbkdf2_sha256$15000$zLoq0t2h4Wvj$S5pE4grfnonoHOsRHLanJcEV0c8B6AGJxwFuwoGT6hA=','2015-12-02 23:17:16',0,'monitor','Carla','','',0,1,'2015-12-02 21:57:06',53,5,123456);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base`
--

DROP TABLE IF EXISTS `base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cliente` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_cliente` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_a` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_b` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_c` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_d` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_e` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_f` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_g` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_h` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `campania` int(100) DEFAULT NULL,
  `resultado` int(100) DEFAULT NULL,
  `agente` int(100) DEFAULT NULL,
  `duracion` int(100) DEFAULT NULL,
  `detalle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `monto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tiniciogestion` datetime DEFAULT NULL,
  `tfingestion` datetime DEFAULT NULL,
  `tiniciollamada` datetime DEFAULT NULL,
  `tfinllamada` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campania` (`campania`),
  KEY `resultado` (`resultado`),
  KEY `agente` (`agente`),
  CONSTRAINT `base_ibfk_1` FOREIGN KEY (`campania`) REFERENCES `campania` (`id`),
  CONSTRAINT `base_ibfk_2` FOREIGN KEY (`resultado`) REFERENCES `resultado` (`id`),
  CONSTRAINT `base_ibfk_3` FOREIGN KEY (`agente`) REFERENCES `agentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base`
--

LOCK TABLES `base` WRITE;
/*!40000 ALTER TABLE `base` DISABLE KEYS */;
INSERT INTO `base` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AYACUCHO','DIRECTO','SCORE C','1',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LIMA','NUEVO','SCORE C','0',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LIMA','INDIRECTO','SCORE C','0',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AYACUCHO','DIRECTO','SCORE C','1',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(5,'996867686.0','1.0','u\'PITILLO BENAVIDES\'','41909034.0','u\'VISA CLASICA\'','u\'4457896457851660\'','9671.35','8634.75','36.0','u\'AREQUIPA\'','u\'DIRECTO\'','u\'SCORE A\'','0',8,1,14,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(6,'979864789.0','2.0','u\'PITILLO BENAVIDES\'','41909034.0','u\'MASTERCARD ORO\'','u\'5598676334682245\'','6789.45','5987.36','15.0','u\'AREQUIPA\'','u\'DIRECTO\'','u\'SCORE A\'','1',8,1,14,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(7,'975874897.0','1.0','u\'TOTO TERRY\'','67985478.0','u\'AMERICAN EXPRESS\'','u\'6689745898756981\'','1687.35','1168.95','67.0','u\'AYACUCHO\'','u\'INDIRECTO\'','u\'SCORE C\'','1',8,1,18,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(8,'943215048.0','1.0','u\'ALBERTO BEINGOLEA\'','88749235.0','u\'PRESTAMO PERSONAL\'','u\'00026987469\'','10369.48','9168.74','69.0','u\'LIMA\'','u\'NUEVO\'','u\'SCORE B\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(9,'967810348.0','1.0','u\'POLO CAMPO\'','77495678.0','u\'CREDITO VEHICULAR\'','u\'99647952658\'','32697.48','28367.14','49.0','u\'AYACUCHO\'','u\'DIRECTO\'','u\'SCORE C\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(10,'991357001.0','2.0','u\'POLO CAMPO\'','77495678.0','u\'CREDITO HIOPTECARIO\'','u\'99886974695\'','105369.45','94698.36','102.0','u\'AYACUCHO\'','u\'INDIRECTO\'','u\'SCORE C\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(11,'996867689.0','1.0','u\'PITILLO BENAVIDES\'','41909034.0','u\'VISA CLASICA\'','u\'4457896457851660\'','9671.35','8634.75','36.0','u\'AREQUIPA\'','u\'DIRECTO\'','u\'SCORE A\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(12,'979864782.0','2.0','u\'PITILLO BENAVIDES\'','41909034.0','u\'MASTERCARD ORO\'','u\'5598676334682245\'','6789.45','5987.36','15.0','u\'AREQUIPA\'','u\'DIRECTO\'','u\'SCORE A\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(13,'975874896.0','1.0','u\'Cesar\'','67985478.0','u\'AMERICAN EXPRESS\'','u\'6689745898756981\'','1687.35','1168.95','67.0','u\'AYACUCHO\'','u\'INDIRECTO\'','u\'SCORE C\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(14,'9432150483.0','1.0','u\'Juan\'','88749235.0','u\'PRESTAMO PERSONAL\'','u\'00026987469\'','10369.48','9168.74','69.0','u\'LIMA\'','u\'NUEVO\'','u\'SCORE B\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(15,'967810348.0','1.0','u\'Carlos\'','77495678.0','u\'CREDITO VEHICULAR\'','u\'99647952658\'','32697.48','28367.14','49.0','u\'AYACUCHO\'','u\'DIRECTO\'','u\'SCORE C\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(16,'991357001.0','2.0','u\'Ana\'','77495678.0','u\'CREDITO HIOPTECARIO\'','u\'99886974695\'','105369.45','94698.36','102.0','u\'AYACUCHO\'','u\'INDIRECTO\'','u\'SCORE C\'','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(17,'996867686.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36.0','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(18,'979864789.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15.0','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(19,'975874897.0','1.0','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67.0','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(20,'943215048.0','1.0','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69.0','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(21,'967810348.0','1.0','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49.0','AYACUCHO','DIRECTO','SCORE C','1',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(22,'991357001.0','2.0','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102.0','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(23,'996867689.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36.0','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(24,'979864782.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15.0','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(25,'975874896.0','1.0','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67.0','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(26,'9432150483.0','1.0','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69.0','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(27,'967810348.0','1.0','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49.0','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(28,'991357001.0','2.0','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102.0','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(29,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(30,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(31,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(32,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(33,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(34,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(35,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(36,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(37,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(38,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(39,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(40,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(41,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(42,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(43,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(44,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(45,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(46,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(47,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(48,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(49,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(50,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(51,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(52,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(53,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(54,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(55,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(56,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(57,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(58,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(59,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(60,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(61,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(62,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(63,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(64,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(65,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(66,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(67,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(68,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(69,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(70,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(71,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(72,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(73,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(74,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(75,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(76,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(77,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(78,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(79,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(80,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(81,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(82,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','DIRECTO','SCORE C','1',8,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(83,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(84,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(85,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(86,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(87,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(88,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(89,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(90,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(91,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(92,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(93,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(94,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(95,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(96,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(97,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(98,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(99,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(100,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(101,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(102,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(103,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(104,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(105,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(106,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(107,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(108,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(109,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(110,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(111,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(112,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(113,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(114,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(115,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(116,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(117,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(118,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',NULL,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(119,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(120,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(121,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(122,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(123,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(124,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(125,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(126,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(127,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(128,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(129,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(130,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',60,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(131,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(132,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(133,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(134,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(135,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(136,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(137,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(138,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(139,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(140,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(141,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(142,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',61,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(143,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(144,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(145,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(146,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(147,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(148,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(149,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(150,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(151,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(152,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(153,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(154,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',63,1,NULL,2015,'',NULL,'2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(155,'996867686','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(156,'979864789','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(157,'975874897','1','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(158,'943215048','1','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(159,'967810348','1','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(160,'991357001','2','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(161,'996867689','1','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(162,'979864782','2','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(163,'975874896','1','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(164,'9432150483','1','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(165,'967810348','1','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(166,'991357001','2','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',66,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(168,'996867686.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(169,'979864789.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(170,'975874897.0','1.0','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(171,'943215048.0','1.0','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(172,'967810348.0','1.0','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(173,'991357001.0','2.0','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(174,'996867689.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(175,'979864782.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(176,'975874896.0','1.0','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(177,'9432150483.0','1.0','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(178,'967810348.0','1.0','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(179,'991357001.0','2.0','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',70,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(180,'TELEFONO','ORDEN','CLIENTE','IDCLIENTE','PRODUCTO','TARJETA','DEUDA TOTAL','DESCUENTO','DIAS MORA','CIUDAD','SEGMENTO','GRUPO','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(181,'996867686.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(182,'979864789.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(183,'975874897.0','1.0','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(184,'943215048.0','1.0','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(185,'967810348.0','1.0','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(186,'991357001.0','2.0','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(187,'996867689.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(188,'979864782.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(189,'975874896.0','1.0','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(190,'9432150483.0','1.0','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(191,'967810348.0','1.0','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(192,'991357001.0','2.0','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',71,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(193,'996867686.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(194,'979864789.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(195,'975874897.0','1.0','TOTO TERRY','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(196,'943215048.0','1.0','ALBERTO BEINGOLEA','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(197,'967810348.0','1.0','POLO CAMPO','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(198,'991357001.0','2.0','POLO CAMPO','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(199,'996867689.0','1.0','PITILLO BENAVIDES','41909034.0','VISA CLASICA','4457896457851660','9671.35','8634.75','36','AREQUIPA','DIRECTO','SCORE A','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(200,'979864782.0','2.0','PITILLO BENAVIDES','41909034.0','MASTERCARD ORO','5598676334682245','6789.45','5987.36','15','AREQUIPA','DIRECTO','SCORE A','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(201,'975874896.0','1.0','Cesar','67985478.0','AMERICAN EXPRESS','6689745898756981','1687.35','1168.95','67','AYACUCHO','INDIRECTO','SCORE C','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(202,'9432150483.0','1.0','Juan','88749235.0','PRESTAMO PERSONAL','00026987469','10369.48','9168.74','69','LIMA','NUEVO','SCORE B','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(203,'967810348.0','1.0','Carlos','77495678.0','CREDITO VEHICULAR','99647952658','32697.48','28367.14','49','AYACUCHO','DIRECTO','SCORE C','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00'),(204,'991357001.0','2.0','Ana','77495678.0','CREDITO HIOPTECARIO','99886974695','105369.45','94698.36','102','AYACUCHO','INDIRECTO','SCORE C','',76,1,NULL,2015,'','','2015-11-27 00:00:00','2015-11-27 00:00:00','4000-11-27 00:00:00','4000-11-27 00:00:00','4000-00-00 00:00:00');
/*!40000 ALTER TABLE `base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
INSERT INTO `calificacion` VALUES (1,'DI','Consulta en tramite'),(2,'DI','Contacto sin promesa');
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campania`
--

DROP TABLE IF EXISTS `campania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campania` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha cargada` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `estado` text COLLATE utf8_spanish_ci,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `troncal` int(100) DEFAULT NULL,
  `canales` int(100) DEFAULT '2',
  `timbrados` int(100) DEFAULT NULL,
  `htinicio` time DEFAULT NULL,
  `htfin` time DEFAULT NULL,
  `mxllamada` int(100) DEFAULT '2',
  `llamadaxhora` int(100) DEFAULT '25',
  `hombreobjetivo` int(100) DEFAULT '80',
  `archivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `supervisor` int(100) DEFAULT '1',
  `cartera` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`),
  KEY `supervisor` (`supervisor`),
  KEY `cartera` (`cartera`),
  CONSTRAINT `campania_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `campania_ibfk_2` FOREIGN KEY (`supervisor`) REFERENCES `supervisor` (`id`),
  CONSTRAINT `campania_ibfk_3` FOREIGN KEY (`cartera`) REFERENCES `cartera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campania`
--

LOCK TABLES `campania` WRITE;
/*!40000 ALTER TABLE `campania` DISABLE KEYS */;
INSERT INTO `campania` VALUES (8,'2015-11-04 22:37:59',8,'','Pastillas LSD',1,12,12,'01:00:00','01:00:00',12,12,212,'files/settings_yi1cy1I.jsonp',NULL,NULL),(9,'2015-11-04 22:42:44',8,'','Viagra',12,212,21,'01:00:00','01:00:00',2,21,213,'files/C6AILKT_UqlkwvU.json',NULL,NULL),(54,'2015-11-22 03:46:17',87,'','Los indecentes',NULL,1,4,'01:00:00','01:00:00',2,4,80,'files/Libro1_mWRao84.xlsx',27,NULL),(55,'2015-11-24 19:12:56',87,'','Sapos',NULL,12,4,'08:00:00','19:00:00',2,4,80,'joel_OsFnxNZ_1.xlsx',27,20),(56,'2015-11-24 19:14:32',87,'','Manitos',NULL,22,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_11fF7Dh.xlsx',27,20),(57,'2015-11-24 19:19:56',87,'','Robots',NULL,1,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_Shm6OuX.xlsx',27,20),(58,'2015-11-24 19:53:13',87,'','Borrachitos',NULL,22,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_HJHYlEc.xlsx',27,20),(59,'2015-11-24 19:53:53',87,'','Pata',NULL,1,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_oJXItpe.xlsx',30,20),(60,'2015-11-24 19:56:06',87,'','Ratoncitos',NULL,12,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_UUCyiBH.xlsx',27,20),(61,'2015-11-24 20:19:31',87,'','Gatitos',NULL,5,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_YslbsaK.xlsx',27,20),(62,'2015-11-24 20:34:17',87,'','Monitos',NULL,3,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_2OEslxC.xlsx',30,20),(63,'2015-11-24 20:34:46',87,'','Chanchitos',NULL,3,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_cNVElvq.xlsx',27,20),(64,'2015-11-26 15:55:36',87,'','Pinturas',NULL,2,4,'08:00:00','19:00:00',2,4,80,'joel_OsFnxNZ_1.xlsx',27,20),(65,'2015-11-26 17:17:04',87,'','Teclado',NULL,4,4,'08:00:00','19:00:00',2,4,80,'joel_OsFnxNZ_1.xlsx',27,20),(66,'2015-11-26 17:19:51',87,'','Peru',NULL,2,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_4NqoHCk.xlsx',27,20),(67,'2015-11-30 16:37:41',87,'','Mouse',NULL,2,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_1.xlsx',27,20),(68,'2015-11-30 16:39:15',87,'','Pool',NULL,2,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_1_XmnITdv.xlsx',27,20),(69,'2015-11-30 16:40:36',87,'','Huevos',NULL,12,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_6pDIwjd.xlsx',27,20),(70,'2015-11-30 16:42:18',87,'','PerulANDIA',NULL,3,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_ec2QQIy.xlsx',27,20),(71,'2015-11-30 16:49:00',87,'','Ola',NULL,2,4,'08:00:00','19:00:00',2,4,80,'files/plantilla.xlsx',27,20),(72,'2015-11-30 16:58:27',87,'','Prueba',NULL,34,4,'08:00:00','19:00:00',2,4,80,'plantilla.xlsx',27,20),(73,'2015-11-30 17:01:57',87,'','Chocolates',NULL,3,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_NxfCeEw.xlsx',27,20),(74,'2015-11-30 17:02:46',87,'','Zzzz',NULL,5,4,'08:00:00','19:00:00',2,4,80,'files/joel_OsFnxNZ_1_W9WNLL9.xlsx',27,20),(75,'2015-11-30 17:07:27',87,'','Lol',NULL,8,4,'08:00:00','19:00:00',2,4,80,'files/plantilla_okzjbkN.xlsx',27,20),(76,'2015-11-30 17:07:58',87,'','Peuroococ',NULL,5,4,'08:00:00','19:00:00',2,4,80,'files/plantilla_CJDlaTw.xlsx',27,20);
/*!40000 ALTER TABLE `campania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartera`
--

DROP TABLE IF EXISTS `cartera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartera` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartera`
--

LOCK TABLES `cartera` WRITE;
/*!40000 ALTER TABLE `cartera` DISABLE KEYS */;
INSERT INTO `cartera` VALUES (1,'Unique'),(2,'Saga'),(3,'Chifa Chaolin'),(4,'Restorant Don Gato'),(5,'Pilsen'),(6,'Nestle'),(7,'PeruVeloz'),(8,'Cartera'),(9,'ZzZ'),(11,'CcccCC'),(12,'Holaaa'),(13,'Sui'),(14,'Shaga'),(15,'Meitru'),(16,'Nestle'),(17,'Gloria'),(18,'Ford'),(19,'Nestle'),(20,'Backus'),(21,'Frecuencia Latina'),(22,'Totus');
/*!40000 ALTER TABLE `cartera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carteraempresa`
--

DROP TABLE IF EXISTS `carteraempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carteraempresa` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `cartera` int(100) NOT NULL,
  `empresa` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartera` (`cartera`),
  KEY `empresa` (`empresa`),
  CONSTRAINT `carteraempresa_ibfk_1` FOREIGN KEY (`cartera`) REFERENCES `cartera` (`id`),
  CONSTRAINT `carteraempresa_ibfk_2` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carteraempresa`
--

LOCK TABLES `carteraempresa` WRITE;
/*!40000 ALTER TABLE `carteraempresa` DISABLE KEYS */;
INSERT INTO `carteraempresa` VALUES (12,14,2),(13,15,2),(14,16,54),(15,17,54),(16,18,54),(17,19,53),(18,20,53),(19,21,53),(20,22,53);
/*!40000 ALTER TABLE `carteraempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `text` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,'Joelccc','OK'),(2,'Andres','Person');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_spanish_ci,
  `object_repr` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'agentebase','PeruCall','agentebase'),(8,'agentecalificacion','PeruCall','agentecalificacion'),(9,'agentes','PeruCall','agentes'),(10,'agentescampanias','PeruCall','agentescampanias'),(11,'auth group','PeruCall','authgroup'),(12,'auth group permissions','PeruCall','authgrouppermissions'),(13,'auth permission','PeruCall','authpermission'),(14,'auth user','PeruCall','authuser'),(15,'auth user groups','PeruCall','authusergroups'),(16,'auth user user permissions','PeruCall','authuseruserpermissions'),(17,'base','PeruCall','base'),(18,'calificacion','PeruCall','calificacion'),(19,'campania','PeruCall','campania'),(20,'cartera','PeruCall','cartera'),(21,'carteraempresa','PeruCall','carteraempresa'),(22,'data','PeruCall','data'),(23,'django admin log','PeruCall','djangoadminlog'),(24,'django content type','PeruCall','djangocontenttype'),(25,'django migrations','PeruCall','djangomigrations'),(26,'django session','PeruCall','djangosession'),(27,'empresa','PeruCall','empresa'),(28,'estado','PeruCall','estado'),(29,'filtro','PeruCall','filtro'),(30,'header','PeruCall','header'),(31,'mascara','PeruCall','mascara'),(32,'nivel','PeruCall','nivel'),(33,'nota','PeruCall','nota'),(34,'preguntas','PeruCall','preguntas'),(35,'resultado','PeruCall','resultado'),(36,'supervisor','PeruCall','supervisor'),(37,'supervisorcartera','PeruCall','supervisorcartera'),(38,'troncales','PeruCall','troncales'),(39,'troncalesagentes','PeruCall','troncalesagentes');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-10-06 22:26:11'),(2,'auth','0001_initial','2015-10-06 22:26:14'),(3,'admin','0001_initial','2015-10-06 22:26:15'),(4,'sessions','0001_initial','2015-10-06 22:26:16'),(5,'PeruCall','0001_initial','2015-11-23 21:28:41'),(6,'PeruCall','0002_auto_20151105_1501','2015-11-23 21:28:41');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `session_data` longtext COLLATE utf8_spanish_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('02xdpebne8808qeqbnj1c38s2kd86lmj','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('06cfpjdsrrnnt4nx6r2cnu8dls4htqv3','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('0bk4lvt0co46umvdfm17nvn39lbp6ujz','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('0fce48q15pwj0cci63fr0yfh4de28iqu','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-16 22:06:26'),('0kz8umjt0l3myjel8vuxxkkk8yyr2q3u','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('0mpstfaueiuecsg34s8kp5o6iksod3h6','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-25 19:02:55'),('1ltxrhcg2gzmo6ne3624fn9anfzgjwns','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('1o8an023snnjvhau9jcu4ijwhtuts3ue','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('281w5olp4q1uehm4qsvm6625jpgs1r63','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('29j8yl4md6ft0etgq91ovcv88zfyout8','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-10-21 19:18:30'),('2dm7rpd6zeccg8ev0xmeawes0rk12abg','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('2g2g46h1jzmxqcx5hikpleo6vwbdyz59','ZWQzNTY4Zjk4ODk0ZTA1MWI5NTY5OGUzNzgwYTlhYWU0YzI1ZGUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwNWM3ZDRiMGU3ZGE5ZTk2MzgxOWY1ODFmNjFiMTYzOGIxZDQwNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9','2015-11-21 21:53:42'),('2h61thv6pj9hq4hyg4pyw4r2y39oo9ig','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('2vxh0g2hahnhe0yiprn38m4c6vwtroip','YjFhMTZjYjRiOTc5NWI1MWNjYTA0NmNjNmMzZGFjZGUzMDNkOTk3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3MzAzN2I3NWI3NjdjZGRiY2FkNmY1NDIyZjZmMTA0ZGNiZDc0Y2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg3fQ==','2015-12-15 16:20:22'),('35626e0fcxe99irl9j353572hxmgatrg','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 06:16:04'),('3xdiemqd1xfustrdzew2u5s7wf4nvntd','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('3zvkp8otkdakuziqnjvsxixa37pkrd1o','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('423h8qd3j7rudhymf7jlybkkb9dtwhht','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('4fwlmzj4lk0jvglr8ocm9utdqw9q43v6','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-15 15:16:02'),('4jh970jv60sbmfsje08kgqanbjhdlsao','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('4luz9i2899ekr3qlhms73q99qnwcjyyy','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('4p1vf5iqjplw7peybfxkf7dzcsp8mr9t','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('4vghq88lobgyz5v9ycyide41l4b61yu9','OWYyOGVmYWM4MTYyYzQ3YTM1NDRlMGI4ZjQ1NmIyOTE3NTczZDBjNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI0NTkxZjU1NDI4NWJmNTNlMzMxMGNhN2ExMTk1YWZlNTMwMzRjMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwMX0=','2015-12-13 15:45:31'),('526efowdvc3q377j3yt2h2ljrkt66fz4','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:03'),('5qol3f4na76wva2bpsocpfc8gk5d75y8','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('610gfxxb6siwf1al8mepb8trvj78lh6k','YjFhMTZjYjRiOTc5NWI1MWNjYTA0NmNjNmMzZGFjZGUzMDNkOTk3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3MzAzN2I3NWI3NjdjZGRiY2FkNmY1NDIyZjZmMTA0ZGNiZDc0Y2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg3fQ==','2015-12-06 02:44:58'),('64prnvp6kylbqusw0z82b8ba6xchfth5','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('67ct0ugg1zawi1nux9sbeyin1yq4ysvq','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-02 23:24:58'),('6gp0loobn8klno5mwzth4szxyowa87tg','YjFhMTZjYjRiOTc5NWI1MWNjYTA0NmNjNmMzZGFjZGUzMDNkOTk3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3MzAzN2I3NWI3NjdjZGRiY2FkNmY1NDIyZjZmMTA0ZGNiZDc0Y2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg3fQ==','2015-12-15 15:07:23'),('6t3sb3ehvnr1e4vkdxtqujh7delus3nc','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('6wufkjqmi0mwqxsyfirzielfuc9cs6xy','ZThkZjQ3ZmFjZDA3ZjU0YjAzOWU5YzI1YWVhYmYzZmZlODQzNDU1Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9','2015-11-20 23:25:11'),('7d56y1is3q5s6jd6aiyup9baiaid5fi8','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('7u2zqgk9ydi2k7u19g3i9122vxzuxwg0','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('7yxvdyutyeibwimhywt9fqxjqehmqrz0','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-25 19:19:03'),('7zcwkcrr4dw05qjwbeova31rfzijp8s8','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-18 23:24:06'),('866urwb5ffkhuikqk94hxm4lmh1jdh2a','NTJhMTE5YjNlMGJjZDhlZDM2MzRmNDg1ZDU3NmM0NTc0MDc5MDMyYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhZWVjNWUxMTA2M2YwMWMzYjlkMmM5NzEyNWMzNWFiZDhmOWY3OTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-17 21:52:01'),('8kv11mw5azdgrhohuefcpd77ah2g6xwh','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-13 23:52:52'),('8l9dvflerje4xpz7xutugza5m3qjbd0i','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-26 01:50:03'),('8n8hpwtf6ct8wuiznrgd0szvhvcpiuwe','MjU2NjdhMmFiM2ZhM2Q2ZDkzMTRhMmQzMDRhMmE3MDIzNzJkM2M4MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM0OGI5MTQxZDY3YmJiOWVlOGNlNzEzZDhjM2JjMDM0YTFkMzY3M2MiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwfQ==','2015-11-19 00:29:32'),('8nundvuom24vt22yddi3yjczdr6ucvbn','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('8xzjpbj9y8y6y7pwdtdnpmn1bgkhp95g','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('8z8nn1n3jl2vvq6oaumykgs8ip11s6y6','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('91tnl9c7lwy5z4z7uouuumku7db154xo','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-16 22:06:04'),('921lcob7h4kez4w2gi7yimvb9ub7w7ux','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-16 14:29:34'),('9f9km568gfl295wio2su96y9vzipghxe','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-18 21:26:18'),('9fhs5inh8orx62zasmw9x6rp4zb2qgft','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('9fzrl1y792cj0nunhoen2oipna2nghum','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('9nuueboryl9pc3gnrr0hlbhr4ai2j1xi','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('9s9fk1xv4bgxnp7lyd5ffqjtfz9stmut','OWNiMjczZWNkNDRhOGUxM2Y2NDIxYzhhMjVkNzk4NzQwOGNlYjRiMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2NGMwMmEzOWQ3ZjY3ZTNhMGVkNjYxYWM1Y2VjNDYyNGUwMzFiZjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg2fQ==','2015-12-11 15:04:59'),('9vykkqqmb82ahsebtz5nq5ts2u4vs2j6','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 14:19:15'),('a04im99fvwywnbrgz16bu1d43e9bfk18','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-26 14:29:13'),('agcwy5gi32urc6k5g0eqq6cfhxgfoyce','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 06:20:01'),('aq80pqdtc0ntp99v5vme1ydci1u7rmc6','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('ar4nuhbqhnd607ay9wpmcjgcbd7vy2n0','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-18 23:57:09'),('argekjl8fuusvxtrf1qncd4yu0lailh3','YjFhMTZjYjRiOTc5NWI1MWNjYTA0NmNjNmMzZGFjZGUzMDNkOTk3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3MzAzN2I3NWI3NjdjZGRiY2FkNmY1NDIyZjZmMTA0ZGNiZDc0Y2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg3fQ==','2015-12-17 17:57:30'),('avm42r87o5ofgesmst9nnvsw3xyd257x','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('aw6hyg7gke8dmzx7dix62kd7b6wpqfe0','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('b254dsjgo288wj746l7fzr134ij8eek5','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('b4m1t50g4zbm5lr42wkt6c3c2dk6e3ra','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-30 16:43:31'),('b5v1c5p6yziylkyi4m408xvvjvj24qld','OWYyOGVmYWM4MTYyYzQ3YTM1NDRlMGI4ZjQ1NmIyOTE3NTczZDBjNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI0NTkxZjU1NDI4NWJmNTNlMzMxMGNhN2ExMTk1YWZlNTMwMzRjMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwMX0=','2015-12-13 17:18:55'),('b9e0x6ignp8sscxp7562oi3f448hqbpg','YjNiOWE5ODA0OTIwZDA0YmI5NGE5MWY5OTUxZTUzZTczNmEzN2VjNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjczYTM3MDIxMmMxZjZmNTZhMjI2ZmIzMzEwMDg2OTI0MWEyNzBhNzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwfQ==','2015-11-26 19:44:06'),('bvni428qke6en6tn9dstx6j9alzv5l1q','ZWQzNTY4Zjk4ODk0ZTA1MWI5NTY5OGUzNzgwYTlhYWU0YzI1ZGUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwNWM3ZDRiMGU3ZGE5ZTk2MzgxOWY1ODFmNjFiMTYzOGIxZDQwNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9','2015-12-02 20:19:57'),('c29ohwm310ikwsjjr4wqt2gs55o6lsem','YjFhMTZjYjRiOTc5NWI1MWNjYTA0NmNjNmMzZGFjZGUzMDNkOTk3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3MzAzN2I3NWI3NjdjZGRiY2FkNmY1NDIyZjZmMTA0ZGNiZDc0Y2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg3fQ==','2015-12-13 14:03:42'),('c6mmx3ce8tvioi18t20jsbib9zel5ti7','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('c82des4a2vrqe31jdo3sr3s0afedr3c9','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:03'),('chc6m6r64vo4ip9ck02zvlux41pxwp4q','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-27 18:04:59'),('cldpxp0cw9150hdgt71wl97evrte9gta','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:18'),('d0xgwjwdm26fx3ib1r4zyaidpsu1e3ad','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:17'),('d1alhesy57y8clnss7smc47yoni6rqvg','NTJhMTE5YjNlMGJjZDhlZDM2MzRmNDg1ZDU3NmM0NTc0MDc5MDMyYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhZWVjNWUxMTA2M2YwMWMzYjlkMmM5NzEyNWMzNWFiZDhmOWY3OTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-14 17:47:20'),('d1yi2cyzs47ruu1em9g23zh2z54yylyy','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 06:13:39'),('d6fyplo61blhv8imoe2yl50119ynk6hw','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:58'),('d8s5co329ylugpkfja237g5je054577v','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-22 16:31:20'),('dd3mzcm7drxhscasz433g0k3rmf3cfas','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-15 15:16:02'),('dxj37qhrpdh5ylcl4kdduyyw1kjszfvf','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('dz5wjdgwceizbgl923v2ymfqd5byi3yb','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:18'),('e01nefuj7vmqidj3p40ahivtv8zmkpk2','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('e1znsdf4rdkamywmn2afws23mk6zvndl','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('em6ateyn8xxa7uk9pwh60smoejgngvdm','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('enffzmiz5s3ggfndxrcs6u7q9ch25d4v','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('eped0kajmu5b7ev9c3r3rvvse0udv7us','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('f6ad8xoo5ctu5q42bmj2weovo8vpi9e3','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-27 19:01:15'),('f8l10hkjfm14bhfb3jtu8q9paujy8g5j','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('flkfkduskoxykx4l579ysmsu4afbymdu','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 15:16:29'),('fmfq6h5vxdbjnuctrvpnpv516krw4qqo','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-19 01:44:40'),('fnq6rzq1jcgtoqteahug71eis7mj82js','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-02 23:14:17'),('frnt1k6x2qiarb7kr94wx92v6dw64ctl','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-15 15:16:02'),('ftyiqyare2p6g6yrewk4dz7e21c7prxt','MjlmYzc4Y2Q5N2E5Njk0YjU4NzkzMjI5ZmFkYjkzNTEyMWRlNGU3NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImNjMTk5MzFmZDRlNDQ1YzNiNDAyMGFlOWY2YjFjMTlmZjViNzI0YmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-10-26 15:20:38'),('fuxm8u2rhvo4a7ciwqnumdl6c5sb2znq','OWNiMjczZWNkNDRhOGUxM2Y2NDIxYzhhMjVkNzk4NzQwOGNlYjRiMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE2NGMwMmEzOWQ3ZjY3ZTNhMGVkNjYxYWM1Y2VjNDYyNGUwMzFiZjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg2fQ==','2015-12-06 01:48:35'),('fy204wjlx1tkf32r9ikpl6jnummnnu6g','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('g0bufkain49swbl9ds8re5vdh9ss1xi1','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 06:19:34'),('g7bo2aywt6ju4xb5bn0bsyyawxr7o1yd','ZWQzNTY4Zjk4ODk0ZTA1MWI5NTY5OGUzNzgwYTlhYWU0YzI1ZGUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwNWM3ZDRiMGU3ZGE5ZTk2MzgxOWY1ODFmNjFiMTYzOGIxZDQwNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9','2015-11-17 17:36:50'),('ghb3omhqvzez5blcqlcto24jefpxmjhe','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-10-20 23:07:19'),('gsw61vccdvezhbvg396zx9rljwlhlw7j','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 14:02:47'),('gyrwzlz3uxxghpdnbz2wmr85t5tp34hw','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('gzpvm2gdk1atbc8w8fem5e7wl4oaxbrk','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('gzuq06v5rrq8c587ybd0kqkyhcqyowyi','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('h56cb3pvbjgj2teofqlo126x9mktkihj','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-04 17:55:16'),('ha34u7391f8pulgt7f102z3j06d5lgne','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-20 21:57:48'),('hejjhmfd6xom1lw81zdfbzue2xy9nb4y','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('hoemtokrev4y2dtyj5bpq9rbmnqe4hwe','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('hszdla47r6989etjz5nmnpy1akilwjtd','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('ht66u4xxi3sh28vc8mcy753oey8qpmyi','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-15 15:16:02'),('hxh96ipc82us9hw17fnm6gsnkhk5i8xs','ZWQzNTY4Zjk4ODk0ZTA1MWI5NTY5OGUzNzgwYTlhYWU0YzI1ZGUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwNWM3ZDRiMGU3ZGE5ZTk2MzgxOWY1ODFmNjFiMTYzOGIxZDQwNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9','2015-12-02 20:35:55'),('i47wc2ky7y95j9b0em6bzwatz76c3fhf','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('i4kx5ksiozmhlqd2cf2stdf75bngew5t','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-02 22:39:27'),('ibl2lyke0pa9m3m4nh52nx3h8wgfyyvv','MTI0OWMyOTAzMTlhNTcxY2M5OWM2YjVjMWFlOThjYjc5ZTZhMDA5NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImNiMjk3MzQxNDMzNjhiYWFlZDNiMDE1NjI5MzI5NGZhNDNiMTUxNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg5fQ==','2015-12-09 16:47:17'),('icwj9fl5q4s112kmbujecum2i9em66nx','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 14:19:15'),('igdf6phmtv5leidkthwp2yuich2pdxzw','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('io6f0gw2h3cr8s73ylptln8xl2uvls4d','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-20 21:40:57'),('iw51oo0og7php6oywp5gbcbk7u4j3iqg','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-26 17:02:07'),('iwuxs1kjolxvhj0ytpbgvhkc0be0mo8x','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 15:16:29'),('j0m02f3ep5e1nwbhb64x6ly825fbtrod','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:03'),('j47y3sofe2o6izl0kbddyjk55zruy816','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 15:16:29'),('jdyq31ss0hdtggeqloua1j0ifhrd9cz2','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-25 19:32:25'),('jpamjnqbvqk77fsy04pfmfb19hjfguxg','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-13 23:52:53'),('jsm1lkh51lxkatyuz205t0h0ryxx62ep','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('jxfjv7955s0yqbo2lh9jlonpu02m5fpa','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-15 18:54:56'),('kbgbn8es4peuess9xeosl9d4taydhpxm','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('kl7qx4rvxqbu66cs2l33u3bvnydp0m9g','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('kzf1rjkk7blrtwe1rt2qdzwct2q68spv','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:58'),('kzxsnokdh15mtk6zwb4mr94fpl835f29','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('l5gc0kg44uii913enfviqydk943lhu0a','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('ldvtpi6c0qrvojdouh9jnnyi0eaypoyp','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 14:19:15'),('lznqy9l0eosbophh6vwz6o008gmhva7w','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 15:16:29'),('magwioh99ctkagrd00s20vow6nhfe3hv','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-16 22:05:21'),('mhr71p29j9cxzryt5h20vxk6b8aiv8rc','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('mmwp4u0x9cgqc7c1psjz6v79uwbr1rex','OWYyOGVmYWM4MTYyYzQ3YTM1NDRlMGI4ZjQ1NmIyOTE3NTczZDBjNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI0NTkxZjU1NDI4NWJmNTNlMzMxMGNhN2ExMTk1YWZlNTMwMzRjMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwMX0=','2015-12-13 16:13:50'),('mrtie5914ndxzj5qd9e311v1rxty33qx','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('n3vgzuxjralrwod3be3le3vtq89g5etq','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('n6py4e909oo2fbytrrp5ptl5710uc7u6','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:58'),('n90flxfib781e8hzq9mqu0mo2i57rbwn','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-03 05:09:44'),('nh267kuuizprm1vyzom0xebphaf0opm4','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:58'),('nj2v08gxjfqiwuw6gxg0ffn5gqjbcnlq','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 15:16:29'),('nltj2wcewx1ue2cgwqe8tduc07n8obzb','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('ntgd0g2vhrmu1h0la1qswoy4peksuxnh','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('o69andh43skvc1dmyycw8qirwj4uqpyu','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-13 23:52:44'),('o6udc4og3fgqyv3ivkfrksz2kz724j5s','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('oplik0kaxp5bc714xq870dv86i6langb','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-02 16:26:44'),('or8hee7bu4vvjodvp26wsrahzhxfz2gn','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-12-03 16:10:52'),('p0vyzdnq7zd6tg3nw21ilyimsr28c49m','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-14 00:43:11'),('p3kjwm7j8r47o81iw0kwanjzahirpcnm','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:58'),('paiq90d4eataknkudduyx0qmf6rjdbuh','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-12-02 22:28:24'),('pbwsfx1ra29xnehl7d7031pltmwq7by3','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('phmqbr6gstsveyzl7ki2gbwz7d13rcq3','NTljMzVkOTBlNjc3NTEwZTljOTkyODdlMzM5NmMxZTcxZmU4ZDYxZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-11-10 20:54:01'),('pjfnrdb9ce3htf9eqmqigx0dnvoo8ua8','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('ponbr70p8hposos6utkjp2n7eihndab9','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-03 18:27:56'),('pq74gxddamen867fqd620wfo36euqn59','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-03 14:53:03'),('ptn3axpvneb3y5n9j08gumwim5woz11q','ODU0NmU4NjA3ZjdmZDkxMGNhNTU3YTc2OWNhYjYyNGRjMjRjNDg1Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=','2015-11-20 23:28:48'),('pul3b3p55dnk2d7firo7yzvju0bma1i0','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('pyyibhto3cf4t931d4bspl0ecqniuc07','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('q2pwhpqm8yfiykyyutwvje17wiv67e0u','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:18'),('qbgq6smf9u05xhdmnsy9qjyea40js9ar','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('r1e5vfdcrqfrzxccjmh08fz2kae7c938','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('rptig3snmsfn1vyoauqawb1ox79i96zx','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('ru7a3d5ks2qktmtsnr0fsn8ij485jsov','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 14:19:15'),('s1zgqmpgz1vedr5muuqdt3cfs2qd4c2h','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('s5gzaet8hd91ib1lht44etk8o1pg7s48','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:57'),('s64p635q7z2gzidegc8h2eduee2hhfg4','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-19 01:38:30'),('s6jkh3rv1rll0pjikl29jz889cfkh5an','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-02 18:34:42'),('s7wrdzvfs080czi4bjsw5ezbruymjwyj','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-14 00:06:24'),('su04hyo0w34aqdntjfz2nougi3by0qpm','YjFhMTZjYjRiOTc5NWI1MWNjYTA0NmNjNmMzZGFjZGUzMDNkOTk3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3MzAzN2I3NWI3NjdjZGRiY2FkNmY1NDIyZjZmMTA0ZGNiZDc0Y2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg3fQ==','2015-12-11 22:26:24'),('t6kr739l45uoh4dxtc6459vjkdcydhpv','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-05 20:43:43'),('tgu2qjv8y99iyyylo1mnp18hlri2nfo8','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-21 19:21:47'),('thkitz875pc9sxfppgiyrs5vn6u399s3','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-27 02:27:44'),('trelgsy5mfm2439furc0awvn0mpfeibh','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-25 04:31:02'),('tu49ah3nzg7hxftt5wjnbs4lx8xalvy6','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-11-18 00:11:27'),('u3jh2d0wyg2tnsd0weio94nu7jrk9ke9','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('u58nkm4l9gwoghrd4aorlw2eb6o8q2hp','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-12-02 20:23:56'),('u8l68n5eyb2qt3kzdhxez9orrf37fy33','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:00'),('uz1o4qao9u7ce06wa6c1ez86sp2mmsj3','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:18'),('vgommx2wf9igvpt53ms11d12nir0o9km','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-10-26 16:45:45'),('vi0n0cdkucww8ibjgwlp3xgqrtxbe3hw','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-20 21:50:18'),('vsdcpgidhcjoywhawotg0fyp6ust1swi','YjFhMTZjYjRiOTc5NWI1MWNjYTA0NmNjNmMzZGFjZGUzMDNkOTk3ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3MzAzN2I3NWI3NjdjZGRiY2FkNmY1NDIyZjZmMTA0ZGNiZDc0Y2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjg3fQ==','2015-12-14 16:36:47'),('vx7a2324fhafhulg5o1mj0dfylel3q9y','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('w3saec9y3q14rypygcxk3dew5m2vposy','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('w5npffosc39o7gvng0p67bqzrntxmgrv','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-27 01:24:15'),('w9pp8ra4dsjnu4yoc7bgp8y4ktbemqhn','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:17'),('wb55katxsmqxc11igh2p9u7neax8mtlp','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-24 16:56:41'),('wcez316ia1pnkcmujeitf36r0snprfn0','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:17'),('wh8l3cip9fmrk406ih1ctnwk4asr8o74','NzE5ZWNmODBmNmFhNzJkYWYwNWUzMzgxMzEyOWZkODhhMDhmMzZlNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMWIyODMyMjBiMWU1MjllNWM0M2Y5MTNhOWU0OGRlZjJmNmRkOTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjk4fQ==','2015-12-13 20:51:41'),('wmrnfsbgrkbj4v527wc0ok8cnodpgx4r','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 14:19:15'),('wouj5o11jbllpuq4q6xhlfjzekt9pw3h','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-15 15:16:02'),('wuej0egr7lcbal884aazivnwtxyz9xft','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-25 19:36:37'),('wwr0yn8r7tx97ylkc78s8h1fuzodwtwj','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('wyzynxvoqocpsxxd98s7qc2ifmjlk322','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('x8ebvg2o80h6r7vjm7x89hxc6vp3z544','ZWQzNTY4Zjk4ODk0ZTA1MWI5NTY5OGUzNzgwYTlhYWU0YzI1ZGUwMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwNWM3ZDRiMGU3ZGE5ZTk2MzgxOWY1ODFmNjFiMTYzOGIxZDQwNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9','2015-11-20 18:57:08'),('xc2g0eetutmihkkdb38dx654qcvgb8h6','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:02'),('xd1r9oolfqgxdqc0c56hpx2tuv9vnpvw','NzE5ZWNmODBmNmFhNzJkYWYwNWUzMzgxMzEyOWZkODhhMDhmMzZlNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiMWIyODMyMjBiMWU1MjllNWM0M2Y5MTNhOWU0OGRlZjJmNmRkOTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjk4fQ==','2015-12-14 02:28:13'),('xrgf3fx9udlu9xp3z0se7bmlqq049tro','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-20 21:51:40'),('y1tx1w7l04yzmjznvjn1lps7phbkjwob','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 19:15:08'),('y5wyesbjluto9cngi94hkb6xmacmpdm3','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-12-03 17:48:17'),('ybi2zqdm55hcl8oww3pdlpsg48ppddzl','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-16 21:57:16'),('yf7m55hhk3rqrupj5yl3jpco3f526abi','NmFmZWJlZTgwNWJhNjc5ZTYxNWEzN2ZlNDliYWVmOTJiOWQ1ODMyMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiZjEyN2YzOTQ4YThmMDY3YjE5ZjlmZGU3ODMzZjA5YTdmMDNhZjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjh9','2015-12-03 04:16:23'),('yftxx5lhg2uu5anokjoe7fxddbd99k23','Zjg3YzUwZTk4NTgyM2JjNTc5YmVhMzA4Y2U5MDRhOGJiYjU1NWZiZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFkYmYxYmIwNmI1ZTc0ZmNiYmNkMzQxMzc2ZmM2MmViMWEzZDg0OWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2015-11-27 14:35:28'),('yqcai39kdnw3w2o7fox64dv0lta83l34','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('z4e99tulhwq0xxi5den9m9ibekdz0qud','MzFjNzUwZmI2M2QzY2NjZTM4NmMzNDVkNDNmNTMwMDUwNDM5MWI2Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlY2YyMmZiZWFlZTIzZTMyMGU3YjJmMzUxMjljMGQ2ZGU4ZjJkOTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9','2015-10-26 16:42:03'),('z4ei0cs5itrg35m992ch2ajnfgl7kofz','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('z8b4wmu357frb92m3qkn2pb9ogbxswtu','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 14:19:15'),('zgkv7pf5w9sl3m7fcf1vonw18h4cwnxb','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-13 15:45:18'),('zkukknhp0ln9uvflrctr0cj59ttvaazm','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:04:59'),('zoaaja4bffs7cukfpnl52siyxp19g60i','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-10 14:55:03'),('zrdgbwhj1lm4vlffgi112y3jwmc8tuh0','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-12-14 16:05:01'),('zyu818pkxynd68s0orgi4kfbajsk544j','YWZlNjBiNGEwMjZmMzA4ZjBkM2MzYWE3MjJjNThlZDEwMjRmYTgxMTp7fQ==','2015-11-19 15:35:00');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `contacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `licencias` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `mascaras` int(100) DEFAULT NULL,
  `telefono` int(100) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mascaras` (`mascaras`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`mascaras`) REFERENCES `mascara` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'PeruCall','','','',1,0,''),(2,'Mego','3232','3232','434',1,12121,''),(3,'PeruCall','2121','joelr@neho.com','121',1,121,''),(46,'Mego1','232','joel222@gmail','1',1,333,''),(47,'Unilab','123','joel@gmail.com','1',1,123,''),(48,'pcall','jnapuri','jnapuri@pcall.com','30',1,999988887,''),(50,'Princo','13','joel@gmail.com','1',1,1234,''),(53,'Brujitas S.A','121','brujitas@gmail.com','1',1,45698697,''),(54,'Xiencias EIRL','235235','admin@mail.xiencias.com','100',1,6409521,''),(55,'Mascaras','121','joel@gmail.com','121',2,121,''),(56,'Crystal','121','joel2@gmail.com','1212',2,21212,''),(57,'Samsung','wq','joel3@gmail.com','212',2,1212,'');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'No Login'),(2,'En Espera'),(3,'En Llamada'),(4,'Descolgado'),(5,'En Pausa'),(6,'En gestion');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtro`
--

DROP TABLE IF EXISTS `filtro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filtro` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `campania` int(100) DEFAULT NULL,
  `ciudad` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segmento` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `grupo` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `resultado` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campania` (`campania`),
  CONSTRAINT `filtro_ibfk_1` FOREIGN KEY (`campania`) REFERENCES `campania` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtro`
--

LOCK TABLES `filtro` WRITE;
/*!40000 ALTER TABLE `filtro` DISABLE KEYS */;
INSERT INTO `filtro` VALUES (31,9,'Arequipa/Ayacucho/','Indirecto/','Score B/','Contacto sin promesa/Dificultad de pago/',1),(32,8,'AYACUCHO/LIMA/','u\'SCORE A\'/u\'SCORE C\'/','NUEVO/INDIRECTO/','Contacto sin promesa/Dificultad de pago/',1),(33,8,'AYACUCHO/LIMA/u\'AREQUIPA\'/','SCORE C/u\'SCORE A\'/','DIRECTO/NUEVO/INDIRECTO/u\'DIRECTO\'/','Contacto sin promesa/Dificultad de pago/',1),(34,8,'LIMA/u\'AREQUIPA\'/u\'AYACUCHO\'/','u\'SCORE A\'/','NUEVO/','Contacto sin promesa/Dificultad de pago/',1),(35,8,'AYACUCHO/LIMA/','u\'SCORE A\'/','DIRECTO/','Contacto sin promesa/Dificultad de pago/',1),(36,8,'AYACUCHO/','u\'SCORE A\'/','DIRECTO/','Contacto sin promesa/Dificultad de pago/',1),(37,8,'LIMA/','SCORE C/','NUEVO/','Contacto sin promesa/Dificultad de pago/',1),(38,8,'LIMA/','SCORE C/','DIRECTO/','Contacto sin promesa/Dificultad de pago/',1),(41,8,'u\'AREQUIPA\'/','u\'SCORE A\'/','NUEVO/','Contacto sin promesa/Dificultad de pago/',1),(43,8,'LIMA/','u\'SCORE A\'/','INDIRECTO/','Contacto sin promesa/Dificultad de pago/',1),(45,8,'AYACUCHO/','u\'SCORE A\'/','NUEVO/INDIRECTO/u\'DIRECTO\'/','Fallecido/',1),(46,60,'AYACUCHO/LIMA/','SCORE C/','DIRECTO/','Fallecido/',1),(47,61,'AYACUCHO/','SCORE C/','INDIRECTO/','Fallecido/Consulta en tramite/Contacto sin promesa/Dificultad de pago/Acuerdo con fecha de pago/Reclamo Institucion/',1),(48,61,'AYACUCHO/','SCORE A/','INDIRECTO/','Fallecido/Consulta en tramite/Contacto sin promesa/',1),(49,61,'AREQUIPA/AYACUCHO/LIMA/','SCORE A/SCORE C/SCORE B/','DIRECTO/INDIRECTO/NUEVO/','Fallecido/Consulta en tramite/Contacto sin promesa/Dificultad de pago/Acuerdo con fecha de pago/Reclamo Institucion/',1),(50,61,'AREQUIPA/AYACUCHO/LIMA/','SCORE A/SCORE C/SCORE B/','DIRECTO/INDIRECTO/NUEVO/','Nuevo/',1),(51,63,'AREQUIPA/AYACUCHO/LIMA/','SCORE A/SCORE C/SCORE B/','DIRECTO/INDIRECTO/NUEVO/','Nuevo/',1),(52,63,'AYACUCHO/','SCORE A/','DIRECTO/INDIRECTO/','Nuevo/',1),(53,63,'AREQUIPA/AYACUCHO/LIMA/','SCORE A/SCORE C/SCORE B/','DIRECTO/INDIRECTO/NUEVO/','Nuevo/',1),(54,8,'u\'AREQUIPA\'/','SCORE C/','DIRECTO/','Nuevo/Reclamo Institucion/Acuerdo con fecha de pago/',1),(55,76,'AREQUIPA/','SCORE C/','INDIRECTO/NUEVO/','Ya pago con boucher/',1),(56,76,'LIMA/','SCORE C/','NUEVO/','Msj Tercero(Si vive/labora)/Msj Tercero(No vive/labora)/Tit.desconocido/ Mudado/',1),(57,76,'AYACUCHO/','SCORE A/SCORE C/SCORE B/','INDIRECTO/','Msj Tercero(No vive/labora)/Tit.desconocido/ Mudado/',1),(58,76,'AREQUIPA/AYACUCHO/LIMA/','SCORE A/SCORE C/SCORE B/','DIRECTO/INDIRECTO/NUEVO/','Tit.desconocido/ Mudado/',1),(59,76,'AYACUCHO/','SCORE A/','INDIRECTO/','Msj Tercero(No vive/labora)/',1),(60,76,'AYACUCHO/','SCORE C/','DIRECTO/','Msj Tercero(Si vive/labora)/Msj Tercero(No vive/labora)/',1),(61,76,'AREQUIPA/','SCORE B/','DIRECTO/','Msj Tercero(No vive/labora)/',0);
/*!40000 ALTER TABLE `filtro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `header` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `campania` int(100) DEFAULT NULL,
  `statusa` varchar(100) DEFAULT NULL,
  `statusb` varchar(100) DEFAULT NULL,
  `statusc` varchar(100) DEFAULT NULL,
  `statusd` varchar(100) DEFAULT NULL,
  `statuse` varchar(100) DEFAULT NULL,
  `statusf` varchar(100) DEFAULT NULL,
  `statusg` varchar(100) DEFAULT NULL,
  `statush` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campania` (`campania`),
  CONSTRAINT `header_ibfk_1` FOREIGN KEY (`campania`) REFERENCES `campania` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES (1,76,'PRODUCTO','TARJETA','DEUDA TOTAL','DESCUENTO','DIAS MORA','CIUDAD','SEGMENTO','GRUPO');
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascara`
--

DROP TABLE IF EXISTS `mascara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mascara` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascara`
--

LOCK TABLES `mascara` WRITE;
/*!40000 ALTER TABLE `mascara` DISABLE KEYS */;
INSERT INTO `mascara` VALUES (1,'Interna'),(2,'Externa');
/*!40000 ALTER TABLE `mascara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (1,'Administrador'),(2,'Supervisor'),(3,'Agente'),(4,'Manager'),(5,'Monitoring');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` VALUES (1,'bueno'),(2,'malo'),(3,'muy malo'),(4,'muy bueno');
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(100) DEFAULT NULL,
  `respuesta` varchar(100) DEFAULT NULL,
  `empresa` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa` (`empresa`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (7,'fgf','gfg',NULL),(8,'ewew','ewe',NULL),(9,'Cuantos años','Usted tiene',NULL);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado`
--

DROP TABLE IF EXISTS `resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultado` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
INSERT INTO `resultado` VALUES (1,'Fallecido','BA','GNU'),(2,'Consulta en tramite',NULL,NULL),(3,'Contacto sin promesa',NULL,NULL),(4,'Dificultad de pago',NULL,NULL),(5,'Acuerdo con fecha de pago',NULL,NULL),(6,'Reclamo Institucion',NULL,NULL),(8,'Refinancia/Convenio','DI',NULL),(9,'Renuente/Rehuye','DI',NULL),(10,'Ya pago con boucher','DI',NULL),(11,'Tit.desconocido/ Mudado','IL',NULL),(12,'Msj Tercero(No vive/labora)','IN',NULL),(13,'Msj Tercero(Si vive/labora)','IN',NULL);
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (27,87),(28,91),(29,92),(30,93),(31,94),(32,95),(33,102),(34,103);
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisorcartera`
--

DROP TABLE IF EXISTS `supervisorcartera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisorcartera` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `cartera` int(100) NOT NULL,
  `supervisor` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cartera` (`cartera`),
  KEY `supervisor` (`supervisor`),
  CONSTRAINT `supervisorcartera_ibfk_1` FOREIGN KEY (`cartera`) REFERENCES `cartera` (`id`),
  CONSTRAINT `supervisorcartera_ibfk_2` FOREIGN KEY (`supervisor`) REFERENCES `supervisor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisorcartera`
--

LOCK TABLES `supervisorcartera` WRITE;
/*!40000 ALTER TABLE `supervisorcartera` DISABLE KEYS */;
INSERT INTO `supervisorcartera` VALUES (81,20,27),(82,19,27),(83,20,28),(84,22,32),(85,21,32),(86,20,32),(87,19,32),(88,22,30),(89,21,30),(90,22,33),(91,21,33),(92,20,34);
/*!40000 ALTER TABLE `supervisorcartera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troncales`
--

DROP TABLE IF EXISTS `troncales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troncales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troncales`
--

LOCK TABLES `troncales` WRITE;
/*!40000 ALTER TABLE `troncales` DISABLE KEYS */;
INSERT INTO `troncales` VALUES (1,'People'),(2,'ThinIP');
/*!40000 ALTER TABLE `troncales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troncalesagentes`
--

DROP TABLE IF EXISTS `troncalesagentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `troncalesagentes` (
  `id` int(100) NOT NULL,
  `empresa` int(100) NOT NULL,
  `troncal` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa` (`empresa`),
  KEY `troncal` (`troncal`),
  CONSTRAINT `troncalesagentes_ibfk_1` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`),
  CONSTRAINT `troncalesagentes_ibfk_2` FOREIGN KEY (`troncal`) REFERENCES `troncales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troncalesagentes`
--

LOCK TABLES `troncalesagentes` WRITE;
/*!40000 ALTER TABLE `troncalesagentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `troncalesagentes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-04 15:25:37
