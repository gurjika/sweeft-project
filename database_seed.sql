-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: exercisehub
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add assessment',7,'add_assessment'),(26,'Can change assessment',7,'change_assessment'),(27,'Can delete assessment',7,'delete_assessment'),(28,'Can view assessment',7,'view_assessment'),(29,'Can add plan',8,'add_plan'),(30,'Can change plan',8,'change_plan'),(31,'Can delete plan',8,'delete_plan'),(32,'Can view plan',8,'view_plan'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add weekday',10,'add_weekday'),(38,'Can change weekday',10,'change_weekday'),(39,'Can delete weekday',10,'delete_weekday'),(40,'Can view weekday',10,'view_weekday'),(41,'Can add muscle',11,'add_muscle'),(42,'Can change muscle',11,'change_muscle'),(43,'Can delete muscle',11,'delete_muscle'),(44,'Can view muscle',11,'view_muscle'),(45,'Can add plan weekday',12,'add_planweekday'),(46,'Can change plan weekday',12,'change_planweekday'),(47,'Can delete plan weekday',12,'delete_planweekday'),(48,'Can view plan weekday',12,'view_planweekday'),(49,'Can add exercise',13,'add_exercise'),(50,'Can change exercise',13,'change_exercise'),(51,'Can delete exercise',13,'delete_exercise'),(52,'Can view exercise',13,'view_exercise'),(53,'Can add exercise achievement',14,'add_exerciseachievement'),(54,'Can change exercise achievement',14,'change_exerciseachievement'),(55,'Can delete exercise achievement',14,'delete_exerciseachievement'),(56,'Can view exercise achievement',14,'view_exerciseachievement'),(57,'Can add tracking',15,'add_tracking'),(58,'Can change tracking',15,'change_tracking'),(59,'Can delete tracking',15,'delete_tracking'),(60,'Can view tracking',15,'view_tracking'),(61,'Can add muscle exercise',16,'add_muscleexercise'),(62,'Can change muscle exercise',16,'change_muscleexercise'),(63,'Can delete muscle exercise',16,'delete_muscleexercise'),(64,'Can view muscle exercise',16,'view_muscleexercise'),(65,'Can add exercise plan',17,'add_exerciseplan'),(66,'Can change exercise plan',17,'change_exerciseplan'),(67,'Can delete exercise plan',17,'delete_exerciseplan'),(68,'Can view exercise plan',17,'view_exerciseplan'),(69,'Can add exercise custom',18,'add_exercisecustom'),(70,'Can change exercise custom',18,'change_exercisecustom'),(71,'Can delete exercise custom',18,'delete_exercisecustom'),(72,'Can view exercise custom',18,'view_exercisecustom'),(73,'Can add completed exercise',19,'add_completedexercise'),(74,'Can change completed exercise',19,'change_completedexercise'),(75,'Can delete completed exercise',19,'delete_completedexercise'),(76,'Can view completed exercise',19,'view_completedexercise'),(77,'Can add profile tracking',20,'add_profiletracking'),(78,'Can change profile tracking',20,'change_profiletracking'),(79,'Can delete profile tracking',20,'delete_profiletracking'),(80,'Can view profile tracking',20,'view_profiletracking');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `core_user_email_92a71487_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$720000$WbaQbD8KSOZHULrWGY3cSc$Xrz3X4sqFTiE/kBz7Xdyrwc36Xx2+yslfeb6hnWkjiA=','2024-03-10 16:33:14.082715',1,'gurjika','','','lgurjidze@gmail.com',1,1,'2024-03-10 15:18:24.162501'),(11,'pbkdf2_sha256$720000$mtdXvRx50TfftdC8nHFgxx$v3rnBccHG9qf6TEPwpb9bLM3dUI9hJsfCImqfQcqxmo=',NULL,0,'lgurjia','','','admin@blog.com',0,1,'2024-03-12 13:13:58.491693'),(12,'pbkdf2_sha256$720000$hqh5nHkbltdKg6M6HC3Erw$9m0v61GryYkoCg4QtIaUSbjP93la1GVUD3sv4pcKcGs=',NULL,0,'qeta','qeta','gvineria','qeta@gmail.com',0,1,'2024-03-12 15:04:21.296347'),(13,'pbkdf2_sha256$720000$bFb2qmfRQ8enzQWU6I7kgf$knTBLhJffEUw3FFNdIFSD0HONbkriI2kHcMycEqeflk=',NULL,0,'irakli','irakli','kurdgela','luka@email.com',0,1,'2024-03-12 15:27:29.533454');
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-03-11 11:37:18.446442','7','lgurjika',1,'[{\"added\": {}}]',6,1),(2,'2024-03-12 13:13:58.680037','11','lgurjia',1,'[{\"added\": {}}]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'core','user'),(7,'exercisehub','assessment'),(19,'exercisehub','completedexercise'),(13,'exercisehub','exercise'),(14,'exercisehub','exerciseachievement'),(18,'exercisehub','exercisecustom'),(17,'exercisehub','exerciseplan'),(11,'exercisehub','muscle'),(16,'exercisehub','muscleexercise'),(8,'exercisehub','plan'),(12,'exercisehub','planweekday'),(9,'exercisehub','profile'),(20,'exercisehub','profiletracking'),(15,'exercisehub','tracking'),(10,'exercisehub','weekday'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-10 15:17:53.494788'),(2,'contenttypes','0002_remove_content_type_name','2024-03-10 15:17:53.532361'),(3,'auth','0001_initial','2024-03-10 15:17:53.682770'),(4,'auth','0002_alter_permission_name_max_length','2024-03-10 15:17:53.713945'),(5,'auth','0003_alter_user_email_max_length','2024-03-10 15:17:53.717941'),(6,'auth','0004_alter_user_username_opts','2024-03-10 15:17:53.722453'),(7,'auth','0005_alter_user_last_login_null','2024-03-10 15:17:53.726454'),(8,'auth','0006_require_contenttypes_0002','2024-03-10 15:17:53.728453'),(9,'auth','0007_alter_validators_add_error_messages','2024-03-10 15:17:53.733454'),(10,'auth','0008_alter_user_username_max_length','2024-03-10 15:17:53.737454'),(11,'auth','0009_alter_user_last_name_max_length','2024-03-10 15:17:53.741454'),(12,'auth','0010_alter_group_name_max_length','2024-03-10 15:17:53.751889'),(13,'auth','0011_update_proxy_permissions','2024-03-10 15:17:53.756347'),(14,'auth','0012_alter_user_first_name_max_length','2024-03-10 15:17:53.760356'),(15,'core','0001_initial','2024-03-10 15:17:53.925765'),(16,'admin','0001_initial','2024-03-10 15:17:54.007974'),(17,'admin','0002_logentry_remove_auto_add','2024-03-10 15:17:54.013164'),(18,'admin','0003_logentry_add_action_flag_choices','2024-03-10 15:17:54.017646'),(19,'core','0002_alter_user_email','2024-03-10 15:17:54.033671'),(20,'sessions','0001_initial','2024-03-10 15:17:54.053169'),(21,'exercisehub','0001_initial','2024-03-10 16:10:58.493323'),(22,'exercisehub','0002_exercisecustom','2024-03-10 16:26:05.215456'),(23,'exercisehub','0003_alter_weekday_options_alter_exercise_start_distance_and_more','2024-03-10 17:42:22.741927'),(24,'exercisehub','0004_alter_exerciseachievement_achieved_distance_and_more','2024-03-10 17:43:36.119944'),(25,'exercisehub','0005_rename_muscle_exercise_muscles_and_more','2024-03-10 18:40:00.607400'),(26,'exercisehub','0006_alter_exercisecustom_created_by_alter_plan_exercise_and_more','2024-03-10 19:34:10.777748'),(27,'exercisehub','0007_alter_exercisecustom_created_by_and_more','2024-03-10 19:35:33.410544'),(28,'exercisehub','0008_remove_plan_weekday_weekday_plan_delete_planweekday','2024-03-11 09:16:29.380720'),(29,'exercisehub','0009_alter_weekday_plan','2024-03-11 09:28:04.379922'),(30,'exercisehub','0010_remove_plan_user_remove_tracking_user_plan_profile_and_more','2024-03-11 09:43:00.691044'),(31,'exercisehub','0011_alter_plan_profile','2024-03-11 10:08:10.261056'),(32,'exercisehub','0012_remove_assessment_weight_gained_and_more','2024-03-11 10:18:24.742884'),(33,'exercisehub','0013_assessment_profile','2024-03-11 10:27:43.413985'),(34,'exercisehub','0014_rename_weight_profile_start_weight_and_more','2024-03-11 10:56:59.680810'),(35,'exercisehub','0015_alter_profile_age_alter_profile_goal_weight_and_more','2024-03-11 11:36:51.719318'),(36,'exercisehub','0016_exerciseachievement_profile_and_more','2024-03-11 12:53:48.475618'),(37,'exercisehub','0017_remove_exerciseachievement_achieved_distance_and_more','2024-03-11 13:21:29.220599'),(38,'exercisehub','0018_remove_exercise_start_distance','2024-03-11 13:21:29.245245'),(39,'exercisehub','0019_exerciseachievement_duration','2024-03-11 13:28:58.977217'),(40,'exercisehub','0020_exerciseachievement_date_added','2024-03-11 13:57:20.089555'),(41,'exercisehub','0021_rename_start_reps_exercise_reps_and_more','2024-03-11 14:04:53.430009'),(42,'exercisehub','0022_remove_tracking_completion_rate_and_more','2024-03-11 18:09:23.576895'),(43,'exercisehub','0023_completedexercise','2024-03-11 18:34:32.289076'),(44,'exercisehub','0024_profiletracking','2024-03-12 09:22:41.686998'),(45,'exercisehub','0025_profile_overall_completion_rate_and_more','2024-03-12 09:24:18.120342'),(46,'exercisehub','0026_alter_assessment_options_and_more','2024-03-12 10:45:38.713926'),(47,'exercisehub','0027_remove_weekday_plan_plan_weekday_alter_tracking_plan','2024-03-12 12:11:10.943107'),(48,'exercisehub','0028_alter_plan_unique_together','2024-03-12 12:33:02.477910'),(49,'exercisehub','0029_alter_plan_unique_together_alter_plan_weekday','2024-03-12 12:33:02.558626'),(50,'exercisehub','0030_alter_plan_unique_together','2024-03-12 12:33:02.608910'),(51,'exercisehub','0031_alter_plan_weekday','2024-03-12 12:40:55.743926'),(52,'exercisehub','0032_alter_plan_options_alter_plan_profile_and_more','2024-03-12 16:20:13.872217'),(53,'exercisehub','0033_alter_exercisecustom_default_exercise','2024-03-12 17:30:52.719968'),(54,'exercisehub','0034_completedexercise_completed_by','2024-03-12 20:21:27.916481'),(55,'exercisehub','0035_alter_assessment_weight_and_more','2024-03-12 20:44:08.617156'),(56,'exercisehub','0036_completedexercise_time_completed','2024-03-12 20:58:08.592170'),(57,'exercisehub','0037_alter_completedexercise_options_and_more','2024-03-13 09:25:34.458847');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2fktepyikvqmnjz8q046t2qeheb2rupy','.eJxVjEEOwiAQRe_C2hBmEBCX7j0DmYFBqqZNSrsy3l2bdKHb_977L5VoXVpau8xpKOqsQB1-N6b8kHED5U7jbdJ5Gpd5YL0peqddX6ciz8vu_h006u1bEyMKVQE-AQcD1tQiaF2kABEQxLJhe3TgxTlfTI5SHaJl9BmCrer9AePGN38:1rjM6s:muKXbCDJbHR39MnqepPoel9MS0RWvubOvxC3zWuZiHw','2024-03-24 16:33:14.085552');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_assessment`
--

DROP TABLE IF EXISTS `exercisehub_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_assessment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `weight` decimal(5,2) NOT NULL,
  `weight_added` date NOT NULL,
  `profile_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercisehub_assessme_profile_id_cd4143b2_fk_exerciseh` (`profile_id`),
  CONSTRAINT `exercisehub_assessme_profile_id_cd4143b2_fk_exerciseh` FOREIGN KEY (`profile_id`) REFERENCES `exercisehub_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_assessment`
--

LOCK TABLES `exercisehub_assessment` WRITE;
/*!40000 ALTER TABLE `exercisehub_assessment` DISABLE KEYS */;
INSERT INTO `exercisehub_assessment` VALUES (1,81.60,'2023-06-29',1),(2,81.60,'2023-10-22',1),(3,80.70,'2023-05-30',1),(4,81.40,'2023-04-22',1),(5,81.90,'2023-11-08',1),(6,83.30,'2023-06-06',1),(7,82.10,'2023-07-14',1),(8,80.70,'2023-12-28',1),(9,80.30,'2024-01-22',1),(10,84.30,'2023-08-31',1),(11,81.20,'2024-02-06',1),(12,80.20,'2023-06-30',1),(13,83.20,'2024-02-19',1),(14,83.90,'2023-12-22',1),(15,83.80,'2024-01-03',1),(16,86.00,'2024-03-11',1),(17,87.00,'2024-03-11',1),(18,83.00,'2024-03-11',1),(19,86.00,'2024-03-12',1),(20,80.00,'2024-03-12',1),(21,80.00,'2024-03-12',1),(22,90.00,'2024-03-12',1),(23,87.00,'2024-03-12',1);
/*!40000 ALTER TABLE `exercisehub_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_completedexercise`
--

DROP TABLE IF EXISTS `exercisehub_completedexercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_completedexercise` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reps` smallint unsigned NOT NULL,
  `sets` smallint unsigned NOT NULL,
  `duration` smallint unsigned NOT NULL,
  `exercise_id` bigint NOT NULL,
  `completed_by_id` bigint NOT NULL,
  `time_completed` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercisehub_complete_exercise_id_be2ff51c_fk_exerciseh` (`exercise_id`),
  KEY `exercisehub_complete_completed_by_id_96633901_fk_exerciseh` (`completed_by_id`),
  CONSTRAINT `exercisehub_complete_completed_by_id_96633901_fk_exerciseh` FOREIGN KEY (`completed_by_id`) REFERENCES `exercisehub_profile` (`id`),
  CONSTRAINT `exercisehub_complete_exercise_id_be2ff51c_fk_exerciseh` FOREIGN KEY (`exercise_id`) REFERENCES `exercisehub_exercise` (`id`),
  CONSTRAINT `exercisehub_completedexercise_chk_1` CHECK ((`reps` >= 0)),
  CONSTRAINT `exercisehub_completedexercise_chk_2` CHECK ((`sets` >= 0)),
  CONSTRAINT `exercisehub_completedexercise_chk_3` CHECK ((`duration` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_completedexercise`
--

LOCK TABLES `exercisehub_completedexercise` WRITE;
/*!40000 ALTER TABLE `exercisehub_completedexercise` DISABLE KEYS */;
INSERT INTO `exercisehub_completedexercise` VALUES (1,4,3,5,1,1,'2024-03-12'),(2,4,5,6,1,1,'2024-03-12'),(3,5,5,4,1,1,'2024-03-12'),(4,5,4,8,1,1,'2024-03-12'),(5,5,6,8,1,1,'2024-03-12'),(6,2,3,4,1,1,'2024-03-12'),(7,2,3,4,1,1,'2024-03-12'),(8,3,7,15,1,1,'2024-03-12'),(9,3,7,20,1,1,'2024-03-12'),(10,3,7,20,1,1,'2024-03-12'),(11,3,7,20,1,1,'2024-03-12'),(12,3,7,20,1,1,'2024-03-12'),(13,5,3,20,2,1,'2024-03-12'),(14,11,11,20,2,1,'2024-03-12'),(15,6,3,15,5,1,'2024-03-12'),(16,9,10,20,2,1,'2024-03-12'),(17,6,2,15,5,1,'2024-03-12'),(18,6,2,15,5,1,'2024-03-12'),(19,10,9,20,2,1,'2024-03-12'),(20,10,10,20,5,1,'2024-03-12'),(21,6,3,20,5,1,'2024-03-12'),(22,10,10,20,2,1,'2024-03-12'),(23,8,8,20,5,1,'2024-03-12'),(24,20,20,20,5,1,'2024-03-12'),(25,5,6,20,2,1,'2024-03-12'),(26,5,5,20,2,1,'2024-03-12'),(27,4,5,20,2,1,'2024-03-12'),(28,5,6,20,2,1,'2024-03-12'),(29,5,4,20,2,1,'2024-03-12'),(30,6,3,20,5,1,'2024-03-12'),(31,7,5,20,1,1,'2024-03-12'),(32,6,7,20,1,1,'2024-03-12'),(33,5,6,7,1,1,'2024-03-12'),(34,5,10,20,1,1,'2024-03-12'),(35,4,5,20,1,1,'2024-03-12'),(36,5,6,20,1,1,'2024-03-12'),(37,5,5,20,1,1,'2024-03-12'),(38,3,4,5,1,1,'2024-03-12'),(39,8,9,25,1,1,'2024-03-12'),(40,5,6,20,1,6,'2024-03-13'),(41,5,6,20,1,6,'2024-03-13'),(42,10,5,25,5,6,'2024-03-13');
/*!40000 ALTER TABLE `exercisehub_completedexercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_exercise`
--

DROP TABLE IF EXISTS `exercisehub_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_exercise` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `reps` smallint unsigned DEFAULT NULL,
  `sets` smallint unsigned DEFAULT NULL,
  `duration` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `exercisehub_exercise_chk_3` CHECK ((`duration` >= 0)),
  CONSTRAINT `exercisehub_exercise_reps_d84c7160_check` CHECK ((`reps` >= 0)),
  CONSTRAINT `exercisehub_exercise_sets_1bad7815_check` CHECK ((`sets` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_exercise`
--

LOCK TABLES `exercisehub_exercise` WRITE;
/*!40000 ALTER TABLE `exercisehub_exercise` DISABLE KEYS */;
INSERT INTO `exercisehub_exercise` VALUES (1,'Overhead Press','Stand with feet shoulder-width apart, holding a barbell at shoulder height with a grip slightly wider than shoulder width. Press the barbell upwards until your arms are fully extended overhead. Lower the bar back to the starting position.',3,3,15),(2,'Pull-Up','Grip a pull-up bar with hands slightly wider than shoulder-width apart, palms facing away from you. Pull your body up until your chin is above the bar by retracting your shoulder blades and driving your elbows down. Lower yourself back down slowly and under control.',7,2,17),(4,'Deadlift','Stand with feet hip-width apart, a barbell in front of your shins. Hinge at your hips to grip the barbell, keeping your back flat. Drive through your heels to stand up straight, pulling the barbell up while keeping it close to your body. Return to the starting position by hinging at the hips and lowering the barbell to the ground.',4,3,12),(5,'Barbell Row','Stand with feet shoulder-width apart, knees slightly bent. Bend over at the waist while keeping your back straight. Hold a barbell with a grip slightly wider than shoulder-width. Pull the bar towards your lower chest, keeping your elbows close to your body. Return to the starting position.',6,3,15),(6,'Front Squat','Start with the barbell on your front shoulders, elbows high. Sit back and down, keeping your knees in line with your toes. Drive up through your heels to return to the starting position.',5,6,15),(7,'Lunges','Grab the pull-up bar with your palms facing away from you and your hands slightly wider than shoulder-width apart. Hang with your arms fully extended. Pull yourself up by pulling your elbows down to the floor until your chin passes the bar. Lower yourself back down to the starting position in a controlled manner.',4,4,10),(8,'Bent-over Row','Stand with your feet shoulder-width apart, holding a barbell with an overhand grip. Bend your knees slightly and lean forward by bending at the waist, keeping your back straight. Pull the bar towards your lower chest, keeping your elbows close to your body. Lower the barbell back to the starting position in a controlled motion.',5,4,10),(9,'Plank','Begin in the pushup position, with your forearms on the ground and your elbows aligned below your shoulders. Your arms should be parallel to the body at about shoulder-width distance. Hold this position, keeping your body in a straight line from your head to your feet.',1,3,8),(10,'Russian Twists','Sit on the floor with your knees bent, feet lifted slightly off the ground, and lean back at a 45-degree angle. Hold a medicine ball or dumbbell with both hands in front of you. Twist your torso to the right and touch the weight to the ground beside you, then twist to the left. This completes one rep.',10,3,12),(11,'Bicep Curls','Stand with your feet shoulder-width apart, holding a dumbbell in each hand at arm\'s length. Keep your elbows close to your torso and rotate your palms so they are facing forward. While keeping the upper arms stationary, curl the weights while contracting your biceps. Continue to raise the weights until your biceps are fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a brief pause as you squeeze your biceps. Then, begin to lower the dumbbells back to the starting position.',10,3,15),(12,'Tricep Dips','Position your hands shoulder-width apart on a secured bench or stable chair. Slide your butt off the front of the bench with your legs extended in front of you. Straighten your arms, keeping a little bend in your elbows to keep tension on your triceps and off your elbow joints. Slowly bend your elbows to lower your body toward the floor until your elbows are at about a 90-degree angle. Be sure to keep your back close to the bench. Once you reach the bottom of the movement, press down into the bench to straighten your elbows, returning to the starting position. This completes one rep.',9,3,12),(13,'Mountain Climbers','Start in a plank position with your arms and legs long. Keep your abs pulled in and your body straight. Swoop your right knee in towards your chest, with the toes just off the ground. Return your right leg to the starting position as you simultaneously drive your left knee towards your chest. Continue to switch legs, picking up the pace until it feels a little like running in place in a plank position.',17,3,15),(14,'Leg Raises','Lie flat on your back with your legs straight and together. Keep your legs straight and lift them all the way up to the ceiling until your butt comes off the floor. Slowly lower your legs back down till they\'re just above the floor. Hold for a moment. Raise your legs back up. Do not let your legs touch the floor.',12,3,10),(15,'Front Squats','Position a barbell just above your chest, resting it on the front of your shoulders. Cross your arms to hold the bar in place and keep your elbows high throughout the movement. Descend into a squat by bending your knees and sitting back with your hips. Keep your chest up and your back straight. Drive through your heels to return to the starting position.',9,3,12),(16,'Face Pulls','Attach a rope to the pulley of a cable station. Grasp the rope with both hands and step back, tension in the cable. Pull the rope towards your forehead, flaring your elbows out and squeezing your shoulder blades together. Slowly return to the starting position.',11,3,10),(17,'Leg Curls','Lie face down on a leg curl machine, positioning the pad of the lever on the back of your legs, just below the calves. Securely hook your feet under the pad. Keeping your torso flat on the bench, curl your legs up as far as possible without lifting your upper legs from the pad. Hold for a second, then slowly lower the weight back to the starting position.',10,3,10),(18,'Cable Flys','Stand in the middle of a cable machine, holding a handle in each hand. Start with your hands out to the sides, slightly below shoulder height, and palms facing forward. Keeping a slight bend in your elbows, bring your hands together in front of you in a wide arc. Slowly return to the starting position.',11,4,15),(19,'Bulgarian Split Squats','Stand about 2 feet in front of a bench or step, facing away from it. Place one foot on the bench behind you. Lower your hips until your front thigh is almost parallel to the floor, keeping your knee in line with your foot. Drive through your front heel to return to the starting position.',9,2,12),(20,'Dumbbell Shoulder Press','Sit or stand with a dumbbell in each hand at shoulder height. Your palms should face forward. Press the weights above your head until your arms are fully extended. Pause briefly at the top before slowly lowering the dumbbells back to the starting position.',8,4,8),(21,'Lat Pulldowns','Sit at a lat pulldown station and grab the bar with a wide grip, palms facing away from you. Lean back slightly and pull the bar down to your chest, drawing your shoulder blades back and down. Slowly return the bar to the starting position with your arms fully extended.',7,5,15),(22,'Cable Tricep Pushdown','Attach a bar to a high pulley and grab the bar with an overhand grip, hands shoulder-width apart. Stand upright with a slight forward lean, keeping your elbows close to your body. Push the bar down by extending your arms and flexing at the elbow. Pause at the bottom of the movement, then slowly return to the starting position.',6,5,10),(23,'Seated Leg Press','Sit down at a leg press machine and place your feet on the platform in front of you at shoulder-width apart. Lower the safety bars holding the weighted platform, and press the platform all the way up until your legs are fully extended, without locking your knees. Lower the platform by bending your knees and return to the starting position.',7,7,14);
/*!40000 ALTER TABLE `exercisehub_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_exerciseachievement`
--

DROP TABLE IF EXISTS `exercisehub_exerciseachievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_exerciseachievement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `achieved_sets` smallint unsigned DEFAULT NULL,
  `achieved_reps` smallint unsigned DEFAULT NULL,
  `exercise_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  `duration` smallint unsigned NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercisehub_exercise_exercise_id_9a3e1b02_fk_exerciseh` (`exercise_id`),
  KEY `exercisehub_exercise_profile_id_c74dbbff_fk_exerciseh` (`profile_id`),
  CONSTRAINT `exercisehub_exercise_exercise_id_9a3e1b02_fk_exerciseh` FOREIGN KEY (`exercise_id`) REFERENCES `exercisehub_exercise` (`id`),
  CONSTRAINT `exercisehub_exercise_profile_id_c74dbbff_fk_exerciseh` FOREIGN KEY (`profile_id`) REFERENCES `exercisehub_profile` (`id`),
  CONSTRAINT `exercisehub_exerciseachievement_chk_1` CHECK ((`achieved_sets` >= 0)),
  CONSTRAINT `exercisehub_exerciseachievement_chk_2` CHECK ((`achieved_reps` >= 0)),
  CONSTRAINT `exercisehub_exerciseachievement_chk_3` CHECK ((`duration` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_exerciseachievement`
--

LOCK TABLES `exercisehub_exerciseachievement` WRITE;
/*!40000 ALTER TABLE `exercisehub_exerciseachievement` DISABLE KEYS */;
INSERT INTO `exercisehub_exerciseachievement` VALUES (14,6,3,1,1,15,'2024-03-11'),(15,7,3,1,1,15,'2024-03-11'),(16,6,5,1,1,7,'2024-03-12'),(17,10,5,1,1,20,'2024-03-12'),(18,5,4,1,6,20,'2024-03-12'),(19,6,5,1,6,20,'2024-03-12'),(20,9,8,1,1,25,'2024-03-13'),(21,5,10,5,6,25,'2024-03-13');
/*!40000 ALTER TABLE `exercisehub_exerciseachievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_exercisecustom`
--

DROP TABLE IF EXISTS `exercisehub_exercisecustom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_exercisecustom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `new_reps` smallint unsigned DEFAULT NULL,
  `new_sets` smallint unsigned DEFAULT NULL,
  `duration` smallint unsigned NOT NULL,
  `created_by_id` bigint NOT NULL,
  `default_exercise_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercisehub_exercise_created_by_id_0a792334_fk_core_user` (`created_by_id`),
  KEY `exercisehub_exercisecustom_default_exercise_id_2635da4e` (`default_exercise_id`),
  CONSTRAINT `exercisehub_exercise_created_by_id_0a792334_fk_core_user` FOREIGN KEY (`created_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `exercisehub_exercise_default_exercise_id_2635da4e_fk_exerciseh` FOREIGN KEY (`default_exercise_id`) REFERENCES `exercisehub_exercise` (`id`),
  CONSTRAINT `exercisehub_exercisecustom_chk_1` CHECK ((`new_reps` >= 0)),
  CONSTRAINT `exercisehub_exercisecustom_chk_2` CHECK ((`new_sets` >= 0)),
  CONSTRAINT `exercisehub_exercisecustom_chk_3` CHECK ((`duration` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_exercisecustom`
--

LOCK TABLES `exercisehub_exercisecustom` WRITE;
/*!40000 ALTER TABLE `exercisehub_exercisecustom` DISABLE KEYS */;
INSERT INTO `exercisehub_exercisecustom` VALUES (7,7,8,15,13,1),(9,9,10,15,1,1);
/*!40000 ALTER TABLE `exercisehub_exercisecustom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_exerciseplan`
--

DROP TABLE IF EXISTS `exercisehub_exerciseplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_exerciseplan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint NOT NULL,
  `plan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercisehub_exerciseplan_plan_id_f7c33940_fk_exercisehub_plan_id` (`plan_id`),
  KEY `exercisehub_exercise_exercise_id_42305667_fk_exerciseh` (`exercise_id`),
  CONSTRAINT `exercisehub_exercise_exercise_id_42305667_fk_exerciseh` FOREIGN KEY (`exercise_id`) REFERENCES `exercisehub_exercise` (`id`),
  CONSTRAINT `exercisehub_exerciseplan_plan_id_f7c33940_fk_exercisehub_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `exercisehub_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_exerciseplan`
--

LOCK TABLES `exercisehub_exerciseplan` WRITE;
/*!40000 ALTER TABLE `exercisehub_exerciseplan` DISABLE KEYS */;
INSERT INTO `exercisehub_exerciseplan` VALUES (18,1,13),(19,1,11),(20,1,14),(21,6,14);
/*!40000 ALTER TABLE `exercisehub_exerciseplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_muscle`
--

DROP TABLE IF EXISTS `exercisehub_muscle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_muscle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `muscle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_muscle`
--

LOCK TABLES `exercisehub_muscle` WRITE;
/*!40000 ALTER TABLE `exercisehub_muscle` DISABLE KEYS */;
INSERT INTO `exercisehub_muscle` VALUES (1,'Hamstrings'),(2,'Glutes'),(3,'Lower back'),(4,'Traps'),(5,'Chest'),(6,'Shoulders'),(7,'Triceps'),(8,'Upper back'),(9,'Latissimus dorsi'),(10,'Biceps'),(11,'Core'),(12,'Quads'),(13,'Gluteus Maximus'),(14,'Quadriceps'),(15,'Rhomboids'),(16,'Forearms'),(17,'Calves');
/*!40000 ALTER TABLE `exercisehub_muscle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_muscleexercise`
--

DROP TABLE IF EXISTS `exercisehub_muscleexercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_muscleexercise` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint NOT NULL,
  `muscle_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercisehub_muscleex_exercise_id_e5143bea_fk_exerciseh` (`exercise_id`),
  KEY `exercisehub_muscleex_muscle_id_68d2124f_fk_exerciseh` (`muscle_id`),
  CONSTRAINT `exercisehub_muscleex_exercise_id_e5143bea_fk_exerciseh` FOREIGN KEY (`exercise_id`) REFERENCES `exercisehub_exercise` (`id`),
  CONSTRAINT `exercisehub_muscleex_muscle_id_68d2124f_fk_exerciseh` FOREIGN KEY (`muscle_id`) REFERENCES `exercisehub_muscle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_muscleexercise`
--

LOCK TABLES `exercisehub_muscleexercise` WRITE;
/*!40000 ALTER TABLE `exercisehub_muscleexercise` DISABLE KEYS */;
INSERT INTO `exercisehub_muscleexercise` VALUES (1,1,12),(2,1,11),(3,1,2),(4,1,3),(5,2,9),(6,2,10),(7,2,4),(11,4,1),(12,4,2),(13,4,3),(14,4,4),(15,5,8),(16,5,9),(17,5,10),(18,6,12),(19,6,2),(20,6,11),(21,6,3),(22,17,1),(23,16,10),(24,15,13),(25,15,14),(26,19,1),(27,19,14),(28,22,16),(29,23,1),(30,23,13),(31,23,14),(32,21,9),(33,21,10),(34,8,16),(35,8,9),(36,8,15),(37,8,7),(38,9,11),(39,9,6),(40,9,3),(41,10,3),(42,11,16),(43,12,7),(44,12,6),(45,13,11),(46,13,6),(47,13,5),(48,13,9),(49,14,11),(50,20,7),(51,18,5);
/*!40000 ALTER TABLE `exercisehub_muscleexercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_plan`
--

DROP TABLE IF EXISTS `exercisehub_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `weekday_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exercisehub_plan_profile_id_weekday_id_5567bef2_uniq` (`profile_id`,`weekday_id`),
  KEY `exercisehub_plan_profile_id_33d74a49` (`profile_id`),
  KEY `exercisehub_plan_weekday_id_e7ff1574_fk_exercisehub_weekday_id` (`weekday_id`),
  CONSTRAINT `exercisehub_plan_profile_id_33d74a49_fk_exercisehub_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `exercisehub_profile` (`id`),
  CONSTRAINT `exercisehub_plan_weekday_id_e7ff1574_fk_exercisehub_weekday_id` FOREIGN KEY (`weekday_id`) REFERENCES `exercisehub_weekday` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_plan`
--

LOCK TABLES `exercisehub_plan` WRITE;
/*!40000 ALTER TABLE `exercisehub_plan` DISABLE KEYS */;
INSERT INTO `exercisehub_plan` VALUES (11,1,3),(12,5,NULL),(13,5,1),(16,6,NULL),(14,6,1),(15,6,2);
/*!40000 ALTER TABLE `exercisehub_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_profile`
--

DROP TABLE IF EXISTS `exercisehub_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `age` smallint unsigned DEFAULT NULL,
  `start_weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `goal_weight` decimal(5,2) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `weight_now` decimal(5,2) DEFAULT NULL,
  `overall_completion_rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `exercisehub_profile_user_id_11390733_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `exercisehub_profile_chk_1` CHECK ((`age` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_profile`
--

LOCK TABLES `exercisehub_profile` WRITE;
/*!40000 ALTER TABLE `exercisehub_profile` DISABLE KEYS */;
INSERT INTO `exercisehub_profile` VALUES (1,20,85.00,186.00,80.00,1,87.00,100.00),(4,NULL,NULL,NULL,NULL,11,NULL,0.00),(5,NULL,NULL,NULL,NULL,12,NULL,0.00),(6,NULL,NULL,NULL,NULL,13,NULL,44.64);
/*!40000 ALTER TABLE `exercisehub_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_tracking`
--

DROP TABLE IF EXISTS `exercisehub_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_tracking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `completion_percentage` decimal(5,2) NOT NULL,
  `plan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exercisehub_tracking_plan_id_fd435dc4_fk_exercisehub_plan_id` (`plan_id`),
  CONSTRAINT `exercisehub_tracking_plan_id_fd435dc4_fk_exercisehub_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `exercisehub_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_tracking`
--

LOCK TABLES `exercisehub_tracking` WRITE;
/*!40000 ALTER TABLE `exercisehub_tracking` DISABLE KEYS */;
INSERT INTO `exercisehub_tracking` VALUES (23,44.64,14),(24,100.00,11);
/*!40000 ALTER TABLE `exercisehub_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisehub_weekday`
--

DROP TABLE IF EXISTS `exercisehub_weekday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercisehub_weekday` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `weekday` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisehub_weekday`
--

LOCK TABLES `exercisehub_weekday` WRITE;
/*!40000 ALTER TABLE `exercisehub_weekday` DISABLE KEYS */;
INSERT INTO `exercisehub_weekday` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `exercisehub_weekday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-13 13:35:17
