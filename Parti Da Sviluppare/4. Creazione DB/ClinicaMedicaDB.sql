-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ClinicaMedicaDB
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.23.10.1

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
-- Table structure for table `APPUNTAMENTO`
--

DROP TABLE IF EXISTS `APPUNTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `APPUNTAMENTO` (
  `CODICE` int NOT NULL AUTO_INCREMENT,
  `MOTIVO` varchar(128) DEFAULT NULL,
  `ORA` char(5) DEFAULT NULL,
  `DATA` char(10) DEFAULT NULL,
  `CF_PAZIENTE` char(16) DEFAULT NULL,
  `COD_SERVIZIO` int DEFAULT NULL,
  `REG_MEDICO` char(16) DEFAULT NULL,
  PRIMARY KEY (`CODICE`),
  KEY `APPUNTAMENTO_FK_PAZIENTE` (`CF_PAZIENTE`),
  KEY `APPUNTAMENTO_FK_SERVIZIO` (`COD_SERVIZIO`),
  KEY `APPUNTAMENTO_FK_MEDICO_idx` (`REG_MEDICO`),
  CONSTRAINT `APPUNTAMENTO_FK_MEDICO` FOREIGN KEY (`REG_MEDICO`) REFERENCES `MEDICO` (`REG_MEDICA`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `APPUNTAMENTO_FK_PAZIENTE` FOREIGN KEY (`CF_PAZIENTE`) REFERENCES `PAZIENTE` (`CF`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `APPUNTAMENTO_FK_SERVIZIO` FOREIGN KEY (`COD_SERVIZIO`) REFERENCES `SERVIZIO` (`CODICE`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPUNTAMENTO`
--

LOCK TABLES `APPUNTAMENTO` WRITE;
/*!40000 ALTER TABLE `APPUNTAMENTO` DISABLE KEYS */;
INSERT INTO `APPUNTAMENTO` VALUES (1,'Controllo annuale','09:00','16/05/2024','XXXXXXXXXXXXXX01',1,'XXXXXXXXXXXXXXX1'),(2,'Trattamento viso','15:30','2024-05-22','XXXXXXXXXXXXXX03',2,'XXXXXXXXXXXXXXX2');
/*!40000 ALTER TABLE `APPUNTAMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FATTURA`
--

DROP TABLE IF EXISTS `FATTURA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FATTURA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MODALITA` varchar(64) DEFAULT NULL,
  `STATO` varchar(128) DEFAULT NULL,
  `DATA_PAGAMENTO` char(10) DEFAULT NULL,
  `COD_SERVIZIO` int DEFAULT NULL,
  `CF_CLIENTE` char(16) DEFAULT NULL,
  `TRATT_PROPOSTO` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FATTURA_FK_SERVIZIO` (`COD_SERVIZIO`),
  KEY `FATTURA_FK_CF` (`CF_CLIENTE`),
  KEY `FATTURA_FK_TRATTAMENTO` (`TRATT_PROPOSTO`),
  CONSTRAINT `FATTURA_FK_CF` FOREIGN KEY (`CF_CLIENTE`) REFERENCES `PAZIENTE` (`CF`) ON UPDATE CASCADE,
  CONSTRAINT `FATTURA_FK_SERVIZIO` FOREIGN KEY (`COD_SERVIZIO`) REFERENCES `SERVIZIO` (`CODICE`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FATTURA_FK_TRATTAMENTO` FOREIGN KEY (`TRATT_PROPOSTO`) REFERENCES `TRATTAMENTO` (`CODICE`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FATTURA`
--

LOCK TABLES `FATTURA` WRITE;
/*!40000 ALTER TABLE `FATTURA` DISABLE KEYS */;
INSERT INTO `FATTURA` VALUES (1,'Contanti','Non pagata','16/05/2024',1,'XXXXXXXXXXXXXX01',4),(2,'Carta di credito','Pagata','16/05/2024',2,'XXXXXXXXXXXXXX02',5);
/*!40000 ALTER TABLE `FATTURA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEDICO`
--

DROP TABLE IF EXISTS `MEDICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDICO` (
  `REG_MEDICA` char(16) NOT NULL,
  `NOME` varchar(16) DEFAULT NULL,
  `COGNOME` varchar(16) DEFAULT NULL,
  `SPECIALIZZAZIONE` varchar(128) DEFAULT NULL,
  `TELEFONO` char(13) DEFAULT NULL,
  `SESSO` char(1) DEFAULT NULL,
  PRIMARY KEY (`REG_MEDICA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEDICO`
--

LOCK TABLES `MEDICO` WRITE;
/*!40000 ALTER TABLE `MEDICO` DISABLE KEYS */;
INSERT INTO `MEDICO` VALUES ('XXXXXXXXXXXXXXX1','Marco','Rossi','Cardiologia','+39XXXXXXXXX1','M'),('XXXXXXXXXXXXXXX2','Giulia','Bianchi','Dermatologia','+39XXXXXXXXX2','F'),('XXXXXXXXXXXXXXX3','Tommaso','Verdi','Prevenzione','+39XXXXXXXXX3','M');
/*!40000 ALTER TABLE `MEDICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAZIENTE`
--

DROP TABLE IF EXISTS `PAZIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAZIENTE` (
  `CF` char(16) NOT NULL,
  `NOME` varchar(16) DEFAULT NULL,
  `COGNOME` varchar(16) DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `TELEFONO` char(13) DEFAULT NULL,
  `SESSO` char(1) DEFAULT NULL,
  `INFORMAZIONI` text,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAZIENTE`
--

LOCK TABLES `PAZIENTE` WRITE;
/*!40000 ALTER TABLE `PAZIENTE` DISABLE KEYS */;
INSERT INTO `PAZIENTE` VALUES ('XXXXXXXXXXXXXX01','Copernico','Carpeggiani','Copernico.Carpeggiani@example.com','+39XXXXXXXX01','M','Allergia polline'),('XXXXXXXXXXXXXX02','Marica','Binchini','Marica.Binchini@example.com','+39XXXXXXXX02','F','Allergia alle noccioline'),('XXXXXXXXXXXXXX03','Antonio','Esposito','Antonio.Esposito@example.com','+39XXXXXXXX03','M','Intollerante al lattosio');
/*!40000 ALTER TABLE `PAZIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVIZIO`
--

DROP TABLE IF EXISTS `SERVIZIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVIZIO` (
  `CODICE` int NOT NULL AUTO_INCREMENT,
  `NOME_SERVIZIO` varchar(128) DEFAULT NULL,
  `DURATA` int DEFAULT NULL,
  `COSTO` int DEFAULT NULL,
  PRIMARY KEY (`CODICE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVIZIO`
--

LOCK TABLES `SERVIZIO` WRITE;
/*!40000 ALTER TABLE `SERVIZIO` DISABLE KEYS */;
INSERT INTO `SERVIZIO` VALUES (1,'Visita cardiologica',30,50),(2,'Pulizia del viso',60,70),(3,'Vaccinazione pediatrica',20,30);
/*!40000 ALTER TABLE `SERVIZIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRATTAMENTO`
--

DROP TABLE IF EXISTS `TRATTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRATTAMENTO` (
  `CODICE` int NOT NULL AUTO_INCREMENT,
  `NOME_TRATTAMENTO` varchar(128) DEFAULT NULL,
  `DURATA` int DEFAULT NULL,
  `AVVERTENZE` text,
  `OBBIETTIVI` text,
  PRIMARY KEY (`CODICE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRATTAMENTO`
--

LOCK TABLES `TRATTAMENTO` WRITE;
/*!40000 ALTER TABLE `TRATTAMENTO` DISABLE KEYS */;
INSERT INTO `TRATTAMENTO` VALUES (4,'tachipirina',15,'non esagerare','prendere per 15 giorni la tachipirina. bere acqua.'),(5,'acqua',2,'no avvertenze','bere molta acqua.');
/*!40000 ALTER TABLE `TRATTAMENTO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 15:40:54