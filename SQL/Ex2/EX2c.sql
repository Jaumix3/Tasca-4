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
-- Table `mydb`.`ALUMNE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALUMNE` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NOT NULL,
  `COGNOM` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `TELEFON` VARCHAR(45) NULL,
  `ADRESA` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTAMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTAMENT` (
  `NOM` INT NOT NULL,
  PRIMARY KEY (`NOM`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROFESSOR` (
  `idProfessor` INT NOT NULL,
  `DEPARTAMENT_NOM` INT NOT NULL,
  PRIMARY KEY (`idProfessor`),
  INDEX `fk_PROFESSOR_DEPARTAMENT1_idx` (`DEPARTAMENT_NOM` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_DEPARTAMENT1`
    FOREIGN KEY (`DEPARTAMENT_NOM`)
    REFERENCES `mydb`.`DEPARTAMENT` (`NOM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ASSIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ASSIGNATURA` (
  `idASSIGNATURA` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  PRIMARY KEY (`idASSIGNATURA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MATRICULA` (
  `DATA` INT NOT NULL,
  `ALUMNE` VARCHAR(45) NULL,
  `ALUMNE_DNI` INT NOT NULL,
  `PREU` VARCHAR(45) NULL,
  PRIMARY KEY (`DATA`),
  INDEX `fk_MATRICULA_ALUMNE_idx` (`ALUMNE_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_MATRICULA_ALUMNE`
    FOREIGN KEY (`ALUMNE_DNI`)
    REFERENCES `mydb`.`ALUMNE` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MAP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MAP` (
  `idMAP` INT NOT NULL,
  `MATRICULA_DATA` INT NOT NULL,
  `ASSIGNATURA_idASSIGNATURA` INT NOT NULL,
  `PROFESSOR_DNI` INT NOT NULL,
  PRIMARY KEY (`idMAP`),
  INDEX `fk_MAP_MATRICULA1_idx` (`MATRICULA_DATA` ASC) VISIBLE,
  INDEX `fk_MAP_ASSIGNATURA1_idx` (`ASSIGNATURA_idASSIGNATURA` ASC) VISIBLE,
  INDEX `fk_MAP_PROFESSOR1_idx` (`PROFESSOR_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_MAP_MATRICULA1`
    FOREIGN KEY (`MATRICULA_DATA`)
    REFERENCES `mydb`.`MATRICULA` (`DATA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAP_ASSIGNATURA1`
    FOREIGN KEY (`ASSIGNATURA_idASSIGNATURA`)
    REFERENCES `mydb`.`ASSIGNATURA` (`idASSIGNATURA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAP_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_DNI`)
    REFERENCES `mydb`.`PROFESSOR` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
