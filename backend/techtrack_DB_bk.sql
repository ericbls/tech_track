-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: ProjetoFinal
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `dados_maquinas`
--

DROP TABLE IF EXISTS `dados_maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dados_maquinas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_maquina` int(10) unsigned DEFAULT NULL,
  `estado` int(10) unsigned NOT NULL DEFAULT '0',
  `data_maq` datetime NOT NULL,
  `deltaT` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_maquina` (`id_maquina`),
  CONSTRAINT `dados_maquinas_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_registradas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dados_maquinas`
--

LOCK TABLES `dados_maquinas` WRITE;
/*!40000 ALTER TABLE `dados_maquinas` DISABLE KEYS */;
INSERT INTO `dados_maquinas` VALUES (1,1,0,'2019-11-04 00:00:00',0),(2,3,0,'2019-11-04 00:00:00',0),(3,5,0,'2019-11-04 00:00:00',0),(4,14,0,'2019-11-04 00:00:00',0),(5,1,1,'2019-11-04 08:14:00',29640),(6,1,0,'2019-11-04 08:55:00',2460),(7,1,1,'2019-11-04 09:47:00',3120),(8,1,0,'2019-11-04 11:10:00',4980),(9,1,1,'2019-11-04 13:11:00',7260),(10,1,0,'2019-11-04 14:10:00',3540),(11,1,1,'2019-11-04 14:32:00',1320),(12,1,0,'2019-11-04 14:59:00',1620),(13,1,1,'2019-11-04 15:25:00',1560),(14,1,0,'2019-11-04 16:05:00',2400),(15,1,1,'2019-11-04 16:45:00',2400),(16,1,0,'2019-11-04 18:10:00',5100),(17,1,1,'2019-11-04 19:05:00',3300),(18,1,0,'2019-11-04 20:00:00',3300),(19,1,1,'2019-11-05 08:05:00',43500),(20,1,0,'2019-11-05 09:14:00',4140),(21,1,1,'2019-11-05 09:54:00',2400),(22,1,0,'2019-11-05 10:48:00',3240),(23,1,1,'2019-11-05 11:22:00',2040),(24,1,0,'2019-11-05 12:12:00',3000),(25,1,1,'2019-11-05 13:14:00',3720),(26,1,0,'2019-11-05 14:14:00',3600),(27,1,1,'2019-11-05 14:20:00',360),(28,1,0,'2019-11-05 15:27:00',4020),(29,1,1,'2019-11-05 16:32:00',3900),(30,1,0,'2019-11-05 18:09:00',5820),(31,1,1,'2019-11-05 18:53:00',2640),(32,1,0,'2019-11-05 20:10:00',4620),(33,1,1,'2019-11-06 07:34:00',41040),(34,1,0,'2019-11-06 08:14:00',2400),(35,1,1,'2019-11-06 08:20:00',360),(36,1,0,'2019-11-06 09:00:00',2400),(37,1,1,'2019-11-06 10:54:00',6840),(38,1,0,'2019-11-06 11:12:00',1080),(39,1,1,'2019-11-06 13:32:00',8400),(40,1,0,'2019-11-06 14:46:00',4440),(41,1,1,'2019-11-06 15:02:00',960),(42,1,0,'2019-11-06 16:39:00',5820),(43,1,1,'2019-11-06 17:01:00',1320),(44,1,0,'2019-11-06 18:14:00',4380),(45,1,1,'2019-11-06 18:24:00',600),(46,1,0,'2019-11-06 19:58:00',5640),(47,1,1,'2019-11-07 07:43:00',42300),(48,1,0,'2019-11-07 08:03:00',1200),(49,1,1,'2019-11-07 10:03:00',7200),(50,1,0,'2019-11-07 10:49:00',2760),(51,1,1,'2019-11-07 11:20:00',1860),(52,1,0,'2019-11-07 13:03:00',6180),(53,1,1,'2019-11-07 14:57:00',6840),(54,1,0,'2019-11-07 15:36:00',2340),(55,1,1,'2019-11-07 16:20:00',2640),(56,1,0,'2019-11-07 17:33:00',4380),(57,1,1,'2019-11-07 17:40:00',420),(58,1,0,'2019-11-07 18:53:00',4380),(59,1,1,'2019-11-07 19:03:00',600),(60,1,0,'2019-11-07 20:30:00',5220),(61,1,1,'2019-11-08 08:05:00',41700),(62,1,0,'2019-11-08 09:35:00',5400),(63,1,1,'2019-11-08 09:55:00',1200),(64,1,0,'2019-11-08 11:08:00',4380),(65,1,1,'2019-11-08 11:13:00',300),(66,1,0,'2019-11-08 12:11:00',3480),(67,1,1,'2019-11-08 12:29:00',1080),(68,1,0,'2019-11-08 13:00:00',1860),(69,1,1,'2019-11-08 13:30:00',1800),(70,1,0,'2019-11-08 14:55:00',5100),(71,1,1,'2019-11-08 15:21:00',1560),(72,1,0,'2019-11-08 16:37:00',4560),(73,1,1,'2019-11-08 17:31:00',3240),(74,1,0,'2019-11-08 18:44:00',4380),(75,1,1,'2019-11-11 08:10:00',221160),(76,1,0,'2019-11-11 08:53:00',2580),(77,1,1,'2019-11-11 09:40:00',2820),(78,1,0,'2019-11-11 11:15:00',5700),(79,1,1,'2019-11-11 13:19:00',7440),(80,1,0,'2019-11-11 14:02:00',2580),(81,1,1,'2019-11-11 14:32:00',1800),(82,1,0,'2019-11-11 14:52:00',1200),(83,1,1,'2019-11-11 15:28:00',2160),(84,1,0,'2019-11-11 16:03:00',2100),(85,1,1,'2019-11-11 16:41:00',2280),(86,1,0,'2019-11-11 18:02:00',4860),(87,1,1,'2019-11-11 19:25:00',4980),(88,1,0,'2019-11-11 20:15:00',3000),(89,1,1,'2019-11-12 07:53:00',41880),(90,1,0,'2019-11-12 09:01:00',4080),(91,1,1,'2019-11-12 09:52:00',3060),(92,1,0,'2019-11-12 10:52:00',3600),(93,1,1,'2019-11-12 11:37:00',2700),(94,1,0,'2019-11-12 12:48:00',4260),(95,1,1,'2019-11-12 13:23:00',2100),(96,1,0,'2019-11-12 14:34:00',4260),(97,1,1,'2019-11-12 14:40:00',360),(98,1,0,'2019-11-12 15:24:00',2640),(99,1,1,'2019-11-12 16:48:00',5040),(100,1,0,'2019-11-12 18:15:00',5220),(101,1,1,'2019-11-12 18:53:00',2280),(102,1,0,'2019-11-12 20:20:00',5220),(103,1,1,'2019-11-13 07:40:00',40800),(104,1,0,'2019-11-13 08:19:00',2340),(105,1,1,'2019-11-13 08:26:00',420),(106,1,0,'2019-11-13 09:34:00',4080),(107,1,1,'2019-11-13 10:59:00',5100),(108,1,0,'2019-11-13 11:45:00',2760),(109,1,1,'2019-11-13 13:32:00',6420),(110,1,0,'2019-11-13 14:40:00',4080),(111,1,1,'2019-11-13 15:10:00',1800),(112,1,0,'2019-11-13 16:49:00',5940),(113,1,1,'2019-11-13 17:19:00',1800),(114,1,0,'2019-11-13 18:23:00',3840),(115,1,1,'2019-11-13 18:37:00',840),(116,1,0,'2019-11-13 19:51:00',4440),(117,1,1,'2019-11-14 07:30:00',41940),(118,1,0,'2019-11-14 08:50:00',4800),(119,1,1,'2019-11-14 09:49:00',3540),(120,1,0,'2019-11-14 10:53:00',3840),(121,1,1,'2019-11-14 11:17:00',1440),(122,1,0,'2019-11-14 13:00:00',6180),(123,1,1,'2019-11-14 14:50:00',6600),(124,1,0,'2019-11-14 15:25:00',2100),(125,1,1,'2019-11-14 16:10:00',2700),(126,1,0,'2019-11-14 17:43:00',5580),(127,1,1,'2019-11-14 17:55:00',720),(128,1,0,'2019-11-14 19:01:00',3960),(129,1,1,'2019-11-14 19:09:00',480),(130,1,0,'2019-11-14 20:25:00',4560),(131,1,1,'2019-11-15 07:53:00',41280),(132,1,0,'2019-11-15 09:20:00',5220),(133,1,1,'2019-11-15 09:48:00',1680),(134,1,0,'2019-11-15 11:00:00',4320),(135,1,1,'2019-11-15 11:20:00',1200),(136,1,0,'2019-11-15 12:24:00',3840),(137,1,1,'2019-11-15 12:31:00',420),(138,1,0,'2019-11-15 13:05:00',2040),(139,1,1,'2019-11-15 13:36:00',1860),(140,1,0,'2019-11-15 14:55:00',4740),(141,1,1,'2019-11-15 15:25:00',1800),(142,1,0,'2019-11-15 16:47:00',4920),(143,1,1,'2019-11-15 17:21:00',2040),(144,1,0,'2019-11-15 18:32:00',4260),(145,1,1,'2019-11-18 08:01:00',221340),(146,1,0,'2019-11-18 09:13:00',4320),(147,1,1,'2019-11-18 09:41:00',1680),(148,1,0,'2019-11-18 11:19:00',5880),(149,1,1,'2019-11-18 13:09:00',6600),(150,1,0,'2019-11-18 14:02:00',3180),(151,1,1,'2019-11-18 14:12:00',600),(152,1,0,'2019-11-18 14:49:00',2220),(153,1,1,'2019-11-18 15:08:00',1140),(154,1,0,'2019-11-18 16:23:00',4500),(155,1,1,'2019-11-18 16:31:00',480),(156,1,0,'2019-11-18 17:32:00',3660),(157,1,1,'2019-11-18 19:05:00',5580),(158,1,0,'2019-11-18 20:21:00',4560),(159,1,1,'2019-11-19 07:43:00',40920),(160,1,0,'2019-11-19 09:20:00',5820),(161,1,1,'2019-11-19 10:12:00',3120),(162,1,0,'2019-11-19 11:52:00',6000),(163,1,1,'2019-11-19 12:07:00',900),(164,1,0,'2019-11-19 12:58:00',3060),(165,1,1,'2019-11-19 13:43:00',2700),(166,1,0,'2019-11-19 14:54:00',4260),(167,1,1,'2019-11-19 15:30:00',2160),(168,1,0,'2019-11-19 15:44:00',840),(169,1,1,'2019-11-19 16:58:00',4440),(170,1,0,'2019-11-19 18:45:00',6420),(171,1,1,'2019-11-19 18:53:00',480),(172,1,0,'2019-11-19 20:16:00',4980),(173,1,1,'2019-11-20 08:04:00',42480),(174,1,0,'2019-11-20 08:59:00',3300),(175,1,1,'2019-11-20 09:06:00',420),(176,1,0,'2019-11-20 09:44:00',2280),(177,1,1,'2019-11-20 10:59:00',4500),(178,1,0,'2019-11-20 11:55:00',3360),(179,1,1,'2019-11-20 13:42:00',6420),(180,1,0,'2019-11-20 14:51:00',4140),(181,1,1,'2019-11-20 15:03:00',720),(182,1,0,'2019-11-20 16:49:00',6360),(183,1,1,'2019-11-20 17:29:00',2400),(184,1,0,'2019-11-20 18:43:00',4440),(185,1,1,'2019-11-20 18:57:00',840),(186,1,0,'2019-11-20 19:41:00',2640),(187,1,1,'2019-11-21 07:40:00',43140),(188,1,0,'2019-11-21 08:53:00',4380),(189,1,1,'2019-11-21 09:43:00',3000),(190,1,0,'2019-11-21 10:43:00',3600),(191,1,1,'2019-11-21 11:37:00',3240),(192,1,0,'2019-11-21 12:30:00',3180),(193,1,1,'2019-11-21 14:44:00',8040),(194,1,0,'2019-11-21 15:52:00',4080),(195,1,1,'2019-11-21 16:10:00',1080),(196,1,0,'2019-11-21 17:33:00',4980),(197,1,1,'2019-11-21 17:46:00',780),(198,1,0,'2019-11-21 19:11:00',5100),(199,1,1,'2019-11-21 19:29:00',1080),(200,1,0,'2019-11-21 20:35:00',3960),(201,1,1,'2019-11-22 07:33:00',39480),(202,1,0,'2019-11-22 09:31:00',7080),(203,1,1,'2019-11-22 09:45:00',840),(204,1,0,'2019-11-22 11:10:00',5100),(205,1,1,'2019-11-22 11:23:00',780),(206,1,0,'2019-11-22 13:24:00',7260),(207,1,1,'2019-11-22 13:31:00',420),(208,1,0,'2019-11-22 13:45:00',840),(209,1,1,'2019-11-22 13:56:00',660),(210,1,0,'2019-11-22 14:35:00',2340),(211,1,1,'2019-11-22 15:25:00',3000),(212,1,0,'2019-11-22 16:53:00',5280),(213,1,1,'2019-11-22 17:11:00',1080),(214,1,0,'2019-11-22 18:06:00',3300),(215,3,1,'2019-11-04 08:34:00',30840),(216,3,0,'2019-11-04 09:55:00',4860),(217,3,1,'2019-11-04 10:07:00',720),(218,3,0,'2019-11-04 11:10:00',3780),(219,3,1,'2019-11-04 11:45:00',2100),(220,3,0,'2019-11-04 13:10:00',5100),(221,3,1,'2019-11-04 14:06:00',3360),(222,3,0,'2019-11-04 15:29:00',4980),(223,3,1,'2019-11-04 15:41:00',720),(224,3,0,'2019-11-04 16:35:00',3240),(225,3,1,'2019-11-04 16:48:00',780),(226,3,0,'2019-11-04 18:03:00',4500),(227,3,1,'2019-11-04 19:25:00',4920),(228,3,0,'2019-11-04 20:12:00',2820),(229,3,1,'2019-11-05 07:45:00',41580),(230,3,0,'2019-11-05 09:23:00',5880),(231,3,1,'2019-11-05 09:47:00',1440),(232,3,0,'2019-11-05 10:58:00',4260),(233,3,1,'2019-11-05 11:37:00',2340),(234,3,0,'2019-11-05 12:30:00',3180),(235,3,1,'2019-11-05 13:34:00',3840),(236,3,0,'2019-11-05 14:44:00',4200),(237,3,1,'2019-11-05 14:53:00',540),(238,3,0,'2019-11-05 15:45:00',3120),(239,3,1,'2019-11-05 16:22:00',2220),(240,3,0,'2019-11-05 18:09:00',6420),(241,3,1,'2019-11-05 18:23:00',840),(242,3,0,'2019-11-05 20:22:00',7140),(243,3,1,'2019-11-06 08:04:00',42120),(244,3,0,'2019-11-06 09:14:00',4200),(245,3,1,'2019-11-06 09:34:00',1200),(246,3,0,'2019-11-06 10:23:00',2940),(247,3,1,'2019-11-06 10:54:00',1860),(248,3,0,'2019-11-06 11:45:00',3060),(249,3,1,'2019-11-06 13:52:00',7620),(250,3,0,'2019-11-06 14:36:00',2640),(251,3,1,'2019-11-06 15:12:00',2160),(252,3,0,'2019-11-06 16:29:00',4620),(253,3,1,'2019-11-06 17:16:00',2820),(254,3,0,'2019-11-06 18:34:00',4680),(255,3,1,'2019-11-06 18:54:00',1200),(256,3,0,'2019-11-06 20:08:00',4440),(257,3,1,'2019-11-07 07:53:00',42300),(258,3,0,'2019-11-07 08:48:00',3300),(259,3,1,'2019-11-07 09:03:00',900),(260,3,0,'2019-11-07 10:28:00',5100),(261,3,1,'2019-11-07 11:31:00',3780),(262,3,0,'2019-11-07 12:45:00',4440),(263,3,1,'2019-11-07 14:50:00',7500),(264,3,0,'2019-11-07 15:43:00',3180),(265,3,1,'2019-11-07 16:13:00',1800),(266,3,0,'2019-11-07 17:28:00',4500),(267,3,1,'2019-11-07 17:50:00',1320),(268,3,0,'2019-11-07 18:58:00',4080),(269,3,1,'2019-11-07 19:13:00',900),(270,3,0,'2019-11-07 20:25:00',4320),(271,3,1,'2019-11-08 08:11:00',42360),(272,3,0,'2019-11-08 09:44:00',5580),(273,3,1,'2019-11-08 09:55:00',660),(274,3,0,'2019-11-08 11:48:00',6780),(275,3,1,'2019-11-08 13:13:00',5100),(276,3,0,'2019-11-08 13:51:00',2280),(277,3,1,'2019-11-08 14:02:00',660),(278,3,0,'2019-11-08 14:40:00',2280),(279,3,1,'2019-11-08 15:00:00',1200),(280,3,0,'2019-11-08 15:55:00',3300),(281,3,1,'2019-11-08 16:02:00',420),(282,3,0,'2019-11-08 16:57:00',3300),(283,3,1,'2019-11-08 17:21:00',1440),(284,3,0,'2019-11-08 18:14:00',3180),(285,3,1,'2019-11-11 08:00:00',222360),(286,3,0,'2019-11-11 08:57:00',3420),(287,3,1,'2019-11-11 09:30:00',1980),(288,3,0,'2019-11-11 11:23:00',6780),(289,3,1,'2019-11-11 13:29:00',7560),(290,3,0,'2019-11-11 14:02:00',1980),(291,3,1,'2019-11-11 14:12:00',600),(292,3,0,'2019-11-11 14:52:00',2400),(293,3,1,'2019-11-11 15:29:00',2220),(294,3,0,'2019-11-11 16:13:00',2640),(295,3,1,'2019-11-11 16:36:00',1380),(296,3,0,'2019-11-11 18:12:00',5760),(297,3,1,'2019-11-11 19:15:00',3780),(298,3,0,'2019-11-11 20:18:00',3780),(299,3,1,'2019-11-12 07:43:00',41100),(300,3,0,'2019-11-12 09:10:00',5220),(301,3,1,'2019-11-12 09:42:00',1920),(302,3,0,'2019-11-12 10:57:00',4500),(303,3,1,'2019-11-12 11:57:00',3600),(304,3,0,'2019-11-12 12:38:00',2460),(305,3,1,'2019-11-12 13:45:00',4020),(306,3,0,'2019-11-12 14:54:00',4140),(307,3,1,'2019-11-12 15:04:00',600),(308,3,0,'2019-11-12 15:56:00',3120),(309,3,1,'2019-11-12 16:28:00',1920),(310,3,0,'2019-11-12 18:01:00',5580),(311,3,1,'2019-11-12 18:53:00',3120),(312,3,0,'2019-11-12 20:28:00',5700),(313,3,1,'2019-11-13 07:40:00',40320),(314,3,0,'2019-11-13 08:19:00',2340),(315,3,1,'2019-11-13 08:26:00',420),(316,3,0,'2019-11-13 09:34:00',4080),(317,3,1,'2019-11-13 10:45:00',4260),(318,3,0,'2019-11-13 11:45:00',3600),(319,3,1,'2019-11-13 13:42:00',7020),(320,3,0,'2019-11-13 14:50:00',4080),(321,3,1,'2019-11-13 15:45:00',3300),(322,3,0,'2019-11-13 16:49:00',3840),(323,3,1,'2019-11-13 17:23:00',2040),(324,3,0,'2019-11-13 18:44:00',4860),(325,3,1,'2019-11-13 18:57:00',780),(326,3,0,'2019-11-13 19:41:00',2640),(327,3,1,'2019-11-14 07:39:00',43080),(328,3,0,'2019-11-14 08:43:00',3840),(329,3,1,'2019-11-14 09:29:00',2760),(330,3,0,'2019-11-14 10:43:00',4440),(331,3,1,'2019-11-14 11:09:00',1560),(332,3,0,'2019-11-14 11:45:00',2160),(333,3,1,'2019-11-14 14:50:00',11100),(334,3,0,'2019-11-14 15:45:00',3300),(335,3,1,'2019-11-14 16:43:00',3480),(336,3,0,'2019-11-14 17:31:00',2880),(337,3,1,'2019-11-14 17:56:00',1500),(338,3,0,'2019-11-14 19:15:00',4740),(339,3,1,'2019-11-14 19:29:00',840),(340,3,0,'2019-11-14 20:12:00',2580),(341,3,1,'2019-11-15 08:23:00',43860),(342,3,0,'2019-11-15 09:20:00',3420),(343,3,1,'2019-11-15 09:37:00',1020),(344,3,0,'2019-11-15 11:05:00',5280),(345,3,1,'2019-11-15 11:30:00',1500),(346,3,0,'2019-11-15 12:45:00',4500),(347,3,1,'2019-11-15 12:51:00',360),(348,3,0,'2019-11-15 13:35:00',2640),(349,3,1,'2019-11-15 13:46:00',660),(350,3,0,'2019-11-15 14:55:00',4140),(351,3,1,'2019-11-15 15:32:00',2220),(352,3,0,'2019-11-15 16:22:00',3000),(353,3,1,'2019-11-15 17:31:00',4140),(354,3,0,'2019-11-15 18:42:00',4260),(355,3,1,'2019-11-18 08:10:00',221280),(356,3,0,'2019-11-18 09:34:00',5040),(357,3,1,'2019-11-18 09:41:00',420),(358,3,0,'2019-11-18 11:29:00',6480),(359,3,1,'2019-11-18 13:39:00',7800),(360,3,0,'2019-11-18 14:42:00',3780),(361,3,1,'2019-11-18 14:56:00',840),(362,3,0,'2019-11-18 15:23:00',1620),(363,3,1,'2019-11-18 15:41:00',1080),(364,3,0,'2019-11-18 16:22:00',2460),(365,3,1,'2019-11-18 19:15:00',10380),(366,3,0,'2019-11-18 20:32:00',4620),(367,3,1,'2019-11-19 07:53:00',40860),(368,3,0,'2019-11-19 09:12:00',4740),(369,3,1,'2019-11-19 10:45:00',5580),(370,3,0,'2019-11-19 11:56:00',4260),(371,3,1,'2019-11-19 13:07:00',4260),(372,3,0,'2019-11-19 13:58:00',3060),(373,3,1,'2019-11-19 14:13:00',900),(374,3,0,'2019-11-19 14:56:00',2580),(375,3,1,'2019-11-19 15:01:00',300),(376,3,0,'2019-11-19 15:56:00',3300),(377,3,1,'2019-11-19 16:28:00',1920),(378,3,0,'2019-11-19 18:31:00',7380),(379,3,1,'2019-11-19 18:43:00',720),(380,3,0,'2019-11-19 20:06:00',4980),(381,3,1,'2019-11-20 08:14:00',43680),(382,3,0,'2019-11-20 08:59:00',2700),(383,3,1,'2019-11-20 09:16:00',1020),(384,3,0,'2019-11-20 09:42:00',1560),(385,3,1,'2019-11-20 09:59:00',1020),(386,3,0,'2019-11-20 11:25:00',5160),(387,3,1,'2019-11-20 13:32:00',7620),(388,3,0,'2019-11-20 14:45:00',4380),(389,3,1,'2019-11-20 15:13:00',1680),(390,3,0,'2019-11-20 16:38:00',5100),(391,3,1,'2019-11-20 17:41:00',3780),(392,3,0,'2019-11-20 18:52:00',4260),(393,3,1,'2019-11-20 19:07:00',900),(394,3,0,'2019-11-20 19:51:00',2640),(395,3,1,'2019-11-21 07:40:00',42540),(396,3,0,'2019-11-21 08:44:00',3840),(397,3,1,'2019-11-21 09:56:00',4320),(398,3,0,'2019-11-21 11:01:00',3900),(399,3,1,'2019-11-21 11:25:00',1440),(400,3,0,'2019-11-21 12:00:00',2100),(401,3,1,'2019-11-21 14:24:00',8640),(402,3,0,'2019-11-21 15:32:00',4080),(403,3,1,'2019-11-21 16:00:00',1680),(404,3,0,'2019-11-21 17:47:00',6420),(405,3,1,'2019-11-21 18:06:00',1140),(406,3,0,'2019-11-21 19:11:00',3900),(407,3,1,'2019-11-21 19:39:00',1680),(408,3,0,'2019-11-21 20:23:00',2640),(409,3,1,'2019-11-22 07:50:00',41220),(410,3,0,'2019-11-22 09:39:00',6540),(411,3,1,'2019-11-22 09:48:00',540),(412,3,0,'2019-11-22 11:17:00',5340),(413,3,1,'2019-11-22 11:31:00',840),(414,3,0,'2019-11-22 13:34:00',7380),(415,3,1,'2019-11-22 13:47:00',780),(416,3,0,'2019-11-22 14:45:00',3480),(417,3,1,'2019-11-22 15:16:00',1860),(418,3,0,'2019-11-22 15:55:00',2340),(419,3,1,'2019-11-22 16:05:00',600),(420,3,0,'2019-11-22 16:53:00',2880),(421,3,1,'2019-11-22 17:20:00',1620),(422,3,0,'2019-11-22 18:36:00',4560),(423,3,1,'2019-11-25 07:51:00',220500),(424,3,0,'2019-11-25 08:57:00',3960),(425,3,1,'2019-11-25 09:20:00',1380),(426,3,0,'2019-11-25 11:29:00',7740),(427,3,1,'2019-11-25 13:59:00',9000),(428,3,0,'2019-11-25 14:42:00',2580),(429,3,1,'2019-11-25 14:56:00',840),(430,3,0,'2019-11-25 15:44:00',2880),(431,3,1,'2019-11-25 15:50:00',360),(432,3,0,'2019-11-25 16:55:00',3900),(433,3,1,'2019-11-25 17:15:00',1200),(434,3,0,'2019-11-25 18:02:00',2820),(435,3,1,'2019-11-25 18:15:00',780),(436,3,0,'2019-11-25 20:00:00',6300),(437,3,1,'2019-11-26 08:06:00',43560),(438,3,0,'2019-11-26 09:52:00',6360),(439,3,1,'2019-11-26 10:19:00',1620),(440,3,0,'2019-11-26 11:49:00',5400),(441,3,1,'2019-11-26 12:55:00',3960),(442,3,0,'2019-11-26 13:28:00',1980),(443,3,1,'2019-11-26 13:54:00',1560),(444,3,0,'2019-11-26 14:47:00',3180),(445,3,1,'2019-11-26 14:59:00',720),(446,3,0,'2019-11-26 15:45:00',2760),(447,3,1,'2019-11-26 16:37:00',3120),(448,3,0,'2019-11-26 18:25:00',6480),(449,3,1,'2019-11-26 18:43:00',1080),(450,3,0,'2019-11-26 20:23:00',6000),(451,3,1,'2019-11-27 08:11:00',42480),(452,3,0,'2019-11-27 09:39:00',5280),(453,3,1,'2019-11-27 09:46:00',420),(454,3,0,'2019-11-27 10:57:00',4260),(455,3,1,'2019-11-27 11:09:00',720),(456,3,0,'2019-11-27 11:50:00',2460),(457,3,1,'2019-11-27 13:42:00',6720),(458,3,0,'2019-11-27 14:51:00',4140),(459,3,1,'2019-11-27 15:13:00',1320),(460,3,0,'2019-11-27 16:34:00',4860),(461,3,1,'2019-11-27 17:25:00',3060),(462,3,0,'2019-11-27 18:34:00',4140),(463,3,1,'2019-11-27 19:20:00',2760),(464,3,0,'2019-11-27 20:01:00',2460),(465,3,1,'2019-11-28 08:01:00',43200),(466,3,0,'2019-11-28 09:24:00',4980),(467,3,1,'2019-11-28 10:34:00',4200),(468,3,0,'2019-11-28 11:11:00',2220),(469,3,1,'2019-11-28 11:27:00',960),(470,3,0,'2019-11-28 12:10:00',2580),(471,3,1,'2019-11-28 14:04:00',6840),(472,3,0,'2019-11-28 15:31:00',5220),(473,3,1,'2019-11-28 16:12:00',2460),(474,3,0,'2019-11-28 17:31:00',4740),(475,3,1,'2019-11-28 17:46:00',900),(476,3,0,'2019-11-28 19:33:00',6420),(477,3,1,'2019-11-28 19:48:00',900),(478,3,0,'2019-11-28 20:20:00',1920),(479,3,1,'2019-11-29 07:47:00',41220),(480,3,0,'2019-11-29 09:53:00',7560),(481,3,1,'2019-11-29 10:33:00',2400),(482,3,0,'2019-11-29 11:47:00',4440),(483,3,1,'2019-11-29 13:37:00',6600),(484,3,0,'2019-11-29 14:04:00',1620),(485,3,1,'2019-11-29 14:11:00',420),(486,3,0,'2019-11-29 14:51:00',2400),(487,3,1,'2019-11-29 15:02:00',660),(488,3,0,'2019-11-29 15:55:00',3180),(489,3,1,'2019-11-29 16:15:00',1200),(490,3,0,'2019-11-29 17:03:00',2880),(491,3,1,'2019-11-29 17:13:00',600),(492,3,0,'2019-11-29 18:26:00',4380),(493,5,1,'2019-11-04 08:14:00',29640),(494,5,0,'2019-11-04 09:32:00',4680),(495,5,1,'2019-11-04 10:12:00',2400),(496,5,0,'2019-11-04 11:21:00',4140),(497,5,1,'2019-11-04 11:41:00',1200),(498,5,0,'2019-11-04 13:30:00',6540),(499,5,1,'2019-11-04 14:26:00',3360),(500,5,0,'2019-11-04 15:43:00',4620),(501,5,1,'2019-11-04 16:14:00',1860),(502,5,0,'2019-11-04 16:57:00',2580),(503,5,1,'2019-11-04 17:08:00',660),(504,5,0,'2019-11-04 18:15:00',4020),(505,5,1,'2019-11-04 19:28:00',4380),(506,5,0,'2019-11-04 20:27:00',3540),(507,5,1,'2019-11-05 07:53:00',41160),(508,5,0,'2019-11-05 09:00:00',4020),(509,5,1,'2019-11-05 09:53:00',3180),(510,5,0,'2019-11-05 11:12:00',4740),(511,5,1,'2019-11-05 11:17:00',300),(512,5,0,'2019-11-05 11:49:00',1920),(513,5,1,'2019-11-05 13:44:00',6900),(514,5,0,'2019-11-05 14:38:00',3240),(515,5,1,'2019-11-05 14:59:00',1260),(516,5,0,'2019-11-05 15:35:00',2160),(517,5,1,'2019-11-05 16:29:00',3240),(518,5,0,'2019-11-05 18:19:00',6600),(519,5,1,'2019-11-05 18:25:00',360),(520,5,0,'2019-11-05 20:03:00',5880),(521,5,1,'2019-11-06 08:04:00',43260),(522,5,0,'2019-11-06 09:14:00',4200),(523,5,1,'2019-11-06 09:34:00',1200),(524,5,0,'2019-11-06 10:23:00',2940),(525,5,1,'2019-11-06 10:46:00',1380),(526,5,0,'2019-11-06 11:53:00',4020),(527,5,1,'2019-11-06 13:36:00',6180),(528,5,0,'2019-11-06 14:53:00',4620),(529,5,1,'2019-11-06 15:43:00',3000),(530,5,0,'2019-11-06 16:34:00',3060),(531,5,1,'2019-11-06 17:23:00',2940),(532,5,0,'2019-11-06 18:45:00',4920),(533,5,1,'2019-11-06 19:14:00',1740),(534,5,0,'2019-11-06 20:19:00',3900),(535,5,1,'2019-11-07 07:35:00',40560),(536,5,0,'2019-11-07 08:56:00',4860),(537,5,1,'2019-11-07 09:01:00',300),(538,5,0,'2019-11-07 10:20:00',4740),(539,5,1,'2019-11-07 11:36:00',4560),(540,5,0,'2019-11-07 12:10:00',2040),(541,5,1,'2019-11-07 14:21:00',7860),(542,5,0,'2019-11-07 15:33:00',4320),(543,5,1,'2019-11-07 16:56:00',4980),(544,5,0,'2019-11-07 17:43:00',2820),(545,5,1,'2019-11-07 17:58:00',900),(546,5,0,'2019-11-07 18:45:00',2820),(547,5,1,'2019-11-07 19:03:00',1080),(548,5,0,'2019-11-07 20:11:00',4080),(549,5,1,'2019-11-08 08:00:00',42540),(550,5,0,'2019-11-08 09:22:00',4920),(551,5,1,'2019-11-08 09:45:00',1380),(552,5,0,'2019-11-08 11:10:00',5100),(553,5,1,'2019-11-08 13:29:00',8340),(554,5,0,'2019-11-08 14:22:00',3180),(555,5,1,'2019-11-08 15:02:00',2400),(556,5,0,'2019-11-08 15:30:00',1680),(557,5,1,'2019-11-08 15:45:00',900),(558,5,0,'2019-11-08 16:25:00',2400),(559,5,1,'2019-11-08 16:42:00',1020),(560,5,0,'2019-11-08 17:27:00',2700),(561,5,1,'2019-11-08 17:30:00',180),(562,5,0,'2019-11-08 18:32:00',3720),(563,5,1,'2019-11-11 08:08:00',221760),(564,5,0,'2019-11-11 08:53:00',2700),(565,5,1,'2019-11-11 09:40:00',2820),(566,5,0,'2019-11-11 11:13:00',5580),(567,5,1,'2019-11-11 13:39:00',8760),(568,5,0,'2019-11-11 14:32:00',3180),(569,5,1,'2019-11-11 14:56:00',1440),(570,5,0,'2019-11-11 15:42:00',2760),(571,5,1,'2019-11-11 15:59:00',1020),(572,5,0,'2019-11-11 16:34:00',2100),(573,5,1,'2019-11-11 16:47:00',780),(574,5,0,'2019-11-11 18:01:00',4440),(575,5,1,'2019-11-11 19:23:00',4920),(576,5,0,'2019-11-11 20:11:00',2880),(577,5,1,'2019-11-12 07:55:00',42240),(578,5,0,'2019-11-12 09:32:00',5820),(579,5,1,'2019-11-12 09:49:00',1020),(580,5,0,'2019-11-12 10:34:00',2700),(581,5,1,'2019-11-12 10:47:00',780),(582,5,0,'2019-11-12 11:40:00',3180),(583,5,1,'2019-11-12 13:39:00',7140),(584,5,0,'2019-11-12 14:54:00',4500),(585,5,1,'2019-11-12 15:04:00',600),(586,5,0,'2019-11-12 16:09:00',3900),(587,5,1,'2019-11-12 16:18:00',540),(588,5,0,'2019-11-12 18:11:00',6780),(589,5,1,'2019-11-12 18:41:00',1800),(590,5,0,'2019-11-12 20:19:00',5880),(591,5,1,'2019-11-13 07:41:00',40920),(592,5,0,'2019-11-13 08:10:00',1740),(593,5,1,'2019-11-13 08:16:00',360),(594,5,0,'2019-11-13 09:44:00',5280),(595,5,1,'2019-11-13 10:21:00',2220),(596,5,0,'2019-11-13 11:33:00',4320),(597,5,1,'2019-11-13 13:50:00',8220),(598,5,0,'2019-11-13 14:54:00',3840),(599,5,1,'2019-11-13 15:39:00',2700),(600,5,0,'2019-11-13 16:42:00',3780),(601,5,1,'2019-11-13 17:34:00',3120),(602,5,0,'2019-11-13 18:44:00',4200),(603,5,1,'2019-11-13 19:07:00',1380),(604,5,0,'2019-11-13 19:51:00',2640),(605,5,1,'2019-11-14 08:20:00',44940),(606,5,0,'2019-11-14 09:13:00',3180),(607,5,1,'2019-11-14 09:19:00',360),(608,5,0,'2019-11-14 09:43:00',1440),(609,5,1,'2019-11-14 10:11:00',1680),(610,5,0,'2019-11-14 11:52:00',6060),(611,5,1,'2019-11-14 13:47:00',6900),(612,5,0,'2019-11-14 15:23:00',5760),(613,5,1,'2019-11-14 16:35:00',4320),(614,5,0,'2019-11-14 17:29:00',3240),(615,5,1,'2019-11-14 17:56:00',1620),(616,5,0,'2019-11-14 19:15:00',4740),(617,5,1,'2019-11-14 19:49:00',2040),(618,5,0,'2019-11-14 20:32:00',2580),(619,5,1,'2019-11-15 07:41:00',40140),(620,5,0,'2019-11-15 08:34:00',3180),(621,5,1,'2019-11-15 09:07:00',1980),(622,5,0,'2019-11-15 10:22:00',4500),(623,5,1,'2019-11-15 11:42:00',4800),(624,5,0,'2019-11-15 12:25:00',2580),(625,5,1,'2019-11-15 13:05:00',2400),(626,5,0,'2019-11-15 13:55:00',3000),(627,5,1,'2019-11-15 14:06:00',660),(628,5,0,'2019-11-15 14:55:00',2940),(629,5,1,'2019-11-15 15:24:00',1740),(630,5,0,'2019-11-15 16:13:00',2940),(631,5,1,'2019-11-15 17:24:00',4260),(632,5,0,'2019-11-15 18:10:00',2760),(633,5,1,'2019-11-18 08:01:00',222660),(634,5,0,'2019-11-18 09:24:00',4980),(635,5,1,'2019-11-18 09:46:00',1320),(636,5,0,'2019-11-18 11:09:00',4980),(637,5,1,'2019-11-18 13:29:00',8400),(638,5,0,'2019-11-18 14:52:00',4980),(639,5,1,'2019-11-18 15:01:00',540),(640,5,0,'2019-11-18 15:56:00',3300),(641,5,1,'2019-11-18 16:10:00',840),(642,5,0,'2019-11-18 16:43:00',1980),(643,5,1,'2019-11-18 16:58:00',900),(644,5,0,'2019-11-18 17:42:00',2640),(645,5,1,'2019-11-18 19:02:00',4800),(646,5,0,'2019-11-18 20:04:00',3720),(647,5,1,'2019-11-19 07:46:00',42120),(648,5,0,'2019-11-19 09:02:00',4560),(649,5,1,'2019-11-19 10:20:00',4680),(650,5,0,'2019-11-19 11:46:00',5160),(651,5,1,'2019-11-19 13:37:00',6660),(652,5,0,'2019-11-19 14:28:00',3060),(653,5,1,'2019-11-19 14:33:00',300),(654,5,0,'2019-11-19 15:16:00',2580),(655,5,1,'2019-11-19 15:52:00',2160),(656,5,0,'2019-11-19 16:36:00',2640),(657,5,1,'2019-11-19 16:49:00',780),(658,5,0,'2019-11-19 17:33:00',2640),(659,5,1,'2019-11-19 18:43:00',4200),(660,5,0,'2019-11-19 20:16:00',5580),(661,5,1,'2019-11-20 07:54:00',41880),(662,5,0,'2019-11-20 08:59:00',3900),(663,5,1,'2019-11-20 09:19:00',1200),(664,5,0,'2019-11-20 09:50:00',1860),(665,5,1,'2019-11-20 09:57:00',420),(666,5,0,'2019-11-20 11:40:00',6180),(667,5,1,'2019-11-20 13:41:00',7260),(668,5,0,'2019-11-20 14:52:00',4260),(669,5,1,'2019-11-20 15:03:00',660),(670,5,0,'2019-11-20 16:26:00',4980),(671,5,1,'2019-11-20 17:24:00',3480),(672,5,0,'2019-11-20 18:37:00',4380),(673,5,1,'2019-11-20 19:00:00',1380),(674,5,0,'2019-11-20 20:11:00',4260),(675,5,1,'2019-11-21 08:16:00',43500),(676,5,0,'2019-11-21 09:44:00',5280),(677,5,1,'2019-11-21 09:51:00',420),(678,5,0,'2019-11-21 10:47:00',3360),(679,5,1,'2019-11-21 11:00:00',780),(680,5,0,'2019-11-21 11:49:00',2940),(681,5,1,'2019-11-21 13:37:00',6480),(682,5,0,'2019-11-21 14:48:00',4260),(683,5,1,'2019-11-21 15:54:00',3960),(684,5,0,'2019-11-21 17:07:00',4380),(685,5,1,'2019-11-21 18:16:00',4140),(686,5,0,'2019-11-21 19:31:00',4500),(687,5,1,'2019-11-21 19:39:00',480),(688,5,0,'2019-11-21 20:34:00',3300),(689,5,1,'2019-11-22 07:34:00',39600),(690,5,0,'2019-11-22 09:58:00',8640),(691,5,1,'2019-11-22 10:10:00',720),(692,5,0,'2019-11-22 11:27:00',4620),(693,5,1,'2019-11-22 11:33:00',360),(694,5,0,'2019-11-22 12:31:00',3480),(695,5,1,'2019-11-22 13:52:00',4860),(696,5,0,'2019-11-22 14:56:00',3840),(697,5,1,'2019-11-22 15:00:00',240),(698,5,0,'2019-11-22 15:43:00',2580),(699,5,1,'2019-11-22 16:08:00',1500),(700,5,0,'2019-11-22 16:51:00',2580),(701,5,1,'2019-11-22 17:12:00',1260),(702,5,0,'2019-11-22 18:41:00',5340),(703,5,1,'2019-11-25 07:41:00',219600),(704,5,0,'2019-11-25 08:20:00',2340),(705,5,1,'2019-11-25 09:31:00',4260),(706,5,0,'2019-11-25 10:49:00',4680),(707,5,1,'2019-11-25 13:31:00',9720),(708,5,0,'2019-11-25 14:31:00',3600),(709,5,1,'2019-11-25 14:43:00',720),(710,5,0,'2019-11-25 15:24:00',2460),(711,5,1,'2019-11-25 15:56:00',1920),(712,5,0,'2019-11-25 17:10:00',4440),(713,5,1,'2019-11-25 17:23:00',780),(714,5,0,'2019-11-25 18:17:00',3240),(715,5,1,'2019-11-25 18:43:00',1560),(716,5,0,'2019-11-25 20:22:00',5940),(717,5,1,'2019-11-26 08:16:00',42840),(718,5,0,'2019-11-26 09:52:00',5760),(719,5,1,'2019-11-26 10:49:00',3420),(720,5,0,'2019-11-26 11:39:00',3000),(721,5,1,'2019-11-26 13:35:00',6960),(722,5,0,'2019-11-26 14:28:00',3180),(723,5,1,'2019-11-26 14:34:00',360),(724,5,0,'2019-11-26 15:42:00',4080),(725,5,0,'2019-11-26 15:53:00',660),(726,5,1,'2019-11-26 16:17:00',1440),(727,5,0,'2019-11-26 18:01:00',6240),(728,5,1,'2019-11-26 18:20:00',1140),(729,5,0,'2019-11-26 20:03:00',6180),(730,5,1,'2019-11-27 08:21:00',44280),(731,5,0,'2019-11-27 09:42:00',4860),(732,5,1,'2019-11-27 09:54:00',720),(733,5,0,'2019-11-27 10:36:00',2520),(734,5,1,'2019-11-27 10:49:00',780),(735,5,0,'2019-11-27 11:43:00',3240),(736,5,1,'2019-11-27 14:09:00',8760),(737,5,0,'2019-11-27 14:55:00',2760),(738,5,1,'2019-11-27 15:02:00',420),(739,5,0,'2019-11-27 16:47:00',6300),(740,5,1,'2019-11-27 17:15:00',1680),(741,5,0,'2019-11-27 18:31:00',4560),(742,5,1,'2019-11-27 19:11:00',2400),(743,5,0,'2019-11-27 20:14:00',3780),(744,5,1,'2019-11-28 08:00:00',42360),(745,5,0,'2019-11-28 09:13:00',4380),(746,5,1,'2019-11-28 10:04:00',3060),(747,5,0,'2019-11-28 11:10:00',3960),(748,5,1,'2019-11-28 11:15:00',300),(749,5,0,'2019-11-28 12:00:00',2700),(750,5,1,'2019-11-28 13:54:00',6840),(751,5,0,'2019-11-28 14:51:00',3420),(752,5,1,'2019-11-28 16:22:00',5460),(753,5,0,'2019-11-28 17:42:00',4800),(754,5,1,'2019-11-28 18:00:00',1080),(755,5,0,'2019-11-28 19:24:00',5040),(756,5,1,'2019-11-28 19:37:00',780),(757,5,0,'2019-11-28 20:31:00',3240),(758,5,1,'2019-11-29 07:40:00',40140),(759,5,0,'2019-11-29 09:41:00',7260),(760,5,1,'2019-11-29 10:02:00',1260),(761,5,0,'2019-11-29 11:17:00',4500),(762,5,1,'2019-11-29 13:30:00',7980),(763,5,0,'2019-11-29 14:13:00',2580),(764,5,1,'2019-11-29 14:21:00',480),(765,5,0,'2019-11-29 15:13:00',3120),(766,5,1,'2019-11-29 15:22:00',540),(767,5,0,'2019-11-29 16:31:00',4140),(768,5,1,'2019-11-29 16:53:00',1320),(769,5,0,'2019-11-29 17:43:00',3000),(770,5,1,'2019-11-29 18:13:00',1800),(771,5,0,'2019-11-29 19:26:00',4380),(772,15,0,'2019-12-05 00:00:00',0),(775,18,0,'2019-12-05 00:00:00',0),(776,19,0,'2019-12-05 00:00:00',0),(777,20,0,'2019-12-05 00:00:00',0);
/*!40000 ALTER TABLE `dados_maquinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinas_registradas`
--

DROP TABLE IF EXISTS `maquinas_registradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquinas_registradas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `fabricante` varchar(50) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `deletado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinas_registradas`
--

LOCK TABLES `maquinas_registradas` WRITE;
/*!40000 ALTER TABLE `maquinas_registradas` DISABLE KEYS */;
INSERT INTO `maquinas_registradas` VALUES (1,'10.202.32.12','ROMI','GL240M',0),(2,'10.202.32.46','Fanuc','d21mia5',1),(3,'10.202.32.47','Fanuc','d14lia5',0),(5,'10.202.32.46','Fanuc','d21mia5',0),(14,'11.111.111.11','fornecedor1','modelo1',0),(15,'22.222.222.22','Fornecedor2','Modelo2',1),(18,'22.222.222.22','fabricante2','modelo2',1),(19,'22.222.222.22','fabricante2','modelo2',0),(20,'22.222.222.22','fabricante2','modelo2',1);
/*!40000 ALTER TABLE `maquinas_registradas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-06 22:02:37