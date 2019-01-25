-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DIA42-Exercise
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DIA42-Exercise
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DIA42-Exercise` ;
USE `DIA42-Exercise` ;

-- -----------------------------------------------------
-- Table `DIA42-Exercise`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DIA42-Exercise`.`table1` (
  `syndrome_id` INT NOT NULL,
  `syndrome_name` VARCHAR(45) NULL,
  `syndrome_discription` VARCHAR(45) NULL,
  PRIMARY KEY (`syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DIA42-Exercise`.`sample patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DIA42-Exercise`.`sample patient` (
  `PT_ID` INT NOT NULL,
  `patient name` VARCHAR(45) NULL,
  `syndrome_id` INT NULL,
  `gender` ENUM("M", "F") NOT NULL,
  `date_of_diagnosis` DATE NULL,
  PRIMARY KEY (`PT_ID`),
  INDEX `syndrome_id_idx` (`syndrome_id` ASC) VISIBLE,
  CONSTRAINT `syndrome_id`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `DIA42-Exercise`.`table1` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DIA42-Exercise`.`DNA sample`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DIA42-Exercise`.`DNA sample` (
  `sample_ID` INT UNSIGNED NOT NULL,
  `PT_ID` INT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` VARCHAR(45) NULL,
  PRIMARY KEY (`sample_ID`),
  INDEX `name_idx` (`PT_ID` ASC) VISIBLE,
  CONSTRAINT `PT_ID`
    FOREIGN KEY (`PT_ID`)
    REFERENCES `DIA42-Exercise`.`sample patient` (`PT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
