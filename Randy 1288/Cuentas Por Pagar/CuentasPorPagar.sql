-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cuentasporpagarBD
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `cuentasporpagarBD` DEFAULT CHARACTER SET utf8;
USE `cuentasporpagarBD`;

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_Acreedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_Acreedor` (
  `KidAcreedor` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidAcreedor`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_Banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_Banco` (
  `KidBanco` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidBanco`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_Impuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_Impuesto` (
  `KidImpuesto` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `porcentaje` VARCHAR(5) NULL DEFAULT 'S',
  `valor` DOUBLE(6,2) NULL DEFAULT '0.00',
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidImpuesto`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_OrdenCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_OrdenCompra` (
  `KidOrdenCompra` INT(12) NOT NULL,
  `KidImpuesto` INT(12) NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidOrdenCompra`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_Proveedor` (
  `KidProveedor` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidProveedor`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_Pedido` (
  `KidPedido` INT(12) NOT NULL,
  `KidProveedor` INT(12) NOT NULL,
  `KidOrdenCompra` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPedido`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_CreditoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_CreditoPedido` (
  `KidCreditoPedido` INT(12) NOT NULL,
  `KidPedido` INT(12) NOT NULL,
  `KidBanco` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `cuotas` INT(2) NOT NULL,
  `fechaIni` TIMESTAMP NULL DEFAULT NULL,
  `fechaFin` TIMESTAMP NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCreditoPedido`));


-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_CredPedDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_CredPedDet` (
  `KidCodigoCresDet` INT(12) NOT NULL,
  `KidCreditoPedido` INT(12) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCodigoCresDet`, `KidCreditoPedido`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_Servicio` (
  `KidServicio` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidServicio`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_PagoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_PagoServicio` (
  `KidPagoServicio` INT(12) NOT NULL,
  `KidAcreedor` INT(12) NOT NULL,
  `KidServicio` INT(12) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `impuesto` INT(12) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPagoServicio`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_CreditoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_CreditoServicio` (
  `KidCreditoServicio` INT(12) NOT NULL,
  `KidPagoServicio` INT(12) NOT NULL,
  `KidBanco` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `cuotas` INT(2) NOT NULL,
  `fechaIni` TIMESTAMP NULL DEFAULT NULL,
  `fechaFin` TIMESTAMP NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCreditoServicio`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_CredServDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_CredServDet` (
  `KidCredServDet` INT(12) NOT NULL,
  `KidCreditoServicio` INT(12) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCredServDet`, `KidCreditoServicio`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_Producto` (
  `KidProducto` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `tipoProducto` INT(3) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`KidProducto`));

-- -----------------------------------------------------
-- Table `cuentasporpagarBD`.`Tbl_PedidoDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cuentasporpagarBD`.`Tbl_PedidoDet` (
  `KidPedido` INT(12) NOT NULL,
  `KidProducto` INT(12) NOT NULL,
  `cantidad` INT(3) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPedido`, `KidProducto`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;