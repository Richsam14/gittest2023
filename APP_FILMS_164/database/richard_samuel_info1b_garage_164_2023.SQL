-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: richard_samuel_garage_info1b

-- Détection si une autre base de donnée du même nom existe

DROP DATABASE IF EXISTS richard_samuel_garage_info1b;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS richard_samuel_garage_info1b;

-- Utilisation de cette base de donnée

USE richard_samuel_garage_info1b;
-- --------------------------------------------------------
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: richard_samuel_garage_info1b
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `t_client`
--

DROP TABLE IF EXISTS `t_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom_client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rue_client` varchar(50) DEFAULT NULL,
  `npa_client` int DEFAULT NULL,
  `ville_client` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_client`
--

LOCK TABLES `t_client` WRITE;
/*!40000 ALTER TABLE `t_client` DISABLE KEYS */;
INSERT INTO `t_client` VALUES (1,'Melanchon','Jean-Luc','Chemin des rumines 25',2800,'Delémont'),(2,'Swayze','Patrick','Rte St-Eloi 33',1470,'Estavayer-le-Lac'),(3,'Muller','Heidi','Chemin Frinzalla 10',3030,'Bern');
/*!40000 ALTER TABLE `t_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_client_acheter_piece`
--

DROP TABLE IF EXISTS `t_client_acheter_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_client_acheter_piece` (
  `id_client_acheter_piece` int NOT NULL AUTO_INCREMENT,
  `fk_piece` int DEFAULT NULL,
  `fk_client` int DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `nbre_piece_achat` int DEFAULT NULL,
  PRIMARY KEY (`id_client_acheter_piece`),
  KEY `FK_client_acheter_piece_t_piece` (`fk_piece`),
  KEY `FK_client_acheter_piece_t_client` (`fk_client`),
  CONSTRAINT `FK_client_acheter_piece_t_client` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_client_acheter_piece_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_client_acheter_piece`
--

LOCK TABLES `t_client_acheter_piece` WRITE;
/*!40000 ALTER TABLE `t_client_acheter_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_client_acheter_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_client_avoir_mail`
--

DROP TABLE IF EXISTS `t_client_avoir_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_client_avoir_mail` (
  `id_client_avoir_mail` int NOT NULL AUTO_INCREMENT,
  `fk_client` int DEFAULT NULL,
  `fk_mail` int DEFAULT NULL,
  PRIMARY KEY (`id_client_avoir_mail`),
  KEY `FK_client_avoir_mail_t_mail` (`fk_mail`),
  KEY `FK_client_avoir_mail_t_client` (`fk_client`),
  CONSTRAINT `FK_client_avoir_mail_t_client` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_client_avoir_mail_t_mail` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_client_avoir_mail`
--

LOCK TABLES `t_client_avoir_mail` WRITE;
/*!40000 ALTER TABLE `t_client_avoir_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_client_avoir_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_client_avoir_tel`
--

DROP TABLE IF EXISTS `t_client_avoir_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_client_avoir_tel` (
  `id_client_avoir_tel` int NOT NULL AUTO_INCREMENT,
  `fk_client` int DEFAULT NULL,
  `fk_telephone` int DEFAULT NULL,
  PRIMARY KEY (`id_client_avoir_tel`),
  KEY `FK_client_avoir_tel_t_tel` (`fk_telephone`),
  KEY `FK_client_avoir_tel_t_client` (`fk_client`),
  CONSTRAINT `FK_client_avoir_tel_t_client` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_client_avoir_tel_t_tel` FOREIGN KEY (`fk_telephone`) REFERENCES `t_telephone` (`id_tel`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_client_avoir_tel`
--

LOCK TABLES `t_client_avoir_tel` WRITE;
/*!40000 ALTER TABLE `t_client_avoir_tel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_client_avoir_tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_entrepot`
--

DROP TABLE IF EXISTS `t_entrepot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_entrepot` (
  `id_entrepot` int NOT NULL AUTO_INCREMENT,
  `emplacement_ent` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_entrepot`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_entrepot`
--

LOCK TABLES `t_entrepot` WRITE;
/*!40000 ALTER TABLE `t_entrepot` DISABLE KEYS */;
INSERT INTO `t_entrepot` VALUES (1,'Payerne'),(2,'Schaffhouse'),(3,'Bâle');
/*!40000 ALTER TABLE `t_entrepot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_entrepot_reprendre_piece`
--

DROP TABLE IF EXISTS `t_entrepot_reprendre_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_entrepot_reprendre_piece` (
  `id_entrepot_reprendre_piece` int NOT NULL AUTO_INCREMENT,
  `fk_entrepot` int DEFAULT NULL,
  `fk_piece` int DEFAULT NULL,
  `date_reprise` date DEFAULT NULL,
  PRIMARY KEY (`id_entrepot_reprendre_piece`),
  KEY `FK_entrepot_reprendre_piece_t_piece` (`fk_piece`),
  KEY `FK_entrepot_reprendre_piece_t_entrepot` (`fk_entrepot`),
  CONSTRAINT `FK_entrepot_reprendre_piece_t_entrepot` FOREIGN KEY (`fk_entrepot`) REFERENCES `t_entrepot` (`id_entrepot`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_entrepot_reprendre_piece_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_entrepot_reprendre_piece`
--

LOCK TABLES `t_entrepot_reprendre_piece` WRITE;
/*!40000 ALTER TABLE `t_entrepot_reprendre_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_entrepot_reprendre_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_fournisseur`
--

DROP TABLE IF EXISTS `t_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_fournisseur` (
  `id_fournisseur` int NOT NULL AUTO_INCREMENT,
  `nom_fournisseur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_fournisseur`
--

LOCK TABLES `t_fournisseur` WRITE;
/*!40000 ALTER TABLE `t_fournisseur` DISABLE KEYS */;
INSERT INTO `t_fournisseur` VALUES (1,'Brembo'),(2,'NGK'),(3,'Bosch');
/*!40000 ALTER TABLE `t_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_fournisseur_avoir_mail`
--

DROP TABLE IF EXISTS `t_fournisseur_avoir_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_fournisseur_avoir_mail` (
  `id_fournisseur_avoir_mail` int NOT NULL AUTO_INCREMENT,
  `fk_fournisseur` int DEFAULT NULL,
  `fk_mail` int DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur_avoir_mail`),
  KEY `FK_fournisseur_avoir_mail_t_mail` (`fk_mail`),
  KEY `FK_fournisseur_avoir_mail_t_fournisseur` (`fk_fournisseur`),
  CONSTRAINT `FK_fournisseur_avoir_mail_t_fournisseur` FOREIGN KEY (`fk_fournisseur`) REFERENCES `t_fournisseur` (`id_fournisseur`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_fournisseur_avoir_mail_t_mail` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_fournisseur_avoir_mail`
--

LOCK TABLES `t_fournisseur_avoir_mail` WRITE;
/*!40000 ALTER TABLE `t_fournisseur_avoir_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_fournisseur_avoir_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_fournisseur_avoir_tel`
--

DROP TABLE IF EXISTS `t_fournisseur_avoir_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_fournisseur_avoir_tel` (
  `id_fournisseur_avoir_tel` int NOT NULL AUTO_INCREMENT,
  `fk_fournisseur` int DEFAULT NULL,
  `fk_telephone` int DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur_avoir_tel`),
  KEY `FK_fournisseur_avoir_tel_t_tel` (`fk_telephone`),
  KEY `FK_fournisseur_avoir_tel_t_fournisseur` (`fk_fournisseur`),
  CONSTRAINT `FK_fournisseur_avoir_tel_t_fournisseur` FOREIGN KEY (`fk_fournisseur`) REFERENCES `t_fournisseur` (`id_fournisseur`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_fournisseur_avoir_tel_t_tel` FOREIGN KEY (`fk_telephone`) REFERENCES `t_telephone` (`id_tel`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_fournisseur_avoir_tel`
--

LOCK TABLES `t_fournisseur_avoir_tel` WRITE;
/*!40000 ALTER TABLE `t_fournisseur_avoir_tel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_fournisseur_avoir_tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_fournisseur_envoyer_piece`
--

DROP TABLE IF EXISTS `t_fournisseur_envoyer_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_fournisseur_envoyer_piece` (
  `id_fournisseur_envoyer_piece` int NOT NULL AUTO_INCREMENT,
  `fk_fournisseur` int DEFAULT NULL,
  `fk_piece` int DEFAULT NULL,
  `date_envoi` date DEFAULT NULL,
  `nbre_piece_envoi` int DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur_envoyer_piece`),
  KEY `FK_fournisseur_envoyer_piece_t_piece` (`fk_piece`),
  KEY `FK_fournisseur_envoyer_piece_t_fournisseur` (`fk_fournisseur`),
  CONSTRAINT `FK_fournisseur_envoyer_piece_t_fournisseur` FOREIGN KEY (`fk_fournisseur`) REFERENCES `t_fournisseur` (`id_fournisseur`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_fournisseur_envoyer_piece_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_fournisseur_envoyer_piece`
--

LOCK TABLES `t_fournisseur_envoyer_piece` WRITE;
/*!40000 ALTER TABLE `t_fournisseur_envoyer_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_fournisseur_envoyer_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mail`
--

DROP TABLE IF EXISTS `t_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mail` (
  `id_mail` int NOT NULL AUTO_INCREMENT,
  `adresse_mail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mail`
--

LOCK TABLES `t_mail` WRITE;
/*!40000 ALTER TABLE `t_mail` DISABLE KEYS */;
INSERT INTO `t_mail` VALUES (1,'brembo-brakes@support.com'),(2,'bosch@kontakt.ch'),(3,'ngk-support@noreply.com'),(4,'patrick.swayze@gmail.com'),(5,'jean-luc.melanchon@hotmail.com'),(6,'muller.heidi@bluewin.ch');
/*!40000 ALTER TABLE `t_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_piece`
--

DROP TABLE IF EXISTS `t_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_piece` (
  `id_piece` int NOT NULL AUTO_INCREMENT,
  `num_serie_pi` bigint DEFAULT NULL,
  `couleur_piece` varchar(50) DEFAULT NULL,
  `date_creation_pi` date DEFAULT NULL,
  `vehicule_dest_pi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_piece`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_piece`
--

LOCK TABLES `t_piece` WRITE;
/*!40000 ALTER TABLE `t_piece` DISABLE KEYS */;
INSERT INTO `t_piece` VALUES (1,118829965897,'noir','2020-10-12','Peugot 508'),(2,365414527904,'rouge','2009-06-08','Ferrari F40'),(3,146009969759,'blanc','1990-03-19','Golf gti vr6');
/*!40000 ALTER TABLE `t_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_piece_deposer_entrepot`
--

DROP TABLE IF EXISTS `t_piece_deposer_entrepot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_piece_deposer_entrepot` (
  `id_piece_deposer_entrepot` int NOT NULL AUTO_INCREMENT,
  `fk_piece` int DEFAULT NULL,
  `fk_entrepot` int DEFAULT NULL,
  `date_depot` date DEFAULT NULL,
  PRIMARY KEY (`id_piece_deposer_entrepot`),
  KEY `FK_piece_deposer_entrepot_t_entrepot` (`fk_entrepot`),
  KEY `FK_piece_deposer_entrepot_t_piece` (`fk_piece`),
  CONSTRAINT `FK_piece_deposer_entrepot_t_entrepot` FOREIGN KEY (`fk_entrepot`) REFERENCES `t_entrepot` (`id_entrepot`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_piece_deposer_entrepot_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_piece_deposer_entrepot`
--

LOCK TABLES `t_piece_deposer_entrepot` WRITE;
/*!40000 ALTER TABLE `t_piece_deposer_entrepot` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_piece_deposer_entrepot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_telephone`
--

DROP TABLE IF EXISTS `t_telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_telephone` (
  `id_tel` int NOT NULL AUTO_INCREMENT,
  `numero_tel` longtext,
  PRIMARY KEY (`id_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_telephone`
--

LOCK TABLES `t_telephone` WRITE;
/*!40000 ALTER TABLE `t_telephone` DISABLE KEYS */;
INSERT INTO `t_telephone` VALUES (1,'+41 77 137 79 87'),(2,'+41 78 021 21 48'),(3,'+33 7 00 25 40 58'),(4,'+49 163 9788490'),(5,'+41 76 882 82 66'),(6,'+41 79 547 34 30');
/*!40000 ALTER TABLE `t_telephone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-14 19:47:38
