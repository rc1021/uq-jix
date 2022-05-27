-- MariaDB dump 10.19  Distrib 10.6.8-MariaDB, for Linux (x86_64)
--
-- Host: mariadb    Database: googlesheet
-- ------------------------------------------------------
-- Server version	10.8.3-MariaDB-1:10.8.3+maria~jammy

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (2,0,3,'系統管理','fa-tasks',NULL,NULL,NULL,'2022-05-25 01:08:26'),(3,2,4,'成員列表','fa-users','auth/users',NULL,NULL,'2022-05-25 01:08:26'),(4,2,5,'角色','fa-user','auth/roles',NULL,NULL,'2022-05-25 01:08:26'),(5,2,6,'權限','fa-ban','auth/permissions',NULL,NULL,'2022-05-25 01:08:26'),(6,2,7,'選單','fa-bars','auth/menu',NULL,NULL,'2022-05-25 01:08:26'),(7,2,8,'後台記錄','fa-history','auth/logs',NULL,NULL,'2022-05-25 01:08:26'),(8,0,2,'訂單列表','fa-reorder','/orders','order','2022-05-25 01:08:13','2022-05-25 04:05:25');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin','GET','172.22.0.1','[]','2022-05-18 08:33:26','2022-05-18 08:33:26'),(2,1,'admin','GET','172.22.0.1','[]','2022-05-18 08:33:49','2022-05-18 08:33:49'),(3,1,'admin/auth/setting','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:33:56','2022-05-18 08:33:56'),(4,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:36:02','2022-05-18 08:36:02'),(5,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:36:03','2022-05-18 08:36:03'),(6,1,'admin/auth/setting','PUT','172.22.0.1','{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/login\"}','2022-05-18 08:37:23','2022-05-18 08:37:23'),(7,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:37:23','2022-05-18 08:37:23'),(8,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:37:35','2022-05-18 08:37:35'),(9,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:38:55','2022-05-18 08:38:55'),(10,1,'admin/auth/setting','PUT','172.22.0.1','{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/login\"}','2022-05-18 08:39:00','2022-05-18 08:39:00'),(11,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:39:00','2022-05-18 08:39:00'),(12,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:39:02','2022-05-18 08:39:02'),(13,1,'admin/auth/setting','GET','172.22.0.1','[]','2022-05-18 08:47:30','2022-05-18 08:47:30'),(14,1,'admin/auth/roles','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:48:10','2022-05-18 08:48:10'),(15,1,'admin/auth/roles/create','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:51:06','2022-05-18 08:51:06'),(16,1,'admin','GET','172.22.0.1','[]','2022-05-18 08:52:02','2022-05-18 08:52:02'),(17,1,'admin/auth/permissions','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:52:10','2022-05-18 08:52:10'),(18,1,'admin/auth/roles','POST','172.22.0.1','{\"slug\":\"member\",\"name\":\"\\u6210\\u54e1\",\"permissions\":[\"2\",\"3\",\"4\",null],\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/roles\"}','2022-05-18 08:52:40','2022-05-18 08:52:40'),(19,1,'admin/auth/roles','GET','172.22.0.1','[]','2022-05-18 08:52:41','2022-05-18 08:52:41'),(20,1,'admin/auth/menu','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:52:53','2022-05-18 08:52:53'),(21,1,'admin/auth/menu/2/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:52:57','2022-05-18 08:52:57'),(22,1,'admin/auth/menu/2','PUT','172.22.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7d71\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-18 08:53:06','2022-05-18 08:53:06'),(23,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:53:06','2022-05-18 08:53:06'),(24,1,'admin/auth/menu/3/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:53:09','2022-05-18 08:53:09'),(25,1,'admin/auth/menu/3','PUT','172.22.0.1','{\"parent_id\":\"2\",\"title\":\"\\u6210\\u54e1\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-18 08:53:18','2022-05-18 08:53:18'),(26,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:53:18','2022-05-18 08:53:18'),(27,1,'admin/auth/menu/4/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:53:23','2022-05-18 08:53:23'),(28,1,'admin/auth/menu/4','PUT','172.22.0.1','{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-18 08:53:27','2022-05-18 08:53:27'),(29,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:53:27','2022-05-18 08:53:27'),(30,1,'admin/auth/menu/5/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:53:29','2022-05-18 08:53:29'),(31,1,'admin/auth/menu/5','PUT','172.22.0.1','{\"parent_id\":\"2\",\"title\":\"\\u6b0a\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-18 08:53:34','2022-05-18 08:53:34'),(32,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:53:34','2022-05-18 08:53:34'),(33,1,'admin/auth/menu/6/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:53:36','2022-05-18 08:53:36'),(34,1,'admin/auth/menu/6','PUT','172.22.0.1','{\"parent_id\":\"2\",\"title\":\"\\u9078\\u55ae\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-18 08:53:42','2022-05-18 08:53:42'),(35,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:53:42','2022-05-18 08:53:42'),(36,1,'admin/auth/menu/7/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:53:45','2022-05-18 08:53:45'),(37,1,'admin/auth/menu/7','PUT','172.22.0.1','{\"parent_id\":\"2\",\"title\":\"\\u5f8c\\u53f0\\u8a18\\u9304\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-18 08:53:51','2022-05-18 08:53:51'),(38,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:53:51','2022-05-18 08:53:51'),(39,1,'admin/auth/menu/1/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:53:54','2022-05-18 08:53:54'),(40,1,'admin/auth/menu/1','PUT','172.22.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5100\\u8868\\u677f\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-18 08:54:08','2022-05-18 08:54:08'),(41,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:54:08','2022-05-18 08:54:08'),(42,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-18 08:54:11','2022-05-18 08:54:11'),(43,1,'admin/auth/users','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:54:51','2022-05-18 08:54:51'),(44,1,'admin/auth/users/create','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:54:52','2022-05-18 08:54:52'),(45,1,'admin/auth/users','POST','172.22.0.1','{\"username\":\"bliaou\",\"name\":\"bliaou\",\"password\":\"bliaou\",\"password_confirmation\":\"bliaou\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/users\"}','2022-05-18 08:55:06','2022-05-18 08:55:06'),(46,1,'admin/auth/users','GET','172.22.0.1','[]','2022-05-18 08:55:07','2022-05-18 08:55:07'),(47,1,'admin/auth/roles','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:55:35','2022-05-18 08:55:35'),(48,1,'admin/auth/permissions','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:55:37','2022-05-18 08:55:37'),(49,1,'admin/auth/menu','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-18 08:55:38','2022-05-18 08:55:38'),(50,1,'admin','GET','172.19.0.1','[]','2022-05-22 11:58:54','2022-05-22 11:58:54'),(51,1,'admin','GET','172.19.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-22 11:59:02','2022-05-22 11:59:02'),(52,1,'admin/auth/users','GET','172.19.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-22 11:59:29','2022-05-22 11:59:29'),(53,1,'admin','GET','172.22.0.1','[]','2022-05-25 00:44:36','2022-05-25 00:44:36'),(54,1,'admin/auth/menu','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:07:35','2022-05-25 01:07:35'),(55,1,'admin/auth/menu','POST','172.22.0.1','{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":null,\"roles\":[\"2\",null],\"permission\":\"*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\"}','2022-05-25 01:08:13','2022-05-25 01:08:13'),(56,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-25 01:08:13','2022-05-25 01:08:13'),(57,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-25 01:08:21','2022-05-25 01:08:21'),(58,1,'admin/auth/menu','POST','172.22.0.1','{\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2022-05-25 01:08:26','2022-05-25 01:08:26'),(59,1,'admin/auth/menu','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:08:26','2022-05-25 01:08:26'),(60,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-25 01:08:28','2022-05-25 01:08:28'),(61,1,'admin','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:08:30','2022-05-25 01:08:30'),(62,1,'admin','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:08:34','2022-05-25 01:08:34'),(63,1,'admin/auth/permissions','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:08:42','2022-05-25 01:08:42'),(64,1,'admin/auth/permissions/create','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:09:01','2022-05-25 01:09:01'),(65,1,'admin/auth/permissions','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:09:03','2022-05-25 01:09:03'),(66,1,'admin/auth/permissions/create','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:09:08','2022-05-25 01:09:08'),(67,1,'admin/auth/permissions','POST','172.22.0.1','{\"slug\":\"order\",\"name\":\"order\",\"http_method\":[null],\"http_path\":\"orders\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\"}','2022-05-25 01:09:35','2022-05-25 01:09:35'),(68,1,'admin/auth/permissions','GET','172.22.0.1','[]','2022-05-25 01:09:35','2022-05-25 01:09:35'),(69,1,'admin/auth/permissions/6/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:09:45','2022-05-25 01:09:45'),(70,1,'admin/auth/permissions/6','PUT','172.22.0.1','{\"slug\":\"order\",\"name\":\"order\",\"http_method\":[null],\"http_path\":\"\\/orders*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/permissions\"}','2022-05-25 01:09:53','2022-05-25 01:09:53'),(71,1,'admin/auth/permissions','GET','172.22.0.1','[]','2022-05-25 01:09:53','2022-05-25 01:09:53'),(72,1,'admin','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:09:57','2022-05-25 01:09:57'),(73,1,'admin/auth/menu','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:10:04','2022-05-25 01:10:04'),(74,1,'admin/auth/menu/8/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:10:07','2022-05-25 01:10:07'),(75,1,'admin/auth/menu/8','PUT','172.22.0.1','{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":\"orders\",\"roles\":[\"2\",null],\"permission\":\"*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-25 01:10:13','2022-05-25 01:10:13'),(76,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-25 01:10:14','2022-05-25 01:10:14'),(77,1,'admin','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:10:16','2022-05-25 01:10:16'),(78,1,'admin','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:10:19','2022-05-25 01:10:19'),(79,1,'admin/auth/menu','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:10:24','2022-05-25 01:10:24'),(80,1,'admin/auth/menu/8/edit','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:10:27','2022-05-25 01:10:27'),(81,1,'admin/auth/menu/8','PUT','172.22.0.1','{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":\"\\/orders\",\"roles\":[\"2\",null],\"permission\":\"*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}','2022-05-25 01:10:31','2022-05-25 01:10:31'),(82,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-25 01:10:31','2022-05-25 01:10:31'),(83,1,'admin/auth/menu','GET','172.22.0.1','[]','2022-05-25 01:10:36','2022-05-25 01:10:36'),(84,1,'admin/orders','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 01:10:39','2022-05-25 01:10:39'),(85,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:15:09','2022-05-25 01:15:09'),(86,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:32:33','2022-05-25 01:32:33'),(87,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:33:42','2022-05-25 01:33:42'),(88,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:33:48','2022-05-25 01:33:48'),(89,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:34:08','2022-05-25 01:34:08'),(90,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:35:34','2022-05-25 01:35:34'),(91,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:35:56','2022-05-25 01:35:56'),(92,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:36:35','2022-05-25 01:36:35'),(93,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:36:55','2022-05-25 01:36:55'),(94,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:37:29','2022-05-25 01:37:29'),(95,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:38:12','2022-05-25 01:38:12'),(96,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 01:39:00','2022-05-25 01:39:00'),(97,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:00:24','2022-05-25 02:00:24'),(98,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:00:42','2022-05-25 02:00:42'),(99,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:00:57','2022-05-25 02:00:57'),(100,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:01:04','2022-05-25 02:01:04'),(101,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:01:16','2022-05-25 02:01:16'),(102,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:01:28','2022-05-25 02:01:28'),(103,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:02:03','2022-05-25 02:02:03'),(104,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:02:25','2022-05-25 02:02:25'),(105,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:05:19','2022-05-25 02:05:19'),(106,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:06:16','2022-05-25 02:06:16'),(107,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:06:46','2022-05-25 02:06:46'),(108,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:11:11','2022-05-25 02:11:11'),(109,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:11:41','2022-05-25 02:11:41'),(110,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:12:04','2022-05-25 02:12:04'),(111,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:12:34','2022-05-25 02:12:34'),(112,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:12:50','2022-05-25 02:12:50'),(113,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:13:19','2022-05-25 02:13:19'),(114,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:16:48','2022-05-25 02:16:48'),(115,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:17:22','2022-05-25 02:17:22'),(116,1,'admin/orders','GET','172.22.0.1','{\"_export_\":\"all\"}','2022-05-25 02:17:28','2022-05-25 02:17:28'),(117,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:18:31','2022-05-25 02:18:31'),(118,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:19:03','2022-05-25 02:19:03'),(119,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:19:34','2022-05-25 02:19:34'),(120,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:19:55','2022-05-25 02:19:55'),(121,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:20:25','2022-05-25 02:20:25'),(122,1,'admin','GET','172.22.0.1','[]','2022-05-25 02:51:46','2022-05-25 02:51:46'),(123,1,'admin/orders','GET','172.22.0.1','{\"_pjax\":\"#pjax-container\"}','2022-05-25 02:51:50','2022-05-25 02:51:50'),(124,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:52:47','2022-05-25 02:52:47'),(125,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:54:17','2022-05-25 02:54:17'),(126,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:54:31','2022-05-25 02:54:31'),(127,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:55:17','2022-05-25 02:55:17'),(128,1,'admin/orders','GET','172.22.0.1','[]','2022-05-25 02:58:33','2022-05-25 02:58:33'),(129,1,'admin','GET','180.177.28.147','[]','2022-05-25 04:01:48','2022-05-25 04:01:48'),(130,1,'admin/auth/setting','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:01:56','2022-05-25 04:01:56'),(131,1,'admin/auth/setting','PUT','180.177.28.147','{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"iXa2nuHsy5UudQbOveClARrKaAgamj8r74E3WUxE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\"}','2022-05-25 04:02:01','2022-05-25 04:02:01'),(132,1,'admin/auth/setting','GET','180.177.28.147','[]','2022-05-25 04:02:01','2022-05-25 04:02:01'),(133,1,'admin/auth/setting','GET','180.177.28.147','[]','2022-05-25 04:02:08','2022-05-25 04:02:08'),(134,1,'admin','GET','180.177.28.147','[]','2022-05-25 04:02:21','2022-05-25 04:02:21'),(135,1,'admin/auth/setting','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:02:28','2022-05-25 04:02:28'),(136,1,'admin/auth/users','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:02:46','2022-05-25 04:02:46'),(137,1,'admin/auth/users/create','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:02:48','2022-05-25 04:02:48'),(138,1,'admin/auth/users','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:02:50','2022-05-25 04:02:50'),(139,1,'admin/auth/users/2/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:02:54','2022-05-25 04:02:54'),(140,1,'admin/auth/roles','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:02:57','2022-05-25 04:02:57'),(141,1,'admin/auth/roles/2/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:03:03','2022-05-25 04:03:03'),(142,1,'admin/auth/roles/2','PUT','180.177.28.147','{\"slug\":\"member\",\"name\":\"\\u6210\\u54e1\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"miSk64icgEkzD6xGRVySsd812nx6BhBQzsYL7mvA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/roles\"}','2022-05-25 04:03:07','2022-05-25 04:03:07'),(143,1,'admin/auth/roles','GET','180.177.28.147','[]','2022-05-25 04:03:08','2022-05-25 04:03:08'),(144,1,'admin/auth/users','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:03:14','2022-05-25 04:03:14'),(145,1,'admin/auth/users/2/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:03:19','2022-05-25 04:03:19'),(146,1,'admin/auth/users/2','PUT','180.177.28.147','{\"username\":\"bliaou\",\"name\":\"bliaou\",\"password\":\"$2y$10$.iBDogVPdiJCn\\/uXG.2kiud\\/2oAJPZYb\\/4.7G0JyYm1wqe4RlEPHy\",\"password_confirmation\":\"$2y$10$.iBDogVPdiJCn\\/uXG.2kiud\\/2oAJPZYb\\/4.7G0JyYm1wqe4RlEPHy\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"miSk64icgEkzD6xGRVySsd812nx6BhBQzsYL7mvA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/users\"}','2022-05-25 04:03:28','2022-05-25 04:03:28'),(147,1,'admin/auth/users','GET','180.177.28.147','[]','2022-05-25 04:03:29','2022-05-25 04:03:29'),(148,1,'admin/auth/users/create','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:03:33','2022-05-25 04:03:33'),(149,1,'admin/auth/users','POST','180.177.28.147','{\"username\":\"user1\",\"name\":\"user1\",\"password\":\"user1\",\"password_confirmation\":\"user1\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"miSk64icgEkzD6xGRVySsd812nx6BhBQzsYL7mvA\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/users\"}','2022-05-25 04:03:46','2022-05-25 04:03:46'),(150,1,'admin/auth/users','GET','180.177.28.147','[]','2022-05-25 04:03:47','2022-05-25 04:03:47'),(151,1,'admin/auth/logout','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:03:53','2022-05-25 04:03:53'),(152,3,'admin','GET','180.177.28.147','[]','2022-05-25 04:03:58','2022-05-25 04:03:58'),(153,3,'admin/auth/logout','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:05','2022-05-25 04:04:05'),(154,1,'admin','GET','180.177.28.147','[]','2022-05-25 04:04:16','2022-05-25 04:04:16'),(155,1,'admin/auth/roles','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:22','2022-05-25 04:04:22'),(156,1,'admin/auth/menu','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:28','2022-05-25 04:04:28'),(157,1,'admin/auth/menu/8/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:32','2022-05-25 04:04:32'),(158,1,'admin/auth/menu','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:39','2022-05-25 04:04:39'),(159,1,'admin/auth/menu/8/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:44','2022-05-25 04:04:44'),(160,1,'admin/auth/menu','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:47','2022-05-25 04:04:47'),(161,1,'admin/auth/permissions','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:04:56','2022-05-25 04:04:56'),(162,1,'admin/auth/menu','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:05:09','2022-05-25 04:05:09'),(163,1,'admin/auth/menu/8/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:05:14','2022-05-25 04:05:14'),(164,1,'admin/auth/menu/8','PUT','180.177.28.147','{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":\"\\/orders\",\"roles\":[\"2\",null],\"permission\":\"order\",\"_token\":\"ZD1zbzOGbdClMealuVwFS4bCt9W8BEF9CuY6GUqa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/menu\"}','2022-05-25 04:05:25','2022-05-25 04:05:25'),(165,1,'admin/auth/menu','GET','180.177.28.147','[]','2022-05-25 04:05:25','2022-05-25 04:05:25'),(166,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:05:30','2022-05-25 04:05:30'),(167,1,'admin/auth/setting','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:05:51','2022-05-25 04:05:51'),(168,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:05:53','2022-05-25 04:05:53'),(169,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:06:03','2022-05-25 04:06:03'),(170,1,'admin/auth/users','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:06:12','2022-05-25 04:06:12'),(171,1,'admin/auth/users/2/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:06:16','2022-05-25 04:06:16'),(172,1,'admin/auth/users/2','PUT','180.177.28.147','{\"username\":\"bliaou\",\"name\":\"bliaou\",\"password\":\"bliaou\",\"password_confirmation\":\"bliaou\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"ZD1zbzOGbdClMealuVwFS4bCt9W8BEF9CuY6GUqa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/users\"}','2022-05-25 04:06:27','2022-05-25 04:06:27'),(173,1,'admin/auth/users','GET','180.177.28.147','[]','2022-05-25 04:06:27','2022-05-25 04:06:27'),(174,1,'admin/auth/logout','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:06:34','2022-05-25 04:06:34'),(175,3,'admin','GET','180.177.28.147','[]','2022-05-25 04:06:41','2022-05-25 04:06:41'),(176,3,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:06:45','2022-05-25 04:06:45'),(177,3,'admin/orders','GET','180.177.28.147','[]','2022-05-25 04:07:20','2022-05-25 04:07:20'),(178,3,'admin/orders','GET','180.177.28.147','[]','2022-05-25 04:08:50','2022-05-25 04:08:50'),(179,3,'admin/orders','GET','180.177.28.147','[]','2022-05-25 04:10:33','2022-05-25 04:10:33'),(180,3,'admin','GET','180.177.28.147','[]','2022-05-25 04:12:54','2022-05-25 04:12:54'),(181,3,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:12:58','2022-05-25 04:12:58'),(182,3,'admin/auth/logout','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:13:14','2022-05-25 04:13:14'),(183,1,'admin','GET','180.177.28.147','[]','2022-05-25 04:13:20','2022-05-25 04:13:20'),(184,1,'admin/auth/roles','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:14:26','2022-05-25 04:14:26'),(185,1,'admin/auth/users','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:14:27','2022-05-25 04:14:27'),(186,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 04:15:37','2022-05-25 04:15:37'),(187,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 04:18:21','2022-05-25 04:18:21'),(188,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 04:23:39','2022-05-25 04:23:39'),(189,1,'admin','GET','180.177.28.147','[]','2022-05-25 05:03:24','2022-05-25 05:03:24'),(190,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 05:03:28','2022-05-25 05:03:28'),(191,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 05:11:17','2022-05-25 05:11:17'),(192,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 05:14:47','2022-05-25 05:14:47'),(193,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 05:15:58','2022-05-25 05:15:58'),(194,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 05:17:58','2022-05-25 05:17:58'),(195,2,'admin','GET','118.165.137.208','[]','2022-05-25 09:47:13','2022-05-25 09:47:13'),(196,2,'admin','GET','118.165.137.208','{\"_pjax\":\"#pjax-container\"}','2022-05-25 09:47:19','2022-05-25 09:47:19'),(197,2,'admin/orders','GET','118.165.137.208','{\"_pjax\":\"#pjax-container\"}','2022-05-25 09:47:21','2022-05-25 09:47:21'),(198,2,'admin/orders','GET','118.165.137.208','{\"_pjax\":\"#pjax-container\"}','2022-05-25 09:47:42','2022-05-25 09:47:42'),(199,2,'admin/auth/roles','GET','118.165.137.208','{\"_pjax\":\"#pjax-container\"}','2022-05-25 09:48:16','2022-05-25 09:48:16'),(200,2,'admin','GET','118.165.137.208','{\"_pjax\":\"#pjax-container\"}','2022-05-25 09:48:28','2022-05-25 09:48:28'),(201,2,'admin/orders','GET','118.165.137.208','{\"_pjax\":\"#pjax-container\"}','2022-05-25 09:48:28','2022-05-25 09:48:28'),(202,2,'admin/orders','GET','122.116.144.195','[]','2022-05-25 12:01:51','2022-05-25 12:01:51'),(203,2,'admin/orders','GET','122.116.144.195','[]','2022-05-25 12:05:29','2022-05-25 12:05:29'),(204,2,'admin/orders','GET','122.116.144.195','[]','2022-05-25 12:22:35','2022-05-25 12:22:35'),(205,2,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:48:01','2022-05-25 12:48:01'),(206,2,'admin/auth/logout','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:48:08','2022-05-25 12:48:08'),(207,3,'admin','GET','122.116.144.195','[]','2022-05-25 12:48:22','2022-05-25 12:48:22'),(208,3,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:48:27','2022-05-25 12:48:27'),(209,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:48:28','2022-05-25 12:48:28'),(210,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}','2022-05-25 12:48:54','2022-05-25 12:48:54'),(211,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\",\"per_page\":\"50\"}','2022-05-25 12:48:57','2022-05-25 12:48:57'),(212,3,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:49:08','2022-05-25 12:49:08'),(213,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:49:10','2022-05-25 12:49:10'),(214,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:49:15','2022-05-25 12:49:15'),(215,3,'admin/auth/setting','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:49:36','2022-05-25 12:49:36'),(216,3,'admin/auth/setting','PUT','122.116.144.195','{\"name\":\"user1\",\"password\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"password_confirmation\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"_token\":\"zzF2s9Zmbqn0jtOMuqcfYSLtOQIlEGWjoZjvYFeW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/orders\"}','2022-05-25 12:50:03','2022-05-25 12:50:03'),(217,3,'admin/auth/setting','GET','122.116.144.195','[]','2022-05-25 12:50:04','2022-05-25 12:50:04'),(218,3,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:50:09','2022-05-25 12:50:09'),(219,3,'admin','GET','122.116.144.195','[]','2022-05-25 12:50:11','2022-05-25 12:50:11'),(220,3,'admin/auth/logout','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:50:25','2022-05-25 12:50:25'),(221,2,'admin','GET','122.116.144.195','[]','2022-05-25 12:50:30','2022-05-25 12:50:30'),(222,2,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 12:50:35','2022-05-25 12:50:35'),(223,2,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 13:10:40','2022-05-25 13:10:40'),(224,2,'admin/auth/logout','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 13:10:46','2022-05-25 13:10:46'),(225,3,'admin','GET','122.116.144.195','[]','2022-05-25 13:11:00','2022-05-25 13:11:00'),(226,3,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 13:11:02','2022-05-25 13:11:02'),(227,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 13:11:03','2022-05-25 13:11:03'),(228,1,'admin','GET','180.177.28.147','[]','2022-05-25 13:26:43','2022-05-25 13:26:43'),(229,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 13:26:47','2022-05-25 13:26:47'),(230,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 13:36:41','2022-05-25 13:36:41'),(231,1,'admin','GET','180.177.28.147','[]','2022-05-25 14:00:06','2022-05-25 14:00:06'),(232,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 14:00:09','2022-05-25 14:00:09'),(233,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\",\"order_number\":\"2096\",\"name\":null,\"phone\":null,\"email\":null}','2022-05-25 14:01:38','2022-05-25 14:01:38'),(234,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 14:01:39','2022-05-25 14:01:39'),(235,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 14:03:42','2022-05-25 14:03:42'),(236,3,'admin','GET','1.200.246.94','[]','2022-05-25 19:04:46','2022-05-25 19:04:46'),(237,3,'admin/orders','GET','1.200.246.94','{\"_pjax\":\"#pjax-container\"}','2022-05-25 19:04:53','2022-05-25 19:04:53'),(238,3,'admin/orders','GET','1.200.246.94','{\"_pjax\":\"#pjax-container\"}','2022-05-25 19:04:56','2022-05-25 19:04:56'),(239,3,'admin/orders','GET','1.200.246.94','{\"_pjax\":\"#pjax-container\"}','2022-05-25 19:04:57','2022-05-25 19:04:57'),(240,3,'admin/orders','GET','1.200.246.94','{\"_pjax\":\"#pjax-container\"}','2022-05-25 19:06:46','2022-05-25 19:06:46'),(241,3,'admin/orders','GET','1.200.246.94','{\"_pjax\":\"#pjax-container\"}','2022-05-25 19:07:02','2022-05-25 19:07:02'),(242,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 19:08:28','2022-05-25 19:08:28'),(243,3,'admin/auth/logout','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 19:10:02','2022-05-25 19:10:02'),(244,2,'admin','GET','122.116.144.195','[]','2022-05-25 19:10:06','2022-05-25 19:10:06'),(245,2,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 19:10:11','2022-05-25 19:10:11'),(246,3,'admin','GET','114.136.106.224','[]','2022-05-25 20:33:17','2022-05-25 20:33:17'),(247,3,'admin','GET','114.136.106.224','{\"_pjax\":\"#pjax-container\"}','2022-05-25 20:33:27','2022-05-25 20:33:27'),(248,3,'admin','GET','114.136.106.224','{\"_pjax\":\"#pjax-container\"}','2022-05-25 20:33:31','2022-05-25 20:33:31'),(249,3,'admin/orders','GET','114.136.106.224','{\"_pjax\":\"#pjax-container\"}','2022-05-25 20:33:35','2022-05-25 20:33:35'),(250,1,'admin','GET','180.177.28.147','[]','2022-05-25 21:07:48','2022-05-25 21:07:48'),(251,1,'admin/auth/setting','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:07:53','2022-05-25 21:07:53'),(252,1,'admin/auth/setting','PUT','180.177.28.147','{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"zIRJPeuOaD9a2Jjmx0RU35pqYM6x2XUF1xgf8cf8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\"}','2022-05-25 21:08:10','2022-05-25 21:08:10'),(253,1,'admin/auth/setting','GET','180.177.28.147','[]','2022-05-25 21:08:10','2022-05-25 21:08:10'),(254,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:08:15','2022-05-25 21:08:15'),(255,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 21:11:30','2022-05-25 21:11:30'),(256,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 21:11:35','2022-05-25 21:11:35'),(257,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 21:16:07','2022-05-25 21:16:07'),(258,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 21:21:15','2022-05-25 21:21:15'),(259,1,'admin/auth/setting','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:21:18','2022-05-25 21:21:18'),(260,1,'admin/auth/setting','PUT','180.177.28.147','{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"FOBCkgvg7AafZkZtokg5xHhvwL5mJvCdYKtHCdJ5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/orders\"}','2022-05-25 21:21:28','2022-05-25 21:21:28'),(261,1,'admin/auth/setting','GET','180.177.28.147','[]','2022-05-25 21:21:28','2022-05-25 21:21:28'),(262,1,'admin/auth/setting','GET','180.177.28.147','[]','2022-05-25 21:21:30','2022-05-25 21:21:30'),(263,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:22:21','2022-05-25 21:22:21'),(264,2,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:22:26','2022-05-25 21:22:26'),(265,2,'admin/auth/logout','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:22:30','2022-05-25 21:22:30'),(266,3,'admin','GET','122.116.144.195','[]','2022-05-25 21:22:42','2022-05-25 21:22:42'),(267,3,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:22:46','2022-05-25 21:22:46'),(268,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:22:47','2022-05-25 21:22:47'),(269,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:22:53','2022-05-25 21:22:53'),(270,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:23:49','2022-05-25 21:23:49'),(271,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:23:49','2022-05-25 21:23:49'),(272,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:23:50','2022-05-25 21:23:50'),(273,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:23:51','2022-05-25 21:23:51'),(274,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:23:52','2022-05-25 21:23:52'),(275,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:23:53','2022-05-25 21:23:53'),(276,3,'admin/orders','GET','122.116.144.195','[]','2022-05-25 21:23:54','2022-05-25 21:23:54'),(277,3,'admin/auth/setting','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:24:19','2022-05-25 21:24:19'),(278,3,'admin/auth/setting','PUT','122.116.144.195','{\"name\":\"user1\",\"password\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"password_confirmation\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"_token\":\"nfmMT7RFlFnPGjoIQCYrG4Bv20PDhiLlG4hO1JLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/orders\"}','2022-05-25 21:24:34','2022-05-25 21:24:34'),(279,3,'admin/auth/setting','GET','122.116.144.195','[]','2022-05-25 21:24:34','2022-05-25 21:24:34'),(280,3,'admin/auth/setting','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:24:41','2022-05-25 21:24:41'),(281,3,'admin/auth/setting','GET','122.116.144.195','[]','2022-05-25 21:24:43','2022-05-25 21:24:43'),(282,3,'admin','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:25:18','2022-05-25 21:25:18'),(283,3,'admin/orders','GET','122.116.144.195','{\"_pjax\":\"#pjax-container\"}','2022-05-25 21:25:20','2022-05-25 21:25:20'),(284,1,'admin/orders','GET','180.177.28.147','[]','2022-05-25 21:41:24','2022-05-25 21:41:24'),(285,3,'admin','GET','123.194.169.181','[]','2022-05-26 01:19:42','2022-05-26 01:19:42'),(286,3,'admin/orders','GET','123.194.169.181','{\"_pjax\":\"#pjax-container\"}','2022-05-26 01:19:59','2022-05-26 01:19:59'),(287,3,'admin/orders','GET','111.241.5.142','[]','2022-05-26 10:10:30','2022-05-26 10:10:30'),(288,3,'admin/orders','GET','111.241.5.142','{\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}','2022-05-26 10:10:45','2022-05-26 10:10:45'),(289,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 11:39:29','2022-05-26 11:39:29'),(290,3,'admin/orders','GET','114.136.106.224','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-26 11:40:21','2022-05-26 11:40:21'),(291,3,'admin','GET','101.12.101.20','[]','2022-05-26 11:41:46','2022-05-26 11:41:46'),(292,3,'admin/orders','GET','101.12.101.20','{\"_pjax\":\"#pjax-container\"}','2022-05-26 11:41:58','2022-05-26 11:41:58'),(293,3,'admin/orders','GET','101.12.101.20','{\"_pjax\":\"#pjax-container\"}','2022-05-26 11:41:59','2022-05-26 11:41:59'),(294,3,'admin','GET','111.235.229.239','[]','2022-05-26 11:42:01','2022-05-26 11:42:01'),(295,3,'admin/orders','GET','101.12.101.20','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2022-05-26 11:42:21','2022-05-26 11:42:21'),(296,3,'admin/orders','GET','111.235.229.239','[]','2022-05-26 11:44:38','2022-05-26 11:44:38'),(297,3,'admin/orders','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 11:44:46','2022-05-26 11:44:46'),(298,3,'admin/orders','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 11:44:47','2022-05-26 11:44:47'),(299,3,'admin','GET','111.235.229.239','[]','2022-05-26 11:45:48','2022-05-26 11:45:48'),(300,3,'admin/orders','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 11:46:02','2022-05-26 11:46:02'),(301,3,'admin/orders','GET','111.235.229.239','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-26 11:50:33','2022-05-26 11:50:33'),(302,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 11:56:07','2022-05-26 11:56:07'),(303,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 11:57:07','2022-05-26 11:57:07'),(304,3,'admin/orders','GET','111.235.229.239','{\"page\":\"2\"}','2022-05-26 11:59:00','2022-05-26 11:59:00'),(305,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 12:01:36','2022-05-26 12:01:36'),(306,3,'admin/orders','GET','114.136.106.224','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-26 12:01:45','2022-05-26 12:01:45'),(307,3,'admin','GET','111.235.229.239','[]','2022-05-26 12:03:41','2022-05-26 12:03:41'),(308,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 12:03:44','2022-05-26 12:03:44'),(309,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 12:03:45','2022-05-26 12:03:45'),(310,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 12:03:47','2022-05-26 12:03:47'),(311,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 12:04:01','2022-05-26 12:04:01'),(312,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 13:41:45','2022-05-26 13:41:45'),(313,1,'admin','GET','180.177.28.147','[]','2022-05-26 15:00:03','2022-05-26 15:00:03'),(314,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:00:07','2022-05-26 15:00:07'),(315,3,'admin/orders','GET','111.241.5.142','[]','2022-05-26 15:00:51','2022-05-26 15:00:51'),(316,3,'admin','GET','1.200.246.94','[]','2022-05-26 15:04:23','2022-05-26 15:04:23'),(317,3,'admin/orders','GET','1.200.246.94','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:04:29','2022-05-26 15:04:29'),(318,3,'admin/orders','GET','111.235.229.239','[]','2022-05-26 15:11:20','2022-05-26 15:11:20'),(319,3,'admin/orders','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:11:30','2022-05-26 15:11:30'),(320,3,'admin','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:15:40','2022-05-26 15:15:40'),(321,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:15:42','2022-05-26 15:15:42'),(322,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:15:44','2022-05-26 15:15:44'),(323,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2022-05-26 15:15:54','2022-05-26 15:15:54'),(324,3,'admin','GET','1.200.246.94','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:16:04','2022-05-26 15:16:04'),(325,3,'admin/auth/login','GET','1.200.246.94','[]','2022-05-26 15:16:05','2022-05-26 15:16:05'),(326,3,'admin/orders','GET','60.251.183.118','{\"page\":\"2\"}','2022-05-26 15:16:14','2022-05-26 15:16:14'),(327,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:16:31','2022-05-26 15:16:31'),(328,3,'admin/orders','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:16:34','2022-05-26 15:16:34'),(329,3,'admin/orders','GET','60.251.183.118','{\"page\":\"2\"}','2022-05-26 15:16:36','2022-05-26 15:16:36'),(330,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:16:55','2022-05-26 15:16:55'),(331,3,'admin/orders','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:17:00','2022-05-26 15:17:00'),(332,3,'admin','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:17:48','2022-05-26 15:17:48'),(333,3,'admin/orders','GET','111.235.229.239','{\"_pjax\":\"#pjax-container\"}','2022-05-26 15:17:50','2022-05-26 15:17:50'),(334,3,'admin/orders','GET','111.235.229.239','{\"_columns_\":\"address,allprice,created_at,delivery_fee,email,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\"}','2022-05-26 15:18:02','2022-05-26 15:18:02'),(335,3,'admin/orders','GET','111.235.229.239','{\"_columns_\":\"address,allprice,created_at,delivery_fee,email,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2022-05-26 15:18:11','2022-05-26 15:18:11'),(336,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 15:42:53','2022-05-26 15:42:53'),(337,3,'admin/orders','GET','60.251.183.118','[]','2022-05-26 15:56:34','2022-05-26 15:56:34'),(338,3,'admin/orders','GET','60.251.183.118','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-26 15:56:39','2022-05-26 15:56:39'),(339,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 16:00:13','2022-05-26 16:00:13'),(340,3,'admin/orders','GET','114.136.106.224','{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}','2022-05-26 16:00:18','2022-05-26 16:00:18'),(341,3,'admin/orders','GET','111.241.5.142','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-26 16:00:31','2022-05-26 16:00:31'),(342,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2022-05-26 16:01:18','2022-05-26 16:01:18'),(343,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2022-05-26 16:01:19','2022-05-26 16:01:19'),(344,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2022-05-26 16:01:20','2022-05-26 16:01:20'),(345,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}','2022-05-26 16:01:28','2022-05-26 16:01:28'),(346,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 16:02:36','2022-05-26 16:02:36'),(347,3,'admin/orders','GET','114.136.106.224','{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}','2022-05-26 16:02:40','2022-05-26 16:02:40'),(348,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 16:03:23','2022-05-26 16:03:23'),(349,3,'admin/orders','GET','114.136.106.224','{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}','2022-05-26 16:03:26','2022-05-26 16:03:26'),(350,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2022-05-26 16:56:34','2022-05-26 16:56:34'),(351,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2022-05-26 16:57:39','2022-05-26 16:57:39'),(352,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2022-05-26 16:57:52','2022-05-26 16:57:52'),(353,1,'admin','GET','180.177.28.147','[]','2022-05-26 17:52:33','2022-05-26 17:52:33'),(354,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-26 17:52:36','2022-05-26 17:52:36'),(355,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\",\"order_number\":null,\"name\":\"MING\",\"phone\":null,\"email\":null}','2022-05-26 17:54:42','2022-05-26 17:54:42'),(356,3,'admin/orders','GET','111.241.5.142','[]','2022-05-26 17:54:56','2022-05-26 17:54:56'),(357,3,'admin/orders','GET','111.241.5.142','{\"order_number\":null,\"name\":\"\\u5ed6\\u535a\\u5f18\",\"phone\":null,\"email\":null,\"_pjax\":\"#pjax-container\"}','2022-05-26 17:55:19','2022-05-26 17:55:19'),(358,3,'admin/orders','GET','111.235.229.239','[]','2022-05-26 18:08:12','2022-05-26 18:08:12'),(359,3,'admin/orders','GET','114.136.106.224','[]','2022-05-26 19:14:56','2022-05-26 19:14:56'),(360,3,'admin/orders','GET','114.136.106.224','{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}','2022-05-26 19:15:01','2022-05-26 19:15:01'),(361,3,'admin/orders','GET','114.136.106.224','{\"page\":\"3\",\"_columns_\":\"address,created_at,delivery_fee,email,id,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\"}','2022-05-26 19:16:40','2022-05-26 19:16:40'),(362,3,'admin/orders','GET','114.136.106.224','{\"page\":\"3\",\"_columns_\":\"address,created_at,delivery_fee,email,id,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\"}','2022-05-26 19:16:57','2022-05-26 19:16:57'),(363,3,'admin/orders','GET','114.136.106.224','{\"_columns_\":\"address,created_at,delivery_fee,email,id,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\",\"page\":\"2\"}','2022-05-26 19:17:13','2022-05-26 19:17:13'),(364,1,'admin','GET','180.177.28.147','[]','2022-05-26 19:19:30','2022-05-26 19:19:30'),(365,1,'admin/orders','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-26 19:19:33','2022-05-26 19:19:33'),(366,1,'admin/orders','GET','180.177.28.147','[]','2022-05-26 19:24:54','2022-05-26 19:24:54'),(367,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:03:12','2022-05-27 01:03:12'),(368,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:03:27','2022-05-27 01:03:27'),(369,1,'admin/orders','GET','180.177.28.147','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-27 01:04:15','2022-05-27 01:04:15'),(370,1,'admin/orders','GET','180.177.28.147','{\"page\":\"2\"}','2022-05-27 01:05:31','2022-05-27 01:05:31'),(371,1,'admin/orders','GET','180.177.28.147','{\"page\":\"1\"}','2022-05-27 01:05:32','2022-05-27 01:05:32'),(372,1,'admin/auth/roles','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-27 01:05:40','2022-05-27 01:05:40'),(373,1,'admin/auth/users','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-27 01:05:42','2022-05-27 01:05:42'),(374,1,'admin/auth/users/3/edit','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-27 01:05:47','2022-05-27 01:05:47'),(375,1,'admin/auth/users','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-27 01:05:49','2022-05-27 01:05:49'),(376,1,'admin/auth/menu','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-27 01:05:55','2022-05-27 01:05:55'),(377,1,'admin/auth/menu/1','DELETE','180.177.28.147','{\"_method\":\"delete\",\"_token\":\"1ybAyNjOOLG24AUir46zUhrqgBvaa8VROSYxe8Ta\"}','2022-05-27 01:05:59','2022-05-27 01:05:59'),(378,1,'admin/auth/menu','GET','180.177.28.147','{\"_pjax\":\"#pjax-container\"}','2022-05-27 01:06:00','2022-05-27 01:06:00'),(379,1,'admin/auth/menu','GET','180.177.28.147','[]','2022-05-27 01:06:03','2022-05-27 01:06:03'),(380,1,'admin','GET','180.177.28.147','[]','2022-05-27 01:06:08','2022-05-27 01:06:08'),(381,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:06:08','2022-05-27 01:06:08'),(382,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:16:13','2022-05-27 01:16:13'),(383,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:20:19','2022-05-27 01:20:19'),(384,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:35:02','2022-05-27 01:35:02'),(385,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:36:03','2022-05-27 01:36:03'),(386,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:37:38','2022-05-27 01:37:38'),(387,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 01:39:11','2022-05-27 01:39:11'),(388,3,'admin/orders','GET','111.241.5.142','[]','2022-05-27 09:57:02','2022-05-27 09:57:02'),(389,1,'admin','GET','180.177.28.147','[]','2022-05-27 10:08:21','2022-05-27 10:08:21'),(390,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 10:08:21','2022-05-27 10:08:21'),(391,3,'admin/orders','GET','111.241.5.142','[]','2022-05-27 10:11:24','2022-05-27 10:11:24'),(392,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\"}','2022-05-27 10:13:53','2022-05-27 10:13:53'),(393,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\"}','2022-05-27 10:13:58','2022-05-27 10:13:58'),(394,3,'admin/orders','GET','60.251.183.118','{\"page\":\"1\"}','2022-05-27 10:25:39','2022-05-27 10:25:39'),(395,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\"}','2022-05-27 10:36:32','2022-05-27 10:36:32'),(396,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\"}','2022-05-27 10:36:34','2022-05-27 10:36:34'),(397,3,'admin/orders','GET','111.241.5.142','[]','2022-05-27 10:36:41','2022-05-27 10:36:41'),(398,3,'admin/orders','GET','111.241.5.142','{\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"is_paied\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-27 10:36:50','2022-05-27 10:36:50'),(399,3,'admin/orders','GET','60.251.183.118','{\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"is_paied\":\"2\",\"_pjax\":\"#pjax-container\"}','2022-05-27 10:36:54','2022-05-27 10:36:54'),(400,3,'admin/orders','GET','111.241.5.142','{\"is_paied\":\"2\",\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}','2022-05-27 10:37:00','2022-05-27 10:37:00'),(401,3,'admin/orders','GET','111.241.5.142','{\"is_paied\":\"2\",\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"asc\"}}','2022-05-27 10:37:02','2022-05-27 10:37:02'),(402,3,'admin/orders','GET','60.251.183.118','{\"is_paied\":\"2\",\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"is_paied\",\"type\":\"desc\"}}','2022-05-27 10:37:03','2022-05-27 10:37:03'),(403,3,'admin/orders','GET','111.241.5.142','{\"is_paied\":\"2\",\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}','2022-05-27 10:37:04','2022-05-27 10:37:04'),(404,3,'admin/orders','GET','60.251.183.118','{\"is_paied\":\"2\",\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"is_paied\",\"type\":\"asc\"}}','2022-05-27 10:37:15','2022-05-27 10:37:15'),(405,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"is_paied\",\"type\":\"asc\"},\"order_number\":null,\"name\":null,\"phone\":\"0932006782\",\"email\":null,\"is_paied\":\"2\"}','2022-05-27 10:37:21','2022-05-27 10:37:21'),(406,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"order_number\":null,\"name\":null,\"phone\":\"0912964281\",\"email\":null,\"is_paied\":\"2\"}','2022-05-27 10:37:23','2022-05-27 10:37:23'),(407,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"is_paied\",\"type\":\"asc\"},\"order_number\":null,\"name\":null,\"phone\":\"0932006782\",\"email\":null,\"is_paied\":\"2\"}','2022-05-27 10:37:25','2022-05-27 10:37:25'),(408,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\"}','2022-05-27 10:37:35','2022-05-27 10:37:35'),(409,3,'admin/orders','GET','60.251.183.118','{\"_pjax\":\"#pjax-container\"}','2022-05-27 10:37:37','2022-05-27 10:37:37'),(410,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"order_number\":null,\"name\":null,\"phone\":\"0912964281\",\"email\":null,\"is_paied\":null}','2022-05-27 10:38:49','2022-05-27 10:38:49'),(411,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"is_paied\":null}','2022-05-27 10:38:52','2022-05-27 10:38:52'),(412,3,'admin/orders','GET','111.241.5.142','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"created_at\",\"type\":\"asc\"}}','2022-05-27 10:39:18','2022-05-27 10:39:18'),(413,3,'admin/orders','GET','220.135.57.252','[]','2022-05-27 11:51:59','2022-05-27 11:51:59'),(414,1,'admin','GET','180.177.28.147','[]','2022-05-27 13:57:29','2022-05-27 13:57:29'),(415,1,'admin/orders','GET','180.177.28.147','[]','2022-05-27 13:57:29','2022-05-27 13:57:29'),(416,1,'admin/orders','GET','180.177.28.147','{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}','2022-05-27 14:02:46','2022-05-27 14:02:46'),(417,1,'admin/orders','GET','180.177.28.147','{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}','2022-05-27 14:08:44','2022-05-27 14:08:44'),(418,3,'admin/orders','GET','111.241.5.142','[]','2022-05-27 14:14:38','2022-05-27 14:14:38'),(419,3,'admin/orders','GET','220.136.95.109','[]','2022-05-27 15:13:15','2022-05-27 15:13:15');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'order','order','','/orders*','2022-05-25 01:09:35','2022-05-25 01:09:53');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL),(2,8,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,6,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL),(2,3,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2022-05-18 08:33:04','2022-05-18 08:33:04'),(2,'成員','member','2022-05-18 08:52:41','2022-05-18 08:52:41');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$kHQUyPTSnT5N7R6O/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa','Administrator','images/1082597.png','JYjBE1katPwmZT35hNSQ991oWGkPYcoolspzYn3Xct6WYzr7t2GqaJvk2Jne','2022-05-18 08:33:04','2022-05-18 08:37:23'),(2,'bliaou','$2y$10$2fmgNQyYX2x3XSjcIR8yyOzDMcLofIrWOXkz7R0GFQYu70CUECCCC','bliaou',NULL,'pktGLWw5JzDeVjmDSijN87nYHCYDpuFQy7I7FFQjdHStMHUwUnKcCu4yQh2T','2022-05-18 08:55:07','2022-05-25 04:06:27'),(3,'user1','$2y$10$IGi8Jy5n.81NFoJQQz/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW','user1','images/items_sec1_img4.png','P8rdthHxN8rEeBIO5dKqf913NZolSJTI6q45wo5l0gzrgwzKjEIhId9jjTaq','2022-05-25 04:03:46','2022-05-25 12:50:04');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(79,'2022_05_22_120853_create_orders_table',2),(80,'2022_05_22_171643_create_order_items_table',2),(81,'2022_05_23_215801_create_payment_requests_table',2),(82,'2022_05_23_220022_create_payment_responses_table',2),(83,'2022_05_26_193954_add_is_paid_to_orders_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,'L',1,'2022-05-27 01:36:30','2022-05-27 01:36:30'),(2,2,0,'one size',1,'2022-05-27 09:27:10','2022-05-27 09:27:10'),(3,2,1,'L',1,'2022-05-27 09:27:10','2022-05-27 09:27:10'),(4,3,0,'one size',1,'2022-05-27 09:29:12','2022-05-27 09:29:12'),(5,3,1,'M',1,'2022-05-27 09:29:12','2022-05-27 09:29:12'),(6,4,0,'one size',1,'2022-05-27 09:57:54','2022-05-27 09:57:54'),(7,5,1,'XS',1,'2022-05-27 10:00:17','2022-05-27 10:00:17'),(8,6,1,'XS',2,'2022-05-27 10:03:33','2022-05-27 10:03:33'),(9,7,0,'one size',1,'2022-05-27 10:05:32','2022-05-27 10:05:32'),(10,8,1,'M',1,'2022-05-27 10:07:21','2022-05-27 10:07:21'),(11,9,1,'XS',2,'2022-05-27 10:10:53','2022-05-27 10:10:53'),(12,10,0,'one size',1,'2022-05-27 10:26:06','2022-05-27 10:26:06'),(13,11,0,'one size',1,'2022-05-27 13:41:16','2022-05-27 13:41:16'),(14,12,0,'one size',2,'2022-05-27 13:52:08','2022-05-27 13:52:08'),(15,13,0,'one size',1,'2022-05-27 14:32:46','2022-05-27 14:32:46'),(16,14,0,'one size',2,'2022-05-27 15:12:26','2022-05-27 15:12:26'),(17,14,1,'XS',1,'2022-05-27 15:12:26','2022-05-27 15:12:26'),(18,15,1,'XS',1,'2022-05-27 16:49:07','2022-05-27 16:49:07'),(19,16,0,'one size',1,'2022-05-27 16:53:50','2022-05-27 16:53:50'),(20,17,0,'one size',1,'2022-05-27 17:51:32','2022-05-27 17:51:32'),(21,18,0,'one size',1,'2022-05-27 18:14:02','2022-05-27 18:14:02'),(22,19,1,'XS',1,'2022-05-27 18:21:40','2022-05-27 18:21:40');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reuse_self` tinyint(4) NOT NULL,
  `reuse_self_delivery` tinyint(4) NOT NULL,
  `reuse_self_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reuse_self_memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deliver` tinyint(4) NOT NULL,
  `receipt` tinyint(4) NOT NULL,
  `corpName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxIDnumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '01',
  `delivery_fee` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_paied` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'202205270001',1,0,'0','他今年才2歲','public/uploads/TVROg1jTnO6VlivGCLaMFNTK9JL0sM6kgNjAoVNW.jpg','HSU YI MING','0928455235','mufasa.hsu@gmail.com','長安街220巷12號2樓之4',0,0,NULL,NULL,'03',80,790,'2022-05-27 01:36:30','2022-05-27 01:37:26',2),(2,'202205270002',1,0,'0','不要黃色','public/uploads/ntl7IPOJzqkaP1VWsgiBuYSQaNPo5BLTUTXRDCXv.jpg','林','0932006782','rehow.tw@gmail.com','Test 信用卡',0,0,NULL,NULL,'01',80,1580,'2022-05-27 09:27:10','2022-05-27 09:27:10',1),(3,'202205270003',1,0,'0','不要黃色','public/uploads/cKpYF9Zmi8qVyKjWM8sjrNh4Kdcqe06Nme4gPTir.jpg','林','0932006782','rehow.tw@gmail.com','Credit card test',0,0,NULL,NULL,'01',80,1580,'2022-05-27 09:29:12','2022-05-27 09:31:33',3),(4,'202205270004',0,0,'0',NULL,NULL,'廖博弘','0912964281','bliaou@gmail.com','新北市板橋區文化路一段46巷50號4樓',0,0,NULL,NULL,'01',80,790,'2022-05-27 09:57:54','2022-05-27 09:59:30',2),(5,'202205270005',1,0,'0',NULL,NULL,'廖博弘','0912964281','bliaou@gmail.com','新北市板橋區文化路一段46巷50號4樓',0,1,'博璽行銷有限公司','54869549','01',80,790,'2022-05-27 10:00:17','2022-05-27 10:01:06',3),(6,'202205270006',1,0,'0',NULL,'public/uploads/3g9ZT5bB9G6KMmRIXpzy8qkT8qrSJRZPo1bc4tUe.png','廖博弘','0912964281','bliaou@gmail.com','新北市板橋區文化路一段46巷50號4樓',0,1,'博璽行銷有限公司','54869549','03',80,1580,'2022-05-27 10:03:33','2022-05-27 10:03:33',1),(7,'202205270007',1,0,'0',NULL,NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','長安街220巷12號2樓之4',0,0,NULL,NULL,'03',80,790,'2022-05-27 10:05:32','2022-05-27 10:05:32',1),(8,'202205270008',1,0,'0',NULL,'public/uploads/DMOQUeL4odRCID6hU9x7VABzFeQzPSgFJfJGd7H9.png','廖博弘','0912964281','bliaou@gmail.com','新北市板橋區文化路一段46巷50號4樓',0,1,'博璽行銷有限公司','54869549','03',80,790,'2022-05-27 10:07:21','2022-05-27 10:07:21',1),(9,'202205270009',1,0,'0',NULL,NULL,'廖博弘','0912964281','bliaou@gmail.com','新北市板橋區文化路一段46巷50號4樓',0,1,'博璽行銷有限公司','54869549','03',80,1580,'2022-05-27 10:10:53','2022-05-27 10:10:53',1),(10,'202205270010',1,0,'0',NULL,NULL,'林純安','0932006782','bibi.lin@rehow.org','台北',0,0,NULL,NULL,'01',80,790,'2022-05-27 10:26:06','2022-05-27 10:28:27',2),(11,'202205270011',1,0,'0',NULL,NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','復興北路48號6樓',0,0,NULL,NULL,'01',80,790,'2022-05-27 13:41:16','2022-05-27 13:41:40',2),(12,'202205270012',0,0,'0',NULL,NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','長安街220巷12號2樓之4',0,0,NULL,NULL,'03',80,1580,'2022-05-27 13:52:08','2022-05-27 13:53:16',2),(13,'202205270013',1,0,'0',NULL,'public/uploads/xHeDMmYEn11TyZhSLXdDx4xm7ERCv52UJ2fI58Fb.jpg','林純安','0932006782','anlinbibi@gmail.com','電腦',0,0,NULL,NULL,'01',80,790,'2022-05-27 14:32:46','2022-05-27 14:32:46',1),(14,'202205270014',1,0,'0',NULL,NULL,'林育貞','0913727707','irislin813@gmail.com','Tp',0,0,NULL,NULL,'01',80,2370,'2022-05-27 15:12:26','2022-05-27 15:12:26',1),(15,'202205270015',0,0,'0','測試',NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','復興北路48號6樓',0,0,NULL,NULL,'03',80,790,'2022-05-27 16:49:07','2022-05-27 16:49:07',1),(16,'202205270016',1,0,'0',NULL,NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','長安街220巷12號2樓之4',0,0,NULL,NULL,'03',80,790,'2022-05-27 16:53:50','2022-05-27 16:54:17',2),(17,'202205270017',1,0,'0',NULL,NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','長安街220巷12號2樓之4',0,0,NULL,NULL,'01',80,790,'2022-05-27 17:51:32','2022-05-27 17:51:32',1),(18,'202205270018',1,0,'0',NULL,NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','長安街220巷12號2樓之4',0,0,NULL,NULL,'01',80,790,'2022-05-27 18:14:02','2022-05-27 18:14:02',1),(19,'202205270019',1,0,'0',NULL,NULL,'HSU YI MING','0928455235','mufasa.hsu@gmail.com','長安街220巷12號2樓之4',0,0,NULL,NULL,'01',80,790,'2022-05-27 18:21:40','2022-05-27 18:29:37',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_requests`
--

DROP TABLE IF EXISTS `payment_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `WebNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ECPlatform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverTel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverEmail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalPrice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PayType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AtmRespost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeadLine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PayEN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EPT` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PassCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderInfo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_requests`
--

LOCK TABLES `payment_requests` WRITE;
/*!40000 ALTER TABLE `payment_requests` DISABLE KEYS */;
INSERT INTO `payment_requests` VALUES (1,1,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270001','870','03','0','0','0','1','E5CAC7CD7C03FB5ECE240CBEC9AD451DC03E8684','寵物帽T, L x 1, NT$790\n','2022-05-27 01:36:30','2022-05-27 01:36:30'),(2,2,'A127366357','REHOW','林','0932006782','0932006782','rehow.tw@gmail.com','202205270002','1660','01','0','0','0','1','67B297CDE16F19B3262390781E371EEE066EFE6A','風格抱枕, one size x 1, NT$790\n寵物帽T, L x 1, NT$790\n','2022-05-27 09:27:10','2022-05-27 09:27:10'),(3,3,'A127366357','REHOW','林','0932006782','0932006782','rehow.tw@gmail.com','202205270003','1660','01','0','0','0','1','E22526627B9CE50AD2EB2BE6DF1B2DE2599BB6D2','風格抱枕, one size x 1, NT$790\n寵物帽T, M x 1, NT$790\n','2022-05-27 09:29:12','2022-05-27 09:29:12'),(4,3,'A127366357','REHOW','林','0932006782','0932006782','rehow.tw@gmail.com','202205270003','1660','01','0','0','0','1','E22526627B9CE50AD2EB2BE6DF1B2DE2599BB6D2','風格抱枕, one size x 1, NT$790\n寵物帽T, M x 1, NT$790\n','2022-05-27 09:31:39','2022-05-27 09:31:39'),(5,4,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270004','870','01','0','0','0','1','1624E018E4E9D9BDF23C344E005104E4784136CF','風格抱枕, one size x 1, NT$790\n','2022-05-27 09:57:54','2022-05-27 09:57:54'),(6,5,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270005','870','01','0','0','0','1','3FE3FC1BA7AF58420CF0B5B5BE8A42CCCB52F22F','寵物帽T, XS x 1, NT$790\n','2022-05-27 10:00:17','2022-05-27 10:00:17'),(7,5,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270005','870','01','0','0','0','1','3FE3FC1BA7AF58420CF0B5B5BE8A42CCCB52F22F','寵物帽T, XS x 1, NT$790\n','2022-05-27 10:01:14','2022-05-27 10:01:14'),(8,6,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270006','1660','03','0','0','0','1','9BA9F0E8F6CC11BAC89E2056F88C1F887AA3F154','寵物帽T, XS x 2, NT$1580\n','2022-05-27 10:03:33','2022-05-27 10:03:33'),(9,6,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270006','1660','03','0','0','0','1','9BA9F0E8F6CC11BAC89E2056F88C1F887AA3F154','寵物帽T, XS x 2, NT$1580\n','2022-05-27 10:04:58','2022-05-27 10:04:58'),(10,7,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270007','870','03','0','0','0','1','85508EDF49C6C42CBB6F0975FB7EC3DE1D4E9F7A','風格抱枕, one size x 1, NT$790\n','2022-05-27 10:05:32','2022-05-27 10:05:32'),(11,8,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270008','870','03','0','0','0','1','DEFF02FD6DD2FCCAF309AE07874A35930620CCFD','寵物帽T, M x 1, NT$790\n','2022-05-27 10:07:21','2022-05-27 10:07:21'),(12,6,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270006','1660','03','0','0','0','1','9BA9F0E8F6CC11BAC89E2056F88C1F887AA3F154','寵物帽T, XS x 2, NT$1580\n','2022-05-27 10:08:15','2022-05-27 10:08:15'),(13,8,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270008','870','03','0','0','0','1','DEFF02FD6DD2FCCAF309AE07874A35930620CCFD','寵物帽T, M x 1, NT$790\n','2022-05-27 10:08:36','2022-05-27 10:08:36'),(14,6,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270006','1660','03','0','0','0','1','9BA9F0E8F6CC11BAC89E2056F88C1F887AA3F154','寵物帽T, XS x 2, NT$1580\n','2022-05-27 10:09:46','2022-05-27 10:09:46'),(15,9,'A127366357','REHOW','廖博弘','0912964281','0912964281','bliaou@gmail.com','202205270009','1660','03','0','0','0','1','FACF96E97FB276438C7C42B5936F79C19EC3C375','寵物帽T, XS x 2, NT$1580\n','2022-05-27 10:10:53','2022-05-27 10:10:53'),(16,10,'A127366357','REHOW','林純安','0932006782','0932006782','bibi.lin@rehow.org','202205270010','870','01','0','0','0','1','F94D3E7DFA5E6E7BCAD570845234601C0BB50BBF','風格抱枕, one size x 1, NT$790\n','2022-05-27 10:26:06','2022-05-27 10:26:06'),(17,2,'A127366357','REHOW','林','0932006782','0932006782','rehow.tw@gmail.com','202205270002','1660','01','0','0','0','1','67B297CDE16F19B3262390781E371EEE066EFE6A','風格抱枕, one size x 1, NT$790\n寵物帽T, L x 1, NT$790\n','2022-05-27 10:35:37','2022-05-27 10:35:37'),(18,2,'A127366357','REHOW','林','0932006782','0932006782','rehow.tw@gmail.com','202205270002','1660','01','0','0','0','1','67B297CDE16F19B3262390781E371EEE066EFE6A','風格抱枕, one size x 1, NT$790\n寵物帽T, L x 1, NT$790\n','2022-05-27 10:36:12','2022-05-27 10:36:12'),(19,2,'A127366357','REHOW','林','0932006782','0932006782','rehow.tw@gmail.com','202205270002','1660','01','0','0','0','1','67B297CDE16F19B3262390781E371EEE066EFE6A','風格抱枕, one size x 1, NT$790\n寵物帽T, L x 1, NT$790\n','2022-05-27 10:36:13','2022-05-27 10:36:13'),(20,7,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270007','870','03','0','0','0','1','85508EDF49C6C42CBB6F0975FB7EC3DE1D4E9F7A','風格抱枕, one size x 1, NT$790\n','2022-05-27 10:44:31','2022-05-27 10:44:31'),(21,11,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270011','870','01','0','0','0','1','15263FDFE5DC360CF5CE97B5EC5207EAF753763B','風格抱枕, one size x 1, NT$790\n','2022-05-27 13:41:16','2022-05-27 13:41:16'),(22,12,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270012','1660','03','0','0','0','1','0938DD45F1A5B84188F99DEA42C29965E9554868','風格抱枕, one size x 2, NT$1580\n','2022-05-27 13:52:08','2022-05-27 13:52:08'),(23,13,'A127366357','REHOW','林純安','0932006782','0932006782','anlinbibi@gmail.com','202205270013','870','01','0','0','0','1','7E2D32DF4708C55D2B8BCF7301EDC3C5EB55019C','風格抱枕, one size x 1, NT$790\n','2022-05-27 14:32:46','2022-05-27 14:32:46'),(24,14,'A127366357','REHOW','林育貞','0913727707','0913727707','irislin813@gmail.com','202205270014','2450','01','0','0','0','1','A83F5809E3464894006E01D56F393274B5FAEA56','風格抱枕, one size x 2, NT$1580\n寵物帽T, XS x 1, NT$790\n','2022-05-27 15:12:26','2022-05-27 15:12:26'),(25,15,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270015','870','03','0','0','0','1','E226B6F18B6E685AB41330FF34E3E342074DEF4E','寵物帽T, XS x 1, NT$790\n','2022-05-27 16:49:07','2022-05-27 16:49:07'),(26,16,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270016','870','03','0','0','0','1','8FF74D4926D367EA0719C62D4B9F18FB6CB7AC9A','風格抱枕, one size x 1, NT$790\n','2022-05-27 16:53:50','2022-05-27 16:53:50'),(27,17,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270017','870','01','0','0','0','1','4AA7AC9A57DE9BA2964B0A322D6587EEB875F8E6','風格抱枕, one size x 1, NT$790\n','2022-05-27 17:51:32','2022-05-27 17:51:32'),(28,18,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270018','870','01','0','0','0','1','CE507BCF8C766C8FB2A806D4BE907E91703D890D','風格抱枕, one size x 1, NT$790\n','2022-05-27 18:14:02','2022-05-27 18:14:02'),(29,19,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270019','870','01','0','0','0','1','D9C249F404730DD7E6FE79A5CC0A1284194FBE93','寵物帽T, XS x 1, NT$790\n','2022-05-27 18:21:40','2022-05-27 18:21:40'),(30,19,'A127366357','REHOW','HSU YI MING','0928455235','0928455235','mufasa.hsu@gmail.com','202205270019_02','870','01','0','0','0','1','29C3D447D8702CB1413693C5DDFB30ABEB26B4A0','寵物帽T, XS x 1, NT$790\n','2022-05-27 18:29:18','2022-05-27 18:29:18');
/*!40000 ALTER TABLE `payment_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_responses`
--

DROP TABLE IF EXISTS `payment_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_responses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_request_id` bigint(20) unsigned NOT NULL,
  `BuysafeNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PassCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalPrice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PayType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TranStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WebNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ErrDesc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Card_Foreign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NewDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DueDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ATMNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BankCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BranchCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BarCode1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BarCode2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BarCode3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_responses`
--

LOCK TABLES `payment_responses` WRITE;
/*!40000 ALTER TABLE `payment_responses` DISABLE KEYS */;
INSERT INTO `payment_responses` VALUES (1,1,'6200002205270630308','85EC394CEBD2BE45819A4930ABA79BB2D41D2A35','202205270001','870','03','S',NULL,NULL,NULL,NULL,'2022/5/27','2022/5/27 23:59:59','95533214700073','009','5067',NULL,NULL,NULL,'2022-05-27 01:37:26','2022-05-27 01:37:26'),(2,3,'8000002205273792630','6B99026D9CA898F0EDE89D63145177BBF60D5540','202205270003','1660','01','F','A127366357','測試交易失敗','9394',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-27 09:31:33','2022-05-27 09:31:33'),(3,5,'8000002205273969737','C65BBEF432A1BB7A592A47BCA5CF05ED609FE3DB','202205270004','870','01','S','A127366357',NULL,'3678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-27 09:59:30','2022-05-27 09:59:30'),(4,6,'8000002205274001514','9A1C1A970D854506998366F27727281B32CE9930','202205270005','870','01','F','A127366357','測試交易失敗','3678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-27 10:01:06','2022-05-27 10:01:06'),(5,16,'8000002205274170271','4C08B697D4A175CACEBAE072F7252F16DB003F99','202205270010','870','01','S','A127366357',NULL,'8017',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-27 10:28:27','2022-05-27 10:28:27'),(6,21,'8000002205275455478','2A88034EFF0907F85ACF2BE65791F126DBFC94AE','202205270011','870','01','S','A127366357',NULL,'4050',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-27 13:41:40','2022-05-27 13:41:40'),(7,22,'6200002205275528283','2EF8421CB1996499503FF6D22648AF28A5792B5C','202205270012','1660','03','S',NULL,NULL,NULL,NULL,'2022/5/27','2022/5/27 23:59:59','95533214700152','009','5067',NULL,NULL,NULL,'2022-05-27 13:53:16','2022-05-27 13:53:16'),(8,26,'6200002205276731840','8ED4B6D7132C7B816A7CC5E909FF90FA92CD430F','202205270016','870','03','S',NULL,NULL,NULL,NULL,'2022/5/27','2022/5/27 23:59:59','95533214700172','009','5067',NULL,NULL,NULL,'2022-05-27 16:54:17','2022-05-27 16:54:17'),(9,30,'8000002205277376931','F8C362D99BBD1ACEC3245E3F050413459255AA77','202205270019_02','870','01','S','A127366357',NULL,'4050',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-27 18:29:37','2022-05-27 18:29:37');
/*!40000 ALTER TABLE `payment_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-27 10:31:05
