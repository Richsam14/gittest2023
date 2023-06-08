DROP DATABASE IF EXISTS richard_samuel_garage_info1b;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS richard_samuel_garage_info1b;

-- Utilisation de cette base de donnée

USE richard_samuel_garage_info1b;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for richard_samuel_garage_info1b
CREATE DATABASE IF NOT EXISTS `richard_samuel_garage_info1b` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `richard_samuel_garage_info1b`;

-- Dumping structure for table richard_samuel_garage_info1b.t_client
CREATE TABLE IF NOT EXISTS `t_client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prenom_client` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rue_client` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `npa_client` int DEFAULT NULL,
  `ville_client` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_client: ~7 rows (approximately)
INSERT INTO `t_client` (`id_client`, `nom_client`, `prenom_client`, `rue_client`, `npa_client`, `ville_client`) VALUES
	(3, 'Muller', 'Heidi', 'Chemin Frinzalla 10', 3030, 'Bern'),
	(4, 'Lyd', 'Twit', NULL, NULL, NULL),
	(6, 'richard', 'SAm', NULL, NULL, NULL),
	(8, 'mas', 'lucien', NULL, NULL, NULL),
	(9, 'patrick', 'lejens', NULL, NULL, NULL),
	(10, 'mone', 'nana', NULL, NULL, NULL);

-- Dumping structure for table richard_samuel_garage_info1b.t_client_acheter_piece
CREATE TABLE IF NOT EXISTS `t_client_acheter_piece` (
  `id_client_acheter_piece` int NOT NULL AUTO_INCREMENT,
  `fk_piece` int DEFAULT NULL,
  `fk_client` int DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `nbre_piece_achat` int DEFAULT NULL,
  PRIMARY KEY (`id_client_acheter_piece`),
  KEY `FK_client_acheter_piece_t_piece` (`fk_piece`),
  KEY `FK_client_acheter_piece_t_client` (`fk_client`),
  CONSTRAINT `FK_client_acheter_piece_t_client` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_client_acheter_piece_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_client_acheter_piece: ~2 rows (approximately)
INSERT INTO `t_client_acheter_piece` (`id_client_acheter_piece`, `fk_piece`, `fk_client`, `date_achat`, `nbre_piece_achat`) VALUES
	(1, 2, 9, '2023-05-22', 4),
	(2, 3, 8, '2023-05-18', 10),
	(3, 1, 6, '2023-03-25', 12);

-- Dumping structure for table richard_samuel_garage_info1b.t_client_avoir_mail
CREATE TABLE IF NOT EXISTS `t_client_avoir_mail` (
  `id_client_avoir_mail` int NOT NULL AUTO_INCREMENT,
  `fk_client` int DEFAULT NULL,
  `fk_mail` int DEFAULT NULL,
  PRIMARY KEY (`id_client_avoir_mail`),
  KEY `FK_client_avoir_mail_t_mail` (`fk_mail`),
  KEY `FK_client_avoir_mail_t_client` (`fk_client`),
  CONSTRAINT `FK_client_avoir_mail_t_client` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_client_avoir_mail_t_mail` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_client_avoir_mail: ~2 rows (approximately)
INSERT INTO `t_client_avoir_mail` (`id_client_avoir_mail`, `fk_client`, `fk_mail`) VALUES
	(1, 6, 2),
	(2, 8, 3),
	(3, 9, 4);

-- Dumping structure for table richard_samuel_garage_info1b.t_client_avoir_tel
CREATE TABLE IF NOT EXISTS `t_client_avoir_tel` (
  `id_client_avoir_tel` int NOT NULL AUTO_INCREMENT,
  `fk_client` int DEFAULT NULL,
  `fk_telephone` int DEFAULT NULL,
  PRIMARY KEY (`id_client_avoir_tel`),
  KEY `FK_client_avoir_tel_t_tel` (`fk_telephone`),
  KEY `FK_client_avoir_tel_t_client` (`fk_client`),
  CONSTRAINT `FK_client_avoir_tel_t_client` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_client_avoir_tel_t_tel` FOREIGN KEY (`fk_telephone`) REFERENCES `t_telephone` (`id_tel`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_client_avoir_tel: ~3 rows (approximately)
INSERT INTO `t_client_avoir_tel` (`id_client_avoir_tel`, `fk_client`, `fk_telephone`) VALUES
	(1, 9, 1),
	(2, 6, 4),
	(3, 8, 6);

-- Dumping structure for table richard_samuel_garage_info1b.t_entrepot
CREATE TABLE IF NOT EXISTS `t_entrepot` (
  `id_entrepot` int NOT NULL AUTO_INCREMENT,
  `emplacement_ent` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_entrepot`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_entrepot: ~3 rows (approximately)
INSERT INTO `t_entrepot` (`id_entrepot`, `emplacement_ent`) VALUES
	(1, 'Payerne'),
	(2, 'Schaffhouse'),
	(3, 'Bâle');

-- Dumping structure for table richard_samuel_garage_info1b.t_entrepot_reprendre_piece
CREATE TABLE IF NOT EXISTS `t_entrepot_reprendre_piece` (
  `id_entrepot_reprendre_piece` int NOT NULL AUTO_INCREMENT,
  `fk_entrepot` int DEFAULT NULL,
  `fk_piece` int DEFAULT NULL,
  `date_reprise` date DEFAULT NULL,
  PRIMARY KEY (`id_entrepot_reprendre_piece`),
  KEY `FK_entrepot_reprendre_piece_t_piece` (`fk_piece`),
  KEY `FK_entrepot_reprendre_piece_t_entrepot` (`fk_entrepot`),
  CONSTRAINT `FK_entrepot_reprendre_piece_t_entrepot` FOREIGN KEY (`fk_entrepot`) REFERENCES `t_entrepot` (`id_entrepot`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_entrepot_reprendre_piece_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_entrepot_reprendre_piece: ~3 rows (approximately)
INSERT INTO `t_entrepot_reprendre_piece` (`id_entrepot_reprendre_piece`, `fk_entrepot`, `fk_piece`, `date_reprise`) VALUES
	(1, 3, 1, '2023-05-24'),
	(2, 1, 2, '2022-05-29'),
	(3, 1, 3, '2023-06-02');

-- Dumping structure for table richard_samuel_garage_info1b.t_fournisseur
CREATE TABLE IF NOT EXISTS `t_fournisseur` (
  `id_fournisseur` int NOT NULL AUTO_INCREMENT,
  `nom_fournisseur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_fournisseur: ~3 rows (approximately)
INSERT INTO `t_fournisseur` (`id_fournisseur`, `nom_fournisseur`) VALUES
	(1, 'Brembo'),
	(2, 'NGK'),
	(3, 'Bosch');

-- Dumping structure for table richard_samuel_garage_info1b.t_fournisseur_avoir_mail
CREATE TABLE IF NOT EXISTS `t_fournisseur_avoir_mail` (
  `id_fournisseur_avoir_mail` int NOT NULL AUTO_INCREMENT,
  `fk_fournisseur` int DEFAULT NULL,
  `fk_mail` int DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur_avoir_mail`),
  KEY `FK_fournisseur_avoir_mail_t_mail` (`fk_mail`),
  KEY `FK_fournisseur_avoir_mail_t_fournisseur` (`fk_fournisseur`),
  CONSTRAINT `FK_fournisseur_avoir_mail_t_fournisseur` FOREIGN KEY (`fk_fournisseur`) REFERENCES `t_fournisseur` (`id_fournisseur`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_fournisseur_avoir_mail_t_mail` FOREIGN KEY (`fk_mail`) REFERENCES `t_mail` (`id_mail`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_fournisseur_avoir_mail: ~3 rows (approximately)
INSERT INTO `t_fournisseur_avoir_mail` (`id_fournisseur_avoir_mail`, `fk_fournisseur`, `fk_mail`) VALUES
	(1, 3, 2),
	(2, 1, 1),
	(3, 2, 3);

-- Dumping structure for table richard_samuel_garage_info1b.t_fournisseur_avoir_tel
CREATE TABLE IF NOT EXISTS `t_fournisseur_avoir_tel` (
  `id_fournisseur_avoir_tel` int NOT NULL AUTO_INCREMENT,
  `fk_fournisseur` int DEFAULT NULL,
  `fk_telephone` int DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur_avoir_tel`),
  KEY `FK_fournisseur_avoir_tel_t_tel` (`fk_telephone`),
  KEY `FK_fournisseur_avoir_tel_t_fournisseur` (`fk_fournisseur`),
  CONSTRAINT `FK_fournisseur_avoir_tel_t_fournisseur` FOREIGN KEY (`fk_fournisseur`) REFERENCES `t_fournisseur` (`id_fournisseur`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_fournisseur_avoir_tel_t_tel` FOREIGN KEY (`fk_telephone`) REFERENCES `t_telephone` (`id_tel`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_fournisseur_avoir_tel: ~3 rows (approximately)
INSERT INTO `t_fournisseur_avoir_tel` (`id_fournisseur_avoir_tel`, `fk_fournisseur`, `fk_telephone`) VALUES
	(1, 3, 5),
	(2, 2, 2),
	(3, 1, 6);

-- Dumping structure for table richard_samuel_garage_info1b.t_fournisseur_envoyer_piece
CREATE TABLE IF NOT EXISTS `t_fournisseur_envoyer_piece` (
  `id_fournisseur_envoyer_piece` int NOT NULL AUTO_INCREMENT,
  `fk_fournisseur` int DEFAULT NULL,
  `fk_piece` int DEFAULT NULL,
  `date_envoi` date DEFAULT NULL,
  `nbre_piece_envoi` int DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur_envoyer_piece`),
  KEY `FK_fournisseur_envoyer_piece_t_piece` (`fk_piece`),
  KEY `FK_fournisseur_envoyer_piece_t_fournisseur` (`fk_fournisseur`),
  CONSTRAINT `FK_fournisseur_envoyer_piece_t_fournisseur` FOREIGN KEY (`fk_fournisseur`) REFERENCES `t_fournisseur` (`id_fournisseur`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_fournisseur_envoyer_piece_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_fournisseur_envoyer_piece: ~3 rows (approximately)
INSERT INTO `t_fournisseur_envoyer_piece` (`id_fournisseur_envoyer_piece`, `fk_fournisseur`, `fk_piece`, `date_envoi`, `nbre_piece_envoi`) VALUES
	(1, 3, 3, '2023-05-20', 10),
	(2, 1, 1, '2023-05-25', 12),
	(3, 2, 2, '2023-05-23', 4);

-- Dumping structure for table richard_samuel_garage_info1b.t_mail
CREATE TABLE IF NOT EXISTS `t_mail` (
  `id_mail` int NOT NULL AUTO_INCREMENT,
  `adresse_mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_mail: ~6 rows (approximately)
INSERT INTO `t_mail` (`id_mail`, `adresse_mail`) VALUES
	(1, 'brembo-brakes@support.com'),
	(2, 'bosch@kontakt.ch'),
	(3, 'ngk-support@noreply.com'),
	(4, 'patrick.swayze@gmail.com'),
	(5, 'jean-luc.melanchon@hotmail.com'),
	(6, 'muller.heidi@bluewin.ch');

-- Dumping structure for table richard_samuel_garage_info1b.t_piece
CREATE TABLE IF NOT EXISTS `t_piece` (
  `id_piece` int NOT NULL AUTO_INCREMENT,
  `num_serie_pi` bigint DEFAULT NULL,
  `couleur_piece` varchar(50) DEFAULT NULL,
  `date_creation_pi` date DEFAULT NULL,
  `vehicule_dest_pi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_piece`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_piece: ~3 rows (approximately)
INSERT INTO `t_piece` (`id_piece`, `num_serie_pi`, `couleur_piece`, `date_creation_pi`, `vehicule_dest_pi`) VALUES
	(1, 118829965897, 'noir', '2020-10-12', 'Peugot 508'),
	(2, 365414527904, 'rouge', '2009-06-08', 'Ferrari F40'),
	(3, 146009969759, 'blanc', '1990-03-19', 'Golf gti vr6');

-- Dumping structure for table richard_samuel_garage_info1b.t_piece_deposer_entrepot
CREATE TABLE IF NOT EXISTS `t_piece_deposer_entrepot` (
  `id_piece_deposer_entrepot` int NOT NULL AUTO_INCREMENT,
  `fk_piece` int DEFAULT NULL,
  `fk_entrepot` int DEFAULT NULL,
  `date_depot` date DEFAULT NULL,
  PRIMARY KEY (`id_piece_deposer_entrepot`),
  KEY `FK_piece_deposer_entrepot_t_entrepot` (`fk_entrepot`),
  KEY `FK_piece_deposer_entrepot_t_piece` (`fk_piece`),
  CONSTRAINT `FK_piece_deposer_entrepot_t_entrepot` FOREIGN KEY (`fk_entrepot`) REFERENCES `t_entrepot` (`id_entrepot`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_piece_deposer_entrepot_t_piece` FOREIGN KEY (`fk_piece`) REFERENCES `t_piece` (`id_piece`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_piece_deposer_entrepot: ~3 rows (approximately)
INSERT INTO `t_piece_deposer_entrepot` (`id_piece_deposer_entrepot`, `fk_piece`, `fk_entrepot`, `date_depot`) VALUES
	(1, 3, 1, '2023-05-22'),
	(2, 1, 3, '2023-07-17'),
	(3, 2, 1, '2015-05-29');

-- Dumping structure for table richard_samuel_garage_info1b.t_telephone
CREATE TABLE IF NOT EXISTS `t_telephone` (
  `id_tel` int NOT NULL AUTO_INCREMENT,
  `numero_tel` longtext,
  PRIMARY KEY (`id_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table richard_samuel_garage_info1b.t_telephone: ~6 rows (approximately)
INSERT INTO `t_telephone` (`id_tel`, `numero_tel`) VALUES
	(1, '+41 77 137 79 87'),
	(2, '+41 78 021 21 48'),
	(3, '+33 7 00 25 40 58'),
	(4, '+49 163 9788490'),
	(5, '+41 76 882 82 66'),
	(6, '+41 79 547 34 30');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
