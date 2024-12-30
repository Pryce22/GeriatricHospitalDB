CREATE DATABASE  IF NOT EXISTS `theelderscrollsonline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `theelderscrollsonline`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: theelderscrollsonline
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `afferenza`
--

DROP TABLE IF EXISTS `afferenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afferenza` (
  `medico` varchar(16) NOT NULL,
  `reparto` varchar(50) NOT NULL,
  PRIMARY KEY (`medico`,`reparto`),
  KEY `reparto` (`reparto`),
  CONSTRAINT `afferenza_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medico` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `afferenza_ibfk_2` FOREIGN KEY (`reparto`) REFERENCES `reparto` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afferenza`
--

LOCK TABLES `afferenza` WRITE;
/*!40000 ALTER TABLE `afferenza` DISABLE KEYS */;
INSERT INTO `afferenza` VALUES ('RCCMRA78T30H501Q','Chirurgia Generale'),('VRDRRT82M24H501P','Chirurgia Generale'),('RSSNNR75M18H501N','Medicina Interna'),('GLLLGI85M07H501A','Pediatria'),('BNCAGP80A12H501V','Pronto Soccorso');
/*!40000 ALTER TABLE `afferenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera_ospedaliera`
--

DROP TABLE IF EXISTS `camera_ospedaliera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera_ospedaliera` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `capienza_massima` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera_ospedaliera`
--

LOCK TABLES `camera_ospedaliera` WRITE;
/*!40000 ALTER TABLE `camera_ospedaliera` DISABLE KEYS */;
INSERT INTO `camera_ospedaliera` VALUES (1,3),(2,5),(3,3),(4,5),(5,3),(6,6),(7,5),(8,2),(9,5),(10,3);
/*!40000 ALTER TABLE `camera_ospedaliera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartella_clinica`
--

DROP TABLE IF EXISTS `cartella_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartella_clinica` (
  `paziente` varchar(16) DEFAULT NULL,
  `stato_di_salute` varchar(5) DEFAULT NULL,
  `anamnesi_patologica` varchar(255) DEFAULT NULL,
  `note_sulla_salute` varchar(255) DEFAULT NULL,
  `piaghe_da_decubito` tinyint(1) DEFAULT NULL,
  `data_di_registrazione` date DEFAULT NULL,
  `data_fine_trattamento` date DEFAULT NULL,
  KEY `paziente` (`paziente`),
  CONSTRAINT `cartella_clinica_ibfk_1` FOREIGN KEY (`paziente`) REFERENCES `paziente` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartella_clinica_chk_1` CHECK (((`stato_di_salute` = _utf8mb4'Vivo') or (`stato_di_salute` = _utf8mb4'Morto'))),
  CONSTRAINT `check_date` CHECK ((`data_fine_trattamento` > `data_di_registrazione`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartella_clinica`
--

LOCK TABLES `cartella_clinica` WRITE;
/*!40000 ALTER TABLE `cartella_clinica` DISABLE KEYS */;
INSERT INTO `cartella_clinica` VALUES ('ABC123XYZ4567890','Vivo','Ipertensione, Diabete, Osteoporosi','Buone condizioni generali, in trattamento per ipertensione, diabete e osteoporosi. Gestisce le piaghe da decubito con cure adeguate.',1,'2022-01-01',NULL),('XYZ789ABC1234567','Morto','Insufficienza cardiaca, Ictus','Deceduta a causa di insufficienza cardiaca e ictus. Ultime settimane gestite con cure palliative.',0,'2022-02-01','2023-11-15'),('DEF789GHI1234567','Morto','Malattie polmonari, Insufficienza renale','Deceduto a causa di malattie polmonari e insufficienza renale. Affrontate sfide significative, ricevuto cure fino alla fine.',0,'2022-03-01','2022-07-01'),('GHI789JKL1234567','Vivo','Artrite, Colesterolo elevato','Buona salute, affronta artrite e colesterolo elevato. Gestisce le condizioni con terapie mediche e stile di vita sano.',0,'2022-04-01',NULL),('MNO456PQR7890123','Vivo','Problemi digestivi, Allergie','Problemi digestivi e allergie. Attualmente gestisce bene la salute con dieta e regime alimentare consigliati.',0,'2022-05-01',NULL);
/*!40000 ALTER TABLE `cartella_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenimento`
--

DROP TABLE IF EXISTS `contenimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenimento` (
  `referto` smallint unsigned NOT NULL,
  `cartella_clinica` varchar(16) NOT NULL,
  PRIMARY KEY (`referto`,`cartella_clinica`),
  KEY `cartella_clinica` (`cartella_clinica`),
  CONSTRAINT `contenimento_ibfk_1` FOREIGN KEY (`referto`) REFERENCES `referto` (`visita_medica`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contenimento_ibfk_2` FOREIGN KEY (`cartella_clinica`) REFERENCES `cartella_clinica` (`paziente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenimento`
--

LOCK TABLES `contenimento` WRITE;
/*!40000 ALTER TABLE `contenimento` DISABLE KEYS */;
INSERT INTO `contenimento` VALUES (2,'ABC123XYZ4567890'),(6,'ABC123XYZ4567890'),(11,'DEF789GHI1234567'),(15,'GHI789JKL1234567'),(13,'MNO456PQR7890123'),(4,'XYZ789ABC1234567'),(9,'XYZ789ABC1234567');
/*!40000 ALTER TABLE `contenimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dato_ematochimico`
--

DROP TABLE IF EXISTS `dato_ematochimico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dato_ematochimico` (
  `nome` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`nome`,`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dato_ematochimico`
--

LOCK TABLES `dato_ematochimico` WRITE;
/*!40000 ALTER TABLE `dato_ematochimico` DISABLE KEYS */;
INSERT INTO `dato_ematochimico` VALUES ('Albumina','Proteine'),('ALT','Enzimi'),('AST','Enzimi'),('Azotemia','Sostanze inorganiche'),('Calcio','Sostanze inorganiche'),('Colesterolo totale','Lipidi'),('Creatinina','Proteine'),('Emoglobina','Proteine'),('Ferritina','Proteine'),('Fosforo','Sostanze inorganiche'),('GGT','Enzimi'),('Glicemia','Zuccheri'),('HbA1c','Zuccheri'),('HDL','Lipidi'),('Insulemia basale','Zuccheri'),('LDL','Lipidi'),('Magnesio','Sostanze inorganiche'),('PCR','Proteine'),('Potssio','Sostanze inorganiche'),('Prealbumina','Proteine'),('Proteine totali','Proteine'),('Sideremia','Sostanze inorganiche'),('Sodio','Sostanze inorganiche'),('TRG','Lipidi'),('TSH Reflex','Generici'),('Uricemia','Generici'),('Vitamina D','Generici');
/*!40000 ALTER TABLE `dato_ematochimico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieta`
--

DROP TABLE IF EXISTS `dieta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieta` (
  `referto` smallint unsigned DEFAULT NULL,
  `nome_dieta` varchar(25) DEFAULT NULL,
  `domiciliato` tinyint(1) DEFAULT NULL,
  `via_di_accesso` varchar(25) DEFAULT NULL,
  `importo_calorico` smallint unsigned DEFAULT NULL,
  KEY `referto` (`referto`),
  CONSTRAINT `dieta_ibfk_1` FOREIGN KEY (`referto`) REFERENCES `referto` (`visita_medica`),
  CONSTRAINT `dieta_chk_1` CHECK (((`via_di_accesso` = _utf8mb4'Libera') or (`via_di_accesso` = _utf8mb4'Nutrizione enterale') or (`via_di_accesso` = _utf8mb4'Nutrizione parenterale')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieta`
--

LOCK TABLES `dieta` WRITE;
/*!40000 ALTER TABLE `dieta` DISABLE KEYS */;
INSERT INTO `dieta` VALUES (4,'Dieta Ipocalorica',1,'Nutrizione enterale',1500),(6,'Dieta Proteica',0,'Nutrizione parenterale',1800),(9,'Dieta Vegetariana',1,'Libera',1700),(13,'Dieta Ricca di Fibre',0,'Nutrizione parenterale',1900),(15,'Dieta Mediterranea',1,'Libera',2200);
/*!40000 ALTER TABLE `dieta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direzione`
--

DROP TABLE IF EXISTS `direzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direzione` (
  `medico` varchar(16) NOT NULL,
  `reparto` varchar(50) NOT NULL,
  PRIMARY KEY (`medico`,`reparto`),
  KEY `reparto` (`reparto`),
  CONSTRAINT `direzione_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medico` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `direzione_ibfk_2` FOREIGN KEY (`reparto`) REFERENCES `reparto` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direzione`
--

LOCK TABLES `direzione` WRITE;
/*!40000 ALTER TABLE `direzione` DISABLE KEYS */;
INSERT INTO `direzione` VALUES ('VRDRRT82M24H501P','Chirurgia Generale'),('GLLLGI85M07H501A','Pediatria'),('BNCAGP80A12H501V','Pronto Soccorso');
/*!40000 ALTER TABLE `direzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elencazione`
--

DROP TABLE IF EXISTS `elencazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elencazione` (
  `prescrizione` smallint unsigned NOT NULL,
  `prodotto` decimal(9,0) NOT NULL,
  `dosaggio` float DEFAULT NULL,
  `frequenza` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`prescrizione`,`prodotto`),
  KEY `prodotto` (`prodotto`),
  CONSTRAINT `elencazione_ibfk_1` FOREIGN KEY (`prescrizione`) REFERENCES `prescrizione` (`referto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `elencazione_ibfk_2` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`AIC`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `elencazione_chk_1` CHECK ((`dosaggio` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elencazione`
--

LOCK TABLES `elencazione` WRITE;
/*!40000 ALTER TABLE `elencazione` DISABLE KEYS */;
INSERT INTO `elencazione` VALUES (2,123456789,5,'2 volte al giorno'),(2,234567890,10,'1 volta al giorno'),(4,345678901,7.5,'3 volte a settimana'),(4,426789012,5,'1 volta alla settimana'),(6,456789012,15,'Ogni 12 ore'),(6,567890123,5,'Al bisogno'),(15,678901234,8,'Ogni 12 ore'),(15,789012345,10,'3 volte a settimana'),(15,987654321,5,'2 volte al giorno');
/*!40000 ALTER TABLE `elencazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmacia`
--

DROP TABLE IF EXISTS `farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmacia` (
  `p_iva` decimal(11,0) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `citta` varchar(30) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`p_iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmacia`
--

LOCK TABLES `farmacia` WRITE;
/*!40000 ALTER TABLE `farmacia` DISABLE KEYS */;
INSERT INTO `farmacia` VALUES (12345678901,'Farmacia San Martino','Roma','Via San Martino 1','0123456789','info@farmaciasanmartino.it','123-456789'),(98765432109,'Farmacia della Piazza','Milano','Piazza Duomo 2','9876543210','info@farmaciadellapiazza.it','987-654321');
/*!40000 ALTER TABLE `farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impiego`
--

DROP TABLE IF EXISTS `impiego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impiego` (
  `personale_ospedaliero` varchar(16) NOT NULL,
  `reparto` varchar(50) NOT NULL,
  PRIMARY KEY (`personale_ospedaliero`,`reparto`),
  UNIQUE KEY `personale_ospedaliero` (`personale_ospedaliero`),
  KEY `reparto` (`reparto`),
  CONSTRAINT `impiego_ibfk_1` FOREIGN KEY (`personale_ospedaliero`) REFERENCES `personale_ospedaliero` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `impiego_ibfk_2` FOREIGN KEY (`reparto`) REFERENCES `reparto` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiego`
--

LOCK TABLES `impiego` WRITE;
/*!40000 ALTER TABLE `impiego` DISABLE KEYS */;
INSERT INTO `impiego` VALUES ('BNCLCU85E20H501Y','Medicina Interna'),('GLLCHR80D25H501M','Pediatria'),('RCCGNN95M10H501S','Ginecologia e Ostetricia'),('RSSMRA90M15H501Z','Pronto Soccorso'),('VRDLRA88M03H501L','Chirurgia Generale');
/*!40000 ALTER TABLE `impiego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integratore`
--

DROP TABLE IF EXISTS `integratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integratore` (
  `prodotto` decimal(9,0) DEFAULT NULL,
  `sostanza_integrata` varchar(30) DEFAULT NULL,
  `quantità_di_sostanza_integrata` smallint unsigned DEFAULT NULL,
  KEY `prodotto` (`prodotto`),
  CONSTRAINT `integratore_ibfk_1` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`AIC`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integratore`
--

LOCK TABLES `integratore` WRITE;
/*!40000 ALTER TABLE `integratore` DISABLE KEYS */;
INSERT INTO `integratore` VALUES (456789012,'Vitamina C',500),(567890123,'Vitamina B12',1000),(234567890,'Omega-3',1000);
/*!40000 ALTER TABLE `integratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicinale`
--

DROP TABLE IF EXISTS `medicinale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicinale` (
  `prodotto` decimal(9,0) DEFAULT NULL,
  `tipologia` varchar(30) DEFAULT NULL,
  `principio_attivo` varchar(30) DEFAULT NULL,
  `quantità_di_principio_attivo` smallint unsigned DEFAULT NULL,
  `dose` tinyint unsigned DEFAULT NULL,
  KEY `prodotto` (`prodotto`),
  CONSTRAINT `medicinale_ibfk_1` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`AIC`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicinale`
--

LOCK TABLES `medicinale` WRITE;
/*!40000 ALTER TABLE `medicinale` DISABLE KEYS */;
INSERT INTO `medicinale` VALUES (123456789,'Analgesico','Acido acetilsalicilico',100,12),(987654321,'Antipiretico','Paracetamolo',100,5),(789012345,'Antinfiammatorio','Ibuprofene',100,12),(345678901,'Antibiotico','Azitromicina',100,8),(567890123,'Analgesico','Codeina',100,6),(678901234,'Antinfiammatorio','Diclofenac',100,10),(759012345,'Antidepressivo','Sertralina',100,10);
/*!40000 ALTER TABLE `medicinale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `codice_fiscale` varchar(16) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cognome` varchar(25) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `sesso` varchar(2) DEFAULT NULL,
  `citta` varchar(30) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  CONSTRAINT `medico_chk_1` CHECK (((`sesso` = _utf8mb4'F') or (`sesso` = _utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES ('BNCAGP80A12H501V','Giuseppa','Bianchi','1980-03-12','F','Roma','Via Roma 123','1234567890','giuseppa.bianchi@email.com'),('GLLLGI85M07H501A','Luigi','Gallo','1985-08-07','M','Bologna','Via Bologna 202','7890123456','luigi.gallo@email.com'),('RCCMRA78T30H501Q','Marianna','Ricci','1978-12-30','F','Firenze','Via Firenze 101','0123456789','marianna.ricci@email.com'),('RSSNNR75M18H501N','Annalisa','Rossi','1975-06-18','F','Milano','Via Milano 456','9876543210','annalisa.rossi@email.com'),('VRDRRT82M24H501P','Roberto','Verdi','1982-09-24','M','Napoli','Via Napoli 789','6543210987','roberto.verdi@email.com');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine_farmacia`
--

DROP TABLE IF EXISTS `ordine_farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine_farmacia` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `prezzo_ordine` smallint unsigned DEFAULT NULL,
  `data_transazione` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine_farmacia`
--

LOCK TABLES `ordine_farmacia` WRITE;
/*!40000 ALTER TABLE `ordine_farmacia` DISABLE KEYS */;
INSERT INTO `ordine_farmacia` VALUES (1,'2019-08-15',50,'2019-08-22'),(2,'2020-01-20',80,'2020-01-25'),(3,'2020-05-10',35,'2020-05-15'),(4,'2020-10-05',120,'2020-10-10'),(5,'2021-02-01',25,'2021-02-05');
/*!40000 ALTER TABLE `ordine_farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paziente`
--

DROP TABLE IF EXISTS `paziente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paziente` (
  `codice_fiscale` varchar(16) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cognome` varchar(25) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `sesso` varchar(2) DEFAULT NULL,
  `citta` varchar(30) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  CONSTRAINT `paziente_chk_1` CHECK (((`sesso` = _utf8mb4'F') or (`sesso` = _utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paziente`
--

LOCK TABLES `paziente` WRITE;
/*!40000 ALTER TABLE `paziente` DISABLE KEYS */;
INSERT INTO `paziente` VALUES ('ABC123XYZ4567890','Mario','Rossi','1960-05-15','M','Milano','Via Roma, 123','1234567890','mario.rossi@email.com'),('DEF789GHI1234567','Luca','Ferrari','1958-11-03','M','Torino','Via Milano, 32','8765432109','luca.ferrari@email.com'),('GHI789JKL1234567','Valeria','Moretti','1995-03-22','F','Bologna','Via Verdi, 20','3456789012','valeria.moretti@email.com'),('MNO456PQR7890123','Marco','Russo','1990-08-15','M','Genova','Via Garibaldi, 15','7890123456','marco.russo@email.com'),('XYZ789ABC1234567','Anna','Verdi','1955-12-08','F','Roma','Via Napoli, 45','9876543210','anna.verdi@email.com');
/*!40000 ALTER TABLE `paziente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personale_ospedaliero`
--

DROP TABLE IF EXISTS `personale_ospedaliero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personale_ospedaliero` (
  `codice_fiscale` varchar(16) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cognome` varchar(25) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `sesso` varchar(2) DEFAULT NULL,
  `citta` varchar(30) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ruolo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  CONSTRAINT `check_ruolo` CHECK (((`ruolo` = _utf8mb4'Infermiere') or (`ruolo` = _utf8mb4'Tecnico di laboratorio') or (`ruolo` = _utf8mb4'Nutrizionista') or (`ruolo` = _utf8mb4'Amministratore sanitario'))),
  CONSTRAINT `personale_ospedaliero_chk_1` CHECK (((`sesso` = _utf8mb4'F') or (`sesso` = _utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personale_ospedaliero`
--

LOCK TABLES `personale_ospedaliero` WRITE;
/*!40000 ALTER TABLE `personale_ospedaliero` DISABLE KEYS */;
INSERT INTO `personale_ospedaliero` VALUES ('BNCLCU85E20H501Y','Luca','Bianchi','1985-05-20','M','Milano','Via Milano 456','9876543210','luca.bianchi@email.com','Infermiere'),('GLLCHR80D25H501M','Claudio','Gallo','1980-04-25','M','Bologna','Via Bologna 202','7890123456','claudio.gallo@email.com','Tecnico di laboratorio'),('RCCGNN95M10H501S','Giovanna','Ricci','1995-08-10','F','Firenze','Via Firenze 101','0123456789','giovanna.ricci@email.com','Infermiere'),('RSSMRA90M15H501Z','Mario','Rossi','1990-01-15','M','Roma','Via Roma 236','1234567890','mario.rossi@email.com','Nutrizionista'),('VRDLRA88M03H501L','Laura','Verdi','1988-11-03','F','Napoli','Via Napoli 789','6543210987','laura.verdi@email.com','Amministratore sanitario');
/*!40000 ALTER TABLE `personale_ospedaliero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescrizione`
--

DROP TABLE IF EXISTS `prescrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescrizione` (
  `referto` smallint unsigned DEFAULT NULL,
  `data_fine_validità` date DEFAULT NULL,
  KEY `referto` (`referto`),
  CONSTRAINT `prescrizione_ibfk_1` FOREIGN KEY (`referto`) REFERENCES `referto` (`visita_medica`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescrizione`
--

LOCK TABLES `prescrizione` WRITE;
/*!40000 ALTER TABLE `prescrizione` DISABLE KEYS */;
INSERT INTO `prescrizione` VALUES (2,'2008-02-16'),(4,'2012-04-26'),(6,'2016-06-13'),(15,'2011-03-06');
/*!40000 ALTER TABLE `prescrizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `AIC` decimal(9,0) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `casa_farmaceutica` varchar(50) DEFAULT NULL,
  `periodo_di_conservazione` date DEFAULT NULL,
  `prezzo` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`AIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (123456789,'Aspirina','Bayer','2024-12-31',10),(234567890,'Omega-3','Aboca','2024-11-30',20),(345678901,'Antibiotico Azitromicina','Pfizer','2024-09-30',15),(426789012,'Vitamina B12','Aboca','2023-08-20',10),(456789012,'Vitamina C','Pharmalife Research','2025-05-20',15),(567890123,'Analgesico Codeina','Johnson & Johnson','2025-02-28',20),(678901234,'Antinfiammatorio Diclofenac','Novartis','2024-04-12',18),(759012345,'Antidepressivo Sertralina','Angelini','2023-12-15',30),(789012345,'Ibuprofene','Pfizer','2024-08-01',12),(987654321,'Paracetamolo','Johnson & Johnson','2023-10-15',8);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referto`
--

DROP TABLE IF EXISTS `referto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referto` (
  `visita_medica` smallint unsigned DEFAULT NULL,
  `motivo_della_visita` varchar(20) DEFAULT NULL,
  `dinamometria` tinyint unsigned DEFAULT NULL,
  `chair_test` tinyint unsigned DEFAULT NULL,
  `loco_di_dimissione` varchar(10) DEFAULT NULL,
  `peso` tinyint unsigned DEFAULT NULL,
  `altezza` tinyint unsigned DEFAULT NULL,
  `data` date DEFAULT NULL,
  KEY `visita_medica` (`visita_medica`),
  CONSTRAINT `referto_ibfk_1` FOREIGN KEY (`visita_medica`) REFERENCES `visita_medica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `referto_chk_1` CHECK (((`motivo_della_visita` = _utf8mb4'Prima visita') or (`motivo_della_visita` = _utf8mb4'Visita di controllo'))),
  CONSTRAINT `referto_chk_2` CHECK (((`loco_di_dimissione` = _utf8mb4'Ricovero') or (`loco_di_dimissione` = _utf8mb4'Residenza')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referto`
--

LOCK TABLES `referto` WRITE;
/*!40000 ALTER TABLE `referto` DISABLE KEYS */;
INSERT INTO `referto` VALUES (2,'Prima visita',7,4,'Residenza',117,162,'2007-02-16'),(4,'Prima visita',2,5,'Ricovero',154,171,'2011-04-26'),(6,'Visita di controllo',5,4,'Residenza',166,174,'2015-06-13'),(9,'Visita di controllo',8,9,'Ricovero',74,176,'2021-09-19'),(11,'Prima visita',5,6,'Ricovero',49,163,'2002-11-09'),(13,'Prima visita',9,0,'Ricovero',44,194,'2006-01-08'),(15,'Prima visita',9,8,'Residenza',118,179,'2010-03-06');
/*!40000 ALTER TABLE `referto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrazione`
--

DROP TABLE IF EXISTS `registrazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrazione` (
  `referto` smallint unsigned NOT NULL,
  `nome` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `valore_dato` float DEFAULT NULL,
  PRIMARY KEY (`referto`,`nome`,`categoria`),
  KEY `nome` (`nome`,`categoria`),
  CONSTRAINT `registrazione_ibfk_1` FOREIGN KEY (`referto`) REFERENCES `referto` (`visita_medica`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `registrazione_ibfk_2` FOREIGN KEY (`nome`, `categoria`) REFERENCES `dato_ematochimico` (`nome`, `categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrazione`
--

LOCK TABLES `registrazione` WRITE;
/*!40000 ALTER TABLE `registrazione` DISABLE KEYS */;
INSERT INTO `registrazione` VALUES (2,'Albumina','Proteine',4.2),(2,'ALT','Enzimi',30),(2,'AST','Enzimi',25),(2,'Azotemia','Sostanze inorganiche',60),(2,'Calcio','Sostanze inorganiche',9.2),(2,'Colesterolo totale','Lipidi',200),(2,'Creatinina','Proteine',1),(2,'Emoglobina','Proteine',15),(2,'Ferritina','Proteine',80),(2,'Fosforo','Sostanze inorganiche',3.5),(4,'Albumina','Proteine',4),(4,'ALT','Enzimi',25),(4,'AST','Enzimi',27),(4,'Azotemia','Sostanze inorganiche',55),(4,'Calcio','Sostanze inorganiche',9),(4,'Colesterolo totale','Lipidi',190),(4,'Creatinina','Proteine',1.2),(4,'Emoglobina','Proteine',14),(4,'Ferritina','Proteine',75),(4,'Fosforo','Sostanze inorganiche',3),(6,'Albumina','Proteine',4.5),(6,'ALT','Enzimi',28),(6,'AST','Enzimi',29),(6,'Azotemia','Sostanze inorganiche',58),(6,'Calcio','Sostanze inorganiche',9.5),(6,'Colesterolo totale','Lipidi',180),(6,'Creatinina','Proteine',1.1),(6,'Emoglobina','Proteine',14.5),(6,'Ferritina','Proteine',70),(6,'Fosforo','Sostanze inorganiche',3.2),(9,'Albumina','Proteine',4.8),(9,'ALT','Enzimi',35),(9,'AST','Enzimi',32),(9,'Azotemia','Sostanze inorganiche',62),(9,'Calcio','Sostanze inorganiche',9.8),(9,'Colesterolo totale','Lipidi',210),(9,'Creatinina','Proteine',1.3),(9,'Emoglobina','Proteine',16),(9,'Ferritina','Proteine',85),(9,'Fosforo','Sostanze inorganiche',3.8),(11,'Albumina','Proteine',3.8),(11,'ALT','Enzimi',22),(11,'AST','Enzimi',24),(11,'Azotemia','Sostanze inorganiche',50),(11,'Calcio','Sostanze inorganiche',8.5),(11,'Colesterolo totale','Lipidi',185),(11,'Creatinina','Proteine',1),(11,'Emoglobina','Proteine',14),(11,'Ferritina','Proteine',70),(11,'Fosforo','Sostanze inorganiche',3.2),(13,'Albumina','Proteine',4),(13,'ALT','Enzimi',27),(13,'AST','Enzimi',28),(13,'Azotemia','Sostanze inorganiche',53),(13,'Calcio','Sostanze inorganiche',9.1),(13,'Colesterolo totale','Lipidi',195),(13,'Creatinina','Proteine',1.1),(13,'Emoglobina','Proteine',15),(13,'Ferritina','Proteine',78),(13,'Fosforo','Sostanze inorganiche',3.5),(15,'Albumina','Proteine',4.3),(15,'ALT','Enzimi',28),(15,'AST','Enzimi',30),(15,'Azotemia','Sostanze inorganiche',56),(15,'Calcio','Sostanze inorganiche',9.3),(15,'Colesterolo totale','Lipidi',203),(15,'Creatinina','Proteine',1.2),(15,'Emoglobina','Proteine',14.8),(15,'Ferritina','Proteine',72),(15,'Fosforo','Sostanze inorganiche',3.3);
/*!40000 ALTER TABLE `registrazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparto`
--

DROP TABLE IF EXISTS `reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparto` (
  `nome` varchar(50) NOT NULL,
  `piano` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparto`
--

LOCK TABLES `reparto` WRITE;
/*!40000 ALTER TABLE `reparto` DISABLE KEYS */;
INSERT INTO `reparto` VALUES ('Cardiologia',3),('Chirurgia Generale',1),('Dermatologia',5),('Endocrinologia',6),('Fisioterapia',7),('Gastroenterologia',7),('Ginecologia e Ostetricia',2),('Medicina Interna',1),('Nefrologia',6),('Neurologia',3),('Oftalmologia',4),('Oncologia',2),('Ortopedia',3),('Otorinolaringoiatria (ORL o Otorino)',4),('Pediatria',2),('Pronto Soccorso',1),('Psichiatria',4),('Radiologia',5),('Reumatologia',6),('Terapia Intensiva (TI)',5);
/*!40000 ALTER TABLE `reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ricovero`
--

DROP TABLE IF EXISTS `ricovero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ricovero` (
  `paziente` varchar(16) NOT NULL,
  `camera_ospedaliera` tinyint unsigned NOT NULL,
  PRIMARY KEY (`paziente`,`camera_ospedaliera`),
  KEY `camera_ospedaliera` (`camera_ospedaliera`),
  CONSTRAINT `ricovero_ibfk_1` FOREIGN KEY (`paziente`) REFERENCES `paziente` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ricovero_ibfk_2` FOREIGN KEY (`camera_ospedaliera`) REFERENCES `camera_ospedaliera` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ricovero`
--

LOCK TABLES `ricovero` WRITE;
/*!40000 ALTER TABLE `ricovero` DISABLE KEYS */;
INSERT INTO `ricovero` VALUES ('MNO456PQR7890123',6);
/*!40000 ALTER TABLE `ricovero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riepilogo_acquisto`
--

DROP TABLE IF EXISTS `riepilogo_acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riepilogo_acquisto` (
  `ordine_farmacia` tinyint unsigned NOT NULL,
  `prodotto` decimal(9,0) NOT NULL,
  `quantita` smallint unsigned NOT NULL,
  PRIMARY KEY (`ordine_farmacia`,`prodotto`),
  KEY `prodotto` (`prodotto`),
  CONSTRAINT `riepilogo_acquisto_ibfk_1` FOREIGN KEY (`ordine_farmacia`) REFERENCES `ordine_farmacia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riepilogo_acquisto_ibfk_2` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`AIC`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riepilogo_acquisto`
--

LOCK TABLES `riepilogo_acquisto` WRITE;
/*!40000 ALTER TABLE `riepilogo_acquisto` DISABLE KEYS */;
INSERT INTO `riepilogo_acquisto` VALUES (1,123456789,84),(1,234567890,61),(2,345678901,51),(2,426789012,69),(3,456789012,93),(3,567890123,58),(4,678901234,8),(4,759012345,66),(5,789012345,3),(5,987654321,17);
/*!40000 ALTER TABLE `riepilogo_acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sottoposizione`
--

DROP TABLE IF EXISTS `sottoposizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sottoposizione` (
  `paziente` varchar(16) NOT NULL,
  `visita_medica` smallint unsigned NOT NULL,
  PRIMARY KEY (`paziente`,`visita_medica`),
  KEY `visita_medica` (`visita_medica`),
  CONSTRAINT `sottoposizione_ibfk_1` FOREIGN KEY (`paziente`) REFERENCES `paziente` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sottoposizione_ibfk_2` FOREIGN KEY (`visita_medica`) REFERENCES `visita_medica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sottoposizione`
--

LOCK TABLES `sottoposizione` WRITE;
/*!40000 ALTER TABLE `sottoposizione` DISABLE KEYS */;
INSERT INTO `sottoposizione` VALUES ('ABC123XYZ4567890',1),('GHI789JKL1234567',2),('MNO456PQR7890123',3),('DEF789GHI1234567',4),('XYZ789ABC1234567',5),('GHI789JKL1234567',6),('ABC123XYZ4567890',7),('DEF789GHI1234567',8),('MNO456PQR7890123',9),('ABC123XYZ4567890',10),('XYZ789ABC1234567',11),('DEF789GHI1234567',12),('GHI789JKL1234567',13),('MNO456PQR7890123',14),('XYZ789ABC1234567',15);
/*!40000 ALTER TABLE `sottoposizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stipulazione_acquisto`
--

DROP TABLE IF EXISTS `stipulazione_acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stipulazione_acquisto` (
  `ordine_farmacia` tinyint unsigned NOT NULL,
  `farmacia` decimal(11,0) NOT NULL,
  PRIMARY KEY (`ordine_farmacia`,`farmacia`),
  KEY `farmacia` (`farmacia`),
  CONSTRAINT `stipulazione_acquisto_ibfk_1` FOREIGN KEY (`ordine_farmacia`) REFERENCES `ordine_farmacia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stipulazione_acquisto_ibfk_2` FOREIGN KEY (`farmacia`) REFERENCES `farmacia` (`p_iva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stipulazione_acquisto`
--

LOCK TABLES `stipulazione_acquisto` WRITE;
/*!40000 ALTER TABLE `stipulazione_acquisto` DISABLE KEYS */;
INSERT INTO `stipulazione_acquisto` VALUES (1,12345678901),(3,12345678901),(5,12345678901),(2,98765432109),(4,98765432109);
/*!40000 ALTER TABLE `stipulazione_acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suddivisione`
--

DROP TABLE IF EXISTS `suddivisione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suddivisione` (
  `camera_ospedaliera` tinyint unsigned NOT NULL,
  `reparto` varchar(50) NOT NULL,
  PRIMARY KEY (`camera_ospedaliera`,`reparto`),
  KEY `reparto` (`reparto`),
  CONSTRAINT `suddivisione_ibfk_1` FOREIGN KEY (`camera_ospedaliera`) REFERENCES `camera_ospedaliera` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suddivisione_ibfk_2` FOREIGN KEY (`reparto`) REFERENCES `reparto` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suddivisione`
--

LOCK TABLES `suddivisione` WRITE;
/*!40000 ALTER TABLE `suddivisione` DISABLE KEYS */;
INSERT INTO `suddivisione` VALUES (8,'Cardiologia'),(3,'Chirurgia Generale'),(4,'Ginecologia e Ostetricia'),(2,'Medicina Interna'),(7,'Neurologia'),(6,'Oncologia'),(9,'Ortopedia'),(5,'Pediatria'),(1,'Pronto Soccorso'),(10,'Psichiatria');
/*!40000 ALTER TABLE `suddivisione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `svolgimento`
--

DROP TABLE IF EXISTS `svolgimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `svolgimento` (
  `medico` varchar(16) NOT NULL,
  `visita_medica` smallint unsigned NOT NULL,
  PRIMARY KEY (`medico`,`visita_medica`),
  KEY `visita_medica` (`visita_medica`),
  CONSTRAINT `svolgimento_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medico` (`codice_fiscale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `svolgimento_ibfk_2` FOREIGN KEY (`visita_medica`) REFERENCES `visita_medica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svolgimento`
--

LOCK TABLES `svolgimento` WRITE;
/*!40000 ALTER TABLE `svolgimento` DISABLE KEYS */;
INSERT INTO `svolgimento` VALUES ('RSSNNR75M18H501N',1),('RCCMRA78T30H501Q',2),('BNCAGP80A12H501V',3),('RSSNNR75M18H501N',4),('BNCAGP80A12H501V',5),('GLLLGI85M07H501A',6),('VRDRRT82M24H501P',7),('RSSNNR75M18H501N',8),('RCCMRA78T30H501Q',9),('BNCAGP80A12H501V',10),('GLLLGI85M07H501A',11),('VRDRRT82M24H501P',12),('VRDRRT82M24H501P',13),('RCCMRA78T30H501Q',14),('GLLLGI85M07H501A',15);
/*!40000 ALTER TABLE `svolgimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita_medica`
--

DROP TABLE IF EXISTS `visita_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita_medica` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `data_transazione` date DEFAULT NULL,
  `stato` varchar(10) DEFAULT NULL,
  `prezzo` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `visita_medica_chk_1` CHECK (((`stato` = _utf8mb4'Prenotata') or (`stato` = _utf8mb4'Cancellata') or (`stato` = _utf8mb4'Effettuata')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita_medica`
--

LOCK TABLES `visita_medica` WRITE;
/*!40000 ALTER TABLE `visita_medica` DISABLE KEYS */;
INSERT INTO `visita_medica` VALUES (1,'2005-01-02',NULL,'Cancellata',55.2),(2,'2020-02-05','2020-02-06','Effettuata',40.5),(3,'2024-03-07',NULL,'Prenotata',59.8),(4,'2011-04-25','2011-04-26','Effettuata',41.4),(5,'2013-05-30',NULL,'Cancellata',50.1),(6,'2015-06-12','2015-06-13','Effettuata',48.7),(7,'2017-07-20','2017-07-21','Cancellata',52.3),(8,'2024-08-15',NULL,'Prenotata',45.9),(9,'2021-09-18','2021-09-19','Effettuata',42),(10,'2023-10-22',NULL,'Cancellata',57.6),(11,'2002-11-08','2002-11-09','Effettuata',46.3),(12,'2024-02-20',NULL,'Prenotata',59),(13,'2006-01-07','2006-01-08','Effettuata',53.5),(14,'2024-04-09',NULL,'Prenotata',44.2),(15,'2010-03-05','2010-03-06','Effettuata',58.7);
/*!40000 ALTER TABLE `visita_medica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-21 23:24:41
