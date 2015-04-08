SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `facturas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `facturas` ;

-- -----------------------------------------------------
-- Table `facturas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturas`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `identificacion` INT NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `años_servicio` VARCHAR(45) NOT NULL,
  `telefono_personal` INT NOT NULL,
  `telefono_local` INT NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturas`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `contenido_neto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `facturas`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `facturas`.`facturas` (
  `idfacturas` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `tipo_de_pago` VARCHAR(45) NOT NULL,
  `rif` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `zona_postal` INT NOT NULL,
  `clientes_id_clientes` INT NOT NULL,
  `productos_id_productos` INT NOT NULL,
  PRIMARY KEY (`idfacturas`),
  INDEX `fk_facturas_clientes_idx` (`clientes_id_clientes` ASC),
  INDEX `fk_facturas_productos1_idx` (`productos_id_productos` ASC),
  CONSTRAINT `fk_facturas_clientes`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `facturas`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_productos1`
    FOREIGN KEY (`productos_id_productos`)
    REFERENCES `facturas`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
