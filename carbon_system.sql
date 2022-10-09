-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: carbon_system
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `description` longtext COMMENT '活动描述',
  `cover` longtext COMMENT '活动封面',
  `status` bigint unsigned DEFAULT '2' COMMENT '活动状态 1-已发布 2-已下线 ',
  `typ` bigint unsigned DEFAULT NULL COMMENT '活动类型 1-常规打卡活动',
  `icon` longtext COMMENT '活动图标',
  `unit` longtext COMMENT '单位',
  `coin_num` bigint DEFAULT NULL COMMENT '碳币奖励',
  `bbs_switch` tinyint(1) DEFAULT NULL COMMENT '是否开启社区',
  `weight` double DEFAULT NULL COMMENT '权数',
  `coin_rule_type` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_activity_name` (`name`),
  KEY `fk_coin_rule_activities` (`coin_rule_type`),
  CONSTRAINT `fk_coin_rule_activities` FOREIGN KEY (`coin_rule_type`) REFERENCES `coin_rule` (`typ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'2022-08-06 15:49:42','2022-08-18 10:50:53.600','活动1','1','/activity/record/a8737af347bf429fde7b5f3e9b5a9120.png',2,1,'/activity/record/a8737af347bf429fde7b5f3e9b5a9120.png','1',1,1,1,2),(2,'2022-08-06 15:50:01','2022-08-18 14:11:02.888','活动','1','/activity/record/a8737af347bf429fde7b5f3e9b5a9120.png',1,1,'/activity/record/a8737af347bf429fde7b5f3e9b5a9120.png','1',1,1,1,2),(3,'2022-08-25 13:46:20','2022-08-25 13:46:28.316','居家办公','居家办公','/activity/record/7c3515c6633e320e0b67835483250392.jpg',1,1,'/activity/record/7c3515c6633e320e0b67835483250392.jpg','天',14,1,1,2);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_record`
--

DROP TABLE IF EXISTS `activity_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `activity_id` bigint unsigned DEFAULT NULL,
  `auth_user_id` bigint unsigned DEFAULT NULL,
  `typ` bigint unsigned DEFAULT NULL,
  `amt` double DEFAULT '0' COMMENT '打卡量',
  `reduce_carbon_amt` double DEFAULT '0' COMMENT '减碳量',
  `coin_num` bigint DEFAULT '0' COMMENT '本次打卡获得的碳币数量',
  `content` longtext COMMENT '打卡内容',
  `pics` json DEFAULT NULL COMMENT '图片',
  `like_num` bigint unsigned DEFAULT '0' COMMENT '总点赞数',
  PRIMARY KEY (`id`),
  KEY `fk_activity_record_auth_user` (`auth_user_id`),
  KEY `fk_activity_records` (`activity_id`),
  CONSTRAINT `fk_activity_record_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_activity_records` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_record`
--

LOCK TABLES `activity_record` WRITE;
/*!40000 ALTER TABLE `activity_record` DISABLE KEYS */;
INSERT INTO `activity_record` VALUES (1,'2022-08-08 16:36:39','2022-08-08 16:36:38.571',NULL,1,2,0,1,1,1,'W','[\"/activity/record/2faa2486543fcda094586853975998d0.jpg\"]',0),(2,'2022-08-08 16:40:44','2022-08-08 16:40:43.825',NULL,1,2,0,2,2,1,'1','[\"/activity/record/bd20eb8981bd03762e0b39ffd4da1f37.jpg\"]',0),(3,'2022-08-08 16:41:04','2022-08-08 16:41:04.091',NULL,1,2,0,1,1,1,'哦','[\"/activity/record/fb5b9812d87ea9b1f982bafc388b69a0.jpg\"]',0),(4,'2022-08-08 16:41:25','2022-08-08 16:41:24.784',NULL,1,2,0,6,6,1,'我们666','[\"/activity/record/fb5b9812d87ea9b1f982bafc388b69a0.jpg\"]',0),(5,'2022-08-08 16:41:43','2022-08-08 16:41:43.314',NULL,1,2,0,6,6,1,'我','[\"/activity/record/3489451c998bc06d2fd008922f0c80c0.jpg\"]',0),(6,'2022-08-08 16:42:08','2022-08-08 16:42:07.686',NULL,1,2,0,66,66,1,'哈哈哈','[\"/activity/record/c0ee2cb4aa6fde0130ecf7ff613631d8.jpg\"]',0),(7,'2022-08-08 16:42:24','2022-08-08 16:42:23.971',NULL,1,2,0,20,20,1,'42','[\"/activity/record/fb5b9812d87ea9b1f982bafc388b69a0.jpg\"]',0),(8,'2022-08-08 16:47:49','2022-08-08 16:47:49.503',NULL,1,2,0,5,5,1,'我','[\"/activity/record/1620e55ffbdd0a725941bdfd33bae4c6.jpg\"]',0),(9,'2022-08-08 16:48:13','2022-08-08 16:48:12.741',NULL,1,2,0,42,42,1,'哈哈哈','[\"/activity/record/23a9e2d9f90d2f67794e55af02b43d17.jpg\"]',0),(10,'2022-08-08 16:48:29','2022-08-08 16:48:29.502',NULL,1,2,0,88,88,1,'哈哈哈','[\"/activity/record/fb5b9812d87ea9b1f982bafc388b69a0.jpg\"]',0),(12,'2022-08-08 17:02:05','2022-08-08 17:02:05.103',NULL,1,1,0,60,60,1,NULL,'[\"/activity/record/a8737af347bf429fde7b5f3e9b5a9120.png\"]',0),(13,'2022-08-08 17:02:13','2022-08-08 17:02:13.181',NULL,1,1,0,60,60,1,NULL,'[\"/activity/record/a8737af347bf429fde7b5f3e9b5a9120.png\"]',0),(14,'2022-08-08 17:17:28','2022-08-08 17:17:27.704',NULL,1,2,0,10,10,0,NULL,'[\"/activity/record/b12b06f931fb0dbe04176e6bdae7cd42.jpg\"]',0),(15,'2022-08-08 17:38:09','2022-08-08 17:38:09.400',NULL,1,2,0,5,5,0,'测试','[\"/activity/record/6f2fc17e91e074ec5acfc777375a0b4a.jpg\"]',0),(16,'2022-08-26 09:41:35','2022-08-26 09:41:35.292',NULL,2,4,0,5,5,1,'GG','[\"/activity/record/5029b781840f7515bfeea311a1e87c56.jpg\"]',0);
/*!40000 ALTER TABLE `activity_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_record_2_pick_user`
--

DROP TABLE IF EXISTS `activity_record_2_pick_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_record_2_pick_user` (
  `activity_record_id` bigint unsigned NOT NULL,
  `auth_user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`activity_record_id`,`auth_user_id`),
  KEY `fk_activity_record_2_pick_user_auth_user` (`auth_user_id`),
  CONSTRAINT `fk_activity_record_2_pick_user_activity_record` FOREIGN KEY (`activity_record_id`) REFERENCES `activity_record` (`id`),
  CONSTRAINT `fk_activity_record_2_pick_user_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_record_2_pick_user`
--

LOCK TABLES `activity_record_2_pick_user` WRITE;
/*!40000 ALTER TABLE `activity_record_2_pick_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_record_2_pick_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_share_record`
--

DROP TABLE IF EXISTS `activity_share_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_share_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `activity_record_id` bigint unsigned DEFAULT NULL COMMENT '打卡记录ID',
  `participant_id` bigint unsigned DEFAULT NULL COMMENT '参与接力人员ID',
  `participant_coin_record_id` bigint unsigned DEFAULT NULL COMMENT '参与接力人员的碳币记录',
  `sharer_coin_record_id` bigint unsigned DEFAULT NULL COMMENT '分享者对应的碳币记录',
  `sharer_id` bigint unsigned DEFAULT NULL COMMENT '分享者的ID',
  PRIMARY KEY (`id`),
  KEY `fk_activity_share_record_participant` (`participant_id`),
  KEY `fk_activity_share_record_participant_coin_record` (`participant_coin_record_id`),
  KEY `fk_activity_share_record_sharer_coin_record` (`sharer_coin_record_id`),
  KEY `fk_activity_record_share_records` (`activity_record_id`),
  KEY `fk_activity_share_record_sharer` (`sharer_id`),
  CONSTRAINT `fk_activity_record_share_records` FOREIGN KEY (`activity_record_id`) REFERENCES `activity_record` (`id`),
  CONSTRAINT `fk_activity_share_record_participant` FOREIGN KEY (`participant_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_activity_share_record_participant_coin_record` FOREIGN KEY (`participant_coin_record_id`) REFERENCES `coin_record` (`id`),
  CONSTRAINT `fk_activity_share_record_sharer` FOREIGN KEY (`sharer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_activity_share_record_sharer_coin_record` FOREIGN KEY (`sharer_coin_record_id`) REFERENCES `coin_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_share_record`
--

LOCK TABLES `activity_share_record` WRITE;
/*!40000 ALTER TABLE `activity_share_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_share_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `pic_url` longtext COMMENT '封面URL',
  `title` longtext COMMENT '标题',
  `summary` longtext COMMENT '文章简介',
  `description` longtext COMMENT '内容',
  `typ` bigint DEFAULT '0' COMMENT '文章类别',
  `publish_date_time` datetime(3) DEFAULT NULL COMMENT '发布时间',
  `xiu_mi_article_id` bigint DEFAULT NULL COMMENT '秀米的文章ID',
  `directory_id` bigint unsigned DEFAULT NULL COMMENT '目录ID',
  `reader_nums` bigint DEFAULT '0' COMMENT '已阅读用户数量',
  `rank_no` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xiu_mi_article_id` (`xiu_mi_article_id`),
  KEY `fk_article_directory_articles` (`directory_id`),
  CONSTRAINT `fk_article_directory_articles` FOREIGN KEY (`directory_id`) REFERENCES `article_directory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'2022-08-05 10:36:53','2022-08-05 10:37:38.988','','无标题','','<section style=\"box-sizing: border-box; font-style: normal; font-weight: 400; text-align: justify; font-size: 16px;\"><section style=\"text-align: center; justify-content: center; display: flex; flex-flow: row nowrap; margin: 10px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; line-height: 0; flex: 0 0 0%; align-self: flex-end; height: auto; margin: 0px -12px 0px 0px; box-sizing: border-box;\"><section style=\"position: static; height: auto; transform: rotateZ(330deg) scale(0.85); -webkit-transform: rotateZ(330deg) scale(0.85); -moz-transform: rotateZ(330deg) scale(0.85); -o-transform: rotateZ(330deg) scale(0.85); transform-origin: center center; -webkit-transform-origin: center center; -moz-transform-origin: center center; -o-transform-origin: center center; margin-top: -1px; margin-bottom: -1px; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"justify-content: center; display: flex; flex-flow: row nowrap; margin: 10px 0px 33px; position: static; box-sizing: border-box;\"><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; margin: 0px -2px 0px 0px; line-height: 0; box-sizing: border-box;\"><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\" transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); position: static; box-sizing: border-box;\"><section class=\"group-empty\" style=\"display: inline-block; width: 24px; height: 12px; vertical-align: top; overflow: hidden; border-width: 0px 2px 2px; border-radius: 0px 0px 105px 105px; border-style: solid; border-color: rgb(62, 62, 62) rgb(255, 176, 181) rgb(255, 176, 181); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; margin: 0px -2px 0px 0px; line-height: 0; box-sizing: border-box;\"><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\" transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); position: static; box-sizing: border-box;\"><section class=\"group-empty\" style=\"display: inline-block; width: 24px; height: 12px; vertical-align: top; overflow: hidden; border-width: 0px 2px 2px; border-radius: 0px 0px 105px 105px; border-style: solid; border-color: rgb(62, 62, 62) rgb(255, 176, 181) rgb(255, 176, 181); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; padding: 0px 10px 0px 0px; box-sizing: border-box;\"><section style=\"margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"font-size: 18px; color: rgb(168, 195, 59); letter-spacing: 2px; box-sizing: border-box;\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">秀米夏令营开营啦</strong></p></section></section><section style=\"justify-content: center; display: flex; flex-flow: row nowrap; margin: -10px 0px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 15px; vertical-align: top; align-self: flex-start; flex: 0 0 auto; height: auto; border-bottom: 2px solid rgb(246, 131, 48); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; box-sizing: border-box;\"><section style=\"margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; width: 30px; height: auto; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"2.9314815\" data-w=\"1080\" _width=\"100%\" src=\"http://127.0.0.1:8199/api/file/download/?path=/article/5cc6270f621c513761ee9b84822d376b.png\"></section></section></section></section><section style=\"text-align: center; justify-content: center; display: flex; flex-flow: row nowrap; margin: 10px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; line-height: 0; flex: 0 0 0%; align-self: flex-end; height: auto; margin: 0px -12px 0px 0px; box-sizing: border-box;\"><section style=\"position: static; height: auto; transform: rotateZ(330deg) scale(0.85); -webkit-transform: rotateZ(330deg) scale(0.85); -moz-transform: rotateZ(330deg) scale(0.85); -o-transform: rotateZ(330deg) scale(0.85); transform-origin: center center; -webkit-transform-origin: center center; -moz-transform-origin: center center; -o-transform-origin: center center; margin-top: -1px; margin-bottom: -1px; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"justify-content: center; display: flex; flex-flow: row nowrap; margin: 10px 0px 33px; position: static; box-sizing: border-box;\"><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; margin: 0px -2px 0px 0px; line-height: 0; box-sizing: border-box;\"><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\" transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); position: static; box-sizing: border-box;\"><section class=\"group-empty\" style=\"display: inline-block; width: 24px; height: 12px; vertical-align: top; overflow: hidden; border-width: 0px 2px 2px; border-radius: 0px 0px 105px 105px; border-style: solid; border-color: rgb(62, 62, 62) rgb(255, 176, 181) rgb(255, 176, 181); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; margin: 0px -2px 0px 0px; line-height: 0; box-sizing: border-box;\"><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\" transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); position: static; box-sizing: border-box;\"><section class=\"group-empty\" style=\"display: inline-block; width: 24px; height: 12px; vertical-align: top; overflow: hidden; border-width: 0px 2px 2px; border-radius: 0px 0px 105px 105px; border-style: solid; border-color: rgb(62, 62, 62) rgb(255, 176, 181) rgb(255, 176, 181); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; padding: 0px 10px 0px 0px; box-sizing: border-box;\"><section style=\"margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"font-size: 18px; color: rgb(168, 195, 59); letter-spacing: 2px; box-sizing: border-box;\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">秀米夏令营开营啦</strong></p></section></section><section style=\"justify-content: center; display: flex; flex-flow: row nowrap; margin: -10px 0px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 15px; vertical-align: top; align-self: flex-start; flex: 0 0 auto; height: auto; border-bottom: 2px solid rgb(246, 131, 48); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; box-sizing: border-box;\"><section style=\"margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; width: 30px; height: auto; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"2.9314815\" data-w=\"1080\" _width=\"100%\" src=\"http://127.0.0.1:8199/api/file/download/?path=/article/5cc6270f621c513761ee9b84822d376b.png\"></section></section></section></section><section style=\"text-align: center; justify-content: center; display: flex; flex-flow: row nowrap; margin: 10px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: top; width: auto; line-height: 0; flex: 0 0 0%; align-self: flex-start; height: auto; margin: 0px; box-sizing: border-box;\"><section style=\"margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; width: 50px; height: auto; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1.4981273\" data-w=\"534\" _width=\"100%\" src=\"http://127.0.0.1:8199/api/file/download/?path=/article/b2cefeb9812b7d383e3ca3ac8cb4aaa7.gif\"></section></section></section><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; padding: 0px 0px 0px 10px; box-sizing: border-box;\"><section style=\"margin: 15px 0px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"font-size: 18px; color: rgb(255, 217, 105); letter-spacing: 2px; box-sizing: border-box;\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">秀米夏令营开营啦</strong></p></section></section><section style=\"justify-content: center; display: flex; flex-flow: row nowrap; margin: -10px 0px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 15px; vertical-align: top; align-self: flex-start; flex: 0 0 auto; height: auto; border-bottom: 2px solid rgb(255, 217, 105); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section></section></section><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 0%; height: auto; margin: 0px 0px 0px -12px; box-sizing: border-box;\"><section style=\"position: static; height: auto; transform: rotateZ(30deg) scale(0.85); -webkit-transform: rotateZ(30deg) scale(0.85); -moz-transform: rotateZ(30deg) scale(0.85); -o-transform: rotateZ(30deg) scale(0.85); transform-origin: center center; -webkit-transform-origin: center center; -moz-transform-origin: center center; -o-transform-origin: center center; margin-top: -1px; margin-bottom: -1px; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"justify-content: center; display: flex; flex-flow: row nowrap; margin: 10px 0px 25px; position: static; box-sizing: border-box;\"><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; margin: 0px -2px 0px 0px; line-height: 0; box-sizing: border-box;\"><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\" transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); position: static; box-sizing: border-box;\"><section class=\"group-empty\" style=\"display: inline-block; width: 24px; height: 12px; vertical-align: top; overflow: hidden; border-width: 0px 2px 2px; border-radius: 0px 0px 105px 105px; border-style: solid; border-color: rgb(62, 62, 62) rgb(255, 176, 181) rgb(255, 176, 181); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section><section style=\"display: inline-block; vertical-align: top; width: auto; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; margin: 0px -2px 0px 0px; line-height: 0; box-sizing: border-box;\"><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\" transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); position: static; box-sizing: border-box;\"><section class=\"group-empty\" style=\"display: inline-block; width: 24px; height: 12px; vertical-align: top; overflow: hidden; border-width: 0px 2px 2px; border-radius: 0px 0px 105px 105px; border-style: solid; border-color: rgb(62, 62, 62) rgb(255, 176, 181) rgb(255, 176, 181); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section></section></section></section></section></section>',1,'2022-08-05 10:37:35.809',388972061,1,0,NULL),(4,'2022-08-08 17:51:58','2022-08-26 09:33:34.980','https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/c4ff1ca035e4dbf9a4014b0a2b38a5f5.jpeg','我是资讯二号','我是资讯二号呀','<section style=\"box-sizing: border-box; font-style: normal; font-weight: 400; text-align: justify; font-size: 16px;\"><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 10px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 100%; vertical-align: top; align-self: flex-start; flex: 0 0 auto; border-style: solid none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><section style=\"justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 10px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: bottom; width: 70%; align-self: flex-end; flex: 0 0 auto; height: auto; box-sizing: border-box;\"><section style=\"text-align: center; margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.6656017\" data-w=\"939\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/cd55c87cc94d61f7f4ef37c975709761.jpg\"></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; flex: 100 100 0%; height: auto; align-self: flex-end; box-sizing: border-box;\"><section style=\"font-size: 19px; text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; border: 1px solid rgb(255, 199, 106); background-color: rgb(255, 199, 106); width: 1.8em; height: 1.8em; line-height: 1.7; border-radius: 100%; margin-left: auto; margin-right: auto; font-size: 21px; color: rgb(255, 255, 255); letter-spacing: 0px; box-sizing: border-box;\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">立</strong></p></section></section><section style=\"font-size: 19px; text-align: center; margin: 0px 0px -16px; isolation: isolate; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; border: 1px solid rgb(255, 199, 106); background-color: rgb(255, 199, 106); width: 1.8em; height: 1.8em; line-height: 1.7; border-radius: 100%; margin-left: auto; margin-right: auto; font-size: 21px; color: rgb(255, 255, 255); letter-spacing: 0px; box-sizing: border-box;\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">秋</strong></p></section></section><section style=\"text-align: center; margin: 10px 0px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.6555556\" data-w=\"1080\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/ab8b002b2fe7b542162fda8fb76a07c0.png\"></section></section></section></section><section style=\"text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.625\" data-w=\"1000\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/3854259a0f09b3f48ce2eaef4d059e71.jpg\"></section></section></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 10px 0px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; line-height: 0; padding: 0px 0px 0px 8px; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid none none solid; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 100 100 0%; height: auto; border-style: solid solid none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1.3; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; padding: 0px 8px 0px 0px; line-height: 0; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid solid none none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 100%; vertical-align: top; align-self: flex-start; flex: 0 0 auto; border-style: none solid; border-width: 1px;  border-color: rgb(255, 199, 106); padding: 5px 25px; box-sizing: border-box;\"><section style=\"display: inline-block; width: 100%; vertical-align: top; overflow-x: auto; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"overflow: hidden; width: 400%; max-width: 400% !important; box-sizing: border-box;\"><section style=\"display: inline-block; position: static; vertical-align: middle; width: 25%; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.625\" data-w=\"1000\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/3854259a0f09b3f48ce2eaef4d059e71.jpg\"></section></section></section><section style=\"display: inline-block; position: static; vertical-align: top; width: 25%; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.625\" data-w=\"1000\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/3854259a0f09b3f48ce2eaef4d059e71.jpg\"></section></section></section><section style=\"display: inline-block; position: static; vertical-align: top; width: 25%; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.625\" data-w=\"1000\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/3854259a0f09b3f48ce2eaef4d059e71.jpg\"></section></section></section><section style=\"display: inline-block; position: static; vertical-align: top; width: 25%; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.625\" data-w=\"1000\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/3854259a0f09b3f48ce2eaef4d059e71.jpg\"></section></section></section></section></section><section style=\"justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 0px 0px -26px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: middle; width: auto; align-self: center; flex: 100 100 0%; height: auto; margin: 0px 0px 0px -25px; box-sizing: border-box;\"><section style=\"text-align: right; font-size: 12px; color: rgb(255, 199, 106); letter-spacing: 2px; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">- 左右滑动</p></section></section><section style=\"display: inline-block; vertical-align: middle; width: auto; align-self: center; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; padding: 0px 15px; box-sizing: border-box;\"><section style=\"text-align: center; margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; width: 50px; height: auto; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1.1240741\" data-w=\"1080\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/1601ddcc0281f2f948093484a9fe4e84.png\"></section></section></section><section style=\"display: inline-block; vertical-align: middle; width: auto; align-self: center; flex: 100 100 0%; height: auto; margin: 0px -25px 0px 0px; box-sizing: border-box;\"><section style=\"font-size: 12px; color: rgb(255, 199, 106); letter-spacing: 2px; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">查看更多 -</p></section></section></section></section></section><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); margin: 0px 0px 10px; position: static; box-sizing: border-box;\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; line-height: 0; padding: 0px 0px 0px 8px; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid none none solid; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 100 100 0%; height: auto; border-style: solid solid none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1.3; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; padding: 0px 8px 0px 0px; line-height: 0; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid solid none none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 10px 0px 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; line-height: 0; padding: 0px 0px 0px 8px; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid none none solid; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 100 100 0%; height: auto; border-style: solid solid none; border-width: 1px;  border-color: rgb(255, 199, 106); background-color: rgb(255, 252, 243); box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1.3; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; padding: 0px 8px 0px 0px; line-height: 0; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid solid none none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 100%; vertical-align: top; align-self: flex-start; flex: 0 0 auto; border-style: none solid; border-width: 1px;  border-color: rgb(255, 199, 106); padding: 5px 25px; background-color: rgb(255, 252, 243); box-sizing: border-box;\"><section style=\"text-align: justify; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\">立秋，是“二十四节气”之第十三个节气，秋季的第一个节气。斗指西南，太阳达黄经135°，于每年公历8月7或8日交节。整个自然界的变化是循序渐进的过程，立秋是阳气渐收、阴气渐长，由阳盛逐渐转变为阴盛的转折。在自然界，万物开始从繁茂成长趋向萧瑟成熟。</p></section><section style=\"justify-content: flex-start; display: flex; flex-flow: row nowrap; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: top; width: 50%; align-self: flex-start; flex: 0 0 auto; padding: 0px 10px 0px 0px; box-sizing: border-box;\"><section style=\"text-align: center; margin: 20px 0px 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1.3269639\" data-w=\"471\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/13904ab87a4ef1336c3d73ec8bbdd682.jpg\"></section></section></section><section style=\"display: inline-block; vertical-align: top; width: 50%; align-self: flex-start; flex: 0 0 auto; padding: 0px 0px 0px 10px; box-sizing: border-box;\"><section style=\"text-align: center; margin: 20px 0px 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1.3269639\" data-w=\"471\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/40ac581d7ded9636dc487347228379d9.jpg\"></section></section></section></section><section style=\"display: flex; width: 100%; flex-flow: column nowrap; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"position: static; z-index: 1; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 0px 0px -26px; position: static; box-sizing: border-box;\"><section style=\"display: inline-block; vertical-align: middle; width: auto; align-self: center; flex: 100 100 0%; height: auto; margin: 0px 0px 0px -25px; box-sizing: border-box;\"><section style=\"text-align: right; font-size: 12px; color: rgb(255, 199, 106); letter-spacing: 2px; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">- 睡起秋声无觅处</p></section></section><section style=\"display: inline-block; vertical-align: middle; width: auto; align-self: center; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; padding: 0px 15px; box-sizing: border-box;\"><section style=\"text-align: center; margin: 0px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; width: 50px; height: auto; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1.1240741\" data-w=\"1080\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/1601ddcc0281f2f948093484a9fe4e84.png\"></section></section></section><section style=\"display: inline-block; vertical-align: middle; width: auto; align-self: center; flex: 100 100 0%; height: auto; margin: 0px -25px 0px 0px; box-sizing: border-box;\"><section style=\"font-size: 12px; color: rgb(255, 199, 106); letter-spacing: 2px; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">满阶梧桐月明中 -</p></section></section></section></section></section></section></section><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); margin: 0px 0px 10px; position: static; box-sizing: border-box;\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; line-height: 0; padding: 0px 0px 0px 8px; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid none none solid; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 100 100 0%; height: auto; border-style: solid solid none; border-width: 1px;  border-color: rgb(255, 199, 106); background-color: rgb(255, 252, 243); box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1.3; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; padding: 0px 8px 0px 0px; line-height: 0; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 10px; height: 10px; vertical-align: top; overflow: hidden; border-style: solid solid none none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 10px 0px; isolation: isolate; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 100 100 0%; height: auto; margin: 0px; background-image: linear-gradient(90deg, rgb(255, 246, 222) 0%, rgba(255, 246, 222, 0) 100%); padding: 0px 0px 0px 15px; border-left: 2px solid rgb(255, 199, 106); border-bottom-left-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; font-size: 18px; color: rgb(255, 199, 106); letter-spacing: 2px; line-height: 1.7; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"text-align: left; margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">立秋三候&nbsp;</strong></p></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; flex: 0 0 0%; height: auto; align-self: flex-end; padding: 0px 12px 0px 0px; box-sizing: border-box;\"><section style=\"text-align: center; margin: 0px 0px -15px; transform: translate3d(13px, 0px, 0px); -webkit-transform: translate3d(13px, 0px, 0px); -moz-transform: translate3d(13px, 0px, 0px); -o-transform: translate3d(13px, 0px, 0px); position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 30px; height: 30px; vertical-align: top; overflow: hidden; border-width: 0px; border-radius: 100%; border-style: none; border-color: rgb(62, 62, 62); background-color: rgb(255, 246, 222); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section><section style=\"text-align: center; margin: 0px; isolation: isolate; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; width: 35px; height: auto; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1.1240741\" data-w=\"1080\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/1601ddcc0281f2f948093484a9fe4e84.png\"></section></section></section></section><section style=\"text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; border-style: solid; border-width: 15px;  border-color: rgb(255, 246, 222); box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"0.625\" data-w=\"1000\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/3854259a0f09b3f48ce2eaef4d059e71.jpg\"></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 0px 0px 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 100%; vertical-align: top; align-self: flex-start; flex: 0 0 auto; background-color: rgb(255, 246, 222); padding: 15px 15px 30px; box-sizing: border-box;\"><section style=\"text-align: justify; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"margin: 0px 0px 10px; white-space: normal; padding: 0px; box-sizing: border-box;\">立秋，是“二十四节气”之第十三个节气，秋季的第一个节气。斗指西南，太阳达黄经135°，于每年公历8月7或8日交节。</p><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\">整个自然界的变化是循序渐进的过程，立秋是阳气渐收、阴气渐长，由阳盛逐渐转变为阴盛的转折。在自然界，万物开始从繁茂成长趋向萧瑟成熟。</p></section></section></section><section style=\"text-align: center; justify-content: center; display: flex; flex-flow: row nowrap; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: auto; vertical-align: top; align-self: flex-start; flex: 0 0 auto; min-width: 5%; max-width: 100%; height: auto; box-sizing: border-box;\"><section style=\"justify-content: center; display: flex; flex-flow: row nowrap; margin: 0px 0px -25px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 40px; vertical-align: top; align-self: flex-start; flex: 0 0 auto; height: auto; box-sizing: border-box;\"><section style=\"position: static; transform: rotateZ(229deg); -webkit-transform: rotateZ(229deg); -moz-transform: rotateZ(229deg); -o-transform: rotateZ(229deg); box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"margin: 0px; position: static; box-sizing: border-box;\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1.0685185\" data-w=\"1080\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/4fee781e03f11f8def0923fbf6cd5d18.png\"></section></section></section></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 0px; isolation: isolate; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; line-height: 0; padding: 0px 0px 0px 5px; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 7px; height: 7px; vertical-align: top; overflow: hidden; border-style: solid none none solid; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 100 100 0%; height: auto; border-style: solid solid none; border-width: 1px;  border-color: rgb(255, 199, 106); background-color: rgba(255, 255, 255, 0.6); box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; padding: 0px 5px 0px 0px; line-height: 0; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 7px; height: 7px; vertical-align: top; overflow: hidden; border-style: solid solid none none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; isolation: isolate; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"display: inline-block; width: 100%; vertical-align: top; align-self: flex-start; flex: 0 0 auto; border-style: none solid; border-width: 1px;  border-color: rgb(255, 199, 106); padding: 0px 25px; background-color: rgba(255, 255, 255, 0.6); box-sizing: border-box;\"><section style=\"text-align: center; font-size: 20px; color: rgb(255, 199, 106); letter-spacing: 2px; line-height: 1; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><strong style=\"box-sizing: border-box;\">· 立秋节气 ·</strong></p></section></section></section><section style=\"position: static; transform: perspective(0px); -webkit-transform: perspective(0px); -moz-transform: perspective(0px); -o-transform: perspective(0px); transform-style: flat; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"text-align: left; justify-content: flex-start; display: flex; flex-flow: row nowrap; margin: 0px 0px 10px; transform: rotateX(180deg); -webkit-transform: rotateX(180deg); -moz-transform: rotateX(180deg); -o-transform: rotateX(180deg); isolation: isolate; position: static; box-sizing: border-box;\"><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; line-height: 0; padding: 0px 0px 0px 5px; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 7px; height: 7px; vertical-align: top; overflow: hidden; border-style: solid none none solid; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 100 100 0%; height: auto; border-style: solid solid none; border-width: 1px;  border-color: rgb(255, 199, 106); background-color: rgba(255, 255, 255, 0.6); box-sizing: border-box;\"><section style=\"text-align: justify; line-height: 1; box-sizing: border-box;\" powered-by=\"xiumi.us\"><p style=\"white-space: normal; margin: 0px; padding: 0px; box-sizing: border-box;\"><br style=\"box-sizing: border-box;\"></p></section></section><section style=\"display: inline-block; vertical-align: bottom; width: auto; align-self: flex-end; flex: 0 0 0%; height: auto; padding: 0px 5px 0px 0px; line-height: 0; border-bottom: 1px solid rgb(255, 199, 106); border-bottom-right-radius: 0px; box-sizing: border-box;\"><section style=\"text-align: center; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section class=\"group-empty\" style=\"display: inline-block; width: 7px; height: 7px; vertical-align: top; overflow: hidden; border-style: solid solid none none; border-width: 1px;  border-color: rgb(255, 199, 106); box-sizing: border-box;\"><svg viewBox=\"0 0 1 1\" style=\"float:left;line-height:0;width:0;vertical-align:top;\"></svg></section></section></section></section></section></section></section><section style=\"text-align: center; margin-top: 10px; margin-bottom: 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"max-width: 100%; vertical-align: middle; display: inline-block; line-height: 0; width: 35%; height: auto; box-sizing: border-box;\"><img class=\"raw-image\" style=\"vertical-align: middle; max-width: 100%; width: 100%; box-sizing: border-box;\" data-ratio=\"1\" data-w=\"258\" _width=\"100%\" src=\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/article/bce5fbd951adf707fe45c65d57785b9b.jpeg\"></section></section><section style=\"text-align: center; margin: 0px 0px 10px; position: static; box-sizing: border-box;\" powered-by=\"xiumi.us\"><section style=\"box-sizing: border-box;\"><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">微信号｜xiumius</p><p style=\"margin: 0px; padding: 0px; box-sizing: border-box;\">新浪微博｜秀米XIUMI<br style=\"box-sizing: border-box;\"></p></section></section></section>',2,NULL,389490915,NULL,2,3);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_directory`
--

DROP TABLE IF EXISTS `article_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_directory` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_directory`
--

LOCK TABLES `article_directory` WRITE;
/*!40000 ALTER TABLE `article_directory` DISABLE KEYS */;
INSERT INTO `article_directory` VALUES (1,'2022-08-05 10:18:27','2022-08-18 10:30:52.918','目3请');
/*!40000 ALTER TABLE `article_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_history`
--

DROP TABLE IF EXISTS `article_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `pic_url` longtext COMMENT '封面URL',
  `title` longtext COMMENT '标题',
  `summary` longtext COMMENT '文章简介',
  `description` longtext COMMENT '内容',
  `typ` bigint DEFAULT '0' COMMENT '文章类别',
  `publish_date_time` datetime(3) DEFAULT NULL COMMENT '发布时间',
  `edit_date_time` datetime(3) DEFAULT NULL COMMENT '编辑时间',
  `article_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_article_histories` (`article_id`),
  CONSTRAINT `fk_article_article_histories` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_history`
--

LOCK TABLES `article_history` WRITE;
/*!40000 ALTER TABLE `article_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `email` longtext COMMENT '邮箱',
  `biz_email` longtext COMMENT '企业邮箱',
  `passport` longtext,
  `password` longtext,
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `sex` bigint unsigned DEFAULT '0' COMMENT '1-男 2-女',
  `can_login` tinyint(1) DEFAULT '1' COMMENT '是否可以登录',
  `department` json DEFAULT NULL COMMENT '部门',
  `main_department` bigint DEFAULT NULL COMMENT '主部门',
  `avatar_path` longtext COMMENT '头像',
  `city` longtext COMMENT '城市',
  `last_login_at` datetime(3) DEFAULT NULL,
  `current_coin_num` bigint DEFAULT '0' COMMENT '当前持有碳币数',
  `total_coin_num` bigint DEFAULT '0' COMMENT '累计持有碳币数',
  `total_reduce_carbon_amt` double DEFAULT '0' COMMENT '累计减碳量',
  `relay_num` bigint unsigned DEFAULT '0' COMMENT '接力次数',
  `typ` bigint unsigned DEFAULT '30' COMMENT '10-超级管理员 30-员工',
  `xiu_mi_partner_user_id` varchar(60) DEFAULT NULL COMMENT '平台用户为秀米生成的唯一ID',
  `xiu_mi_open_id` varchar(60) DEFAULT NULL COMMENT '绑定的秀米平台的用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_auth_user_xiu_mi_partner_user_id` (`xiu_mi_partner_user_id`),
  UNIQUE KEY `idx_auth_user_xiu_mi_open_id` (`xiu_mi_open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,NULL,'2022-09-05 10:17:59.521','root',NULL,NULL,'admin','c8ac00af32e548d5ffe55f77253d1f273c33b2c6251e87726f8099d24df27d17',NULL,1,1,'[]',NULL,'',NULL,NULL,2,2,120,NULL,10,'13bh95ie000clqf9dlc01jg100dz3rxh','dc6e590fffc0c96afc073cf5d4927cd7'),(2,'2022-08-02 13:39:02','2022-09-21 22:19:20.918','李文冠','','liwenguan@qdykkj.wecom.work','lwg','c8ac00af32e548d5ffe55f77253d1f273c33b2c6251e87726f8099d24df27d17','13168356282',1,1,'[1, 4]',1,'http://wework.qpic.cn/bizmail/bicJ4NnWABic3yDWpRyS2T1hwRIvLFsaQ1HuOF5ukXqk9Vb7J9vEuMOw/0',NULL,'2022-09-21 22:19:20.918',1387,1387,252,0,30,'1kba6pr1000clvaum51lxj61000cutzk','99821946ad227b8d6d9cb6438390d97c'),(3,'2022-08-03 18:51:48','2022-08-24 16:56:33.753','郑焜熙','','hee@qdykkj.wecom.work',NULL,NULL,'13925626177',1,1,'[1]',NULL,'https://wework.qpic.cn/wwpic/929221_H8XR3sJ7T6unpCT_1658132119/0','河北省/保定市','2022-08-24 16:54:45.893',142,142,0,0,30,'1kba6pr1000clwc4mfjp2lp10065smdt',NULL),(4,'2022-08-05 09:32:04','2022-09-27 18:45:13.563','陈思思','','cc@qdykkj.wecom.work','css','c8ac00af32e548d5ffe55f77253d1f273c33b2c6251e87726f8099d24df27d17','13715022599',2,1,'[1]',1,'https://wework.qpic.cn/bizmail/6Xcgeia1hOOTL3AHFDeZlOwicyrviauWszZdPc8UYnhcvHEZic4dlLecrg/0','山西省/临汾市','2022-08-26 09:31:42.312',142,142,5,0,30,'1kba6pr1000clxph5gj0d3k100wy9u4i',NULL),(5,'2022-08-05 15:29:05','2022-09-27 18:44:02.765','周富宗','','fengye@qdykkj.wecom.work',NULL,NULL,'13886007507',1,1,'[13, 4]',4,'http://wework.qpic.cn/bizmail/d2KO0Dr8IbTqTy1GHtQARbYw3Z1PPLu7HR7cgkicBBYUDaDUudiayrmQ/0',NULL,'2022-09-09 10:16:59.784',280,280,0,0,30,'1kba6pr1000clxx2ibe1s0g100qjib7f',NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_work_wxa_sso`
--

DROP TABLE IF EXISTS `auth_work_wxa_sso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_work_wxa_sso` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `typ` longtext NOT NULL,
  `corp_id` longtext NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `open_id` longtext COMMENT '关联微信的openId',
  `visit_token` longtext,
  `auth_user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `fk_auth_user_auth_work_wxa_sso` (`auth_user_id`),
  CONSTRAINT `fk_auth_user_auth_work_wxa_sso` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_work_wxa_sso`
--

LOCK TABLES `auth_work_wxa_sso` WRITE;
/*!40000 ALTER TABLE `auth_work_wxa_sso` DISABLE KEYS */;
INSERT INTO `auth_work_wxa_sso` VALUES (1,'2022-08-02 13:39:02','2022-09-21 22:19:21.675','work_wxa','ww3992e416f74ed18a','guan','o7sKN5VpYRNCLThYgh8bofIusZ7k','WqriiM4xnkjyyIG8loNCaw==',2),(2,'2022-08-03 18:51:48','2022-08-24 16:54:46.463','work_wxa','ww3992e416f74ed18a','hee','o7sKN5SxbA5dCWi9FOthoLkNGUW0','4GBfP6nmpuCA0JRmR6AX2A==',3),(3,'2022-08-05 09:32:04','2022-08-26 09:31:42.899','work_wxa','ww3992e416f74ed18a','cc','o7sKN5UqiiaPiR6CROkSvGCaGRPw','cEmN7sTV09VkiclMSEcXWQ==',4),(4,'2022-08-05 15:29:05','2022-09-09 10:17:00.565','work_wxa','ww3992e416f74ed18a','FengYe','o7sKN5TSZKEYTiZfjl90Xqio3YlY','+BW3DMUbFD2mRtDnpdcuFQ==',5);
/*!40000 ALTER TABLE `auth_work_wxa_sso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carbon_link_volunteer`
--

DROP TABLE IF EXISTS `carbon_link_volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbon_link_volunteer` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `wx_user_id` longtext COMMENT '企业微信UserId',
  `phone` longtext COMMENT '手机号',
  `msg_id` varchar(128) DEFAULT NULL COMMENT '消息ID',
  `res_code` bigint DEFAULT NULL,
  `res_msg` longtext,
  `coin_amt` bigint DEFAULT NULL,
  `coin_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_carbon_link_volunteer_msg_id` (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbon_link_volunteer`
--

LOCK TABLES `carbon_link_volunteer` WRITE;
/*!40000 ALTER TABLE `carbon_link_volunteer` DISABLE KEYS */;
/*!40000 ALTER TABLE `carbon_link_volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casbin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  `v6` varchar(25) DEFAULT NULL,
  `v7` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`,`v6`,`v7`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coin_record`
--

DROP TABLE IF EXISTS `coin_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coin_record` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `auth_user_id` bigint unsigned DEFAULT NULL,
  `ref_id` bigint unsigned DEFAULT NULL COMMENT '关联ID,channel 为打卡活动: 打卡记录ID',
  `amt` bigint DEFAULT NULL,
  `channel` bigint unsigned DEFAULT NULL COMMENT '获取渠道',
  `description` longtext COMMENT '补充描述',
  `status` bigint DEFAULT '0' COMMENT '状态 0-正常获取 1-碳币回退记录 2-碳币回退源标识',
  `total_amt` bigint DEFAULT '0' COMMENT '累计碳币数量',
  `current_amt` bigint DEFAULT '0' COMMENT '当前碳币数量',
  `detail` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_auth_user_coin_records` (`auth_user_id`),
  CONSTRAINT `fk_auth_user_coin_records` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coin_record`
--

LOCK TABLES `coin_record` WRITE;
/*!40000 ALTER TABLE `coin_record` DISABLE KEYS */;
INSERT INTO `coin_record` VALUES (1,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,1,0,7,NULL,0,0,0,NULL),(2,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,2,0,7,NULL,0,0,0,NULL),(3,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,3,0,7,NULL,0,0,0,NULL),(4,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,4,0,7,NULL,0,0,0,NULL),(5,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,5,0,7,NULL,0,0,0,NULL),(6,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,6,0,7,NULL,0,0,0,NULL),(7,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,7,0,7,NULL,0,0,0,NULL),(8,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,8,0,7,NULL,0,0,0,NULL),(9,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,9,0,7,NULL,0,0,0,NULL),(10,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,10,0,7,NULL,0,0,0,NULL),(11,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,11,0,7,NULL,0,0,0,NULL),(12,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,12,0,7,NULL,0,0,0,NULL),(13,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,13,0,7,NULL,0,0,0,NULL),(14,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,14,0,7,NULL,0,0,0,NULL),(15,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,15,0,7,NULL,0,0,0,NULL),(16,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,16,0,7,NULL,0,0,0,NULL),(17,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,17,0,7,NULL,0,0,0,NULL),(18,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,18,5,7,NULL,0,5,5,NULL),(19,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,19,6,7,NULL,0,11,11,NULL),(20,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,20,1,7,NULL,0,12,12,NULL),(21,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,21,2,7,NULL,0,14,14,NULL),(22,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,22,6,7,NULL,0,20,20,NULL),(23,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,23,5,7,NULL,0,25,25,NULL),(24,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,24,6,7,NULL,0,31,31,NULL),(25,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,25,6,7,NULL,0,37,37,NULL),(26,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,26,4,7,NULL,0,41,41,NULL),(27,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,27,0,7,NULL,0,41,41,NULL),(28,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,28,1,7,NULL,0,42,42,NULL),(29,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,29,4,7,NULL,0,46,46,NULL),(30,'2022-08-03 18:51:49','2022-08-03 18:51:49.083',3,30,5,7,NULL,0,51,51,NULL),(31,'2022-08-04 18:37:22','2022-08-04 18:37:21.731',2,NULL,2000,3,NULL,0,2000,2000,NULL),(32,'2022-08-05 09:19:12','2022-08-05 09:19:12.063',2,NULL,-2000,4,NULL,0,0,0,NULL),(33,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,31,0,7,NULL,0,0,0,NULL),(34,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,32,0,7,NULL,0,0,0,NULL),(35,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,33,0,7,NULL,0,0,0,NULL),(36,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,34,0,7,NULL,0,0,0,NULL),(37,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,35,0,7,NULL,0,0,0,NULL),(38,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,36,0,7,NULL,0,0,0,NULL),(39,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,37,4,7,NULL,0,4,4,NULL),(40,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,38,3,7,NULL,0,7,7,NULL),(41,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,39,0,7,NULL,0,7,7,NULL),(42,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,40,2,7,NULL,0,9,9,NULL),(43,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,41,6,7,NULL,0,15,15,NULL),(44,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,42,5,7,NULL,0,20,20,NULL),(45,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,43,6,7,NULL,0,26,26,NULL),(46,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,44,3,7,NULL,0,29,29,NULL),(47,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,45,3,7,NULL,0,32,32,NULL),(48,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,46,4,7,NULL,0,36,36,NULL),(49,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,47,8,7,NULL,0,44,44,NULL),(50,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,48,1,7,NULL,0,45,45,NULL),(51,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,49,2,7,NULL,0,47,47,NULL),(52,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,50,1,7,NULL,0,48,48,NULL),(53,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,51,1,7,NULL,0,49,49,NULL),(54,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,52,2,7,NULL,0,51,51,NULL),(55,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,53,3,7,NULL,0,54,54,NULL),(56,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,54,0,7,NULL,0,54,54,NULL),(57,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,55,0,7,NULL,0,54,54,NULL),(58,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,56,0,7,NULL,0,54,54,NULL),(59,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,57,0,7,NULL,0,54,54,NULL),(60,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,58,0,7,NULL,0,54,54,NULL),(61,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,59,0,7,NULL,0,54,54,NULL),(62,'2022-08-05 09:32:06','2022-08-05 09:32:05.514',4,60,4,7,NULL,0,58,58,NULL),(63,'2022-08-05 10:03:24','2022-08-05 10:03:24.215',4,NULL,-58,4,NULL,0,0,0,NULL),(64,'2022-08-05 10:05:07','2022-08-05 10:05:07.431',4,2,2,13,NULL,0,2,2,NULL),(65,'2022-08-05 10:25:09','2022-08-05 10:25:08.552',4,NULL,2,8,NULL,0,4,4,NULL),(66,'2022-08-05 10:25:11','2022-08-05 10:25:11.293',4,NULL,2,8,NULL,0,6,6,NULL),(67,'2022-08-05 10:26:18','2022-08-05 10:26:17.650',3,61,6,7,NULL,0,57,57,NULL),(68,'2022-08-05 10:26:18','2022-08-05 10:26:17.650',3,62,6,7,NULL,0,63,63,NULL),(69,'2022-08-05 10:57:37','2022-08-05 10:57:37.123',4,NULL,1,12,NULL,0,7,7,NULL),(70,'2022-08-05 10:57:37','2022-08-05 10:57:37.128',3,NULL,1,12,NULL,0,64,64,NULL),(71,'2022-08-05 11:11:44','2022-08-05 11:11:44.274',3,2,4,9,NULL,0,68,68,NULL),(72,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,63,4,7,NULL,0,4,4,NULL),(73,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,64,5,7,NULL,0,9,9,NULL),(74,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,65,5,7,NULL,0,14,14,NULL),(75,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,66,2,7,NULL,0,16,16,NULL),(76,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,67,2,7,NULL,0,18,18,NULL),(77,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,68,5,7,NULL,0,23,23,NULL),(78,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,69,4,7,NULL,0,27,27,NULL),(79,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,70,5,7,NULL,0,32,32,NULL),(80,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,71,4,7,NULL,0,36,36,NULL),(81,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,72,3,7,NULL,0,39,39,NULL),(82,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,73,5,7,NULL,0,44,44,NULL),(83,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,74,6,7,NULL,0,50,50,NULL),(84,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,75,5,7,NULL,0,55,55,NULL),(85,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,76,5,7,NULL,0,60,60,NULL),(86,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,77,5,7,NULL,0,65,65,NULL),(87,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,78,5,7,NULL,0,70,70,NULL),(88,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,79,5,7,NULL,0,75,75,NULL),(89,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,80,3,7,NULL,0,78,78,NULL),(90,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,81,3,7,NULL,0,81,81,NULL),(91,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,82,3,7,NULL,0,84,84,NULL),(92,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,83,3,7,NULL,0,87,87,NULL),(93,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,84,4,7,NULL,0,91,91,NULL),(94,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,85,4,7,NULL,0,95,95,NULL),(95,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,86,3,7,NULL,0,98,98,NULL),(96,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,87,12,7,NULL,0,110,110,NULL),(97,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,88,7,7,NULL,0,117,117,NULL),(98,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,89,4,7,NULL,0,121,121,NULL),(99,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,90,4,7,NULL,0,125,125,NULL),(100,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,91,5,7,NULL,0,130,130,NULL),(101,'2022-08-05 15:29:07','2022-08-05 15:29:06.711',5,92,3,7,NULL,0,133,133,NULL),(102,'2022-08-08 11:30:41','2022-08-08 11:30:40.687',5,93,3,7,NULL,0,136,136,NULL),(103,'2022-08-08 11:30:41','2022-08-08 11:30:40.687',5,94,5,7,NULL,0,141,141,NULL),(104,'2022-08-08 11:30:41','2022-08-08 11:30:40.687',5,95,3,7,NULL,0,144,144,NULL),(105,'2022-08-08 13:36:01','2022-08-08 13:36:00.786',4,96,6,7,NULL,0,13,13,NULL),(106,'2022-08-08 13:36:01','2022-08-08 13:36:00.786',4,97,8,7,NULL,0,21,21,NULL),(107,'2022-08-08 13:36:01','2022-08-08 13:36:00.786',4,98,8,7,NULL,0,29,29,NULL),(108,'2022-08-08 16:10:51','2022-08-08 16:10:51.063',2,NULL,1000,3,NULL,0,1000,1000,NULL),(109,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,99,3,7,NULL,0,1003,1003,NULL),(110,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,100,4,7,NULL,0,1007,1007,NULL),(111,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,101,6,7,NULL,0,1013,1013,NULL),(112,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,102,4,7,NULL,0,1017,1017,NULL),(113,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,103,5,7,NULL,0,1022,1022,NULL),(114,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,104,4,7,NULL,0,1026,1026,NULL),(115,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,105,4,7,NULL,0,1030,1030,NULL),(116,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,106,2,7,NULL,0,1032,1032,NULL),(117,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,107,10,7,NULL,0,1042,1042,NULL),(118,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,108,5,7,NULL,0,1047,1047,NULL),(119,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,109,7,7,NULL,0,1054,1054,NULL),(120,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,110,3,7,NULL,0,1057,1057,NULL),(121,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,111,5,7,NULL,0,1062,1062,NULL),(122,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,112,6,7,NULL,0,1068,1068,NULL),(123,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,113,4,7,NULL,0,1072,1072,NULL),(124,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,114,2,7,NULL,0,1074,1074,NULL),(125,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,115,3,7,NULL,0,1077,1077,NULL),(126,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,116,4,7,NULL,0,1081,1081,NULL),(127,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,117,4,7,NULL,0,1085,1085,NULL),(128,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,118,3,7,NULL,0,1088,1088,NULL),(129,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,119,4,7,NULL,0,1092,1092,NULL),(130,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,120,11,7,NULL,0,1103,1103,NULL),(131,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,121,8,7,NULL,0,1111,1111,NULL),(132,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,122,3,7,NULL,0,1114,1114,NULL),(133,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,123,4,7,NULL,0,1118,1118,NULL),(134,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,124,4,7,NULL,0,1122,1122,NULL),(135,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,125,3,7,NULL,0,1125,1125,NULL),(136,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,126,3,7,NULL,0,1128,1128,NULL),(137,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,127,6,7,NULL,0,1134,1134,NULL),(138,'2022-08-08 16:22:33','2022-08-08 16:22:33.126',2,128,6,7,NULL,0,1140,1140,NULL),(139,'2022-08-08 16:36:39','2022-08-08 16:36:38.570',2,1,1,2,'活动1',0,1141,1141,NULL),(140,'2022-08-08 16:40:44','2022-08-08 16:40:43.824',2,2,1,2,'活动1',0,1142,1142,NULL),(141,'2022-08-08 16:41:04','2022-08-08 16:41:04.090',2,3,1,2,'活动1',0,1143,1143,NULL),(142,'2022-08-08 16:41:25','2022-08-08 16:41:24.783',2,4,1,2,'活动1',0,1144,1144,NULL),(143,'2022-08-08 16:41:43','2022-08-08 16:41:43.313',2,5,1,2,'活动1',0,1145,1145,NULL),(144,'2022-08-08 16:42:08','2022-08-08 16:42:07.685',2,6,1,2,'活动1',0,1146,1146,NULL),(145,'2022-08-08 16:42:24','2022-08-08 16:42:23.971',2,7,1,2,'活动1',0,1147,1147,NULL),(146,'2022-08-08 16:47:50','2022-08-08 16:47:49.502',2,8,1,2,'活动1',0,1148,1148,NULL),(147,'2022-08-08 16:48:13','2022-08-08 16:48:12.741',2,9,1,2,'活动1',0,1149,1149,NULL),(148,'2022-08-08 16:48:30','2022-08-08 16:48:29.502',2,10,1,2,'活动1',0,1150,1150,NULL),(149,'2022-08-08 17:02:05','2022-08-08 17:02:05.102',1,12,1,2,'活动1',0,1,1,NULL),(150,'2022-08-08 17:02:13','2022-08-08 17:02:13.180',1,13,1,2,'活动1',0,2,2,NULL),(151,'2022-08-08 17:05:13','2022-08-08 17:05:13.206',2,2,3,14,NULL,0,1153,1153,NULL),(152,'2022-08-08 17:31:00','2022-08-08 17:31:00.294',2,5,2,13,NULL,0,1155,1155,NULL),(153,'2022-08-08 17:52:53','2022-08-08 17:52:53.403',2,4,3,14,NULL,0,1158,1158,NULL),(154,'2022-08-09 15:21:18','2022-08-09 15:21:17.661',2,129,3,7,NULL,0,1161,1161,NULL),(155,'2022-08-09 15:27:39','2022-08-09 15:27:38.620',4,130,5,7,NULL,0,34,34,NULL),(156,'2022-08-10 13:59:15','2022-08-10 13:59:14.586',4,131,4,7,NULL,0,38,38,NULL),(157,'2022-08-10 15:38:43','2022-08-10 15:38:42.919',5,132,4,7,NULL,0,148,148,NULL),(158,'2022-08-10 15:38:43','2022-08-10 15:38:42.919',5,133,5,7,NULL,0,153,153,NULL),(159,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,134,6,7,NULL,0,74,74,NULL),(160,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,135,0,7,NULL,0,74,74,NULL),(161,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,136,1,7,NULL,0,75,75,NULL),(162,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,137,5,7,NULL,0,80,80,NULL),(163,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,138,6,7,NULL,0,86,86,NULL),(164,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,139,4,7,NULL,0,90,90,NULL),(165,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,140,5,7,NULL,0,95,95,NULL),(166,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,141,4,7,NULL,0,99,99,NULL),(167,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,142,4,7,NULL,0,103,103,NULL),(168,'2022-08-15 14:26:11','2022-08-15 14:26:10.630',3,143,1,7,NULL,0,104,104,NULL),(169,'2022-08-16 17:21:04','2022-08-16 17:21:03.958',5,144,3,7,NULL,0,156,156,NULL),(170,'2022-08-16 17:21:04','2022-08-16 17:21:03.958',5,145,4,7,NULL,0,160,160,NULL),(171,'2022-08-16 17:21:04','2022-08-16 17:21:03.958',5,146,5,7,NULL,0,165,165,NULL),(172,'2022-08-16 17:21:04','2022-08-16 17:21:03.958',5,147,4,7,NULL,0,169,169,NULL),(173,'2022-08-16 17:21:04','2022-08-16 17:21:03.958',5,148,9,7,NULL,0,178,178,NULL),(174,'2022-08-16 17:21:04','2022-08-16 17:21:03.958',5,149,4,7,NULL,0,182,182,NULL),(175,'2022-08-17 16:50:25','2022-08-17 16:50:24.888',4,150,5,7,NULL,0,43,43,NULL),(176,'2022-08-17 16:50:25','2022-08-17 16:50:24.888',4,151,6,7,NULL,0,49,49,NULL),(177,'2022-08-17 16:50:25','2022-08-17 16:50:24.888',4,152,4,7,NULL,0,53,53,NULL),(178,'2022-08-17 16:50:25','2022-08-17 16:50:24.888',4,153,9,7,NULL,0,62,62,NULL),(179,'2022-08-17 16:50:25','2022-08-17 16:50:24.888',4,154,5,7,NULL,0,67,67,NULL),(180,'2022-08-17 16:50:25','2022-08-17 16:50:24.888',4,155,5,7,NULL,0,72,72,NULL),(181,'2022-08-17 16:50:25','2022-08-17 16:50:24.888',4,156,4,7,NULL,0,76,76,NULL),(182,'2022-08-17 17:02:45','2022-08-17 17:02:44.541',3,157,5,7,NULL,0,109,109,NULL),(183,'2022-08-17 17:02:45','2022-08-17 17:02:44.541',3,158,4,7,NULL,0,113,113,NULL),(184,'2022-08-18 10:09:21','2022-08-18 10:09:20.904',4,159,3,7,NULL,0,79,79,NULL),(185,'2022-08-23 09:56:36','2022-08-23 09:56:36.274',4,160,11,7,NULL,0,90,90,NULL),(186,'2022-08-23 09:56:36','2022-08-23 09:56:36.274',4,161,6,7,NULL,0,96,96,NULL),(187,'2022-08-23 09:56:36','2022-08-23 09:56:36.274',4,162,3,7,NULL,0,99,99,NULL),(188,'2022-08-23 09:56:36','2022-08-23 09:56:36.274',4,163,6,7,NULL,0,105,105,NULL),(189,'2022-08-23 09:56:36','2022-08-23 09:56:36.274',4,164,3,7,NULL,0,108,108,NULL),(190,'2022-08-23 11:56:44','2022-08-23 11:56:43.860',4,4,1,9,NULL,0,109,109,NULL),(191,'2022-08-23 11:58:44','2022-08-23 11:58:43.824',3,165,4,7,NULL,0,117,117,NULL),(192,'2022-08-23 11:58:44','2022-08-23 11:58:43.824',3,166,5,7,NULL,0,122,122,NULL),(193,'2022-08-23 11:58:44','2022-08-23 11:58:43.824',3,167,5,7,NULL,0,127,127,NULL),(194,'2022-08-23 11:58:44','2022-08-23 11:58:43.824',3,168,0,7,NULL,0,127,127,NULL),(195,'2022-08-23 11:58:44','2022-08-23 11:58:43.824',3,169,2,7,NULL,0,129,129,NULL),(196,'2022-08-23 11:58:44','2022-08-23 11:58:43.824',3,170,6,7,NULL,0,135,135,NULL),(197,'2022-08-23 11:59:00','2022-08-23 11:59:00.091',3,5,1,9,NULL,0,136,136,NULL),(198,'2022-08-24 09:25:38','2022-08-24 09:25:38.114',4,171,4,7,NULL,0,113,113,NULL),(199,'2022-08-24 16:35:57','2022-08-24 16:35:57.191',4,7,1,9,NULL,0,114,114,NULL),(200,'2022-08-24 16:35:58','2022-08-24 16:35:58.340',4,7,7,10,NULL,0,121,121,NULL),(201,'2022-08-24 16:47:25','2022-08-24 16:47:24.671',4,NULL,2,8,NULL,0,123,123,NULL),(202,'2022-08-24 16:48:42','2022-08-24 16:48:42.117',3,172,5,7,NULL,0,141,141,NULL),(203,'2022-08-24 16:56:34','2022-08-24 16:56:33.754',3,NULL,1,12,NULL,0,142,142,NULL),(204,'2022-08-24 16:56:34','2022-08-24 16:56:33.758',4,NULL,2,12,NULL,0,125,125,NULL),(205,'2022-08-25 16:19:11','2022-08-25 16:19:10.877',4,173,5,7,NULL,0,130,130,NULL),(206,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,174,4,7,NULL,0,1165,1165,NULL),(207,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,175,4,7,NULL,0,1169,1169,NULL),(208,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,176,7,7,NULL,0,1176,1176,NULL),(209,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,177,4,7,NULL,0,1180,1180,NULL),(210,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,178,10,7,NULL,0,1190,1190,NULL),(211,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,179,4,7,NULL,0,1194,1194,NULL),(212,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,180,3,7,NULL,0,1197,1197,NULL),(213,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,181,3,7,NULL,0,1200,1200,NULL),(214,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,182,4,7,NULL,0,1204,1204,NULL),(215,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,183,4,7,NULL,0,1208,1208,NULL),(216,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,184,3,7,NULL,0,1211,1211,NULL),(217,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,185,5,7,NULL,0,1216,1216,NULL),(218,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,186,2,7,NULL,0,1218,1218,NULL),(219,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,187,4,7,NULL,0,1222,1222,NULL),(220,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,188,3,7,NULL,0,1225,1225,NULL),(221,'2022-08-25 18:05:41','2022-08-25 18:05:41.219',2,189,5,7,NULL,0,1230,1230,NULL),(222,'2022-08-26 09:17:39','2022-08-26 09:17:38.850',4,190,4,7,NULL,0,134,134,NULL),(223,'2022-08-26 09:33:35','2022-08-26 09:33:34.980',4,4,3,14,NULL,0,137,137,NULL),(224,'2022-08-26 09:36:16','2022-08-26 09:36:16.427',4,NULL,2,1,NULL,0,139,139,NULL),(225,'2022-08-26 09:41:35','2022-08-26 09:41:35.292',4,16,1,2,'活动',0,140,140,NULL),(226,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,191,4,7,NULL,0,186,186,NULL),(227,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,192,3,7,NULL,0,189,189,NULL),(228,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,193,4,7,NULL,0,193,193,NULL),(229,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,194,3,7,NULL,0,196,196,NULL),(230,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,195,6,7,NULL,0,202,202,NULL),(231,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,196,9,7,NULL,0,211,211,NULL),(232,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,197,8,7,NULL,0,219,219,NULL),(233,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,198,5,7,NULL,0,224,224,NULL),(234,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,199,1,7,NULL,0,225,225,NULL),(235,'2022-08-26 15:29:24','2022-08-26 15:29:23.957',5,200,1,7,NULL,0,226,226,NULL),(236,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,201,5,7,NULL,0,231,231,NULL),(237,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,202,4,7,NULL,0,235,235,NULL),(238,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,203,2,7,NULL,0,237,237,NULL),(239,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,204,7,7,NULL,0,244,244,NULL),(240,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,205,4,7,NULL,0,248,248,NULL),(241,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,206,3,7,NULL,0,251,251,NULL),(242,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,207,4,7,NULL,0,255,255,NULL),(243,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,208,3,7,NULL,0,258,258,NULL),(244,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,209,1,7,NULL,0,259,259,NULL),(245,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,210,1,7,NULL,0,260,260,NULL),(246,'2022-09-06 13:40:57','2022-09-06 13:40:57.231',5,211,3,7,NULL,0,263,263,NULL),(247,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,212,5,7,NULL,0,1235,1235,NULL),(248,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,213,4,7,NULL,0,1239,1239,NULL),(249,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,214,6,7,NULL,0,1245,1245,NULL),(250,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,215,8,7,NULL,0,1253,1253,NULL),(251,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,216,14,7,NULL,0,1267,1267,NULL),(252,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,217,6,7,NULL,0,1273,1273,NULL),(253,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,218,3,7,NULL,0,1276,1276,NULL),(254,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,219,4,7,NULL,0,1280,1280,NULL),(255,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,220,4,7,NULL,0,1284,1284,NULL),(256,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,221,2,7,NULL,0,1286,1286,NULL),(257,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,222,1,7,NULL,0,1287,1287,NULL),(258,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,223,3,7,NULL,0,1290,1290,NULL),(259,'2022-09-07 13:39:55','2022-09-07 13:39:54.635',2,224,5,7,NULL,0,1295,1295,NULL),(260,'2022-09-09 09:59:25','2022-09-09 09:59:25.156',2,225,5,7,NULL,0,1300,1300,NULL),(261,'2022-09-09 09:59:25','2022-09-09 09:59:25.156',2,226,4,7,NULL,0,1304,1304,NULL),(262,'2022-09-09 10:03:12','2022-09-09 10:03:12.411',2,NULL,2,8,NULL,0,1306,1306,NULL),(263,'2022-09-09 10:03:52','2022-09-09 10:03:52.088',5,227,4,7,NULL,0,267,267,NULL),(264,'2022-09-09 10:03:52','2022-09-09 10:03:52.088',5,228,4,7,NULL,0,271,271,NULL),(265,'2022-09-09 10:03:52','2022-09-09 10:03:52.088',5,229,4,7,NULL,0,275,275,NULL),(266,'2022-09-09 10:06:58','2022-09-09 10:06:57.665',5,NULL,2,8,NULL,0,277,277,NULL),(267,'2022-09-09 10:11:34','2022-09-09 10:11:34.360',5,NULL,2,8,NULL,0,279,279,NULL),(268,'2022-09-09 10:17:53','2022-09-09 10:17:52.814',2,NULL,3,8,'签到',0,1309,1309,NULL),(269,'2022-09-09 10:18:09','2022-09-09 10:18:09.113',2,NULL,3,8,'签退',0,1312,1312,NULL),(270,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,230,6,7,NULL,0,1318,1318,NULL),(271,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,231,12,7,NULL,0,1330,1330,NULL),(272,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,232,4,7,NULL,0,1334,1334,NULL),(273,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,233,4,7,NULL,0,1338,1338,NULL),(274,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,234,4,7,NULL,0,1342,1342,NULL),(275,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,235,8,7,NULL,0,1350,1350,NULL),(276,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,236,6,7,NULL,0,1356,1356,NULL),(277,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,237,7,7,NULL,0,1363,1363,NULL),(278,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,238,7,7,NULL,0,1370,1370,NULL),(279,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,239,10,7,NULL,0,1380,1380,NULL),(280,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,240,4,7,NULL,0,1384,1384,NULL),(281,'2022-09-21 21:26:07','2022-09-21 21:26:06.688',2,241,3,7,NULL,0,1387,1387,NULL),(282,'2022-09-27 18:44:03','2022-09-27 18:44:02.766',5,NULL,1,3,NULL,0,280,280,NULL),(283,'2022-09-27 18:44:03','2022-09-27 18:44:02.769',4,NULL,1,3,NULL,0,141,141,NULL),(284,'2022-09-27 18:45:14','2022-09-27 18:45:13.564',4,NULL,1,3,NULL,0,142,142,NULL);
/*!40000 ALTER TABLE `coin_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coin_risk`
--

DROP TABLE IF EXISTS `coin_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coin_risk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `auth_user_id` bigint unsigned DEFAULT NULL,
  `content` longtext COMMENT '预警提示',
  `description` longtext COMMENT '活动名称',
  `coin_channel` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_coin_risk_auth_user` (`auth_user_id`),
  CONSTRAINT `fk_coin_risk_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coin_risk`
--

LOCK TABLES `coin_risk` WRITE;
/*!40000 ALTER TABLE `coin_risk` DISABLE KEYS */;
INSERT INTO `coin_risk` VALUES (1,'2022-08-08 16:48:29','2022-08-08 16:48:29.327',2,'今日参与活动1次数已达到10次,将不再获得碳币奖励。','活动1',2);
/*!40000 ALTER TABLE `coin_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coin_rule`
--

DROP TABLE IF EXISTS `coin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `typ` bigint unsigned DEFAULT NULL COMMENT '规则类型 1-签到',
  `rules` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_coin_rule_typ` (`typ`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coin_rule`
--

LOCK TABLES `coin_rule` WRITE;
/*!40000 ALTER TABLE `coin_rule` DISABLE KEYS */;
INSERT INTO `coin_rule` VALUES (1,'2022-05-21 15:13:01','2022-07-21 17:17:53.847',1,'[{\"Item\": \"签到获得碳币\", \"Label\": \"Tag\", \"Value\": 2, \"Children\": []}, {\"Item\": \"累计签到七天\", \"Label\": \"TotalTag\", \"Value\": 5, \"Children\": []}]'),(2,'2022-05-23 11:34:31','2022-08-25 13:46:20.423',2,'[{\"Item\": \"活动1\", \"Label\": \"1\", \"Value\": 1, \"Children\": null}, {\"Item\": \"活动\", \"Label\": \"2\", \"Value\": 1, \"Children\": null}, {\"Item\": \"居家办公\", \"Label\": \"3\", \"Value\": 14, \"Children\": []}]'),(5,'2022-07-04 21:22:34','2022-08-06 15:48:34.600',3,'[{\"Item\": \"接力分享\", \"Label\": \"Share\", \"Value\": 1, \"Children\": []}]'),(6,'2022-07-04 09:51:00','2022-07-19 10:33:14.881',4,'[{\"Item\": \"每1000步\", \"Label\": \"Step\", \"Value\": 1, \"Children\": []}, {\"Item\": \"上限步数\", \"Label\": \"StepUpper\", \"Value\": 30000, \"Children\": []}]'),(7,'2022-07-07 20:36:49','2022-07-21 17:17:59.965',5,'[{\"Item\": \"活动通过\", \"Label\": \"Offline\", \"Value\": 2, \"Children\": []}, {\"Item\": \"签到\", \"Label\": \"SignIn\", \"Value\": 3, \"Children\": []}, {\"Item\": \"签退\", \"Label\": \"SignOut\", \"Value\": 3, \"Children\": []}]'),(8,'2022-07-11 18:03:37','2022-07-22 14:22:36.468',6,'[{\"Item\": \"反馈类\", \"Label\": \"FeedBack\", \"Value\": 1, \"Children\": [{\"Item\": \"简单\", \"Label\": \"One\", \"Value\": 1, \"Children\": []}, {\"Item\": \"中等\", \"Label\": \"Second\", \"Value\": 2, \"Children\": []}, {\"Item\": \"困难\", \"Label\": \"Third\", \"Value\": 3, \"Children\": []}]}, {\"Item\": \"非反馈类\", \"Label\": \"NotFeedBack\", \"Value\": 2, \"Children\": [{\"Item\": \"简单\", \"Label\": \"One\", \"Value\": 4, \"Children\": []}, {\"Item\": \"中等\", \"Label\": \"Second\", \"Value\": 5, \"Children\": []}, {\"Item\": \"困难\", \"Label\": \"Third\", \"Value\": 6, \"Children\": []}]}, {\"Item\": \"互动类\", \"Label\": \"Interactive\", \"Value\": 3, \"Children\": [{\"Item\": \"置顶\", \"Label\": \"One\", \"Value\": 7, \"Children\": []}, {\"Item\": \"点赞\", \"Label\": \"Second\", \"Value\": 1, \"Children\": []}, {\"Item\": \"评论\", \"Label\": \"Third\", \"Value\": 1, \"Children\": []}]}]'),(9,'2022-07-18 21:12:22','2022-08-06 15:52:31.214',7,'[{\"Item\": \"卖出获得\", \"Label\": \"Sell\", \"Value\": 2, \"Children\": []}, {\"Item\": \"购买获得\", \"Label\": \"Buy\", \"Value\": 1, \"Children\": []}]'),(10,'2022-07-20 10:58:31','2022-07-25 14:40:02.587',8,'[{\"Item\": \"金点子\", \"Label\": \"GoldenIdea\", \"Value\": 2, \"Children\": []}]'),(11,'2022-07-20 14:14:01','2022-08-06 15:51:31.098',9,'[{\"Item\": \"阅读资讯\", \"Label\": \"ReadNews\", \"Value\": 3, \"Children\": []}]');
/*!40000 ALTER TABLE `coin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customize_activity`
--

DROP TABLE IF EXISTS `customize_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customize_activity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `description` longtext COMMENT '活动描述',
  `cover` longtext COMMENT '活动封面',
  `status` bigint DEFAULT '0' COMMENT '活动状态 0-未开始  1-活动中 2-已结束 3-已下线 ',
  `typ` bigint NOT NULL COMMENT '活动类型 0-反馈类 1-非反馈类 2-互动类',
  `level` bigint DEFAULT NULL COMMENT '活动难度 0-简单/置顶 1-中等/点赞 2-困难/评论',
  `start_date_time` datetime(3) NOT NULL COMMENT '开始时间',
  `end_date_time` datetime(3) NOT NULL COMMENT '结束时间',
  `priority` datetime(3) DEFAULT NULL COMMENT '用于排序的优先级',
  `notify_end` tinyint(1) DEFAULT '0' COMMENT '是否已经提醒结束消息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_customize_activity_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customize_activity`
--

LOCK TABLES `customize_activity` WRITE;
/*!40000 ALTER TABLE `customize_activity` DISABLE KEYS */;
INSERT INTO `customize_activity` VALUES (1,'2022-08-05 09:47:34','2022-08-18 14:20:37.467','1111','111','/activity/record/2da8158ab9225a6604920a3375662fbf.png',3,0,0,'2022-08-05 09:48:00.000','2022-08-28 00:59:00.000','2022-08-18 14:20:17.968',0),(2,'2022-08-05 11:08:37','2022-08-17 18:29:18.666','222','222','/activity/record/67f73b7297cafc766f16b4457e86401d.png',3,1,0,'2022-08-05 11:09:00.000','2022-08-21 11:08:00.000','2022-08-16 18:42:11.218',0),(3,'2022-08-05 11:08:51','2022-08-16 17:24:00.603','333','3333','/activity/record/67f73b7297cafc766f16b4457e86401d.png',2,2,NULL,'2022-08-05 11:09:00.000','2022-08-16 17:24:00.000',NULL,0),(4,'2022-08-16 16:55:36','2022-08-18 14:08:53.130','活动','活动222','/activity/record/f0dcf7ecd1a4b83e3fb9ec29856f0311.jpg',3,0,2,'2022-08-17 23:55:00.000','2022-08-25 16:59:00.000','2022-08-18 14:08:52.463',1),(5,'2022-08-16 18:42:30','2022-08-18 14:08:46.500','222222222222','Cc测试2','/activity/record/8ad2a9d743a7877019885cafaeec24bb.png',3,0,2,'2022-08-16 22:47:00.000','2022-08-19 18:46:00.000','2022-08-18 14:08:45.527',0),(6,'2022-08-16 18:43:29','2022-08-28 18:43:00.178','测试21111','2222222222','/activity/record/8ad2a9d743a7877019885cafaeec24bb.png',2,1,2,'2022-08-26 18:43:00.000','2022-08-28 18:43:00.000',NULL,1),(7,'2022-08-18 10:30:34','2022-08-18 11:00:00.282','ccccccccccc','Cc测试2','/activity/record/8ad2a9d743a7877019885cafaeec24bb.png',2,1,2,'2022-08-18 10:31:00.000','2022-08-18 11:00:00.000','2022-08-18 10:48:55.116',0),(8,'2022-08-18 14:21:29','2022-08-18 15:00:00.986','测试一下','w','/activity/record/8ad2a9d743a7877019885cafaeec24bb.png',2,1,2,'2022-08-18 14:22:00.000','2022-08-18 15:00:00.000','2022-08-18 14:21:29.050',0),(10,'2022-08-23 11:51:12','2022-08-24 11:50:00.958','cc互动','2222222222','/activity/record/8ad2a9d743a7877019885cafaeec24bb.png',2,2,NULL,'2022-08-23 11:52:00.000','2022-08-24 11:50:00.000','2022-08-23 11:51:11.982',0),(11,'2022-08-24 16:33:55','2022-08-28 16:33:00.179','Cc测试25','Cc测试2','/activity/record/8ad2a9d743a7877019885cafaeec24bb.png',2,0,0,'2022-08-24 16:34:00.000','2022-08-28 16:33:00.000','2022-08-24 16:33:54.897',0),(12,'2022-08-24 16:34:44','2022-08-28 16:34:00.178','Cc测试28','Cc测试2','/activity/record/8ad2a9d743a7877019885cafaeec24bb.png',2,2,NULL,'2022-08-24 16:35:00.000','2022-08-28 16:34:00.000','2022-08-24 16:34:44.059',0),(13,'2022-09-07 13:38:45','2022-09-18 13:41:00.900','反馈类测试','我的规则就是规则','/activity/record/ccd2cd19c9aafdf4e7614cde5b92c534.png',2,0,1,'2022-09-07 13:40:00.000','2022-09-18 13:41:00.000','2022-09-07 13:38:44.517',1);
/*!40000 ALTER TABLE `customize_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customize_activity_comment`
--

DROP TABLE IF EXISTS `customize_activity_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customize_activity_comment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `customize_activity_id` bigint unsigned DEFAULT NULL,
  `auth_user_id` bigint unsigned DEFAULT NULL,
  `audit_status` bigint DEFAULT '0' COMMENT '审核状态 0-未审核 1-已通过 2-未通过',
  `content` longtext COMMENT '文本内容',
  `images` json DEFAULT NULL COMMENT '图片内容',
  `priority` bigint NOT NULL DEFAULT '0' COMMENT '展示优先级',
  `coin_record_id` bigint unsigned DEFAULT NULL,
  `like_nums` bigint DEFAULT '0' COMMENT '被点赞总数',
  `has_top` tinyint(1) DEFAULT '0' COMMENT '是否已经被置顶过',
  PRIMARY KEY (`id`),
  KEY `fk_customize_activity_comment_auth_user` (`auth_user_id`),
  KEY `fk_customize_activity_comment_coin_record` (`coin_record_id`),
  KEY `fk_customize_activity_comments` (`customize_activity_id`),
  CONSTRAINT `fk_customize_activity_comment_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_customize_activity_comment_coin_record` FOREIGN KEY (`coin_record_id`) REFERENCES `coin_record` (`id`),
  CONSTRAINT `fk_customize_activity_comments` FOREIGN KEY (`customize_activity_id`) REFERENCES `customize_activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customize_activity_comment`
--

LOCK TABLES `customize_activity_comment` WRITE;
/*!40000 ALTER TABLE `customize_activity_comment` DISABLE KEYS */;
INSERT INTO `customize_activity_comment` VALUES (1,'2022-08-05 10:24:48','2022-08-05 10:24:47.537',1,4,0,'111','[\"/activity/record/2a26c6aaa461cb95a5aa215fc84f4744.jpg\"]',0,NULL,0,0),(2,'2022-08-05 11:09:38','2022-08-05 11:11:44.277',2,3,1,NULL,'[]',0,71,0,0),(3,'2022-08-05 15:31:29','2022-08-05 15:31:28.978',2,5,0,NULL,'[]',0,NULL,0,0),(4,'2022-08-23 11:56:31','2022-08-23 11:56:43.862',10,4,1,'啊啊啊','[]',0,190,0,0),(5,'2022-08-23 11:58:49','2022-08-23 11:59:00.093',10,3,1,'啊啊啊','[]',0,197,0,0),(6,'2022-08-23 12:08:43','2022-08-23 12:08:43.415',10,4,0,'','[]',0,NULL,0,0),(7,'2022-08-24 16:35:28','2022-08-24 16:35:58.341',12,4,1,'111','[]',1,199,0,1),(8,'2022-09-07 13:40:25','2022-09-07 13:40:24.863',13,2,0,'测试一下','[\"/activity/record/9f96143fb828d860bcc384f2c6d4f4bb.jpg\"]',0,NULL,0,0),(9,'2022-09-07 13:40:26','2022-09-07 13:40:26.496',13,2,0,'测试一下','[\"/activity/record/9f96143fb828d860bcc384f2c6d4f4bb.jpg\"]',0,NULL,0,0);
/*!40000 ALTER TABLE `customize_activity_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customize_activity_comment_2_pick_user`
--

DROP TABLE IF EXISTS `customize_activity_comment_2_pick_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customize_activity_comment_2_pick_user` (
  `customize_activity_comment_id` bigint unsigned NOT NULL,
  `auth_user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`customize_activity_comment_id`,`auth_user_id`),
  KEY `fk_customize_activity_comment_2_pick_user_auth_user` (`auth_user_id`),
  CONSTRAINT `fk_customize_activity_comment_2_pick_user_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_customize_activity_comment_2_pick_user_customize_actibce2fcbb` FOREIGN KEY (`customize_activity_comment_id`) REFERENCES `customize_activity_comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customize_activity_comment_2_pick_user`
--

LOCK TABLES `customize_activity_comment_2_pick_user` WRITE;
/*!40000 ALTER TABLE `customize_activity_comment_2_pick_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `customize_activity_comment_2_pick_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_fish_goods`
--

DROP TABLE IF EXISTS `free_fish_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_fish_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `status` bigint DEFAULT '0' COMMENT '销售状态 0-售卖中 1-已售出',
  `seller_id` bigint unsigned DEFAULT NULL COMMENT '卖方ID',
  `title` longtext COMMENT '标题',
  `description` longtext COMMENT '描述',
  `images` json DEFAULT NULL COMMENT '图片',
  `price` double DEFAULT '0' COMMENT '价格/元',
  `buyer_id` bigint unsigned DEFAULT NULL COMMENT '买方ID',
  `trade_date_time` datetime(3) DEFAULT NULL COMMENT '交易时间',
  `trade_description` longtext COMMENT '交易描述',
  `trade_images` json DEFAULT NULL COMMENT '交易图片',
  `seller_coin_record_id` bigint unsigned DEFAULT NULL,
  `buyer_coin_record_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_free_fish_goods_buyer_coin_record` (`buyer_coin_record_id`),
  KEY `fk_free_fish_goods_seller` (`seller_id`),
  KEY `fk_free_fish_goods_buyer` (`buyer_id`),
  KEY `fk_free_fish_goods_seller_coin_record` (`seller_coin_record_id`),
  CONSTRAINT `fk_free_fish_goods_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_free_fish_goods_buyer_coin_record` FOREIGN KEY (`buyer_coin_record_id`) REFERENCES `coin_record` (`id`),
  CONSTRAINT `fk_free_fish_goods_seller` FOREIGN KEY (`seller_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_free_fish_goods_seller_coin_record` FOREIGN KEY (`seller_coin_record_id`) REFERENCES `coin_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_fish_goods`
--

LOCK TABLES `free_fish_goods` WRITE;
/*!40000 ALTER TABLE `free_fish_goods` DISABLE KEYS */;
INSERT INTO `free_fish_goods` VALUES (1,'2022-08-05 10:53:30','2022-08-05 10:57:37.132',1,3,'我是不能','哈哈哈','[\"/freeFish/b30f087c615a43d7a2198f74915cf819.jpg\"]',8,4,'2022-08-05 10:57:37.130','哈哈','[\"/freeFish/ad1921cf5d1d6a99e6761a1f12e0368b.jpg\"]',70,69),(2,'2022-08-24 16:52:37','2022-08-24 16:56:33.760',1,4,'不不不不不','哈哈哈哈','[\"/freeFish/6578523db7378338bf93c074b0152268.jpg\"]',90,3,'2022-08-24 16:56:33.759','哈哈哈','[\"/freeFish/d98f888ef485df086105bcc967b1fe9b.jpg\"]',204,203);
/*!40000 ALTER TABLE `free_fish_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_fish_goods2_users`
--

DROP TABLE IF EXISTS `free_fish_goods2_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_fish_goods2_users` (
  `created_at` datetime DEFAULT NULL,
  `free_fish_goods_id` bigint unsigned NOT NULL,
  `auth_user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`free_fish_goods_id`,`auth_user_id`),
  KEY `fk_free_fish_goods2_users_auth_user` (`auth_user_id`),
  CONSTRAINT `fk_free_fish_goods2_users_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_free_fish_goods2_users_free_fish_goods` FOREIGN KEY (`free_fish_goods_id`) REFERENCES `free_fish_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_fish_goods2_users`
--

LOCK TABLES `free_fish_goods2_users` WRITE;
/*!40000 ALTER TABLE `free_fish_goods2_users` DISABLE KEYS */;
INSERT INTO `free_fish_goods2_users` VALUES ('2022-08-05 10:55:31',1,4),('2022-08-24 16:54:57',2,3);
/*!40000 ALTER TABLE `free_fish_goods2_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golden_idea`
--

DROP TABLE IF EXISTS `golden_idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `golden_idea` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` bigint DEFAULT '0' COMMENT '状态 0-待采纳 1-已采纳 2-未采纳',
  `content` longtext COMMENT '内容',
  `images` json DEFAULT NULL COMMENT '图片',
  `coin_record_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_golden_idea_user` (`user_id`),
  KEY `fk_golden_idea_coin_record` (`coin_record_id`),
  CONSTRAINT `fk_golden_idea_coin_record` FOREIGN KEY (`coin_record_id`) REFERENCES `coin_record` (`id`),
  CONSTRAINT `fk_golden_idea_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golden_idea`
--

LOCK TABLES `golden_idea` WRITE;
/*!40000 ALTER TABLE `golden_idea` DISABLE KEYS */;
INSERT INTO `golden_idea` VALUES (1,'2022-08-05 10:04:21','2022-08-05 10:05:11.304',4,2,'？人','[\"/carbonBook/goldenIdea/8f14f4bbb0a75cf497f56b9f2ca08fe8.jpg\"]',NULL),(2,'2022-08-05 10:04:35','2022-08-05 10:05:07.433',4,1,'还有一会','[\"/carbonBook/goldenIdea/8f14f4bbb0a75cf497f56b9f2ca08fe8.jpg\"]',64),(3,'2022-08-05 20:14:50','2022-08-05 20:14:50.216',5,0,'好的','[\"/carbonBook/goldenIdea/02a57a7ced4d5fe7ca5e94b0af729a0f.jpg\"]',NULL),(4,'2022-08-05 20:25:54','2022-08-05 20:25:54.047',1,0,'tempor','[\"/carbonBook/goldenIdea/02a57a7ced4d5fe7ca5e94b0af729a0f.jpg\"]',NULL),(5,'2022-08-08 17:30:23','2022-08-08 17:31:00.296',2,1,'哈哈哈','[\"/carbonBook/goldenIdea/3a50c198ffcb0a202ab7d50b9bd7f9f4.jpg\"]',152),(6,'2022-08-17 16:51:16','2022-08-17 16:51:15.910',4,0,'我我我我','[\"/carbonBook/goldenIdea/7573b94f568897bd5e189238644447bb.jpg\"]',NULL),(7,'2022-08-17 16:53:09','2022-08-17 16:53:08.666',4,0,'刚发的','[\"/carbonBook/goldenIdea/3a6a4eaa8bd6596fd4f721c4edf9de6d.jpg\"]',NULL),(8,'2022-08-17 17:03:12','2022-08-17 17:03:12.355',3,0,'ggeeee','[\"/carbonBook/goldenIdea/e19ddde1cc711027da1f3f0f6eda9e05.jpg\"]',NULL),(9,'2022-08-17 17:11:06','2022-08-17 17:11:05.538',3,0,'bjj','[\"/carbonBook/goldenIdea/65de873c797f2936a34179db1d01e65c.jpg\"]',NULL),(10,'2022-08-18 14:14:13','2022-08-18 14:14:13.298',4,0,'斤斤计较','[\"https://hanlan.sevenfifteen.com.cn/api/file/download/?path=/carbonBook/goldenIdea/afd67fc86753285d845dc355808b26f1.jpg\", \"/carbonBook/goldenIdea/7d68fdaac9ceaebd2173f8163a22ab09.jpg\"]',NULL),(11,'2022-08-18 14:19:45','2022-08-18 14:19:44.923',4,0,'鱼鱼鱼','[\"/carbonBook/goldenIdea/d57cf72299a87763953f3c20628bcea9.jpg\", \"/carbonBook/goldenIdea/8ab98d1e9beb08993aa69d6a51371071.jpg\"]',NULL),(12,'2022-08-18 14:30:51','2022-08-18 14:30:51.305',4,0,'与','[\"/carbonBook/goldenIdea/7d79b02157a09d8284e38c9624b2505a.jpg\", \"/carbonBook/goldenIdea/831899190b20e72a37d0050d3186d128.jpg\"]',NULL),(13,'2022-08-26 09:35:02','2022-08-26 09:35:01.866',4,0,'久久久','[\"/carbonBook/goldenIdea/3f46717b28cc4033461abf63fca8b901.jpg\"]',NULL);
/*!40000 ALTER TABLE `golden_idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_game`
--

DROP TABLE IF EXISTS `mini_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mini_game` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '游戏名',
  `icon` longtext COMMENT '图标',
  `ip` longtext COMMENT 'IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mini_game_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_game`
--

LOCK TABLES `mini_game` WRITE;
/*!40000 ALTER TABLE `mini_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `mini_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_activity`
--

DROP TABLE IF EXISTS `offline_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_activity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `description` longtext COMMENT '活动描述',
  `cover` longtext COMMENT '活动封面',
  `status` bigint DEFAULT '0' COMMENT '活动状态 0-未开始 1-活动期 2-已结束',
  `audit_status` bigint DEFAULT '0' COMMENT '审核状态 0-待审核 1-通过 2-未通过',
  `organizer_id` bigint unsigned DEFAULT NULL COMMENT '活动发起人/活动管理员',
  `linkman` longtext COMMENT '联系人',
  `link_phone` longtext COMMENT '联系方式',
  `province` longtext COMMENT '省份',
  `city` longtext COMMENT '城市',
  `area` longtext COMMENT '区',
  `address` longtext COMMENT '具体地点',
  `start_date_time` datetime(3) DEFAULT NULL COMMENT '活动开始时间',
  `end_date_time` datetime(3) DEFAULT NULL COMMENT '活动结束时间',
  `user_nums` bigint DEFAULT NULL COMMENT '活动人数限制',
  `coin_record_id` bigint unsigned DEFAULT NULL,
  `notify_end` tinyint(1) DEFAULT '0' COMMENT '是否已经提醒结束消息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_offline_activity_name` (`name`),
  KEY `fk_offline_activity_organizer` (`organizer_id`),
  KEY `fk_offline_activity_coin_record` (`coin_record_id`),
  CONSTRAINT `fk_offline_activity_coin_record` FOREIGN KEY (`coin_record_id`) REFERENCES `coin_record` (`id`),
  CONSTRAINT `fk_offline_activity_organizer` FOREIGN KEY (`organizer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_activity`
--

LOCK TABLES `offline_activity` WRITE;
/*!40000 ALTER TABLE `offline_activity` DISABLE KEYS */;
INSERT INTO `offline_activity` VALUES (1,'2022-08-05 09:35:56','2022-08-05 10:25:13.286','好','uU语句','/offline/a10cd3722fbf81606702c21b81802821.jpg',0,2,4,'13682379113','13682371111','河北省','邢台市','','就将就','2022-08-11 00:00:00.000','2022-08-26 00:00:00.000',2,NULL,0),(2,'2022-08-05 09:36:43','2022-08-25 00:00:00.961','呜呜呜','不好好','/offline/8f14f4bbb0a75cf497f56b9f2ca08fe8.jpg',2,1,4,'我','13682379115','吉林省','长春市','','回家就','2022-08-19 00:00:00.000','2022-08-25 00:00:00.000',2,66,1),(3,'2022-08-05 09:46:10','2022-08-26 00:00:00.962','u','111','/offline/388cef49875eb458f3af14ba8bf18e56.jpg',2,1,4,'1','13682739466','山西省','朔州市','','u','2022-08-19 00:00:00.000','2022-08-26 00:00:00.000',6,65,1),(4,'2022-08-08 18:00:42','2022-08-08 18:00:41.898','新活动','测试啦','/offline/687cd4adb4d79e6275dc5ace6612d4c6.jpg',0,0,2,'啦啦啦','13168356588','内蒙古自治区','巴彦淖尔市','','666','2022-08-08 18:25:00.000','2022-08-23 18:59:00.000',80,NULL,0),(5,'2022-08-24 16:44:16','2022-08-31 00:00:00.178','cC测试3','就好好好','/offline/aabed6989dfa76a7c20af0ca9d310f0c.jpg',2,1,4,'KKK','13469797572','北京市','东城区','','慢慢看','2022-08-24 16:48:00.000','2022-08-31 00:00:00.000',666,201,0),(6,'2022-09-09 10:02:31','2022-09-16 00:00:00.903','线下一起骑单车吧','来参加吧','/offline/30f3dc04a78f1be4d2af8f0034edd0f2.jpg',2,1,2,'李生','13124569754','内蒙古自治区','呼伦贝尔市','','瀚蓝广场','2022-09-09 11:02:00.000','2022-09-16 00:00:00.000',200,262,1),(7,'2022-09-09 10:06:08','2022-09-16 00:00:00.903','一起线下骑单车','牛牛的活动\n','/offline/f5cf920f6b798c81f9b984382277e4d5.jpg',2,1,5,'黄生','13555258856','山西省','晋中市','','瀚蓝广场','2022-09-09 11:05:00.000','2022-09-16 00:00:00.000',80,266,1),(8,'2022-09-09 10:11:17','2022-09-23 00:00:00.903','线下打字比赛','牛活动\n','/offline/92c5ab7685fde8bf57180de6176e2d02.jpg',2,1,5,'黄生','13285698555','北京市','崇文区','','瀚蓝广场','2022-09-09 10:15:00.000','2022-09-23 00:00:00.000',2000,267,1);
/*!40000 ALTER TABLE `offline_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_activity_register`
--

DROP TABLE IF EXISTS `offline_activity_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_activity_register` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `offline_activity_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` bigint DEFAULT '0' COMMENT '审核状态 0-待审核 1-通过 2-未通过',
  `sign_in_date_time` datetime(3) DEFAULT NULL COMMENT '签到时间',
  `sign_out_date_time` datetime(3) DEFAULT NULL COMMENT '签退时间',
  `is_notify` tinyint(1) DEFAULT NULL COMMENT '是否已经通知',
  `coin_record_id` bigint unsigned DEFAULT NULL COMMENT '对应的碳币获取记录ID',
  `notify_am` tinyint(1) DEFAULT '0' COMMENT '上午十点的通知',
  `notify_pm` tinyint(1) DEFAULT '0' COMMENT '下午5点的通知',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_offActivityId_userId_status` (`offline_activity_id`,`user_id`,`status`),
  KEY `fk_offline_activity_register_user` (`user_id`),
  KEY `fk_offline_activity_register_coin_record` (`coin_record_id`),
  CONSTRAINT `fk_offline_activity_register_coin_record` FOREIGN KEY (`coin_record_id`) REFERENCES `coin_record` (`id`),
  CONSTRAINT `fk_offline_activity_register_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `fk_offline_activity_registers` FOREIGN KEY (`offline_activity_id`) REFERENCES `offline_activity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_activity_register`
--

LOCK TABLES `offline_activity_register` WRITE;
/*!40000 ALTER TABLE `offline_activity_register` DISABLE KEYS */;
INSERT INTO `offline_activity_register` VALUES (1,'2022-08-05 10:25:09','2022-08-18 16:00:01.776',3,4,1,NULL,NULL,NULL,NULL,1,1),(2,'2022-08-05 10:25:11','2022-08-18 16:00:01.350',2,4,1,NULL,NULL,NULL,NULL,1,1),(3,'2022-08-05 10:26:20','2022-08-18 16:00:01.568',3,3,1,NULL,NULL,NULL,NULL,1,1),(4,'2022-08-05 10:26:41','2022-08-18 16:00:01.231',2,3,0,NULL,NULL,NULL,NULL,1,1),(5,'2022-08-05 15:31:55','2022-08-18 16:00:01.887',3,5,0,NULL,NULL,NULL,NULL,1,1),(6,'2022-08-24 16:47:25','2022-08-24 16:47:24.673',5,4,1,NULL,NULL,NULL,NULL,0,0),(7,'2022-09-09 10:03:12','2022-09-09 10:03:12.413',6,2,1,NULL,NULL,NULL,NULL,0,0),(8,'2022-09-09 10:04:14','2022-09-09 10:14:05.063',6,5,1,NULL,NULL,NULL,NULL,0,0),(9,'2022-09-09 10:06:58','2022-09-09 10:06:57.667',7,5,1,NULL,NULL,NULL,NULL,0,0),(10,'2022-09-09 10:07:07','2022-09-09 10:08:40.569',7,2,1,NULL,NULL,NULL,NULL,0,0),(11,'2022-09-09 10:11:34','2022-09-09 10:11:34.362',8,5,1,NULL,NULL,NULL,NULL,0,0),(12,'2022-09-09 10:11:49','2022-09-09 10:18:09.113',8,2,1,'2022-09-09 10:17:52.806','2022-09-09 10:18:09.101',NULL,269,0,0);
/*!40000 ALTER TABLE `offline_activity_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_permission_auto`
--

DROP TABLE IF EXISTS `rbac_permission_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_permission_auto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(64) DEFAULT NULL,
  `summary` longtext,
  `description` longtext,
  `module` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rbac_permission_auto_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_permission_auto`
--

LOCK TABLES `rbac_permission_auto` WRITE;
/*!40000 ALTER TABLE `rbac_permission_auto` DISABLE KEYS */;
INSERT INTO `rbac_permission_auto` VALUES (1,'POST|/api/admin/article/carbonBook/goldenIdea/audit','审核金点子','','金点子'),(2,'POST|/api/admin/offline/list','查看活动','查看活动','线下活动'),(3,'POST|/api/admin/report/activity-data-list','用户参与活动数量','用户参与活动数量','数据看板'),(4,'POST|/api/admin/user/list','查看用户信息','查看用户信息','用户管理'),(5,'POST|/api/admin/article/directory/delete','删除目录','删除目录','低碳手册'),(6,'POST|/api/admin/coin/record/list','查看碳币获取记录','查看碳币获取记录','碳币管理'),(7,'POST|/api/admin/coin/record/post','调整碳币','调整碳币','碳币管理'),(8,'POST|/api/admin/coin/risk/list','查询预警信息','查看规则','碳币管理'),(9,'POST|/api/admin/freeFish/delete','删除交易','','闲鱼交易'),(10,'POST|/api/admin/article/get','查看文章详情','查看文章详情','文章管理'),(11,'POST|/api/admin/article/patch','修改文章分类','修改文章分类','文章管理'),(12,'POST|/api/admin/miniGame/post','新增','','游戏管理'),(13,'POST|/api/admin/user/get','用户详情','用户详情','用户管理'),(14,'POST|/api/admin/article/carbonBook/list','查看手册列表','查看手册列表','低碳手册'),(15,'POST|/api/admin/customize/post','创建活动','','自定义活动'),(16,'POST|/api/admin/activity/patch','编辑活动','编辑活动','常规活动'),(17,'POST|/api/admin/article/carbonBook/move','移动','移动','低碳手册'),(18,'POST|/api/admin/article/news/list','查看资讯','','资讯'),(19,'POST|/api/admin/customize/list','查看活动','','自定义活动'),(20,'POST|/api/admin/rbac/role/add','添加角色','','角色模块'),(21,'POST|/api/admin/rbac/role/permission/patch','修改角色的路由权限','修改角色的路由权限','权限模块'),(22,'POST|/api/admin/activity/post','创建活动','创建活动','常规活动'),(23,'POST|/api/admin/user/patch','修改用户信息','修改用户信息','用户管理'),(24,'POST|/api/admin/activity/get','活动详情','活动详情','常规活动'),(25,'POST|/api/admin/article/edit','编辑文章','编辑文章','文章管理'),(26,'POST|/api/admin/coin/rule/list','查看规则','查看规则','碳币管理'),(27,'POST|/api/admin/customize/comment/list','查看反馈','','自定义活动'),(28,'POST|/api/admin/step/list','微信步数查询','微信步数查询','低碳行者'),(29,'POST|/api/admin/article/bind-user','绑定秀米用户','绑定秀米用户','文章管理'),(30,'POST|/api/admin/coin/rule/patch','修改规则','修改规则','碳币管理'),(31,'POST|/api/admin/customize/comment/top','互动置顶','','自定义活动'),(32,'POST|/api/admin/article/directory/list','查看文章目录','查看文章目录','低碳手册'),(33,'POST|/api/admin/miniGame/delete','删除','','游戏管理'),(34,'POST|/api/admin/miniGame/patch','修改','','游戏管理'),(35,'POST|/api/admin/rbac/role/permission/orderByModuleList','根据module分组获取路由权限列表','根据module分组获取路由权限列表','权限模块'),(36,'POST|/api/admin/miniGame/list','查询','','游戏管理'),(37,'POST|/api/admin/article/carbonBook/get','查看手册详情','查看手册详情','低碳手册'),(38,'POST|/api/admin/article/carbonBook/publish','发布','发布','低碳手册'),(39,'POST|/api/admin/user/coin/list','查看用户的碳币消耗记录','查看用户的碳币消耗记录','用户管理'),(40,'POST|/api/admin/article/directory/post','新建目录','新建目录','低碳手册'),(41,'POST|/api/admin/customize/comment/audit','审核反馈','','自定义活动'),(42,'POST|/api/admin/freeFish/list','查看交易信息','','闲鱼交易'),(43,'POST|/api/admin/activity/record/list','查看打卡记录','查看打卡记录','常规活动'),(44,'POST|/api/admin/offline/get','查看指定活动','查看指定活动','线下活动'),(45,'POST|/api/admin/offline/patch','审核活动','审核活动','线下活动'),(46,'POST|/api/admin/article/directory/patch','修改目录','修改目录','低碳手册'),(47,'POST|/api/admin/activity/manage','活动便捷管理','活动便捷管理','常规活动'),(48,'POST|/api/admin/article/news/sort','排序','','资讯'),(49,'POST|/api/admin/customize/manage','管理活动','','自定义活动'),(50,'POST|/api/admin/article/news/delete','删除资讯','','资讯'),(51,'POST|/api/admin/offline/audit-list','查看审核的活动列表','查看活动','线下活动'),(52,'POST|/api/admin/article/list','查看文章列表','查看文章列表','文章管理'),(53,'POST|/api/admin/customize/patch','编辑活动','','自定义活动'),(54,'POST|/api/admin/article/carbonBook/goldenIdea/list','查看金点子','','金点子'),(55,'POST|/api/admin/article/history/list','查看历史记录','查看历史记录','低碳手册'),(56,'POST|/api/admin/article/news/get','资讯详情','','资讯'),(57,'POST|/api/admin/activity/list','查看活动','查看活动','常规活动'),(58,'POST|/api/admin/offline/register/list','查看报名情况','查看报名情况','线下活动'),(59,'POST|/api/admin/rbac/role/delete','删除角色','','角色模块'),(60,'POST|/api/admin/activity/record/delete','删除打卡记录','删除打卡记录','常规活动'),(61,'POST|/api/admin/rbac/role/list','获取角色列表','获取角色列表','角色模块'),(62,'POST|/api/admin/article/carbonBook/delete','删除低碳手册','','低碳手册'),(64,'POST|/api/admin/report/free-fish-data-list','闲鱼交易','闲鱼交易','数据看板'),(65,'POST|/api/admin/report/coin-data-list','碳币获得数量','碳币获得数量','数据看板'),(83,'POST|/api/admin/report/offline-activity-data-list','用户发起的线下活动数量','用户发起的线下活动数量','数据看板');
/*!40000 ALTER TABLE `rbac_permission_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role`
--

DROP TABLE IF EXISTS `rbac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '角色英文名',
  `ch_name` varchar(32) DEFAULT NULL COMMENT '角色中文名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rbac_role_name` (`name`),
  UNIQUE KEY `idx_rbac_role_ch_name` (`ch_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role`
--

LOCK TABLES `rbac_role` WRITE;
/*!40000 ALTER TABLE `rbac_role` DISABLE KEYS */;
INSERT INTO `rbac_role` VALUES (1,'2022-07-22 18:10:33','2022-07-22 18:10:35.000','root',''),(2,'2022-08-02 14:52:30','2022-08-18 21:52:06.055','超级牛',NULL),(3,'2022-08-16 16:50:18','2022-08-16 16:50:17.663','线下',NULL),(4,'2022-08-18 10:31:16','2022-08-18 10:31:16.405','11111111',NULL),(5,'2022-08-18 14:21:57','2022-08-18 14:21:56.716','完全',NULL),(6,'2022-08-23 10:11:44','2022-08-23 10:11:44.054','金色',NULL);
/*!40000 ALTER TABLE `rbac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rbac_role_2_permission`
--

DROP TABLE IF EXISTS `rbac_role_2_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rbac_role_2_permission` (
  `rbac_role_id` bigint unsigned NOT NULL,
  `rbac_permission_auto_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`rbac_role_id`,`rbac_permission_auto_id`),
  KEY `fk_rbac_role_2_permission_rbac_permission_auto` (`rbac_permission_auto_id`),
  CONSTRAINT `fk_rbac_role_2_permission_rbac_permission_auto` FOREIGN KEY (`rbac_permission_auto_id`) REFERENCES `rbac_permission_auto` (`id`),
  CONSTRAINT `fk_rbac_role_2_permission_rbac_role` FOREIGN KEY (`rbac_role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rbac_role_2_permission`
--

LOCK TABLES `rbac_role_2_permission` WRITE;
/*!40000 ALTER TABLE `rbac_role_2_permission` DISABLE KEYS */;
INSERT INTO `rbac_role_2_permission` VALUES (2,1),(4,1),(6,1),(2,2),(3,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(3,44),(2,45),(3,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(3,51),(5,51),(2,52),(2,53),(2,54),(4,54),(6,54),(2,55),(2,56),(2,57),(2,58),(3,58),(5,58),(2,59),(2,60),(2,61),(2,62),(2,64),(2,65),(2,83);
/*!40000 ALTER TABLE `rbac_role_2_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_2_activity`
--

DROP TABLE IF EXISTS `user_2_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_2_activity` (
  `auth_user_id` bigint unsigned NOT NULL,
  `activity_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`auth_user_id`,`activity_id`),
  KEY `fk_user_2_activity_activity` (`activity_id`),
  CONSTRAINT `fk_user_2_activity_activity` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `fk_user_2_activity_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_2_activity`
--

LOCK TABLES `user_2_activity` WRITE;
/*!40000 ALTER TABLE `user_2_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_2_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `auth_user_id` bigint unsigned NOT NULL,
  `rbac_role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`auth_user_id`,`rbac_role_id`),
  KEY `fk_user_roles_rbac_role` (`rbac_role_id`),
  CONSTRAINT `fk_user_roles_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_roles_rbac_role` FOREIGN KEY (`rbac_role_id`) REFERENCES `rbac_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,2),(5,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tag`
--

DROP TABLE IF EXISTS `user_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `auth_user_id` bigint unsigned DEFAULT NULL,
  `has_tag_day` bigint DEFAULT '0' COMMENT '7天周期签到的信息',
  `total_tag_day` bigint DEFAULT '0' COMMENT '累计连续签到的天数',
  `last_tag_day` bigint DEFAULT '0' COMMENT '最近一次签到的时间 yyyymmdd',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_tag_auth_user_id` (`auth_user_id`),
  CONSTRAINT `fk_user_tag_auth_user` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tag`
--

LOCK TABLES `user_tag` WRITE;
/*!40000 ALTER TABLE `user_tag` DISABLE KEYS */;
INSERT INTO `user_tag` VALUES (1,'2022-08-26 09:36:16','2022-08-26 09:36:16.430',4,1,1,20220826);
/*!40000 ALTER TABLE `user_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `version` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_step`
--

DROP TABLE IF EXISTS `wx_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wx_step` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `auth_user_id` bigint unsigned DEFAULT NULL,
  `timestamp` bigint NOT NULL COMMENT '微信的时间戳',
  `steps` bigint NOT NULL DEFAULT '0' COMMENT '运动步数',
  PRIMARY KEY (`id`),
  KEY `fk_auth_user_we_run_steps` (`auth_user_id`),
  CONSTRAINT `fk_auth_user_we_run_steps` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_step`
--

LOCK TABLES `wx_step` WRITE;
/*!40000 ALTER TABLE `wx_step` DISABLE KEYS */;
INSERT INTO `wx_step` VALUES (1,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1656864000,0),(2,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1656950400,0),(3,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657036800,0),(4,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657123200,0),(5,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657209600,0),(6,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657296000,0),(7,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657382400,0),(8,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657468800,0),(9,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657555200,0),(10,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657641600,0),(11,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657728000,0),(12,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657814400,0),(13,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657900800,0),(14,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1657987200,0),(15,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658073600,0),(16,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658160000,0),(17,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658246400,0),(18,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658332800,5594),(19,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658419200,6199),(20,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658505600,1328),(21,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658592000,2547),(22,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658678400,6089),(23,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658764800,5282),(24,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658851200,6057),(25,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1658937600,6513),(26,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1659024000,4513),(27,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1659110400,511),(28,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1659196800,1774),(29,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1659283200,4601),(30,'2022-08-03 18:51:49','2022-08-03 18:51:49.078',3,1659369600,5705),(31,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657036800,0),(32,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657123200,0),(33,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657209600,0),(34,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657296000,0),(35,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657382400,0),(36,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657468800,0),(37,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657555200,4932),(38,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657641600,3339),(39,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657728000,0),(40,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657814400,2232),(41,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657900800,6211),(42,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1657987200,5036),(43,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658073600,6738),(44,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658160000,3895),(45,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658246400,3713),(46,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658332800,4426),(47,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658419200,8752),(48,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658505600,1095),(49,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658592000,2803),(50,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658678400,1116),(51,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658764800,1468),(52,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658851200,2071),(53,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1658937600,3538),(54,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1659024000,148),(55,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1659110400,0),(56,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1659196800,0),(57,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1659283200,0),(58,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1659369600,0),(59,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1659456000,0),(60,'2022-08-05 09:32:06','2022-08-05 09:32:05.510',4,1659542400,4306),(61,'2022-08-05 10:26:18','2022-08-05 10:26:17.647',3,1659456000,6368),(62,'2022-08-05 10:26:18','2022-08-05 10:26:17.647',3,1659542400,6870),(63,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657036800,4118),(64,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657123200,5777),(65,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657209600,5487),(66,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657296000,2558),(67,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657382400,2053),(68,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657468800,5439),(69,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657555200,4277),(70,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657641600,5519),(71,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657728000,4434),(72,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657814400,3316),(73,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657900800,5547),(74,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1657987200,6852),(75,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658073600,5057),(76,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658160000,5776),(77,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658246400,5949),(78,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658332800,5310),(79,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658419200,5821),(80,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658505600,3779),(81,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658592000,3897),(82,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658678400,3455),(83,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658764800,3882),(84,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658851200,4529),(85,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1658937600,4847),(86,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1659024000,3952),(87,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1659110400,12005),(88,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1659196800,7785),(89,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1659283200,4440),(90,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1659369600,4619),(91,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1659456000,5878),(92,'2022-08-05 15:29:07','2022-08-05 15:29:06.706',5,1659542400,3400),(93,'2022-08-08 11:30:41','2022-08-08 11:30:40.683',5,1659628800,3373),(94,'2022-08-08 11:30:41','2022-08-08 11:30:40.683',5,1659715200,5463),(95,'2022-08-08 11:30:41','2022-08-08 11:30:40.683',5,1659801600,3421),(96,'2022-08-08 13:36:01','2022-08-08 13:36:00.784',4,1659628800,6209),(97,'2022-08-08 13:36:01','2022-08-08 13:36:00.784',4,1659715200,8752),(98,'2022-08-08 13:36:01','2022-08-08 13:36:00.784',4,1659801600,8735),(99,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657296000,3691),(100,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657382400,4750),(101,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657468800,6360),(102,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657555200,4742),(103,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657641600,5982),(104,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657728000,4651),(105,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657814400,4830),(106,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657900800,2704),(107,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1657987200,10035),(108,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658073600,5007),(109,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658160000,7210),(110,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658246400,3959),(111,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658332800,5909),(112,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658419200,6558),(113,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658505600,4834),(114,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658592000,2202),(115,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658678400,3734),(116,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658764800,4160),(117,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658851200,4145),(118,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1658937600,3979),(119,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659024000,4848),(120,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659110400,11820),(121,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659196800,8828),(122,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659283200,3514),(123,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659369600,4413),(124,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659456000,4820),(125,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659542400,3147),(126,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659628800,3508),(127,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659715200,6320),(128,'2022-08-08 16:22:33','2022-08-08 16:22:33.122',2,1659801600,6734),(129,'2022-08-09 15:21:18','2022-08-09 15:21:17.659',2,1659888000,3478),(130,'2022-08-09 15:27:39','2022-08-09 15:27:38.617',4,1659888000,5829),(131,'2022-08-10 13:59:15','2022-08-10 13:59:14.584',4,1659974400,4480),(132,'2022-08-10 15:38:43','2022-08-10 15:38:42.917',5,1659888000,4203),(133,'2022-08-10 15:38:43','2022-08-10 15:38:42.917',5,1659974400,5260),(134,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1659628800,6176),(135,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1659715200,887),(136,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1659801600,1841),(137,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1659888000,5277),(138,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1659974400,6265),(139,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1660060800,4863),(140,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1660147200,5398),(141,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1660233600,4799),(142,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1660320000,4537),(143,'2022-08-15 14:26:11','2022-08-15 14:26:10.627',3,1660406400,1789),(144,'2022-08-16 17:21:04','2022-08-16 17:21:03.955',5,1660060800,3917),(145,'2022-08-16 17:21:04','2022-08-16 17:21:03.955',5,1660147200,4843),(146,'2022-08-16 17:21:04','2022-08-16 17:21:03.955',5,1660233600,5866),(147,'2022-08-16 17:21:04','2022-08-16 17:21:03.955',5,1660320000,4816),(148,'2022-08-16 17:21:04','2022-08-16 17:21:03.955',5,1660406400,9483),(149,'2022-08-16 17:21:04','2022-08-16 17:21:03.955',5,1660492800,4597),(150,'2022-08-17 16:50:25','2022-08-17 16:50:24.885',4,1660060800,5115),(151,'2022-08-17 16:50:25','2022-08-17 16:50:24.885',4,1660147200,6120),(152,'2022-08-17 16:50:25','2022-08-17 16:50:24.885',4,1660233600,4630),(153,'2022-08-17 16:50:25','2022-08-17 16:50:24.885',4,1660320000,9834),(154,'2022-08-17 16:50:25','2022-08-17 16:50:24.885',4,1660406400,5362),(155,'2022-08-17 16:50:25','2022-08-17 16:50:24.885',4,1660492800,5271),(156,'2022-08-17 16:50:25','2022-08-17 16:50:24.885',4,1660579200,4639),(157,'2022-08-17 17:02:45','2022-08-17 17:02:44.539',3,1660492800,5089),(158,'2022-08-17 17:02:45','2022-08-17 17:02:44.539',3,1660579200,4990),(159,'2022-08-18 10:09:21','2022-08-18 10:09:20.901',4,1660665600,3262),(160,'2022-08-23 09:56:36','2022-08-23 09:56:36.271',4,1660752000,11067),(161,'2022-08-23 09:56:36','2022-08-23 09:56:36.271',4,1660838400,6911),(162,'2022-08-23 09:56:36','2022-08-23 09:56:36.271',4,1660924800,3168),(163,'2022-08-23 09:56:36','2022-08-23 09:56:36.271',4,1661011200,6731),(164,'2022-08-23 09:56:36','2022-08-23 09:56:36.271',4,1661097600,3599),(165,'2022-08-23 11:58:44','2022-08-23 11:58:43.820',3,1660665600,4518),(166,'2022-08-23 11:58:44','2022-08-23 11:58:43.820',3,1660752000,5022),(167,'2022-08-23 11:58:44','2022-08-23 11:58:43.820',3,1660838400,5172),(168,'2022-08-23 11:58:44','2022-08-23 11:58:43.820',3,1660924800,480),(169,'2022-08-23 11:58:44','2022-08-23 11:58:43.820',3,1661011200,2393),(170,'2022-08-23 11:58:44','2022-08-23 11:58:43.820',3,1661097600,6457),(171,'2022-08-24 09:25:38','2022-08-24 09:25:38.111',4,1661184000,4465),(172,'2022-08-24 16:48:42','2022-08-24 16:48:42.114',3,1661184000,5278),(173,'2022-08-25 16:19:11','2022-08-25 16:19:10.874',4,1661270400,5185),(174,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1659974400,4356),(175,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660060800,4518),(176,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660147200,7045),(177,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660233600,4520),(178,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660320000,10281),(179,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660406400,4056),(180,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660492800,3439),(181,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660579200,3646),(182,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660665600,4464),(183,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660752000,4914),(184,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660838400,3877),(185,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1660924800,5134),(186,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1661011200,2671),(187,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1661097600,4855),(188,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1661184000,3714),(189,'2022-08-25 18:05:41','2022-08-25 18:05:41.216',2,1661270400,5049),(190,'2022-08-26 09:17:39','2022-08-26 09:17:38.848',4,1661356800,4015),(191,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1660579200,4755),(192,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1660665600,3584),(193,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1660752000,4632),(194,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1660838400,3989),(195,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1660924800,6879),(196,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1661011200,9288),(197,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1661097600,8788),(198,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1661184000,5402),(199,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1661270400,1419),(200,'2022-08-26 15:29:24','2022-08-26 15:29:23.954',5,1661356800,1797),(201,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1661443200,5490),(202,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1661529600,4025),(203,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1661616000,2413),(204,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1661702400,7535),(205,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1661788800,4465),(206,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1661875200,3564),(207,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1661961600,4127),(208,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1662048000,3787),(209,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1662134400,1900),(210,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1662220800,1349),(211,'2022-09-06 13:40:57','2022-09-06 13:40:57.229',5,1662307200,3624),(212,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661356800,5938),(213,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661443200,4167),(214,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661529600,6886),(215,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661616000,8039),(216,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661702400,14111),(217,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661788800,6046),(218,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661875200,3039),(219,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1661961600,4474),(220,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1662048000,4243),(221,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1662134400,2015),(222,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1662220800,1580),(223,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1662307200,3969),(224,'2022-09-07 13:39:55','2022-09-07 13:39:54.631',2,1662393600,5610),(225,'2022-09-09 09:59:25','2022-09-09 09:59:25.154',2,1662480000,5332),(226,'2022-09-09 09:59:25','2022-09-09 09:59:25.154',2,1662566400,4902),(227,'2022-09-09 10:03:52','2022-09-09 10:03:52.085',5,1662393600,4645),(228,'2022-09-09 10:03:52','2022-09-09 10:03:52.085',5,1662480000,4610),(229,'2022-09-09 10:03:52','2022-09-09 10:03:52.085',5,1662566400,4179),(230,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1662652800,6134),(231,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1662739200,12851),(232,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1662825600,4701),(233,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1662912000,4248),(234,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1662998400,4295),(235,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1663084800,8227),(236,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1663171200,6035),(237,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1663257600,7917),(238,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1663344000,7652),(239,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1663430400,10605),(240,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1663516800,4439),(241,'2022-09-21 21:26:07','2022-09-21 21:26:06.680',2,1663603200,3854);
/*!40000 ALTER TABLE `wx_step` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-09  7:26:35
