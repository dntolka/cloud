-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: idm
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('201802190000-CreateUserTable.js'),('201802190003-CreateUserRegistrationProfileTable.js'),('201802190005-CreateOrganizationTable.js'),('201802190008-CreateOAuthClientTable.js'),('201802190009-CreateUserAuthorizedApplicationTable.js'),('201802190010-CreateRoleTable.js'),('201802190015-CreatePermissionTable.js'),('201802190020-CreateRoleAssignmentTable.js'),('201802190025-CreateRolePermissionTable.js'),('201802190030-CreateUserOrganizationTable.js'),('201802190035-CreateIotTable.js'),('201802190040-CreatePepProxyTable.js'),('201802190045-CreateAuthZForceTable.js'),('201802190050-CreateAuthTokenTable.js'),('201802190060-CreateOAuthAuthorizationCodeTable.js'),('201802190065-CreateOAuthAccessTokenTable.js'),('201802190070-CreateOAuthRefreshTokenTable.js'),('201802190075-CreateOAuthScopeTable.js'),('20180405125424-CreateUserTourAttribute.js'),('20180612134640-CreateEidasTable.js'),('20180727101745-CreateUserEidasIdAttribute.js'),('20180730094347-CreateTrustedApplicationsTable.js'),('20180828133454-CreatePasswordSalt.js'),('20180921104653-CreateEidasNifColumn.js'),('20180922140934-CreateOauthTokenType.js'),('20181022103002-CreateEidasTypeAndAttributes.js'),('20181108144720-RevokeToken.js'),('20181113121450-FixExtraAndScopeAttribute.js'),('20181203120316-FixTokenTypesLength.js'),('20190116101526-CreateSignOutUrl.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_token`
--

DROP TABLE IF EXISTS `auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `pep_proxy_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`access_token`),
  UNIQUE KEY `access_token` (`access_token`),
  KEY `user_id` (`user_id`),
  KEY `pep_proxy_id` (`pep_proxy_id`),
  CONSTRAINT `auth_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_token_ibfk_2` FOREIGN KEY (`pep_proxy_id`) REFERENCES `pep_proxy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_token`
--

LOCK TABLES `auth_token` WRITE;
/*!40000 ALTER TABLE `auth_token` DISABLE KEYS */;
INSERT INTO `auth_token` VALUES ('000481fd-5d30-47c8-9421-bc2c26f09339','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('01513a62-9b37-4034-a729-5f6b495b46a8','2021-12-22 23:09:59',1,'admin',NULL),('0213affa-95e2-4e4f-92ad-330f20106f18','2021-12-23 17:32:21',1,'admin',NULL),('04688649-924a-4475-b27f-bd8712afe722','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('09ca3604-6487-4942-8af7-33bda358e1c2','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('09f45b41-4b60-430f-9ad4-82d1e352831f','2021-12-23 17:48:36',1,'admin',NULL),('0a2c346b-6a5a-49a9-a05e-4c5221b716e1','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('0c14a42a-7344-46d4-b351-9b72d98494fd','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('0d849a4c-f9b5-427d-b773-91db03df3da1','2021-12-26 15:30:16',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('0f1ae5c7-64f0-4e0c-abd2-00c4dda0bcb9','2021-12-22 22:42:59',1,'admin',NULL),('105ccde7-9dd1-401e-a4d9-7fed281b635a','2021-12-27 22:16:21',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('11477a22-2913-4e45-827a-2098c4b9adc0','2021-12-23 19:32:08',1,'admin',NULL),('11f8aa2a-b46c-4444-adfb-f7d12eecedeb','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('1538f0f3-f5d5-48bb-9e90-33402df13b79','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('161a7f6a-e806-44dd-9b44-b641e99f031d','2021-12-23 19:06:35',1,'admin',NULL),('16d2144a-fe76-4a81-b679-6adf3d70b3f4','2021-12-26 15:58:33',1,'admin',NULL),('175dfd0e-91c0-4c46-8d3e-9384e7740be4','2021-12-23 01:05:44',1,'admin',NULL),('198df65d-c6f6-4649-9b53-52bc415f75db','2021-12-23 17:15:30',1,'admin',NULL),('1acb4937-f75b-497e-9f80-c57666484343','2021-12-22 22:01:56',1,'admin',NULL),('1df9aec7-3772-483a-8ecd-8c8a9d18eedf','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('1e47f48d-eb4c-492c-9be7-4a01fd226456','2021-12-22 21:17:24',1,'admin',NULL),('1e817c7a-367b-4a38-a847-d1e7e144f5ce','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('1fb0b8bb-7e5c-4475-8d2f-e1c1aafe661e','2021-12-23 19:27:13',1,'admin',NULL),('20727568-e9c7-4d65-99aa-4a489533a1e8','2021-12-23 01:05:21',1,'admin',NULL),('20d20247-5743-4257-8e3c-ce1562cfce4f','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('21815d19-ad3a-4123-8cd0-7a361f0235b4','2021-12-22 23:08:31',1,'admin',NULL),('23aaafad-b17e-4861-92f4-11be602ae1a9','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('23fa8ecb-5642-4f28-baae-2f31f1578f3b','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('251a05b8-51bc-4592-a990-862f58288774','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('26703f97-bb3d-48aa-bfad-123b2e4ba2e1','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('2773ea71-86b3-4aaf-8a88-850fa5c22915','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('27ea5c1c-faf9-4122-8b2a-9b892ee4a354','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('2885faf8-d775-481c-8993-4a6e3a7e62a4','2021-12-22 19:31:25',1,'admin',NULL),('2aa1758f-30f3-46a8-a3ea-dac518208fe0','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('2b74596d-d7b7-4d00-a20e-016f1efb5c9a','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('2f2c66ee-eb82-4886-bb59-f580903c15c0','2021-12-22 22:43:00',1,'admin',NULL),('2f61274c-9050-458d-9dae-0ab73255d762','2021-12-23 01:14:47',1,'admin',NULL),('31647727-946c-4b4d-8b58-50b9c6e474e4','2021-12-22 22:44:53',1,'admin',NULL),('31f45dff-0451-441c-8bba-91f757133c77','2021-12-22 19:17:00',1,'admin',NULL),('34266cd2-3f65-4bbb-8a06-f0c0760798e9','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('34610f93-e2c1-44bb-baec-9eed2be28fbd','2021-12-16 17:56:05',1,'admin',NULL),('34fecf71-e25a-43a4-b3b8-c7e94b2279e0','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3586dcee-0518-4f85-bc87-2ac6b9f04f3a','2021-12-23 17:29:48',1,'admin',NULL),('35d018be-46b0-43b4-a100-6100fd504f9c','2021-12-16 17:57:27',1,'admin',NULL),('3630f1e3-95d8-4d85-821f-c84b2094a475','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('38c0adff-c366-4243-be9b-f883025ac878','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('38efc608-39cb-46cf-83ff-27376f46b0cd','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('395ab3e1-8cc9-4069-acd3-23daa01322a6','2021-12-23 19:41:34',1,'admin',NULL),('3a3c72b2-0680-4a7e-a3b4-c907c04e35a3','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3b3844cc-bb57-407d-9edd-252fd25b41d5','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3b4a9837-0d1e-49e3-b3e8-09bc48a21576','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3b6ac949-447b-4c1a-8b40-1f5fe82355c4','2021-12-23 19:27:36',1,'admin',NULL),('3b738f42-cb74-4dbd-a985-8e6efbb11611','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3b9ba9e0-a11e-4ec8-817d-e94b51c62795','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3c053623-886e-4380-9850-2670ae717ed0','2021-12-23 01:07:15',1,'admin',NULL),('3cc58787-9567-43b3-a59c-81dabb3c1e69','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3d7da4a7-c4fa-4964-af64-130f4726c20b','2021-12-23 19:32:08',1,'admin',NULL),('3dd623ab-8bc1-4f42-b051-db7ca1c60273','2021-12-16 17:33:51',1,'admin',NULL),('3e1e8972-b8cd-435c-95c3-a3ed2b7636b5','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('3ebf93a0-afa2-4a03-addd-180fb4d94b6d','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('4051f819-5fc8-427d-9d8e-54d377ba4ce4','2021-12-16 17:59:17',1,'admin',NULL),('421bc31c-5044-4e97-b655-19ed88cff34a','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('43308cff-69b3-497b-bab9-f6fd1fb93148','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('43b0b0dc-b465-416b-a0fc-a6b2c74287dc','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('488340e4-0f8c-4072-b85a-2e9832b30257','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('4b9d6e89-fb5f-4190-9b11-40cae68d1f57','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('4d7a2855-c2b8-4135-94ac-ba47c805c7c7','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('4da22eb9-7616-46e3-8cb8-67e1830a3a4b','2021-12-23 17:48:07',1,'admin',NULL),('4dbc4dee-d8ad-43a2-87b5-9a87b16c18aa','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('4e62b5fa-6f55-435a-a572-ccf3a2d02e11','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('50d04990-c0de-47e0-874c-f7d3441e299b','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('5160dc87-88bb-43b3-9738-e725689029e8','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('516f7a06-d1de-481e-b67c-68c09c377517','2021-12-27 22:16:20',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('533ea22b-45d8-4934-9107-5488a6fd1cb6','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('544e02b4-aa53-4d8e-8bc2-bf639b15a5f4','2021-12-23 17:48:06',1,'admin',NULL),('545737fa-31f9-4021-ba2a-ec1fd4471f4d','2021-12-22 20:36:03',1,'admin',NULL),('54f8c7d3-bd84-49af-8901-2d418f721fee','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('55ef1973-b443-4740-ac18-682949500d23','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('569da94c-dfcb-41cc-bf51-e1867f1ede0f','2021-12-23 19:30:17',1,'admin',NULL),('56dd9547-f84d-4881-8e99-858a637b7df2','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('583ba882-ab41-4cdb-b75c-3f04cece8830','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('5905a4ba-818b-499f-8cf4-1d435e4f0f66','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('5b6886a0-cda0-4c47-9ed1-32dda2665884','2021-12-22 23:09:05',1,'admin',NULL),('5b8f0654-8c55-4491-b979-acbd56cae384','2021-12-23 17:29:43',1,'admin',NULL),('5d1cd7ec-7003-4a78-9a62-eb4d7779d867','2021-12-22 19:50:46',1,'admin',NULL),('5dad856f-37a7-479c-8f6f-5aa28d0aa515','2021-12-23 19:33:05',1,'admin',NULL),('5e69bae2-7765-46e8-b40d-c6b658814cf7','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('5eca9cf5-d2a7-4861-ae1a-eeb0e5deb65b','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('5f470d3d-1e5d-4ccb-b6c3-c93540729ded','2021-12-23 17:40:06',1,'admin',NULL),('60892f2a-acde-4cf9-ad9f-8ec9b628a566','2021-12-22 22:59:46',1,'admin',NULL),('60b41bf2-ae5a-4d4f-9c87-d4f318702b04','2021-12-23 17:38:47',1,'admin',NULL),('6118567a-fa97-4772-ac0b-5b883371a5a1','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('6234483b-d3c6-41ab-8295-95e9e854525d','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('62854b5c-498e-4a62-a78e-5e4b5bf4974f','2021-12-23 17:42:02',1,'admin',NULL),('62aec7de-71d2-4202-a1b6-44034f954c31','2021-12-22 23:00:13',1,'admin',NULL),('62bf47a7-f6f0-46f4-b0f3-3344158c735d','2021-12-27 22:16:21',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('62cfd73c-4023-42c1-8ed6-55d77f76335b','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('62f0b779-357f-42fd-a6dd-56360bc5321a','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('63640f21-4683-4843-a4e9-f206417e0d09','2021-12-22 23:09:04',1,'admin',NULL),('6364bad8-9feb-4fcc-af4b-914b75f79776','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('645110f2-13f0-4a3b-86df-ea7378f1e085','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('65214c58-3303-43d7-9199-9d46dbc95120','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('6539c42b-80a4-4714-a818-86ad3901d646','2021-12-24 22:44:26',1,'admin',NULL),('65aa8fff-1a85-467f-b72e-fab8a3d4b6e6','2021-12-23 19:27:14',1,'admin',NULL),('66c62ddc-ab00-40d9-992e-c352f0d741a9','2021-12-22 21:31:48',1,'admin',NULL),('672cde67-1818-48bf-9322-2c5f6d085efe','2021-12-23 19:38:24',1,'admin',NULL),('6730af4f-2164-4f54-9a7d-637c4fdddebf','2021-12-23 19:41:33',1,'admin',NULL),('68c13ec3-87ef-4053-800f-a5b98bbc6b66','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('68efee8f-9e9c-452c-affd-4a4b93e7ef08','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('68ffc5e4-54f3-4a17-ab2e-1403f16ed27c','2021-12-22 22:00:53',1,'admin',NULL),('69358a37-88fa-4911-a211-7389e372e188','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('6a5fbf8b-cd3c-477e-b3ea-164f8c95163a','2021-12-23 17:42:54',1,'admin',NULL),('6aa45f44-7883-45e6-9a2b-ba7b175fcfbc','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('6b51048a-5c2f-46d5-b147-68cb55dd4889','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('6bf374c5-3c71-4952-983f-426b1251b0bd','2021-12-22 19:52:32',1,'admin',NULL),('6c301a14-6231-4dbc-b9ed-fe0f5416c65c','2021-12-23 01:21:46',1,'admin',NULL),('6e0736a1-1c18-4071-a1c7-2b08fc7a98a7','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('6e5810ef-ecb4-488b-82f3-f186f5e4cee7','2021-12-27 22:16:21',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('6ea6ad52-ca10-46bd-8861-f609cd5ef5c3','2021-12-23 17:32:22',1,'admin',NULL),('7104d0b9-9b02-4435-8f68-15590bdee916','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('71436a21-b784-4db7-929a-c6e70464b592','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('720c8949-0cf9-4d57-883b-39322035a95e','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('722fba18-1004-49f2-8f28-d7f299f715a8','2021-12-22 23:05:36',1,'admin',NULL),('729a960e-86cd-4255-9252-3956c489446b','2021-12-27 22:16:20',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('740b0fab-cd2c-455d-a3fd-7803cbff95a1','2021-12-22 20:22:50',1,'admin',NULL),('754dcb30-f432-40d2-9b03-507be7b2c91d','2021-12-22 21:09:20',1,'admin',NULL),('756395ae-1ec4-40fd-9c6b-aab4f11d02ba','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('7578a1ec-fd49-4792-b2f5-dc6957c77124','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('75ec59e0-ed89-4df0-aef4-6704c260a69f','2021-12-23 19:17:29',1,'admin',NULL),('76074642-0467-44ff-b754-b2689bf13b22','2021-12-23 19:30:17',1,'admin',NULL),('78a9b281-d5e1-499f-a8df-850db195ae0f','2021-12-23 17:30:29',1,'admin',NULL),('78e221f9-ff48-4ffe-92f1-b0e711f6133f','2021-12-26 15:32:27',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('79f49f24-8063-48ff-8d4f-8af21379c22c','2021-12-22 22:42:44',1,'admin',NULL),('7a1bbcfe-bd7f-4101-856f-391f452f5da0','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('7a1cbbca-640c-4f76-88d5-3c2975b7c8f4','2021-12-22 19:20:52',1,'admin',NULL),('7a2a9698-76ca-4db5-a5ca-8a20f8f53a1b','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('7a86e999-1df9-460c-a13f-d4166290f2eb','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('7bd3886a-4c70-4b5f-a12f-e66f2032ec6b','2021-12-23 19:36:11',1,'admin',NULL),('7f150cbf-643c-472c-90c9-0054da19c5b4','2021-12-23 00:44:25',1,'admin',NULL),('832ce444-ba88-4545-8cf6-1d36b578690b','2021-12-22 21:31:52',1,'admin',NULL),('83580e78-5348-46e9-a432-3e51422f6f5d','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('84bfde2e-be1d-4866-aeee-b8c1bdfc2344','2021-12-23 19:33:02',1,'admin',NULL),('869f9c74-86a8-4ca6-8b11-f1ce7b5b0469','2021-12-22 20:24:22',1,'admin',NULL),('86ec24d1-5f05-4a2a-bfdd-ce4c3d93a639','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('86f48756-d7d5-46a1-b68a-9b36d538428a','2021-12-22 23:07:05',1,'admin',NULL),('891e7e72-058d-4737-8bb4-226b4863ceaa','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('8a5c88a7-8fd5-4c2b-b5c5-f9e8271bbddb','2021-12-22 19:23:18',1,'admin',NULL),('8a5c9125-afc4-4ca4-9c08-40f104f8c107','2021-12-23 17:18:59',1,'admin',NULL),('8b1b4153-3ba2-4736-8968-f618b4cd3727','2021-12-23 01:14:24',1,'admin',NULL),('8b8f7cc1-e2bc-4522-9789-2c9049d0bac6','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('8bcff844-1c30-4f7c-8d48-85be20dccfb4','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('8ede08bd-433a-4e77-ada1-fe880205ca56','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('91880d1d-5240-4901-a289-28cba6db3601','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('91d77af9-325d-4279-84ce-3da5b1532c2d','2021-12-23 17:23:47',1,'admin',NULL),('932ad50c-1a51-4b55-8823-af34cb479490','2021-12-23 19:26:54',1,'admin',NULL),('9354902e-63ad-4a38-b4f1-2c8828120e25','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('93d95b01-ce82-484a-8499-ab3dd3c3930c','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9458b43d-ff78-4eba-a71e-d9d9fd1d1c99','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9465697a-9204-4994-ab3a-9c8333d12119','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9552aa25-fc6e-467f-a9dc-d7a84ccf5336','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('96e41fa1-304d-4fe5-96e0-12b97d6019f9','2021-12-23 01:05:22',1,'admin',NULL),('96e8c31c-8aa0-46c8-84ce-f24ede7a859e','2021-12-27 22:16:21',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9708b4c0-d462-43ec-922e-661c72bdb8d3','2021-12-22 20:26:44',1,'admin',NULL),('970936a5-cc84-4fa2-8e50-3068a1ac9288','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9841a357-2706-46fb-8622-4599e1a537d4','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('98b940f5-72e5-46e0-8955-c2cec663a788','2021-12-23 17:41:07',1,'admin',NULL),('9983009a-8d31-4922-bb9b-964be2b91019','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('99d77488-2dec-4cf4-b48c-e17a6e0f131b','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9a1a3c54-c247-4bb1-baa6-6c1dba3d20c6','2021-12-22 19:22:52',1,'admin',NULL),('9adc6ca2-81c6-4982-8feb-1deff4f67ad4','2021-12-23 19:26:30',1,'admin',NULL),('9b92ba15-f01f-4587-8e60-f33830cd8e61','2021-12-23 17:24:32',1,'admin',NULL),('9c6233d1-4a53-4121-b828-7fc1b72f8882','2021-12-22 19:16:22',1,'admin',NULL),('9c71aa2e-94b8-4e97-9adb-44f1bc206830','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9cd01055-c544-46d0-9e59-2919997d668f','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9ce386e6-7e6d-4750-bce6-8fff3ed905d6','2021-12-22 23:06:34',1,'admin',NULL),('9d6d0faa-978a-48e3-a38a-fff916b51e1c','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('9df7ffcf-96e2-497f-964e-b807cff0b531','2021-12-22 22:01:39',1,'admin',NULL),('9f44af1c-cfec-4667-8040-065644a13a6b','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('a0b3ab8a-8fc6-41c6-8003-6fa07984e464','2021-12-23 19:30:58',1,'admin',NULL),('a355ca55-48f8-4205-b257-e50d909c5a3c','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('a4cd81c8-3912-478a-8710-68ea19f6356e','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('a6886333-2d36-4680-ae6f-b9c837430c89','2021-12-23 19:36:10',1,'admin',NULL),('a6a8a19c-1e1a-41c7-81a0-104042d8b396','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('a7db06de-78e0-4c2e-ac9d-aaa55ec960aa','2021-12-23 19:29:32',1,'admin',NULL),('aa521801-7b48-4a43-a8af-9ba45d85930a','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('aad78fed-4587-4b33-9709-c752e5c968cf','2021-12-23 19:17:11',1,'admin',NULL),('acdadf89-c3a2-49d6-a88a-b848be66acf0','2021-12-23 17:15:52',1,'admin',NULL),('ad136edc-ab5f-4ba3-beef-bf8c279734b5','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('ad18dc9b-e44e-4238-8c72-a18b2ca75768','2021-12-23 17:30:13',1,'admin',NULL),('ad6a3079-f2cf-4c54-b19f-bfb6cb6ae133','2021-12-23 17:33:21',1,'admin',NULL),('adfb5372-e3ee-4255-b736-7c89dee58aec','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('aee4c636-69c7-4a03-87c7-445b6c608d3f','2021-12-22 19:17:54',1,'admin',NULL),('b035d7c6-ecad-4c59-9c4c-7054d9707e0d','2021-12-26 15:30:17',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('b1df8bbd-6453-4455-bc86-90d3f0243567','2021-12-23 17:23:17',1,'admin',NULL),('b2ecb028-dc5b-4e39-897c-53d03269f8b2','2021-12-14 17:27:51',1,'admin',NULL),('b4c82c29-b852-4d99-b82e-5a783e8d4e46','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('b7151402-80fe-470d-80cc-8b246af2164e','2021-12-22 19:19:04',1,'admin',NULL),('b77123fe-88c6-45a0-9e74-e9005ea77d0f','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('b9cbc8e6-37d1-41ee-a7ff-06343d82ea0a','2021-12-23 19:33:01',1,'admin',NULL),('ba287912-8f81-4842-a677-a53588a12f92','2021-12-23 19:29:34',1,'admin',NULL),('ba6d6eb6-e195-4f92-9f60-531291aec119','2021-12-23 19:29:33',1,'admin',NULL),('ba74f796-e3ee-47a8-98f3-9e9ecea30d18','2021-12-22 23:06:33',1,'admin',NULL),('bd47d149-d8ba-4189-8d88-79a6a925a9df','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('be5bd089-8e43-4052-9426-cfe5a46f582f','2021-12-23 17:31:31',1,'admin',NULL),('beadeb8b-004d-441f-b69b-bebc8e9178b5','2021-12-27 22:16:21',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c092b933-3c0f-4ed2-ae84-84fffe6aefbb','2021-12-16 17:40:11',1,'admin',NULL),('c09fa4a2-c74c-4391-bba1-b77ed4cfb662','2021-12-22 19:51:02',1,'admin',NULL),('c0dadc7b-e46a-4b35-b630-671d2f80c87d','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c130ed60-8e1c-4318-9d62-89f7655b7b7f','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c1c6213d-dbc8-45fc-a41d-7d08dc538a25','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c1fa1060-d980-4d3f-8c3b-1119c350b3a9','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c336a588-f73b-485a-b15f-c8d2782caf54','2021-12-23 19:41:56',1,'admin',NULL),('c36bf194-9b2a-4593-b385-42a8afe67639','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c4112a20-19a2-49f8-9fe7-99c2f3fb9acc','2021-12-23 17:42:52',1,'admin',NULL),('c46fcddb-d7c6-4646-89f6-2b7e87c1e5bb','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c470eed1-52e5-44ea-8146-ba6cad869534','2021-12-25 15:03:21',1,'admin',NULL),('c49e834c-21b1-4333-8c17-9f92dfb707cb','2021-12-22 20:35:56',1,'admin',NULL),('c4e32e80-e4e5-4b07-9d63-677bb9b92a0d','2021-12-22 22:40:27',1,'admin',NULL),('c4f225be-4567-4b11-abfe-d1f286c18e19','2021-12-22 20:24:03',1,'admin',NULL),('c5360f9a-fb64-45a9-834d-80d44440f831','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c5e15f86-3e74-4d1e-8db0-210898588888','2021-12-22 22:38:50',1,'admin',NULL),('c60cac1f-6f34-4e22-b7aa-9bbdb1b08e4d','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c64b4515-ae87-4942-b411-4dc956f47eae','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c6f1237e-cf96-4183-be62-a94e06454218','2021-12-26 15:32:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('c939b0a3-58a6-44dd-b900-ff0c45b92afd','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('ca66a55a-73ca-4d0d-8520-e4d0dc680376','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('ca7a0923-feec-4b3e-8ae3-fd08c516512c','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('cbb7f040-6299-45f0-b6b4-d07a8f60850a','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('ccc57bb3-c793-4e17-8b94-a31aa5a4e1b5','2021-12-16 17:29:55',1,'admin',NULL),('cd11d7db-a212-4a8b-9905-ef660a17c0e6','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d0936783-e7b4-4868-9630-b04a301fe629','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d161e1f0-a475-49a7-9809-0764b8064deb','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d176824f-c214-4360-9cb1-f0a04e5b95f3','2021-12-27 22:16:23',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d2816226-2b4e-4a9e-80c6-10d4fd4e7b72','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d30fb707-d1ff-4e66-a854-f198705028f5','2021-12-26 23:10:19',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d382081e-e6aa-4b9c-876f-8b5a87b0d1f8','2021-12-23 17:24:32',1,'admin',NULL),('d394ce3a-6950-4c6d-8828-40fc9744751b','2021-12-23 19:00:35',1,'admin',NULL),('d3a5a7af-a0f9-49c1-be86-dbd266a3f9c4','2021-12-22 23:09:59',1,'admin',NULL),('d41921b8-c410-4a0e-ae84-12722073e2dd','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d4adf51d-af06-4678-a43f-872058ea0650','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d4b0c704-0b33-4e47-a606-ce7a6a2ffaf3','2021-12-23 17:39:42',1,'admin',NULL),('d730c474-b81f-4a90-a0e5-8e86028cdbb1','2021-12-26 15:30:47',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('d7a6b10a-c563-4dd5-b386-d4f69d278bb3','2021-12-22 21:17:04',1,'admin',NULL),('d950fdfe-486d-4e3c-bdf7-fc2701dbe983','2021-12-24 02:46:49',1,'admin',NULL),('da9bba25-d613-41ff-8a75-a32ce16d4c01','2021-12-22 19:23:22',1,'admin',NULL),('daf319c8-090c-47df-b8d5-eb284a43e15a','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('dc36ad78-eb1f-468d-84b4-953200699cdf','2021-12-22 23:00:45',1,'admin',NULL),('def86639-64ec-474a-95be-411be5182ead','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('df3ebc49-e45b-49ec-b84a-18111a266ad6','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('e1da7079-54ea-4879-9056-3d8b5e340ac5','2021-12-22 20:15:37',1,'admin',NULL),('e1ffa5eb-d6c6-4d39-bff2-e5248a752782','2021-12-22 22:31:47',1,'admin',NULL),('e282cfcf-39dc-4f0c-aadc-72fc7ee3deca','2021-12-26 23:50:29',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('e38871fd-4ac2-42e1-b2f6-be44f9fcdb1a','2021-12-23 01:21:27',1,'admin',NULL),('e45de31f-cb0c-474b-9180-af5f91a95476','2021-12-23 17:36:32',1,'admin',NULL),('e470b1fd-1b33-4626-a90b-f3059db1e48b','2021-12-22 20:38:23',1,'admin',NULL),('e53b84dc-302b-45fd-abc1-d80c22630887','2021-12-24 22:49:26',1,'admin',NULL),('e5d09f70-69ba-4725-af79-02cad88fb552','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('e69dc7cf-df9f-486c-ae03-04d8430962e0','2021-12-26 15:59:03',1,'admin',NULL),('e764cc20-3833-466c-87c3-b21ed873247c','2021-12-25 14:59:46',1,'admin',NULL),('ef3cc3f1-14fd-45f4-887d-6f85084efae5','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('effd867e-b19b-43fe-a1b9-f6e6fc1186c3','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('f5dc6c07-55c7-4c0e-9f33-5666f330467a','2021-12-27 09:34:06',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('f9b3e568-e170-463d-a3cd-4bcec8119dfb','2021-12-22 22:40:23',1,'admin',NULL),('f9eba08b-c3ea-4422-85fc-99ab68a18cad','2021-12-26 23:10:18',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('fb67ccfa-ab85-45e2-bfb6-c87678af2d0f','2021-12-26 23:50:28',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b'),('fc3d5a56-7970-4bcb-831f-77f1974fcad8','2021-12-27 22:16:21',1,NULL,'pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b');
/*!40000 ALTER TABLE `auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authzforce`
--

DROP TABLE IF EXISTS `authzforce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authzforce` (
  `az_domain` varchar(255) NOT NULL,
  `policy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`az_domain`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `authzforce_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authzforce`
--

LOCK TABLES `authzforce` WRITE;
/*!40000 ALTER TABLE `authzforce` DISABLE KEYS */;
/*!40000 ALTER TABLE `authzforce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eidas_credentials`
--

DROP TABLE IF EXISTS `eidas_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eidas_credentials` (
  `id` varchar(36) NOT NULL,
  `support_contact_person_name` varchar(255) DEFAULT NULL,
  `support_contact_person_surname` varchar(255) DEFAULT NULL,
  `support_contact_person_email` varchar(255) DEFAULT NULL,
  `support_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `support_contact_person_company` varchar(255) DEFAULT NULL,
  `technical_contact_person_name` varchar(255) DEFAULT NULL,
  `technical_contact_person_surname` varchar(255) DEFAULT NULL,
  `technical_contact_person_email` varchar(255) DEFAULT NULL,
  `technical_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `technical_contact_person_company` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `organization_url` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `organization_nif` varchar(255) DEFAULT NULL,
  `sp_type` varchar(255) DEFAULT 'private',
  `attributes_list` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `eidas_credentials_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eidas_credentials`
--

LOCK TABLES `eidas_credentials` WRITE;
/*!40000 ALTER TABLE `eidas_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `eidas_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot`
--

DROP TABLE IF EXISTS `iot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iot` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `iot_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot`
--

LOCK TABLES `iot` WRITE;
/*!40000 ALTER TABLE `iot` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`access_token`),
  UNIQUE KEY `access_token` (`access_token`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `user_id` (`user_id`),
  KEY `iot_id` (`iot_id`),
  KEY `refresh_token` (`refresh_token`),
  KEY `authorization_code_at` (`authorization_code`),
  CONSTRAINT `authorization_code_at` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  CONSTRAINT `oauth_access_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_access_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_access_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refresh_token` FOREIGN KEY (`refresh_token`) REFERENCES `oauth_refresh_token` (`refresh_token`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
INSERT INTO `oauth_access_token` VALUES ('014c9f5ac04fa09a8eb07dd7afb8dbb1976378a1','2021-12-24 22:56:43','bearer','50c198f4bcf7c31a22dab86d4b72017b1a351974',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('03f25569f1fdf125f18e4cd281aac6df17fbc3a6','2021-12-25 21:14:51','bearer','d57271166e163a6584e4cfa6b45b7e1ab1abb563',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('04fff2b80d2685a44ff7d8640147a5af1a750935','2021-12-26 15:43:04','bearer','0b2aac53bd31057f7df59fa13cdd0311e908342e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('05c891a0beeec4f91eaf0d755493c9572acf442a','2021-12-26 00:35:39','bearer','a6ad2e8d4c95ec7717beb87215ec49288fdf2cbc',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('0718115e02ce2fb097288a538736e16a4e37a8fc','2021-12-26 23:27:46','bearer','edcaccd2849052b4ace79af14a4a3c230893e933',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('087070a53f1a82c4ce5e6ecc315fc4a595d267c5','2021-12-26 00:45:41','bearer','72b11629d2fada3ac835a10dfd899aea659ab9e3',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('0cd6f0f031636008a5d3ef590e87b0be5d048d7d','2021-12-22 21:00:29','bearer','9019a78bfb1af4dce446e7c0a65fbda1e1baad20',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('0efaed2e9b2c2867700d2ebdab8d6bd8fb02642b','2021-12-24 23:09:15','bearer','d0a03918feca5b88500a19d1670a6c3ae75c91bd',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('11b831f48f5747559be2c632b99c69c392a94f77','2021-12-25 21:22:38','bearer','6ad5896f7d8f215d99166826c90bb451e7565901',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('16e8ae0963c5300f4321e526d654586316c6b3c1','2021-12-27 00:37:51','bearer','d95b16a2cafce63290a481fc929dd885005d6a6f',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('17cfb2e2bc763863c4e056096fcd9b6b59e64a24','2021-12-26 15:54:00','bearer','1499271c880c5e9e106b2f21aa20b2f3a04c24c1',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('19578a4c8fa8d59fd60660966535b16a55deac91','2021-12-15 13:19:18','bearer','da2b79caf2584e769f8c9dc44a04b6e1841b8421',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('1969785a327a692ae2c2769bba77d678bd7f6bc4','2021-12-27 12:34:51','bearer','e69bbdc63b15b41b14c1804369678e7c21c7a120',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('1a219c5967df6099a15d406ca08002fbb0506ea9','2021-12-24 18:07:11','bearer','54fa7b15d98ac28b40055dff966fdef67f882f2b',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('1aa5575eee3b9d30f21fee506dea0f6e33037105','2021-12-14 20:26:11','bearer','b3a0df69a9b93ebbe11907b660d3d33ff0ea1cc1',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('1ab0b8fde15f4eb9dd43a0f742bd08dc49316c9a','2021-12-26 15:55:54','bearer','b4b3ea76bd73c8c46f138dd9efa802196c6181e8',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('1e92531c6ee16ed17860626e3085478a8ecf1be8','2021-12-26 15:57:27','bearer','ea02999b8af9e5d415fa431bba852ec8dd241ff0',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('1f7c44ab4738feb28c9e17860c7b5398496cc8fb','2021-12-25 15:03:40','bearer','56de87b8e1b103f47b2d1eb2b9cb6f05b2480edf',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('215327d00a1148b634ccf125ca631829e3493003','2021-12-22 21:03:22','bearer','dac6cae5f0585cc8160720b19def8195bf3ad5a3',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('220593910abcb0d1124969e7c0c72f75b8937ceb','2021-12-24 23:10:15','bearer','2bc25534c7030464a8ef7508ffdc5739eea1ded2',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('23eac3fd81a454efbc0b7e3230522699402449d1','2021-12-22 19:20:52','bearer','f96c2f5e20a40ea474abe1c9d1ae458fce8ba07d',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('2486c094643dd804b744c0320f73b26b6e12caee','2021-12-27 12:08:32','bearer','f4ea1fd8b37c861a8753c6e56a2f8eef1e99d4d1',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('28314d522cb56d69cc9d1ec8dfd15470b4ea4454','2021-12-23 19:06:35','bearer','c1cfce75f8e6d46e5f772106441fb5970064fc0e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('28d3b11f51d4c50f427c1e9d73954e60ccc2ed37','2021-12-26 15:43:41','bearer','34d77c21d12f8429a347378b3d599ddc2c956861',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('29e15d807aa4534d6bf5906f2d9b4af24c713841','2021-12-26 13:32:20','bearer','8746e87663ccde4992e760c72711301bd7f435f1',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('2bf3e2dc3e955a869549bc7d5a8f12faf79e1011','2021-12-27 19:51:37','bearer','89ac4e89bb20f97a3a8fd86e86060cd358d8530c',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('2fa65929b5cb87e7a808c8e0b1c7b52619ef28dc','2021-12-22 19:19:04','bearer','512f05193bc37e926aa473466ad4523f084c6b42',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('323be8855ab5bd91bc95b78ad2b8c6fd3a991c77','2021-12-26 14:13:47','bearer','d54e1ad3497d07a37482190d86d667229bc651f1',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('32b4d5b3fd88001495932768ea687ff85eca5fd4','2021-12-27 19:52:52','bearer','8846d39491d107f98af0b153ad5820c79fd6863a',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('330a6d67c4c078918c2b12398a4234f86b32f5d9','2021-12-23 19:36:10','bearer','48e34d147c6a5778539d6fc52ac253f7a66a50ec',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('3458f311d8bc8d6e61d3efe25db3e9ba787a3be5','2021-12-26 13:37:24','bearer','c110385d3fa2a0fea7a613065c67fc663284ebc8',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('35545c9e0eb464492846c17801a49be872ad1f3b','2021-12-27 19:53:22','bearer','175cc2351702912868446344bb5ac41d47aabc02',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('389e0bdd01b1f71e8be04cfad23f3f37096794b6','2021-12-25 11:55:23','bearer','6a37ea4937ec5aa8e4cd24085cda0c4d3c663153',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('38ed4a2fe20de0a2dabe6e64a3615db2113b8fe8','2021-12-26 15:47:27','bearer','8a928bb5aa5a8ba1d2fd9cd37a9e1f12256f863a',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('3b37e0989b9eb9891143fe82701294cb63fa3849','2021-12-15 13:43:40','bearer','6e19d79a576aabad3cebc7a3b1aafea85f019694',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('3f5ab3c78c2bb10a5579937ff1ae0867ae894839','2021-12-26 23:34:09','bearer','a797747363866f041fb68c73df80797b8679bc6b',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('3f6779ea0b173e43b394c7fe32dc88d5a9bb40b9','2021-12-27 12:02:55','bearer','087ede95d85685b3c0d39785f402724bcc3f618a',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('3fa15b07a37633cb10ac7e07417340fdd586a4cd','2021-12-22 20:59:50','bearer','ea39eab8710126a2c8452365fbd641f86af0225f',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('4240cb881fc9b014f8a1ea923b839d5377e4b122','2021-12-22 21:50:00','bearer','2051956075ed139fa97dcced8a0a73abdf4aa563',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('44b71de6a065f05971076495d719a9775b73e2d7','2021-12-15 13:37:46','bearer','44107724b53f7803b223887654079d594229b096',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('452692022cd8def39d043e06454567f238d30c0d','2021-12-15 18:37:30','bearer','90f0a8341577d718127a34281c3a8fab3d6cc264',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('4533b880657da2e3f3a234f67d691629308ddb66','2021-12-27 00:01:36','bearer','bf901c4f523668b30ac02a02d2513c513ccc0348',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('4594d159338a90636a5b6a41b44e9ebfd0aba566','2021-12-26 13:27:24','bearer','b56604224963fe5647380de0841d8c2c7eb23089',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('47c04424fdac26fadeaac7ef7810d3472ef83755','2021-12-22 19:23:22','bearer','b364d6be3a7919d09cedddbec9b2897a171f24cf',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('47f90ed798bbee5ea45608b0a36c6f882f9bed80','2021-12-22 19:50:46','bearer','aafa1e06ec6ff23fd79e684c8d03be78f28a7bbe',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('4a4827716ba31c95fb80e1ea546cf82fa2ef81c7','2021-12-26 13:35:27','bearer','dc634c707c4ad01fda3cd284fa555f8342b87522',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('4a9a700de13a5f7533f1173d5e03da5035750e1f','2021-12-22 20:52:01','bearer','a9a2d320f771808a7ed0f2c76864d5f207ba4451',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('4c21e488fd050307f1ddaf53d83f27d4bd175b0c','2021-12-15 13:37:22','bearer','7f9381870048a01c59de48ed747dfd6d21809d77',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('4c457cf4f9087cfbe072be8845be0c18f8764b00','2021-12-26 16:02:10','bearer','9cd7447ca4dc364eb128d2a5d6185f4351f65d8e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL),('4ed3856207abe4889ac8844429282f19dd85785f','2021-12-23 19:17:29','bearer','0d705468f41f7b9dce3138e1e031baa49b307de5',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('4edc212290148e177d9b256e3cb353c7a34778d5','2021-12-22 19:22:52','bearer','cdca72656113112cfe54dc0917fcca31a8940a32',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('4f2bbf7a074991f73b437236b6a559993aafa6aa','2021-12-22 19:31:25','bearer','1fdb13c11652ca4c69f12bf3b8415e20a7bd0445',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('51341968bcb935ef539cf78f8a3df3e6054c809b','2021-12-23 19:36:11','bearer','e717a08e2a5c92b2db3751c7b9e61195bede2393',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('533445ac6ccd2ab3395a43c3413680f01d48c4fa','2021-12-23 19:27:14','bearer','c523f9e36234e3906ecd67df1abd9bd3020afe06',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('53a6d7fe44e74c5303c58f75823fc61e7c5961e8','2021-12-26 00:23:47','bearer','c6f112cff566811b69a00d42ac8d008684f768dd',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('55180501e7b99bd81df306fe349b11648f44662f','2021-12-15 13:42:39','bearer','27d8bfa3dffc3913251c054027b89bca2471c9ca',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('5550badd7908b04f9648bdcdfce4ac8b51aa3d67','2021-12-15 13:14:23','bearer','90395c5db938ccf536874d5edcef177ed0e1515e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('58d980caf23ad5f74528a3901c957ddf7735e32f','2021-12-27 11:35:09','bearer','801697adb53f59c8f5b524e47892d50e0a86d068',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('58f0ddd758bca9e2905d9f5b77b1938d090218ca','2021-12-15 13:32:08','bearer','7d821ca23d1272f357d9ca6862c7cfbb183ff213',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('58f81e91445a88b2cf60426904dbf803acba9460','2021-12-27 11:35:28','bearer','279db63f750bc99c11b1f61e1c304b2b5966e676',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('5c5d3ba94fa1a9b8f0b8a4c490243fd9d381640c','2021-12-27 00:25:41','bearer','39e00d16094091029c603845bfeb56821c1ee5f1',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('5d5b0d61eb55b9194f0d84b1a671b1ded2708371','2021-12-23 19:29:33','bearer','4627784e65d40cbcb13e3c90a811f0996934a00c',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('5e4b56ce51c10f81e40513116efa84ec6e3231d2','2021-12-23 19:32:08','bearer','7f9e0421543bf0de192ece26d072081b762866f6',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('5ee900253b8ebebf39e92227471f8f052dbe162e','2021-12-26 00:42:42','bearer','6d98787ed7fb62a8a15aab9618ec22c404f37366',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('5f3907044f1542bf03cb035c5af1688f23bf965a','2021-12-26 15:53:30','bearer','04df0e855bb69d006d85c8d6a427e793eb5bffbe',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('6165f73f67dfd36ae34bdd078b8bccd491e42bd3','2021-12-23 19:30:58','bearer','f13383ed59bf29d8329ad292db32c76800c57226',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('61b3e310f5fe4dd6d89ebcc0545617206e033bc9','2021-12-22 21:01:32','bearer','98568046b5701767d7b99e5b5da918a7470dee17',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('61bc85df6708f229f8548a57f98539c52a95e2c3','2021-12-23 19:04:25','bearer','efb584337c18b4be600968a10daf8e7a543495ba',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('6502a19237896b482855cfef88d78f7012e0a636','2021-12-22 20:56:22','bearer','dccfe3343a60042cf2f5e9733a92695e11a4a8bc',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('6688768bf745d6cb5931a408b623fc0beeab17dd','2021-12-25 15:05:38','bearer','0a2c40968836a2e618c2dead4552c3ab6a70f93f',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('686c286d2768dc9f82e9d4cc11398dc362f67ae3','2021-12-27 00:25:59','bearer','29ed12336bdae0993326d63c6466bd3814e81f52',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('6903d1104db4b6625fdff41b33f3f1f4f858ca41','2021-12-26 00:38:56','bearer','9e80547e3da09e5cd17983068b03fb52bc097043',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('6950c32528723588d34f471b755f036c4dd88ee9','2021-12-15 13:18:11','bearer','3db53226f077589e20232e97fc55b9915a0917b5',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('6b496f29cc160d09bfbc9fdfd0a5f467470547d2','2021-12-27 09:34:09','bearer','0da85a7b7d3d48bd71e1ab0ad01a73fcc1d8fd8c',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('6c67732d75084bc66ab3284574318f77c038cd3b','2021-12-23 19:27:13','bearer','08f98f810bcd36d70c66979b50c7c3a59a559357',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('6dffb76790bf3756a25947eeca78f661886713e8','2021-12-22 20:57:09','bearer','c2a78b926c2f24a6f86c8db18de7277251f26e27',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('6f8e31f6d30b1a491734101f992bfddc4eabdc71','2021-12-23 19:26:54','bearer','306cb7282f321252e1aa57e226006e10be19fba5',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('74894ba04e7ea68c57c74a81283c0a883a8b021e','2021-12-26 15:44:44','bearer','9b439f66e92432826b16c3cfa31a757c63012422',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('7684293596a40e823e0cdf6da657f4734449e86a','2021-12-27 19:49:35','bearer','8eb9ea87feffb59f480683373e599610a157ec10',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('786b80c637c6d7c600047790f90337e6d723e489','2021-12-15 13:18:32','bearer','54feb0f1fd9662efc94fc791ac90e7e1688433a5',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('7993365f5c5c0b19f54f06576117f8be2a34c6fc','2021-12-23 19:33:01','bearer','bfb0df41e2b8415d571d54c0ba6183792b351de7',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('7af27531f26851b2cf913f8a0e8a52a1e508b5c9','2021-12-26 13:38:29','bearer','fe189c9753efa27de825f3c4d84082071e87c0c1',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('7b2e8d2e8ba6a4e80c722dea788069862614f30e','2021-12-15 13:16:46','bearer','72163b37a7407748aa3c5f74ed5af29edb30acdb',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('7d9a4d6937dd14ed4460d361f8109b656cb6a72d','2021-12-26 00:24:55','bearer','674eb5692c110be40f062e0f208f5da8ed47d8ba',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('7db8e016ff96ac9e2781158c4fdbc936f7355ae1','2021-12-23 19:29:34','bearer','ebd3f8fec3503869275a5b3b4f1f41d60a10619b',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('7df7e1b986244cb5befd483c696fcd5a84587c86','2021-12-25 11:31:20','bearer','15499ea295b30c4f18037e6c1cf8be5644712a51',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('800f81baa7a47255ad6e52aa8fb3c5d5c9107337','2021-12-23 19:32:08','bearer','b2022cb8f599f3889101c4b509dc8996a8349698',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('822b1d47b307b43bf4ee85fc4f4f5926aa8f2fb9','2021-12-26 12:58:43','bearer','52ba758afa46443e5f12aab47e4d97e98a56064a',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('83b1fef86e176455f7ec6d47ffd79e886012bae8','2021-12-27 00:32:40','bearer','cc9aab8e9c737034db1633ff45638da347f98834',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('856e1249b6626d43ba29c520dd353f72d2d9326b','2021-12-15 13:31:44','bearer','ba17aebda21475918ab3edba80e67fbd7251a594',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('85d6a815061abf0ea2ecdf644ed815203fc1b960','2021-12-24 18:09:32','bearer','d115532f1799ea27eb09b864a2bc479b00a8e5f6',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('8617d09a2592ef664fff2b08bfd683357c8abcc9','2021-12-15 13:14:36','bearer','341eabaaa0ba9683d94aefaa4451183c3a9ff068',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('8856a14acb06f8083f7c8ddb74c7437204c18f50','2021-12-27 12:09:55','bearer','07d8d5edebf06e34595663a14308b15bffa19fe5',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('8a03d0ad4d58fadd66c6714079d1b183a356c057','2021-12-15 13:39:03','bearer','6106c25a68ca03dd84ea60a18c13bfb3782639de',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('8a1af14c362ea3dde466cc5d51ef0ce144f57066','2021-12-26 23:50:35','bearer','0ca4c6ea3f0d9de9decc0afe23586f02f597d924',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('8b661f08b2466b91da9c006c127dbf1ad99e0326','2021-12-26 13:14:31','bearer','70e2066890f56454503660e7773936bf7525d27e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('8c7212ce59bb3257930525f3459cd42cdb7c3336','2021-12-22 19:16:22','bearer','e5c11171ab40147631979867b186a667f789db17',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('9112fb08fd0a60168692204a873ac1aaa07b6465','2021-12-22 19:23:18','bearer','2bf3fb31cc52905535f39f2db69cb19324dd219b',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('9239ff62d581df36a7c7d15d890cf29fd91b4b3f','2021-12-27 12:06:46','bearer','e4d69ecf6a0ff8acf17762ebcc0bca77658e29ad',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('9492fef1b846e43042d144e41cfeaf9f0d0d7bce','2021-12-16 16:50:22','bearer','b1b5cb6a9147e54c4c48d30f31c111c46e51460c',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('94a6fe156feec96e16c1e3c0df33b0edc048006f','2021-12-27 19:50:16','bearer','c347dc427e88cd92fd3bb581715f3d3d8cbed94e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL),('99d51ce099aeab1ddbc8e63d72a3c160b80d06d0','2021-12-27 12:08:59','bearer','7ea6d8a0e6eab355eddc861c001fe9d80bfdead4',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('9c10a597e1ab2e6e34d3e1d8435eb2deb6347ef6','2021-12-15 13:17:38','bearer','894b8e4aae7acc704582fd010e1838ce0bfda730',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('9d967ed76f557f9c3dd5885e93decb48fcbb9996','2021-12-23 19:33:05','bearer','599abd4fdb6edf1b4500d90d785acc2d66c8bc1a',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('9eb7b042d93b2f8848a03b4a671cc0532764da12','2021-12-26 02:01:08','bearer','50df05c908b391157b998d6c2565ebe096b49367',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('a04132f4e82bb8fdbfb602be5b094ca87c1a2ffe','2021-12-27 00:01:25','bearer','17a977ffc88aa63498c3e87096944a27a3945fa9',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('a0e8f29f7e05a2b0afc897be7ca00bcd8b58fbab','2021-12-15 13:34:15','bearer','2adc1cab7967dddb697e080316fc160f50e19098',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('a131b0e5ce85d79ec337cbc5f9599bd8cc44c9d8','2021-12-25 21:22:18','bearer','7897a3fe1b757671bd5e87a0171d47a42bdf24c3',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('a58997a127656d1314d3cc84abaa9178b2b774b3','2021-12-26 13:37:38','bearer','485e56a8c3b62fd17a70cbdaa69150ef81d47ace',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('a6e77adc823553cf35db75f45c1d5d037384c057','2021-12-26 15:40:57','bearer','208be43cc2995bd725c13f0d890341ffdb59fc3e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('ad02ad53347cf28eadb4f52b786f95dc874c112e','2021-12-27 12:14:20','bearer','02a12a7081ed05724204211f4ff0caa8a99e9609',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('aee727c1e1833e06b1ad6a03d69387a3556dc3ea','2021-12-25 03:08:58','bearer','825fa32d9e456fb67a12cd47bb96b6aa35f5a692',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('b30408ab0670119180187acbe6c248b45b0d0822','2021-12-15 13:35:51','bearer','59a4a661db785f178d39ca833f93f59cb1c8fd46',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('b3487d339386fb313b5eadbce2c0c4d8fe138285','2021-12-27 00:09:01','bearer','bf8602b89655358f8580996782803dde5a2cb6b9',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('b42fef9be1f22462842b0c02956b332feaafcd63','2021-12-25 21:13:24','bearer','b194f6955279a9a1d553934c6442ffc32dce4fe9',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('b49f69009a16674ad9af75900055ec898e1f455b','2021-12-15 13:16:35','bearer','38340ebe95ec356871b0d299bb41196c6fd5513a',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('b78d8708f43878e9383b520f5fc680f8fc373e52','2021-12-25 21:14:15','bearer','b1fbedc3ffc3af99cfcea3595cde571edc453469',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('b7e5c326c562a9ccb36799f7636814f637962497','2021-12-26 13:37:03','bearer','f675716443c4c01f4d9946ec1fc6d94311dc7fff',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('b8ac89ef094fb2763289028229433f725892fe30','2021-12-27 19:49:47','bearer','de2bbad1703538666e52888a8da080ab57762147',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL),('bf29f103ef4e347ef979031f159ebef5160f4158','2021-12-26 23:34:00','bearer','c19906d9c77bdf77f4ca32fbfce4bf35748b5b68',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('c331f2391ffe467ca981ef55321daeb8311ad139','2021-12-25 19:04:07','bearer','e14489ee95a131b5c6be53719c128a5cd9e090ee',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('c45039dea1603b1b83efa7628905c0e58df76a60','2021-12-25 16:31:10','bearer','f496643d72dff4842e457f80c5a536192060b234',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('c48876a7e39e3af5e24470b7d274072746d3d739','2021-12-26 15:56:40','bearer','728d7860cfe3ea51e0df68257fb770f980ca3016',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('c4b41c19ab4e62c40966affe5d7b959941fca824','2021-12-23 19:26:30','bearer','c2c6c736d43e93660b930f7311015fab5abc0887',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('c4de4640e2437d074f50a34e677c79c5b5baa424','2021-12-26 15:44:15','bearer','0a02542d7a1ab082dd990809270678794889f98f',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('c7a03333cc1c34b633ba77a8d2d13d11efdd6546','2021-12-27 00:24:04','bearer','f6247a2170451d033b4c001de11a88cf80e4bb56',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('c9463ac2c211bd64c47eb7623adba61b78bc8c6d','2021-12-26 12:56:55','bearer','9c60a4d911a0755167473aa069a2c2635c51729d',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('c9b6668b622962ab7a82ffa95becd94c10e2c1d0','2021-12-15 13:43:14','bearer','8e6b35c97bea8a1ad3ec250e0f23825beaefa3e9',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('cc1ca93c5a51dca41574eb36125a00d8e6ae863f','2021-12-26 15:56:17','bearer','3577c963bd7bfb18c0b1fb80fd8765655957a4d4',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL),('cfd1e1d29c8f90b2737c048d0454d958aa4ab1e4','2021-12-15 13:37:53','bearer','3094060330673e22ec169f6d61c8da42447e8520',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('d0ec64bd931901638e61b3171fe1375e9b96dbcb','2021-12-25 19:03:19','bearer','0c8a19ba9426b7dc30f3b9bae4018c269d7f5d1e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('d1c01425745a7b85e89b2107fafdedfd4823c576','2021-12-25 19:03:40','bearer','e8a7c75bf86111c2211082aa236824c2aa46288e',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('d252205348c20b2e21bd776db5cd827fdbfa5f5e','2021-12-26 02:04:51','bearer','66c0aa733d028b16134e26c054f3285b0ae25463',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('d401ba72539e0cc07a5595395266b0538fb8f49a','2021-12-23 19:17:11','bearer','d44705612241ea80ac3ef2822c6bccfbe5187b21',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('d4381725a0fe5335ea79a1806eacb322bf927593','2021-12-23 19:29:32','bearer','b27c5830acc4cf42ca5b84f56606d38ae88e5568',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('d4838377478a2cc558045d446f71266ecf98fab8','2021-12-26 13:29:53','bearer','83adb10fb931e84c3e6cc89e2355a9b310067782',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('d5350c64d1d5ccf4df8ebfcc6bb5bd1a71102f3d','2021-12-26 00:42:25','bearer','ab94dc8bc8faaad69405818a17ad263d73296ae5',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('d5d91c5773d4855bc36c5fd9c5f8d548684db00c','2021-12-27 00:33:09','bearer','e50bed2895e7b4f58ba3e02187cded3f63550332',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('d6c049dd5ca1deac288f0b8a03287255a5147821','2021-12-15 13:37:54','bearer','3f8ed142d5fcf3437e9ed1b564ba00aea0f42e1b',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('d7b7c90324c87d8c6e7df608fcc4d648ccede1dd','2021-12-27 19:52:27','bearer','42e346f1a821adcc2b9268315abf086edd8a3db2',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL),('d80d0627a43203b5187e8359affbbebf1220eac4','2021-12-14 20:25:22','bearer','d059fe31d50b2f37608171dbbf9ad2b49419cf4c',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('d94035147cd886bf39f67b60fc00820f4215fda5','2021-12-27 11:39:55','bearer','3860e16755c860832401dbd9eeeabff32d08635d',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('da3ac98b4a1fe3088155674a526d05a748d2d5e3','2021-12-27 00:24:27','bearer','0fbaf0b931e9d53d55e2694eea95b9ad97cab651',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('dc72951308261b62aef21b94564d64a931b8a05c','2021-12-23 19:30:17','bearer','5ffc895525825dd808160bf5051208d608a7b4ca',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('dd6c3420e512b8bfc77fbc623c7ab1fe32a4d20b','2021-12-27 00:36:19','bearer','dc134986da0e0e15404aa88feb34932bfc1d36cf',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('de503bc75fe3cadc6ce17d45ad8e48c69be99f22','2021-12-27 19:50:56','bearer','deb34268d1eb261026d99db8cc761f5d4b748e6c',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('dfacbffe87c987188c6645998aec7f8b9f434437','2021-12-23 19:27:36','bearer','827def37fa587913ec1ba6bf5e8e349654566439',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('e4a3b39b22571f8da8b5a54dfb4ef99107590789','2021-12-22 20:58:27','bearer','acd34402b5f38746f3a2b123088ee601f6d9fcc0',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('ea33d9080c498ff35ed522f00a537699026ba99e','2021-12-22 22:35:04','bearer','352e9b10578614e480cc2de0646347640a4ced9d',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('eaf5b75a3bee278f13874c22087ca2c0b1df0c8a','2021-12-22 20:17:46','bearer','dc4c732264b00a115fdc9ed0f0ddb85e9e9a5383',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('ed738b0fcb95e05fbe7d637cf276ac7bedb56813','2021-12-22 21:02:05','bearer','daf6d8d7038596f14c02a5245e058a2b8c725373',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('ed76a25cb8fbb8ea0c86a21f9c916d0b9e125612','2021-12-22 21:02:45','bearer','134aa2985171b8ecdf7b5fc5c622537e77853970',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL),('ee40975229983d4f44970785c5d922860eededc0','2021-12-25 15:55:38','bearer','432351b60eaed9ef341f070b1b3a5e821da69e22',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL),('f15d1ac69a130bcdbcb144265c95e10ef8274350','2021-12-26 00:35:01','bearer','7abe4311add962007e000dc7ff1877f23930038c',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('f2bc273133c68f6025e10d55c8a57b099c914bbd','2021-12-23 19:33:02','bearer','d2db0b7223fd260621cf1c4da284afacb7a9432f',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('f308b991f0b91e88bbba09833aedc5d5e6bdd236','2021-12-23 19:30:17','bearer','c7c59359690946eab9d1125daa5950f15690de9b',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL),('f753d5e671e49e0a0c77e6143febcef657141788','2021-12-26 16:01:05','bearer','26bf4e9f3b5c989244fe57a097e914d55fa04775',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL),('ffe8c328911971de150dcd0b9849cac60ca7c9e4','2021-12-15 13:42:36','bearer','f6557e1d205def1a0ea5e1f77985449de2c9cd57',1,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL);
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_authorization_code`
--

DROP TABLE IF EXISTS `oauth_authorization_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_authorization_code` (
  `authorization_code` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`),
  UNIQUE KEY `authorization_code` (`authorization_code`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `oauth_authorization_code_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_authorization_code_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_authorization_code`
--

LOCK TABLES `oauth_authorization_code` WRITE;
/*!40000 ALTER TABLE `oauth_authorization_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_authorization_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client`
--

DROP TABLE IF EXISTS `oauth_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `secret` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `grant_type` varchar(255) DEFAULT NULL,
  `response_type` varchar(255) DEFAULT NULL,
  `client_type` varchar(15) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `token_types` varchar(2000) DEFAULT NULL,
  `jwt_secret` varchar(255) DEFAULT NULL,
  `redirect_sign_out_uri` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client`
--

LOCK TABLES `oauth_client` WRITE;
/*!40000 ALTER TABLE `oauth_client` DISABLE KEYS */;
INSERT INTO `oauth_client` VALUES ('abe27d6b-9ffb-4bbc-b016-105bc0a909f6','des_cloud','This is despoina\'s app','77d389e3-858c-4d09-9204-67ccce899cce','http://localhost/index.php','http://localhost/index.php','b7250dd1-853a-421f-a7d3-0d082d8c4c72.jpg','authorization_code,implicit,password,client_credentials,refresh_token','code,token',NULL,NULL,NULL,NULL,NULL,''),('idm_admin_app','idm','idm',NULL,'','','default','','',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `refresh_token` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`),
  UNIQUE KEY `refresh_token` (`refresh_token`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `user_id` (`user_id`),
  KEY `iot_id` (`iot_id`),
  KEY `authorization_code_rt` (`authorization_code`),
  CONSTRAINT `authorization_code_rt` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  CONSTRAINT `oauth_refresh_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_refresh_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_refresh_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
INSERT INTO `oauth_refresh_token` VALUES ('02a12a7081ed05724204211f4ff0caa8a99e9609','2022-01-10 11:14:20','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('04df0e855bb69d006d85c8d6a427e793eb5bffbe','2022-01-09 14:53:30','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('07d8d5edebf06e34595663a14308b15bffa19fe5','2022-01-10 11:09:55','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('087ede95d85685b3c0d39785f402724bcc3f618a','2022-01-10 11:02:55','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('08f98f810bcd36d70c66979b50c7c3a59a559357','2022-01-06 18:27:13','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('0a02542d7a1ab082dd990809270678794889f98f','2022-01-09 14:44:15','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('0a2c40968836a2e618c2dead4552c3ab6a70f93f','2022-01-08 14:05:38','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('0b2aac53bd31057f7df59fa13cdd0311e908342e','2022-01-09 14:43:04','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('0c8a19ba9426b7dc30f3b9bae4018c269d7f5d1e','2022-01-08 18:03:19','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('0ca4c6ea3f0d9de9decc0afe23586f02f597d924','2022-01-09 22:50:35','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('0d705468f41f7b9dce3138e1e031baa49b307de5','2022-01-06 18:17:29','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('0da85a7b7d3d48bd71e1ab0ad01a73fcc1d8fd8c','2022-01-10 08:34:09','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('0fbaf0b931e9d53d55e2694eea95b9ad97cab651','2022-01-09 23:24:27','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('134aa2985171b8ecdf7b5fc5c622537e77853970','2022-01-05 20:02:45','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('1499271c880c5e9e106b2f21aa20b2f3a04c24c1','2022-01-09 14:54:00','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('15499ea295b30c4f18037e6c1cf8be5644712a51','2022-01-08 10:31:20','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('175cc2351702912868446344bb5ac41d47aabc02','2022-01-10 18:53:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('17a977ffc88aa63498c3e87096944a27a3945fa9','2022-01-09 23:01:25','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('1fdb13c11652ca4c69f12bf3b8415e20a7bd0445','2022-01-05 18:31:25','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('2051956075ed139fa97dcced8a0a73abdf4aa563','2022-01-05 20:50:00','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('208be43cc2995bd725c13f0d890341ffdb59fc3e','2022-01-09 14:40:57','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('26bf4e9f3b5c989244fe57a097e914d55fa04775','2022-01-09 15:01:05','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL,1),('279db63f750bc99c11b1f61e1c304b2b5966e676','2022-01-10 10:35:28','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('27d8bfa3dffc3913251c054027b89bca2471c9ca','2021-12-29 12:42:39','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('29ed12336bdae0993326d63c6466bd3814e81f52','2022-01-09 23:25:59','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('2adc1cab7967dddb697e080316fc160f50e19098','2021-12-29 12:34:15','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('2bc25534c7030464a8ef7508ffdc5739eea1ded2','2022-01-07 22:10:15','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('2bf3fb31cc52905535f39f2db69cb19324dd219b','2022-01-05 18:23:18','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('306cb7282f321252e1aa57e226006e10be19fba5','2022-01-06 18:26:54','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('3094060330673e22ec169f6d61c8da42447e8520','2021-12-29 12:37:53','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('341eabaaa0ba9683d94aefaa4451183c3a9ff068','2021-12-29 12:14:36','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('34d77c21d12f8429a347378b3d599ddc2c956861','2022-01-09 14:43:41','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('352e9b10578614e480cc2de0646347640a4ced9d','2022-01-05 21:35:04','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('3577c963bd7bfb18c0b1fb80fd8765655957a4d4','2022-01-09 14:56:17','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('38340ebe95ec356871b0d299bb41196c6fd5513a','2021-12-29 12:16:35','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('3860e16755c860832401dbd9eeeabff32d08635d','2022-01-10 10:39:55','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('39e00d16094091029c603845bfeb56821c1ee5f1','2022-01-09 23:25:41','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('3db53226f077589e20232e97fc55b9915a0917b5','2021-12-29 12:18:11','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('3f8ed142d5fcf3437e9ed1b564ba00aea0f42e1b','2021-12-29 12:37:54','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('42e346f1a821adcc2b9268315abf086edd8a3db2','2022-01-10 18:52:27','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL,1),('432351b60eaed9ef341f070b1b3a5e821da69e22','2022-01-08 14:55:38','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('44107724b53f7803b223887654079d594229b096','2021-12-29 12:37:46','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('4627784e65d40cbcb13e3c90a811f0996934a00c','2022-01-06 18:29:33','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('485e56a8c3b62fd17a70cbdaa69150ef81d47ace','2022-01-09 12:37:38','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('48e34d147c6a5778539d6fc52ac253f7a66a50ec','2022-01-06 18:36:10','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('50c198f4bcf7c31a22dab86d4b72017b1a351974','2022-01-07 21:56:43','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('50df05c908b391157b998d6c2565ebe096b49367','2022-01-09 01:01:08','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('512f05193bc37e926aa473466ad4523f084c6b42','2022-01-05 18:19:04','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('52ba758afa46443e5f12aab47e4d97e98a56064a','2022-01-09 11:58:43','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('54fa7b15d98ac28b40055dff966fdef67f882f2b','2022-01-07 17:07:11','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('54feb0f1fd9662efc94fc791ac90e7e1688433a5','2021-12-29 12:18:32','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('56de87b8e1b103f47b2d1eb2b9cb6f05b2480edf','2022-01-08 14:03:40','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('599abd4fdb6edf1b4500d90d785acc2d66c8bc1a','2022-01-06 18:33:05','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('59a4a661db785f178d39ca833f93f59cb1c8fd46','2021-12-29 12:35:51','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('5ffc895525825dd808160bf5051208d608a7b4ca','2022-01-06 18:30:17','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('6106c25a68ca03dd84ea60a18c13bfb3782639de','2021-12-29 12:39:03','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('66c0aa733d028b16134e26c054f3285b0ae25463','2022-01-09 01:04:51','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('674eb5692c110be40f062e0f208f5da8ed47d8ba','2022-01-08 23:24:55','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('6a37ea4937ec5aa8e4cd24085cda0c4d3c663153','2022-01-08 10:55:23','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('6ad5896f7d8f215d99166826c90bb451e7565901','2022-01-08 20:22:38','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('6d98787ed7fb62a8a15aab9618ec22c404f37366','2022-01-08 23:42:42','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('6e19d79a576aabad3cebc7a3b1aafea85f019694','2021-12-29 12:43:40','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('70e2066890f56454503660e7773936bf7525d27e','2022-01-09 12:14:31','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('72163b37a7407748aa3c5f74ed5af29edb30acdb','2021-12-29 12:16:46','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('728d7860cfe3ea51e0df68257fb770f980ca3016','2022-01-09 14:56:40','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('72b11629d2fada3ac835a10dfd899aea659ab9e3','2022-01-08 23:45:41','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('7897a3fe1b757671bd5e87a0171d47a42bdf24c3','2022-01-08 20:22:18','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('7abe4311add962007e000dc7ff1877f23930038c','2022-01-08 23:35:01','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('7d821ca23d1272f357d9ca6862c7cfbb183ff213','2021-12-29 12:32:08','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('7ea6d8a0e6eab355eddc861c001fe9d80bfdead4','2022-01-10 11:08:59','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('7f9381870048a01c59de48ed747dfd6d21809d77','2021-12-29 12:37:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('7f9e0421543bf0de192ece26d072081b762866f6','2022-01-06 18:32:08','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('801697adb53f59c8f5b524e47892d50e0a86d068','2022-01-10 10:35:09','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('825fa32d9e456fb67a12cd47bb96b6aa35f5a692','2022-01-08 02:08:58','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('827def37fa587913ec1ba6bf5e8e349654566439','2022-01-06 18:27:36','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('83adb10fb931e84c3e6cc89e2355a9b310067782','2022-01-09 12:29:53','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('8746e87663ccde4992e760c72711301bd7f435f1','2022-01-09 12:32:20','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('8846d39491d107f98af0b153ad5820c79fd6863a','2022-01-10 18:52:52','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('894b8e4aae7acc704582fd010e1838ce0bfda730','2021-12-29 12:17:38','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('89ac4e89bb20f97a3a8fd86e86060cd358d8530c','2022-01-10 18:51:37','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('8a928bb5aa5a8ba1d2fd9cd37a9e1f12256f863a','2022-01-09 14:47:27','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('8e6b35c97bea8a1ad3ec250e0f23825beaefa3e9','2021-12-29 12:43:14','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('8eb9ea87feffb59f480683373e599610a157ec10','2022-01-10 18:49:35','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('9019a78bfb1af4dce446e7c0a65fbda1e1baad20','2022-01-05 20:00:29','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('90395c5db938ccf536874d5edcef177ed0e1515e','2021-12-29 12:14:23','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('90f0a8341577d718127a34281c3a8fab3d6cc264','2021-12-29 17:37:30','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('98568046b5701767d7b99e5b5da918a7470dee17','2022-01-05 20:01:32','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('9b439f66e92432826b16c3cfa31a757c63012422','2022-01-09 14:44:44','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('9c60a4d911a0755167473aa069a2c2635c51729d','2022-01-09 11:56:55','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('9cd7447ca4dc364eb128d2a5d6185f4351f65d8e','2022-01-09 15:02:10','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL,1),('9e80547e3da09e5cd17983068b03fb52bc097043','2022-01-08 23:38:56','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('a6ad2e8d4c95ec7717beb87215ec49288fdf2cbc','2022-01-08 23:35:39','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('a797747363866f041fb68c73df80797b8679bc6b','2022-01-09 22:34:09','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('a9a2d320f771808a7ed0f2c76864d5f207ba4451','2022-01-05 19:52:01','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('aafa1e06ec6ff23fd79e684c8d03be78f28a7bbe','2022-01-05 18:50:46','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('ab94dc8bc8faaad69405818a17ad263d73296ae5','2022-01-08 23:42:25','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('acd34402b5f38746f3a2b123088ee601f6d9fcc0','2022-01-05 19:58:27','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('b194f6955279a9a1d553934c6442ffc32dce4fe9','2022-01-08 20:13:24','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('b1b5cb6a9147e54c4c48d30f31c111c46e51460c','2021-12-30 15:50:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('b1fbedc3ffc3af99cfcea3595cde571edc453469','2022-01-08 20:14:15','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('b2022cb8f599f3889101c4b509dc8996a8349698','2022-01-06 18:32:08','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('b27c5830acc4cf42ca5b84f56606d38ae88e5568','2022-01-06 18:29:32','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('b364d6be3a7919d09cedddbec9b2897a171f24cf','2022-01-05 18:23:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('b3a0df69a9b93ebbe11907b660d3d33ff0ea1cc1','2021-12-28 19:26:11','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('b4b3ea76bd73c8c46f138dd9efa802196c6181e8','2022-01-09 14:55:54','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('b56604224963fe5647380de0841d8c2c7eb23089','2022-01-09 12:27:24','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('ba17aebda21475918ab3edba80e67fbd7251a594','2021-12-29 12:31:44','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('bf8602b89655358f8580996782803dde5a2cb6b9','2022-01-09 23:09:01','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('bf901c4f523668b30ac02a02d2513c513ccc0348','2022-01-09 23:01:36','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('bfb0df41e2b8415d571d54c0ba6183792b351de7','2022-01-06 18:33:01','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('c110385d3fa2a0fea7a613065c67fc663284ebc8','2022-01-09 12:37:24','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('c19906d9c77bdf77f4ca32fbfce4bf35748b5b68','2022-01-09 22:34:00','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('c1cfce75f8e6d46e5f772106441fb5970064fc0e','2022-01-06 18:06:35','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('c2a78b926c2f24a6f86c8db18de7277251f26e27','2022-01-05 19:57:09','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('c2c6c736d43e93660b930f7311015fab5abc0887','2022-01-06 18:26:30','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('c347dc427e88cd92fd3bb581715f3d3d8cbed94e','2022-01-10 18:50:16','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('c523f9e36234e3906ecd67df1abd9bd3020afe06','2022-01-06 18:27:14','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('c6f112cff566811b69a00d42ac8d008684f768dd','2022-01-08 23:23:47','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('c7c59359690946eab9d1125daa5950f15690de9b','2022-01-06 18:30:17','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('cc9aab8e9c737034db1633ff45638da347f98834','2022-01-09 23:32:40','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('cdca72656113112cfe54dc0917fcca31a8940a32','2022-01-05 18:22:52','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('d059fe31d50b2f37608171dbbf9ad2b49419cf4c','2021-12-28 19:25:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('d0a03918feca5b88500a19d1670a6c3ae75c91bd','2022-01-07 22:09:15','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('d115532f1799ea27eb09b864a2bc479b00a8e5f6','2022-01-07 17:09:32','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('d2db0b7223fd260621cf1c4da284afacb7a9432f','2022-01-06 18:33:02','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('d44705612241ea80ac3ef2822c6bccfbe5187b21','2022-01-06 18:17:11','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('d54e1ad3497d07a37482190d86d667229bc651f1','2022-01-09 13:13:47','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('d57271166e163a6584e4cfa6b45b7e1ab1abb563','2022-01-08 20:14:51','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('d95b16a2cafce63290a481fc929dd885005d6a6f','2022-01-09 23:37:51','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('da2b79caf2584e769f8c9dc44a04b6e1841b8421','2021-12-29 12:19:18','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('dac6cae5f0585cc8160720b19def8195bf3ad5a3','2022-01-05 20:03:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('daf6d8d7038596f14c02a5245e058a2b8c725373','2022-01-05 20:02:05','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('dc134986da0e0e15404aa88feb34932bfc1d36cf','2022-01-09 23:36:19','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('dc4c732264b00a115fdc9ed0f0ddb85e9e9a5383','2022-01-05 19:17:46','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('dc634c707c4ad01fda3cd284fa555f8342b87522','2022-01-09 12:35:27','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('dccfe3343a60042cf2f5e9733a92695e11a4a8bc','2022-01-05 19:56:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('de2bbad1703538666e52888a8da080ab57762147','2022-01-10 18:49:47','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','95609ef5-5d53-4fab-9c79-2bb7515503ea',NULL,NULL,1),('deb34268d1eb261026d99db8cc761f5d4b748e6c','2022-01-10 18:50:56','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('e14489ee95a131b5c6be53719c128a5cd9e090ee','2022-01-08 18:04:07','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('e4d69ecf6a0ff8acf17762ebcc0bca77658e29ad','2022-01-10 11:06:46','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('e50bed2895e7b4f58ba3e02187cded3f63550332','2022-01-09 23:33:09','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('e5c11171ab40147631979867b186a667f789db17','2022-01-05 18:16:22','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('e69bbdc63b15b41b14c1804369678e7c21c7a120','2022-01-10 11:34:51','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('e717a08e2a5c92b2db3751c7b9e61195bede2393','2022-01-06 18:36:11','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('e8a7c75bf86111c2211082aa236824c2aa46288e','2022-01-08 18:03:40','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('ea02999b8af9e5d415fa431bba852ec8dd241ff0','2022-01-09 14:57:27','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','a5c0ad48-ec48-432f-b2fa-3da9b4298bbd',NULL,NULL,1),('ea39eab8710126a2c8452365fbd641f86af0225f','2022-01-05 19:59:50','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('ebd3f8fec3503869275a5b3b4f1f41d60a10619b','2022-01-06 18:29:34','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('edcaccd2849052b4ace79af14a4a3c230893e933','2022-01-09 22:27:46','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('efb584337c18b4be600968a10daf8e7a543495ba','2022-01-06 18:04:25','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('f13383ed59bf29d8329ad292db32c76800c57226','2022-01-06 18:30:58','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('f496643d72dff4842e457f80c5a536192060b234','2022-01-08 15:31:10','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('f4ea1fd8b37c861a8753c6e56a2f8eef1e99d4d1','2022-01-10 11:08:32','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1),('f6247a2170451d033b4c001de11a88cf80e4bb56','2022-01-09 23:24:04','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e711a1d4-852e-4143-988d-c5e72e9e014c',NULL,NULL,1),('f6557e1d205def1a0ea5e1f77985449de2c9cd57','2021-12-29 12:42:36','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('f675716443c4c01f4d9946ec1fc6d94311dc7fff','2022-01-09 12:37:03','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','62bbc117-95eb-46cd-b9ab-c285e91c60c9',NULL,NULL,1),('f96c2f5e20a40ea474abe1c9d1ae458fce8ba07d','2022-01-05 18:20:52','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','admin',NULL,NULL,1),('fe189c9753efa27de825f3c4d84082071e87c0c1','2022-01-09 12:38:29','bearer','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','138789c8-cc89-4ef5-ab86-e849b8e35998',NULL,NULL,1);
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_scope`
--

DROP TABLE IF EXISTS `oauth_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_scope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scope` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_scope`
--

LOCK TABLES `oauth_scope` WRITE;
/*!40000 ALTER TABLE `oauth_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pep_proxy`
--

DROP TABLE IF EXISTS `pep_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pep_proxy` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `pep_proxy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pep_proxy`
--

LOCK TABLES `pep_proxy` WRITE;
/*!40000 ALTER TABLE `pep_proxy` DISABLE KEYS */;
INSERT INTO `pep_proxy` VALUES ('pep_proxy_30f20e20-ce8e-4223-a799-e481c590658b','fe9e1e214fe5b7e8c55ef888e9201600f75f3901','abe27d6b-9ffb-4bbc-b016-105bc0a909f6','e8bf71641918ee10');
/*!40000 ALTER TABLE `pep_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_internal` tinyint(1) DEFAULT '0',
  `action` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `xml` text,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('1','Get and assign all internal application roles',NULL,1,NULL,NULL,NULL,'idm_admin_app'),('2','Manage the application',NULL,1,NULL,NULL,NULL,'idm_admin_app'),('3','Manage roles',NULL,1,NULL,NULL,NULL,'idm_admin_app'),('4','Manage authorizations',NULL,1,NULL,NULL,NULL,'idm_admin_app'),('5','Get and assign all public application roles',NULL,1,NULL,NULL,NULL,'idm_admin_app'),('6','Get and assign only public owned roles',NULL,1,NULL,NULL,NULL,'idm_admin_app');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT '0',
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('4de2aba1-f6bf-4c9f-86b7-720b2a4335fe','eventorganizer',0,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),('51ca0b92-ed8e-4fae-a733-93da561238f7','admin',0,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),('8611e74d-4916-4582-956b-b9363c2cb405','user',0,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),('provider','Provider',1,'idm_admin_app'),('purchaser','Purchaser',1,'idm_admin_app');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_assignment`
--

DROP TABLE IF EXISTS `role_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_organization` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `role_id` (`role_id`),
  KEY `organization_id` (`organization_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `role_assignment_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_assignment_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_assignment_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_assignment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_assignment`
--

LOCK TABLES `role_assignment` WRITE;
/*!40000 ALTER TABLE `role_assignment` DISABLE KEYS */;
INSERT INTO `role_assignment` VALUES (30,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','provider',NULL,'admin'),(31,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','51ca0b92-ed8e-4fae-a733-93da561238f7',NULL,'admin'),(32,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','4de2aba1-f6bf-4c9f-86b7-720b2a4335fe',NULL,'62bbc117-95eb-46cd-b9ab-c285e91c60c9'),(33,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','8611e74d-4916-4582-956b-b9363c2cb405',NULL,'138789c8-cc89-4ef5-ab86-e849b8e35998'),(34,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','8611e74d-4916-4582-956b-b9363c2cb405',NULL,'a5c0ad48-ec48-432f-b2fa-3da9b4298bbd'),(35,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','4de2aba1-f6bf-4c9f-86b7-720b2a4335fe',NULL,'e711a1d4-852e-4143-988d-c5e72e9e014c'),(36,NULL,'abe27d6b-9ffb-4bbc-b016-105bc0a909f6','8611e74d-4916-4582-956b-b9363c2cb405',NULL,'95609ef5-5d53-4fab-9c79-2bb7515503ea');
/*!40000 ALTER TABLE `role_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(36) DEFAULT NULL,
  `permission_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,'provider','1'),(2,'provider','2'),(3,'provider','3'),(4,'provider','4'),(5,'provider','5'),(6,'provider','6'),(7,'purchaser','5'),(8,'51ca0b92-ed8e-4fae-a733-93da561238f7','6'),(9,'51ca0b92-ed8e-4fae-a733-93da561238f7','5'),(10,'51ca0b92-ed8e-4fae-a733-93da561238f7','4'),(11,'51ca0b92-ed8e-4fae-a733-93da561238f7','3'),(12,'51ca0b92-ed8e-4fae-a733-93da561238f7','2'),(13,'51ca0b92-ed8e-4fae-a733-93da561238f7','1');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted_application`
--

DROP TABLE IF EXISTS `trusted_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trusted_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `trusted_oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  KEY `trusted_oauth_client_id` (`trusted_oauth_client_id`),
  CONSTRAINT `trusted_application_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trusted_application_ibfk_2` FOREIGN KEY (`trusted_oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_application`
--

LOCK TABLES `trusted_application` WRITE;
/*!40000 ALTER TABLE `trusted_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `trusted_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `gravatar` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `date_password` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `extra` json DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `starters_tour_ended` tinyint(1) DEFAULT '0',
  `eidas_id` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('138789c8-cc89-4ef5-ab86-e849b8e35998','xntolkas','','','default',0,'xntolkas@test.com','c53059286230999b6beb20ca00ef6e0115d1d52f','2021-12-25 14:55:28',1,0,NULL,NULL,0,NULL,'4d8031d2b7a7d88f'),('62bbc117-95eb-46cd-b9ab-c285e91c60c9','kntolka','','','default',0,'kntolka@test.com','692244e637096e0f105792acb21019be998ae771','2021-12-23 18:06:35',1,0,NULL,NULL,0,NULL,'256a72dcbfe0e075'),('95609ef5-5d53-4fab-9c79-2bb7515503ea','argyro',NULL,NULL,'default',0,'argyro@test.com','4b7f1fa46d55b52bd0c1b44cd95de14e186e3405','2021-12-26 14:58:33',1,0,NULL,NULL,0,NULL,'e964461f41633b4c'),('a5c0ad48-ec48-432f-b2fa-3da9b4298bbd','mskizi','','','default',0,'mskizi@test.com','2666f19914e34bfa8f8e0a3f018e215474daf2dc','2021-12-26 14:42:36',1,0,NULL,NULL,0,NULL,'7a69a4dc4d91fbdd'),('admin','dntolka','','','default',0,'dntolka@test.com','d73b40d30fcec3e65ba075f55c337b4b7a0c2a5e','2021-12-14 15:52:18',1,1,NULL,NULL,0,NULL,'51fd3fd23bc27f3b'),('e711a1d4-852e-4143-988d-c5e72e9e014c','ekiziri','','','default',0,'ekiziri@test.com','af0624c22959de677f274b0544a28425f919577d','2021-12-26 14:42:48',1,0,NULL,NULL,0,NULL,'1d985b35c63fa200');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorized_application`
--

DROP TABLE IF EXISTS `user_authorized_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authorized_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(36) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `oauth_client_id` (`oauth_client_id`),
  CONSTRAINT `user_authorized_application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_authorized_application_ibfk_2` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorized_application`
--

LOCK TABLES `user_authorized_application` WRITE;
/*!40000 ALTER TABLE `user_authorized_application` DISABLE KEYS */;
INSERT INTO `user_authorized_application` VALUES (1,'admin','abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),(3,'62bbc117-95eb-46cd-b9ab-c285e91c60c9','abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),(4,'e711a1d4-852e-4143-988d-c5e72e9e014c','abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),(5,'138789c8-cc89-4ef5-ab86-e849b8e35998','abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),(6,'a5c0ad48-ec48-432f-b2fa-3da9b4298bbd','abe27d6b-9ffb-4bbc-b016-105bc0a909f6'),(7,'95609ef5-5d53-4fab-9c79-2bb7515503ea','abe27d6b-9ffb-4bbc-b016-105bc0a909f6');
/*!40000 ALTER TABLE `user_authorized_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_organization`
--

DROP TABLE IF EXISTS `user_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(10) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `user_organization_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_organization`
--

LOCK TABLES `user_organization` WRITE;
/*!40000 ALTER TABLE `user_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registration_profile`
--

DROP TABLE IF EXISTS `user_registration_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_registration_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_expires` datetime DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `verification_key` varchar(255) DEFAULT NULL,
  `verification_expires` datetime DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `user_registration_profile_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registration_profile`
--

LOCK TABLES `user_registration_profile` WRITE;
/*!40000 ALTER TABLE `user_registration_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_registration_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-27 22:09:32
