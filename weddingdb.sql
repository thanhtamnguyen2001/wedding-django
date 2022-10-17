-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: weddingdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'customer');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add banner',7,'add_banner'),(26,'Can change banner',7,'change_banner'),(27,'Can delete banner',7,'delete_banner'),(28,'Can view banner',7,'view_banner'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add date of organization',9,'add_dateoforganization'),(34,'Can change date of organization',9,'change_dateoforganization'),(35,'Can delete date of organization',9,'delete_dateoforganization'),(36,'Can view date of organization',9,'view_dateoforganization'),(37,'Can add food',10,'add_food'),(38,'Can change food',10,'change_food'),(39,'Can delete food',10,'delete_food'),(40,'Can view food',10,'view_food'),(41,'Can add hall',11,'add_hall'),(42,'Can change hall',11,'change_hall'),(43,'Can delete hall',11,'delete_hall'),(44,'Can view hall',11,'view_hall'),(45,'Can add menu',12,'add_menu'),(46,'Can change menu',12,'change_menu'),(47,'Can delete menu',12,'delete_menu'),(48,'Can view menu',12,'view_menu'),(49,'Can add regulation',13,'add_regulation'),(50,'Can change regulation',13,'change_regulation'),(51,'Can delete regulation',13,'delete_regulation'),(52,'Can view regulation',13,'view_regulation'),(53,'Can add service',14,'add_service'),(54,'Can change service',14,'change_service'),(55,'Can delete service',14,'delete_service'),(56,'Can view service',14,'view_service'),(57,'Can add customer',15,'add_customer'),(58,'Can change customer',15,'change_customer'),(59,'Can delete customer',15,'delete_customer'),(60,'Can view customer',15,'view_customer'),(61,'Can add hall organize',16,'add_hallorganize'),(62,'Can change hall organize',16,'change_hallorganize'),(63,'Can delete hall organize',16,'delete_hallorganize'),(64,'Can view hall organize',16,'view_hallorganize'),(65,'Can add combo service',17,'add_comboservice'),(66,'Can change combo service',17,'change_comboservice'),(67,'Can delete combo service',17,'delete_comboservice'),(68,'Can view combo service',17,'view_comboservice'),(69,'Can add rating',18,'add_rating'),(70,'Can change rating',18,'change_rating'),(71,'Can delete rating',18,'delete_rating'),(72,'Can view rating',18,'view_rating'),(73,'Can add order',19,'add_order'),(74,'Can change order',19,'change_order'),(75,'Can delete order',19,'delete_order'),(76,'Can view order',19,'view_order'),(77,'Can add comment',20,'add_comment'),(78,'Can change comment',20,'change_comment'),(79,'Can delete comment',20,'delete_comment'),(80,'Can view comment',20,'view_comment'),(81,'Can add application',21,'add_application'),(82,'Can change application',21,'change_application'),(83,'Can delete application',21,'delete_application'),(84,'Can view application',21,'view_application'),(85,'Can add access token',22,'add_accesstoken'),(86,'Can change access token',22,'change_accesstoken'),(87,'Can delete access token',22,'delete_accesstoken'),(88,'Can view access token',22,'view_accesstoken'),(89,'Can add grant',23,'add_grant'),(90,'Can change grant',23,'change_grant'),(91,'Can delete grant',23,'delete_grant'),(92,'Can view grant',23,'view_grant'),(93,'Can add refresh token',24,'add_refreshtoken'),(94,'Can change refresh token',24,'change_refreshtoken'),(95,'Can delete refresh token',24,'delete_refreshtoken'),(96,'Can view refresh token',24,'view_refreshtoken'),(97,'Can add id token',25,'add_idtoken'),(98,'Can change id token',25,'change_idtoken'),(99,'Can delete id token',25,'delete_idtoken'),(100,'Can view id token',25,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_wedding_app_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_wedding_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-09-18 13:20:59.551417','1','Mc',1,'[{\"added\": {}}]',14,1),(2,'2022-09-18 13:21:05.564584','2','wedding',1,'[{\"added\": {}}]',14,1),(3,'2022-09-18 13:21:10.386012','3','sdf',1,'[{\"added\": {}}]',14,1),(4,'2022-09-18 13:21:14.936319','4','321',1,'[{\"added\": {}}]',14,1),(5,'2022-09-18 13:29:30.013914','5','dá',1,'[{\"added\": {}}]',14,1),(6,'2022-09-18 13:30:26.181118','6','123',1,'[{\"added\": {}}]',14,1),(7,'2022-09-18 13:34:44.114428','7','sà',1,'[{\"added\": {}}]',14,1),(8,'2022-09-18 14:04:13.301737','9','fsd',1,'[{\"added\": {}}]',14,1),(9,'2022-09-18 14:14:32.677070','11','3123sdsa',1,'[{\"added\": {}}]',14,1),(10,'2022-09-18 14:22:05.020371','12','fdas',1,'[{\"added\": {}}]',14,1),(11,'2022-09-18 14:24:09.271517','13','2fsda',1,'[{\"added\": {}}]',14,1),(12,'2022-09-18 14:26:49.885808','12','fdas',3,'',14,1),(13,'2022-09-18 14:26:49.890965','11','3123sdsa',3,'',14,1),(14,'2022-09-18 14:26:49.892890','9','fsd',3,'',14,1),(15,'2022-09-18 14:26:49.894800','7','sà',3,'',14,1),(16,'2022-09-18 14:26:49.896480','6','123',3,'',14,1),(17,'2022-09-18 14:26:49.898181','5','dá',3,'',14,1),(18,'2022-09-18 14:26:49.900214','4','321',3,'',14,1),(19,'2022-09-18 14:26:49.901949','3','sdf',3,'',14,1),(20,'2022-09-18 14:26:49.903679','2','wedding',3,'',14,1),(21,'2022-09-18 14:26:49.904847','1','Mc',3,'',14,1),(22,'2022-09-18 14:26:54.703786','13','2fsda',3,'',14,1),(23,'2022-09-18 14:27:13.704583','14','1',1,'[{\"added\": {}}]',14,1),(24,'2022-09-18 14:29:55.634336','15','2',1,'[{\"added\": {}}]',14,1),(25,'2022-09-18 14:34:30.994616','1','customer',1,'[{\"added\": {}}]',3,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(22,'oauth2_provider','accesstoken'),(21,'oauth2_provider','application'),(23,'oauth2_provider','grant'),(25,'oauth2_provider','idtoken'),(24,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(7,'wedding_app','banner'),(8,'wedding_app','category'),(17,'wedding_app','comboservice'),(20,'wedding_app','comment'),(15,'wedding_app','customer'),(9,'wedding_app','dateoforganization'),(10,'wedding_app','food'),(11,'wedding_app','hall'),(16,'wedding_app','hallorganize'),(12,'wedding_app','menu'),(19,'wedding_app','order'),(18,'wedding_app','rating'),(13,'wedding_app','regulation'),(14,'wedding_app','service'),(6,'wedding_app','user');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-09-18 12:59:56.208809'),(2,'contenttypes','0002_remove_content_type_name','2022-09-18 12:59:56.271294'),(3,'auth','0001_initial','2022-09-18 12:59:56.489993'),(4,'auth','0002_alter_permission_name_max_length','2022-09-18 12:59:56.521235'),(5,'auth','0003_alter_user_email_max_length','2022-09-18 12:59:56.521235'),(6,'auth','0004_alter_user_username_opts','2022-09-18 12:59:56.521235'),(7,'auth','0005_alter_user_last_login_null','2022-09-18 12:59:56.536887'),(8,'auth','0006_require_contenttypes_0002','2022-09-18 12:59:56.536887'),(9,'auth','0007_alter_validators_add_error_messages','2022-09-18 12:59:56.536887'),(10,'auth','0008_alter_user_username_max_length','2022-09-18 12:59:56.552477'),(11,'auth','0009_alter_user_last_name_max_length','2022-09-18 12:59:56.552477'),(12,'auth','0010_alter_group_name_max_length','2022-09-18 12:59:56.568132'),(13,'auth','0011_update_proxy_permissions','2022-09-18 12:59:56.568132'),(14,'auth','0012_alter_user_first_name_max_length','2022-09-18 12:59:56.568132'),(15,'wedding_app','0001_initial','2022-09-18 12:59:57.989841'),(16,'admin','0001_initial','2022-09-18 12:59:58.083365'),(17,'admin','0002_logentry_remove_auto_add','2022-09-18 12:59:58.083365'),(18,'admin','0003_logentry_add_action_flag_choices','2022-09-18 12:59:58.099022'),(19,'oauth2_provider','0001_initial','2022-09-18 12:59:58.755081'),(20,'oauth2_provider','0002_auto_20190406_1805','2022-09-18 12:59:58.801983'),(21,'oauth2_provider','0003_auto_20201211_1314','2022-09-18 12:59:58.848809'),(22,'oauth2_provider','0004_auto_20200902_2022','2022-09-18 12:59:59.192477'),(23,'oauth2_provider','0005_auto_20211222_2352','2022-09-18 12:59:59.270614'),(24,'sessions','0001_initial','2022-09-18 12:59:59.301826'),(25,'wedding_app','0002_alter_banner_image_alter_comboservice_image_and_more','2022-09-18 13:28:38.708747'),(26,'wedding_app','0003_alter_service_image','2022-09-18 13:44:39.984736'),(27,'wedding_app','0004_alter_service_image','2022-09-18 13:58:42.948769'),(28,'wedding_app','0005_alter_service_image','2022-09-18 14:03:54.644352'),(29,'wedding_app','0006_alter_banner_image_alter_comboservice_image_and_more','2022-09-18 14:10:16.417986'),(30,'wedding_app','0007_alter_banner_image_alter_comboservice_image_and_more','2022-09-18 14:13:01.648181'),(31,'wedding_app','0008_alter_banner_image_alter_comboservice_image_and_more','2022-09-18 14:26:30.468954'),(32,'wedding_app','0009_alter_banner_image_alter_comboservice_image_and_more','2022-09-18 14:26:30.531414'),(33,'wedding_app','0010_alter_banner_image_alter_comboservice_image_and_more','2022-09-18 14:29:38.157513');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lhhszj0o1uglulf5pq6cv930dr0jbzvv','.eJxVjMsOwiAQRf-FtSFAeQwu3fsNZIaHVA0kpV0Z_12bdKHbe865LxZwW2vYRl7CnNiZSXb63QjjI7cdpDu2W-ext3WZie8KP-jg157y83K4fwcVR_3WqKMlZQtEaxQ6W6Sk4oWXkKjgRM5Mk9CoHEQDJCyQyxGcBi19yQXZ-wPiUjfi:1oZuDl:R3n66al38bDOnvi81EM2_OxA8m1VC7hRKMYd3Ekv0Ko','2022-10-02 13:20:29.286862'),('ypi9xdiabeyfjf8380ihd2banu4io27b','.eJxVjMsOwiAQRf-FtSFAeQwu3fsNZIaHVA0kpV0Z_12bdKHbe865LxZwW2vYRl7CnNiZSXb63QjjI7cdpDu2W-ext3WZie8KP-jg157y83K4fwcVR_3WqKMlZQtEaxQ6W6Sk4oWXkKjgRM5Mk9CoHEQDJCyQyxGcBi19yQXZ-wPiUjfi:1obZJV:sTK-yxZ6n08cjCLGi7iJBAQNhh6rQyaSjItLo7g8-Xg','2022-10-07 03:25:17.965840');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_wedding_a` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_wedding_a` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_wedding_a` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_wedding_a` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_wedding_app_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_wedding_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_wedding_app_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_wedding_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_wedding_a` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_wedding_a` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_banner`
--

DROP TABLE IF EXISTS `wedding_app_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_banner`
--

LOCK TABLES `wedding_app_banner` WRITE;
/*!40000 ALTER TABLE `wedding_app_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_category`
--

DROP TABLE IF EXISTS `wedding_app_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_category`
--

LOCK TABLES `wedding_app_category` WRITE;
/*!40000 ALTER TABLE `wedding_app_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_comboservice`
--

DROP TABLE IF EXISTS `wedding_app_comboservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_comboservice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_comboservice`
--

LOCK TABLES `wedding_app_comboservice` WRITE;
/*!40000 ALTER TABLE `wedding_app_comboservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_comboservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_comboservice_services`
--

DROP TABLE IF EXISTS `wedding_app_comboservice_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_comboservice_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comboservice_id` bigint NOT NULL,
  `service_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_app_comboservice_comboservice_id_service__e4388893_uniq` (`comboservice_id`,`service_id`),
  KEY `wedding_app_comboser_service_id_2a4c950c_fk_wedding_a` (`service_id`),
  CONSTRAINT `wedding_app_comboser_comboservice_id_99e02c22_fk_wedding_a` FOREIGN KEY (`comboservice_id`) REFERENCES `wedding_app_comboservice` (`id`),
  CONSTRAINT `wedding_app_comboser_service_id_2a4c950c_fk_wedding_a` FOREIGN KEY (`service_id`) REFERENCES `wedding_app_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_comboservice_services`
--

LOCK TABLES `wedding_app_comboservice_services` WRITE;
/*!40000 ALTER TABLE `wedding_app_comboservice_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_comboservice_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_comment`
--

DROP TABLE IF EXISTS `wedding_app_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_app_comment_customer_id_4feaf8a6_fk_wedding_a` (`customer_id`),
  CONSTRAINT `wedding_app_comment_customer_id_4feaf8a6_fk_wedding_a` FOREIGN KEY (`customer_id`) REFERENCES `wedding_app_customer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_comment`
--

LOCK TABLES `wedding_app_comment` WRITE;
/*!40000 ALTER TABLE `wedding_app_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_customer`
--

DROP TABLE IF EXISTS `wedding_app_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_customer` (
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `wedding_app_customer_user_id_b9ad8cde_fk_wedding_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_customer`
--

LOCK TABLES `wedding_app_customer` WRITE;
/*!40000 ALTER TABLE `wedding_app_customer` DISABLE KEYS */;
INSERT INTO `wedding_app_customer` VALUES (1,'2022-09-18 14:34:42.188246','2022-09-18 14:34:42.188246',2);
/*!40000 ALTER TABLE `wedding_app_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_dateoforganization`
--

DROP TABLE IF EXISTS `wedding_app_dateoforganization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_dateoforganization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `shift` smallint unsigned NOT NULL,
  `regulation_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_app_dateoforganization_date_shift_66f84092_uniq` (`date`,`shift`),
  KEY `wedding_app_dateofor_regulation_id_ea03b6f7_fk_wedding_a` (`regulation_id`),
  CONSTRAINT `wedding_app_dateofor_regulation_id_ea03b6f7_fk_wedding_a` FOREIGN KEY (`regulation_id`) REFERENCES `wedding_app_regulation` (`id`),
  CONSTRAINT `wedding_app_dateoforganization_chk_1` CHECK ((`shift` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_dateoforganization`
--

LOCK TABLES `wedding_app_dateoforganization` WRITE;
/*!40000 ALTER TABLE `wedding_app_dateoforganization` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_dateoforganization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_food`
--

DROP TABLE IF EXISTS `wedding_app_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_food` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `wedding_app_food_category_id_db1c44b4_fk_wedding_app_category_id` (`category_id`),
  CONSTRAINT `wedding_app_food_category_id_db1c44b4_fk_wedding_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `wedding_app_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_food`
--

LOCK TABLES `wedding_app_food` WRITE;
/*!40000 ALTER TABLE `wedding_app_food` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_hall`
--

DROP TABLE IF EXISTS `wedding_app_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_hall` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `morning_price` double DEFAULT NULL,
  `noon_price` double DEFAULT NULL,
  `night_price` double DEFAULT NULL,
  `free` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_hall`
--

LOCK TABLES `wedding_app_hall` WRITE;
/*!40000 ALTER TABLE `wedding_app_hall` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_hallorganize`
--

DROP TABLE IF EXISTS `wedding_app_hallorganize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_hallorganize` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `hall_id` bigint NOT NULL,
  `time_organize_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_app_hallorganize_hall_id_time_organize_id_1e7e65af_uniq` (`hall_id`,`time_organize_id`),
  KEY `wedding_app_hallorga_time_organize_id_63ef32ec_fk_wedding_a` (`time_organize_id`),
  CONSTRAINT `wedding_app_hallorga_time_organize_id_63ef32ec_fk_wedding_a` FOREIGN KEY (`time_organize_id`) REFERENCES `wedding_app_dateoforganization` (`id`),
  CONSTRAINT `wedding_app_hallorganize_hall_id_ce8ea327_fk_wedding_app_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `wedding_app_hall` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_hallorganize`
--

LOCK TABLES `wedding_app_hallorganize` WRITE;
/*!40000 ALTER TABLE `wedding_app_hallorganize` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_hallorganize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_menu`
--

DROP TABLE IF EXISTS `wedding_app_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_menu`
--

LOCK TABLES `wedding_app_menu` WRITE;
/*!40000 ALTER TABLE `wedding_app_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_menu_foods`
--

DROP TABLE IF EXISTS `wedding_app_menu_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_menu_foods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu_id` bigint NOT NULL,
  `food_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_app_menu_foods_menu_id_food_id_c2a93b06_uniq` (`menu_id`,`food_id`),
  KEY `wedding_app_menu_foods_food_id_f90a116c_fk_wedding_app_food_id` (`food_id`),
  CONSTRAINT `wedding_app_menu_foods_food_id_f90a116c_fk_wedding_app_food_id` FOREIGN KEY (`food_id`) REFERENCES `wedding_app_food` (`id`),
  CONSTRAINT `wedding_app_menu_foods_menu_id_039914a9_fk_wedding_app_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `wedding_app_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_menu_foods`
--

LOCK TABLES `wedding_app_menu_foods` WRITE;
/*!40000 ALTER TABLE `wedding_app_menu_foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_menu_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_order`
--

DROP TABLE IF EXISTS `wedding_app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `number_of_table` int DEFAULT NULL,
  `groom_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bride_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift` smallint unsigned DEFAULT NULL,
  `combo_services_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `hall_id` bigint DEFAULT NULL,
  `menu_id` bigint DEFAULT NULL,
  `time_organize_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_app_order_combo_services_id_f5dc9191_fk_wedding_a` (`combo_services_id`),
  KEY `wedding_app_order_employee_id_6b884e79_fk_wedding_app_user_id` (`employee_id`),
  KEY `wedding_app_order_hall_id_327f0153_fk_wedding_app_hall_id` (`hall_id`),
  KEY `wedding_app_order_menu_id_61716183_fk_wedding_app_menu_id` (`menu_id`),
  KEY `wedding_app_order_time_organize_id_7cfef10e_fk_wedding_a` (`time_organize_id`),
  KEY `wedding_app_order_customer_id_5954dc5d_fk_wedding_a` (`customer_id`),
  CONSTRAINT `wedding_app_order_combo_services_id_f5dc9191_fk_wedding_a` FOREIGN KEY (`combo_services_id`) REFERENCES `wedding_app_comboservice` (`id`),
  CONSTRAINT `wedding_app_order_customer_id_5954dc5d_fk_wedding_a` FOREIGN KEY (`customer_id`) REFERENCES `wedding_app_customer` (`user_id`),
  CONSTRAINT `wedding_app_order_employee_id_6b884e79_fk_wedding_app_user_id` FOREIGN KEY (`employee_id`) REFERENCES `wedding_app_user` (`id`),
  CONSTRAINT `wedding_app_order_hall_id_327f0153_fk_wedding_app_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `wedding_app_hall` (`id`),
  CONSTRAINT `wedding_app_order_menu_id_61716183_fk_wedding_app_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `wedding_app_menu` (`id`),
  CONSTRAINT `wedding_app_order_time_organize_id_7cfef10e_fk_wedding_a` FOREIGN KEY (`time_organize_id`) REFERENCES `wedding_app_dateoforganization` (`id`),
  CONSTRAINT `wedding_app_order_chk_1` CHECK ((`shift` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_order`
--

LOCK TABLES `wedding_app_order` WRITE;
/*!40000 ALTER TABLE `wedding_app_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_rating`
--

DROP TABLE IF EXISTS `wedding_app_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `rate` smallint NOT NULL,
  `hall_id` bigint DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_app_rating_hall_id_a58c67a3_fk_wedding_app_hall_id` (`hall_id`),
  KEY `wedding_app_rating_service_id_84899198_fk_wedding_app_service_id` (`service_id`),
  KEY `wedding_app_rating_customer_id_02e59cc7_fk_wedding_a` (`customer_id`),
  CONSTRAINT `wedding_app_rating_customer_id_02e59cc7_fk_wedding_a` FOREIGN KEY (`customer_id`) REFERENCES `wedding_app_customer` (`user_id`),
  CONSTRAINT `wedding_app_rating_hall_id_a58c67a3_fk_wedding_app_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `wedding_app_hall` (`id`),
  CONSTRAINT `wedding_app_rating_service_id_84899198_fk_wedding_app_service_id` FOREIGN KEY (`service_id`) REFERENCES `wedding_app_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_rating`
--

LOCK TABLES `wedding_app_rating` WRITE;
/*!40000 ALTER TABLE `wedding_app_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_regulation`
--

DROP TABLE IF EXISTS `wedding_app_regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_regulation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `morning_price` double DEFAULT NULL,
  `noon_price` double DEFAULT NULL,
  `night_price` double DEFAULT NULL,
  `weekend_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_regulation`
--

LOCK TABLES `wedding_app_regulation` WRITE;
/*!40000 ALTER TABLE `wedding_app_regulation` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_regulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_service`
--

DROP TABLE IF EXISTS `wedding_app_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_service`
--

LOCK TABLES `wedding_app_service` WRITE;
/*!40000 ALTER TABLE `wedding_app_service` DISABLE KEYS */;
INSERT INTO `wedding_app_service` VALUES (14,1,'2022-09-18 14:27:13.702587','2022-09-18 14:27:13.702587','1',1131,'123','services/2022/09/4-6124_1.jpg'),(15,1,'2022-09-18 14:29:55.633339','2022-09-18 14:29:55.633339','2',213,'dasdf','static/services/2022/09/91.jpg');
/*!40000 ALTER TABLE `wedding_app_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_user`
--

DROP TABLE IF EXISTS `wedding_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_customer` tinyint(1) NOT NULL,
  `is_employee` tinyint(1) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_user`
--

LOCK TABLES `wedding_app_user` WRITE;
/*!40000 ALTER TABLE `wedding_app_user` DISABLE KEYS */;
INSERT INTO `wedding_app_user` VALUES (1,'pbkdf2_sha256$320000$RXxV8CvtKdnaK7hcpxVRyl$s6ub1v2awz/8SUBt3jMjwbWLVRnTaJzoc5UiW+3X0cc=','2022-09-23 03:25:17.960849',1,'admin','','','admin@gmail.com',1,1,'2022-09-18 13:20:22.301108',0,0,''),(2,'pbkdf2_sha256$320000$zJFK3B72TWsUAr8mwz4IPw$cwARR18walgHGG17rS10Hjpkt0HtvDlpAfkz/DYC4hU=',NULL,0,'wrea','afsd','fasd','le@gmail.com',0,1,'2022-09-18 14:34:41.985171',1,0,'static/users/2022/09/91.jpg');
/*!40000 ALTER TABLE `wedding_app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_user_groups`
--

DROP TABLE IF EXISTS `wedding_app_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_app_user_groups_user_id_group_id_9485de33_uniq` (`user_id`,`group_id`),
  KEY `wedding_app_user_groups_group_id_55373b32_fk_auth_group_id` (`group_id`),
  CONSTRAINT `wedding_app_user_groups_group_id_55373b32_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wedding_app_user_groups_user_id_04be2745_fk_wedding_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_user_groups`
--

LOCK TABLES `wedding_app_user_groups` WRITE;
/*!40000 ALTER TABLE `wedding_app_user_groups` DISABLE KEYS */;
INSERT INTO `wedding_app_user_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `wedding_app_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_app_user_user_permissions`
--

DROP TABLE IF EXISTS `wedding_app_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_app_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_app_user_user_pe_user_id_permission_id_3d640498_uniq` (`user_id`,`permission_id`),
  KEY `wedding_app_user_use_permission_id_f843d8d7_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wedding_app_user_use_permission_id_f843d8d7_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `wedding_app_user_use_user_id_13ee2452_fk_wedding_a` FOREIGN KEY (`user_id`) REFERENCES `wedding_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_app_user_user_permissions`
--

LOCK TABLES `wedding_app_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `wedding_app_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_app_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-17 15:39:21
