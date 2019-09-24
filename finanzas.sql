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
  `K_idTipoCuenta` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipoCuenta` VARCHAR(25) NULL,
  `descripcion_tipoCuenta` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idTipoCuenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_cuentas` (
  `K_idCuenta` INT NOT NULL AUTO_INCREMENT,
  `K_idTipoCuenta` INT NOT NULL,
  `nombre` VARCHAR(25) NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idCuenta`, `K_idTipoCuenta`),
  CONSTRAINT `fk_tbl_cuentas_contables_tbl_tipoCuentaContable1`
    FOREIGN KEY (`K_idTipoCuenta`)
    REFERENCES `finanzas`.`tbl_tipoCuenta` (`K_idTipoCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroDiario_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroDiario_Encabezado` (
  `K_idLibroDiarioEncabezado` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `total_debe` FLOAT NULL,
  `total_haber` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idLibroDiarioEncabezado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroDiario_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroDiario_Detalle` (
  `K_idLibroDiarioEncabezado` INT NOT NULL,
  `K_idCuentaContable` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  PRIMARY KEY (`K_idLibroDiarioEncabezado`, `K_idCuentaContable`),
  CONSTRAINT `fk_tbl_libroDiario_Detalle_tbl_libroDiario_Encabezado`
    FOREIGN KEY (`K_idLibroDiarioEncabezado`)
    REFERENCES `finanzas`.`tbl_libroDiario_Encabezado` (`K_idLibroDiarioEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_libroDiario_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`K_idCuentaContable`)
    REFERENCES `finanzas`.`tbl_cuentas` (`K_idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroMayor_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroMayor_Encabezado` (
  `K_idLibroMayor` INT NOT NULL AUTO_INCREMENT,
  `K_idLibroDiarioEncabezado` INT NOT NULL,
  `fecha` DATE NULL,
  `saldo_final` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idLibroMayor`, `K_idLibroDiarioEncabezado`),
  CONSTRAINT `fk_tbl_libroMayor_tbl_libroDiario_Encabezado1`
    FOREIGN KEY (`K_idLibroDiarioEncabezado`)
    REFERENCES `finanzas`.`tbl_libroDiario_Encabezado` (`K_idLibroDiarioEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_libroMayor_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_libroMayor_Detalle` (
  `K_idLibroMayor` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  `saldo_parcial` FLOAT NULL,
  PRIMARY KEY (`K_idLibroMayor`),
  CONSTRAINT `fk_tbl_libroMayor_Detalle_tbl_libroMayor1`
    FOREIGN KEY (`K_idLibroMayor`)
    REFERENCES `finanzas`.`tbl_libroMayor_Encabezado` (`K_idLibroMayor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_BalanceGeneral_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_BalanceGeneral_Encabezado` (
  `K_idBalanceGeneral` INT NOT NULL AUTO_INCREMENT,
  `capital` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idBalanceGeneral`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_estado_perdidas_ganancias_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_estado_perdidas_ganancias_Encabezado` (
  `K_idPerdidasGanancias` INT NOT NULL AUTO_INCREMENT,
  `gananciaEnOperacion` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idPerdidasGanancias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_BalanceGeneral_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_BalanceGeneral_Detalle` (
  `K_idBalanceGeneral` INT NOT NULL,
  `K_idCuentaContable` INT NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`K_idBalanceGeneral`, `K_idCuentaContable`),
  CONSTRAINT `fk_tbl_BalanceGeneral_Detalle_tbl_BalanceGeneral_Encabezado1`
    FOREIGN KEY (`K_idBalanceGeneral`)
    REFERENCES `finanzas`.`tbl_BalanceGeneral_Encabezado` (`K_idBalanceGeneral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_BalanceGeneral_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`K_idCuentaContable`)
    REFERENCES `finanzas`.`tbl_cuentas` (`K_idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_presupuesto_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_presupuesto_Encabezado` (
  `K_id_presupuesto` INT NOT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(300) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_id_presupuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_presupuesto_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_presupuesto_detalle` (
  `K_id_presupuesto` INT NOT NULL,
  `K_idCuenta` INT NOT NULL,
  `cantidad` INT NULL,
  `monto` DOUBLE NULL,
  PRIMARY KEY (`K_id_presupuesto`),
  CONSTRAINT `fk_tbl_presupuesto_detalle_tbl_presupuesto_Encabezado1`
    FOREIGN KEY (`K_id_presupuesto`)
    REFERENCES `finanzas`.`tbl_presupuesto_Encabezado` (`K_id_presupuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_presupuesto_detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`K_idCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`K_idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_bancos` (
  `K_idBanco` INT NOT NULL,
  `nombre_banco` VARCHAR(45) NULL,
  `descipcion_banco` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idBanco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_cuenta_bancaria_encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_cuenta_bancaria_encabezado` (
  `K_id_cuenta_bancaria` INT NOT NULL,
  `K_id_banco` INT NULL,
  `numero_cuenta_bancaria` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `saldo` DOUBLE NULL,
  `saldo_anterior` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_id_cuenta_bancaria`),
  CONSTRAINT `fk_tbl_cuenta_bancaria_encabezado_tbl_bancos1`
    FOREIGN KEY (`K_id_banco`)
    REFERENCES `finanzas`.`tbl_bancos` (`K_idBanco`)
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
  `K_id_cuenta_bancaria` INT NOT NULL,
  `K_idCuenta` INT NOT NULL,
  `importe_concepto` DOUBLE NULL,
  PRIMARY KEY (`K_id_cuenta_bancaria`),
  CONSTRAINT `fk_tbl_cuenta_bancaria_detalle_tbl_cuenta_bancaria_encabezado1`
    FOREIGN KEY (`K_id_cuenta_bancaria`)
    REFERENCES `finanzas`.`tbl_cuenta_bancaria_encabezado` (`K_id_cuenta_bancaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cuenta_bancaria_detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`K_idCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`K_idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_estado_perdidas_ganacias_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_estado_perdidas_ganacias_Detalle` (
  `K_idPerdidasGanancias` INT NOT NULL,
  `K_idCuenta` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  PRIMARY KEY (`K_idPerdidasGanancias`),
  CONSTRAINT `fk_tbl_estado_perdidas_ganacias_Detalle_tbl_estado_perdidas_g1`
    FOREIGN KEY (`K_idPerdidasGanancias`)
    REFERENCES `finanzas`.`tbl_estado_perdidas_ganancias_Encabezado` (`K_idPerdidasGanancias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_estado_perdidas_ganacias_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`K_idCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`K_idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_flujoEfectivo_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_flujoEfectivo_Encabezado` (
  `K_idFlujoEfectivo` INT NOT NULL AUTO_INCREMENT,
  `total_efectivo` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`K_idFlujoEfectivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finanzas`.`tbl_flujoEfectivo_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finanzas`.`tbl_flujoEfectivo_Detalle` (
  `K_idFlujoEfectivo` INT NOT NULL,
  `K_idCuenta` INT NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`K_idFlujoEfectivo`, `K_idCuenta`),
  CONSTRAINT `fk_tbl_flujoEfectivo_Detalle_tbl_flujoEfectivo_Encabezado1`
    FOREIGN KEY (`K_idFlujoEfectivo`)
    REFERENCES `finanzas`.`tbl_flujoEfectivo_Encabezado` (`K_idFlujoEfectivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_flujoEfectivo_Detalle_tbl_cuentas1`
    FOREIGN KEY (`K_idCuenta`)
    REFERENCES `finanzas`.`tbl_cuentas` (`K_idCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;