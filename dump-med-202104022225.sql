-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: med
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `appointments_for_tomorrow`
--

DROP TABLE IF EXISTS `appointments_for_tomorrow`;
/*!50001 DROP VIEW IF EXISTS `appointments_for_tomorrow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointments_for_tomorrow` AS SELECT 
 1 AS `patient_name`,
 1 AS `patient_lastname`,
 1 AS `appointment_time`,
 1 AS `doctor`,
 1 AS `room_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список диагнозов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'nibh. Phasellus'),(2,'ac facilisis'),(3,'velit. Cras'),(4,'ut eros'),(5,'neque venenatis'),(6,'amet, consectetuer'),(7,'semper pretium'),(8,'lobortis quis,'),(9,'magna a'),(10,'mauris. Suspendisse'),(11,'semper. Nam'),(12,'Proin velit.'),(13,'amet ante.'),(14,'lectus, a'),(15,'Mauris blandit'),(16,'parturient montes,'),(17,'nisi. Cum'),(18,'purus. Maecenas'),(19,'neque vitae'),(20,'turpis non'),(21,'semper tellus'),(22,'tellus. Nunc'),(23,'mi. Duis'),(24,'id, erat.'),(25,'Aliquam nisl.'),(26,'amet, dapibus'),(27,'vulputate, lacus.'),(28,'porttitor scelerisque'),(29,'facilisis. Suspendisse'),(30,'tortor. Integer'),(31,'eu, odio.'),(32,'ultrices a,'),(33,'egestas lacinia.'),(34,'semper et,'),(35,'nisl. Maecenas'),(36,'Nullam velit'),(37,'magna. Praesent'),(38,'Morbi sit'),(39,'mauris, aliquam'),(40,'placerat, augue.'),(41,'commodo auctor'),(42,'habitant morbi'),(43,'iaculis quis,'),(44,'blandit at,'),(45,'nibh. Aliquam'),(46,'mi lacinia'),(47,'fringilla ornare'),(48,'Vestibulum ut'),(49,'tempor, est'),(50,'Suspendisse aliquet,');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `specialty_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `specialty_id` (`specialty_id`),
  KEY `idx_doctors_name` (`firstname`,`lastname`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список докторов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Simon','Schwartz',5),(2,'Theodore','Schroeder',8),(3,'Davis','Moon',7),(4,'Kessie','Jimenez',3),(5,'Alea','Grant',2),(6,'Lesley','Ruiz',5),(7,'Noel','Sampson',3),(8,'Dieter','Sargent',8),(9,'Demetria','Ochoa',11),(10,'Keegan','Morgan',8),(11,'Abel','Taylor',2),(12,'Camille','Compton',9),(13,'Leroy','Whitfield',10),(14,'Germane','Stuart',1),(15,'Cole','Mcclure',13),(16,'Xandra','Nielsen',6),(17,'Clinton','Oneil',10),(18,'Burton','Hampton',13),(19,'Hannah','Castaneda',10),(20,'Carolyn','Cain',7),(21,'Cleo','Ramos',8),(22,'Rhiannon','Fleming',1),(23,'Virginia','Harrington',6),(24,'Lacota','Cooper',4),(25,'Blossom','Everett',4),(26,'Adele','Spears',4),(27,'Roth','Griffin',10),(28,'Isaiah','Rollins',7),(29,'Ori','Bauer',11),(30,'Amir','Acosta',4),(31,'Oscar','Shepherd',4),(32,'Julian','Barnes',12),(33,'Matthew','Mason',11),(34,'Kendall','Oliver',1),(35,'Dominique','Jenkins',6),(36,'Donovan','Cain',6),(37,'Dalton','Galloway',7),(38,'Samson','Glass',11),(39,'Richard','Cooley',12),(40,'Baxter','Harrison',11),(41,'Lars','Shaw',3),(42,'Florence','Farrell',9),(43,'Kirk','William',1),(44,'Nissim','Parks',9),(45,'Hayden','Jackson',2),(46,'Cassady','Sanford',11),(47,'Scarlet','Jefferson',4),(48,'Cadman','Murray',5),(49,'Travis','Estrada',10),(50,'Gretchen','Powers',4);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `income_per_day`
--

DROP TABLE IF EXISTS `income_per_day`;
/*!50001 DROP VIEW IF EXISTS `income_per_day`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `income_per_day` AS SELECT 
 1 AS `lastname`,
 1 AS `summ`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `invite_with_bad_tests`
--

DROP TABLE IF EXISTS `invite_with_bad_tests`;
/*!50001 DROP VIEW IF EXISTS `invite_with_bad_tests`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `invite_with_bad_tests` AS SELECT 
 1 AS `patient_name`,
 1 AS `patient_lastname`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `medical_card`
--

DROP TABLE IF EXISTS `medical_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_card` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` bigint unsigned NOT NULL,
  `patients_id` bigint unsigned NOT NULL,
  `diagnosis_id` bigint unsigned NOT NULL,
  `prescription_id` bigint unsigned NOT NULL,
  `test_results_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `patients_id` (`patients_id`),
  KEY `diagnosis_id` (`diagnosis_id`),
  KEY `prescription_id` (`prescription_id`),
  KEY `test_results_id` (`test_results_id`),
  CONSTRAINT `medical_card_ibfk_1` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `medical_card_ibfk_2` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`id`),
  CONSTRAINT `medical_card_ibfk_3` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`),
  CONSTRAINT `medical_card_ibfk_4` FOREIGN KEY (`test_results_id`) REFERENCES `test_results` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Медицинские карты пациентов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_card`
--

LOCK TABLES `medical_card` WRITE;
/*!40000 ALTER TABLE `medical_card` DISABLE KEYS */;
INSERT INTO `medical_card` VALUES (1,109,93,40,16,23),(2,57,79,16,62,74),(3,17,68,26,84,47),(4,102,37,36,29,13),(5,36,41,13,59,46),(6,150,27,14,98,70),(7,115,70,12,83,93),(8,106,71,21,24,25),(9,143,59,1,90,86),(10,195,6,6,54,37),(11,80,33,1,34,79),(12,106,64,19,100,92),(13,122,53,35,47,67),(14,96,44,20,99,23),(15,9,43,15,14,33),(16,167,81,13,27,61),(17,29,73,11,32,4),(18,132,64,45,38,24),(19,111,3,29,13,35),(20,68,89,17,91,12),(21,166,6,31,25,78),(22,111,2,27,41,93),(23,152,16,50,89,52),(24,105,45,38,57,44),(25,16,19,33,10,82),(26,9,40,27,97,15),(27,34,58,30,50,39),(28,119,11,21,14,26),(29,156,56,41,22,100),(30,135,30,34,46,13),(31,154,100,29,15,2),(32,178,70,29,23,10),(33,3,93,4,44,52),(34,55,81,15,95,27),(35,4,71,27,52,54),(36,184,97,25,58,34),(37,176,54,35,99,100),(38,20,37,38,8,89),(39,199,56,40,1,100),(40,54,92,13,57,78),(41,111,2,40,22,76),(42,164,27,47,78,89),(43,157,63,8,57,39),(44,177,33,17,91,46),(45,85,92,11,43,11),(46,27,73,48,87,94),(47,71,39,1,12,72),(48,13,66,12,56,83),(49,129,70,16,9,30),(50,7,9,35,68,20),(51,100,1,16,99,26),(52,175,59,40,65,99),(53,186,16,41,83,12),(54,84,62,43,31,89),(55,150,69,33,76,22),(56,125,75,27,48,93),(57,21,70,3,72,30),(58,163,6,22,59,100),(59,200,68,15,5,17),(60,183,67,13,30,9),(61,37,59,6,64,6),(62,77,82,14,38,9),(63,154,98,33,26,72),(64,18,61,21,13,34),(65,7,52,8,82,99),(66,126,37,12,58,9),(67,158,59,7,99,94),(68,162,38,28,83,67),(69,172,60,4,40,28),(70,119,77,30,7,42),(71,193,5,18,77,77),(72,148,16,8,96,33),(73,121,8,20,92,18),(74,191,94,22,100,69),(75,143,38,9,54,8),(76,133,27,30,66,37),(77,155,72,5,93,85),(78,125,83,15,63,27),(79,101,32,13,4,75),(80,135,96,43,43,77),(81,17,87,33,78,7),(82,34,93,11,59,59),(83,130,81,32,53,70),(84,157,16,46,76,61),(85,136,34,8,83,91),(86,54,6,4,10,87),(87,162,64,12,10,27),(88,90,53,39,88,39),(89,102,78,50,83,85),(90,138,85,6,61,93),(91,150,20,34,31,91),(92,137,15,6,96,65),(93,49,26,48,23,85),(94,136,35,4,84,40),(95,163,6,31,93,4),(96,51,56,42,32,34),(97,46,15,47,24,52),(98,139,63,34,12,80),(99,136,82,7,60,84),(100,136,41,43,32,85);
/*!40000 ALTER TABLE `medical_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_services`
--

DROP TABLE IF EXISTS `medical_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `descripton` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Прайс лист на услуги';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_services`
--

LOCK TABLES `medical_services` WRITE;
/*!40000 ALTER TABLE `medical_services` DISABLE KEYS */;
INSERT INTO `medical_services` VALUES (1,96.55,'nisi a odio'),(2,44.86,'risus. Duis a'),(3,63.46,'metus. Aenean sed'),(4,63.59,'ridiculus mus. Proin'),(5,24.94,'odio. Nam interdum'),(6,26.27,'convallis est, vitae'),(7,32.91,'facilisi. Sed neque.'),(8,26.36,'Cras dictum ultricies'),(9,84.16,'ornare, facilisis eget,'),(10,76.83,'erat vel pede'),(11,14.46,'Quisque nonummy ipsum'),(12,16.34,'arcu vel quam'),(13,85.79,'orci, adipiscing non,'),(14,85.46,'risus varius orci,'),(15,46.01,'in faucibus orci'),(16,62.11,'felis. Donec tempor,'),(17,90.43,'Vestibulum ante ipsum'),(18,64.80,'ac nulla. In'),(19,62.49,'placerat, orci lacus'),(20,29.90,'Pellentesque ultricies dignissim'),(21,76.92,'metus. Aenean sed'),(22,63.85,'ac arcu. Nunc'),(23,34.50,'eget lacus. Mauris'),(24,87.51,'Suspendisse aliquet molestie'),(25,97.15,'quis lectus. Nullam'),(26,33.83,'est mauris, rhoncus'),(27,36.08,'lorem ac risus.'),(28,3.38,'ut, pharetra sed,'),(29,97.04,'odio, auctor vitae,'),(30,35.32,'dui augue eu'),(31,3.70,'sollicitudin a, malesuada'),(32,46.59,'nec, mollis vitae,'),(33,89.81,'dis parturient montes,'),(34,44.63,'Nulla eget metus'),(35,8.25,'molestie. Sed id'),(36,16.74,'enim mi tempor'),(37,76.10,'Curabitur vel lectus.'),(38,3.77,'Vestibulum ante ipsum'),(39,71.80,'venenatis a, magna.'),(40,72.49,'amet, consectetuer adipiscing'),(41,96.69,'eleifend vitae, erat.'),(42,9.07,'vel est tempor'),(43,17.24,'tincidunt dui augue'),(44,60.90,'Nam ac nulla.'),(45,8.88,'luctus ut, pellentesque'),(46,77.34,'Mauris vestibulum, neque'),(47,2.79,'erat. Sed nunc'),(48,39.36,'mollis lectus pede'),(49,20.05,'amet ante. Vivamus'),(50,92.95,'tincidunt. Donec vitae'),(51,18.52,'ante, iaculis nec,'),(52,76.98,'Aliquam ornare, libero'),(53,59.91,'a, arcu. Sed'),(54,55.25,'In at pede.'),(55,54.43,'ac mattis velit'),(56,99.27,'in faucibus orci'),(57,87.75,'Cum sociis natoque'),(58,13.70,'mi eleifend egestas.'),(59,67.36,'tellus faucibus leo,'),(60,66.60,'tellus faucibus leo,'),(61,98.44,'purus mauris a'),(62,90.52,'pede. Praesent eu'),(63,20.47,'Class aptent taciti'),(64,0.80,'et netus et'),(65,12.10,'Nulla eget metus'),(66,37.12,'diam luctus lobortis.'),(67,26.16,'lobortis tellus justo'),(68,60.59,'vitae aliquam eros'),(69,92.01,'Nunc ullamcorper, velit'),(70,31.83,'felis ullamcorper viverra.'),(71,22.21,'magna a tortor.'),(72,26.12,'ac mattis velit'),(73,14.11,'enim, condimentum eget,'),(74,21.03,'tristique neque venenatis'),(75,88.47,'sodales at, velit.'),(76,27.35,'mi, ac mattis'),(77,4.07,'eget metus. In'),(78,13.03,'vulputate eu, odio.'),(79,75.85,'facilisis vitae, orci.'),(80,15.74,'eros non enim'),(81,2.04,'at pretium aliquet,'),(82,2.17,'Morbi non sapien'),(83,44.30,'sapien. Aenean massa.'),(84,52.17,'eget tincidunt dui'),(85,97.65,'est. Nunc ullamcorper,'),(86,24.43,'dignissim tempor arcu.'),(87,18.86,'augue ut lacus.'),(88,2.05,'accumsan sed, facilisis'),(89,29.23,'Nunc commodo auctor'),(90,23.37,'lorem ipsum sodales'),(91,56.07,'neque et nunc.'),(92,18.36,'tristique pellentesque, tellus'),(93,87.60,'arcu eu odio'),(94,46.37,'Donec vitae erat'),(95,36.90,'Donec tempus, lorem'),(96,59.44,'nunc id enim.'),(97,81.83,'eu nibh vulputate'),(98,84.12,'justo eu arcu.'),(99,4.02,'Morbi neque tellus,'),(100,50.38,'Curabitur egestas nunc');
/*!40000 ALTER TABLE `medical_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` bigint unsigned DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_patients_name` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список пациентов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Matthew','Stafford','libero@vulputatelacusCras.com',79243754806,'M','2007-06-30','2010-08-05 08:23:02'),(2,'Carter','Hays','rhoncus@malesuadaut.co.uk',79996982223,'M','1984-10-02','2014-08-25 21:07:18'),(3,'Walter','Barrett','morbi.tristique@lobortismauris.ca',79569578396,'M','1988-09-13','2010-11-08 23:51:17'),(4,'Kenyon','Yang','posuere.at.velit@perconubia.org',79227121555,'F','2001-03-04','2014-11-30 22:11:15'),(5,'Chelsea','Leon','ornare@neceuismodin.com',79757661175,'M','1971-06-05','2018-12-29 14:21:16'),(6,'Yvette','Dennis','diam.Duis@ultricesposuere.net',79292199258,'M','1952-03-22','2018-04-03 16:30:24'),(7,'Hayden','Jackson','mi.enim@duinectempus.com',79933792213,'F','1980-06-13','2021-11-08 07:32:51'),(8,'Karleigh','Kidd','hendrerit@mauris.org',79997899610,'F','1954-05-16','2018-09-13 16:51:25'),(9,'Brady','Maldonado','tristique.neque@lorem.net',79751882488,'F','1972-07-31','2016-05-19 09:53:40'),(10,'Isadora','Kline','mauris@Curabituregestasnunc.ca',79998960053,'F','1954-07-04','2014-11-29 21:02:31'),(11,'Ori','Perkins','Nunc.mauris.sapien@vulputate.co.uk',79626313349,'M','1973-08-02','2022-02-18 19:56:28'),(12,'Teagan','Frost','magnis.dis.parturient@Praesentinterdumligula.co.uk',79525930552,'M','1966-09-19','2016-07-13 05:19:19'),(13,'Axel','Stuart','ullamcorper@malesuadaiderat.org',79869915981,'M','1973-02-19','2022-03-31 20:36:41'),(14,'Isaac','Welch','a.malesuada@Etiam.com',79200035358,'F','1992-08-11','2018-01-23 00:16:52'),(15,'Chelsea','Holloway','Phasellus.elit.pede@ultriciesligulaNullam.com',79957931391,'M','1953-05-07','2019-08-16 16:32:26'),(16,'Desiree','Weber','ligula.Donec.luctus@non.ca',79420731107,'F','2015-09-06','2021-11-11 12:06:49'),(17,'Michael','Dean','molestie.arcu@fringillapurus.edu',79427751399,'M','1981-10-09','2017-11-26 12:14:37'),(18,'Alfonso','Salazar','Aliquam.fringilla@justoeu.edu',79424412894,'M','1981-10-31','2021-05-08 22:51:02'),(19,'Channing','Lindsay','amet.consectetuer.adipiscing@eusemPellentesque.org',79060357084,'M','1979-04-19','2021-12-23 01:04:35'),(20,'May','Morin','dis@malesuadaaugue.com',79697556106,'M','1975-10-17','2015-03-28 05:37:10'),(21,'Quinlan','Floyd','dis@tellusAeneanegestas.com',79144495644,'F','2004-12-21','2019-09-05 18:57:25'),(22,'Thaddeus','Cline','at.pede.Cras@nislsem.org',79523877884,'M','1951-12-12','2010-12-16 22:56:23'),(23,'Orli','Sullivan','neque.venenatis.lacus@rutrum.edu',79337664466,'M','1972-05-12','2013-07-31 13:24:59'),(24,'Gloria','Orr','mattis.Cras.eget@vitae.edu',79530195687,'F','2014-03-27','2010-04-14 13:43:58'),(25,'Eagan','Kline','Pellentesque@tinciduntvehicula.ca',79410157770,'M','2016-08-28','2013-03-16 13:27:17'),(26,'Hall','Carpenter','quam.elementum.at@Namligulaelit.co.uk',79636748617,'M','1972-09-03','2020-08-04 15:40:37'),(27,'Wade','Burt','aliquam.eu.accumsan@tempusmauris.org',79445449446,'F','2000-04-20','2014-09-14 12:49:08'),(28,'Akeem','Lamb','neque@Crasdictum.co.uk',79325694086,'M','2011-03-23','2011-03-24 18:35:21'),(29,'Dennis','Allison','nisl.elementum.purus@anteipsum.co.uk',79951402230,'M','1976-04-09','2014-03-03 19:29:46'),(30,'Tiger','Mcdonald','urna@natoque.edu',79776029968,'F','1996-04-21','2010-07-20 11:59:44'),(31,'Xerxes','Boone','tincidunt.congue@neque.ca',79235707311,'M','2010-07-03','2018-11-19 23:22:43'),(32,'Charity','Albert','Nunc.sollicitudin@commodoauctorvelit.net',79991271968,'F','2009-01-31','2010-09-11 22:10:31'),(33,'Xanthus','Hester','magna.Suspendisse.tristique@semNullainterdum.co.uk',79277314354,'F','1968-02-27','2021-04-28 12:47:52'),(34,'Connor','Walter','Suspendisse.sagittis@Phasellusdolorelit.com',79852387394,'F','2008-09-26','2021-03-01 10:21:03'),(35,'Adele','Mccarthy','id.ante@erat.edu',79382734993,'M','2004-01-07','2018-08-26 17:03:52'),(36,'Scarlett','Schwartz','in.lobortis@lectuspede.edu',79849176201,'M','2018-06-15','2013-09-24 08:20:08'),(37,'Wang','Summers','magna.Ut@mattisInteger.org',79095137434,'F','2005-02-24','2013-10-17 11:47:34'),(38,'Thaddeus','Hopkins','suscipit.est.ac@dictum.net',79614250465,'F','1957-02-27','2015-01-12 07:35:05'),(39,'Michael','Graves','sollicitudin@Crasdolor.edu',79496441768,'M','1961-05-12','2022-03-04 00:59:47'),(40,'Mallory','Gamble','Donec.est.mauris@posuereenim.org',79501176793,'M','1964-07-06','2017-06-10 22:26:17'),(41,'Jaden','Howe','lacus.Quisque.purus@aptenttacitisociosqu.net',79744559024,'F','2018-04-20','2010-12-07 02:46:49'),(42,'Ira','Roberson','in@aceleifend.edu',79131412091,'M','1971-06-25','2010-07-09 20:37:37'),(43,'Keiko','Mcdowell','Donec.felis@massanonante.co.uk',79650252404,'F','1981-12-21','2020-06-25 14:04:12'),(44,'Noelle','Vargas','natoque.penatibus.et@ipsumdolor.net',79784408972,'F','1988-07-10','2020-11-17 18:33:30'),(45,'Hillary','Holloway','vel.sapien.imperdiet@accumsan.org',79428058948,'F','1993-08-07','2015-09-15 14:10:12'),(46,'Evan','Rocha','lectus.Nullam@interdum.net',79970142234,'F','2011-01-01','2014-06-05 09:16:30'),(47,'Flavia','Kerr','sed.turpis@ipsum.org',79111993953,'M','1979-03-11','2017-01-14 02:28:43'),(48,'Gabriel','Sullivan','dui.nec@libero.ca',79462166333,'M','1980-02-01','2016-11-12 09:28:13'),(49,'Imani','Livingston','metus.vitae@leoVivamusnibh.co.uk',79504417557,'M','1962-01-14','2014-12-10 15:00:50'),(50,'Lucian','Wooten','Pellentesque.ultricies.dignissim@morbitristique.ca',79654624286,'F','1961-03-26','2012-02-27 22:45:42'),(51,'John','Wallace','purus@mauris.co.uk',79056555394,'F','1989-03-23','2015-02-21 17:35:39'),(52,'Uta','Yang','dapibus.quam.quis@id.net',79891049818,'F','1980-08-14','2020-01-18 02:00:30'),(53,'Chandler','Sharpe','nisl.Quisque.fringilla@ante.edu',79939523452,'F','2012-04-16','2013-01-20 09:36:23'),(54,'Lani','Wiley','lorem.lorem@mollisDuissit.ca',79860019915,'M','1962-06-18','2013-09-18 06:03:55'),(55,'Galvin','Holland','placerat@non.ca',79882857719,'F','2000-03-19','2020-07-09 00:29:05'),(56,'Maxine','Wilkins','sem@augueutlacus.org',79799040021,'F','1953-02-12','2012-12-25 06:00:07'),(57,'Carl','Mckenzie','ut.nulla.Cras@lobortis.org',79443983648,'F','1969-10-11','2016-09-23 18:59:51'),(58,'Emerald','Mclaughlin','cubilia.Curae@Donec.com',79723063366,'M','1976-12-13','2016-04-15 11:16:28'),(59,'Desiree','Stein','Fusce.aliquam@Ut.com',79052354943,'M','1987-08-06','2020-08-15 21:07:57'),(60,'Dillon','Lynch','non.dapibus@laoreetlectusquis.com',79037778909,'M','1977-01-16','2020-09-23 00:12:11'),(61,'Warren','Mueller','Vivamus@vulputate.ca',79017186856,'M','2019-12-26','2019-11-16 12:17:20'),(62,'Zephr','Davidson','sapien.molestie.orci@bibendumDonec.edu',79626940404,'F','1998-08-14','2015-06-10 17:28:14'),(63,'Dante','Robles','Duis.a@sitametdapibus.ca',79965487179,'M','2021-06-19','2020-06-21 15:55:52'),(64,'Keely','Estes','imperdiet.nec@Aliquamultricesiaculis.edu',79060659697,'M','2017-09-16','2014-12-22 23:38:23'),(65,'Chadwick','Cameron','Nullam.feugiat@aarcu.org',79615000909,'F','2007-12-29','2020-02-25 19:27:44'),(66,'Reese','Moreno','eleifend.Cras.sed@Sed.edu',79898870004,'M','1965-05-31','2018-04-10 07:32:36'),(67,'Piper','Mcconnell','sed@ornareliberoat.ca',79128749676,'M','1969-04-25','2015-04-24 01:51:51'),(68,'Cain','Lane','at.pretium@temporest.co.uk',79194825034,'M','1983-09-08','2015-08-25 21:36:15'),(69,'Megan','Gray','Aliquam.fringilla@Fuscefermentumfermentum.net',79814673896,'M','2012-12-23','2012-06-06 13:06:16'),(70,'Mercedes','Fuller','lobortis.mauris@augueeu.com',79018860708,'M','1997-07-24','2021-02-03 03:12:15'),(71,'Montana','Reynolds','Cras@mi.net',79066491243,'F','1968-11-19','2011-09-09 11:20:44'),(72,'Tiger','Robles','posuere.at.velit@justo.co.uk',79980929365,'F','1961-02-12','2017-11-12 02:46:39'),(73,'Felicia','Mccarthy','non.dapibus.rutrum@massaQuisque.com',79782077461,'F','2016-11-21','2014-01-14 10:31:35'),(74,'Odette','Forbes','posuere.vulputate@Etiam.ca',79510472963,'M','2018-10-27','2014-02-05 11:26:11'),(75,'Naomi','Cabrera','sem@orcitincidunt.com',79019476703,'M','1967-12-10','2016-02-09 04:26:47'),(76,'Garrison','Mueller','luctus@lobortisaugue.org',79861149658,'F','1968-01-30','2012-03-03 17:14:40'),(77,'Melodie','Blackwell','ac.libero.nec@utquamvel.co.uk',79666380762,'M','1987-04-20','2018-10-04 09:28:38'),(78,'Len','English','Suspendisse@etmagnisdis.net',79996902463,'F','1997-11-17','2014-08-13 07:45:11'),(79,'Cade','Rocha','pharetra.Nam.ac@risusquis.ca',79130930310,'M','1993-02-07','2019-10-02 08:18:59'),(80,'Bo','Sweet','dictum@tortordictum.net',79533234588,'F','1977-11-26','2020-12-18 02:08:10'),(81,'Mohammad','Park','sit.amet.nulla@natoquepenatibuset.ca',79942504498,'M','2018-02-25','2018-04-02 12:41:21'),(82,'Ivor','Curtis','neque.tellus.imperdiet@orci.net',79797883763,'M','1980-11-07','2019-11-15 11:26:11'),(83,'Upton','Cotton','et.euismod@accumsaninterdum.com',79353954805,'F','1995-12-06','2010-03-11 04:31:25'),(84,'Garrett','Strong','ornare@aliquetlobortisnisi.com',79246592398,'F','1975-01-25','2011-03-20 18:25:20'),(85,'Laith','White','quis@quis.org',79860301224,'F','1978-11-07','2020-09-20 19:12:42'),(86,'Calista','Mendoza','commodo.tincidunt@Donecegestas.edu',79140261525,'M','1980-06-26','2016-12-12 10:07:52'),(87,'Charles','Phillips','magna.sed.dui@primisin.edu',79000655545,'M','1999-09-23','2013-02-21 12:57:11'),(88,'Lev','Bryan','amet.nulla@justositamet.org',79575163970,'F','1958-04-28','2020-11-09 20:28:06'),(89,'Connor','Terrell','aliquet.nec.imperdiet@scelerisquescelerisque.com',79175153789,'F','1968-03-03','2015-11-08 17:05:04'),(90,'Brittany','Mills','ipsum.dolor@congueIn.com',79905809382,'F','1975-07-26','2017-11-20 09:36:41'),(91,'Abel','Moreno','imperdiet.erat.nonummy@ami.net',79851981238,'F','2001-10-02','2012-07-18 14:18:19'),(92,'Wade','Sanders','nec@egetodio.com',79657719526,'M','1957-11-04','2011-11-02 05:33:19'),(93,'Buckminster','Joyner','lorem@inceptoshymenaeosMauris.com',79274460158,'M','1983-11-20','2013-01-07 18:43:05'),(94,'Chandler','Vargas','ornare.lectus@orciquis.ca',79820743002,'F','1996-07-18','2022-01-31 12:00:38'),(95,'Aaron','Tillman','Nunc.pulvinar.arcu@Donec.net',79057631132,'M','1958-05-31','2013-10-26 18:36:31'),(96,'Aiko','Perkins','lectus.convallis@ataugue.com',79945408085,'M','1955-09-10','2011-10-07 10:55:09'),(97,'Karen','Powers','a@at.co.uk',79412781271,'F','1954-08-19','2010-08-31 06:47:10'),(98,'Octavius','Estrada','Curae@sociisnatoque.org',79174673567,'M','1961-10-03','2010-05-01 00:43:54'),(99,'Howard','Barnes','In@CuraePhasellus.ca',79406785927,'F','2019-01-07','2016-10-18 11:06:19'),(100,'Orson','Donovan','semper.rutrum@consectetuer.edu',79203968171,'M','1995-10-12','2012-09-26 08:59:13');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_user_age_before_insert` BEFORE INSERT ON `patients` FOR EACH ROW begin
    IF NEW.birthday > CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Birthday must be in the past!';
    END IF;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_new_patient` BEFORE INSERT ON `patients` FOR EACH ROW begin
    IF NEW.created_at > CURRENT_DATE() THEN
        SET NEW.created_at = CURRENT_DATE();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Назначения врачей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,'Aenean sed pede nec ante blandit viverra. Donec tempus, lorem'),(2,'et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,'),(3,'felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.'),(4,'Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor'),(5,'mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,'),(6,'dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales'),(7,'fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit.'),(8,'magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu'),(9,'in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus'),(10,'cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut'),(11,'porttitor tellus non magna. Nam ligula elit, pretium et, rutrum'),(12,'dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus'),(13,'ut erat. Sed nunc est, mollis non, cursus non, egestas'),(14,'Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi'),(15,'mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam'),(16,'eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam'),(17,'eu tellus eu augue porttitor interdum. Sed auctor odio a'),(18,'sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam'),(19,'Donec feugiat metus sit amet ante. Vivamus non lorem vitae'),(20,'Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus'),(21,'Class aptent taciti sociosqu ad litora torquent per conubia nostra,'),(22,'aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in'),(23,'Fusce aliquet magna a neque. Nullam ut nisi a odio'),(24,'dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada'),(25,'risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non'),(26,'enim, sit amet ornare lectus justo eu arcu. Morbi sit'),(27,'augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed,'),(28,'ac mattis ornare, lectus ante dictum mi, ac mattis velit'),(29,'congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum'),(30,'luctus sit amet, faucibus ut, nulla. Cras eu tellus eu'),(31,'Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque'),(32,'tempor, est ac mattis semper, dui lectus rutrum urna, nec'),(33,'parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla'),(34,'lectus. Cum sociis natoque penatibus et magnis dis parturient montes,'),(35,'id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus'),(36,'Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi'),(37,'faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt.'),(38,'enim. Nunc ut erat. Sed nunc est, mollis non, cursus'),(39,'volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean'),(40,'amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing'),(41,'mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,'),(42,'interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt'),(43,'rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed'),(44,'iaculis, lacus pede sagittis augue, eu tempor erat neque non'),(45,'risus. In mi pede, nonummy ut, molestie in, tempus eu,'),(46,'ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper'),(47,'commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa'),(48,'augue porttitor interdum. Sed auctor odio a purus. Duis elementum,'),(49,'massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero.'),(50,'orci. Ut semper pretium neque. Morbi quis urna. Nunc quis'),(51,'dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor'),(52,'vel lectus. Cum sociis natoque penatibus et magnis dis parturient'),(53,'sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem'),(54,'ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus'),(55,'ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem'),(56,'egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est,'),(57,'et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus.'),(58,'enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin'),(59,'Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum'),(60,'ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,'),(61,'congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit'),(62,'et netus et malesuada fames ac turpis egestas. Fusce aliquet'),(63,'eget mollis lectus pede et risus. Quisque libero lacus, varius'),(64,'non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris'),(65,'sem magna nec quam. Curabitur vel lectus. Cum sociis natoque'),(66,'dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu'),(67,'vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur'),(68,'enim consequat purus. Maecenas libero est, congue a, aliquet vel,'),(69,'nunc ac mattis ornare, lectus ante dictum mi, ac mattis'),(70,'lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis'),(71,'venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec'),(72,'et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis'),(73,'nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam'),(74,'sit amet, faucibus ut, nulla. Cras eu tellus eu augue'),(75,'diam vel arcu. Curabitur ut odio vel est tempor bibendum.'),(76,'eget mollis lectus pede et risus. Quisque libero lacus, varius'),(77,'ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet'),(78,'felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit'),(79,'cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum'),(80,'dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu'),(81,'nibh enim, gravida sit amet, dapibus id, blandit at, nisi.'),(82,'id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque'),(83,'arcu. Vestibulum ante ipsum primis in faucibus orci luctus et'),(84,'eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc'),(85,'et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget'),(86,'sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed'),(87,'dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec,'),(88,'ipsum primis in faucibus orci luctus et ultrices posuere cubilia'),(89,'luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget,'),(90,'turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus.'),(91,'eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit'),(92,'eget varius ultrices, mauris ipsum porta elit, a feugiat tellus'),(93,'nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse'),(94,'Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus,'),(95,'elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu'),(96,'augue. Sed molestie. Sed id risus quis diam luctus lobortis.'),(97,'Phasellus at augue id ante dictum cursus. Nunc mauris elit,'),(98,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur'),(99,'ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula.'),(100,'erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_number` bigint unsigned NOT NULL,
  `desccription` varchar(100) DEFAULT NULL,
  `specialty_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `specialty_id` (`specialty_id`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список кабинетов для приема';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,7,'tempor',5),(2,10,'sagittis',1),(3,8,'aliquam,',9),(4,9,'nisl',8),(5,3,'metus.',13),(6,10,'sem',6),(7,10,'natoque',5),(8,5,'tristique',1),(9,5,'nec,',9),(10,6,'consequat',12),(11,7,'Praesent',12),(12,6,'sed',1),(13,10,'congue',10),(14,5,'porttitor',7),(15,10,'Etiam',2),(16,6,'elit.',9),(17,7,'nunc,',5),(18,7,'et',10),(19,1,'Fusce',10),(20,7,'interdum',5),(21,5,'Fusce',6),(22,4,'enim',2),(23,6,'tellus.',11),(24,10,'ac',6),(25,7,'Curabitur',10),(26,7,'Integer',6),(27,7,'dui.',8),(28,2,'quis',5),(29,1,'eu',2),(30,8,'Nam',4);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Специальности врачей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'Anesthesiologists'),(2,'Cardiologists'),(3,'Surgeons'),(4,'Dermatologists'),(5,'Endocrinologists'),(6,'Gastroenterologists'),(7,'Nephrologists'),(8,'Oncologists'),(9,'Ophthalmologists'),(10,'Pediatricians'),(11,'Radiologists'),(12,'Psychiatrists'),(13,'Otolaryngologists');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty_doctors`
--

DROP TABLE IF EXISTS `specialty_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty_doctors` (
  `doctors_id` bigint unsigned NOT NULL,
  `specialty_id` bigint unsigned NOT NULL,
  KEY `doctors_id` (`doctors_id`),
  KEY `specialty_id` (`specialty_id`),
  CONSTRAINT `specialty_doctors_ibfk_1` FOREIGN KEY (`doctors_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `specialty_doctors_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Соотношение врачи - специальности';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty_doctors`
--

LOCK TABLES `specialty_doctors` WRITE;
/*!40000 ALTER TABLE `specialty_doctors` DISABLE KEYS */;
INSERT INTO `specialty_doctors` VALUES (30,11),(5,8),(11,5),(9,2),(17,3),(11,13),(37,6),(19,3),(10,7),(19,10),(6,11),(20,2),(19,10),(30,5),(40,2),(13,4),(5,8),(31,7),(40,9),(17,10),(15,3),(41,2),(29,10),(4,1),(42,3),(5,8),(11,12),(35,2),(35,5),(4,4),(47,13),(16,10),(28,7),(31,4),(33,8),(48,2),(43,6),(47,13),(21,6),(21,7),(20,6),(48,9),(10,12),(48,6),(41,10),(11,12),(25,8),(20,5),(34,5),(24,2),(12,5),(30,1),(28,13),(7,1),(32,7),(48,1),(30,9),(48,5),(36,11),(9,2),(1,8),(42,8),(22,2),(38,7),(21,7),(49,6),(7,2),(44,12),(33,3),(40,5),(49,2),(45,10),(11,10),(23,8),(13,11),(45,3),(38,6),(14,9),(33,6),(40,6),(2,1),(13,12),(24,12),(5,11),(32,10),(5,4),(38,12),(26,13),(13,10),(11,1),(2,10),(10,4),(47,8),(36,6),(39,10),(2,2),(2,4),(20,9),(40,2),(27,11);
/*!40000 ALTER TABLE `specialty_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_results`
--

DROP TABLE IF EXISTS `test_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `status` enum('positive','negative','undefined') DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Результаты анализов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_results`
--

LOCK TABLES `test_results` WRITE;
/*!40000 ALTER TABLE `test_results` DISABLE KEYS */;
INSERT INTO `test_results` VALUES (1,'a, magna.','positive'),(2,'dignissim tempor','negative'),(3,'ornare, lectus','positive'),(4,'neque. Morbi','positive'),(5,'fermentum convallis','undefined'),(6,'Nunc mauris.','positive'),(7,'eget nisi','undefined'),(8,'non sapien','positive'),(9,'a, malesuada','negative'),(10,'lacus. Cras','undefined'),(11,'ipsum dolor','positive'),(12,'vitae purus','undefined'),(13,'Suspendisse dui.','positive'),(14,'mi fringilla','undefined'),(15,'neque venenatis','undefined'),(16,'Curabitur egestas','undefined'),(17,'facilisis, magna','positive'),(18,'dui nec','undefined'),(19,'mi pede,','negative'),(20,'libero et','negative'),(21,'felis ullamcorper','undefined'),(22,'cursus. Integer','negative'),(23,'amet orci.','negative'),(24,'sed dictum','positive'),(25,'vestibulum lorem,','negative'),(26,'montes, nascetur','positive'),(27,'euismod ac,','positive'),(28,'nunc sed','positive'),(29,'non justo.','positive'),(30,'neque. In','undefined'),(31,'Sed congue,','negative'),(32,'ultrices. Vivamus','negative'),(33,'Fusce mollis.','negative'),(34,'lobortis ultrices.','negative'),(35,'tempor erat','negative'),(36,'Cras interdum.','undefined'),(37,'tempus mauris','negative'),(38,'Aenean euismod','undefined'),(39,'In condimentum.','positive'),(40,'Nullam suscipit,','undefined'),(41,'rhoncus. Proin','negative'),(42,'sit amet,','negative'),(43,'convallis, ante','undefined'),(44,'tellus. Suspendisse','positive'),(45,'a felis','undefined'),(46,'adipiscing elit.','positive'),(47,'convallis ligula.','positive'),(48,'Fusce mollis.','undefined'),(49,'molestie sodales.','undefined'),(50,'rutrum, justo.','negative'),(51,'dignissim. Maecenas','positive'),(52,'cubilia Curae;','undefined'),(53,'Sed id','undefined'),(54,'libero. Integer','undefined'),(55,'erat volutpat.','negative'),(56,'metus. In','positive'),(57,'est, vitae','positive'),(58,'nunc, ullamcorper','undefined'),(59,'nulla ante,','negative'),(60,'Quisque purus','undefined'),(61,'neque. In','undefined'),(62,'dui lectus','undefined'),(63,'porta elit,','negative'),(64,'facilisis vitae,','negative'),(65,'vel arcu.','positive'),(66,'eu erat','undefined'),(67,'Curabitur ut','undefined'),(68,'Nam consequat','negative'),(69,'nisl. Quisque','positive'),(70,'lacus. Nulla','positive'),(71,'Sed molestie.','negative'),(72,'Cum sociis','undefined'),(73,'Quisque imperdiet,','negative'),(74,'vel quam','undefined'),(75,'Mauris ut','undefined'),(76,'neque. Sed','undefined'),(77,'neque vitae','negative'),(78,'nibh. Quisque','negative'),(79,'ornare, libero','negative'),(80,'penatibus et','positive'),(81,'arcu. Sed','undefined'),(82,'mauris. Morbi','negative'),(83,'Aenean massa.','negative'),(84,'odio. Etiam','negative'),(85,'urna. Nullam','positive'),(86,'sem eget','undefined'),(87,'In tincidunt','negative'),(88,'porta elit,','undefined'),(89,'eleifend, nunc','positive'),(90,'ultrices, mauris','undefined'),(91,'Proin velit.','negative'),(92,'Aliquam auctor,','negative'),(93,'ipsum nunc','undefined'),(94,'Duis a','undefined'),(95,'non, luctus','positive'),(96,'tellus. Aenean','positive'),(97,'malesuada vel,','positive'),(98,'malesuada ut,','undefined'),(99,'non nisi.','undefined'),(100,'arcu. Sed','undefined');
/*!40000 ALTER TABLE `test_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `appointment_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `patients_id` bigint unsigned NOT NULL,
  `doctors_id` bigint unsigned NOT NULL,
  `medical_services_id` bigint unsigned NOT NULL,
  `rooms_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `patients_id` (`patients_id`),
  KEY `doctors_id` (`doctors_id`),
  KEY `medical_services_id` (`medical_services_id`),
  KEY `rooms_id` (`rooms_id`),
  CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`id`),
  CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`doctors_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `visits_ibfk_3` FOREIGN KEY (`medical_services_id`) REFERENCES `medical_services` (`id`),
  CONSTRAINT `visits_ibfk_4` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Данные по визитам пациентов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,'2020-09-26 17:26:42',86,33,71,2),(2,'2020-02-12 22:09:18',34,40,6,2),(3,'2021-04-02 04:00:45',69,8,88,2),(4,'2020-08-06 20:39:09',58,16,31,5),(5,'2012-06-09 17:35:47',90,34,84,3),(6,'2021-04-02 04:00:45',81,50,56,8),(7,'2018-08-18 08:34:28',52,19,89,8),(8,'2021-04-02 04:00:45',29,50,42,2),(9,'2019-06-11 01:01:56',94,44,89,7),(10,'2021-04-02 04:00:45',88,5,74,4),(11,'2013-03-15 10:52:57',58,39,65,2),(12,'2016-03-22 02:07:57',90,9,79,5),(13,'2021-04-02 04:00:45',16,11,97,3),(14,'2020-05-24 12:14:18',26,7,53,8),(15,'2021-04-12 17:41:16',13,1,27,8),(16,'2021-04-02 04:00:45',61,38,14,9),(17,'2019-11-07 12:35:55',62,1,88,3),(18,'2021-06-14 01:18:47',49,29,70,1),(19,'2015-11-22 05:29:45',17,34,78,8),(20,'2021-04-02 04:00:45',49,26,46,8),(21,'2018-10-29 02:10:43',65,39,12,6),(22,'2021-04-02 04:00:45',46,38,97,5),(23,'2021-04-28 16:27:49',1,39,86,5),(24,'2021-04-02 04:00:45',21,43,9,8),(25,'2015-09-11 20:01:12',14,18,20,10),(26,'2020-01-29 22:22:24',10,36,51,9),(27,'2021-05-28 07:17:20',8,18,87,3),(28,'2016-12-12 04:16:32',100,25,40,9),(29,'2020-11-16 00:23:58',96,7,50,2),(30,'2021-04-02 04:00:45',36,21,91,9),(31,'2014-11-17 12:26:46',100,9,100,10),(32,'2015-12-23 05:00:49',33,6,42,8),(33,'2021-04-02 04:00:45',97,27,79,8),(34,'2016-06-08 22:24:45',45,18,96,2),(35,'2021-04-02 04:00:45',78,21,25,3),(36,'2019-06-25 08:11:09',30,37,2,10),(37,'2011-07-08 22:20:16',78,17,74,2),(38,'2013-12-24 17:24:35',83,17,19,9),(39,'2021-04-02 04:00:45',75,14,7,8),(40,'2019-11-23 07:57:44',2,11,37,3),(41,'2013-11-30 20:34:24',57,22,35,7),(42,'2021-04-02 04:00:45',44,14,50,3),(43,'2014-03-14 13:04:26',84,50,64,3),(44,'2021-04-02 04:00:45',57,14,2,8),(45,'2015-04-27 07:52:17',89,29,69,1),(46,'2013-03-19 20:26:20',27,29,4,2),(47,'2022-02-21 17:37:14',30,40,75,5),(48,'2011-07-30 02:57:21',57,10,62,1),(49,'2019-06-07 09:57:11',90,12,52,3),(50,'2018-07-05 21:01:03',54,11,92,1),(51,'2014-11-09 21:30:53',58,23,22,2),(52,'2020-01-09 00:19:14',57,45,56,9),(53,'2011-02-23 02:05:53',30,8,34,3),(54,'2021-09-18 05:27:22',33,29,61,9),(55,'2015-03-14 20:59:08',27,42,25,4),(56,'2018-07-08 23:54:40',26,29,61,6),(57,'2014-12-16 10:22:57',39,35,13,9),(58,'2020-01-08 03:37:52',95,45,71,7),(59,'2013-05-02 20:31:16',86,16,14,6),(60,'2021-05-09 10:39:23',73,48,83,3),(61,'2018-04-16 04:45:45',27,29,76,10),(62,'2011-06-26 04:05:23',7,50,11,2),(63,'2013-12-26 15:01:49',44,5,49,10),(64,'2015-02-11 07:57:32',7,11,96,3),(65,'2021-06-15 00:53:19',97,19,52,8),(66,'2021-04-02 04:00:45',13,14,26,6),(67,'2021-12-09 01:20:23',82,18,8,9),(68,'2010-07-21 12:40:04',7,30,74,6),(69,'2022-03-08 12:38:12',73,31,62,5),(70,'2021-04-02 04:00:45',3,33,57,8),(71,'2015-05-08 10:29:09',63,42,40,4),(72,'2020-01-16 16:57:29',55,37,25,2),(73,'2017-10-06 06:18:03',17,10,44,2),(74,'2021-04-02 04:00:45',37,33,65,6),(75,'2018-12-23 12:12:57',100,43,10,10),(76,'2011-03-14 08:55:51',93,39,12,1),(77,'2020-05-12 16:53:42',99,12,18,7),(78,'2017-01-15 22:35:51',94,36,2,4),(79,'2019-03-23 06:52:05',51,45,69,10),(80,'2016-07-18 17:04:53',69,5,19,5),(81,'2017-06-29 05:52:05',37,15,89,2),(82,'2021-04-02 04:00:45',17,33,10,3),(83,'2021-05-20 19:36:56',8,5,85,5),(84,'2014-01-13 01:07:14',76,21,86,6),(85,'2010-12-09 00:38:56',45,12,20,7),(86,'2021-04-02 04:00:45',72,33,47,3),(87,'2021-05-03 13:10:21',86,19,2,4),(88,'2012-01-29 00:46:43',42,20,97,5),(89,'2010-07-10 11:07:43',65,10,21,3),(90,'2019-03-02 08:39:28',48,31,59,8),(91,'2010-05-09 09:04:42',97,10,51,6),(92,'2013-07-16 05:25:29',33,35,38,10),(93,'2014-04-02 03:07:50',15,32,16,5),(94,'2017-07-08 05:14:44',79,17,91,10),(95,'2018-04-15 07:55:06',46,34,32,4),(96,'2020-11-24 12:40:31',33,3,92,8),(97,'2019-04-20 11:52:58',82,46,37,6),(98,'2010-12-06 22:24:16',20,12,92,1),(99,'2017-02-05 13:46:13',47,48,15,4),(100,'2020-10-14 12:03:36',33,27,62,1);
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_new_visit` BEFORE INSERT ON `visits` FOR EACH ROW begin
    IF NEW.appointment_time > CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Visit must be in the future!';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'med'
--

--
-- Final view structure for view `appointments_for_tomorrow`
--

/*!50001 DROP VIEW IF EXISTS `appointments_for_tomorrow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointments_for_tomorrow` AS select `patients`.`firstname` AS `patient_name`,`patients`.`lastname` AS `patient_lastname`,`visits`.`appointment_time` AS `appointment_time`,`doctors`.`lastname` AS `doctor`,`rooms`.`room_number` AS `room_number` from (((`patients` join `visits` on((`patients`.`id` = `visits`.`patients_id`))) join `doctors` on((`visits`.`doctors_id` = `doctors`.`id`))) join `rooms` on((`rooms`.`id` = `visits`.`rooms_id`))) where (cast(`visits`.`appointment_time` as date) = (curdate() + interval 1 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `income_per_day`
--

/*!50001 DROP VIEW IF EXISTS `income_per_day`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `income_per_day` AS select `doctors`.`lastname` AS `lastname`,sum(`medical_services`.`price`) AS `summ` from ((`medical_services` join `visits` on((`visits`.`medical_services_id` = `medical_services`.`id`))) join `doctors` on((`visits`.`doctors_id` = `doctors`.`id`))) where (cast(`visits`.`appointment_time` as date) = curdate()) group by `doctors`.`lastname` union all select 'total' AS `total`,sum(`medical_services`.`price`) AS `su` from ((`medical_services` join `visits` on((`visits`.`medical_services_id` = `medical_services`.`id`))) join `doctors` on((`visits`.`doctors_id` = `doctors`.`id`))) where (cast(`visits`.`appointment_time` as date) = curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `invite_with_bad_tests`
--

/*!50001 DROP VIEW IF EXISTS `invite_with_bad_tests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invite_with_bad_tests` AS select `patients`.`firstname` AS `patient_name`,`patients`.`lastname` AS `patient_lastname`,`test_results`.`status` AS `status` from ((`patients` join `medical_card` on((`patients`.`id` = `medical_card`.`patients_id`))) join `test_results` on((`medical_card`.`test_results_id` = `test_results`.`id`))) where (`test_results`.`status` in ('positive','undefined')) */;
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

-- Dump completed on 2021-04-02 22:25:50
