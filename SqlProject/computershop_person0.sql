CREATE DATABASE  IF NOT EXISTS `computershop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `computershop`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: computershop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `personID` int NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `PhoneNumber` varchar(10) NOT NULL,
  `BirthDate` date NOT NULL,
  PRIMARY KEY (`personID`),
  UNIQUE KEY `personID_UNIQUE` (`personID`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  KEY `INH_personID` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (300877090,'Noam','Kadosh','0533210987','1994-03-27'),(301789107,'Shira','Ben-Arie','0502109876','2001-06-08'),(301836035,'Shachar','Dahan','0541234567','1990-01-01'),(302822727,'Raz','Ben-David','0587778899','1985-11-18'),(304446235,'Liran','Sasson','0547654321','1987-09-12'),(305298407,'Noa','Ohana','0539991122','1973-08-12'),(306621797,'Noam','Cohen','0556667777','1992-12-12'),(307671623,'Ori','Ben-Aroya','0587654321','1976-06-25'),(308750124,'Yael','Klein','0532109876','1984-03-09'),(310248652,'Hadar','Nir','0581112222','1985-12-25'),(312290162,'Yonatan','Bar-Yosef','0509998888','1989-11-21'),(313084174,'Or','Amit','0559876543','2003-06-02'),(313775422,'Adi','Golan','0543210987','1998-01-01'),(314436520,'Daniel','Ohana','0543154748','2004-06-18'),(314436521,'Shaked','Dror','0543254748','2005-03-01'),(314436522,'Elad','Balva','0543184748','2006-02-07'),(314436523,'Yanir','Shmul','0533154748','2007-11-16'),(314436524,'Kfir','levi','0548154748','2008-12-12'),(314436525,'Yuval','Rashman','0547154748','2012-07-13'),(315287490,'Itay','Pinto','0543334455','1978-12-03'),(315974582,'Maya','Yaniv','0504321098','1971-07-07'),(317460529,'Eitan','Sela','0509876543','1969-10-27'),(318148468,'Shira','Levi','0577778888','1978-02-14'),(318447589,'Noam','Cohen','0580987654','1964-12-30'),(319737108,'Lior','Bachar','0535554444','2002-12-04'),(319817459,'Tom','Shalev','0545432109','2000-02-16'),(320607254,'Or','Barnea','0559012345','2000-08-05'),(321278112,'Avraham','Levi','0505556677','2001-09-30'),(323600844,'Shaked','Dror','0548824231','2004-05-28'),(323616182,'Bar','Ben-Shushan','0558765432','1981-02-14'),(324107886,'Tom','Levi','0525678901','1962-11-01'),(325222058,'Elad','Cohen','0522345678','1992-05-08'),(326015663,'Michal','Shapira','0521112233','1989-04-22'),(326249751,'Tal','Sharon','0529876543','1992-05-10'),(326570520,'Daniel','Elharar','0544443615','2004-06-18'),(326672599,'Tomer','Adi','0506256826','2004-08-08'),(327772385,'Maya','Levy','0526543210','1979-02-11');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 13:23:11
