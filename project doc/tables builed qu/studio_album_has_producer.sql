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
-- Table structure for table `album_has_producer`
--

DROP TABLE IF EXISTS `album_has_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `album_has_producer` (
  `album_album_id` int(11) NOT NULL,
  `producer_producer_id` int(11) NOT NULL,
  PRIMARY KEY (`album_album_id`,`producer_producer_id`),
  KEY `fk_album_has_producer_album1_idx` (`album_album_id`),
  KEY `fk_album_has_producer_producer1_idx` (`producer_producer_id`),
  CONSTRAINT `fk_album_has_producer_album1` FOREIGN KEY (`album_album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `fk_album_has_producer_producer1` FOREIGN KEY (`producer_producer_id`) REFERENCES `producer` (`producer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_has_producer`
--

LOCK TABLES `album_has_producer` WRITE;
/*!40000 ALTER TABLE `album_has_producer` DISABLE KEYS */;
INSERT INTO `album_has_producer` VALUES (1,1),(1,2),(1,3),(1,14),(2,3),(2,4),(2,5),(3,5),(3,6),(3,7),(4,8),(4,9),(4,10),(4,12),(5,7),(5,11),(5,12),(6,11),(6,13),(6,14);
/*!40000 ALTER TABLE `album_has_producer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-30 12:31:11
