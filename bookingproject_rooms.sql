CREATE DATABASE  IF NOT EXISTS `bookingproject` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookingproject`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bookingproject
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `building id` int(11) NOT NULL,
  `smoking` varchar(1) NOT NULL,
  `numberOfBeds` varchar(45) NOT NULL,
  `numberOfPeople` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `roomNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='contains info for the room. has a building id to tell which building it belongs to. More columns can be added if new types of rooms are created for their specific features. columns which dont apply to a type of room will be null';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,'n','2','4',130,'101'),(2,1,'n','2','4',130,'102'),(3,1,'n','2','4',130,'103'),(4,1,'n','2','4',130,'104'),(5,1,'n','2','4',130,'105'),(6,1,'n','2','3',110,'106'),(7,1,'n','2','3',110,'107'),(8,1,'n','2','3',110,'108'),(9,1,'n','2','3',110,'109'),(10,1,'n','2','3',110,'110'),(11,1,'n','1','2',80,'111'),(12,1,'n','1','2',80,'112'),(13,1,'n','1','2',80,'113'),(14,1,'n','1','2',80,'114'),(15,1,'n','1','2',80,'115'),(16,1,'n','1','1',60,'116'),(17,1,'n','1','1',60,'117'),(18,1,'n','1','1',60,'118'),(19,1,'n','1','1',60,'119'),(20,1,'n','1','1',60,'120'),(21,1,'n','3','6',180,'121'),(22,1,'n','3','6',180,'122'),(23,1,'n','3','6',180,'123'),(24,1,'n','3','6',180,'124'),(25,1,'n','3','6',180,'125'),(26,1,'n','3','5',150,'126'),(27,1,'n','3','5',150,'127'),(28,1,'n','3','5',150,'128'),(29,1,'n','3','5',150,'129'),(30,1,'n','3','5',150,'130'),(31,1,'y','2','4',130,'201'),(32,1,'y','2','4',130,'202'),(33,1,'y','2','4',130,'203'),(34,1,'y','2','4',130,'204'),(35,1,'y','2','4',130,'205'),(36,1,'y','2','3',110,'206'),(37,1,'y','2','3',110,'207'),(38,1,'y','2','3',110,'208'),(39,1,'y','2','3',110,'209'),(40,1,'y','2','3',110,'210'),(41,1,'y','1','2',80,'211'),(42,1,'y','1','2',80,'212'),(43,1,'y','1','2',80,'213'),(44,1,'y','1','2',80,'214'),(45,1,'y','1','2',80,'215'),(46,1,'y','1','1',60,'216'),(47,1,'y','1','1',60,'217'),(48,1,'y','1','1',60,'218'),(49,1,'y','1','1',60,'219'),(50,1,'y','1','1',60,'220'),(51,1,'y','3','6',180,'221'),(52,1,'y','3','6',180,'222'),(53,1,'y','3','6',180,'223'),(54,1,'y','3','6',180,'224'),(55,1,'y','3','6',180,'225'),(56,1,'y','3','5',150,'226'),(57,1,'y','3','5',150,'227'),(58,1,'y','3','5',150,'228'),(59,1,'y','3','5',150,'229'),(60,1,'y','3','5',150,'230');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-24 18:03:13
