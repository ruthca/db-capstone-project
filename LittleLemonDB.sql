-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `decbookings`
--

DROP TABLE IF EXISTS `decbookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decbookings` (
  `bookingID` int NOT NULL,
  `dateBooking` datetime NOT NULL,
  `tableNumber` int NOT NULL,
  PRIMARY KEY (`bookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decbookings`
--

LOCK TABLES `decbookings` WRITE;
/*!40000 ALTER TABLE `decbookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `decbookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deccustomer`
--

DROP TABLE IF EXISTS `deccustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deccustomer` (
  `idCustomer` int NOT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `CustomerEmail` varchar(45) DEFAULT NULL,
  `CustomerPhone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deccustomer`
--

LOCK TABLES `deccustomer` WRITE;
/*!40000 ALTER TABLE `deccustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `deccustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decmenu`
--

DROP TABLE IF EXISTS `decmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decmenu` (
  `idFood` int NOT NULL,
  `typeFood` varchar(45) DEFAULT NULL,
  `cuisines` varchar(45) DEFAULT NULL,
  `courses` varchar(45) DEFAULT NULL,
  `drink` varchar(45) DEFAULT NULL,
  `dessert` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decmenu`
--

LOCK TABLES `decmenu` WRITE;
/*!40000 ALTER TABLE `decmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `decmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decorderdeliverystatus`
--

DROP TABLE IF EXISTS `decorderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decorderdeliverystatus` (
  `Idorders` int NOT NULL,
  `deliveryStatus` varchar(45) DEFAULT NULL,
  `deliveryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Idorders`),
  CONSTRAINT `idorders` FOREIGN KEY (`Idorders`) REFERENCES `decorders` (`idorders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decorderdeliverystatus`
--

LOCK TABLES `decorderdeliverystatus` WRITE;
/*!40000 ALTER TABLE `decorderdeliverystatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `decorderdeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decorders`
--

DROP TABLE IF EXISTS `decorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decorders` (
  `idorders` int NOT NULL,
  `dateOrder` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `totalCost` decimal(2,0) DEFAULT NULL,
  `idCustomer` int DEFAULT NULL,
  PRIMARY KEY (`idorders`),
  KEY `idCustomer_idx` (`idCustomer`),
  CONSTRAINT `idCustomer` FOREIGN KEY (`idCustomer`) REFERENCES `deccustomer` (`idCustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decorders`
--

LOCK TABLES `decorders` WRITE;
/*!40000 ALTER TABLE `decorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `decorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decstaffmember`
--

DROP TABLE IF EXISTS `decstaffmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decstaffmember` (
  `idStaffMember` int NOT NULL,
  `idStaffRole` int DEFAULT NULL,
  `MemberName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStaffMember`),
  KEY `idstaffrole_idx` (`idStaffRole`),
  CONSTRAINT `idstaffrole` FOREIGN KEY (`idStaffRole`) REFERENCES `decstaffrole` (`idStaffRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decstaffmember`
--

LOCK TABLES `decstaffmember` WRITE;
/*!40000 ALTER TABLE `decstaffmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `decstaffmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decstaffrole`
--

DROP TABLE IF EXISTS `decstaffrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decstaffrole` (
  `idStaffRole` int NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Salary` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`idStaffRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decstaffrole`
--

LOCK TABLES `decstaffrole` WRITE;
/*!40000 ALTER TABLE `decstaffrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `decstaffrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimcategory`
--

DROP TABLE IF EXISTS `dimcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimcategory` (
  `idCategory` int NOT NULL,
  `CategoryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategory`),
  CONSTRAINT `idcategory` FOREIGN KEY (`idCategory`) REFERENCES `dimsubcategory` (`idSubcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimcategory`
--

LOCK TABLES `dimcategory` WRITE;
/*!40000 ALTER TABLE `dimcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimcity`
--

DROP TABLE IF EXISTS `dimcity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimcity` (
  `idCity` int NOT NULL,
  `CityName` varchar(45) DEFAULT NULL,
  `StateID` int DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCity`),
  CONSTRAINT `cityid` FOREIGN KEY (`idCity`) REFERENCES `fact_sales` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimcity`
--

LOCK TABLES `dimcity` WRITE;
/*!40000 ALTER TABLE `dimcity` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimcity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimcountry`
--

DROP TABLE IF EXISTS `dimcountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimcountry` (
  `idCountry` int NOT NULL,
  `CountryName` varchar(45) DEFAULT NULL,
  `RegionName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCountry`),
  CONSTRAINT `idcountry` FOREIGN KEY (`idCountry`) REFERENCES `dimstate` (`idState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimcountry`
--

LOCK TABLES `dimcountry` WRITE;
/*!40000 ALTER TABLE `dimcountry` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimcountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimcustomer`
--

DROP TABLE IF EXISTS `dimcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimcustomer` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `Segment` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `customerid` FOREIGN KEY (`CustomerID`) REFERENCES `fact_sales` (`SalesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimcustomer`
--

LOCK TABLES `dimcustomer` WRITE;
/*!40000 ALTER TABLE `dimcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimdate`
--

DROP TABLE IF EXISTS `dimdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimdate` (
  `TimeKey` int NOT NULL,
  `FullDate` date DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Quarter` varchar(45) DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TimeKey`),
  CONSTRAINT `iddate` FOREIGN KEY (`TimeKey`) REFERENCES `fact_sales` (`SalesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimdate`
--

LOCK TABLES `dimdate` WRITE;
/*!40000 ALTER TABLE `dimdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimproduct`
--

DROP TABLE IF EXISTS `dimproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimproduct` (
  `idProduct` int NOT NULL DEFAULT '1',
  `ProductName` varchar(45) DEFAULT NULL,
  `Subcategory_ID` int DEFAULT NULL,
  `Manufacturer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `subcategory_id` (`Subcategory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimproduct`
--

LOCK TABLES `dimproduct` WRITE;
/*!40000 ALTER TABLE `dimproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimshipmode`
--

DROP TABLE IF EXISTS `dimshipmode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimshipmode` (
  `idShipMode` int NOT NULL,
  `ShipModeType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idShipMode`),
  CONSTRAINT `shipmode` FOREIGN KEY (`idShipMode`) REFERENCES `fact_sales` (`SalesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimshipmode`
--

LOCK TABLES `dimshipmode` WRITE;
/*!40000 ALTER TABLE `dimshipmode` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimshipmode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimstate`
--

DROP TABLE IF EXISTS `dimstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimstate` (
  `idState` int NOT NULL,
  `StateName` varchar(45) DEFAULT NULL,
  `CountryID` int DEFAULT NULL,
  PRIMARY KEY (`idState`),
  CONSTRAINT `stateid` FOREIGN KEY (`idState`) REFERENCES `dimcity` (`idCity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimstate`
--

LOCK TABLES `dimstate` WRITE;
/*!40000 ALTER TABLE `dimstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimsubcategory`
--

DROP TABLE IF EXISTS `dimsubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimsubcategory` (
  `idSubcategory` int NOT NULL,
  `SubcategoryName` varchar(45) DEFAULT NULL,
  `idCategory` int NOT NULL,
  PRIMARY KEY (`idSubcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimsubcategory`
--

LOCK TABLES `dimsubcategory` WRITE;
/*!40000 ALTER TABLE `dimsubcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimsubcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_sales`
--

DROP TABLE IF EXISTS `fact_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_sales` (
  `SalesID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `DateID` int DEFAULT NULL,
  `CityID` int DEFAULT NULL,
  `ShipModeID` int DEFAULT NULL,
  `QuantitySold` int DEFAULT NULL,
  `SalesAmount` decimal(10,0) DEFAULT NULL,
  `Discount` decimal(10,0) DEFAULT NULL,
  `Profit` decimal(10,0) DEFAULT NULL,
  `ShippingCost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`SalesID`),
  KEY `salesid` (`SalesID`,`ProductID`),
  KEY `dateid` (`DateID`),
  KEY `cityid` (`CityID`),
  KEY `productID` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_sales`
--

LOCK TABLES `fact_sales` WRITE;
/*!40000 ALTER TABLE `fact_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `fact_sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-26 16:08:18
