-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Ex5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex5` DEFAULT CHARACTER SET utf8mb3 ;
USE `Ex5` ;

-- -----------------------------------------------------
-- Table `Ex5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(50) NULL DEFAULT NULL,
  `Cognoms` VARCHAR(50) NULL DEFAULT NULL,
  `Adreça` VARCHAR(100) NULL DEFAULT NULL,
  `Població` VARCHAR(50) NULL DEFAULT NULL,
  `Usuari` VARCHAR(50) NULL DEFAULT NULL,
  `Contrasenya` VARCHAR(50) NULL DEFAULT NULL,
  `NumeroVehicles` INT NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `Usuari` (`Usuari` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Ex5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Vehicle` (
  `Matricula` VARCHAR(10) NOT NULL,
  `Tipus` VARCHAR(20) NULL DEFAULT NULL,
  `Marca` VARCHAR(50) NULL DEFAULT NULL,
  `ClientDNI` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `ClientDNI` (`ClientDNI` ASC) VISIBLE,
  CONSTRAINT `Vehicle_ibfk_1`
    FOREIGN KEY (`ClientDNI`)
    REFERENCES `Ex5`.`Client` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Ex5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Cita` (
  `CitaID` INT NOT NULL AUTO_INCREMENT,
  `DataHora` DATETIME NULL DEFAULT NULL,
  `MatriculaVehicle` VARCHAR(10) NULL DEFAULT NULL,
  `ClientDNI` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`CitaID`),
  INDEX `MatriculaVehicle` (`MatriculaVehicle` ASC) VISIBLE,
  INDEX `ClientDNI` (`ClientDNI` ASC) VISIBLE,
  CONSTRAINT `Cita_ibfk_1`
    FOREIGN KEY (`MatriculaVehicle`)
    REFERENCES `Ex5`.`Vehicle` (`Matricula`),
  CONSTRAINT `Cita_ibfk_2`
    FOREIGN KEY (`ClientDNI`)
    REFERENCES `Ex5`.`Client` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Ex5`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Email` (
  `EmailID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `ClientDNI` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`EmailID`),
  INDEX `ClientDNI` (`ClientDNI` ASC) VISIBLE,
  CONSTRAINT `Email_ibfk_1`
    FOREIGN KEY (`ClientDNI`)
    REFERENCES `Ex5`.`Client` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Ex5`.`Telefon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5`.`Telefon` (
  `TelefonID` INT NOT NULL AUTO_INCREMENT,
  `Telefon` VARCHAR(15) NULL DEFAULT NULL,
  `ClientDNI` VARCHAR(9) NULL DEFAULT NULL,
  PRIMARY KEY (`TelefonID`),
  INDEX `ClientDNI` (`ClientDNI` ASC) VISIBLE,
  CONSTRAINT `Telefon_ibfk_1`
    FOREIGN KEY (`ClientDNI`)
    REFERENCES `Ex5`.`Client` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
