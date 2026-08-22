-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: music
-- ------------------------------------------------------
-- Server version	8.0.28

CREATE DATABASE music;

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(150) NOT NULL,
  `artist_id` int NOT NULL,
  `release_year` int NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_artist_id` (`artist_id`),
  CONSTRAINT `fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Discovery',1,2001),(2,'Homework',1,1997),(3,'Take Care',2,2011),(4,'Scorpion',2,2018),(5,'A Night at the Opera',3,1975),(6,'News of the World',3,1977),(7,'Future Nostalgia',4,2020),(8,'Radical Optimism',4,2024),(9,'After Hours',5,2020),(10,'Starboy',5,2016),(11,'Good Kid',6,2012),(12,'DAMN',6,2017),(13,'Rumours',7,1977),(14,'Mirage',7,1982),(15,'Hit Me Hard',8,2024),(16,'When We All Fall',8,2019),(17,'What You See',9,2019),(18,'Growin Up',9,2022),(19,'Arrival',10,1976),(20,'Voulez Vous',10,1979),(21,'Thriller',11,1982),(22,'Bad',11,1987),(23,'Like a Virgin',12,1984),(24,'True Blue',12,1986),(25,'Oops I Did It Again',13,2000),(26,'In the Zone',13,2003),(27,'Come On Over',14,1997),(28,'Up',14,2002),(29,'18 Months',15,2012),(30,'Funk Wav Bounces',15,2017),(31,'Random Access',1,2013),(32,'Views',2,2016),(33,'The Game',3,1980),(34,'Dua Lipa Debut',4,2017),(35,'Dawn FM',5,2022),(36,'To Pimp a Butterfly',6,2015),(37,'Tusk',7,1979),(38,'Dont Smile at Me',8,2017),(39,'This Ones for You',9,2019),(40,'Number Ones',10,2006);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(50) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Daft Punk'),(2,'Drake'),(3,'Queen'),(4,'Dua Lipa'),(5,'The Weeknd'),(6,'Kendrick Lamar'),(7,'Fleetwood Mac'),(8,'Billie Eilish'),(9,'Luke Combs'),(10,'ABBA'),(11,'Michael Jackson'),(12,'Madonna'),(13,'Britney Spears'),(14,'Shania Twain'),(15,'Calvin Harris');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Dance'),(2,'Rock'),(3,'Hip Hop'),(4,'Pop'),(5,'Country'),(6,'Disco'),(7,'80s'),(8,'90s'),(9,'2000s');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_tracks`
--

DROP TABLE IF EXISTS `playlist_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_tracks` (
  `playlist_id` int NOT NULL,
  `song_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`song_id`),
  KEY `fk_pt_songs` (`song_id`),
  CONSTRAINT `fk_pt_playlists` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pt_songs` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_tracks`
--

LOCK TABLES `playlist_tracks` WRITE;
/*!40000 ALTER TABLE `playlist_tracks` DISABLE KEYS */;
INSERT INTO `playlist_tracks` VALUES (17,1),(18,2),(9,3),(14,4),(1,5),(3,6),(40,7),(30,8),(31,9),(15,10),(10,11),(13,12),(4,13),(5,14),(32,15),(39,16),(28,17),(29,18),(2,19),(6,20),(19,21),(35,22),(20,23),(34,24),(36,25),(37,26),(25,27),(26,28),(23,29),(21,30),(22,31),(12,32),(8,33),(16,34),(33,35),(11,36),(7,37),(38,38),(27,39),(24,40);
/*!40000 ALTER TABLE `playlist_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'70s Rock Vol 1','2026-08-22 22:26:38'),(2,'70s Rock Vol 2','2026-08-22 22:26:38'),(3,'70s Rock Vol 3','2026-08-22 22:26:38'),(4,'70s Rock Vol 4','2026-08-22 22:26:38'),(5,'70s Rock Vol 5','2026-08-22 22:26:38'),(6,'70s Rock Vol 6','2026-08-22 22:26:38'),(7,'70s Rock Vol 7','2026-08-22 22:26:38'),(8,'70s Rock Vol 8','2026-08-22 22:26:38'),(9,'2010 Hip Hop Vol 1','2026-08-22 22:26:38'),(10,'2010 Hip Hop Vol 2','2026-08-22 22:26:38'),(11,'2010 Hip Hop Vol 3','2026-08-22 22:26:38'),(12,'2010 Hip Hop Vol 4','2026-08-22 22:26:38'),(13,'2010 Hip Hop Vol 5','2026-08-22 22:26:38'),(14,'2010 Hip Hop Vol 6','2026-08-22 22:26:38'),(15,'2010 Hip Hop Vol 7','2026-08-22 22:26:38'),(16,'2010 Hip Hop Vol 8','2026-08-22 22:26:38'),(17,'Dance Anthems Vol 1','2026-08-22 22:26:38'),(18,'Dance Anthems Vol 2','2026-08-22 22:26:38'),(19,'Dance Anthems Vol 3','2026-08-22 22:26:38'),(20,'Dance Anthems Vol 4','2026-08-22 22:26:38'),(21,'Dance Anthems Vol 5','2026-08-22 22:26:38'),(22,'Dance Anthems Vol 6','2026-08-22 22:26:38'),(23,'Dance Anthems Vol 7','2026-08-22 22:26:38'),(24,'Dance Anthems Vol 8','2026-08-22 22:26:38'),(25,'Country Hits Vol 1','2026-08-22 22:26:38'),(26,'Country Hits Vol 2','2026-08-22 22:26:38'),(27,'Country Hits Vol 3','2026-08-22 22:26:38'),(28,'Country Hits Vol 4','2026-08-22 22:26:38'),(29,'Country Hits Vol 5','2026-08-22 22:26:38'),(30,'Pop Essentials Vol 1','2026-08-22 22:26:38'),(31,'Pop Essentials Vol 2','2026-08-22 22:26:38'),(32,'Pop Essentials Vol 3','2026-08-22 22:26:38'),(33,'Pop Essentials Vol 4','2026-08-22 22:26:38'),(34,'Pop Essentials Vol 5','2026-08-22 22:26:38'),(35,'Pop Essentials Vol 6','2026-08-22 22:26:38'),(36,'Pop Essentials Vol 7','2026-08-22 22:26:38'),(37,'Pop Essentials Vol 8','2026-08-22 22:26:38'),(38,'Pop Essentials Vol 9','2026-08-22 22:26:38'),(39,'Pop Essentials Vol 10','2026-08-22 22:26:38'),(40,'Pop Essentials Vol 11','2026-08-22 22:26:38');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `song_ID` int NOT NULL AUTO_INCREMENT,
  `song_name` varchar(150) NOT NULL,
  `bpm` int DEFAULT NULL,
  `album_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `song_key` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`song_ID`),
  KEY `album_id` (`album_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `album_id` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'One More Time',123,1,1,'5B'),(2,'Around the World',121,2,1,'4A'),(3,'Headlines',152,3,3,'6A'),(4,'Gods Plan',77,4,3,'4A'),(5,'Bohemian Rhapsody',72,5,2,'7B'),(6,'We Will Rock You',81,6,2,'11B'),(7,'Dont Start Now',124,7,4,'7A'),(8,'Houdini',117,8,4,'12A'),(9,'Blinding Lights',171,9,4,'1A'),(10,'Starboy',186,10,4,'12A'),(11,'Money Trees',72,11,3,'8B'),(12,'HUMBLE',150,12,3,'12A'),(13,'Dreams',120,13,2,'11B'),(14,'Go Your Own Way',135,13,2,'5B'),(15,'LUNCH',125,15,4,'8A'),(16,'bad guy',135,16,4,'7A'),(17,'Beer Never Broke My Heart',102,17,5,'1B'),(18,'Kind of Love We Make',85,18,5,'4B'),(19,'Dancing Queen',101,19,6,'9B'),(20,'Gimme Gimme Gimme',120,20,6,'11A'),(21,'Billie Jean',117,21,7,'4A'),(22,'Beat It',139,22,7,'3A'),(23,'Material Girl',120,23,7,'2B'),(24,'Papa Dont Preach',122,24,7,'8A'),(25,'Oops I Did It Again',95,25,9,'4A'),(26,'Toxic',143,26,9,'8A'),(27,'Man I Feel Like a Woman',125,27,8,'10B'),(28,'Youre Still the One',67,27,8,'1B'),(29,'Feel So Close',128,29,1,'7A'),(30,'Slide',104,30,1,'9A'),(31,'Get Lucky',116,31,6,'11B'),(32,'Hotline Bling',135,32,3,'9A'),(33,'Another One Bites the Dust',110,33,2,'12A'),(34,'New Rules',116,34,4,'7A'),(35,'Sacrifice',122,35,4,'11A'),(36,'Alright',110,36,3,'2A'),(37,'Hold Me',135,37,2,'5B'),(38,'Ocean Eyes',145,38,4,'7B'),(39,'Hurricane',79,39,5,'2B'),(40,'Mamma Mia',138,40,6,'5B');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-22 15:36:21
