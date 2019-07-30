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
-- Table structure for table `song_has_musician`
--

DROP TABLE IF EXISTS `song_has_musician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `song_has_musician` (
  `song_song_name` varchar(45) NOT NULL,
  `song_rec_date` date NOT NULL,
  `musician_musician_id` int(11) NOT NULL,
  PRIMARY KEY (`song_song_name`,`song_rec_date`,`musician_musician_id`),
  KEY `fk_song_has_musician_song1_idx` (`song_song_name`,`song_rec_date`),
  KEY `fk_song_has_musician_musician1_idx` (`musician_musician_id`),
  CONSTRAINT `fk_song_has_musician_musician1` FOREIGN KEY (`musician_musician_id`) REFERENCES `musician` (`musician_id`),
  CONSTRAINT `fk_song_has_musician_song1` FOREIGN KEY (`song_song_name`, `song_rec_date`) REFERENCES `song` (`song_name`, `rec_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_has_musician`
--

LOCK TABLES `song_has_musician` WRITE;
/*!40000 ALTER TABLE `song_has_musician` DISABLE KEYS */;
INSERT INTO `song_has_musician` VALUES ('because','2002-05-10',1),('love','2000-02-10',1),('memory','2000-03-12',1),('nostalgic','2000-03-14',1),('love','2000-02-10',2),('memory','2000-03-12',2),('nostalgic','2000-03-14',2),('love','2000-02-10',3),('memory','2000-03-12',3),('nostalgic','2000-03-14',3),('baby','2001-06-15',4),('dance','2001-05-12',4),('do it','2001-03-10',4),('say it','2001-03-30',4),('baby','2001-06-15',5),('dance','2001-05-12',5),('do it','2001-03-10',5),('say it','2001-03-30',5),('baby','2001-06-15',6),('dance','2001-05-12',6),('do it','2001-03-10',6),('say it','2001-03-30',6),('bey','2002-06-22',7),('take','2002-03-30',7),('you','2002-03-01',7),('take','2002-03-30',8),('why','2002-04-15',8),('you','2002-03-01',8),('money','2003-04-04',9),('take','2002-03-30',10),('why','2002-04-15',10),('you','2002-03-01',10),('dead','2003-05-02',11),('main','2003-05-30',12),('all ways','2005-08-08',13),('gess','2005-06-10',13),('street','2003-06-20',13),('ben','2004-07-10',14),('gin','2004-05-12',14),('halelu','2004-06-06',14),('small','2005-09-11',14),('sure','2005-07-01',14),('tonik','2004-05-30',14);
/*!40000 ALTER TABLE `song_has_musician` ENABLE KEYS */;
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
