-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `id_consultas` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `id_medico` int NOT NULL,
  `data_consulta` datetime DEFAULT NULL,
  `status_consulta` varchar(30) DEFAULT NULL,
  `valor_consulta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_consultas`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES (1,1,1,'2026-01-10 09:00:00','Realizada',350.00),(2,1,4,'2026-02-05 14:00:00','Realizada',500.00),(3,2,3,'2026-03-01 10:30:00','Realizada',400.00),(4,3,2,'2026-03-15 11:00:00','Realizada',280.00),(5,4,6,'2026-04-10 15:00:00','Realizada',550.00),(6,5,5,'2026-05-02 08:30:00','Realizada',320.00),(7,6,1,'2026-05-20 16:00:00','Realizada',350.00),(8,7,10,'2026-06-01 13:00:00','Realizada',600.00),(9,8,8,'2026-06-15 10:00:00','Realizada',300.00),(10,1,4,'2026-07-01 14:00:00','Realizada',500.00);
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacoes`
--

DROP TABLE IF EXISTS `internacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internacoes` (
  `id_internacao` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `id_quarto` int NOT NULL,
  `data_entrada` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `valor_diaria` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_internacao`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_quarto` (`id_quarto`),
  CONSTRAINT `internacoes_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `internacoes_ibfk_2` FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quarto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacoes`
--

LOCK TABLES `internacoes` WRITE;
/*!40000 ALTER TABLE `internacoes` DISABLE KEYS */;
INSERT INTO `internacoes` VALUES (1,1,1,'2026-02-10','2026-02-20',450.00),(2,2,3,'2026-03-01','2026-03-10',300.00),(3,3,5,'2026-04-15','2026-04-25',500.00),(4,7,6,'2026-05-01','2026-05-08',250.00),(5,5,8,'2026-06-10','2026-06-18',350.00),(6,6,10,'2026-07-01','2026-07-10',280.00),(7,2,1,'2026-08-05','2026-08-12',450.00),(8,4,2,'2026-01-15','2026-01-22',200.00),(9,8,4,'2026-02-20','2026-02-28',320.00),(10,9,7,'2026-03-12','2026-03-19',600.00);
/*!40000 ALTER TABLE `internacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `nome_medico` varchar(255) NOT NULL,
  `crm` varchar(12) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `crm` (`crm`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'Dr. Marcos Andrade','CRM/SP 12345','Cardiologia'),(2,'Dra. Patricia Lima','CRM/SP 23456','Pediatria'),(3,'Dr. Roberto Silva','CRM/SP 34567','Cardiologia Pediatrica'),(4,'Dra. Camila Rocha','CRM/SP 45678','Cirurgia Geral'),(5,'Dr. Gustavo Santos','CRM/SP 56789','Ortopedia'),(6,'Dra. Vanessa Martins','CRM/SP 67890','Cirurgia Vascular'),(7,'Dr. Felipe Barbosa','CRM/SP 78901','Neurologia'),(8,'Dra. Renata Mello','CRM/SP 89012','Ginecologia'),(9,'Dr. Eduardo Ramos','CRM/SP 90123','Dermatologia'),(10,'Dra. Claudia Castro','CRM/SP 01234','Cirurgia Plastica');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nome_paciente` varchar(255) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `convenio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Ana Silva','111.222.333-01','1985-03-15','(11) 98765-4321','Unimed'),(2,'Carlos Oliveira','222.333.444-02','1990-07-22','(11) 97654-3210','Bradesco Saúde'),(3,'Maria Santos','333.444.555-03','1978-11-05','(11) 96543-2109','Unimed'),(4,'João Pedro Silva','444.555.666-04','2000-01-30','(11) 95432-1098','Particular'),(5,'Fernanda Costa','555.666.777-05','1995-09-12','(11) 94321-0987','Amil'),(6,'Roberto Almeida','666.777.888-06','1962-04-18','(11) 93210-9876','SulAmérica'),(7,'Juliana Oliveira','777.888.999-07','1988-12-08','(11) 92109-8765','Unimed Pleno'),(8,'Lucas Souza','888.999.000-08','2003-05-25','(11) 91098-7654','Particular'),(9,'Beatriz Lima','999.000.111-09','1973-08-02','(11) 90987-6543','Bradesco Saúde'),(10,'Ricardo Pereira','000.111.222-10','1981-10-19','(11) 98877-6655','Amil');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescricoes`
--

DROP TABLE IF EXISTS `prescricoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescricoes` (
  `id_prescricoes` int NOT NULL AUTO_INCREMENT,
  `id_consultas` int NOT NULL,
  `medicamento` varchar(300) DEFAULT NULL,
  `dosagem` varchar(100) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id_prescricoes`),
  KEY `id_consultas` (`id_consultas`),
  CONSTRAINT `prescricoes_ibfk_1` FOREIGN KEY (`id_consultas`) REFERENCES `consultas` (`id_consultas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescricoes`
--

LOCK TABLES `prescricoes` WRITE;
/*!40000 ALTER TABLE `prescricoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescricoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id_quarto` int NOT NULL AUTO_INCREMENT,
  `numero_quarto` int NOT NULL,
  `andar` int NOT NULL,
  `tipo_quarto` varchar(50) NOT NULL,
  `status_quarto` varchar(20) NOT NULL,
  PRIMARY KEY (`id_quarto`),
  UNIQUE KEY `numero_quarto` (`numero_quarto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (1,101,1,'UTI','Ocupado'),(2,102,1,'Enfermaria','Livre'),(3,201,2,'Apartamento','Ocupado'),(4,202,2,'Apartamento','Livre'),(5,301,3,'UTI','Ocupado'),(6,302,3,'Enfermaria','Ocupado'),(7,401,4,'Suíte VIP','Livre'),(8,402,4,'Apartamento','Ocupado'),(9,501,5,'UTI','Livre'),(10,502,5,'Enfermaria','Ocupado');
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-10 18:16:29
