-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Fact_Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Fact_Sales` (
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
-- Table `LittleLemonDB`.`DimCustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimCustomer` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `Segment` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Region` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Fact_Sales` (`SalesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimProduct` (
  `idProduct` INT NOT NULL DEFAULT 1,
  `ProductName` VARCHAR(45) NULL,
  `Subcategory_ID` INT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduct`),
  INDEX `subcategory_id` (`Subcategory_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimSubcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimSubcategory` (
  `idSubcategory` INT NOT NULL,
  `SubcategoryName` VARCHAR(45) NULL,
  `idCategory` INT NOT NULL,
  PRIMARY KEY (`idSubcategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimCategory` (
  `idCategory` INT NOT NULL,
  `CategoryName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategory`),
  CONSTRAINT `idcategory`
    FOREIGN KEY (`idCategory`)
    REFERENCES `LittleLemonDB`.`DimSubcategory` (`idSubcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimDate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimDate` (
  `TimeKey` INT NOT NULL,
  `FullDate` DATE NULL,
  `Year` INT NULL,
  `Quarter` VARCHAR(45) NULL,
  `Month` INT NULL,
  `event` VARCHAR(45) NULL,
  PRIMARY KEY (`TimeKey`),
  CONSTRAINT `iddate`
    FOREIGN KEY (`TimeKey`)
    REFERENCES `LittleLemonDB`.`Fact_Sales` (`SalesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimShipMode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimShipMode` (
  `idShipMode` INT NOT NULL,
  `ShipModeType` VARCHAR(45) NULL,
  PRIMARY KEY (`idShipMode`),
  CONSTRAINT `shipmode`
    FOREIGN KEY (`idShipMode`)
    REFERENCES `LittleLemonDB`.`Fact_Sales` (`SalesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimCity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimCity` (
  `idCity` INT NOT NULL,
  `CityName` VARCHAR(45) NULL,
  `StateID` INT NULL,
  `PostalCode` VARCHAR(45) NULL,
  PRIMARY KEY (`idCity`),
  CONSTRAINT `cityid`
    FOREIGN KEY (`idCity`)
    REFERENCES `LittleLemonDB`.`Fact_Sales` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimState`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimState` (
  `idState` INT NOT NULL,
  `StateName` VARCHAR(45) NULL,
  `CountryID` INT NULL,
  PRIMARY KEY (`idState`),
  CONSTRAINT `stateid`
    FOREIGN KEY (`idState`)
    REFERENCES `LittleLemonDB`.`DimCity` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DimCountry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DimCountry` (
  `idCountry` INT NOT NULL,
  `CountryName` VARCHAR(45) NULL,
  `RegionName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCountry`),
  CONSTRAINT `idcountry`
    FOREIGN KEY (`idCountry`)
    REFERENCES `LittleLemonDB`.`DimState` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Decbookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Decbookings` (
  `bookingID` INT NOT NULL,
  `dateBooking` DATETIME NOT NULL,
  `tableNumber` INT NOT NULL,
  PRIMARY KEY (`bookingID`));


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DecCustomers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DecCustomers` (
  `idCustomer` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerEmail` VARCHAR(45) NULL,
  `CustomerPhone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DecMenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DecMenuItems` (
  `idMenuItems` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `DessertName` VARCHAR(45) NULL,
  PRIMARY KEY (`idMenuItems`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DecMenus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DecMenus` (
  `idMenu` INT NOT NULL,
  `IDMenuItems` INT NULL,
  `MenuName` VARCHAR(45) NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`idMenu`),
  INDEX `idMenuItems_idx` (`IDMenuItems` ASC) VISIBLE,
  CONSTRAINT `idMenuItems`
    FOREIGN KEY (`IDMenuItems`)
    REFERENCES `LittleLemonDB`.`DecMenuItems` (`idMenuItems`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DecOrders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DecOrders` (
  `idorders` INT NOT NULL,
  `dateOrder` DATETIME NULL,
  `quantity` INT NULL,
  `totalCost` DECIMAL(2) NULL,
  `idCustomer` INT NULL,
  `menuID` INT NULL,
  PRIMARY KEY (`idorders`),
  INDEX `idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  INDEX `idMenu_idx` (`menuID` ASC) VISIBLE,
  CONSTRAINT `idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `LittleLemonDB`.`DecCustomers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMenu`
    FOREIGN KEY (`menuID`)
    REFERENCES `LittleLemonDB`.`DecMenus` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DecOrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DecOrderDeliveryStatus` (
  `Idorders` INT NOT NULL,
  `deliveryStatus` VARCHAR(45) NULL,
  `deliveryDate` DATETIME NULL,
  PRIMARY KEY (`Idorders`),
  CONSTRAINT `idorders`
    FOREIGN KEY (`Idorders`)
    REFERENCES `LittleLemonDB`.`DecOrders` (`idorders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DecStaffRole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DecStaffRole` (
  `idStaffRole` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Salary` DECIMAL(2) NULL,
  PRIMARY KEY (`idStaffRole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DecStaffMember`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DecStaffMember` (
  `idStaffMember` INT NOT NULL,
  `idStaffRole` INT NULL,
  `MemberName` VARCHAR(45) NULL,
  PRIMARY KEY (`idStaffMember`),
  INDEX `idstaffrole_idx` (`idStaffRole` ASC) VISIBLE,
  CONSTRAINT `idstaffrole`
    FOREIGN KEY (`idStaffRole`)
    REFERENCES `LittleLemonDB`.`DecStaffRole` (`idStaffRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
