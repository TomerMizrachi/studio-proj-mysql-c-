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
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `song` (
  `song_name` varchar(45) NOT NULL,
  `rec_date` date NOT NULL,
  `aut_f_name` varchar(45) DEFAULT NULL,
  `aut_l_name` varchar(45) DEFAULT NULL,
  `comp_f_name` varchar(45) DEFAULT NULL,
  `comp_l_name` varchar(45) DEFAULT NULL,
  `length_sec` int(11) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `fk_tech_id` int(11) NOT NULL,
  PRIMARY KEY (`song_name`,`rec_date`),
  KEY `fk_tech_id` (`fk_tech_id`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`fk_tech_id`) REFERENCES `technician` (`tech_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES ('all ways','2005-08-08','dede','fefe','dede','fefe',198,'funk',14),('baby','2001-06-15','d','e','f','f',199,'rock',3),('because','2002-05-10','g','g','j','j',200,'pop',4),('ben','2004-07-10','molo','chak','deni','solo',221,'folk',12),('bey','2002-06-22','j','j','j','j',160,'pop',4),('dance','2001-05-12','d','e','e','e',195,'rock',3),('dead','2003-05-02','bo','bo','til','til',250,'hip hop',6),('do it','2001-03-10','d','d','d','d',180,'rock',2),('gess','2005-06-10','dede','fefe','rev','lev',190,'funk',13),('gin','2004-05-12','red','ba','din','gu',190,'folk',9),('halelu','2004-06-06','fed','ei','tin','tim',204,'folk',11),('love','2000-02-10','a','a','b','b',190,'jazz',1),('main','2003-05-30','bo','bo','til','til',220,'hip hop',7),('memory','2000-03-12','a','b','b','b',200,'jazz',1),('money','2003-04-04','bo','bo','til','til',243,'hip hop',5),('nostalgic','2000-03-14','a','c','b','b',207,'jazz',2),('say it','2001-03-30','d','d','e','e',189,'rock',3),('small','2005-09-11','rene','kar','rev','lev',219,'funk',8),('street','2003-06-20','bo','bo','shin','din',210,'hip hop',8),('sure','2005-07-01','sid','sod','rev','lev',201,'funk',14),('take','2002-03-30','g','k','j','j',201,'pop',5),('tonik','2004-05-30','ted','ton','rel','bon',210,'folk',10),('why','2002-04-15','g','k','j','j',210,'pop',6),('you','2002-03-01','g','g','j','j',199,'pop',4);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-30 12:31:10
