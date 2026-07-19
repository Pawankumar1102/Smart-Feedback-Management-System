-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: smart_feedback_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `college_id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `admin_type` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bio` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `college_id` (`college_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'SANJAY','SANJAY@123','sanjay123@gmail.com','9871234329','BTECH PRINCIPAL','Sanjay@123','images/profile/1778763141407_LMCrZXM.jpg','2026-05-10 20:12:13','HELLO DEARS,'),(2,'ARYAN ','Aryan031','aryan03@gmail.com','5456987320','BCOM PRINCIPAL','Aryan@12','images/profile/1778789421983_LMCrZXM.jpg','2026-05-14 19:47:05','hey!'),(3,'BHUPENDRA','Bhupendra012','bhupendraahirwar119@gmail.com','9131097425','PHARMACY PRINCIPAL','Bhupendra@119','images/profile/1778821620465_1752323588713.jpg.jpeg','2026-05-15 05:03:29','Time is Money'),(4,'ADITI','ADATI112','aditi112@gmail.com','8909876789','PHARMACY PRINCIPAL','Aditi@112','default.png','2026-05-17 05:15:29',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_words`
--

DROP TABLE IF EXISTS `blocked_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_words` (
  `id` int NOT NULL AUTO_INCREMENT,
  `word` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_words`
--

LOCK TABLES `blocked_words` WRITE;
/*!40000 ALTER TABLE `blocked_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocked_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_type` varchar(20) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `roll_or_college_id` varchar(100) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'student','SOMYA','somya@gmail.com','99','koi problem  nai hai mere ko....','2026-05-17 12:06:47'),(2,'student','SOMYA','somya@gmail.com','99','koi problem  nai hai mere ko....','2026-05-17 12:06:52'),(3,'student','SOMYA','somya@gmail.com','99','koi problem  nai hai mere ko....','2026-05-17 12:06:56'),(4,'student','SOMYA','somya@gmail.com','99','koi problem  nai hai mere ko....','2026-05-17 12:06:58'),(5,'faculty','deepak','deepak11@gmail.com','Deepak11','hello sir..','2026-05-17 12:33:56'),(6,'faculty','DEEPAK','deepak11@gmail.com','Deepak11','hello sie..','2026-05-17 12:34:42'),(7,'faculty','deepak','deepak11@gmail.com','Deepak11','hvbj','2026-05-17 13:47:39'),(8,'faculty','DEEPAK','deepak11@gmail.com','Deepak11','kya hal hai','2026-05-17 14:05:26'),(9,'admin','ADITI','aditi112@gmail.com','Adati112','fg','2026-05-17 14:16:36'),(10,'student','SOMYA','somya@gmail.com','99','hefd','2026-05-17 14:18:01'),(11,'student','SOMYA','somya@gmail.com','99','fdcs','2026-05-17 14:20:15'),(12,'faculty','DEEPAK','deepak11@gmail.com','Deepak11','heelo sir,','2026-05-17 14:30:37'),(13,'admin','ARYAN ','aryan03@gmail.com','Aryan031','heelo/','2026-05-17 14:31:44'),(14,'student','SOMYA','somya@gmail.com','99','heelo/','2026-05-17 14:32:37'),(15,'admin','ARYAN ','aryan03@gmail.com','Aryan031','heelo/','2026-05-17 14:42:50'),(16,'faculty','deepak','deepak11@gmail.com','Deepak11','hii','2026-05-17 14:43:36'),(17,'faculty','deepak','deepak11@gmail.com','Deepak11','hii','2026-05-17 14:43:37'),(18,'student','sahil','sahil112@gmail.com','112','kya hua','2026-05-17 15:27:57'),(19,'student','Pawan Mehta','pawanmehtabalco@gmail.com','101','heelo sir','2026-05-20 03:40:31'),(20,'student','pawan','pawanmehtabalco@gmail.com','101','helo sir..','2026-05-20 03:41:53');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `college_id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `teacher_field` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) DEFAULT 'default.png',
  `status` varchar(20) DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bio` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `college_id` (`college_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (5,'DEEPAK','Deepak11','deepak11@gmail.com','7687987898',NULL,'BCOM','Deepak@12','images/profile/1778790440566_no dope.webp','ACTIVE','2026-05-14 19:48:56','hey!'),(6,'LAKESH','Lakesh03','lakesh03@gmail.com','6747687545',NULL,'BCOM','Lakesh@12','images/profile/1778795153859_no dope.webp','ACTIVE','2026-05-14 21:44:28','hello Bachhooo..!'),(7,'RAJESH','Rajesh1102','rajesh1102@gmail.com','7678975467','CS','BTECH','Rajesh@12','images/profile/1778805163063_High_resolution_wallpaper_background_ID_77700890533.jpg','ACTIVE','2026-05-15 00:31:29','EXPERIENCE OF TEACHING\r\n\r\n5 YEARS'),(8,'AKASH','AKASH112','akash@gmail.com','9098909876','','PHARMACY','Akash@112','default.png','ACTIVE','2026-05-17 05:13:21',NULL),(9,'VIKRAM AHIRWAR','VIKRAM100','vikram100@gmail.com','890987657',NULL,'PHARMACY','Vikram@100',NULL,'ACTIVE','2026-05-18 12:20:02',NULL);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `faculty_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `comment` text,
  `is_anonymous` tinyint(1) DEFAULT '1',
  `status` varchar(20) DEFAULT 'ACTIVE',
  `subject_name` varchar(255) DEFAULT NULL,
  `subject_knowledge` int DEFAULT NULL,
  `behaviour` int DEFAULT NULL,
  `teaching_skill` int DEFAULT NULL,
  `feedback_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `faculty_id` (`faculty_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `feedbacks_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`),
  CONSTRAINT `feedbacks_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,4,5,NULL,'nice..',1,'ACTIVE','Accounts',4,3,4,'2026-05-15 00:02:07',3.666666666),(2,4,6,NULL,'maja hi aagayaaa....',1,'ACTIVE','Statatics',4,4,2,'2026-05-15 00:02:54',3.333333333),(3,2,7,NULL,'No Comment',1,'ACTIVE','DSA',4,3,5,'2026-05-16 07:17:56',4),(4,6,9,NULL,'amazing faculty',1,'ACTIVE','LAB',5,4,3,'2026-05-18 16:47:19',4),(5,1,5,NULL,'it me pawan sir',1,'ACTIVE','ACCOUNTS',4,3,4,'2026-05-20 03:43:30',3.6666666666666665);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_verification`
--

DROP TABLE IF EXISTS `otp_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_verification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_verification`
--

LOCK TABLES `otp_verification` WRITE;
/*!40000 ALTER TABLE `otp_verification` DISABLE KEYS */;
INSERT INTO `otp_verification` VALUES (1,'bhupendraahirwar119@gmail.com','818348','2026-05-17 17:47:56'),(2,'bhupendraahirwar119@gmail.com','696904','2026-05-17 17:49:54'),(3,'pawanmehtabalco@gmail.com','500459','2026-05-17 17:52:55'),(4,'pawanmehtabalco@gmail.com','751961','2026-05-17 18:13:16'),(5,'pawanmehtabalco@gmail.com','302190','2026-05-17 18:13:21'),(6,'pawanmehtabalco@gmail.com','287295','2026-05-17 18:36:36'),(7,'pawanmehtabalco@gmail.com','355008','2026-05-18 04:50:11'),(8,'pawanmehtabalco@gmail.com','387940','2026-05-18 05:00:12'),(9,'pawanmehtabalco@gmail.com','941849','2026-05-18 05:05:59'),(10,'pawanmehtabalco@gmail.com','688085','2026-05-18 05:09:40'),(11,'pawanmehtabalco@gmail.com','217651','2026-05-18 05:11:05'),(12,'pawanmehtabalco@gmail.com','521654','2026-05-18 05:27:36'),(13,'bhupendraahirwar119@gmail.com','268759','2026-05-18 05:37:38');
/*!40000 ALTER TABLE `otp_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `roll_number` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `semester` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) DEFAULT 'default.png',
  `status` varchar(20) DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bio` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roll_number` (`roll_number`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'PAWAN','101','BCOM',NULL,'2','4','pawanmehtabalco@gmail.com','7898312440','Pawan@123','images/profile/1778821242124_IMG-20241110-WA0069.jpg','ACTIVE','2026-05-10 19:19:34','Data Analyst || PowerBI Developer '),(2,'VIKRAM AHIRWAR','0198CS221120','BTECH','CS','2','3','vikramahirwar8103@gmail.com','8103748715','Vikram@123','images/profile/1778915844448_warhammer-40k-lost-crusade-space-marines-42cxl3nz7ncddtfh.jpg','ACTIVE','2026-05-11 08:18:19',''),(3,'DINKAR','0198CS221070','BTECH','AIML','1','1','dinkar11@gmail.com','7898312448','Dinkar@12','images/profile/1778750294274_warhammer-40k-lost-crusade-space-marines-42cxl3nz7ncddtfh.jpg','ACTIVE','2026-05-14 07:56:17',''),(4,'SURAJ','202','BCOM',NULL,'1','2','suraj02@gmail.com','8789865479','Suraj@12','images/profile/1778792700297_download (2).jpeg','ACTIVE','2026-05-14 21:04:06','Helo!'),(5,'SOMYA','99','MBA',NULL,'2','4','somya@gmail.com','787678765','Somya@99','images/profile/1778835759799_no dope.jpg','ACTIVE','2026-05-15 09:01:01','jshkj'),(6,'SAHIL','112','PHARMACY','CS','3','5','sahil112@gmail.com','7898649487','Sahil@112','default.png','ACTIVE','2026-05-17 05:57:26','');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `college_id` varchar(50) DEFAULT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faculty_id` (`college_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (7,'Deepak11','Accounts','BCOM','','2','4'),(9,'Deepak11','Calculation','BCOM','','1','2'),(10,'Lakesh03','Statatics','BCOM','','3','6'),(11,'Rajesh1102','DSA','BTECH','CS','2','3'),(12,'Rajesh1102','ADA','BTECH','CS','2','4'),(13,'Deepak11','ecconomics','BCOM','','2','4'),(14,'VIKRAM100','LAB','PHARMACY','','3','5'),(15,'DEEPAK11','DSA','BTECH','CS','4','7');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-19 17:08:24
