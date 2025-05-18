-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: libreriadb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `ID_Autor` int NOT NULL AUTO_INCREMENT,
  `Nombre_Autor` varchar(100) DEFAULT NULL,
  `Apellido_Autor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Autor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Jordi','Wild'),(2,'James','Clear'),(3,'Gabriel','García Márquez'),(4,'Joe','Dispenza'),(5,'Sally','Rooney'),(6,'Hanya','Yanagihara');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_compras`
--

DROP TABLE IF EXISTS `carrito_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_compras` (
  `ID_Carrito` int NOT NULL AUTO_INCREMENT,
  `Fecha_creacion` date DEFAULT NULL,
  `Precio_Total` bigint DEFAULT NULL,
  `FK_User_Car` int NOT NULL,
  PRIMARY KEY (`ID_Carrito`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_compras`
--

LOCK TABLES `carrito_compras` WRITE;
/*!40000 ALTER TABLE `carrito_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_libro`
--

DROP TABLE IF EXISTS `categoria_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_libro` (
  `ID_Categoria` int NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_libro`
--

LOCK TABLES `categoria_libro` WRITE;
/*!40000 ALTER TABLE `categoria_libro` DISABLE KEYS */;
INSERT INTO `categoria_libro` VALUES (1,'Autoayuda'),(2,'Crecimiento personal'),(3,'Ficción contemporánea'),(4,'Ficción'),(5,'Thriller psicológico'),(6,'Romance'),(7,'Ciencia ficción'),(8,'Fantasía'),(9,'Terror'),(10,'Ensayo'),(11,'Biografía'),(12,'Historia'),(13,'Cómic / Novela gráfica'),(14,'Juvenil'),(15,'Clásicos literarios');
/*!40000 ALTER TABLE `categoria_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carrito`
--

DROP TABLE IF EXISTS `detalle_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_carrito` (
  `ID_Detalle_carro` int NOT NULL AUTO_INCREMENT,
  `ID_Libro` varchar(150) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `FK_Carro_ID` int NOT NULL,
  PRIMARY KEY (`ID_Detalle_carro`),
  KEY `FK_Carro_ID` (`FK_Carro_ID`),
  CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`FK_Carro_ID`) REFERENCES `carrito_compras` (`ID_Carrito`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carrito`
--

LOCK TABLES `detalle_carrito` WRITE;
/*!40000 ALTER TABLE `detalle_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `ID_detalle_pedido` int NOT NULL AUTO_INCREMENT,
  `ISBN_Libro` bigint NOT NULL,
  `ID_Libro` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  `FK_pedido` int NOT NULL,
  PRIMARY KEY (`ID_detalle_pedido`),
  KEY `FK_pedido` (`FK_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`FK_pedido`) REFERENCES `pedido` (`ID_Pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,9789877804751,1,1,1),(2,9786077476719,2,1,1),(3,9786077476719,2,1,2),(4,9780385539265,6,1,3),(5,9781984822192,5,1,3);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion_envio`
--

DROP TABLE IF EXISTS `direccion_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_envio` (
  `ID_Direccion` int NOT NULL AUTO_INCREMENT,
  `Pais` varchar(100) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Codigo_postal` varchar(50) DEFAULT NULL,
  `FK_User_DIR` int DEFAULT NULL,
  PRIMARY KEY (`ID_Direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_envio`
--

LOCK TABLES `direccion_envio` WRITE;
/*!40000 ALTER TABLE `direccion_envio` DISABLE KEYS */;
INSERT INTO `direccion_envio` VALUES (1,'Colombia','Bogotá','Calle 48B Sur #24D-45','110931',1),(2,'Colombia','Bogotá','Carrera 7 #120-45','110111',2),(3,'Colombia','Bogotá','Avenida Primero de Mayo #72-30','110821',3);
/*!40000 ALTER TABLE `direccion_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `ID_Editorial` int NOT NULL AUTO_INCREMENT,
  `Nombre_Editorial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Diana'),(2,'Penguin Random House'),(3,'Literatura Random House'),(4,'Debolsillo'),(5,'Planeta'),(6,'Anagrama'),(7,'Tusquets Editores'),(8,'Alfaguara'),(9,'HarperCollins'),(10,'Vintage Books');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `ID_Libro` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(200) DEFAULT NULL,
  `ISBN` bigint NOT NULL,
  `Precio` int DEFAULT NULL,
  `FK_Detalle_pedido` int DEFAULT NULL,
  `FK_Detalle_carrito` int DEFAULT NULL,
  `FK_Editorial` int DEFAULT NULL,
  `FK_Categoria` int DEFAULT NULL,
  `FK_Autor` int DEFAULT NULL,
  PRIMARY KEY (`ID_Libro`),
  KEY `FK_Detalle_pedido` (`FK_Detalle_pedido`),
  KEY `FK_Detalle_carrito` (`FK_Detalle_carrito`),
  KEY `FK_Editorial` (`FK_Editorial`),
  KEY `FK_Categoria` (`FK_Categoria`),
  KEY `FK_Autor` (`FK_Autor`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`FK_Detalle_pedido`) REFERENCES `detalle_pedido` (`ID_detalle_pedido`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`FK_Detalle_carrito`) REFERENCES `detalle_carrito` (`ID_Detalle_carro`),
  CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`FK_Editorial`) REFERENCES `editorial` (`ID_Editorial`),
  CONSTRAINT `libro_ibfk_4` FOREIGN KEY (`FK_Categoria`) REFERENCES `categoria_libro` (`ID_Categoria`),
  CONSTRAINT `libro_ibfk_5` FOREIGN KEY (`FK_Autor`) REFERENCES `autor` (`ID_Autor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Anatomía del mal',9789877804751,51999,NULL,NULL,1,5,1),(2,'Hábitos atómicos',9786077476719,63998,NULL,NULL,1,1,2),(3,'En agosto nos vemos',9788439743088,70000,NULL,NULL,2,4,3),(4,'Deja de ser tú',9786079344085,72000,NULL,NULL,1,1,4),(5,'Normal People',9781984822192,69999,NULL,NULL,3,3,5),(6,'A Little Life',9780385539265,88999,NULL,NULL,10,3,6);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `ID_Pago` int NOT NULL AUTO_INCREMENT,
  `FechaPago` date DEFAULT NULL,
  `Metodo` varchar(50) DEFAULT NULL,
  `Monto` bigint DEFAULT NULL,
  `FK_Pedido_ID` int NOT NULL,
  PRIMARY KEY (`ID_Pago`),
  KEY `FK_Pedido_ID` (`FK_Pedido_ID`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`FK_Pedido_ID`) REFERENCES `pedido` (`ID_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `ID_Pedido` int NOT NULL AUTO_INCREMENT,
  `Fecha_pedido` date DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  `FK_User` int NOT NULL,
  PRIMARY KEY (`ID_Pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2025-05-08',1,1),(2,'2025-05-15',0,2),(3,'2025-04-28',1,3);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Miguel','Romero','mr20092005@gmail.com','Miguel2025','3204197758'),(2,'Pepito','Perez','pepito2025@gmail.com','Pepito2025','3145678908'),(3,'Cristian','Rodriguez','cr595900@gmail.com','Cristian123','3227487972');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13 11:32:46
