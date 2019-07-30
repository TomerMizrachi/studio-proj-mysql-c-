-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: studio
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `musician_has_instrument`
--

DROP TABLE IF EXISTS `musician_has_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `musician_has_instrument` (
  `musician_musician_id` int(11) NOT NULL,
  `instrument_instrument_id` int(11) NOT NULL,
  PRIMARY KEY (`musician_musician_id`,`instrument_instrument_id`),
  KEY `fk_musician_has_instrument_musician1_idx` (`musician_musician_id`),
  KEY `fk_musician_has_instrument_instrument1_idx` (`instrument_instrument_id`),
  CONSTRAINT `fk_musician_has_instrument_instrument1` FOREIGN KEY (`instrument_instrument_id`) REFERENCES `instrument` (`instrument_id`),
  CONSTRAINT `fk_musician_has_instrument_musician1` FOREIGN KEY (`musician_musician_id`) REFERENCES `musician` (`musician_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musician_has_instrument`
--

LOCK TABLES `musician_has_instrument` WRITE;
/*!40000 ALTER TABLE `musician_has_instrument` DISABLE KEYS */;
INSERT INTO `musician_has_instrument` VALUES (3,1),(3,9),(3,10),(5,2),(5,11),(6,3),(6,12),(8,4),(8,13),(8,14),(8,19),(10,5),(10,15),(10,16),(10,20),(11,6),(11,17),(13,1),(13,7),(14,2),(14,8),(14,18);
/*!40000 ALTER TABLE `musician_has_instrument` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-30 12:31:09
