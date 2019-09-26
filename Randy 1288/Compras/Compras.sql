-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema comprasBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `TblSucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_sucursal` (
  `KidSucursal` INT(16) NOT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidSucursal`));

-- -----------------------------------------------------
-- Table `TblBodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_bodega` (
  `KidBodega` INT(16) NOT NULL,
  `KidSucursal` INT(16) NOT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `direccion` VARCHAR(20) NULL DEFAULT NULL,
  `maxStock` INT(3) NULL DEFAULT NULL,
  `minStock` INT(3) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidBodega`));

-- -----------------------------------------------------
-- Table `TblProveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_proveedor` (
  `KidProveedor` INT(16) NULL DEFAULT NULL,
  `KidContacto` INT(16) NULL DEFAULT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `direccion` VARCHAR(20) NULL DEFAULT NULL,
  `pagina` VARCHAR(20) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1', 
  PRIMARY KEY (`KidProveedor`));

-- -----------------------------------------------------
-- Table `TblContacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_contacto` (
  `KidContacto` INT(16) NOT NULL,
  `KidProveedor` INT(16) NOT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(20) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidContacto`));

-- -----------------------------------------------------
-- Table `TblOrdenCompraEncabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_orden_compra_encabezado` (
  `KidOrdenCompraEncabezado` INT(16) NOT NULL,
  `KidProveedor` INT(16) NOT NULL,
  `fechaEmisionOrdenCompraEncabezado` DATE NOT NULL,
  `fechaRevisionOrdenCompraEncabezado` DATE NOT NULL,
  `nombreOrdenCompraEncabezado` VARCHAR(30) NULL DEFAULT NULL,
  `descripcionOrdenCompraEncabezado` VARCHAR(100) NULL DEFAULT NULL,
  `fechaEstimadaEntregaOrdenCompraEncabezado` DATETIME NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidOrdenCompraEncabezado`));

-- -----------------------------------------------------
-- Table `Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_Producto` (
  `KidProducto` INT(16) NOT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidProducto`));

-- -----------------------------------------------------
-- Table `TblOrdenCompraDetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_orden_dompra_detalle` (
  `KidOrdenCompraDetalle` INT(16) NOT NULL,
  `KidOrdenCompraEncabezado` INT(16) NOT NULL,
  `KidProducto` INT(16) NOT NULL,
  `precioUnitario` FLOAT(4,2) NULL DEFAULT NULL,
  `cantidadProducto` INT(3) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidOrdenCompraDetalle`, `KidOrdenCompraEncabezado`, `KidProducto`));

-- -----------------------------------------------------
-- Table `TblProveedorBodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TblProveedorBodega` (
  `KidProveedorBodega` INT(16) NOT NULL,
  `KidProveedor` INT(16) NOT NULL,
  `KidBodega` INT(16) NOT NULL,
  `KidProducto` INT(16) NOT NULL,
  `stock` INT(3) NULL DEFAULT NULL,
  `maxStock` INT(3) NULL DEFAULT NULL,
  `minStock` INT(3) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidProveedorBodega`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;