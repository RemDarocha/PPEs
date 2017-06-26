-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: devatic
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
-- Current Database: `devatic`
--


--
-- Table structure for table `Demande`
--

DROP TABLE IF EXISTS `Demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Demande` (
  `dem_id` int(11) NOT NULL AUTO_INCREMENT,
  `dem_text` text,
  `dem_pers` int(11) NOT NULL,
  `dem_inter` int(11) NOT NULL,
  `dem_etat` int(11) NOT NULL,
  PRIMARY KEY (`dem_id`),
  KEY `Demande_personnelMedical_FK` (`dem_pers`),
  KEY `Demande_interventionMedicale_FK` (`dem_inter`),
  KEY `Demande_DemandeEtat_FK` (`dem_etat`),
  CONSTRAINT `Demande_DemandeEtat_FK` FOREIGN KEY (`dem_etat`) REFERENCES `DemandeEtat` (`dme_id`),
  CONSTRAINT `Demande_interventionMedicale_FK` FOREIGN KEY (`dem_inter`) REFERENCES `interventionMedicale` (`int_id`),
  CONSTRAINT `Demande_personnelMedical_FK` FOREIGN KEY (`dem_pers`) REFERENCES `personnelMedical` (`pem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Demande`
--

LOCK TABLES `Demande` WRITE;
/*!40000 ALTER TABLE `Demande` DISABLE KEYS */;
/*!40000 ALTER TABLE `Demande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DemandeEtat`
--

DROP TABLE IF EXISTS `DemandeEtat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DemandeEtat` (
  `dme_id` int(11) NOT NULL AUTO_INCREMENT,
  `dme_libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`dme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DemandeEtat`
--

LOCK TABLES `DemandeEtat` WRITE;
/*!40000 ALTER TABLE `DemandeEtat` DISABLE KEYS */;
/*!40000 ALTER TABLE `DemandeEtat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `adr_id` int(11) NOT NULL AUTO_INCREMENT,
  `adr_ligne1` varchar(250) NOT NULL,
  `adr_ligne2` varchar(50) DEFAULT NULL,
  `adr_cp` int(5) NOT NULL,
  `adr_ville` varchar(50) NOT NULL,
  PRIMARY KEY (`adr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'5812 Vitae Avec','',10087,'Naninne'),(2,'5812 Vitae Avec','',10087,'Naninne'),(3,'5812 Vitae Avec','',10087,'Naninne'),(4,'5812 Vitae Avec','',10087,'Naninne'),(5,'5812 Vitae Avec','',10087,'Naninne'),(6,'5812 Vitae Avec','',10087,'Naninne'),(7,'8 avenue du général de gaule','',33000,'Bordeaux'),(8,'5812 Vitae Avec','',10087,'Naninne'),(189,'CP 809, 2967 Vivamus Rd.',NULL,4073,'Ockelbo'),(190,'325-9456 Montes, Impasse',NULL,88444,'Kallo'),(191,'Appartement 534-4442 Molestie Av.',NULL,35775,'Calgary'),(192,'CP 366, 6776 Sed Route',NULL,81266,'Northumberland'),(193,'Appartement 712-1947 Urna Ave',NULL,5626,'Eisden'),(194,'Appartement 776-1270 Fusce Route',NULL,24465,'Kilwinning'),(195,'619-7715 Mollis. Rue',NULL,17041,'Biarritz'),(196,'946-1290 Vivamus Ave',NULL,82141,'Sromness'),(197,'Appartement 451-4334 Nunc Chemin',NULL,58760,'Bossut-Gottechain'),(198,'448-682 Ipsum Impasse',NULL,73331,'Ethe'),(199,'1591 Vivamus Avenue',NULL,8320,'Heinsch'),(200,'Appartement 988-2399 Vestibulum Route',NULL,76450,'Banchory'),(201,'460-8493 Dolor. Rue',NULL,33591,'Aligarh'),(202,'Appartement 550-1056 Dui. Rue',NULL,68257,'Valmacca'),(203,'7214 Pellentesque Impasse',NULL,65024,'Gloucester'),(204,'321-7016 Montes, Av.',NULL,79387,'La Florida'),(205,'Appartement 484-1185 Quis Rue',NULL,94460,'Tallahassee'),(206,'936-6210 Ullamcorper, Avenue',NULL,98955,'Silverton'),(207,'7442 Malesuada Chemin',NULL,46697,'Forio'),(208,'CP 445, 6317 Dapibus Av.',NULL,40700,'Basirhat'),(209,'732-1542 Rutrum Chemin',NULL,6523,'Ipís'),(210,'CP 735, 2282 Nisi Avenue',NULL,85337,'Racine'),(211,'Appartement 698-1903 Inceptos Rue',NULL,88184,'Stamford'),(212,'CP 376, 8848 Phasellus Rue',NULL,13187,'Jefferson City'),(213,'341-3615 Pede. Av.',NULL,13921,'Bergeggi'),(214,'Appartement 569-7999 Posuere Impasse',NULL,19717,'Lossiemouth'),(215,'303-1247 Fermentum Impasse',NULL,89369,'Quillón'),(216,'CP 799, 6781 Eget Ave',NULL,48216,'Pazarcık'),(217,'6220 Fringilla Av.',NULL,99251,'Pontey'),(218,'828-1184 Pharetra. Chemin',NULL,47534,'Fort William'),(219,'3633 Auctor, Av.',NULL,63201,'Malgesso'),(220,'1483 Nisi. Avenue',NULL,23818,'Purnea'),(221,'6920 Posuere Rd.',NULL,71264,'Senneville'),(222,'CP 818, 487 Amet, Ave',NULL,34803,'Montreal'),(223,'CP 586, 4617 Nec Rd.',NULL,12948,'Cognelee'),(224,'CP 947, 6907 Non, Ave',NULL,11278,'Bilaspur'),(225,'CP 363, 8896 Sed Ave',NULL,14565,'Murray Bridge'),(226,'CP 874, 5297 Fringilla Rd.',NULL,66731,'Bettiah'),(227,'Appartement 897-355 Erat Chemin',NULL,2406,'Champorcher'),(228,'Appartement 272-8932 Facilisis Chemin',NULL,66183,'Delhi'),(229,'369-2056 Arcu. Avenue',NULL,51089,'Mörfelden-Walldorf'),(230,'5006 Augue Avenue',NULL,58653,'Castel San Niccolò'),(231,'8985 Sociis Chemin',NULL,30143,'Pazarcık'),(232,'CP 799, 9502 Nunc. Rd.',NULL,52573,'Chepstow'),(233,'7986 Semper Chemin',NULL,27381,'Bloomington'),(234,'4198 Pellentesque. Ave',NULL,33994,'Campli'),(235,'2808 Eget Impasse',NULL,62139,'Gölcük'),(236,'Appartement 673-3779 Mollis Avenue',NULL,85325,'Saint-Prime'),(237,'953-5638 Ornare Ave',NULL,68970,'Felitto'),(238,'485-9197 Sem Ave',NULL,64275,'Crieff'),(239,'CP 788, 2908 Iaculis Route',NULL,93931,'Stonehaven'),(240,'1007 Facilisis, Rd.',NULL,24884,'Granada'),(241,'Appartement 420-3619 Mus. Chemin',NULL,22208,'Angleur'),(242,'CP 766, 5645 Odio. Ave',NULL,84157,'Buckingham'),(243,'3230 Posuere Impasse',NULL,60741,'Neuwied'),(244,'433-8727 Euismod Chemin',NULL,18116,'Elx'),(245,'580-4148 Quis Ave',NULL,36135,'Chelmsford'),(246,'Appartement 139-237 Egestas Impasse',NULL,35630,'Málaga'),(247,'2463 Fusce Av.',NULL,84938,'Oliver'),(248,'8177 Eget, Route',NULL,16295,'Cressa'),(249,'Appartement 586-9323 Nullam Rd.',NULL,7366,'Duncan'),(250,'Appartement 846-6663 Proin Chemin',NULL,2802,'Eigenbrakel'),(251,'Appartement 805-7561 Rutrum Rue',NULL,8903,'Hay River'),(252,'Appartement 100-1763 Massa Route',NULL,73254,'Bourlers'),(253,'320-879 Interdum. Rd.',NULL,45745,'Ajmer'),(254,'CP 566, 4323 Lobortis Ave',NULL,4380,'Suruç'),(255,'6246 Lorem Ave',NULL,56200,'Bournemouth'),(256,'CP 168, 8858 Eros Route',NULL,70628,'Les Bulles'),(257,'Appartement 183-792 Et Route',NULL,78131,'Pradamano'),(258,'454-5027 Euismod Route',NULL,41653,'Valley East'),(259,'848-949 Justo. Rue',NULL,84660,'Stony Plain'),(260,'CP 930, 5486 Semper Ave',NULL,99931,'Thurso'),(261,'659-7877 Nisl. Avenue',NULL,94152,'Knokke'),(262,'5485 Dolor, Ave',NULL,2300,'Siddi'),(263,'254-8355 Fringilla, Av.',NULL,46767,'West Vancouver'),(264,'Appartement 221-9356 Ipsum. Impasse',NULL,96840,'Fontaine-Valmont'),(265,'819-7033 Semper Av.',NULL,58648,'Tarcento'),(266,'CP 931, 8651 Et, Av.',NULL,81115,'Caledon'),(267,'CP 436, 9223 Velit. Avenue',NULL,54259,'Lévis'),(268,'CP 458, 6007 Ornare, Route',NULL,96760,'Orléans'),(269,'4569 Egestas. Chemin',NULL,93377,'Móstoles'),(270,'Appartement 845-9732 A, Rue',NULL,37671,'Dundee'),(271,'Appartement 136-3754 Ornare Impasse',NULL,48664,'Marchienne-au-Pont'),(272,'923-2577 Laoreet Ave',NULL,18690,'Quilaco'),(273,'9004 Enim. Ave',NULL,91793,'Placanica'),(274,'CP 626, 4699 Ridiculus Impasse',NULL,31742,'Łomża'),(275,'CP 135, 4165 Mauris. Rue',NULL,90525,'Sint-Pieters-Kapelle'),(276,'CP 110, 3006 Mauris Rue',NULL,77831,'Alexandra'),(277,'CP 695, 7460 Luctus Impasse',NULL,83644,'Guntakal'),(278,'Appartement 167-8808 Integer Rd.',NULL,40921,'Langley'),(279,'880-3863 Natoque Route',NULL,81696,'Ottignies-Louvain-la-Neuve'),(280,'477-8961 Faucibus Ave',NULL,30959,'Olmen'),(281,'Appartement 496-2053 Nulla. Av.',NULL,54567,'Comox'),(282,'Appartement 640-7478 Eu Impasse',NULL,46048,'Penrith'),(283,'7265 Arcu. Route',NULL,50017,'Richmond'),(284,'237-2432 Dapibus Route',NULL,78235,'Wadgassen'),(285,'Appartement 258-8555 Mauris Avenue',NULL,26791,'Rauco'),(286,'Appartement 247-166 Erat Rd.',NULL,21358,'Bludenz'),(287,'Appartement 739-1311 Nisl. Chemin',NULL,71483,'Villamassargia'),(288,'12 rue du roi','',40125,'Castres-Gironde'),(289,'75bis avenue du maréchal','',33650,'Mérignac'),(290,'1 bourg','',30547,'Cestas'),(291,'12 lotissement la chennaie','',33650,'Saint-Morillon'),(292,'13 lotissement la chennaie','',33650,'Saint-Morillon'),(293,'6 bourg','',33650,'Saint-Selve'),(294,'5812 Vitae Avec','',10087,'Naninne'),(295,'5812 Vitae Avec','',10087,'Naninne'),(296,'5812 Vitae Avec','',10087,'Naninne'),(297,'5812 Vitae Avec','',10087,'Naninne'),(298,'5812 Vitae Avec','',10087,'Naninne'),(299,'5812 Vitae Avec','',10087,'Naninne'),(300,'5812 Vitae Avec','',10087,'Naninne'),(301,'5812 Vitae Avec','',10087,'Naninne'),(302,'5812 Vitae Avec','',10087,'Naninne'),(303,'5812 Vitae Avec','',10087,'Naninne'),(304,'5812 Vitae Avec','',10087,'Naninne'),(305,'5812 Vitae Avec','',10087,'Naninne'),(306,'5812 Vitae Avec','',10087,'Naninne'),(307,'5812 Vitae Avec','',10087,'Naninne'),(308,'CP 184, 4870 Ligula. Rue',NULL,97678,'Białystok'),(309,'CP 822, 3231 Libero. Impasse',NULL,87555,'Little Rock'),(310,'944-702 Dis Rd.',NULL,94807,'Joinville'),(311,'CP 281, 7160 Nisi Impasse',NULL,9343,'Baisy-Thy'),(312,'500-2260 Tellus Route',NULL,15164,'Riesa'),(313,'Appartement 970-7252 Hendrerit Rd.',NULL,80796,'Canmore'),(314,'CP 925, 1530 Duis Route',NULL,77935,'Lapscheure'),(315,'CP 976, 8232 Etiam Chemin',NULL,18613,'Lac Ste. Anne'),(316,'Appartement 878-9117 Dui, Ave',NULL,77039,'Vichuquén'),(317,'759-5103 Lacus. Ave',NULL,53011,'Burlington'),(318,'5812 Vitae Avec','',10087,'Naninne'),(319,'5812 Vitae Avec','',10087,'Naninne'),(320,'5812 Vitae Avec','',10087,'Naninne'),(321,'5812 Vitae Avec','',10087,'Naninne'),(322,'5812 Vitae Avec','',10087,'Naninne'),(323,'5812 Vitae Avec','',10087,'Naninne'),(324,'5812 Vitae Avec','',10087,'Naninne'),(325,'5812 Vitae Avec','',10087,'Naninne'),(326,'5812 Vitae Avec','',10087,'Naninne'),(327,'5812 Vitae Avec','',10087,'Naninne'),(328,'948-2872 Quisque Rd.',NULL,57230,'Malle'),(329,'CP 869, 7518 Eleifend Chemin',NULL,60392,'Vezirköprü'),(330,'9421 Amet, Chemin',NULL,67915,'Kortessem'),(331,'608-6618 Velit Impasse',NULL,10617,'Chonchi'),(332,'789-253 Id, Av.',NULL,49287,'Katihar'),(333,'CP 466, 2417 Ultrices Chemin',NULL,18096,'Valparaíso de Goiás'),(334,'CP 885, 9469 Nibh Rd.',NULL,74612,'Castle Douglas'),(335,'CP 247, 3635 Netus Rue',NULL,8523,'Sennariolo'),(336,'CP 559, 3545 Nibh. Av.',NULL,66352,'Częstochowa'),(337,'294-1362 Dis Avenue',NULL,69044,'Workington'),(338,'5812 Vitae Avec','',10087,'Naninne'),(339,'5812 Vitae Avec','',10087,'Naninne'),(340,'5812 Vitae Avec','',10087,'Naninne'),(341,'5812 Vitae Avec','',10087,'Naninne'),(342,'5812 Vitae Avec','',10087,'Naninne'),(343,'5812 Vitae Avec','',10087,'Naninne'),(344,'5812 Vitae Avec','',10087,'Naninne'),(345,'5812 Vitae Avec','',10087,'Naninne'),(346,'5812 Vitae Avec','',10087,'Naninne'),(347,'5812 Vitae Avec','',10087,'Naninne'),(348,'Appartement 831-1065 Proin Impasse',NULL,92411,'Bondo'),(349,'2376 Scelerisque Rd.',NULL,36,'Coevorden'),(350,'550-2253 Ligula Impasse',NULL,59711,'Schweinfurt'),(351,'6588 Magnis Avenue',NULL,50680,'Glovertown'),(352,'Appartement 939-3430 Convallis Chemin',NULL,40692,'Orbais'),(353,'5055 Accumsan Av.',NULL,11808,'Annapolis'),(354,'CP 112, 154 Congue Rd.',NULL,20637,'Frankston'),(355,'Appartement 790-6210 Integer Rue',NULL,16041,'Ipís'),(356,'CP 625, 763 Sed Chemin',NULL,71773,'Tacoma'),(357,'9916 Orci Impasse',NULL,97495,'San Valentino in Abruzzo Citeriore'),(358,'3821 Libero Route',NULL,72084,'Borghetto di Borbera'),(359,'419-3811 Dolor Route',NULL,72902,'Maringá'),(360,'Appartement 537-1631 Ac Rue',NULL,35596,'Windsor'),(361,'CP 786, 2493 Lectus Rue',NULL,97660,'Carmarthen'),(362,'3664 Bibendum Route',NULL,49225,'Orange'),(363,'CP 282, 9690 Aliquet Impasse',NULL,70571,'Lokeren'),(364,'CP 656, 253 Quisque Impasse',NULL,53181,'Jumet'),(365,'Appartement 248-5013 Hendrerit Rd.',NULL,50997,'Olmen'),(366,'CP 993, 6465 Odio. Chemin',NULL,74113,'Saint-Georges'),(367,'415-7315 Non Route',NULL,18202,'Abbotsford'),(368,'5812 Vitae Avec','',10087,'Naninne'),(369,'5812 Vitae Avec','',10087,'Naninne'),(370,'5812 Vitae Avec','',10087,'Naninne'),(371,'5812 Vitae Avec','',10087,'Naninne'),(372,'5812 Vitae Avec','',10087,'Naninne'),(373,'5812 Vitae Avec','',10087,'Naninne'),(374,'5812 Vitae Avec','',10087,'Naninne'),(375,'5812 Vitae Avec','',10087,'Naninne'),(376,'5812 Vitae Avec','',10087,'Naninne'),(377,'5812 Vitae Avec','',10087,'Naninne'),(378,'8635 Sagittis. Av.',NULL,57255,'Kufstein'),(379,'Appartement 354-4110 Cursus Chemin',NULL,51,'Serik'),(380,'5549 Orci Avenue',NULL,51277,'Montignies-Saint-Christophe'),(381,'9577 Cras Rd.',NULL,73885,'Sannazzaro de\' Burgondi'),(382,'Appartement 709-3685 Quisque Rd.',NULL,34445,'Biez'),(383,'718-8767 Malesuada. Avenue',NULL,67026,'Forfar'),(384,'3966 Vitae Chemin',NULL,88917,'Stene'),(385,'4444 Risus Route',NULL,99372,'Vanier'),(386,'CP 405, 3450 Velit Avenue',NULL,94251,'Drancy'),(387,'CP 469, 947 Dolor. Avenue',NULL,96413,'Port Coquitlam'),(388,'Appartement 313-9731 Orci. Avenue',NULL,33319,'Morro Reatino'),(393,'7 rue des papier','',33000,'BORDEAUX'),(394,'7 grande rue','',33000,'BEGLES'),(395,'8 rue des peupliers','',33650,'SAINT-SELVE'),(396,'1 bourg','',33000,'BORDEAUX'),(397,'45 rue lectra des familles','',33000,'BORDEAUX'),(398,'78 aveneue des échelles','',33650,'BORDEAUX'),(399,'8 chemin du gat mort','',33650,'SAINT-MORILLON'),(400,'7 rue du chemin','',33650,'SAINT-MORILLON'),(401,'3 rue du bois','',33650,'SAINT-SELVE'),(402,'5812 Vitae Avec','',10087,'Naninne'),(403,'6 lieu dit lol','',33000,'LE BOUSCAT'),(404,'','',0,''),(405,'5812 Vitae Avec','',10087,'Naninne');
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergie`
--

DROP TABLE IF EXISTS `allergie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergie` (
  `all_id` int(11) NOT NULL,
  `all_libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`all_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergie`
--

LOCK TABLES `allergie` WRITE;
/*!40000 ALTER TABLE `allergie` DISABLE KEYS */;
INSERT INTO `allergie` VALUES (1,'Aucune'),(2,'Pollens & Graminées'),(3,'Poils de chat'),(4,'Blattes & Cafards'),(5,'Pollens & Bétulacées'),(6,'Moissisures'),(7,'Poils de lapin'),(8,'Alimentaires'),(9,'Lavande'),(10,'Latex'),(11,'Acariens');
/*!40000 ALTER TABLE `allergie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batiment`
--

DROP TABLE IF EXISTS `batiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batiment` (
  `bat_id` int(11) NOT NULL,
  `bat_libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`bat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batiment`
--

LOCK TABLES `batiment` WRITE;
/*!40000 ALTER TABLE `batiment` DISABLE KEYS */;
INSERT INTO `batiment` VALUES (1,'Bâtiment 1'),(2,'Bâtiment 2');
/*!40000 ALTER TABLE `batiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chambre` (
  `cha_id` int(11) NOT NULL AUTO_INCREMENT,
  `cha_nbLit` int(11) NOT NULL,
  `cha_nbOccupant` int(11) NOT NULL,
  `cha_code` varchar(5) NOT NULL,
  `cha_type` int(11) NOT NULL,
  `cha_etage_id` int(11) NOT NULL,
  `cha_disponible` tinyint(1) NOT NULL,
  PRIMARY KEY (`cha_id`),
  KEY `chambre_etage` (`cha_etage_id`),
  KEY `chambre_typeChambre_FK` (`cha_type`),
  CONSTRAINT `chambre_etage` FOREIGN KEY (`cha_etage_id`) REFERENCES `etage` (`eta_id`),
  CONSTRAINT `chambre_typeChambre_FK` FOREIGN KEY (`cha_type`) REFERENCES `typeChambre` (`tch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chambre`
--

LOCK TABLES `chambre` WRITE;
/*!40000 ALTER TABLE `chambre` DISABLE KEYS */;
INSERT INTO `chambre` VALUES (1,4,1,'1A',2,1,1),(2,2,2,'2A',3,1,1),(3,3,1,'3A',2,1,0),(4,2,-1,'103A',1,2,1),(5,2,1,'102A',2,2,1),(6,4,0,'104A',2,2,1),(7,5,2,'105A',2,2,1),(8,7,3,'106A',1,2,1),(9,4,2,'200A',2,3,0),(10,5,1,'201A',2,3,1),(11,6,2,'202A',2,3,1),(12,6,0,'203A',1,3,1),(13,6,0,'204A',1,3,1),(14,4,2,'205A',1,3,0),(15,6,6,'206A',1,3,0),(16,2,0,'207A',2,3,1),(17,3,0,'208A',1,3,1),(18,5,3,'209A',2,3,0),(19,3,1,'210A',2,3,0),(20,5,1,'211A',2,3,1),(21,4,2,'212A',1,3,0),(22,4,2,'213A',1,3,1),(23,5,0,'214A',1,3,1),(24,3,3,'215A',2,3,0),(25,6,4,'216A',1,3,0),(26,5,2,'217A',2,3,1),(27,5,3,'218A',2,3,0),(28,6,3,'219A',2,3,1),(29,5,1,'220A',1,3,1),(30,6,4,'221A',2,3,0),(31,4,2,'222A',2,2,0),(32,6,4,'223A',2,2,0),(33,2,0,'224A',1,2,0),(34,6,4,'225A',2,2,0),(35,6,4,'226A',1,2,0),(36,5,0,'227A',1,2,1),(37,5,0,'228A',1,2,1),(38,4,0,'229A',1,2,1),(39,4,0,'230A',1,2,1),(40,6,3,'231A',2,2,1),(41,5,0,'232A',1,2,1),(42,2,0,'233A',1,2,1),(43,6,4,'234A',1,2,0),(44,2,0,'235A',2,2,0),(45,5,3,'236A',1,2,0),(46,5,3,'237A',1,2,0),(47,4,2,'238A',2,2,0),(48,4,2,'239A',2,2,0),(49,2,0,'240A',1,2,1),(50,2,0,'241A',1,2,0),(51,4,0,'242A',2,2,1),(52,3,1,'243A',2,2,0),(53,3,0,'244A',2,2,1),(54,2,0,'245A',2,2,0),(55,2,0,'246A',2,2,0),(56,4,0,'247A',1,2,1),(57,5,2,'248A',1,2,1),(58,4,1,'249A',1,2,1),(59,5,2,'250A',1,2,1),(60,5,1,'251A',1,2,1),(61,4,2,'252A',1,2,0),(62,4,2,'253A',2,2,0),(63,3,1,'254A',2,2,0),(64,5,1,'255A',2,2,1),(65,4,1,'256A',1,2,1),(66,2,0,'257A',1,2,1),(67,2,0,'258A',1,2,0),(68,6,3,'259A',2,2,1),(69,2,0,'260A',2,2,1),(70,5,3,'261A',1,2,0),(71,5,3,'262A',2,2,0),(72,5,0,'263A',1,2,1),(73,4,0,'264A',2,2,1),(74,3,0,'265A',2,2,1),(75,3,0,'266A',2,2,1),(76,1,0,'267A',4,2,0),(77,4,1,'268A',2,2,1),(78,6,3,'269A',1,2,1),(79,6,1,'270A',1,2,1),(80,5,2,'271A',1,2,1),(81,6,0,'272A',2,2,1),(82,4,0,'273A',2,2,1),(83,3,0,'274A',1,2,1),(84,3,0,'275A',1,2,1),(85,4,1,'276A',2,2,1),(86,2,0,'277A',2,2,1),(87,6,1,'278A',2,2,1),(88,4,2,'279A',2,2,0),(89,4,2,'280A',1,2,0),(90,3,1,'281A',1,2,0),(91,3,1,'282A',2,2,0),(92,3,1,'283A',1,2,0),(93,5,0,'284A',1,2,1),(94,3,1,'285A',2,2,0),(95,1,0,'286A',4,2,0),(96,3,0,'287A',2,2,1),(97,3,0,'288A',1,2,1),(98,2,0,'289A',1,2,0),(99,6,3,'290A',2,2,1),(100,6,3,'291A',2,2,1),(101,5,0,'292A',2,2,1),(102,5,0,'293A',1,2,1),(103,6,0,'294A',1,2,1),(104,2,0,'295A',2,2,1),(105,4,0,'296A',2,2,1),(106,2,0,'297A',1,2,0),(107,4,2,'298A',2,2,0),(108,1,0,'299A',4,2,0),(109,1,0,'1B',4,7,0),(110,1,0,'2B',4,7,0),(111,3,0,'3B',2,7,1),(112,2,0,'4B',1,7,1),(113,4,0,'5B',2,7,1),(114,4,0,'6B',1,7,1),(115,2,0,'7B',4,7,1),(116,1,0,'8B',4,7,0),(117,4,0,'9B',3,7,1),(118,3,0,'10B',4,7,1),(119,4,0,'11B',1,7,1),(120,4,0,'12B',2,7,1),(121,1,0,'13B',4,7,1),(122,1,0,'14B',4,7,1),(123,3,0,'15B',2,7,1),(124,3,0,'16B',2,7,1),(125,4,0,'17B',1,7,1),(126,1,0,'18B',4,7,1),(127,2,0,'19B',2,7,1),(128,2,0,'20B',4,7,1),(129,1,0,'21B',4,7,1),(130,2,0,'22B',2,7,1),(131,4,0,'23B',4,7,1),(132,3,0,'24B',4,7,1),(133,3,0,'25B',2,7,1),(134,3,0,'26B',1,7,1),(135,2,0,'27B',4,7,1),(136,1,0,'28B',4,7,1),(137,2,0,'29B',1,7,1),(138,4,0,'30B',2,7,1),(139,1,0,'31B',4,7,1),(140,4,0,'32B',4,7,1),(141,3,0,'33B',2,7,1),(142,1,0,'34B',4,7,1),(143,4,0,'35B',1,7,1),(144,1,0,'36B',4,7,1),(145,1,0,'37B',4,7,1),(146,1,0,'38B',4,7,1),(147,3,0,'39B',1,7,1),(148,3,0,'40B',1,7,1),(149,2,0,'41B',4,7,1),(150,2,0,'42B',2,7,1),(151,1,0,'43B',4,7,1),(152,2,0,'44B',4,7,1),(153,4,0,'45B',2,7,1),(154,4,0,'46B',4,7,1),(155,1,0,'47B',4,7,1),(156,3,0,'48B',1,7,1),(157,3,0,'49B',4,7,1),(158,2,0,'50B',4,7,1),(159,4,0,'51B',1,7,1),(160,4,0,'52B',1,7,1),(161,3,0,'53B',4,7,1),(162,3,0,'54B',2,7,1),(163,4,0,'55B',1,7,1),(164,2,0,'56B',2,7,1),(165,1,0,'57B',4,7,1),(166,2,0,'58B',2,7,1),(167,3,0,'59B',2,7,1),(168,2,0,'60B',4,7,1),(169,1,0,'61B',4,7,1),(170,1,0,'62B',4,7,1),(171,4,0,'63B',2,7,1),(172,1,0,'64B',4,7,1),(173,2,0,'65B',4,7,1),(174,1,0,'66B',4,7,1),(175,3,0,'67B',2,7,1),(176,1,0,'68B',4,7,1),(177,4,0,'69B',2,7,1),(178,1,0,'70B',4,7,1),(179,2,0,'71B',4,7,1),(180,1,0,'72B',4,7,1),(181,3,0,'73B',2,7,1),(182,1,0,'74B',4,7,1),(183,1,0,'75B',4,7,1),(184,1,0,'76B',4,7,1),(185,2,0,'77B',2,7,1),(186,4,0,'78B',1,7,1),(187,3,0,'79B',4,7,1),(188,1,0,'80B',4,7,1),(189,1,0,'81B',4,7,1),(190,4,0,'82B',2,7,1),(191,1,0,'83B',4,7,1),(192,1,0,'84B',4,7,1),(193,3,0,'85B',1,7,1),(194,2,0,'86B',1,7,1),(195,1,0,'87B',4,7,1),(196,4,0,'88B',2,7,1),(197,1,0,'89B',4,7,1),(198,3,0,'90B',2,7,1),(199,1,0,'91B',4,7,1),(200,1,0,'92B',4,7,1),(201,4,0,'93B',2,7,1),(202,1,0,'94B',4,7,1),(203,4,0,'95B',1,7,1),(204,4,0,'96B',4,7,1),(205,1,0,'97B',4,7,1),(206,1,0,'98B',4,7,1),(207,4,0,'99B',2,7,1),(208,2,1,'100B',1,7,0);
/*!40000 ALTER TABLE `chambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estPersonneConfiance`
--

DROP TABLE IF EXISTS `estPersonneConfiance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estPersonneConfiance` (
  `personneConfiance_pec_id` int(11) NOT NULL,
  `patient_pat_id` int(11) NOT NULL,
  `epc_qualification` varchar(100) NOT NULL,
  PRIMARY KEY (`personneConfiance_pec_id`,`patient_pat_id`),
  KEY `estPersonneConfiance_patient` (`patient_pat_id`),
  CONSTRAINT `estPersonneConfiance_patient` FOREIGN KEY (`patient_pat_id`) REFERENCES `patient` (`pat_id`),
  CONSTRAINT `estPersonneConfiance_personneConfiance` FOREIGN KEY (`personneConfiance_pec_id`) REFERENCES `personneConfiance` (`pec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estPersonneConfiance`
--

LOCK TABLES `estPersonneConfiance` WRITE;
/*!40000 ALTER TABLE `estPersonneConfiance` DISABLE KEYS */;
INSERT INTO `estPersonneConfiance` VALUES (1,1,'Femme'),(2,1,'Frère'),(3,2,'Cousin'),(4,2,'Femme'),(5,2,'Meilleur amis');
/*!40000 ALTER TABLE `estPersonneConfiance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etage`
--

DROP TABLE IF EXISTS `etage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etage` (
  `eta_id` int(11) NOT NULL,
  `eta_libelle` varchar(30) NOT NULL,
  `eta_batiment` int(11) NOT NULL,
  PRIMARY KEY (`eta_id`),
  KEY `etage_batiment` (`eta_batiment`),
  CONSTRAINT `etage_batiment` FOREIGN KEY (`eta_batiment`) REFERENCES `batiment` (`bat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etage`
--

LOCK TABLES `etage` WRITE;
/*!40000 ALTER TABLE `etage` DISABLE KEYS */;
INSERT INTO `etage` VALUES (1,'RDC',1),(2,'Etage 1',1),(3,'Etage 2',1),(4,'Etage 3',1),(5,'Etage 4',1),(6,'Etage 5',1),(7,'RDC',2),(8,'Etage 1',2),(9,'Etage 2',2),(10,'Etage 3',2),(11,'Etage 4',2),(12,'Etage 5',2);
/*!40000 ALTER TABLE `etage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupeSanguin`
--

DROP TABLE IF EXISTS `groupeSanguin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupeSanguin` (
  `grs_id` int(11) NOT NULL,
  `grs_libelle` varchar(3) NOT NULL,
  PRIMARY KEY (`grs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupeSanguin`
--

LOCK TABLES `groupeSanguin` WRITE;
/*!40000 ALTER TABLE `groupeSanguin` DISABLE KEYS */;
INSERT INTO `groupeSanguin` VALUES (1,'A+'),(2,'A-'),(3,'B+'),(4,'B-'),(5,'O+'),(6,'O-'),(7,'AB+'),(8,'AB-');
/*!40000 ALTER TABLE `groupeSanguin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interventionMedicale`
--

DROP TABLE IF EXISTS `interventionMedicale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interventionMedicale` (
  `int_id` int(11) NOT NULL AUTO_INCREMENT,
  `int_date` date NOT NULL,
  `int_heureEntree` time NOT NULL,
  `int_heureSortie` time DEFAULT NULL,
  `int_heureIncision` time DEFAULT NULL,
  `int_type` int(11) NOT NULL,
  `int_salleId` int(11) NOT NULL,
  `int_patId` int(11) NOT NULL,
  PRIMARY KEY (`int_id`),
  KEY `interventionMedicale_salleIntervention_FK` (`int_salleId`),
  KEY `interventionMedicale_typeIntervention_FK` (`int_type`),
  KEY `interventionMedicale_patient_FK` (`int_patId`),
  CONSTRAINT `interventionMedicale_patient_FK` FOREIGN KEY (`int_patId`) REFERENCES `patient` (`pat_id`),
  CONSTRAINT `interventionMedicale_salleIntervention_FK` FOREIGN KEY (`int_salleId`) REFERENCES `salleIntervention` (`sai_id`),
  CONSTRAINT `interventionMedicale_typeIntervention_FK` FOREIGN KEY (`int_type`) REFERENCES `typeIntervention` (`tin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interventionMedicale`
--

LOCK TABLES `interventionMedicale` WRITE;
/*!40000 ALTER TABLE `interventionMedicale` DISABLE KEYS */;
INSERT INTO `interventionMedicale` VALUES (4,'2017-03-19','20:16:00',NULL,NULL,6,7,1),(6,'2017-11-29','12:40:00',NULL,NULL,6,7,2),(7,'2017-02-18','15:19:00',NULL,NULL,3,1,3),(8,'2017-03-06','12:45:00',NULL,NULL,3,1,4),(9,'2016-01-22','22:22:00',NULL,NULL,5,2,5),(10,'2017-03-16','10:30:00',NULL,NULL,1,1,5),(11,'2017-03-08','17:58:00',NULL,NULL,3,7,6),(15,'2017-03-08','17:35:00',NULL,NULL,5,2,2),(16,'2017-03-08','22:40:00',NULL,NULL,4,3,3),(17,'1970-01-01','12:50:00',NULL,NULL,2,6,6),(22,'1970-01-01','12:12:00',NULL,NULL,2,7,2),(26,'2017-03-27','16:48:00',NULL,NULL,5,7,4),(27,'2017-03-27','20:16:00',NULL,NULL,5,7,6),(28,'2017-04-01','15:50:00',NULL,NULL,1,3,6),(32,'2017-03-27','18:49:00',NULL,NULL,4,2,3),(33,'2017-03-27','16:48:00',NULL,NULL,5,7,7),(34,'2017-04-22','10:10:00',NULL,NULL,1,2,3),(37,'2017-04-01','12:00:00',NULL,NULL,1,7,2),(38,'2017-04-07','00:00:00',NULL,NULL,5,7,4),(39,'2017-04-20','12:00:00',NULL,NULL,2,6,4),(40,'2017-04-07','12:00:00',NULL,NULL,2,2,46),(41,'2017-04-12','04:00:00',NULL,NULL,2,1,11),(43,'2017-04-12','07:00:00',NULL,NULL,1,1,93),(44,'2017-04-08','00:00:00',NULL,NULL,5,7,96),(45,'2017-04-15','12:00:00',NULL,NULL,5,7,27),(48,'2017-05-30','00:10:00',NULL,NULL,2,6,12),(52,'2017-05-19','12:30:00',NULL,NULL,1,2,7),(53,'2017-05-18','11:05:00',NULL,NULL,2,2,46),(54,'2017-05-18','10:00:00',NULL,NULL,3,2,59),(55,'2017-05-19','10:00:00',NULL,NULL,6,3,19),(58,'2017-05-17','10:45:00',NULL,NULL,2,7,1);
/*!40000 ALTER TABLE `interventionMedicale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linge`
--

DROP TABLE IF EXISTS `linge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linge` (
  `lin_id` int(11) NOT NULL AUTO_INCREMENT,
  `lin_type` int(11) NOT NULL,
  `lin_ser` int(11) NOT NULL,
  `lin_etat` tinyint(1) NOT NULL,
  `lin_qrcode_print` tinyint(1) NOT NULL,
  PRIMARY KEY (`lin_id`),
  KEY `linge_service_FK` (`lin_ser`),
  KEY `linge_typeLinge_FK` (`lin_type`),
  CONSTRAINT `linge_service_FK` FOREIGN KEY (`lin_ser`) REFERENCES `service` (`ser_id`),
  CONSTRAINT `linge_typeLinge_FK` FOREIGN KEY (`lin_type`) REFERENCES `typeLinge` (`tli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5352 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linge`
--

LOCK TABLES `linge` WRITE;
/*!40000 ALTER TABLE `linge` DISABLE KEYS */;
INSERT INTO `linge` VALUES (4668,7,3,0,1),(4669,7,3,0,1),(4670,7,3,0,1),(4671,7,3,0,1),(4672,7,3,0,1),(4673,7,3,0,1),(4674,7,3,0,1),(4675,7,3,0,1),(4676,7,3,0,1),(4677,7,3,0,1),(4678,7,3,0,1),(4679,7,3,0,1),(4680,7,3,0,1),(4681,7,3,0,1),(4682,7,3,0,1),(4683,7,3,0,1),(4684,7,3,0,1),(4685,7,3,0,1),(4686,7,3,0,1),(4687,7,3,0,1),(4688,7,3,0,1),(4689,7,3,0,1),(4690,7,3,0,1),(4691,7,3,0,1),(4692,7,3,0,1),(4693,7,3,0,1),(4694,7,3,0,1),(4695,7,3,0,1),(4696,7,3,0,1),(4697,7,3,0,1),(4698,7,3,0,1),(4699,7,3,0,1),(4700,7,3,0,1),(4701,7,3,0,1),(4702,7,3,0,1),(4703,7,3,0,1),(4704,7,3,0,1),(4705,7,3,0,1),(4706,7,3,0,1),(4707,7,3,0,1),(4708,7,3,0,1),(4709,7,3,0,1),(4710,7,3,0,1),(4711,7,3,0,1),(4712,7,3,0,1),(4713,7,3,0,1),(4714,7,3,0,1),(4715,7,3,0,1),(4716,7,3,0,1),(4717,7,3,0,1),(4718,7,3,0,1),(4719,7,3,0,1),(4720,7,3,0,1),(4721,7,3,0,1),(4722,7,3,0,1),(4723,7,3,0,1),(4724,7,3,0,1),(4725,7,3,0,1),(4726,7,3,0,1),(4727,7,3,0,1),(4728,7,3,0,1),(4729,7,3,0,1),(4730,7,3,0,1),(4731,7,3,0,1),(4732,7,3,0,1),(4733,7,3,0,1),(4734,7,3,0,1),(4735,7,3,0,1),(4736,7,3,0,1),(4737,7,3,0,1),(4738,7,3,0,1),(4739,7,3,0,1),(4740,7,3,0,1),(4741,7,3,0,1),(4742,7,3,0,1),(4743,7,3,0,1),(4744,7,3,0,1),(4745,7,3,0,1),(4746,7,3,0,1),(4747,7,3,0,1),(4748,7,3,0,1),(4749,7,3,0,1),(4750,7,3,0,1),(4751,7,3,0,1),(4752,7,3,0,1),(4753,7,3,0,1),(4754,7,3,0,1),(4755,7,3,0,1),(4756,7,3,0,1),(4757,7,3,0,1),(4758,7,3,0,1),(4759,7,3,0,1),(4760,7,3,0,1),(4761,7,3,0,1),(4762,7,3,0,1),(4763,7,3,0,1),(4764,7,3,0,1),(4765,7,3,0,1),(4766,7,3,0,1),(4767,7,3,0,1),(4768,7,3,0,1),(4769,7,3,0,1),(4770,7,3,0,1),(4771,7,3,0,1),(4772,7,3,0,1),(4773,7,3,0,1),(4774,7,3,0,1),(4775,7,3,0,1),(4776,7,3,0,1),(4777,7,3,0,1),(4778,7,3,0,1),(4779,7,3,0,1),(4780,7,3,0,1),(4781,7,3,0,1),(4782,7,3,0,1),(4783,7,3,0,1),(4784,7,3,0,1),(4785,7,3,0,1),(4786,7,3,0,1),(4787,7,3,0,1),(4788,7,3,0,1),(4789,7,3,0,1),(4790,7,3,0,1),(4791,7,3,0,1),(4792,7,3,0,1),(4793,7,3,0,1),(4794,7,3,0,1),(4795,7,3,0,1),(4796,7,3,0,1),(4797,7,3,0,1),(4798,7,3,0,1),(4799,7,3,0,1),(4800,7,3,0,1),(4801,7,3,0,1),(4802,7,3,0,1),(4803,7,3,0,1),(4804,7,3,0,1),(4805,7,3,0,1),(4806,7,3,0,1),(4807,7,3,0,1),(4808,7,3,0,1),(4809,7,3,0,1),(4810,7,3,0,1),(4811,7,3,0,1),(4812,7,3,0,1),(4813,7,3,0,1),(4814,7,3,0,1),(4815,7,3,0,1),(4816,7,3,0,1),(4817,7,3,0,1),(4818,1,2,0,1),(4819,1,2,0,1),(4820,1,2,0,1),(4821,1,2,0,1),(4822,1,2,0,1),(4823,1,2,0,1),(4824,1,2,0,1),(4825,1,2,0,1),(4826,1,2,0,1),(4827,1,2,0,1),(4828,1,2,0,1),(4829,1,2,0,1),(4830,1,2,0,1),(4831,1,2,0,1),(4832,1,2,0,1),(4833,1,2,0,1),(4834,1,2,0,1),(4835,1,2,0,1),(4836,1,2,0,1),(4837,1,2,0,1),(4838,1,2,0,1),(4839,1,2,0,1),(4840,1,2,0,1),(4841,1,2,0,1),(4842,1,2,0,1),(4843,1,2,0,1),(4844,1,2,0,1),(4845,1,2,0,1),(4846,1,2,0,1),(4847,1,2,0,1),(4848,1,2,0,1),(4849,1,2,0,1),(4850,1,2,0,1),(4851,1,2,0,1),(4852,1,2,0,1),(4853,1,2,0,1),(4854,1,2,0,1),(4855,1,2,0,1),(4856,1,2,0,1),(4857,1,2,0,1),(4858,1,2,0,1),(4859,1,2,0,1),(4860,1,2,0,1),(4861,1,2,0,1),(4862,1,2,0,1),(4863,1,2,0,1),(4864,1,2,0,1),(4865,1,2,0,1),(4866,1,2,0,1),(4867,1,2,0,1),(4868,2,2,0,1),(4869,2,2,0,1),(4870,2,2,0,1),(4871,2,2,0,1),(4872,2,2,0,1),(4873,2,2,0,1),(4874,2,2,0,1),(4875,2,2,0,1),(4876,2,2,0,1),(4877,2,2,0,1),(4878,2,2,0,1),(4879,2,2,0,1),(4880,2,2,0,1),(4881,2,2,0,1),(4882,2,2,0,1),(4883,2,2,0,1),(4884,2,2,0,1),(4885,2,2,0,1),(4886,2,2,0,1),(4887,2,2,0,1),(4888,2,2,0,1),(4889,2,2,0,1),(4890,2,2,0,1),(4891,2,2,0,1),(4892,2,2,0,1),(4893,2,2,0,1),(4894,2,2,0,1),(4895,2,2,0,1),(4896,2,2,0,1),(4897,2,2,0,1),(4898,2,2,0,1),(4899,2,2,0,1),(4900,2,2,0,1),(4901,2,2,0,1),(4902,2,2,0,1),(4903,2,2,0,1),(4904,2,2,0,1),(4905,2,2,0,1),(4906,2,2,0,1),(4907,2,2,0,1),(4908,2,2,0,1),(4909,2,2,0,1),(4910,2,2,0,1),(4911,2,2,0,1),(4912,2,2,0,1),(4913,2,2,0,1),(4914,2,2,0,1),(4915,2,2,0,1),(4916,2,2,0,1),(4917,2,2,0,1),(4918,3,2,0,1),(4919,3,2,0,1),(4920,3,2,0,1),(4921,3,2,0,1),(4922,3,2,0,1),(4923,3,2,0,1),(4924,3,2,0,1),(4925,3,2,0,1),(4926,3,2,0,1),(4927,3,2,0,1),(4928,3,2,0,1),(4929,3,2,0,1),(4930,3,2,0,1),(4931,3,2,0,1),(4932,3,2,0,1),(4933,3,2,0,1),(4934,3,2,0,1),(4935,3,2,0,1),(4936,3,2,0,1),(4937,3,2,0,1),(4938,3,2,0,1),(4939,3,2,0,1),(4940,3,2,0,1),(4941,3,2,0,1),(4942,3,2,0,1),(4943,3,2,0,1),(4944,3,2,0,1),(4945,3,2,0,1),(4946,3,2,0,1),(4947,3,2,0,1),(4948,3,2,0,1),(4949,3,2,0,1),(4950,3,2,0,1),(4951,3,2,0,1),(4952,3,2,0,1),(4953,3,2,0,1),(4954,3,2,0,1),(4955,3,2,0,1),(4956,3,2,0,1),(4957,3,2,0,1),(4958,3,2,0,1),(4959,3,2,0,1),(4960,3,2,0,1),(4961,3,2,0,1),(4962,3,2,0,1),(4963,3,2,0,1),(4964,3,2,0,1),(4965,3,2,0,1),(4966,3,2,0,1),(4967,3,2,0,1),(4968,4,2,0,1),(4969,4,2,0,1),(4970,4,2,0,1),(4971,4,2,0,1),(4972,4,2,0,1),(4973,4,2,0,1),(4974,4,2,0,1),(4975,4,2,0,1),(4976,4,2,0,1),(4977,4,2,0,1),(4978,4,2,0,1),(4979,4,2,0,1),(4980,4,2,0,1),(4981,4,2,0,1),(4982,4,2,0,1),(4983,4,2,0,1),(4984,4,2,0,1),(4985,4,2,0,1),(4986,4,2,0,1),(4987,4,2,0,1),(4988,4,2,0,1),(4989,4,2,0,1),(4990,4,2,0,1),(4991,4,2,0,1),(4992,4,2,0,1),(4993,4,2,0,1),(4994,4,2,0,1),(4995,4,2,0,1),(4996,4,2,0,1),(4997,4,2,0,1),(4998,4,2,0,1),(4999,4,2,0,1),(5002,4,2,0,1),(5004,4,2,0,1),(5005,4,2,0,1),(5006,4,2,0,1),(5007,4,2,0,1),(5008,4,2,0,1),(5009,4,2,0,1),(5010,4,2,0,1),(5011,4,2,0,1),(5012,4,2,0,1),(5013,4,2,0,1),(5014,4,2,0,1),(5015,4,2,0,1),(5016,4,2,0,1),(5017,4,2,0,1),(5018,6,2,0,1),(5019,6,2,0,1),(5020,6,2,0,1),(5021,6,2,0,1),(5022,6,2,0,1),(5023,6,2,0,1),(5024,6,2,0,1),(5025,6,2,0,1),(5026,6,2,0,1),(5027,6,2,0,1),(5028,6,2,0,1),(5029,6,2,0,1),(5030,6,2,0,1),(5031,6,2,0,1),(5032,6,2,0,1),(5033,6,2,0,1),(5034,6,2,0,1),(5035,6,2,0,1),(5036,6,2,0,1),(5037,6,2,0,1),(5038,6,2,0,1),(5039,6,2,0,1),(5040,6,2,0,1),(5041,6,2,0,1),(5042,6,2,0,1),(5043,6,2,0,1),(5044,6,2,0,1),(5045,6,2,0,1),(5046,6,2,0,1),(5047,6,2,0,1),(5048,6,2,0,1),(5049,6,2,0,1),(5050,6,2,0,1),(5051,6,2,0,1),(5052,6,2,0,1),(5053,6,2,0,1),(5054,6,2,0,1),(5055,6,2,0,1),(5056,6,2,0,1),(5057,6,2,0,1),(5058,6,2,0,1),(5059,6,2,0,1),(5060,6,2,0,1),(5061,6,2,0,1),(5062,6,2,0,1),(5063,6,2,0,1),(5064,6,2,0,1),(5065,6,2,0,1),(5066,6,2,0,1),(5067,6,2,0,1),(5068,9,2,0,1),(5069,9,2,0,1),(5070,9,2,0,1),(5071,9,2,0,1),(5072,9,2,0,1),(5073,9,2,0,1),(5074,9,2,0,1),(5075,9,2,0,1),(5076,9,2,0,1),(5077,9,2,0,1),(5078,9,2,0,1),(5079,9,2,0,1),(5080,9,2,0,1),(5081,9,2,0,1),(5082,9,2,0,1),(5083,9,2,0,1),(5084,9,2,0,1),(5085,9,2,0,1),(5086,9,2,0,1),(5087,9,2,0,1),(5088,9,2,0,1),(5089,9,2,0,1),(5090,9,2,0,1),(5091,9,2,0,1),(5092,9,2,0,1),(5093,9,2,0,1),(5094,9,2,0,1),(5095,9,2,0,1),(5096,9,2,0,1),(5097,9,2,0,1),(5098,9,2,0,1),(5099,9,2,0,1),(5100,9,2,0,1),(5101,9,2,0,1),(5102,9,2,0,1),(5103,9,2,0,1),(5104,9,2,0,1),(5105,9,2,0,1),(5106,9,2,0,1),(5107,9,2,0,1),(5108,9,2,0,1),(5109,9,2,0,1),(5110,9,2,0,1),(5111,9,2,0,1),(5112,9,2,0,1),(5113,9,2,0,1),(5114,9,2,0,1),(5115,9,2,0,1),(5116,9,2,0,1),(5117,9,2,0,1),(5118,5,1,0,1),(5119,5,1,0,1),(5120,5,1,0,1),(5121,5,1,0,1),(5122,5,1,0,1),(5123,5,1,0,1),(5124,5,1,0,1),(5125,5,1,0,1),(5126,5,1,0,1),(5127,5,1,0,1),(5128,5,1,0,1),(5129,5,1,0,1),(5130,5,1,0,1),(5131,5,1,0,1),(5132,5,1,0,1),(5133,5,1,0,1),(5134,5,1,0,1),(5135,5,1,0,1),(5136,5,1,0,1),(5137,5,1,0,1),(5138,5,1,0,1),(5139,5,1,0,1),(5140,5,1,0,1),(5141,5,1,0,1),(5142,5,1,0,1),(5143,5,1,0,1),(5144,5,1,0,1),(5145,5,1,0,1),(5146,5,1,0,1),(5147,5,1,0,1),(5148,5,1,0,1),(5149,5,1,0,1),(5150,5,1,0,1),(5151,5,1,0,1),(5152,5,1,0,1),(5153,5,1,0,1),(5154,5,1,0,1),(5155,5,1,0,1),(5156,5,1,0,1),(5157,5,1,0,1),(5158,5,1,0,1),(5159,5,1,0,1),(5160,5,1,0,1),(5161,5,1,0,1),(5162,5,1,0,1),(5163,5,1,0,1),(5164,5,1,0,1),(5165,5,1,0,1),(5166,5,1,0,1),(5167,5,1,0,1),(5168,8,1,0,1),(5169,8,1,0,1),(5170,8,1,0,1),(5171,8,1,0,1),(5172,8,1,0,1),(5173,8,1,0,1),(5174,8,1,0,1),(5175,8,1,0,1),(5176,8,1,0,1),(5177,8,1,0,1),(5178,8,1,0,1),(5179,8,1,0,1),(5180,8,1,0,1),(5181,8,1,0,1),(5182,8,1,0,1),(5183,8,1,0,1),(5184,8,1,0,1),(5185,8,1,0,1),(5186,8,1,0,1),(5187,8,1,0,1),(5188,8,1,0,1),(5189,8,1,0,1),(5190,8,1,0,1),(5191,8,1,0,1),(5192,8,1,0,1),(5193,8,1,0,1),(5194,8,1,0,1),(5195,8,1,0,1),(5196,8,1,0,1),(5197,8,1,0,1),(5198,8,1,0,1),(5199,8,1,0,1),(5200,8,1,0,1),(5201,8,1,0,1),(5202,8,1,0,1),(5203,8,1,0,1),(5204,8,1,0,1),(5205,8,1,0,1),(5206,8,1,0,1),(5207,8,1,0,1),(5208,8,1,0,1),(5209,8,1,0,1),(5210,8,1,0,1),(5211,8,1,0,1),(5212,8,1,0,1),(5213,8,1,0,1),(5214,8,1,0,1),(5215,8,1,0,1),(5216,8,1,0,1),(5217,8,1,0,1),(5218,7,1,0,1),(5219,7,1,0,1),(5220,7,1,0,1),(5221,7,1,0,1),(5222,7,1,0,1),(5223,7,1,0,1),(5224,7,1,0,1),(5225,7,1,0,1),(5226,7,1,0,1),(5227,7,1,0,1),(5228,7,1,0,1),(5229,7,1,0,1),(5230,7,1,0,1),(5231,7,1,0,1),(5232,7,1,0,1),(5233,7,1,0,1),(5234,7,1,0,1),(5235,7,1,0,1),(5236,7,1,0,1),(5237,7,1,0,1),(5238,7,1,0,1),(5239,7,1,0,1),(5240,7,1,0,1),(5241,7,1,0,1),(5242,7,1,0,1),(5243,7,1,0,1),(5244,7,1,0,1),(5245,7,1,0,1),(5246,7,1,0,1),(5247,7,1,0,1),(5248,7,1,0,1),(5249,7,1,0,1),(5250,7,1,0,1),(5251,7,1,0,1),(5252,7,1,0,1),(5253,7,1,0,1),(5254,7,1,0,1),(5255,7,1,0,1),(5256,7,1,0,1),(5257,7,1,0,1),(5258,7,1,0,1),(5259,7,1,0,1),(5260,7,1,0,1),(5261,7,1,0,1),(5262,7,1,0,1),(5263,7,1,0,1),(5264,7,1,0,1),(5265,7,1,0,1),(5266,7,1,0,1),(5267,7,1,0,1),(5268,7,1,0,1),(5269,7,1,0,1),(5270,7,1,0,1),(5271,7,1,0,1),(5272,7,1,0,1),(5273,7,1,0,1),(5274,7,1,0,1),(5275,7,1,0,1),(5276,7,1,0,1),(5277,7,1,0,1),(5278,7,1,0,1),(5279,7,1,0,1),(5280,7,1,0,1),(5281,7,1,0,1),(5282,7,1,0,1),(5283,7,1,0,1),(5284,7,1,0,1),(5285,7,1,0,1),(5286,7,1,0,1),(5287,7,1,0,1),(5288,7,1,0,1),(5289,7,1,0,1),(5290,7,1,0,1),(5291,7,1,0,1),(5292,7,1,0,1),(5293,7,1,0,1),(5294,7,1,0,1),(5295,7,1,0,1),(5296,7,1,0,1),(5297,7,1,0,1),(5298,7,1,0,1),(5299,7,1,0,1),(5300,7,1,0,1),(5301,7,1,0,1),(5302,7,1,0,1),(5303,7,1,0,1),(5304,7,1,0,1),(5305,7,1,0,1),(5306,7,1,0,1),(5307,7,1,0,1),(5308,7,1,0,1),(5309,7,1,0,1),(5310,7,1,1,1),(5311,7,1,0,1),(5312,7,1,0,1),(5313,7,1,0,1),(5314,7,1,0,1),(5315,7,1,0,1),(5316,7,1,0,1),(5317,7,1,0,1),(5318,4,2,0,1),(5319,4,2,0,1),(5320,4,2,0,1),(5321,5,1,1,1),(5322,5,1,0,1),(5323,5,1,0,1),(5324,5,1,0,1),(5325,5,1,0,1),(5326,5,1,0,1),(5327,5,1,0,1),(5328,5,1,0,1),(5329,5,1,0,1),(5330,5,1,0,1),(5331,1,2,0,1),(5332,1,2,1,1),(5333,1,2,1,1),(5334,1,2,0,1),(5335,1,2,0,1),(5336,1,2,0,1),(5337,1,2,0,1),(5338,1,2,0,1),(5339,1,2,0,1),(5340,1,2,0,1),(5342,8,1,0,1),(5343,8,1,0,1),(5344,8,1,0,1),(5345,8,1,0,1),(5346,8,1,0,1),(5347,1,1,0,1),(5348,1,1,0,0),(5349,1,1,0,0),(5350,1,1,0,0),(5351,1,1,0,0);
/*!40000 ALTER TABLE `linge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medecinGeneraliste`
--

DROP TABLE IF EXISTS `medecinGeneraliste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medecinGeneraliste` (
  `meg_id` int(11) NOT NULL AUTO_INCREMENT,
  `meg_nom` varchar(250) NOT NULL,
  `meg_tel` varchar(255) NOT NULL,
  `meg_fax` varchar(255) NOT NULL,
  `meg_mail` varchar(250) NOT NULL,
  `meg_adrId` int(11) NOT NULL,
  PRIMARY KEY (`meg_id`),
  KEY `medecinGeneraliste_adresse_FK` (`meg_adrId`),
  CONSTRAINT `medecinGeneraliste_adresse_FK` FOREIGN KEY (`meg_adrId`) REFERENCES `adresse` (`adr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medecinGeneraliste`
--

LOCK TABLES `medecinGeneraliste` WRITE;
/*!40000 ALTER TABLE `medecinGeneraliste` DISABLE KEYS */;
INSERT INTO `medecinGeneraliste` VALUES (1,'LATOUR','556203451','256325698','contact@mail.fr',7),(12,'Marshall','05 18 39 88 63','04 23 03 52 48','mollis@semegestas.org',189),(13,'Abdul','05 52 71 47 22','06 93 73 42 46','Cum@dis.com',190),(14,'James','03 75 42 11 34','09 70 28 82 32','eu@feugiatnecdiam.com',191),(15,'Keith','05 28 97 19 47','09 30 78 86 39','ac.mattis.semper@eu.co.uk',192),(16,'Carlos','03 40 30 87 71','05 65 87 66 10','convallis.ante.lectus@velitinaliquet.co.uk',193),(17,'Wayne','09 94 08 79 80','06 00 18 95 18','elementum.purus.accumsan@velit.ca',194),(18,'Demetrius','04 26 62 32 43','03 74 61 88 04','et@ProinvelitSed.org',195),(19,'Lionel','08 62 78 92 74','02 10 02 62 46','nulla.Cras.eu@dolorelit.ca',196),(20,'Edward','02 88 27 14 50','02 81 48 45 17','vel.quam.dignissim@elementumpurus.net',197),(21,'Brock','03 39 33 95 61','04 10 31 22 38','malesuada.fringilla.est@dui.org',198),(22,'Elmo','06 35 28 66 75','01 20 13 77 02','tincidunt@eratneque.net',199),(23,'Damian','08 25 95 64 01','08 72 68 14 88','ut@egetmassaSuspendisse.edu',200),(24,'Garrison','01 88 78 33 64','05 84 20 27 86','Nulla@blandit.org',201),(25,'Timon','08 48 54 21 88','06 06 71 22 29','orci@felisNullatempor.com',202),(26,'Magee','02 17 10 08 56','08 06 20 52 15','elit.pharetra.ut@dolorelit.ca',203),(27,'Edan','06 14 35 25 13','09 84 62 55 33','eros.non.enim@nequeMorbi.net',204),(28,'Phillip','07 84 47 87 86','08 75 61 79 03','nec.tempus@temporbibendumDonec.net',205),(29,'Dexter','03 02 42 49 81','02 33 49 90 09','nec.urna.suscipit@pellentesque.edu',206),(30,'Oren','02 78 76 29 97','09 44 33 00 68','sed.sapien@sed.net',207),(31,'Stuart','07 99 68 84 16','06 44 66 32 20','ante@CuraeDonectincidunt.edu',208),(32,'Zephania','03 56 75 21 17','08 07 29 62 49','ligula.tortor@justo.net',209),(33,'Reese','01 54 11 64 41','03 16 11 74 85','tristique.aliquet.Phasellus@nunc.ca',210),(34,'Prescott','04 79 35 23 78','04 35 41 43 64','ridiculus.mus@posuere.edu',211),(35,'Jordan','09 83 07 48 26','04 26 13 75 53','tristique.senectus.et@in.org',212),(36,'Lewis','04 75 47 55 16','08 11 78 21 41','euismod.urna.Nullam@Donec.co.uk',213),(37,'Francis','04 37 48 86 48','04 84 79 98 37','est@ami.edu',214),(38,'Tate','02 64 24 41 79','03 97 63 18 42','dui@est.com',215),(39,'Tiger','05 34 19 80 62','01 10 61 58 33','ac@lobortistellusjusto.net',216),(40,'Barclay','06 21 67 98 57','02 82 56 89 84','Mauris@eleifend.net',217),(41,'Hyatt','05 77 84 30 90','09 07 76 46 68','dapibus.rutrum@cursusnonegestas.ca',218),(42,'Kato','02 50 28 60 18','08 51 93 44 74','luctus.et.ultrices@euismodac.net',219),(43,'Norman','08 54 23 88 54','02 42 72 11 24','mauris@Proin.com',220),(44,'Lucas','07 17 52 66 09','01 92 47 26 34','aliquet@egestasnunc.net',221),(45,'Marvin','08 42 25 24 90','04 29 10 57 91','interdum.Curabitur.dictum@dictum.co.uk',222),(46,'Ishmael','04 41 77 78 88','07 23 60 77 79','Proin.nisl@luctuslobortis.ca',223),(47,'Julian','06 80 81 63 11','08 98 43 77 24','ut.nisi.a@Nulla.net',224),(48,'Brock','03 46 71 51 24','06 29 74 56 50','ridiculus.mus.Donec@ut.edu',225),(49,'Ethan','09 85 58 83 69','08 96 16 54 44','ac.mattis@Donecconsectetuer.co.uk',226),(50,'Jonas','03 96 25 00 22','03 25 25 09 17','Morbi@ridiculusmusAenean.edu',227),(51,'Marvin','03 75 94 83 70','02 37 55 05 36','arcu@velnisl.edu',228),(52,'Jackson','03 88 46 22 96','05 97 79 77 55','ornare@Aliquameratvolutpat.net',229),(53,'Zachary','02 55 20 45 74','06 26 59 03 97','Suspendisse.sagittis@Aeneangravida.edu',230),(54,'Addison','03 21 26 33 44','01 39 78 26 62','ipsum.ac.mi@sapienNunc.co.uk',231),(55,'Cairo','07 39 26 09 57','04 94 53 68 82','ultricies.adipiscing@ultricesmaurisipsum.co.uk',232),(56,'Barrett','06 25 18 17 69','08 51 82 35 29','rhoncus.Donec@loremsemper.ca',233),(57,'Kennan','09 85 82 63 60','07 43 59 65 98','fringilla.est@sed.ca',234),(58,'Damian','08 78 44 08 88','04 09 50 72 05','nulla.In.tincidunt@sedduiFusce.ca',235),(59,'Elijah','07 97 64 87 39','08 10 59 80 00','natoque.penatibus.et@nislsemconsequat.net',236),(60,'Carter','08 06 13 42 28','02 92 44 44 36','lacinia.Sed@orci.co.uk',237),(61,'Lester','09 44 61 82 82','07 22 37 13 37','tellus@neceuismod.co.uk',238),(62,'Mark','03 69 57 48 15','07 57 48 96 36','gravida.Praesent.eu@laciniaatiaculis.ca',239),(63,'Carlos','07 36 34 03 51','08 42 79 37 32','Sed@enimnonnisi.co.uk',240),(64,'Zane','05 64 37 84 76','09 36 66 33 92','Duis@ametconsectetueradipiscing.co.uk',241),(65,'Hector','05 16 60 84 26','02 75 42 17 98','tincidunt.tempus@Etiamimperdiet.edu',242),(66,'Tyrone','01 80 85 94 05','02 15 14 05 64','eleifend.nec.malesuada@risus.ca',243),(67,'Deacon','04 04 88 58 43','01 06 53 01 88','dictum.eleifend.nunc@velest.org',244),(68,'Erasmus','04 18 79 44 19','06 22 61 89 19','ac@Donecporttitor.edu',245),(69,'Lawrence','02 95 45 51 84','06 90 35 37 61','non.bibendum@asollicitudinorci.ca',246),(70,'Keane','08 62 08 09 81','01 07 67 05 14','dui.semper@turpisegestas.org',247),(71,'Vernon','05 24 41 68 11','02 22 87 00 40','libero.Donec.consectetuer@tortor.edu',248),(72,'Xander','06 93 08 35 90','02 75 20 31 89','quam.dignissim@nequeMorbiquis.com',249),(73,'Zeph','08 77 73 10 58','02 18 09 69 76','arcu.eu.odio@velit.com',250),(74,'Brock','08 09 34 01 71','01 43 33 40 08','scelerisque@condimentumegetvolutpat.edu',251),(75,'Dustin','02 46 35 63 21','05 00 01 94 55','ac.orci.Ut@ipsumac.co.uk',252),(76,'Moses','01 60 41 14 57','01 88 76 33 28','luctus@laoreet.org',253),(77,'Dennis','09 90 69 94 75','05 33 03 33 53','Ut.semper.pretium@duiCumsociis.com',254),(78,'Ahmed','06 33 93 91 15','03 16 27 81 66','neque@arcuetpede.ca',255),(79,'Tyrone','05 23 73 44 19','05 86 44 29 89','ligula.tortor@augue.net',256),(80,'Kadeem','06 94 96 83 45','05 06 29 67 87','Duis.sit.amet@rutrumFusce.edu',257),(81,'Tyrone','02 43 05 61 36','03 13 60 75 57','ligula.Aenean@velitPellentesqueultricies.edu',258),(82,'Ciaran','08 52 84 87 84','03 02 59 43 98','ut.odio.vel@gravida.net',259),(83,'Levi','09 09 29 13 82','05 42 02 90 11','Donec.tempor.est@eratsemper.ca',260),(84,'Kirk','05 06 81 75 20','06 61 64 48 05','bibendum@Fuscedolorquam.edu',261),(85,'Jacob','01 88 37 23 96','02 97 35 26 21','Donec.dignissim@nibhPhasellus.net',262),(86,'Asher','09 41 47 19 49','06 67 20 45 51','Quisque.varius@odio.ca',263),(87,'Abel','03 25 27 08 88','06 73 94 81 00','dolor@iaculis.org',264),(88,'Graham','03 75 26 58 24','06 27 61 15 45','mauris.aliquam@sitamet.com',265),(89,'Barrett','03 83 85 78 71','04 59 83 24 31','eros@arcu.org',266),(90,'Keaton','07 88 03 51 03','05 18 83 55 68','eu.ultrices.sit@sollicitudina.ca',267),(91,'Ian','07 99 41 52 40','08 06 98 21 89','Praesent.eu.dui@loremsit.org',268),(92,'Cole','03 65 78 54 74','02 29 74 12 20','lacinia@Aeneanmassa.co.uk',269),(93,'Moses','03 93 57 11 33','03 49 86 04 82','sodales.purus.in@adipiscinglacus.ca',270),(94,'Oren','05 44 73 68 13','04 32 11 72 49','ac@ante.ca',271),(95,'Jesse','05 85 79 83 39','01 36 40 07 48','luctus.et@nec.com',272),(96,'Jasper','09 91 89 83 78','07 40 70 48 87','est@et.com',273),(97,'Kennan','09 57 78 79 48','05 79 47 74 14','vitae@magnaLoremipsum.edu',274),(98,'Brian','08 14 79 36 23','05 60 12 06 68','eleifend.vitae@egestasrhoncusProin.com',275),(99,'Owen','05 92 74 93 65','05 01 52 88 57','Proin.eget.odio@ac.org',276),(100,'Armand','07 76 77 68 50','08 90 49 80 96','a.felis@Namconsequatdolor.ca',277),(101,'Graham','07 58 65 95 63','04 96 18 92 88','semper.rutrum@id.net',278),(102,'Cooper','05 02 79 33 45','01 29 38 68 56','dignissim@arcuMorbi.edu',279),(103,'Basil','02 44 31 98 79','09 13 55 50 35','parturient.montes@Vivamusrhoncus.edu',280),(104,'Sean','05 13 31 13 14','09 61 78 00 77','iaculis@ametluctus.edu',281),(105,'Oren','03 00 00 53 99','01 50 70 90 04','parturient@Pellentesqueultriciesdignissim.net',282),(106,'Keith','07 13 52 02 20','06 53 15 76 23','egestas@bibendumfermentum.edu',283),(107,'Channing','05 21 38 23 17','08 10 45 61 78','a@rhoncus.co.uk',284),(108,'Joseph','08 43 06 43 23','09 53 02 74 35','risus@aliquetProinvelit.ca',285),(109,'Daniel','05 58 88 60 48','07 53 04 78 71','rutrum.justo.Praesent@convallisligula.edu',286),(110,'Joel','05 56 89 26 02','01 00 64 59 29','Mauris@orciin.org',287),(111,'Christopher','04 13 88 86 64','06 65 96 06 64','tellus@pellentesquetellussem.com',288);
/*!40000 ALTER TABLE `medecinGeneraliste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutuelle`
--

DROP TABLE IF EXISTS `mutuelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mutuelle` (
  `mut_id` int(11) NOT NULL,
  `mut_libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`mut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutuelle`
--

LOCK TABLES `mutuelle` WRITE;
/*!40000 ALTER TABLE `mutuelle` DISABLE KEYS */;
INSERT INTO `mutuelle` VALUES (1,'AXA'),(2,'Oceane'),(3,'Pro BTP'),(4,'MAAF'),(5,'Groupama'),(6,'Macif'),(7,'MAIF'),(8,'GAN'),(9,'BNP Paribas'),(10,'Caisse épargne'),(11,'Mercier'),(12,'Radiance Humain');
/*!40000 ALTER TABLE `mutuelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `pat_id` int(11) NOT NULL AUTO_INCREMENT,
  `pat_nom` varchar(250) NOT NULL,
  `pat_prenom` varchar(250) NOT NULL,
  `pat_civilite` varchar(250) NOT NULL,
  `pat_ddn` date NOT NULL,
  `pat_poids` float NOT NULL,
  `pat_taille` float NOT NULL,
  `pat_dateEntree` datetime NOT NULL,
  `pat_idallergie` int(11) NOT NULL,
  `pat_idgroupeSanguin` int(11) NOT NULL,
  `pat_profession` varchar(250) NOT NULL,
  `pat_idmedecin` int(11) NOT NULL,
  `pat_infoSup` longtext,
  `pat_photo` varchar(100) DEFAULT NULL,
  `pat_dateSortie` datetime DEFAULT NULL,
  `pat_adrId` int(11) NOT NULL,
  `pat_tel` varchar(25) DEFAULT NULL,
  `pat_idmutuelle` int(11) DEFAULT NULL,
  `pat_numsecusociale` varchar(100) NOT NULL,
  `pat_nummutuelle` varchar(100) DEFAULT NULL,
  `pat_idchambre` int(11) DEFAULT NULL,
  PRIMARY KEY (`pat_id`),
  KEY `patient_groupeSanguin` (`pat_idgroupeSanguin`),
  KEY `patient_medecinGeneraliste` (`pat_idmedecin`),
  KEY `patient_adresse_FK` (`pat_adrId`),
  KEY `patient_allergie_FK` (`pat_idallergie`),
  KEY `patient_mutuelle_FK` (`pat_idmutuelle`),
  KEY `patient_chambre_FK` (`pat_idchambre`),
  CONSTRAINT `patient_adresse_FK` FOREIGN KEY (`pat_adrId`) REFERENCES `adresse` (`adr_id`),
  CONSTRAINT `patient_chambre_FK` FOREIGN KEY (`pat_idchambre`) REFERENCES `chambre` (`cha_id`),
  CONSTRAINT `patient_groupeSanguin` FOREIGN KEY (`pat_idgroupeSanguin`) REFERENCES `groupeSanguin` (`grs_id`),
  CONSTRAINT `patient_medecinGeneraliste` FOREIGN KEY (`pat_idmedecin`) REFERENCES `medecinGeneraliste` (`meg_id`),
  CONSTRAINT `patient_mutuelle_FK` FOREIGN KEY (`pat_idmutuelle`) REFERENCES `mutuelle` (`mut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'DUPONT','Jean','M','1984-11-09',78,1.75,'2016-11-09 23:00:00',4,5,'Informaticien',1,'Ceci est une note supplémentaire !','hugo-leroux.jpg',NULL,1,'0556203256',1,'195042351278954',NULL,11),(2,'MARTIN','Paul','M','1979-05-05',75,1.64,'2016-12-09 23:00:00',4,2,'Dentiste',1,'Présente des troubles de la vision.','martin-paul.png',NULL,2,'0556235698',5,'195044585325657',NULL,11),(3,'LEROUX','Hugo','M','1999-05-24',65,1.79,'2017-05-04 22:00:00',3,3,'Etudiant',1,'','no-avatar.png',NULL,3,'0556245896',8,'195049305322456',NULL,4),(4,'BOUCHER','Jeremy','M','1968-04-30',75,1.75,'2017-05-04 22:00:00',4,1,'Etudiant',1,NULL,'no-avatar.png',NULL,4,'0365985874',2,'253658305322454',NULL,4),(5,'GUEQUIERE','Thomas','M','1969-04-20',75,1.83,'2017-12-02 17:00:00',3,1,'Etudiant',1,NULL,'no-avatar.png',NULL,5,'4525698598',2,'195045265478455',NULL,4),(6,'KALI','Jeanne','Mme','1993-11-20',58,0.68,'2016-02-23 09:29:00',4,5,'Etudiant',1,NULL,'no-avatar.png',NULL,6,'0325684848',11,'123569854799585',NULL,4),(7,'LEROUX','Arthur','M','1990-01-01',65,1.7,'1970-01-01 01:00:00',4,2,'Mécanicien',1,NULL,'no-avatar.png',NULL,8,'0556325698',10,'196589856325878',NULL,4),(8,'Marsh','Hamish','M','2004-10-14',67,1.76,'2015-09-25 01:28:40',9,8,'Faucibus Id Company',20,'nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem','no-avatar.png',NULL,288,'01 21 00 63 28',4,'322711521687193','32719886',4),(9,'Timon','Lynn','Mr','1995-02-26',85,201,'2017-04-03 02:54:04',3,6,'Sed Orci Company',91,'libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus.','no-avatar.png',NULL,289,'02 06 50 66 76',9,'536331643153809','21912237',4),(10,'Kerr','Guy','M','1973-06-17',73,1.96,'2009-04-27 15:33:04',7,7,'Amet Corporation',18,'sit amet ante. Vivamus non lorem vitae odio','no-avatar.png',NULL,290,'07 46 72 75 21',12,'910057398816570','79680119',24),(11,'Shelton','Arthur','M','2001-01-10',61,1.63,'2016-05-11 01:50:32',2,3,'Ultricies Consulting',65,'libero est, congue a, aliquet vel, vulputate','no-avatar.png',NULL,291,'02 15 91 38 45',10,'699649071088060','40579271',4),(12,'Yasir','Livingston','Mr','1985-05-30',97,152,'2012-09-24 10:24:31',4,2,'Congue LLP',88,'Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis','no-avatar.png',NULL,292,'07 74 48 34 43',2,'434688615250504','31298847',15),(13,'Clinton','Wade','M','1978-09-30',73,1.84,'2011-11-22 22:18:04',2,5,'Ac Tellus Consulting',28,'dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit','no-avatar.png',NULL,293,'09 09 65 98 77',1,'967366108732918','40037013',4),(14,'Kenyon','Guthrie','M','1987-02-08',85,1.78,'2015-12-20 08:14:22',11,1,'Lacinia Mattis Integer Corp.',36,'mi pede, nonummy ut, molestie in, tempus eu,','no-avatar.png',NULL,294,'08 14 47 23 61',7,'549621882843267','26400228',4),(15,'Mark','Whitehead','M','1987-05-19',73,170,'2008-06-25 13:53:43',3,5,'Pretium Et Foundation',25,'nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed','no-avatar.png',NULL,295,'05 42 33 30 76',12,'303538226455243','53881047',4),(16,'Thaddeus','Hopkins','Mr','1956-02-15',90,199,'2007-11-04 17:33:15',2,3,'Massa PC',66,'arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy','no-avatar.png',NULL,296,'02 13 78 46 25',12,'230417740639919','83681566',15),(17,'Hoffman','Gage','M','1987-08-28',93,1.52,'2011-09-03 13:11:15',8,4,'Tortor At Corporation',37,'Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus','no-avatar.png',NULL,297,'09 46 29 06 78',4,'206746125749001','38134609',4),(18,'Samson','Santana','M','1987-08-08',88,159,'2009-04-09 17:10:02',6,8,'Vulputate Nisi Sem Foundation',110,'a,','no-avatar.png',NULL,298,'02 97 33 90 92',8,'129711282605098','78480746',4),(19,'THOMAS','Church','M','1969-04-25',78,1.89,'2012-06-19 15:28:33',3,2,'Posuere Cubilia Curae; Ltd',31,'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc','no-avatar.png',NULL,299,'05 84 48 29 37',6,'343836365666033','92396748',4),(20,'Todd','Hardin','Mr','1989-07-02',88,187,'2016-06-06 17:26:02',4,8,'Purus Sapien Associates',28,'Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy','no-avatar.png',NULL,300,'07 55 76 10 71',7,'180312766527963','97252450',4),(21,'Tobias','Kelley','Mr','2000-05-22',58,165,'2009-06-06 10:09:08',8,6,'Mi Fringilla Incorporated',16,'tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat','no-avatar.png',NULL,301,'08 67 11 02 87',12,'313567094965320','51683451',15),(22,'Stone','Ramsey','Mr','1952-11-15',62,162,'2009-12-24 05:33:32',4,6,'Sollicitudin Orci Sem PC',88,'blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris','no-avatar.png',NULL,302,'01 07 09 85 41',9,'279287365544587','46547380',4),(23,'Martinez','Delphine','Mme','1987-05-16',93,1.84,'2011-10-13 17:10:42',7,6,'Duis Cursus Diam Inc.',52,'Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in','no-avatar.png',NULL,303,'02 87 72 27 87',3,'732499102647933','53811785',4),(24,'Perry','White','M','1999-11-07',62,192,'2005-06-27 01:55:06',6,7,'Nulla Cras Corp.',23,'mauris. Integer sem elit, pharetra','no-avatar.png',NULL,304,'01 15 43 49 46',8,'582051378545454','72490565',4),(25,'Kasper','Winters','M','1982-05-03',87,2.04,'2012-08-16 11:17:37',8,5,'Sed Foundation',45,'dolor. Nulla semper tellus id nunc interdum feugiat. Sed','no-avatar.png',NULL,305,'04 51 33 41 09',8,'407998571674235','91621568',15),(26,'Quentin','Wynn','M','1985-06-24',69,157,'2009-12-16 15:19:17',10,3,'Velit Sed Malesuada Institute',83,'Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit.','no-avatar.png',NULL,306,'08 38 05 98 30',11,'723681904168592','14246358',4),(27,'Dale','Didier','M','1982-10-02',105,1.69,'2015-11-04 22:19:34',9,1,'Vulputate Dui Nec Industries',18,'consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat','no-avatar.png',NULL,307,'04 35 28 84 80',5,'595502254154740','42885736',4),(38,'Jack','Wilson','M','2002-08-24',69,1.85,'2013-12-05 14:04:48',9,3,'Sed Turpis Associates',75,'Cum sociis natoque penatibus et magnis dis parturient','no-avatar.png',NULL,318,'08 16 55 05 14',3,'290940529692711','24645221',4),(39,'Mufutau','Tillman','M','2000-07-07',80,188,'2013-03-24 19:45:46',2,1,'Ornare Placerat Orci LLP',77,'erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam','no-avatar.png',NULL,319,'01 72 47 91 90',5,'149081995638294','32073255',15),(40,'Keight','Elijah','M','1999-08-11',77,1.5,'2009-10-27 11:52:36',11,5,'Mauris Corp.',108,'posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam','no-avatar.png',NULL,320,'03 52 48 60 69',2,'703493366199028','63629721',4),(41,'Micah','Kirkland','M','1989-04-28',80,189,'2016-01-08 13:45:37',11,4,'Scelerisque Scelerisque Corporation',97,'nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus.','no-avatar.png',NULL,321,'03 18 22 00 04',12,'49827116438084','39786499',4),(42,'Dalton','Ford','M','1987-06-03',55,1.92,'2011-06-23 00:38:58',5,8,'Metus Urna Convallis Industries',43,'magna. Nam ligula elit, pretium et,','no-avatar.png',NULL,322,'06 25 19 95 58',2,'381608516676351','89384737',4),(43,'Omar','Slater','M','1978-10-08',87,154,'2005-02-21 11:08:49',2,1,'Feugiat Sed Industries',67,'cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac','no-avatar.png',NULL,323,'08 54 11 26 22',10,'323708709179320','59489463',4),(44,'Luke','Wilkinson','M','1956-05-20',89,179,'2016-10-31 21:51:19',6,6,'Fusce Fermentum Foundation',66,'porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam,','no-avatar.png',NULL,324,'07 99 79 53 77',8,'998269469948071','43171332',4),(45,'Raphael','Nieves','M','1996-08-28',75,161,'2011-09-04 12:49:20',10,1,'Lorem Foundation',44,'et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut','no-avatar.png',NULL,325,'03 69 64 58 28',3,'494822081654436','90925451',4),(46,'Baxter','Martin','M','1998-02-19',95,2.02,'2010-12-13 10:53:59',8,7,'Vivamus Rhoncus Ltd',22,'sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum','no-avatar.png',NULL,326,'09 92 91 41 83',3,'623274274744714','44324114',4),(47,'Justin','Aguilar','M','1997-04-27',90,1.77,'2011-08-28 02:25:54',11,7,'Lacinia At Iaculis Consulting',42,'Aenean','no-avatar.png',NULL,327,'09 22 00 40 07',1,'135735878581181','43745419',22),(58,'Driscoll','Sosa','M','1958-01-22',71,1.68,'2015-04-24 07:37:11',8,2,'Pharetra Nam Ac Ltd',106,'sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet','no-avatar.png',NULL,338,'04 82 52 27 00',8,'445788610312673','95411468',20),(59,'Ware','Ezekiel','M','2001-10-14',58,1.78,'2012-09-02 03:27:37',11,6,'Nullam Ut Limited',29,'ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,','no-avatar.png',NULL,339,'02 47 09 98 31',2,'615406087118511','15901342',4),(60,'Ira','Montoya','M','2001-04-25',63,1.84,'2012-09-01 09:51:38',6,3,'Felis Company',23,'vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut','no-avatar.png',NULL,340,'08 02 03 43 01',2,'290245133586641','94437673',4),(61,'Cruz','Nelson','M','1975-11-10',96,2,'2017-03-04 13:55:21',10,2,'Vel Lectus Limited',14,'Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus','no-avatar.png',NULL,341,'05 61 75 64 43',12,'749622520825101','42905685',4),(62,'Chase','Jenny','Mme','1998-10-06',70,1.69,'2015-12-28 19:13:29',11,3,'Non Enim Foundation',75,'pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae','no-avatar.png',NULL,342,'06 46 17 54 85',10,'533091112707431','24191396',4),(63,'Tyrone','Valentine','Mr','1977-03-16',102,171,'2009-09-19 15:55:06',4,8,'Ac Industries',99,'orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant','no-avatar.png',NULL,343,'05 14 75 95 12',2,'720889377185247','94401986',4),(64,'Fuller','Martin','M','1977-07-13',65,1.79,'2011-05-16 00:06:16',10,1,'Mollis Duis Institute',63,'ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim.','no-avatar.png',NULL,344,'04 31 40 37 56',4,'775327723033519','34585769',4),(65,'Linus','Torvald','M','1969-12-27',87,1.84,'2007-09-13 05:28:15',2,2,'Ingénieur informatique chez Linux Foundation',99,'Fuck Tou Nvidia !','linus-torvald.jpg',NULL,345,'01 44 49 39 28',5,'986100355597833','31470007',4),(66,'Hickman','Burton','M','1969-04-16',95,1.53,'2010-08-18 02:43:01',1,6,'Tempus Mauris Inc.',87,'sit amet, consectetuer adipiscing','no-avatar.png',NULL,346,'07 39 11 03 47',11,'949327108315709','13337162',22),(67,'Dolan','Tyson','M','1989-12-23',73,1.59,'2008-10-16 23:43:40',10,3,'Proin LLC',94,'velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit','no-avatar.png',NULL,347,'02 06 56 78 10',5,'662909255642443','67981078',4),(88,'Joseph','Matthews','M','1899-10-31',90,1.52,'2006-02-17 21:50:26',2,7,'In Faucibus Orci PC',1,'luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur','no-avatar.png',NULL,368,'05 06 62 25 48',12,'286812618167863','60623212',4),(89,'Blake','Jerome','M','2001-10-19',101,1.86,'2009-10-25 13:14:42',9,2,'At Pretium Aliquet Institute',106,'Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam.','no-avatar.png',NULL,369,'07 17 73 77 61',6,'502848176352886','89631662',4),(90,'Jermaine','Webster','M','1889-12-20',86,1.65,'2006-05-27 08:22:50',7,4,'Cras Associates',75,'semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi','no-avatar.png',NULL,370,'09 63 03 30 32',1,'154543726047914','60563861',4),(91,'Hopkins','Calvin','M','1989-06-09',102,1.7,'2007-01-06 17:12:10',3,5,'Ipsum PC',14,'pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu','no-avatar.png',NULL,371,'08 54 60 52 57',9,'257299285676951','14113330',4),(92,'Cody','Christian','M','1990-01-01',103,1.95,'2006-11-30 11:45:06',6,2,'Lectus Institute',55,'ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.','no-avatar.png',NULL,372,'08 62 81 67 46',5,'709895445235694','79647361',4),(93,'NEWMAN','Ben','Mr','1968-11-03',63,1.65,'2015-05-14 04:21:34',10,5,'Quis Pede PC',33,'eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non','no-avatar.png',NULL,373,'09 54 34 77 79',2,'567498300860946','11903127',4),(94,'Steel','Cabrera','M','1975-05-25',65,184,'2009-11-19 11:54:05',4,4,'Interdum Associates',85,'elementum, dui quis accumsan convallis, ante','no-avatar.png',NULL,374,'03 40 50 40 08',3,'574736874829977','20523970',4),(95,'Colby','Daniel','M','1960-01-01',68,1.9,'2012-05-10 12:49:03',1,2,'Arcu Institute',40,'pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac','no-avatar.png',NULL,375,'06 44 53 86 84',12,'536461596346149','93658297',15),(96,'Ronan','Oconnor','M','2009-07-16',82,193,'2010-07-19 20:56:04',9,5,'Nam Ac Nulla Corp.',86,'dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu','no-avatar.png',NULL,376,'05 30 02 52 19',9,'596157012719454','51328174',4),(97,'Cervante','Alvin','M','1995-05-02',83,1.8,'2013-05-01 18:36:57',9,4,'Vestibulum Ante Ipsum Consulting',102,'mollis. Phasellus libero mauris, aliquam eu, accumsan','no-avatar.png',NULL,377,'04 27 57 46 93',8,'533673239996035','67541976',4),(98,'LEMAIRE','Jérome','M','1987-10-09',68,1.9,'2016-09-08 10:05:24',10,4,'Sans emploi',65,'Pas de travail pour payer la dernière facture','no-avatar.png',NULL,292,'0556203658',10,'125658965845856','23565874',4),(110,'LEROUX','Hugo','M','1995-04-17',78,178,'2017-04-18 11:33:09',0,1,'Etudiant',1,'hello',NULL,NULL,402,'055625658',1,'123','123',4),(113,'LEBONTOUR','clement','M','2009-06-10',78,158,'2017-04-18 13:45:14',0,7,'Etudiant',1,'Ouep',NULL,NULL,405,'05562033256',1,'123456','12356',24);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientAllergie`
--

DROP TABLE IF EXISTS `patientAllergie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientAllergie` (
  `pat_id` int(11) NOT NULL,
  `all_id` int(11) NOT NULL,
  PRIMARY KEY (`pat_id`,`all_id`),
  KEY `patientAllergie_allergie_FK` (`all_id`),
  CONSTRAINT `patientAllergie_allergie_FK` FOREIGN KEY (`all_id`) REFERENCES `allergie` (`all_id`),
  CONSTRAINT `patientAllergie_patient_FK` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`pat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientAllergie`
--

LOCK TABLES `patientAllergie` WRITE;
/*!40000 ALTER TABLE `patientAllergie` DISABLE KEYS */;
INSERT INTO `patientAllergie` VALUES (1,1),(3,1),(4,1),(8,1),(9,1),(11,1),(12,1),(24,1),(64,1),(2,2),(22,2),(23,2),(25,2),(26,2),(60,2),(62,2),(43,3),(47,3),(97,3),(5,4),(15,4),(19,4),(20,4),(65,4),(90,4),(94,4),(14,5),(17,5),(27,5),(67,5),(91,5),(6,6),(7,6),(10,6),(42,6),(45,6),(46,6),(95,7),(18,8),(58,8),(16,9),(21,9),(89,9),(92,9),(93,9),(96,9),(38,10),(39,10),(40,10),(41,10),(44,10),(88,10),(13,11),(59,11),(61,11),(63,11),(66,11);
/*!40000 ALTER TABLE `patientAllergie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientHistorique`
--

DROP TABLE IF EXISTS `patientHistorique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientHistorique` (
  `his_patient_id` int(11) NOT NULL,
  `his_chambre_id` int(11) NOT NULL,
  `his_date` datetime NOT NULL,
  `his_id` int(11) NOT NULL AUTO_INCREMENT,
  `his_notes` varchar(255) DEFAULT NULL,
  `his_type` int(11) NOT NULL,
  `his_titre` varchar(100) NOT NULL,
  PRIMARY KEY (`his_id`),
  KEY `patientHistorique_typeEvenements_FK` (`his_type`),
  KEY `patientHistorique_patient_FK` (`his_patient_id`),
  KEY `patientHistorique_chambre_FK` (`his_chambre_id`),
  CONSTRAINT `patientHistorique_chambre_FK` FOREIGN KEY (`his_chambre_id`) REFERENCES `chambre` (`cha_id`),
  CONSTRAINT `patientHistorique_patient_FK` FOREIGN KEY (`his_patient_id`) REFERENCES `patient` (`pat_id`),
  CONSTRAINT `patientHistorique_typeEvenements_FK` FOREIGN KEY (`his_type`) REFERENCES `typeEvenements` (`eve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientHistorique`
--

LOCK TABLES `patientHistorique` WRITE;
/*!40000 ALTER TABLE `patientHistorique` DISABLE KEYS */;
INSERT INTO `patientHistorique` VALUES (4,208,'2017-04-19 15:47:00',1,'Le patient quitte la chambre sans emcombre',1,'Départ chambre'),(97,56,'2017-04-25 00:00:00',2,'97 sdgondfgkl',3,'test 97'),(97,56,'2017-04-25 00:00:00',3,'97 sdgondfgkl',1,'test 97'),(97,56,'2017-04-25 00:00:00',4,'97 sdgondfgkl',2,'test 97'),(97,56,'2017-04-25 00:00:00',5,'97 sdgondfgkl',2,'test 97'),(97,56,'2017-04-25 00:00:00',6,'97 sdgondfgkl',3,'test 97'),(97,56,'2017-04-25 00:00:00',7,'97 sdgondfgkl',1,'test 97'),(97,56,'2017-04-25 00:00:00',8,'97 sdgondfgkl',1,'test 97'),(97,56,'2017-04-25 00:00:00',9,'97 sdgondfgkl',1,'test 97'),(95,117,'2017-04-27 00:00:00',10,'je m\'appelle gérard',2,'TEST'),(92,4,'2017-05-15 00:00:00',11,'Encaisser le chèqhe le 3 au lie du 2 juin 2017',1,'Chèque'),(92,4,'2017-05-18 00:00:00',14,'test',1,'test'),(92,4,'2017-05-18 00:00:00',15,'test',1,'test');
/*!40000 ALTER TABLE `patientHistorique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientRegime`
--

DROP TABLE IF EXISTS `patientRegime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientRegime` (
  `pat_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  KEY `patientRegime_patient_FK` (`pat_id`),
  KEY `patientRegime_regime_FK` (`reg_id`),
  CONSTRAINT `patientRegime_patient_FK` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`pat_id`),
  CONSTRAINT `patientRegime_regime_FK` FOREIGN KEY (`reg_id`) REFERENCES `regime` (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientRegime`
--

LOCK TABLES `patientRegime` WRITE;
/*!40000 ALTER TABLE `patientRegime` DISABLE KEYS */;
INSERT INTO `patientRegime` VALUES (1,2),(2,4),(3,5),(4,2),(8,5),(9,1),(10,3),(11,1),(12,2),(13,4),(14,5),(15,4),(16,1),(17,2),(18,5),(19,5),(20,1),(21,2),(22,4),(23,4),(24,2),(25,5),(26,1),(27,3),(38,3),(39,5),(40,1),(41,5),(42,3),(43,2),(44,1),(45,5),(46,1),(47,1),(58,2),(59,2),(60,2),(61,2),(62,4),(63,3),(64,5),(65,5),(66,5),(67,3),(88,4),(89,3),(90,4),(91,3),(92,4),(93,3),(94,2),(95,2),(96,5),(97,5);
/*!40000 ALTER TABLE `patientRegime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personneConfiance`
--

DROP TABLE IF EXISTS `personneConfiance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personneConfiance` (
  `pec_id` int(11) NOT NULL,
  `pec_nom` varchar(250) NOT NULL,
  `pec_prenom` varchar(250) NOT NULL,
  `pec_tel` int(11) NOT NULL,
  PRIMARY KEY (`pec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personneConfiance`
--

LOCK TABLES `personneConfiance` WRITE;
/*!40000 ALTER TABLE `personneConfiance` DISABLE KEYS */;
INSERT INTO `personneConfiance` VALUES (1,'DUPONT','Michelle',556203547),(2,'DUPONT','Gérard',556365898),(3,'POTTER','Harry',655654589),(4,'MARTIN','Jeanne',556203568),(5,'GERARD','Pierre',625356985);
/*!40000 ALTER TABLE `personneConfiance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnelIntervention`
--

DROP TABLE IF EXISTS `personnelIntervention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnelIntervention` (
  `intervention_id` int(11) NOT NULL,
  `personnelMedical_id` int(11) NOT NULL,
  KEY `personnelIntervention_interventionMedicale_FK` (`intervention_id`),
  KEY `personnelIntervention_personnelMedical_FK` (`personnelMedical_id`),
  CONSTRAINT `personnelIntervention_interventionMedicale_FK` FOREIGN KEY (`intervention_id`) REFERENCES `interventionMedicale` (`int_id`),
  CONSTRAINT `personnelIntervention_personnelMedical_FK` FOREIGN KEY (`personnelMedical_id`) REFERENCES `personnelMedical` (`pem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnelIntervention`
--

LOCK TABLES `personnelIntervention` WRITE;
/*!40000 ALTER TABLE `personnelIntervention` DISABLE KEYS */;
INSERT INTO `personnelIntervention` VALUES (44,8),(44,5),(44,4),(44,7),(45,6),(45,25),(45,27),(45,37),(45,40),(45,89),(45,92),(45,102),(45,114),(45,115),(45,117),(45,1),(45,5),(45,24),(45,47),(38,57),(27,73),(39,116),(39,112),(34,49),(41,27),(38,57),(27,73),(39,116),(39,112),(34,49),(41,27),(41,30),(11,84),(39,63),(10,29),(33,65),(16,84),(4,89),(9,105),(39,76),(38,46),(33,43),(15,47),(43,43),(44,54),(41,64),(8,37),(34,109),(15,72),(26,79),(22,76),(15,34),(26,28),(10,41),(39,1),(44,87),(11,39),(41,44),(10,110),(15,90),(11,111),(40,22),(27,54),(37,116),(38,42),(27,47),(10,1),(39,4),(37,112),(27,85),(7,109),(6,52),(27,63),(26,4),(17,113),(44,118),(28,30),(27,59),(27,44),(15,6),(4,91),(41,92),(27,34),(28,113),(33,74),(26,57),(32,20),(4,94),(32,70),(38,33),(32,29),(26,118),(10,52),(39,72),(41,58),(34,66),(22,39),(34,57),(27,8),(11,36),(10,37),(8,40),(15,58),(17,34),(11,37),(28,46),(37,94),(38,6),(44,117),(15,75),(38,118),(44,89),(32,54),(39,101),(34,117),(44,43),(15,44),(7,97),(39,102),(43,45),(15,31),(26,86),(40,2),(43,91),(6,118),(37,70),(17,73),(28,78),(26,52),(40,94),(34,68),(22,76),(37,84),(34,86),(6,63),(9,53),(38,37),(15,96),(39,118),(34,110),(11,56),(27,43),(37,59),(7,58),(15,87),(17,89),(38,68),(40,99),(40,38),(4,8),(32,104),(10,93),(39,36),(16,72),(9,32),(22,99),(44,20),(38,38),(34,105),(40,47),(7,86),(15,25),(32,31),(34,61),(6,82),(39,39),(32,83),(43,97),(37,86),(7,66),(11,76),(17,38),(11,53),(33,97),(28,111),(10,111),(6,60),(6,44),(15,116),(15,95),(44,61),(9,25),(6,90),(22,66),(28,99),(41,81),(33,103),(11,91),(43,105),(27,104),(10,64),(27,38),(32,71),(17,97),(7,70),(39,105),(28,35),(48,8),(48,34),(48,2),(48,3),(48,1),(52,25),(52,108),(52,90),(52,23),(53,37),(53,27),(53,7),(53,28),(53,36),(53,83),(53,69),(53,25),(53,50),(53,37),(53,58),(53,42),(53,54),(53,65),(53,53),(53,43),(53,26),(53,106),(53,72),(53,55),(53,68),(53,93),(53,6),(53,27),(53,4),(53,42),(53,21),(53,8),(53,56),(53,73),(53,68),(53,93),(58,4),(58,34),(58,1),(58,31);
/*!40000 ALTER TABLE `personnelIntervention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnelMedical`
--

DROP TABLE IF EXISTS `personnelMedical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnelMedical` (
  `pem_id` int(11) NOT NULL AUTO_INCREMENT,
  `pem_nom` varchar(25) NOT NULL,
  `pem_prenom` varchar(25) NOT NULL,
  `pem_dateNaissance` date NOT NULL,
  `pem_infoSup` text,
  `pem_service` int(11) NOT NULL,
  `pem_posteId` int(11) NOT NULL,
  `pem_active` tinyint(4) NOT NULL,
  `pem_telephone` varchar(25) NOT NULL,
  `pem_mail` varchar(100) NOT NULL,
  PRIMARY KEY (`pem_id`),
  KEY `personnelMedical_service` (`pem_service`),
  KEY `personnelMedical_poste_FK` (`pem_posteId`),
  CONSTRAINT `personnelMedical_poste_FK` FOREIGN KEY (`pem_posteId`) REFERENCES `poste` (`pos_id`),
  CONSTRAINT `personnelMedical_service` FOREIGN KEY (`pem_service`) REFERENCES `service` (`ser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnelMedical`
--

LOCK TABLES `personnelMedical` WRITE;
/*!40000 ALTER TABLE `personnelMedical` DISABLE KEYS */;
INSERT INTO `personnelMedical` VALUES (1,'LEROUX','Hugo','1986-06-30',NULL,1,1,1,'0556236589','hugo@elotec.de'),(2,'GADE','Julie','1980-02-01',NULL,1,3,0,'0756963256','gjulie@yahoo.com'),(3,'GOULOUGADA','Mamadou','1990-06-10',NULL,1,2,0,'0625478965','goulougoudam@gmail.com'),(4,'DA ROCHA','Rémi','1996-03-01',NULL,2,2,1,'066653638','remi@chu.com'),(5,'LAFFITE','Jean','1967-03-01',NULL,1,1,0,'0600000000','jean@chu.com'),(6,'GUEQUIERE','Thomas','1985-03-01',NULL,2,1,1,'0677863475','thomas@chu.com'),(7,'KROELL','Maxime','1968-03-01',NULL,2,3,1,'0600000000','maxime@chu.com'),(8,'DURAND','Nicole','1970-01-01',NULL,2,4,1,'0666351255','nicoleok@mail.co'),(19,'Rosario','Bethany','2017-05-11',NULL,1,2,1,'04 94 42 64 96','lorem.vehicula@nibhdolor.com'),(20,'Morrow','Ashton','2017-12-10',NULL,2,3,1,'04 69 90 75 50','luctus.ipsum@adipiscing.co.uk'),(21,'Spears','Abra','2017-03-23',NULL,2,2,0,'07 36 72 55 27','sem.ut.cursus@malesuadafringilla.edu'),(22,'Abbott','Tara','2017-06-25',NULL,2,2,0,'06 40 34 23 93','Aenean.eget@dictumPhasellusin.co.uk'),(23,'Moore','Rinah','2016-10-31',NULL,3,4,0,'03 24 43 56 71','non@commodo.ca'),(24,'Romero','Ignacia','2017-08-19',NULL,3,1,1,'09 19 86 21 21','mattis.velit@Nuncuterat.ca'),(25,'Armstrong','Sophia','2017-01-17',NULL,1,1,1,'06 62 29 67 63','ultrices@lacusQuisqueimperdiet.net'),(26,'Mcclain','Dominic','2017-03-11',NULL,1,3,1,'09 70 14 44 32','risus.varius.orci@ametrisusDonec.co.uk'),(27,'Mann','Steel','2017-08-02',NULL,2,1,1,'03 82 42 56 15','vitae.odio.sagittis@montes.co.uk'),(28,'Serrano','Jerry','2017-09-26',NULL,2,3,1,'04 96 30 85 22','nec@utpharetrased.net'),(29,'Dillard','Anjolie','2016-06-16',NULL,3,4,0,'04 47 65 01 38','Sed.id@imperdietnecleo.ca'),(30,'Douglas','Elton','2018-04-07',NULL,2,3,1,'04 01 99 10 51','auctor.Mauris@aliquetvel.org'),(31,'Kinney','Elvis','2017-12-16',NULL,2,3,0,'09 73 55 76 16','non.cursus.non@adui.org'),(32,'Roach','Armando','2017-09-20',NULL,3,2,1,'07 64 93 19 88','Nullam@lectusrutrum.edu'),(33,'Flynn','Macaulay','2018-03-30',NULL,1,2,1,'02 50 72 36 03','Nunc@Phasellus.org'),(34,'Weaver','Sarah','2017-02-05',NULL,1,5,1,'07 25 40 77 73','Sed.eu.eros@nuncullamcorpereu.co.uk'),(35,'Noble','Hadley','2016-05-01',NULL,3,2,0,'04 52 14 74 81','consectetuer@semut.net'),(36,'Hendrix','Tanek','2016-05-20',NULL,2,4,1,'09 00 30 18 77','sit@quama.ca'),(37,'Jordan','Quemby','2017-04-03',NULL,3,1,1,'08 15 15 97 78','Sed.nulla.ante@Loremipsumdolor.edu'),(38,'Goff','Tad','2016-11-14',NULL,1,4,0,'04 24 47 64 10','risus.Quisque.libero@turpisNulla.com'),(39,'Joseph','Cairo','2017-10-15',NULL,1,2,0,'05 29 43 25 83','iaculis@tempusrisus.ca'),(40,'Hinton','Carson','2017-04-26',NULL,1,1,0,'09 30 71 25 87','hendrerit.a@magnisdis.org'),(41,'Richards','Quemby','2018-01-21',NULL,3,3,1,'06 31 62 17 53','erat.Etiam@eratin.ca'),(42,'Lott','Nasim','2016-08-23',NULL,2,2,1,'05 59 48 69 52','magnis.dis.parturient@Pellentesque.ca'),(43,'Callahan','Daryl','2016-10-25',NULL,1,3,0,'09 18 45 82 33','ligula@fringilla.co.uk'),(44,'Jennings','Joy','2016-09-13',NULL,2,5,1,'06 13 08 91 50','in.dolor.Fusce@lacus.net'),(45,'Walker','Evangeline','2017-06-14',NULL,3,5,0,'09 98 04 09 50','consectetuer.ipsum@Mauris.ca'),(46,'Vasquez','Nicole','2016-05-02',NULL,1,3,0,'06 11 24 65 71','et@etarcuimperdiet.com'),(47,'Willis','Nadine','2018-02-27',NULL,2,1,1,'07 52 95 97 68','vitae@posuere.net'),(48,'Kelley','Jamal','2017-08-18',NULL,2,3,1,'02 47 21 26 16','aptent@Fuscedolor.net'),(49,'Lott','Zenaida','2017-08-22',NULL,1,2,0,'03 34 68 27 81','nunc.sed.libero@adipiscingligula.ca'),(50,'Chan','Bryar','2017-10-25',NULL,1,1,1,'04 78 53 50 51','nunc@aliquet.org'),(51,'Wolf','Robin','2017-12-12',NULL,2,5,0,'06 56 42 37 54','a.enim.Suspendisse@scelerisqueneque.edu'),(52,'Bradshaw','Taylor','2016-07-15',NULL,2,3,0,'04 21 82 25 73','nulla.magna.malesuada@ultricesVivamus.co.uk'),(53,'Baker','Sybill','2017-09-04',NULL,2,3,0,'05 52 71 30 26','pellentesque@seddictumeleifend.co.uk'),(54,'Madden','Ashely','2017-03-08',NULL,2,2,1,'09 56 21 69 34','feugiat@orciUt.net'),(55,'Walls','Rama','2016-11-24',NULL,2,4,0,'08 64 84 09 54','ornare.sagittis.felis@eleifend.edu'),(56,'Johnston','Ira','2017-03-05',NULL,1,4,0,'05 93 17 59 07','venenatis.vel@fermentumvelmauris.net'),(57,'Hartman','Maya','2016-12-06',NULL,1,4,0,'01 29 55 02 50','at.iaculis.quis@rutrumjusto.edu'),(58,'Livingston','Shana','2016-10-17',NULL,1,2,1,'03 98 16 00 95','hendrerit@vestibulumMaurismagna.edu'),(59,'Bradshaw','Katell','2017-02-27',NULL,2,1,0,'01 73 17 44 02','orci.sem@uteros.co.uk'),(60,'Malone','Raymond','2017-09-19',NULL,2,5,0,'06 17 47 96 05','magna@Cumsociisnatoque.edu'),(61,'Whitehead','Regina','2016-08-12',NULL,1,2,0,'05 86 10 27 33','eget.volutpat@fermentum.org'),(62,'Mejia','Zeus','2016-09-05',NULL,2,2,1,'07 05 60 73 28','egestas.Sed.pharetra@Mauris.co.uk'),(63,'Lopez','Clayton','2017-03-20',NULL,1,4,0,'06 93 51 12 13','sagittis@sociisnatoque.net'),(64,'Dejesus','Keely','2017-12-19',NULL,3,3,1,'06 59 62 66 37','vel.pede.blandit@Duisacarcu.org'),(65,'Mcfarland','Xenos','2016-06-27',NULL,1,2,0,'07 82 34 46 60','ullamcorper.magna@ipsum.edu'),(66,'Stafford','Emery','2016-07-26',NULL,1,1,1,'06 76 81 07 63','ornare@velit.org'),(67,'Sweet','Basia','2017-12-31',NULL,3,5,0,'02 03 35 67 03','ante.ipsum.primis@tincidunt.ca'),(68,'Dickson','Wade','2017-11-17',NULL,1,5,0,'05 58 74 22 75','Proin@velitjustonec.net'),(69,'Ingram','Martin','2018-02-16',NULL,3,4,0,'09 70 79 52 02','risus.at@amet.ca'),(70,'Hendrix','Rana','2017-03-31',NULL,3,5,0,'06 43 93 87 95','Aenean.gravida@aliquetodio.ca'),(71,'Meyers','Lucius','2018-04-06',NULL,1,2,0,'08 59 48 95 38','risus.Nulla.eget@dignissimpharetraNam.com'),(72,'Mccoy','Louis','2017-10-15',NULL,1,4,0,'08 79 96 59 64','malesuada.Integer.id@Duis.co.uk'),(73,'Kinney','Rafael','2017-04-06',NULL,2,4,0,'04 43 93 05 56','pharetra.nibh@etarcuimperdiet.net'),(74,'Everett','Mohammad','2016-07-02',NULL,3,3,0,'03 07 19 72 84','augue@sit.net'),(75,'Washington','Martena','2017-02-21',NULL,2,2,0,'01 19 18 41 93','nisi.a.odio@DonecfringillaDonec.co.uk'),(76,'Glenn','Barbara','2016-04-19',NULL,2,2,0,'06 35 05 60 81','tempus.non@ridiculus.net'),(77,'Anthony','Oprah','2017-11-14',NULL,3,1,0,'01 64 76 41 85','non.ante@dolorFuscefeugiat.edu'),(78,'Whitaker','Jade','2017-03-30',NULL,3,5,0,'03 67 42 73 83','ac@lectusCum.co.uk'),(79,'Mcconnell','Halla','2017-08-19',NULL,3,2,0,'03 76 45 99 99','massa.Suspendisse@lobortis.org'),(80,'Conner','Hollee','2017-08-24',NULL,2,5,1,'08 31 82 22 79','In.faucibus.Morbi@a.ca'),(81,'Hahn','Craig','2017-11-15',NULL,1,2,0,'06 62 04 37 03','faucibus@semegetmassa.edu'),(82,'Doyle','Jonas','2017-03-09',NULL,3,2,0,'01 86 96 58 73','consequat.dolor.vitae@augueSed.co.uk'),(83,'Humphrey','Tanek','2016-07-19',NULL,2,4,1,'01 95 85 39 14','dolor@neque.org'),(84,'Wilder','Jolene','2017-01-09',NULL,1,1,0,'01 92 39 76 76','eget.magna.Suspendisse@Curabiturmassa.co.uk'),(85,'Garcia','Serena','2017-07-18',NULL,2,4,0,'03 10 21 12 57','ultricies.dignissim@duiSuspendisse.org'),(86,'Kirkland','Ray','2016-10-16',NULL,3,5,1,'04 42 76 70 59','purus@velitegetlaoreet.com'),(87,'Griffith','Devin','2018-01-03',NULL,1,1,0,'02 96 08 99 88','ut.pharetra.sed@asollicitudin.edu'),(88,'Knox','Kylan','2017-10-10',NULL,1,2,1,'04 86 69 84 27','eu@sit.ca'),(89,'Doyle','Deacon','2017-04-04',NULL,3,1,1,'01 24 65 75 29','convallis.dolor.Quisque@Proinegetodio.co.uk'),(90,'Wilkins','Jonas','2016-05-20',NULL,2,2,1,'06 65 84 30 87','Maecenas.mi.felis@tellusSuspendisse.co.uk'),(91,'Baker','Yasir','2018-03-30',NULL,1,3,1,'01 04 29 88 20','egestas.a@Donec.net'),(92,'Bishop','Noel','2016-10-20',NULL,1,1,0,'05 67 99 67 98','pede.et@Fuscemilorem.org'),(93,'Henderson','Yvette','2017-04-10',NULL,3,5,1,'03 91 79 87 75','eros.non.enim@posuere.com'),(94,'Parrish','Ifeoma','2018-02-04',NULL,3,5,0,'03 29 47 39 63','metus.In@vitae.ca'),(95,'Reyes','Jason','2017-10-09',NULL,3,2,0,'05 13 32 05 17','ac.fermentum@accumsan.org'),(96,'Gomez','Iona','2017-07-20',NULL,1,2,0,'08 34 98 78 80','consequat.purus.Maecenas@Integeridmagna.edu'),(97,'Holland','Carol','2017-05-14',NULL,1,2,1,'03 20 10 78 95','lobortis.ultrices@Maurisnon.co.uk'),(98,'Tran','Emmanuel','2016-09-30',NULL,2,3,1,'07 22 05 94 09','iaculis@arcueuodio.edu'),(99,'Hancock','Alisa','2017-03-25',NULL,2,5,1,'07 32 68 70 50','ridiculus@Proinsed.net'),(100,'Roberts','Reagan','2017-12-31',NULL,1,3,1,'04 69 68 93 24','Donec@pedeNunc.edu'),(101,'Austin','Raphael','2016-11-14',NULL,1,2,0,'02 76 31 57 90','nec@odio.net'),(102,'Maxwell','Otto','2016-12-30',NULL,2,1,1,'08 27 57 13 44','tellus.non.magna@egetvarius.org'),(103,'Ochoa','Tashya','2017-02-20',NULL,2,3,0,'07 65 82 14 97','nec@afacilisis.org'),(104,'Berry','Cecilia','2017-04-28',NULL,3,3,1,'03 83 03 01 41','fermentum.vel.mauris@felisDonec.co.uk'),(105,'Singleton','Zorita','2017-01-05',NULL,3,5,1,'02 06 45 80 82','facilisis@nonummyultriciesornare.co.uk'),(106,'Hess','Lana','2016-10-28',NULL,1,4,0,'09 03 17 34 66','Suspendisse.tristique.neque@dictummagnaUt.co.uk'),(107,'Ayala','Nora','2017-11-13',NULL,1,5,1,'02 62 53 60 36','arcu.et.pede@famesacturpis.org'),(108,'Vance','Zenia','2017-03-08',NULL,2,2,0,'05 09 98 13 95','massa.Suspendisse.eleifend@Vivamussitamet.net'),(109,'Walter','Paul','2017-11-06',NULL,2,3,0,'04 07 83 18 20','elit.erat.vitae@velitinaliquet.ca'),(110,'Nichols','Melissa','2016-12-07',NULL,3,4,0,'01 77 98 93 18','Integer@Nulla.ca'),(111,'Weber','Whilemina','2018-03-15',NULL,1,3,1,'02 95 15 13 20','nisi.dictum.augue@lobortisnisinibh.com'),(112,'Cervantes','Katell','2016-08-18',NULL,3,2,0,'05 81 57 01 53','leo.elementum@cursus.com'),(113,'Stone','Melinda','2016-12-30',NULL,2,2,1,'08 29 91 66 02','commodo.tincidunt@habitantmorbi.ca'),(114,'Livingston','Jonah','2017-03-16',NULL,3,1,1,'02 46 88 13 77','ante.bibendum.ullamcorper@sit.com'),(115,'Rich','Kelsie','2017-10-31',NULL,3,1,1,'01 43 82 66 42','Cras.dolor@Duisami.ca'),(116,'Arnold','Moses','2017-06-05',NULL,1,3,0,'08 26 51 04 00','sociis@Crasegetnisi.ca'),(117,'Weaver','Bree','2017-02-25',NULL,3,1,0,'07 72 66 02 37','consequat.lectus.sit@luctus.ca'),(118,'Chen','Karina','2016-11-22',NULL,1,4,1,'08 61 40 30 94','est.vitae@ac.com');
/*!40000 ALTER TABLE `personnelMedical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poste`
--

DROP TABLE IF EXISTS `poste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poste` (
  `pos_libelle` varchar(30) NOT NULL,
  `pos_id` int(11) NOT NULL,
  `pos_specialiteId` int(11) NOT NULL,
  `pos_code` varchar(3) NOT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `poste_specialite` (`pos_specialiteId`),
  CONSTRAINT `poste_specialite` FOREIGN KEY (`pos_specialiteId`) REFERENCES `specialite` (`spe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poste`
--

LOCK TABLES `poste` WRITE;
/*!40000 ALTER TABLE `poste` DISABLE KEYS */;
INSERT INTO `poste` VALUES ('Infirmier',1,0,'INF'),('Chirurgien',2,6,'CHI'),('Assistant opératoire',3,0,'AOP'),('Aide soignant',4,0,'AS'),('Anesthésiste',5,0,'ANE');
/*!40000 ALTER TABLE `poste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recherche`
--

DROP TABLE IF EXISTS `recherche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recherche` (
  `lien` varchar(100) NOT NULL,
  `mot_cles` text NOT NULL,
  `titre` varchar(100) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recherche`
--

LOCK TABLES `recherche` WRITE;
/*!40000 ALTER TABLE `recherche` DISABLE KEYS */;
/*!40000 ALTER TABLE `recherche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regime`
--

DROP TABLE IF EXISTS `regime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regime` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regime`
--

LOCK TABLES `regime` WRITE;
/*!40000 ALTER TABLE `regime` DISABLE KEYS */;
INSERT INTO `regime` VALUES (1,'Régulier'),(2,'Liquide'),(3,'Souple'),(4,'Restreint'),(5,'Thérapeutique');
/*!40000 ALTER TABLE `regime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salleIntervention`
--

DROP TABLE IF EXISTS `salleIntervention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salleIntervention` (
  `sai_id` int(11) NOT NULL AUTO_INCREMENT,
  `sai_libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`sai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salleIntervention`
--

LOCK TABLES `salleIntervention` WRITE;
/*!40000 ALTER TABLE `salleIntervention` DISABLE KEYS */;
INSERT INTO `salleIntervention` VALUES (1,'BLOC 2'),(2,'BLOC 3'),(3,'BLOC PUERICULTURE 1'),(4,'URGENCES 1'),(5,'URGENCES 2'),(6,'BLOC 4'),(7,'BLOC 1'),(8,'BLOC 5');
/*!40000 ALTER TABLE `salleIntervention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `ser_id` int(11) NOT NULL,
  `ser_nom` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`ser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'1 - Services à hauts risques infectueux'),(2,'2 - Services prestataires'),(3,'3 - Services personnels');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialite` (
  `spe_id` int(11) NOT NULL,
  `spe_libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`spe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialite`
--

LOCK TABLES `specialite` WRITE;
/*!40000 ALTER TABLE `specialite` DISABLE KEYS */;
INSERT INTO `specialite` VALUES (0,'none'),(1,'Orthopédique'),(2,'Viscérale'),(3,'Digestive'),(4,'Vasculaire'),(5,'Neurochirurgie'),(6,'Urologie'),(7,'Gynécologie obstétrique'),(8,'Cardiaque'),(9,'Thoracique'),(10,'Pédiatrique'),(11,'Maxillo-faciale'),(12,'Dentaire'),(13,'Glandes endocrines'),(14,'Ophtalmologie'),(15,'Oto-rhino-laryngologie'),(16,'Plastique');
/*!40000 ALTER TABLE `specialite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeChambre`
--

DROP TABLE IF EXISTS `typeChambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeChambre` (
  `tch_libelle` varchar(30) NOT NULL,
  `tch_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeChambre`
--

LOCK TABLES `typeChambre` WRITE;
/*!40000 ALTER TABLE `typeChambre` DISABLE KEYS */;
INSERT INTO `typeChambre` VALUES ('Stérile',1),('Capitoné',2),('Particulière + Sanitaire',3),('Commune + Sanitaire',4);
/*!40000 ALTER TABLE `typeChambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeEvenements`
--

DROP TABLE IF EXISTS `typeEvenements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeEvenements` (
  `eve_id` int(11) NOT NULL AUTO_INCREMENT,
  `eve_libelle` varchar(100) NOT NULL,
  `eve_icon` varchar(255) NOT NULL,
  PRIMARY KEY (`eve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeEvenements`
--

LOCK TABLES `typeEvenements` WRITE;
/*!40000 ALTER TABLE `typeEvenements` DISABLE KEYS */;
INSERT INTO `typeEvenements` VALUES (1,'Comptabilité','<div class=\"timeline-badge success\" title=\"Comptabilité\"><i class=\"glyphicon glyphicon-credit-card\"></i></div>'),(2,'Santé','<div class=\"timeline-badge danger\" title=\"Santé\"><i class=\"glyphicon glyphicon-heart-empty\"></i></div>'),(3,'Autre','<div class=\"timeline-badge warning\" title=\"Autres\"><i class=\"glyphicon glyphicon-flag\"></i></div>');
/*!40000 ALTER TABLE `typeEvenements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeIntervention`
--

DROP TABLE IF EXISTS `typeIntervention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeIntervention` (
  `tin_id` int(11) NOT NULL AUTO_INCREMENT,
  `tin_libelle` varchar(25) NOT NULL,
  PRIMARY KEY (`tin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeIntervention`
--

LOCK TABLES `typeIntervention` WRITE;
/*!40000 ALTER TABLE `typeIntervention` DISABLE KEYS */;
INSERT INTO `typeIntervention` VALUES (1,'Orale'),(2,'Ophtalmologique'),(3,'Neuro'),(4,'Oto rhino laryngologique'),(5,'Gynécologique'),(6,'Thoracique'),(7,'Esthétique'),(8,'Nasale');
/*!40000 ALTER TABLE `typeIntervention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeLinge`
--

DROP TABLE IF EXISTS `typeLinge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeLinge` (
  `tli_id` int(11) NOT NULL AUTO_INCREMENT,
  `tli_libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`tli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeLinge`
--

LOCK TABLES `typeLinge` WRITE;
/*!40000 ALTER TABLE `typeLinge` DISABLE KEYS */;
INSERT INTO `typeLinge` VALUES (1,'Couverture'),(2,'Couvre-lit'),(3,'Taie d\'oreiller'),(4,'Alèse'),(5,'Pyjama'),(6,'Chemise de nuit'),(7,'Blouse'),(8,'Tablier'),(9,'Housse');
/*!40000 ALTER TABLE `typeLinge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `uti_id` int(11) NOT NULL AUTO_INCREMENT,
  `uti_user` varchar(100) NOT NULL,
  `uti_mdp` varchar(255) NOT NULL,
  `uti_personnelId` int(11) NOT NULL,
  `uti_avatar_url` varchar(100) NOT NULL,
  PRIMARY KEY (`uti_id`),
  KEY `utilisateurs_personnelMedical_FK` (`uti_personnelId`),
  CONSTRAINT `utilisateurs_personnelMedical_FK` FOREIGN KEY (`uti_personnelId`) REFERENCES `personnelMedical` (`pem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'admin','8450eca01665516d9aeb5317764902b78495502637c96192c81b1683d32d691a0965cf037feca8b9ed9ee6fc6ab8f27fce8f77c4fd9b4a442a00fc317b8237e6',1,'1003599413pro_portrait-rounded.jpg'),(2,'thomas','80c8129252e28b56f4c0546a08fab1a86b72b41d0c3add2a3384c051eb5234b3b2e9e96fa09343f11324cf759a56f178770c97a78fe24c8224e43067f42f261d',6,'261244513903233_10208769227481706_336425862944528596_n.jpg'),(3,'max','c6d39276f127dd9c160688cdcf54842b71b8097c81f0fc752a5c95bc1274783081f619589387f37534f4fe13736395260037149df3ceced1fffc5d63316ddb94',7,'no-avatar.png'),(4,'jean','762721cca4020adf57d3eb8442021ddeb00b62c98f856cdc3d5a51132ab7e91758e7b81d02a056276294a44a3a1018757b05a6fd4006073a35b2d42a0e806ab9',5,'no-avatar.png'),(5,'remi','aefd2851f59c44378e5a30569d28001a1910320b018621c276af712e930c99bfe0f335d6f42d9c74765575deed5966a25e9eae812e7a963ecab8f6d7b25654e3',4,'258928816ms-logo.png');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-30 12:00:08

