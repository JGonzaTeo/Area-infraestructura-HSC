-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mdl_cuentasporpagar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mdl_cuentasporpagar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mdl_cuentasporpagar` DEFAULT CHARACTER SET utf8 ;
USE `mdl_cuentasporpagar` ;

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_Acreedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_Acreedor` (
  `Kid_acreedor` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_acreedor`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_Banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_Banco` (
  `Kid_banco` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_banco`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_Impuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_Impuesto` (
  `Kid_impuesto` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `porcentaje` VARCHAR(5) NULL DEFAULT 'S',
  `valor` DOUBLE(6,2) NULL DEFAULT '0.00',
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_impuesto`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_OrdenCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_OrdenCompra` (
  `Kid_orden_compra` INT(12) NOT NULL,
  `impuesto` INT(12) NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_orden_compra`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_Proveedor` (
  `Kid_proveedor` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_proveedor`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_Pedido` (
  `Kid_pedido` INT(12) NOT NULL,
  `proveedor` INT(12) NOT NULL,
  `ordenCompra` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_pedido`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_CreditoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_CreditoPedido` (
  `Kid_Credito_Pedido` INT(12) NOT NULL,
  `pedido` INT(12) NOT NULL,
  `banco` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `cuotas` INT(2) NOT NULL,
  `fechaIni` TIMESTAMP NULL DEFAULT NULL,
  `fechaFin` TIMESTAMP NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_Credito_Pedido`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_CredPedDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_CredPedDet` (
  `K_Credito` INT(12) NOT NULL,
  `Kcodigo_Cres_Det` INT(12) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kcodigo_Cres_Det`, `K_Credito`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_Servicio` (
  `Kid_servicio` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_servicio`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_PagoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_PagoServicio` (
  `Kid_pago_servicio` INT(12) NOT NULL,
  `acreedor` INT(12) NOT NULL,
  `servicio` INT(12) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `impuesto` INT(12) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_pago_servicio`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_CreditoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_CreditoServicio` (
  `Kid_credito_servicio` INT(12) NOT NULL,
  `pagoServicio` INT(12) NOT NULL,
  `banco` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `cuotas` INT(2) NOT NULL,
  `fechaIni` TIMESTAMP NULL DEFAULT NULL,
  `fechaFin` TIMESTAMP NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_credito_servicio`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_CredServDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_CredServDet` (
  `Kid_credito` INT(12) NOT NULL,
  `Kid_cred_det` INT(12) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_cred_det`, `Kid_credito`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_Producto` (
  `Kid_producto` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `tipoProducto` INT(3) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Kid_producto`));

-- -----------------------------------------------------
-- Table `mdl_cuentasporpagar`.`Tbl_PedidoDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdl_cuentasporpagar`.`Tbl_PedidoDet` (
  `Kid_pedido` INT(12) NOT NULL,
  `Kid_producto` INT(12) NOT NULL,
  `cantidad` INT(3) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_pedido`, `Kid_producto`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;