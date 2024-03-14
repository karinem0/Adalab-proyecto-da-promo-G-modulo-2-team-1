CREATE DATABASE  IF NOT EXISTS `proyecto_cinemextract` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_cinemextract`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_cinemextract
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `premiososcar`
--

DROP TABLE IF EXISTS `premiososcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premiososcar` (
  `Anio` int NOT NULL,
  `MejorPelicula` varchar(255) DEFAULT NULL,
  `MejorDirector` varchar(255) DEFAULT NULL,
  `MejorActor` varchar(255) DEFAULT NULL,
  `MejorActriz` varchar(255) DEFAULT NULL,
  `IdPelicula` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Anio`),
  KEY `IdPelicula` (`IdPelicula`),
  CONSTRAINT `premiososcar_ibfk_1` FOREIGN KEY (`IdPelicula`) REFERENCES `peliculas` (`IdPelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premiososcar`
--

LOCK TABLES `premiososcar` WRITE;
/*!40000 ALTER TABLE `premiososcar` DISABLE KEYS */;
INSERT INTO `premiososcar` VALUES (2000,'American Beauty','S. Mendes','K. Spacey','H. Swank','tt0313199'),(2001,'Gladiator','S. Soderbergh','R. Crowe','J. Roberts','tt1359002'),(2002,'A Beautiful Mind','R. Howard','D. Washington','H. Berry',NULL),(2003,'Chicago','R. Polanski','A. Brody','N. Kidman','tt0299658'),(2004,'The Lord of the Rings: The Return of the King','P. Jackson','S. Penn','C. Theron','tt0167260'),(2005,'Million Dollar Baby','C. Eastwood','J. Foxx','H. Swank',NULL),(2006,'Crash','A. Lee','P. S. Hoffman','R. Witherspoon','tt0375679'),(2007,'The Departed','M. Scorsese','F. Whitaker','H. Mirren','tt0407887'),(2008,'No Country for Old Men','J. Coen E. Coen','D. Day-Lewis','M. Cotillard','tt0477348'),(2009,'Slumdog Millionaire','D. Boyle','S. Penn','K. Winslet',NULL),(2010,'The Hurt Locker','K. Bigelow','J. Bridges','S. Bullock','tt0887912'),(2011,'The King\'s Speech','T. Hooper','C. Firth','N. Portman',NULL),(2012,'The Artist','M. Hazanavicius','J. Dujardin','M. Streep','tt1655442'),(2013,'Argo','A. Lee','D. Day-Lewis','J. Lawrence','tt1024648'),(2014,'12 Years a Slave','A. Cuarón','M. McConaughey','C. Blanchett',NULL),(2015,'Birdman or (The Unexpected Virtue of Ignorance)','A. G. Iñárritu','E. Redmayne','J.Moore',NULL),(2016,'Spotlight','A. G. Iñárritu','L. DiCaprio','B. Larson','tt1895587'),(2017,'Moonlight','D. Chazelle','C. Affleck','E. Stone',NULL),(2018,'The Shape of Water','G. del Toro','G. Oldman','F. McDormand',NULL),(2019,'Green Book','A. Cuarón','R. Malek','O. Colman',NULL),(2020,'Parasite','Bong J.','J. Phoenix','R. Zellweger',NULL),(2021,'Nomadland','C. Zhao','A. Hopkins','F. McDormand',NULL),(2022,'CODA','J. Campion','W. Smith','J. Chastain','tt10366460'),(2023,'Everything Everywhere All at Once','D. Kwan D. Scheinert','B. Fraser','M. Yeoh','tt6710474');
/*!40000 ALTER TABLE `premiososcar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07 21:19:43
