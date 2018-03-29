-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema analisis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema analisis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `analisis` DEFAULT CHARACTER SET utf8 ;
USE `analisis` ;

-- -----------------------------------------------------
-- Table `analisis`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis`.`Usuario` (
  `usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  `sexo` INT NOT NULL,
  `tipo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis`.`Oferta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis`.`Oferta` (
  `oferta` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NOT NULL,
  `descripcion` VARCHAR(3000) NOT NULL,
  `numeroPlazas` INT NOT NULL,
  `nivelExperiencia` INT NOT NULL,
  `salario` DECIMAL(9,2) NOT NULL,
  `vehiculo` INT NOT NULL,
  PRIMARY KEY (`oferta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis`.`ofertaUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis`.`ofertaUsuario` (
  `fecha` DATE NOT NULL,
  `Usuario_usuario` INT NOT NULL,
  `Oferta_oferta` INT NOT NULL,
  PRIMARY KEY (`Usuario_usuario`, `Oferta_oferta`),
  INDEX `fk_ofertaUsuario_Oferta1_idx` (`Oferta_oferta` ASC),
  CONSTRAINT `fk_ofertaUsuario_Usuario`
    FOREIGN KEY (`Usuario_usuario`)
    REFERENCES `analisis`.`Usuario` (`usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ofertaUsuario_Oferta1`
    FOREIGN KEY (`Oferta_oferta`)
    REFERENCES `analisis`.`Oferta` (`oferta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis`.`Empresa` (
  `empresa` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `areaEmpresarial` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis`.`UsuarioEmpresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis`.`UsuarioEmpresa` (
  `fechaIngreso` INT NOT NULL,
  `Usuario_usuario` INT NOT NULL,
  `Empresa_empresa` INT NOT NULL,
  PRIMARY KEY (`Usuario_usuario`, `Empresa_empresa`),
  INDEX `fk_UsuarioEmpresa_Empresa1_idx` (`Empresa_empresa` ASC),
  CONSTRAINT `fk_UsuarioEmpresa_Usuario1`
    FOREIGN KEY (`Usuario_usuario`)
    REFERENCES `analisis`.`Usuario` (`usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioEmpresa_Empresa1`
    FOREIGN KEY (`Empresa_empresa`)
    REFERENCES `analisis`.`Empresa` (`empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
