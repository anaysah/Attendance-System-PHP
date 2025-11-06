-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: attendancewebapp
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.2

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
-- Table structure for table `absentees`
--

DROP TABLE IF EXISTS `absentees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absentees` (
  `absentee_id` int NOT NULL AUTO_INCREMENT,
  `attendance_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`absentee_id`),
  KEY `absentees_ibfk_1` (`attendance_id`),
  KEY `absentees_ibfk_2` (`student_id`),
  CONSTRAINT `absentees_ibfk_1` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE,
  CONSTRAINT `absentees_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_absentees_attendance` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absentees`
--

LOCK TABLES `absentees` WRITE;
/*!40000 ALTER TABLE `absentees` DISABLE KEYS */;
INSERT INTO `absentees` VALUES (20,26,14),(21,27,16),(22,28,1),(23,28,13),(24,28,14),(25,28,15),(26,28,16),(27,28,17),(28,28,18),(29,28,19),(30,28,20),(31,28,21),(32,28,22),(33,28,23),(34,28,24),(35,28,25),(36,28,26),(37,28,27),(38,28,28),(39,28,29),(40,28,30),(41,28,31),(42,28,32),(43,29,16),(44,30,1),(45,30,18);
/*!40000 ALTER TABLE `absentees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (25,14,'0000-00-00','00:00:00',14),(26,14,'2025-11-05','13:54:00',14),(27,14,'2025-11-03','13:57:00',14),(28,14,'2025-11-05','14:29:00',14),(29,14,'2025-11-05','14:29:00',14),(30,14,'2025-11-05','14:32:00',14);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `class_code` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `section` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (14,'BCA','7THHPA','B','2023-03-28'),(16,'POL SC.','25NV38','A','2023-03-28'),(17,'BCA','XKY1G0','A','2023-03-28'),(18,'BCA','FTJQY7','C','2023-03-28'),(19,'POL SCI','DZ2ZCH','A','2023-03-31'),(20,'POL SCI','45X0BX','A','2023-03-31'),(21,'POL SCI','6FF497','A','2023-03-31'),(22,'BSC','GY214P','A','2023-03-31'),(23,'BSC','SRCD22','A','2023-03-31'),(24,'NEW','0O89EC','B','2023-03-31'),(25,'Science','BLCLIU','D','2023-03-31'),(26,'BTECH','Y6MXAJ','A','2023-04-05'),(27,'BCA','73RYDQ','b','2023-04-22');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_student_member`
--

DROP TABLE IF EXISTS `class_student_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_student_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `student_id` int NOT NULL,
  `roll_no` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `class_id` (`class_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `class_student_member_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `class_student_member_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_student_member`
--

LOCK TABLES `class_student_member` WRITE;
/*!40000 ALTER TABLE `class_student_member` DISABLE KEYS */;
INSERT INTO `class_student_member` VALUES (1,18,1,NULL),(8,14,1,NULL),(9,14,13,NULL),(10,14,14,NULL),(11,14,15,NULL),(12,14,16,NULL),(13,14,17,NULL),(14,14,18,NULL),(15,14,19,NULL),(16,14,20,NULL),(17,14,21,NULL),(18,14,22,NULL),(19,14,23,NULL),(20,14,24,NULL),(21,14,25,NULL),(22,14,26,NULL),(23,14,27,NULL),(24,14,28,NULL),(25,14,29,NULL),(26,14,30,NULL),(27,14,31,NULL),(28,14,32,NULL),(29,23,1,NULL),(30,24,1,NULL);
/*!40000 ALTER TABLE `class_student_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_teacher_member`
--

DROP TABLE IF EXISTS `class_teacher_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_teacher_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `class_teacher_member_ibfk_1` (`class_id`),
  CONSTRAINT `class_teacher_member_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `class_teacher_member_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_teacher_member`
--

LOCK TABLES `class_teacher_member` WRITE;
/*!40000 ALTER TABLE `class_teacher_member` DISABLE KEYS */;
INSERT INTO `class_teacher_member` VALUES (2,14,14),(4,16,14),(6,18,16),(11,23,14),(12,24,14),(13,25,14),(14,14,16),(15,26,14);
/*!40000 ALTER TABLE `class_teacher_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_leave`
--

DROP TABLE IF EXISTS `on_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `on_leave` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `attendance_id` int NOT NULL,
  `student_id` int NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`leave_id`),
  KEY `on_leave_ibfk_1` (`attendance_id`),
  KEY `on_leave_ibfk_2` (`student_id`),
  CONSTRAINT `on_leave_ibfk_1` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`) ON DELETE CASCADE,
  CONSTRAINT `on_leave_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_leave`
--

LOCK TABLES `on_leave` WRITE;
/*!40000 ALTER TABLE `on_leave` DISABLE KEYS */;
INSERT INTO `on_leave` VALUES (6,26,14,''),(7,27,16,''),(8,29,16,''),(9,30,1,''),(10,30,18,'');
/*!40000 ALTER TABLE `on_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci DEFAULT 'inactive',
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'ajay','nonoteh949@kaudat.com','$2y$10$lypZ4R3nyvyDri7ioXkUgeX5ws/VU3FEjCRvSUw39kCnUUK4PaBOm','active','N4rJvVHzLM1iiI5R9O9gV81aFucXRkSD'),(12,'Alice','alice901@hotmail.com','$2y$10$qBFUgA/gLYVcanykJJByfuJCGGL3CvBFRrqQ53pGZ1LBN6UVCIwo.','active','5ecafc98fe79f4567bea1517d6dabd01'),(13,'David','david812@gmail.com','$2y$10$hsWkyCS4r5nL96lodTL4bucSSkdrQDZBTnZnfJUcoLGCkAjWbppSe','active','f665318c16850b7c37562d6d31ec3f88'),(14,'Eva','eva778@aol.com','$2y$10$tS.v6NDgCYnBAFg4ZpTo/O3pxGWFiFIV1h.yh7HgpuPmZCWwKffA2','active','274cc9e4c0fc03fc7c7f2fe4c5043aac'),(15,'Ivy','ivy942@hotmail.com','$2y$10$6GPjZk6vzM9iJTP4LyT1hOyQSfRz/noyCvHCij2kJNvvuKUtrojHa','active','f89482ff90c7876736eb2b0d65b5f25a'),(16,'Grace','grace259@aol.com','$2y$10$on.CtZ.1osbdWtdTy/FYsuDYNQFA8LJRgFIJPUVdKk8v8j9lP5Y5G','active','4f91f9ec2710e29384009c55b63829ca'),(17,'Grace','grace710@aol.com','$2y$10$jfV0y813QtDOxYi7X7Bd4OA0OMB/N.90GAouxBwuCezyw8C4f7GBe','active','03252278226cb390ca00ca3d89487d86'),(18,'Bob','bob776@hotmail.com','$2y$10$xIxwuHfCfoyDbJM7.B.hWOeGDJkf6vdpJdOGJzWobwCvWlBtI6a7.','active','1358c5f929f3d72b3bd6b7965eef9c9b'),(19,'Grace','grace252@yahoo.com','$2y$10$x0V0bUhABOmIFHiv1bf80eE/Oz8zZPK4Um0n30.1M3xFnwCfk7HaC','active','2bbebdf15c18735aff518df10c64a433'),(20,'Alice','alice419@outlook.com','$2y$10$QDc16aH0r3D6Ycyg1RdyK.8Mpuz7CPYPG7R5wy6y8nJSk68urZ2Cm','active','2692b83abbd4868642207dc0c5f468e5'),(21,'Ivy','ivy977@gmail.com','$2y$10$9IBU8AtnaCRNV6FeB67KnussvuBstp5TNyCI03uLvWdYNEBGscyhq','active','4d3fe0d7758babfd4952b1ba94732d16'),(22,'David','david589@outlook.com','$2y$10$CcfaZUk7/q4D0yvHtIx27umfJt69XjBPKzWLidbds51Y0KZivy/YG','active','bf12ca11ef553e9e9c47fd7fbef1ff83'),(23,'Mia','mia615@yahoo.com','$2y$10$1hSM0yiI6lkHZ7TGoslNBe68LH1QX9xFzDLDIyJqJ31r2ecOH26lC','active','4d19caf898de7ce9e25adcfb69787a17'),(24,'Quinn','quinn718@outlook.com','$2y$10$Cdam2LdcvzIiJRkppW/UduTTzbBV0sprWNqVdqqMTA.CLSHW36gFW','active','0d507b6e48ed87c026c7a151b7e4f93d'),(25,'David','david775@mail.com','$2y$10$M9kOXYYK6NNz8KgutoMJ.O.naqvyin06YArnAkBVKTbgLtAXMkd66','active','7d7dac8d876db48e209f7570d8e0e8af'),(26,'Quinn','quinn493@protonmail.com','$2y$10$Hzu1r08weGaARablxFWD9uFv1H1kKt36bNiVpjKpuWyQNcuhEc242','active','fb60229f77dd5c8a85e3af17a9e9b30f'),(27,'Mia','mia510@protonmail.com','$2y$10$WHD4klils/M4iWzMBsfNMeKh0wEBSfNWTxupueY55jzkXnVKhzOlC','active','31fb35ae12a141f9cbb82fd059c0ee59'),(28,'Quinn','quinn413@protonmail.com','$2y$10$PPQfZ9jwIQ1m7xlbpdemWOYFwVKvI..c/FdboF9xt0dBXbhPiK06W','active','6384b6c90e637ecef7e9808906aeeecf'),(29,'Alice','alice218@gmail.com','$2y$10$0fbDVcbT0GTcguX5KoUsTexde.tKEIbfSdWCoWAZXrdfR0A/FIgtG','active','40f16878bc531fb023f081356866013a'),(30,'Alice','alice987@icloud.com','$2y$10$SwWjw1MkqEt/Hm1X/Qhx9eMNkxEYjoaucDa9sWw/o6dIM1QZfnBYm','active','7cbbca68c4efe642c2160c5509cdbf35'),(31,'Samantha','samantha589@outlook.com','$2y$10$4N5s3sJSgD7DwtohMIiK9eingLvQ22eZvRNPpI5tIi8kxJY8NZZG.','active','e6fa0ea60b9e0798fd12e5da2c329a14'),(32,'Ryan','ryan970@outlook.com','$2y$10$Q.1erzNlDS3YstD.6J7nfeesnQWcVS/V2OQ6q2BIUpPeVrd3owL7q','active','b33cfe3fcd4b1715fba285afeeb74af1');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci DEFAULT 'inactive',
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (14,'ajaysahu','nonoteh949@kaudat.com','$2y$10$WZb.mLFpuCvrCfoKTZwm5.SeAT4rCGy6PdYfksRf0vy2cSNZxK1fW','active','iv5KYDYHrJkQQMZDquqwrxpiJQIptvuE'),(16,'ajay sahu','tavika5862@marikuza.com','$2y$10$/QtU1S.N0I0OR6dtBo7Xb.0PqKBnLpyWI7PzqH0c0UtjXgwJAAl/u','active','J6GpvxUdohDMaPNtOSBZAfVhms7wzlLV'),(19,'ddd','yedeva1647@ippals.com','$2y$10$adwYX137BXa1/hfL.TRdFeu1bVPdu1DNYEkHCG1bBLIDHwL2g4BQK','active','rmWJ3PG61ahA8gF6sP1lo1WExrVJeHnm');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 10:47:31
