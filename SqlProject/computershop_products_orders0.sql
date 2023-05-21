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
-- Table structure for table `products_orders`
--

DROP TABLE IF EXISTS `products_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_orders` (
  `productID` int NOT NULL,
  `orderID` int NOT NULL,
  `productAmount` int NOT NULL,
  PRIMARY KEY (`productID`,`orderID`),
  KEY `INDX_products_orders_ordID` (`orderID`) /*!80000 INVISIBLE */,
  CONSTRAINT `orderID_FK` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  CONSTRAINT `productID_FK` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orders`
--

LOCK TABLES `products_orders` WRITE;
/*!40000 ALTER TABLE `products_orders` DISABLE KEYS */;
INSERT INTO `products_orders` VALUES (1,1,3),(1,19,1),(1,47,5),(1,48,3),(1,64,3),(2,8,1),(2,29,3),(2,35,4),(2,39,4),(2,51,3),(3,7,1),(3,48,5),(3,55,4),(3,69,4),(3,71,4),(3,72,5),(4,9,4),(4,11,4),(4,21,4),(4,62,2),(4,77,3),(5,7,3),(5,38,2),(5,46,5),(5,68,3),(6,45,5),(6,49,2),(6,53,5),(6,58,2),(6,62,3),(7,16,1),(7,52,1),(7,63,1),(7,75,2),(8,11,3),(8,15,5),(8,52,5),(8,57,5),(9,12,2),(9,18,1),(9,39,3),(9,60,1),(9,74,3),(9,76,2),(10,26,2),(10,41,4),(10,70,5),(11,12,1),(11,16,5),(11,24,3),(11,42,5),(11,75,2),(12,22,4),(12,44,4),(12,49,2),(12,61,2),(12,77,5),(13,34,2),(13,51,3),(13,53,2),(13,54,4),(13,76,1),(14,26,1),(14,36,2),(14,56,1),(14,79,4),(15,17,1),(15,47,2),(15,50,1),(15,70,2),(16,10,5),(16,17,4),(16,25,4),(16,29,2),(16,35,2),(16,50,5),(17,33,4),(17,44,5),(17,48,3),(17,76,3),(18,14,2),(18,23,1),(18,28,5),(18,32,5),(18,69,5),(19,5,2),(19,30,1),(19,61,2),(19,64,2),(19,66,1),(20,8,1),(20,38,4),(20,57,4),(20,58,1),(20,67,5),(21,1,2),(21,31,3),(21,37,3),(21,43,4),(21,77,4),(22,2,4),(22,11,2),(22,56,5),(22,58,3),(23,8,5),(23,14,4),(23,24,5),(23,31,1),(23,72,1),(24,3,1),(24,11,2),(24,33,3),(24,45,2),(24,54,3),(25,12,1),(25,30,3),(25,40,1),(25,70,4),(26,27,1),(26,43,3),(26,46,2),(26,63,3),(26,68,5),(27,25,1),(27,60,4),(27,78,5),(27,79,1);
/*!40000 ALTER TABLE `products_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `products_orders_AFTER_INSERT` AFTER INSERT ON `products_orders` FOR EACH ROW BEGIN
	UPDATE products
    SET unitsInStock = unitsInStock - NEW.productAmount
    WHERE productID = NEW.productID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 13:23:12
