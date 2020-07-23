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
-- Table `mydb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie` (
  `mov_id` INT NOT NULL,
  `mov_title` VARCHAR(50) NOT NULL,
  `mov_year` INT NOT NULL,
  `mov_time` INT NOT NULL,
  `mov_lang` VARCHAR(50) NOT NULL,
  `mov_dt_rel` DATE NOT NULL,
  `mov_rel_country` CHAR(5) NOT NULL,
  PRIMARY KEY (`mov_id`),
  UNIQUE INDEX `mov_title_UNIQUE` (`mov_title` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reviewer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reviewer` (
  `rev_id` INT NOT NULL,
  `rev_name` CHAR(30) NOT NULL,
  PRIMARY KEY (`rev_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actor` (
  `actor_id` INT NOT NULL,
  `actor_fname` CHAR(20) NOT NULL,
  `actor_lname` CHAR(20) NOT NULL,
  `actor_gender` CHAR(1) NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genre` (
  `gen_id` INT NOT NULL,
  `gen_title` CHAR(20) NOT NULL,
  PRIMARY KEY (`gen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movie_cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie_cast` (
  `actor_actor_id` INT NOT NULL,
  `movie_mov_id` INT NOT NULL,
  `role` CHAR(30) NULL,
  PRIMARY KEY (`actor_actor_id`, `movie_mov_id`),
  INDEX `fk_movie_cast_actor_idx` (`actor_actor_id` ASC) VISIBLE,
  INDEX `fk_movie_cast_movie1_idx` (`movie_mov_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_cast_actor`
    FOREIGN KEY (`actor_actor_id`)
    REFERENCES `mydb`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_cast_movie1`
    FOREIGN KEY (`movie_mov_id`)
    REFERENCES `mydb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`director` (
  `dir_id` INT NOT NULL,
  `dir_fname` CHAR(20) NOT NULL,
  `dir_lname` CHAR(20) NOT NULL,
  PRIMARY KEY (`dir_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movie_has_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie_has_genre` (
  `movie_mov_id` INT NOT NULL,
  `genre_gen_id` INT NOT NULL,
  PRIMARY KEY (`movie_mov_id`, `genre_gen_id`),
  INDEX `fk_movie_has_genre_genre1_idx` (`genre_gen_id` ASC) VISIBLE,
  INDEX `fk_movie_has_genre_movie1_idx` (`movie_mov_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_has_genre_movie1`
    FOREIGN KEY (`movie_mov_id`)
    REFERENCES `mydb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_genre_genre1`
    FOREIGN KEY (`genre_gen_id`)
    REFERENCES `mydb`.`genre` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rating` (
  `rev_id` INT NOT NULL,
  `rev_stars` INT NOT NULL,
  `num_of_ratings` INT NOT NULL,
  `movie_mov_id` INT NOT NULL,
  `reviewer_rev_id` INT NOT NULL,
  PRIMARY KEY (`movie_mov_id`, `reviewer_rev_id`),
  INDEX `fk_rating_reviewer1_idx` (`reviewer_rev_id` ASC) VISIBLE,
  CONSTRAINT `fk_rating_movie1`
    FOREIGN KEY (`movie_mov_id`)
    REFERENCES `mydb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_reviewer1`
    FOREIGN KEY (`reviewer_rev_id`)
    REFERENCES `mydb`.`reviewer` (`rev_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`director_has_movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`director_has_movie` (
  `director_dir_id` INT NOT NULL,
  `movie_mov_id` INT NOT NULL,
  PRIMARY KEY (`director_dir_id`, `movie_mov_id`),
  INDEX `fk_director_has_movie_movie1_idx` (`movie_mov_id` ASC) VISIBLE,
  INDEX `fk_director_has_movie_director1_idx` (`director_dir_id` ASC) VISIBLE,
  CONSTRAINT `fk_director_has_movie_director1`
    FOREIGN KEY (`director_dir_id`)
    REFERENCES `mydb`.`director` (`dir_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_director_has_movie_movie1`
    FOREIGN KEY (`movie_mov_id`)
    REFERENCES `mydb`.`movie` (`mov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
