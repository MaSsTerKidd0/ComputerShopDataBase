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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryID` int NOT NULL,
  `categoryName` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Screens','electronic displays that allow users to view digital content'),(2,'Keyboards','input devices that allow users to input text and commands'),(3,'Mouses','input devices that allow users to move a cursor on a computer'),(4,'Headsets','Headsets are audio equipment that combines headphones'),(5,'Speakers','Speakers are audio devices'),(6,'Mics','Mics are input devices that allow users to record and transmit audio content'),(7,'CPU','The CPU is the primary component of a computer that performs most of the processing and calculations for running software and operating systems.'),(8,'GPU','The GPU is a specialized processor that is designed to handle complex calculations and graphics rendering'),(9,'RAM','RAM is a type of computer memory that provides fast access to frequently used data and instructions'),(10,'MotherBoard','The motherboard is the main circuit board in a computer that connects and controls all of the other components'),(11,'Fans','Fans are components that are used to cool down computer components'),(12,'Discs','Discs are storage media that use laser technology to read and write digital content'),(13,'Consoles','Consoles are dedicated gaming devices that connect to a TV or monitor and allow users to play video games'),(14,'Ethernet','Ethernet is a type of wired networking technology that allows devices to connect to a local area network (LAN) or the internet'),(15,'Case','The case is the outer shell of a computer that encloses and protects the internal components, typically made of metal or plastic'),(16,'Cables','Cables are used to connect different components in a computer or electronic device'),(17,'Printers','Printers are output devices that allow users to produce physical copies of digital content, such as text, images, or graphics'),(18,'Laptops',' Laptops are portable computers that are designed for use on the go, typically featuring a built-in screen, keyboard, and touchpad or pointing stick.'),(19,'Desktops','Desktops are stationary computers that are designed for use at a desk or workstation');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 13:23:13
