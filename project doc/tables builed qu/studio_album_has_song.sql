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
-- Table structure for table `album_has_song`
--

DROP TABLE IF EXISTS `album_has_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `album_has_song` (
  `album_album_id` int(11) NOT NULL,
  `song_song_name` varchar(45) NOT NULL,
  `song_rec_date` date NOT NULL,
  PRIMARY KEY (`album_album_id`,`song_song_name`,`song_rec_date`),
  KEY `fk_album_has_song_album1_idx` (`album_album_id`),
  KEY `fk_album_has_song_song1_idx` (`song_song_name`,`song_rec_date`),
  CONSTRAINT `fk_album_has_song_album1` FOREIGN KEY (`album_album_id`) REFERENCES `album` (`album_id`),
  CONSTRAINT `fk_album_has_song_song1` FOREIGN KEY (`song_song_name`, `song_rec_date`) REFERENCES `song` (`song_name`, `rec_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_has_song`
--

LOCK TABLES `album_has_song` WRITE;
/*!40000 ALTER TABLE `album_has_song` DISABLE KEYS */;
INSERT INTO `album_has_song` VALUES (1,'love','2000-02-10'),(1,'memory','2000-03-12'),(1,'nostalgic','2000-03-14'),(2,'baby','2001-06-15'),(2,'dance','2001-05-12'),(2,'do it','2001-03-10'),(2,'say it','2001-03-30'),(3,'because','2002-05-10'),(3,'bey','2002-06-22'),(3,'take','2002-03-30'),(3,'why','2002-04-15'),(3,'you','2002-03-01'),(4,'dead','2003-05-02'),(4,'main','2003-05-30'),(4,'money','2003-04-04'),(4,'street','2003-06-20'),(5,'ben','2004-07-10'),(5,'gin','2004-05-12'),(5,'halelu','2004-06-06'),(5,'tonik','2004-05-30'),(6,'all ways','2005-08-08'),(6,'gess','2005-06-10'),(6,'small','2005-09-11'),(6,'sure','2005-07-01');
/*!40000 ALTER TABLE `album_has_song` ENABLE KEYS */;
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
