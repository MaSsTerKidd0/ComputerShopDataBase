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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `weight` double NOT NULL,
  `shopPrice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `price` double NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `unitsInStock` varchar(45) NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`),
  KEY `FR_ProdCat_CategoryID_idx` (`CategoryID`),
  CONSTRAINT `FR_ProdCat_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'HP Pavilion','silver',2.5,719.99,899.99,'HP','50',18),(2,'Logitech G Pro','black',0.2,55.99,69.99,'Logitech','25',3),(3,'AMD Ryzen 7','silver',0.5,263.99,329.99,'AMD','10',7),(4,'Dell Ultrasharp','black',3.5,359.99,449.99,'Dell','15',1),(5,'Razer Blackwidow','black',1.5,95.99,119.99,'Razer','20',2),(6,'SteelSeries Arctis','white',0.6,79.99,99.99,'SteelSeries','30',4),(7,'Nvidia RTX 3080','black',1.2,639.99,799.99,'Nvidia','5',8),(8,'Bose Companion','white',1.8,199.99,249.99,'Bose','10',5),(9,'Netgear Nighthawk','black',0.8,103.99,129.99,'Netgear','12',14),(10,'Seagate BarraCuda','silver',0.6,63.99,79.99,'Seagate','8',12),(11,'Microsoft Wireless Mouse','black',0.1,23.99,29.99,'Microsoft','40',3),(12,'HP OfficeJet Pro','white',9,239.99,299.99,'HP','5',17),(13,'Corsair Headset Stand','black',0.3,31.99,39.99,'Corsair','15',4),(14,'Secretlab Omega','black',30,279.99,349.99,'Secretlab','7',15),(15,'Asus ROG Zephyrus','gray',2.5,1279.99,1599.99,'Asus','8',18),(16,'Logitech Z623','black',4,95.99,119.99,'Logitech','20',5),(17,'Logitech Z906','black',20,316.00,395,'Logitech','38',5),(18,'Xbox Elite Wireless Controller','black',0.4,143.99,179.99,'Microsoft','12',13),(19,'HyperX Fury S','black',0.5,15.99,19.99,'HyperX','30',3),(20,'Logitech G432','black',0.8,39.99,49.99,'Logitech','15',4),(21,'Redragon S101-BA','black',2,23.99,29.99,'Redragon','23',2),(22,'NZXT H510','white',7.5,63.99,79.99,'NZXT','10',15),(23,'Noctua NH-D15','brown',1.3,71.99,89.99,'Noctua','5',11),(24,'Corsair Vengeance LPX','black',0.1,55.99,69.99,'Corsair','15',9),(25,'ASUS Prime Z590-A','black',1.5,199.99,249.99,'ASUS','8',10),(26,'EVGA SuperNOVA 850W','black',2,119.99,149.99,'EVGA','10',15),(27,'MSI Gaming GeForce RTX 3060','black',1.5,399.99,499.99,'MSI','15',8);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
