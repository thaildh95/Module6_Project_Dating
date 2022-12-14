CREATE DATABASE  IF NOT EXISTS `dating_c04` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dating_c04`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: dating_c04
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `report_details`
--

DROP TABLE IF EXISTS `report_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int DEFAULT NULL,
  `time_report` datetime(6) DEFAULT NULL,
  `id_post` int DEFAULT NULL,
  `id_report` int DEFAULT NULL,
  `id_reporter` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3piv4ut3beiasks70t8eyqaja` (`id_post`),
  KEY `FK3nyrwm2wi5r4t6e6o76crbqdu` (`id_report`),
  KEY `FKdati1lxjjss8n54m71xhsvp9n` (`id_reporter`),
  CONSTRAINT `FK3nyrwm2wi5r4t6e6o76crbqdu` FOREIGN KEY (`id_report`) REFERENCES `report` (`id_report`),
  CONSTRAINT `FK3piv4ut3beiasks70t8eyqaja` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  CONSTRAINT `FKdati1lxjjss8n54m71xhsvp9n` FOREIGN KEY (`id_reporter`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_details`
--

LOCK TABLES `report_details` WRITE;
/*!40000 ALTER TABLE `report_details` DISABLE KEYS */;
INSERT INTO `report_details` VALUES (1,8,'2022-12-22 00:00:00.000000',3,1,7),(2,8,'2022-12-22 00:00:00.000000',3,1,5),(3,8,'2022-12-22 00:00:00.000000',3,1,12),(4,9,'2022-12-22 00:00:00.000000',3,1,6),(5,8,'2022-12-22 00:00:00.000000',3,1,9),(6,9,'2022-10-22 00:00:00.000000',2,4,1),(7,9,'2022-10-22 00:00:00.000000',2,4,10),(8,9,'2022-10-22 00:00:00.000000',2,4,14),(9,8,'2022-10-22 00:00:00.000000',2,4,13),(10,8,'2022-10-22 00:00:00.000000',2,4,15),(11,9,'2022-10-25 00:00:00.000000',5,6,11),(12,13,'2022-10-25 00:00:00.000000',5,6,2),(13,9,'2022-10-25 00:00:00.000000',5,6,4),(14,9,'2022-10-26 00:00:00.000000',5,6,1),(15,8,'2022-10-26 00:00:00.000000',5,6,6),(16,8,'2022-11-26 00:00:00.000000',16,2,19),(17,9,'2022-11-26 00:00:00.000000',16,2,17),(18,8,'2022-11-26 00:00:00.000000',16,2,11),(19,8,'2022-11-26 00:00:00.000000',16,2,12),(20,9,'2022-11-26 00:00:00.000000',16,2,13),(21,9,'2022-10-25 06:37:10.880000',25,8,2),(22,8,'2022-10-26 03:00:08.767000',63,3,35),(23,8,'2022-10-26 03:01:23.487000',63,5,35),(24,8,'2022-10-26 03:38:26.664000',23,6,37),(25,9,'2022-10-26 04:40:35.795000',55,6,38),(26,13,'2022-10-26 04:58:27.363000',23,5,38),(27,9,'2022-10-26 06:58:13.132000',69,8,7);
/*!40000 ALTER TABLE `report_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-26 16:59:54
