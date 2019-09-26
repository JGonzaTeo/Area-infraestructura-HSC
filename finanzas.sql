-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema finanzas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema finanzas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `finanzas` DEFAULT CHARACTER SET utf8 ;
USE `finanzas` ;

-- -----------------------------------------------------
-- Table `finanzas`.`tbl_tipoCuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_tipoCuenta` (
  `KidTipoCuenta` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipoCuenta` VARCHAR(25) NULL,
  `descripcion_tipoCuenta` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidTipoCuenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_cuentas` (
  `KidCuenta` INT NOT NULL AUTO_INCREMENT,
  `KidTipoCuenta` INT NOT NULL,
  `nombre` VARCHAR(25) NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidCuenta`, `KidTipoCuenta`),
  CONSTRAINT `fk_tbl_cuentas_contables_tbl_tipoCuentaContable1`
    FOREIGN KEY (`KidTipoCuenta`)
    REFERENCES `finanzas`.`tbl_tipoCuenta` (`KidTipoCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroDiario_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroDiario_Encabezado` (
  `KidLibroDiarioEncabezado` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `total_debe` FLOAT NULL,
  `total_haber` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidLibroDiarioEncabezado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroDiario_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroDiario_Detalle` (
  `KidLibroDiarioEncabezado` INT NOT NULL,
  `KidCuentaContable` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  PRIMARY KEY (`KidLibroDiarioEncabezado`, `KidCuentaContable`),
  CONSTRAINT `fk_tbl_libroDiario_Detalle_tbl_libroDiario_Encabezado`
    FOREIGN KEY (`KidLibroDiarioEncabezado`)
    REFERENCES `finanzas`.`tbl_libroDiario_Encabezado` (`KidLibroDiarioEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_libroDiario_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuentaContable`)
    REFERENCES `finanzas`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroMayor_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroMayor_Encabezado` (
  `KidLibroMayor` INT NOT NULL AUTO_INCREMENT,
  `KidLibroDiarioEncabezado` INT NOT NULL,
  `fecha` DATE NULL,
  `saldo_final` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidLibroMayor`, `KidLibroDiarioEncabezado`),
  CONSTRAINT `fk_tbl_libroMayor_tbl_libroDiario_Encabezado1`
    FOREIGN KEY (`KidLibroDiarioEncabezado`)
    REFERENCES `finanzas`.`tbl_libroDiario_Encabezado` (`KidLibroDiarioEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroMayor_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroMayor_Detalle` (
  `KidLibroMayor` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  `saldo_parcial` FLOAT NULL,
  PRIMARY KEY (`KidLibroMayor`),
  CONSTRAINT `fk_tbl_libroMayor_Detalle_tbl_libroMayor1`
    FOREIGN KEY (`KidLibroMayor`)
    REFERENCES `finanzas`.`tbl_libroMayor_Encabezado` (`KidLibroMayor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_BalanceGeneral_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_BalanceGeneral_Encabezado` (
  `KidBalanceGeneral` INT NOT NULL AUTO_INCREMENT,
  `capital` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidBalanceGeneral`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_estado_perdidas_ganancias_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_estado_perdidas_ganancias_Encabezado` (
  `KidPerdidasGanancias` INT NOT NULL AUTO_INCREMENT,
  `gananciaEnOperacion` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidPerdidasGanancias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_BalanceGeneral_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_BalanceGeneral_Detalle` (
  `KidBalanceGeneral` INT NOT NULL,
  `KidCuentaContable` INT NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`KidBalanceGeneral`, `KidCuentaContable`),
  CONSTRAINT `fk_tbl_BalanceGeneral_Detalle_tbl_BalanceGeneral_Encabezado1`
    FOREIGN KEY (`KidBalanceGeneral`)
    REFERENCES `finanzas`.`tbl_BalanceGeneral_Encabezado` (`KidBalanceGeneral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_BalanceGeneral_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuentaContable`)
    REFERENCES `finanzas`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_presupuesto_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_presupuesto_Encabezado` (
  `Kidpresupuesto` INT NOT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(300) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`Kidpresupuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_presupuesto_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_presupuesto_detalle` (
  `Kidpresupuesto` INT NOT NULL,
  `KidCuenta` INT NOT NULL,
  `cantidad` INT NULL,
  `monto` DOUBLE NULL,
  PRIMARY KEY (`Kidpresupuesto`),
  CONSTRAINT `fk_tbl_presupuesto_detalle_tbl_presupuesto_Encabezado1`
    FOREIGN KEY (`Kidpresupuesto`)
    REFERENCES `finanzas`.`tbl_presupuesto_Encabezado` (`Kidpresupuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_presupuesto_detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_bancos` (
  `KidBanco` INT NOT NULL,
  `nombre_banco` VARCHAR(45) NULL,
  `descipcion_banco` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidBanco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_cuenta_bancaria_encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_cuenta_bancaria_encabezado` (
  `Kidcuenta_bancaria` INT NOT NULL,
  `Kidbanco` INT NULL,
  `numero_cuenta_bancaria` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `saldo` DOUBLE NULL,
  `saldo_anterior` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`Kidcuenta_bancaria`),
  CONSTRAINT `fk_tbl_cuenta_bancaria_encabezado_tbl_bancos1`
    FOREIGN KEY (`Kidbanco`)
    REFERENCES `finanzas`.`tbl_bancos` (`KidBanco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_conceptos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_conceptos` (
  `PK_id_concepto` INT NOT NULL,
  `nombre_concepto` VARCHAR(45) NULL,
  `naturaleza_concepto` INT NULL,
  `estado_concepto` TINYINT NULL,
  PRIMARY KEY (`PK_id_concepto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_cuenta_bancaria_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_cuenta_bancaria_detalle` (
  `Kidcuentabancaria` INT NOT NULL,
  `KidCuenta` INT NOT NULL,
  `importe_concepto` DOUBLE NULL,
  PRIMARY KEY (`Kidcuentabancaria`),
  CONSTRAINT `fk_tbl_cuenta_bancaria_detalle_tbl_cuenta_bancaria_encabezado1`
    FOREIGN KEY (`Kidcuentabancaria`)
    REFERENCES `finanzas`.`tbl_cuenta_bancaria_encabezado` (`Kidcuenta_bancaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cuenta_bancaria_detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_estado_perdidas_ganacias_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_estado_perdidas_ganacias_Detalle` (
  `KidPerdidasGanancias` INT NOT NULL,
  `KidCuenta` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  PRIMARY KEY (`KidPerdidasGanancias`),
  CONSTRAINT `fk_tbl_estado_perdidas_ganacias_Detalle_tbl_estado_perdidas_g1`
    FOREIGN KEY (`KidPerdidasGanancias`)
    REFERENCES `finanzas`.`tbl_estado_perdidas_ganancias_Encabezado` (`KidPerdidasGanancias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_estado_perdidas_ganacias_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_flujoEfectivo_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_flujoEfectivo_Encabezado` (
  `KidFlujoEfectivo` INT NOT NULL AUTO_INCREMENT,
  `total_efectivo` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidFlujoEfectivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_flujoEfectivo_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_flujoEfectivo_Detalle` (
  `KidFlujoEfectivo` INT NOT NULL,
  `KidCuenta` INT NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`KidFlujoEfectivo`, `KidCuenta`),
  CONSTRAINT `fk_tbl_flujoEfectivo_Detalle_tbl_flujoEfectivo_Encabezado1`
    FOREIGN KEY (`KidFlujoEfectivo`)
    REFERENCES `finanzas`.`tbl_flujoEfectivo_Encabezado` (`KidFlujoEfectivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_flujoEfectivo_Detalle_tbl_cuentas1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;