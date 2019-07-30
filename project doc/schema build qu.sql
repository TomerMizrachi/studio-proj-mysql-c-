-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema studio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema studio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `studio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `studio` ;

-- -----------------------------------------------------
-- Table `studio`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`album` (
  `album_id` INT(11) NOT NULL AUTO_INCREMENT,
  `album_name` VARCHAR(45) NOT NULL,
  `num_of_song` INT(11) NULL DEFAULT NULL,
  `rec_s_date` DATE NULL DEFAULT NULL,
  `rec_e_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE INDEX `album_name_UNIQUE` (`album_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`producer` (
  `producer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pro_f_n` VARCHAR(45) NOT NULL,
  `pro_l_n` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`producer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`album_has_producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`album_has_producer` (
  `album_album_id` INT(11) NOT NULL,
  `producer_producer_id` INT(11) NOT NULL,
  PRIMARY KEY (`album_album_id`),
  INDEX `fk_album_has_producer_album1_idx` (`album_album_id` ASC) VISIBLE,
  INDEX `fk_album_has_producer_producer1_idx` (`producer_producer_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_has_producer_album1`
    FOREIGN KEY (`album_album_id`)
    REFERENCES `studio`.`album` (`album_id`),
  CONSTRAINT `fk_album_has_producer_producer1`
    FOREIGN KEY (`producer_producer_id`)
    REFERENCES `studio`.`producer` (`producer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`technician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`technician` (
  `tech_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tech_f_name` VARCHAR(45) NOT NULL,
  `tech_l_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tech_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`song` (
  `song_name` VARCHAR(45) NOT NULL,
  `rec_date` DATE NOT NULL,
  `aut_f_name` VARCHAR(45) NULL DEFAULT NULL,
  `aut_l_name` VARCHAR(45) NULL DEFAULT NULL,
  `comp_f_name` VARCHAR(45) NULL DEFAULT NULL,
  `comp_l_name` VARCHAR(45) NULL DEFAULT NULL,
  `length_sec` INT(11) NULL DEFAULT NULL,
  `genre` VARCHAR(45) NULL DEFAULT NULL,
  `fk_tech_id` INT(11) NOT NULL,
  PRIMARY KEY (`song_name`, `rec_date`),
  INDEX `fk_tech_id` (`fk_tech_id` ASC) VISIBLE,
  CONSTRAINT `song_ibfk_1`
    FOREIGN KEY (`fk_tech_id`)
    REFERENCES `studio`.`technician` (`tech_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '				';


-- -----------------------------------------------------
-- Table `studio`.`album_has_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`album_has_song` (
  `album_album_id` INT(11) NOT NULL,
  `song_song_name` VARCHAR(45) NOT NULL,
  `song_rec_date` DATE NOT NULL,
  PRIMARY KEY (`album_album_id`),
  INDEX `fk_album_has_song_album1_idx` (`album_album_id` ASC) VISIBLE,
  INDEX `fk_album_has_song_song1_idx` (`song_song_name` ASC, `song_rec_date` ASC) VISIBLE,
  CONSTRAINT `fk_album_has_song_album1`
    FOREIGN KEY (`album_album_id`)
    REFERENCES `studio`.`album` (`album_id`),
  CONSTRAINT `fk_album_has_song_song1`
    FOREIGN KEY (`song_song_name` , `song_rec_date`)
    REFERENCES `studio`.`song` (`song_name` , `rec_date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`instrument`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`instrument` (
  `instrument_id` INT(11) NOT NULL AUTO_INCREMENT,
  `inst_type` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`instrument_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`musician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`musician` (
  `musician_id` INT(11) NOT NULL AUTO_INCREMENT,
  `mus_f_name` VARCHAR(45) NOT NULL,
  `mus_l_name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `st_num` INT(11) NULL DEFAULT NULL,
  `phone_num` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`musician_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`musician_has_instrument`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`musician_has_instrument` (
  `musician_musician_id` INT(11) NOT NULL,
  `instrument_instrument_id` INT(11) NOT NULL,
  INDEX `fk_musician_has_instrument_musician1_idx` (`musician_musician_id` ASC) VISIBLE,
  INDEX `fk_musician_has_instrument_instrument1_idx` (`instrument_instrument_id` ASC) VISIBLE,
  CONSTRAINT `fk_musician_has_instrument_instrument1`
    FOREIGN KEY (`instrument_instrument_id`)
    REFERENCES `studio`.`instrument` (`instrument_id`),
  CONSTRAINT `fk_musician_has_instrument_musician1`
    FOREIGN KEY (`musician_musician_id`)
    REFERENCES `studio`.`musician` (`musician_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `studio`.`song_has_musician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `studio`.`song_has_musician` (
  `song_song_name` VARCHAR(45) NOT NULL,
  `song_rec_date` DATE NOT NULL,
  `musician_musician_id` INT(11) NOT NULL,
  PRIMARY KEY (`song_song_name`, `song_rec_date`),
  INDEX `fk_song_has_musician_song1_idx` (`song_song_name` ASC, `song_rec_date` ASC) VISIBLE,
  INDEX `fk_song_has_musician_musician1_idx` (`musician_musician_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_has_musician_musician1`
    FOREIGN KEY (`musician_musician_id`)
    REFERENCES `studio`.`musician` (`musician_id`),
  CONSTRAINT `fk_song_has_musician_song1`
    FOREIGN KEY (`song_song_name` , `song_rec_date`)
    REFERENCES `studio`.`song` (`song_name` , `rec_date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
