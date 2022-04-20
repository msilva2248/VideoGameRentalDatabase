-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: videogame_rental
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  `state_id` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`,`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Montgomery','1'),(2,'Juneau','2'),(3,'Phoenix','3'),(4,'Little Rock','4'),(5,'Sacramento','5'),(6,'Denver','6'),(7,'Hartford','7'),(8,'Dover','8'),(9,'Tallahassee','9'),(10,'Atlanta','10'),(11,'Honolulu','11'),(12,'Boise','12'),(13,'Springfield','13'),(14,'Indianapolis','14'),(15,'Des Moines','15'),(16,'Topeka','16'),(17,'Frankfort','17'),(18,'Baton Rouge','18'),(19,'Augusta','19'),(20,'Annapolis','20'),(21,'Boston','21'),(22,'Lansing','22'),(23,'Saint Paul','23'),(24,'Jackson','24'),(25,'Jefferson City','25'),(26,'Helena','26'),(27,'Lincoln','27'),(28,'Carson City','28'),(29,'Concord','29'),(30,'Trenton','30'),(31,'Santa Fe','31'),(32,'Albany','32'),(33,'Raleigh','33'),(34,'Bismarck','34'),(35,'Columbus','35'),(36,'Oklahoma City','36'),(37,'Salem','37'),(38,'Harrisburg','38'),(39,'Providence','39'),(40,'Columbia','40'),(41,'Pierre','41'),(42,'Nashville','42'),(43,'Austin','43'),(44,'Salt Lake City','44'),(45,'Montpelier','45'),(46,'Richmond','46'),(47,'Olympua','47'),(48,'Charleston','48'),(49,'Madison','49'),(50,'Cheyenne','50');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL,
  `company_name` varchar(45) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Mojang'),(2,'Sledgehammer Games'),(3,'Sony Interactive Entertainment'),(4,'Electronic Arts'),(5,'FromSoftware');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `console`
--

DROP TABLE IF EXISTS `console`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `console` (
  `console_id` int unsigned NOT NULL AUTO_INCREMENT,
  `console_name` varchar(45) NOT NULL,
  PRIMARY KEY (`console_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `console`
--

LOCK TABLES `console` WRITE;
/*!40000 ALTER TABLE `console` DISABLE KEYS */;
INSERT INTO `console` VALUES (1,'PC'),(2,'Xbox '),(3,'Playstation'),(4,'Nintendo Switch');
/*!40000 ALTER TABLE `console` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`store_id`,`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'aj','aj',1,'Alex','Jones','alexjones@gmail.com',1,'2022-04-11 11:30:00'),(2,'js','js',2,'John','Smith','johnsmith@gmail.com',2,'2022-04-12 11:30:00'),(3,'gj','gj',3,'Gabe','Johnson','gabejohnson@gmail.com',3,'2022-04-13 11:30:00'),(4,'lw','lw',4,'Luke','Walton','lukewalton@gmail.com',4,'2022-04-14 11:30:00');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipcode` int NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES (1,'123 Main Street','Atlanta','Georgia',12345),(2,'234 Main Street','Austin','Texas',23456),(3,'345 Main Street','Columbus','Ohio',34567),(4,'456 Main Street','Nashville','Tennessee',45678);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `videogame_id` smallint unsigned NOT NULL,
  `store_id` tinyint unsigned NOT NULL,
  `num_of_videogames` smallint unsigned NOT NULL,
  PRIMARY KEY (`inventory_id`,`videogame_id`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=555116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (111111,1,1,9),(111112,2,1,10),(111113,3,1,10),(111114,4,1,10),(111115,5,1,10),(222111,1,2,10),(222112,2,2,9),(222113,3,2,10),(222114,4,2,10),(222115,5,2,10),(333111,1,3,10),(333112,2,3,10),(333113,3,3,9),(333114,4,3,10),(333115,5,3,10),(444111,1,4,10),(444112,2,4,10),(444113,3,4,10),(444114,4,4,9),(444115,5,4,10),(555111,1,5,10),(555112,2,5,10),(555113,3,5,10),(555114,4,5,10),(555115,5,5,10);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` smallint unsigned NOT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  `rental_id` int NOT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  PRIMARY KEY (`payment_id`,`customer_id`,`staff_id`,`rental_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,1,14.99,'2022-04-11 11:30:00'),(2,2,2,2,14.99,'2022-04-12 11:30:00'),(3,3,3,3,14.99,'2022-04-13 11:30:00'),(4,4,4,4,14.99,'2022-04-14 11:30:00');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint unsigned NOT NULL,
  `customer_id` smallint unsigned NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `staff_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`rental_id`,`inventory_id`,`customer_id`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,'2022-04-11 11:30:00',111111,1,'2022-05-11 12:30:00',1),(2,'2022-04-12 11:30:00',222112,2,'2022-05-12 12:30:00',2),(3,'2022-04-13 11:30:00',333113,3,'2022-05-13 12:30:00',3),(4,'2022-04-14 11:30:00',444114,4,'2022-05-14 12:30:00',4);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `storeaddress_id` tinyint unsigned NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`staff_id`,`storeaddress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Christian','Gonzalez',1,'cg@gmail.com','username1','password1'),(2,'Matthew','Silva',2,'ms@gmail.com','username2','password2'),(3,'Christopher','Rayas',3,'cr@gmail.com','username3','password3'),(4,'Garrett','Loucks',4,'gl@gmail.com','username4','password4');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Alabama'),(2,'Alaska'),(3,'Arizona'),(4,'Arkansas'),(5,'California'),(6,'Colorado'),(7,'Connecticut'),(8,'Delaware'),(9,'Florida'),(10,'Georgia'),(11,'Hawaii'),(12,'Idaho'),(13,'Illinois'),(14,'Indiana'),(15,'Iowa'),(16,'Kansas'),(17,'Kentucky'),(18,'Louisiana'),(19,'Maine'),(20,'Maryland'),(21,'Massachusetts'),(22,'Michigan'),(23,'Minnesota'),(24,'Mississippi'),(25,'Missouri'),(26,'Montana'),(27,'Nebraska'),(28,'Nevada'),(29,'New Hampshire'),(30,'New Jersey'),(31,'New Mexico'),(32,'New York'),(33,'North Carolina'),(34,'North Dakota'),(35,'Ohio'),(36,'Oklahoma'),(37,'Oregon'),(38,'Pennsylvania'),(39,'Rhode Island'),(40,'South Carolina'),(41,'South Dakota'),(42,'Tennessee'),(43,'Texas'),(44,'Utah'),(45,'Vermont'),(46,'Virginia'),(47,'Washington'),(48,'West Virginia'),(49,'Wisconsin'),(50,'Wyoming');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` tinyint unsigned NOT NULL,
  `address_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`store_id`,`staff_id`,`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,1,5),(2,2,6),(3,3,7),(4,4,8);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_address`
--

DROP TABLE IF EXISTS `store_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_address` (
  `storeaddress_id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeaddress` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zipcode` int NOT NULL,
  PRIMARY KEY (`storeaddress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_address`
--

LOCK TABLES `store_address` WRITE;
/*!40000 ALTER TABLE `store_address` DISABLE KEYS */;
INSERT INTO `store_address` VALUES (1,'123 Park Lane','Atlanta','Georgia',12345),(2,'456 Park Lane','Austin','Texas',23456),(3,'789 Park Lane','Columbus','Ohio',34567),(4,'890 Park Lane','Nashville','Tennessee',45678);
/*!40000 ALTER TABLE `store_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogame`
--

DROP TABLE IF EXISTS `videogame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videogame` (
  `videogame_id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `year_release` year DEFAULT NULL,
  `rental_duration` tinyint unsigned NOT NULL DEFAULT '4',
  `rental_rate` decimal(4,2) NOT NULL DEFAULT '14.99',
  `replacement_cost` decimal(5,2) NOT NULL DEFAULT '14.99',
  `rating` enum('E','E-10','T','M','A') DEFAULT 'E',
  PRIMARY KEY (`videogame_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogame`
--

LOCK TABLES `videogame` WRITE;
/*!40000 ALTER TABLE `videogame` DISABLE KEYS */;
INSERT INTO `videogame` VALUES (1,'Minecraft',2011,4,14.99,14.99,'E-10'),(2,'Call of Duty: Vanguard',2021,4,14.99,14.99,'M'),(3,'MLB the Show 22',2022,4,14.99,14.99,'E'),(4,'Madden 22',2021,4,14.99,14.99,'E'),(5,'Elden Ring',2022,4,14.99,14.99,'M');
/*!40000 ALTER TABLE `videogame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogame_company`
--

DROP TABLE IF EXISTS `videogame_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videogame_company` (
  `company_id` smallint unsigned NOT NULL,
  `videogame_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`company_id`,`videogame_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogame_company`
--

LOCK TABLES `videogame_company` WRITE;
/*!40000 ALTER TABLE `videogame_company` DISABLE KEYS */;
INSERT INTO `videogame_company` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `videogame_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogame_console`
--

DROP TABLE IF EXISTS `videogame_console`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videogame_console` (
  `videogame_id` smallint unsigned NOT NULL,
  `console_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`videogame_id`,`console_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogame_console`
--

LOCK TABLES `videogame_console` WRITE;
/*!40000 ALTER TABLE `videogame_console` DISABLE KEYS */;
INSERT INTO `videogame_console` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3);
/*!40000 ALTER TABLE `videogame_console` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogame_details`
--

DROP TABLE IF EXISTS `videogame_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videogame_details` (
  `videogame_id` smallint NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`videogame_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogame_details`
--

LOCK TABLES `videogame_details` WRITE;
/*!40000 ALTER TABLE `videogame_details` DISABLE KEYS */;
INSERT INTO `videogame_details` VALUES (1,'Minecraft'),(2,'Call of Duty: Vanguard'),(3,'MLB the Show 22'),(4,'Madden 22'),(5,'Elden Ring');
/*!40000 ALTER TABLE `videogame_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-20 17:57:02
