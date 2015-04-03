SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mybank` DEFAULT CHARACTER SET utf8 ;
USE `mybank` ;

-- -----------------------------------------------------
-- Table `mybank`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `cedula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`transferencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`transferencias` (
  `idtransferencias` INT NOT NULL AUTO_INCREMENT,
  `clientes_idclientes_transferencias` INT NOT NULL,
  `cuenta_origen` INT(20) NOT NULL,
  `cuenta_destino` INT(20) NOT NULL,
  PRIMARY KEY (`idtransferencias`),
  INDEX `fk_transferencias_clientes_idx` (`clientes_idclientes_transferencias` ASC),
  UNIQUE INDEX `clientes_idclientes_UNIQUE` (`clientes_idclientes_transferencias` ASC),
  CONSTRAINT `fk_transferencias_clientes`
    FOREIGN KEY (`clientes_idclientes_transferencias`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mybank` ;

-- -----------------------------------------------------
-- Table `mybank`.`cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`cuentas` (
  `idcuentas` INT NOT NULL AUTO_INCREMENT,
  `numero_de_cuentas` INT NOT NULL,
  `tipo_de_cuenta` VARCHAR(45) NOT NULL,
  `tipo_de_cuenta2` VARCHAR(45) NOT NULL,
  `tipo_de_cuenta3` VARCHAR(45) NOT NULL,
  `clientes_idclientes_cuentas` INT NOT NULL,
  PRIMARY KEY (`idcuentas`),
  INDEX `fk_cuentas_clientes_idx` (`clientes_idclientes_cuentas` ASC),
  UNIQUE INDEX `clientes_idclientes_UNIQUE` (`clientes_idclientes_cuentas` ASC),
  CONSTRAINT `fk_cuentas_clientes`
    FOREIGN KEY (`clientes_idclientes_cuentas`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`depositos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`depositos` (
  `iddepositos` INT NOT NULL AUTO_INCREMENT,
  `clientes_idclientes_depositos` INT NOT NULL,
  `numero_de_deposito` INT(2) NOT NULL,
  `tipo_de_pago` VARCHAR(10) NOT NULL,
  `cuenta_destino` INT(20) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `monto` INT NOT NULL,
  PRIMARY KEY (`iddepositos`),
  INDEX `fk_depositos_clientes1_idx` (`clientes_idclientes_depositos` ASC),
  UNIQUE INDEX `numero_de_deposito_UNIQUE` (`numero_de_deposito` ASC),
  UNIQUE INDEX `fecha_UNIQUE` (`fecha` ASC),
  CONSTRAINT `fk_depositos_clientes1`
    FOREIGN KEY (`clientes_idclientes_depositos`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`retiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`retiros` (
  `idretiros` INT NOT NULL AUTO_INCREMENT,
  `clientes_idclientes_retiros` INT NOT NULL,
  `retiros` INT(2) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idretiros`),
  INDEX `fk_retiros_clientes1_idx` (`clientes_idclientes_retiros` ASC),
  UNIQUE INDEX `retiros_UNIQUE` (`retiros` ASC),
  UNIQUE INDEX `fecha_UNIQUE` (`fecha` ASC),
  CONSTRAINT `fk_retiros_clientes1`
    FOREIGN KEY (`clientes_idclientes_retiros`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mybank`.`transferencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mybank`.`transferencias` (
  `idtransferencias` INT NOT NULL AUTO_INCREMENT,
  `clientes_idclientes_transferencias` INT NOT NULL,
  `numero_de_transferencia` INT(2) NOT NULL,
  `cuenta_destino` INT(20) NOT NULL,
  `cuenta_origen` INT(20) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `monto` INT NOT NULL,
  PRIMARY KEY (`idtransferencias`),
  INDEX `fk_transferencias_clientes1_idx` (`clientes_idclientes_transferencias` ASC),
  UNIQUE INDEX `numero_de_transferencia_UNIQUE` (`numero_de_transferencia` ASC),
  UNIQUE INDEX `fecha_UNIQUE` (`fecha` ASC),
  CONSTRAINT `fk_transferencias_clientes1`
    FOREIGN KEY (`clientes_idclientes_transferencias`)
    REFERENCES `mybank`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
