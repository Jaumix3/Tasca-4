-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex4` ;
USE `Ex4` ;

-- -----------------------------------------------------
-- Table `Ex4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`Client` (
  `idClient` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `COGNOM` VARCHAR(45) NULL,
  `VIP` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`Venedor` (
  `idVenedor` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `NOM` VARCHAR(45) NULL,
  `COGNOM` VARCHAR(45) NULL,
  `NumSS` VARCHAR(45) NULL,
  PRIMARY KEY (`idVenedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4`.`TipusPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`TipusPolissa` (
  `idTipusPolissa` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(25) NULL,
  PRIMARY KEY (`idTipusPolissa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex4`.`POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex4`.`POLISSA` (
  `idPOLISSA` INT NOT NULL,
  `NumPolissa` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  `Venedor_idVenedor` INT NOT NULL,
  `TipusPolissa_idTipusPolissa` INT NOT NULL,
  `PreuAnual` INT NULL,
  `TipusPagament` VARCHAR(45) NULL,
  `DataContracte` VARCHAR(45) NULL,
  `IniciVigència` VARCHAR(10) NULL,
  `FideVigencia` VARCHAR(10) NULL,
  PRIMARY KEY (`idPOLISSA`),
  INDEX `fk_POLISSA_Client_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_POLISSA_Venedor1_idx` (`Venedor_idVenedor` ASC) VISIBLE,
  INDEX `fk_POLISSA_TipusPolissa1_idx` (`TipusPolissa_idTipusPolissa` ASC) VISIBLE,
  CONSTRAINT `fk_POLISSA_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Ex4`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_Venedor1`
    FOREIGN KEY (`Venedor_idVenedor`)
    REFERENCES `Ex4`.`Venedor` (`idVenedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_TipusPolissa1`
    FOREIGN KEY (`TipusPolissa_idTipusPolissa`)
    REFERENCES `Ex4`.`TipusPolissa` (`idTipusPolissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
