-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex2B` ;
USE `Ex2B` ;

-- -----------------------------------------------------
-- Table `Ex2B`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B`.`CINE` (
  `idCINE` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Poblacio` VARCHAR(45) NULL,
  `NumSales` VARCHAR(45) NULL,
  PRIMARY KEY (`idCINE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2B`.`PELICULAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B`.`PELICULAS` (
  `idPELICULAS` INT NOT NULL,
  `Titol` VARCHAR(45) NULL,
  `Classificacio` VARCHAR(45) NULL,
  `Genere` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Durada` VARCHAR(45) NULL,
  `CINE_idCINE` INT NOT NULL,
  PRIMARY KEY (`idPELICULAS`),
  INDEX `fk_PELICULAS_CINE1_idx` (`CINE_idCINE` ASC) VISIBLE,
  CONSTRAINT `fk_PELICULAS_CINE1`
    FOREIGN KEY (`CINE_idCINE`)
    REFERENCES `Ex2B`.`CINE` (`idCINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2B`.`Projeccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B`.`Projeccions` (
  `IDprojeccions` INT NOT NULL,
  `DIA` VARCHAR(45) NULL,
  `Cine` VARCHAR(45) NULL,
  `Pelicula` VARCHAR(45) NULL,
  `Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `CINE_idCINE` INT NOT NULL,
  PRIMARY KEY (`IDprojeccions`),
  INDEX `fk_Projeccions_CINE1_idx` (`CINE_idCINE` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccions_CINE1`
    FOREIGN KEY (`CINE_idCINE`)
    REFERENCES `Ex2B`.`CINE` (`idCINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex2B`.`Tarifes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex2B`.`Tarifes` (
  `idTarifes` INT NOT NULL,
  `Cine` VARCHAR(45) NULL,
  `Tipus` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `CINE_idCINE` INT NOT NULL,
  PRIMARY KEY (`idTarifes`),
  INDEX `fk_Tarifes_CINE_idx` (`CINE_idCINE` ASC) VISIBLE,
  CONSTRAINT `fk_Tarifes_CINE`
    FOREIGN KEY (`CINE_idCINE`)
    REFERENCES `Ex2B`.`CINE` (`idCINE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
