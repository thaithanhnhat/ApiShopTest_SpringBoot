-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: myshope
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,2),(2,1,3,1),(3,2,2,1),(4,2,2,1),(5,3,2,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Áo','Các loại áo dành cho nam và nữ'),(2,'Quần','Các loại quần dài và ngắn cho nam và nữ'),(3,'Váy','Váy cho nữ'),(4,'Phụ kiện','Các phụ kiện thời trang như nón, dây nịt, túi xách'),(5,'Áo','Các loại áo dành cho nam và nữ'),(6,'Quần','Các loại quần dài và ngắn cho nam và nữ'),(7,'Váy','Váy cho nữ'),(8,'Phụ kiện','Các phụ kiện thời trang như nón, dây nịt, túi xách'),(9,'Áo','Các loại áo dành cho nam và nữ'),(10,'Quần','Các loại quần dài và ngắn cho nam và nữ'),(11,'Váy','Váy cho nữ'),(12,'Phụ kiện','Các phụ kiện thời trang như nón, dây nịt, túi xách');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_code` varchar(7) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`color_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `color_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'#FF5733',1),(2,'#33FF57',1),(3,'#FF33A1',2),(4,'#3357FF',3),(5,'#FFFF33',4),(6,'#FF33FF',5);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nguyễn Văn A','vana@example.com','password123','123 Đường A, TP.HCM','0123456789'),(2,'Trần Thị B','b@example.com','password456','456 Đường B, Hà Nội','0987654321'),(3,'Nguyễn Văn A','nguyenvana@example.com','password123','Hà Nội','0123456789');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,1,'https://example.com/images/ao_thun_nam.jpg'),(2,2,'https://example.com/images/ao_so_mi_nu.jpg'),(3,3,'https://example.com/images/quan_jean_nam.jpg'),(4,4,'https://example.com/images/quan_short_nu.jpg'),(5,5,'https://example.com/images/vay_maxi.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int NOT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `view_count` int DEFAULT '0',
  `discount_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Áo thun nam','Áo thun cotton mềm mại, thoáng mát',200000.00,150000.00,100,4.50,20,'2024-12-31 00:00:00'),(2,1,'Áo sơ mi nữ','Áo sơ mi nữ tay ngắn, phong cách thanh lịch',300000.00,250000.00,50,4.00,15,'2024-11-30 00:00:00'),(3,2,'Quần jean nam','Quần jean thời trang, cá tính',500000.00,450000.00,80,4.30,25,'2024-10-31 00:00:00'),(4,2,'Quần short nữ','Quần short mát mẻ cho mùa hè',250000.00,450000.00,70,4.10,10,'2024-10-31 00:00:00'),(5,3,'Váy maxi','Váy maxi dài, thoải mái cho mùa hè',400000.00,350000.00,30,4.70,5,'2024-12-15 00:00:00'),(6,1,'Áo thun nam','Áo thun cotton mềm mại, thoáng mát',200000.00,150000.00,100,4.50,20,'2024-12-31 00:00:00'),(7,1,'Áo sơ mi nữ','Áo sơ mi nữ tay ngắn, phong cách thanh lịch',300000.00,250000.00,50,4.00,15,'2024-11-30 00:00:00'),(8,2,'Quần jean nam','Quần jean thời trang, cá tính',500000.00,450000.00,80,4.30,25,'2024-10-31 00:00:00'),(9,2,'Quần short nữ','Quần short mát mẻ cho mùa hè',250000.00,450000.00,70,4.10,10,'2024-10-31 00:00:00'),(10,3,'Váy maxi','Váy maxi dài, thoải mái cho mùa hè',400000.00,350000.00,30,4.70,5,'2024-12-15 00:00:00'),(11,1,'Áo thun nam','Áo thun cotton mềm mại, thoáng mát',200000.00,150000.00,100,4.50,20,'2024-12-31 00:00:00'),(12,1,'Áo sơ mi nữ','Áo sơ mi nữ tay ngắn, phong cách thanh lịch',300000.00,250000.00,50,4.00,15,'2024-11-30 00:00:00'),(13,2,'Quần jean nam','Quần jean thời trang, cá tính',500000.00,450000.00,80,4.30,25,'2024-10-31 00:00:00'),(14,2,'Quần short nữ','Quần short mát mẻ cho mùa hè',250000.00,450000.00,70,4.10,10,'2024-10-31 00:00:00'),(15,3,'Váy maxi','Váy maxi dài, thoải mái cho mùa hè',400000.00,350000.00,30,4.70,5,'2024-12-15 00:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `size_name` varchar(50) NOT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`size_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `size_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'S',1),(2,'M',1),(3,'L',1),(4,'M',2),(5,'L',2),(6,'30',3),(7,'32',3),(8,'S',4),(9,'M',4),(10,'L',5),(11,'XL',5);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27 19:53:53
