-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: news_reviews
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `email` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Ivan Myrotuik','myrotiuk@gmail.com'),(2,'Julia Jull','jull@gmail.com'),(3,'Lilu Lu','lu@gmail.com'),(4,'Suzi Suz','suz@gmail.com');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_author` int(10) unsigned NOT NULL,
  `id_rubric` int(10) unsigned NOT NULL,
  `name` varchar(77) NOT NULL,
  `news` text NOT NULL,
  `video_link` varchar(777) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_rubric` (`id_rubric`),
  KEY `id_author` (`id_author`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_rubric`) REFERENCES `rubric` (`id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,1,'Good sport','Sport is a greate la la ','www.sport.com','2016-03-24 23:50:28'),(2,1,2,'Won match','He scored a goal ','www.sport.com','2016-03-24 23:52:16'),(3,1,3,'Strong','He strive for victory','www.sport.com','2016-03-24 23:54:13'),(4,1,6,'New swimmer','He has swum since he ..','www.sport.com','2016-03-24 23:58:27'),(5,1,4,'Sand football','It was hard but...','www.sport.com','2016-03-25 00:07:40'),(6,1,5,'New in watersport','It is break in sport ..','www.sport.com','2016-03-25 00:07:40'),(7,1,7,'Too high','He was going to jump but ..','www.sport.com','2016-03-25 00:07:40'),(8,1,8,'New music','He can sound ..','www.sport.com','2016-03-25 00:07:40'),(9,2,9,'Classical music','There is something new...','www.news.commusic','2016-03-25 00:19:20'),(10,2,10,'Operetta','Beautiful..','www.news.commusic','2016-03-25 00:19:39'),(11,2,11,'Opera','Power of voice','www.news.commusic','2016-03-25 00:20:04'),(12,3,12,'Jaz','New albom of Miles Davis ..','www.news.commusic','2016-03-25 00:20:15'),(13,4,13,'hotter Jaz','The hottest','www.news.commusic','2016-03-25 00:21:31'),(14,4,14,'relax Jaz','Let\'s...','www.news.commusic','2016-03-25 00:22:13'),(15,2,9,'Classical music_3','There is something new...','www.news.commusic','2016-03-25 01:45:52'),(16,2,10,'Operetta_2','Beautiful..','www.news.commusic','2016-03-25 01:46:03'),(17,2,11,'Opera_2','Power of voice','www.news.commusic','2016-03-25 01:46:48'),(18,3,12,'Jaz_2','New albom of Miles Davis ..','www.news.commusic','2016-03-25 01:46:59'),(19,4,13,'hotter Jaz_2','The hottest','www.news.commusic','2016-03-25 01:47:07'),(20,1,9,'Classical music2','There is something new...','www.news.commusic','2016-03-25 01:47:13');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_by_tag`
--

DROP TABLE IF EXISTS `news_by_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_by_tag` (
  `id_tag` int(10) unsigned NOT NULL,
  `id_news` int(10) unsigned NOT NULL,
  KEY `id_tag` (`id_tag`),
  KEY `id_news` (`id_news`),
  CONSTRAINT `news_by_tag_ibfk_1` FOREIGN KEY (`id_tag`) REFERENCES `tag_news` (`id`),
  CONSTRAINT `news_by_tag_ibfk_2` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_by_tag`
--

LOCK TABLES `news_by_tag` WRITE;
/*!40000 ALTER TABLE `news_by_tag` DISABLE KEYS */;
INSERT INTO `news_by_tag` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,7),(2,3),(2,5),(4,8),(4,9),(6,12);
/*!40000 ALTER TABLE `news_by_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_news_review`
--

DROP TABLE IF EXISTS `ref_news_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_news_review` (
  `id_news` int(10) unsigned NOT NULL,
  `id_view` int(10) unsigned NOT NULL,
  KEY `id_news` (`id_news`),
  KEY `id_view` (`id_view`),
  CONSTRAINT `ref_news_review_ibfk_1` FOREIGN KEY (`id_news`) REFERENCES `news` (`id`),
  CONSTRAINT `ref_news_review_ibfk_2` FOREIGN KEY (`id_view`) REFERENCES `review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_news_review`
--

LOCK TABLES `ref_news_review` WRITE;
/*!40000 ALTER TABLE `ref_news_review` DISABLE KEYS */;
INSERT INTO `ref_news_review` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(4,4),(7,4),(9,5),(12,6),(12,7);
/*!40000 ALTER TABLE `ref_news_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_rubric` int(10) unsigned NOT NULL,
  `name` varchar(77) NOT NULL,
  `view` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rubric` (`id_rubric`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_rubric`) REFERENCES `rubric` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,'Greate sport','Greate'),(2,1,'New sport','...'),(3,2,'REview of football','football...'),(4,5,'Water sport','....'),(5,9,'Classical music','....'),(6,12,'Jaz','Greate'),(7,13,'Hot jaz','Greate...'),(8,15,'Swing jaz','Greate'),(9,10,'Operetta TUTUTU','AUA...');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_by_tag`
--

DROP TABLE IF EXISTS `review_by_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_by_tag` (
  `id_tag` int(10) unsigned NOT NULL,
  `id_view` int(10) unsigned NOT NULL,
  KEY `id_tag` (`id_tag`),
  KEY `id_view` (`id_view`),
  CONSTRAINT `review_by_tag_ibfk_1` FOREIGN KEY (`id_tag`) REFERENCES `tag_review` (`id`),
  CONSTRAINT `review_by_tag_ibfk_2` FOREIGN KEY (`id_view`) REFERENCES `review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_by_tag`
--

LOCK TABLES `review_by_tag` WRITE;
/*!40000 ALTER TABLE `review_by_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_by_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubric`
--

DROP TABLE IF EXISTS `rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubric` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(77) NOT NULL,
  `parent_rubric` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_rubric` (`parent_rubric`),
  CONSTRAINT `rubric_ibfk_1` FOREIGN KEY (`parent_rubric`) REFERENCES `rubric` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubric`
--

LOCK TABLES `rubric` WRITE;
/*!40000 ALTER TABLE `rubric` DISABLE KEYS */;
INSERT INTO `rubric` VALUES (1,'sport',NULL),(2,'football',1),(3,'american football',2),(4,'small football',2),(5,'watersport',1),(6,'swimmming',5),(7,'water jump',5),(8,'music',NULL),(9,'classical',8),(10,'operetta',9),(11,'opera',9),(12,'jaz',8),(13,'hot jaz',12),(14,'progress jaz',12),(15,'swing jaz',12);
/*!40000 ALTER TABLE `rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_news`
--

DROP TABLE IF EXISTS `tag_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_news`
--

LOCK TABLES `tag_news` WRITE;
/*!40000 ALTER TABLE `tag_news` DISABLE KEYS */;
INSERT INTO `tag_news` VALUES (1,'sport'),(2,'football'),(3,'water'),(4,'music'),(5,'concert'),(6,'famous');
/*!40000 ALTER TABLE `tag_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_review`
--

DROP TABLE IF EXISTS `tag_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_review`
--

LOCK TABLES `tag_review` WRITE;
/*!40000 ALTER TABLE `tag_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-25  6:01:06
