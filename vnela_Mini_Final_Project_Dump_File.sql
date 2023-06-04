CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `availability_for_room`
--

DROP TABLE IF EXISTS `availability_for_room`;
/*!50001 DROP VIEW IF EXISTS `availability_for_room`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `availability_for_room` AS SELECT 
 1 AS `room_number`,
 1 AS `room_type`,
 1 AS `price`,
 1 AS `availability`,
 1 AS `bed_type`,
 1 AS `floor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `guest_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `guest_id` (`guest_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (98661,8801,'2023-03-31','18:00:00'),(98662,8802,'2023-04-04','17:56:23'),(98663,8803,'2023-04-03','13:23:56'),(98664,8804,'2023-04-04','10:11:43'),(98665,8805,'2023-04-06','16:23:45'),(98666,8806,'2023-04-06','07:23:54');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `current_reservations`
--

DROP TABLE IF EXISTS `current_reservations`;
/*!50001 DROP VIEW IF EXISTS `current_reservations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `current_reservations` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `room_number`,
 1 AS `check_in_date`,
 1 AS `check_out_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9997 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (9991,'Front desk Agent'),(9992,'House Keeper'),(9993,'Maintainance Technician'),(9994,'General Manager'),(9995,'Food and Beverage'),(9996,'Human Resources');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  PRIMARY KEY (`guest_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8807 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (8801,'Prashanth','Noornampally','prashanth@gmail.com','475-223-8961','860 Broadway','New Haven','CT','06519'),(8802,'Nikhil','GS','nikhil@gmail.com','203-456-7891','480 ferry st','West Haven','CT','505301'),(8803,'Kishore','Keerthi','kishore@gmail.com','860-789-1234','620 Howard Ave','Bayonne','Jersey','06517'),(8804,'Sai','Krishna','sai@gmail.com','860-994-5678','321 Eastern St','Milford','CT','07618'),(8805,'Karnakar','Mudhigonda','karnakar@gmail.com','475-456-3456','326 Blacthley Ave','East Haven','NJ','14523'),(8806,'Praneeth','Mekala','praneeth@gmail.com','860-221-9876','4 Rowe st','Paterson','CT','786458');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `guest_id` int NOT NULL,
  `booking_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `guest_id` (`guest_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1111,8801,98661,240.00,'2023-04-01','Credit card'),(1112,8802,98662,300.00,'2023-04-04','Credit card'),(1113,8803,98663,240.00,'2023-04-04','Cash'),(1114,8804,98664,120.00,'2023-04-05','Debit card'),(1115,8805,98665,200.00,'2023-04-06','Cash'),(1116,8806,98666,480.00,'2023-04-06','Credit card');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `guest_id` int NOT NULL,
  `room_number` int NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `guest_id` (`guest_id`),
  KEY `room_number` (`room_number`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_number`) REFERENCES `rooms` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=98487 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (98481,8801,143,'2023-04-01','2023-04-02',120.00),(98482,8802,144,'2023-04-04','2023-04-06',240.00),(98483,8803,145,'2023-04-04','2023-04-05',120.00),(98484,8804,146,'2023-04-05','2023-04-05',0.00),(98485,8805,147,'2023-04-06','2023-04-07',120.00),(98486,8806,148,'2023-04-06','2023-04-09',360.00);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_number` int NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `availability` enum('Available','Occupied','Maintenance') DEFAULT 'Available',
  `bed_type` varchar(50) NOT NULL,
  `floor` int NOT NULL,
  PRIMARY KEY (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (143,'AC',120.00,'Available','Queen',1),(144,'Non AC',120.00,'Available','Twin',1),(145,'AC',120.00,'Occupied','Queen',1),(146,'AC',120.00,'Available','Queen',2),(147,'Non AC',120.00,'Occupied','Twin',2),(148,'AC',120.00,'Available','Queen',2);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7707 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (7701,'Sharath','Rathod','Front desk Agent',10000.00,'(203) 555-0178','sharathrathod@gmail.com'),(7702,'Pratheek','Mekala','House Keeper',8000.00,'(860) 555-8834','pratheekmekala@gmail.com'),(7703,'Kisore','Reddy','Maintainance Technician',12000.00,'(203) 555-6291','kisorereddy@gmail.com'),(7704,'Sai','Surya','General Manager',25000.00,'(475) 555-9467','saisurya@gmail.com'),(7705,'Ram','Chandra','Food and Beverage',8000.00,'(860) 555-3320','ramchandra@gmail.com'),(7706,'Simon','RR','Human Resources',10000.00,'(203) 555-8152','simonrr@gmail.com');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staff_department`
--

DROP TABLE IF EXISTS `staff_department`;
/*!50001 DROP VIEW IF EXISTS `staff_department`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_department` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `department_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `availability_for_room`
--

/*!50001 DROP VIEW IF EXISTS `availability_for_room`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availability_for_room` AS select `rooms`.`room_number` AS `room_number`,`rooms`.`room_type` AS `room_type`,`rooms`.`price` AS `price`,`rooms`.`availability` AS `availability`,`rooms`.`bed_type` AS `bed_type`,`rooms`.`floor` AS `floor` from `rooms` where (`rooms`.`availability` = 'Available') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `current_reservations`
--

/*!50001 DROP VIEW IF EXISTS `current_reservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `current_reservations` AS select `g`.`first_name` AS `first_name`,`g`.`last_name` AS `last_name`,`r`.`room_number` AS `room_number`,`r`.`check_in_date` AS `check_in_date`,`r`.`check_out_date` AS `check_out_date` from (`guests` `g` join `reservations` `r` on((`g`.`guest_id` = `r`.`guest_id`))) where (`r`.`check_out_date` > now()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_department`
--

/*!50001 DROP VIEW IF EXISTS `staff_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_department` AS select `s`.`first_name` AS `first_name`,`s`.`last_name` AS `last_name`,`d`.`department_name` AS `department_name` from (`staff` `s` join `departments` `d` on((`s`.`position` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-28 11:41:30
