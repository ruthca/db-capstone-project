-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Fact_Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fact_Sales` (
  `SalesID` INT NOT NULL,
  `OrderID` INT NULL,
  `ProductID` INT NULL,
  `CustomerID` INT NULL,
  `DateID` INT NULL,
  `CityID` INT NULL,
  `ShipModeID` INT NULL,
  `QuantitySold` INT NULL,
  `SalesAmount` DECIMAL NULL,
  `Discount` DECIMAL NULL,
  `Profit` DECIMAL NULL,
  `ShippingCost` DECIMAL NULL,
  PRIMARY KEY (`SalesID`),
  INDEX `salesid` (`SalesID` ASC, `ProductID` ASC) VISIBLE,
  INDEX `dateid` (`DateID` ASC) VISIBLE,
  INDEX `cityid` (`CityID` ASC) VISIBLE,
  INDEX `productID` (`ProductID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimCustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimCustomer` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `Segment` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Region` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`Fact_Sales` (`SalesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimProduct` (
  `idProduct` INT NOT NULL DEFAULT 1,
  `ProductName` VARCHAR(45) NULL,
  `Subcategory_ID` INT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduct`),
  INDEX `subcategory_id` (`Subcategory_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimSubcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimSubcategory` (
  `idSubcategory` INT NOT NULL,
  `SubcategoryName` VARCHAR(45) NULL,
  `idCategory` INT NOT NULL,
  PRIMARY KEY (`idSubcategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimCategory` (
  `idCategory` INT NOT NULL,
  `CategoryName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategory`),
  CONSTRAINT `idcategory`
    FOREIGN KEY (`idCategory`)
    REFERENCES `mydb`.`DimSubcategory` (`idSubcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimDate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimDate` (
  `TimeKey` INT NOT NULL,
  `FullDate` DATE NULL,
  `Year` INT NULL,
  `Quarter` VARCHAR(45) NULL,
  `Month` INT NULL,
  `event` VARCHAR(45) NULL,
  PRIMARY KEY (`TimeKey`),
  CONSTRAINT `iddate`
    FOREIGN KEY (`TimeKey`)
    REFERENCES `mydb`.`Fact_Sales` (`SalesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimShipMode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimShipMode` (
  `idShipMode` INT NOT NULL,
  `ShipModeType` VARCHAR(45) NULL,
  PRIMARY KEY (`idShipMode`),
  CONSTRAINT `shipmode`
    FOREIGN KEY (`idShipMode`)
    REFERENCES `mydb`.`Fact_Sales` (`SalesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`DimCity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimCity` (
  `idCity` INT NOT NULL,
  `CityName` VARCHAR(45) NULL,
  `StateID` INT NULL,
  `PostalCode` VARCHAR(45) NULL,
  PRIMARY KEY (`idCity`),
  CONSTRAINT `cityid`
    FOREIGN KEY (`idCity`)
    REFERENCES `mydb`.`Fact_Sales` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimState`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimState` (
  `idState` INT NOT NULL,
  `StateName` VARCHAR(45) NULL,
  `CountryID` INT NULL,
  PRIMARY KEY (`idState`),
  CONSTRAINT `stateid`
    FOREIGN KEY (`idState`)
    REFERENCES `mydb`.`DimCity` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DimCountry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DimCountry` (
  `idCountry` INT NOT NULL,
  `CountryName` VARCHAR(45) NULL,
  `RegionName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCountry`),
  CONSTRAINT `idcountry`
    FOREIGN KEY (`idCountry`)
    REFERENCES `mydb`.`DimState` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Decbookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Decbookings` (
  `bookingID` INT NOT NULL,
  `dateBooking` DATETIME NOT NULL,
  `tableNumber` INT NOT NULL,
  PRIMARY KEY (`bookingID`));


-- -----------------------------------------------------
-- Table `mydb`.`DecOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DecOrders` (
  `idorders` INT NOT NULL,
  `dateOrder` DATETIME NULL,
  `quantity` INT NULL,
  `totalCost` DECIMAL(2) NULL,
  PRIMARY KEY (`idorders`));


-- -----------------------------------------------------
-- Table `mydb`.`DecOrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DecOrderDeliveryStatus` (
  `Idorders` INT NOT NULL,
  `deliveryStatus` VARCHAR(45) NULL,
  `deliveryDate` DATETIME NULL,
  PRIMARY KEY (`Idorders`),
  CONSTRAINT `idorders`
    FOREIGN KEY (`Idorders`)
    REFERENCES `mydb`.`DecOrders` (`idorders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`DecMenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DecMenu` (
  `idFood` INT NOT NULL,
  `typeFood` VARCHAR(45) NULL,
  `cuisines` VARCHAR(45) NULL,
  `courses` VARCHAR(45) NULL,
  `drink` VARCHAR(45) NULL,
  `dessert` VARCHAR(45) NULL,
  PRIMARY KEY (`idFood`));


-- -----------------------------------------------------
-- Table `mydb`.`DecCustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DecCustomer` (
  `idCustomer` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerEmail` VARCHAR(45) NULL,
  `CustomerPhone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DecStaffRole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DecStaffRole` (
  `idStaffRole` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Salary` DECIMAL(2) NULL,
  PRIMARY KEY (`idStaffRole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DecStaffMember`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DecStaffMember` (
  `idStaffMember` INT NOT NULL,
  `idStaffRole` INT NULL,
  `MemberName` VARCHAR(45) NULL,
  PRIMARY KEY (`idStaffMember`),
  INDEX `idstaffrole_idx` (`idStaffRole` ASC) VISIBLE,
  CONSTRAINT `idstaffrole`
    FOREIGN KEY (`idStaffRole`)
    REFERENCES `mydb`.`DecStaffRole` (`idStaffRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
