-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Proveedor` (
  `Kid_proveedor` INT NOT NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `edad` INT NULL,
  `genero` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `dpi` VARCHAR(45) NULL,
  `nit` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_proveedor`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Categoria` (
  `Kid_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `tipoProducto` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_categoria`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Producto` (
  `Kid_producto` INT NOT NULL,
  `Kid_proveedor` INT NOT NULL,
  `Kid_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `precio` DOUBLE NULL,
  `saldo` DOUBLE NULL,
  `cantidadMaxima` VARCHAR(45) NULL,
  `cantidadMinima` VARCHAR(45) NULL,
  `comentarios` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_producto`));


-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Impuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Impuesto` (
  `Kid_impuesto` INT NOT NULL,
  `Kid_producto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `tasa` DECIMAL(5) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_impuesto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Stock` (
  `Kid_stock` INT NOT NULL,
  `cantidadMaxima` INT NULL,
  `cantidadMinima` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_stock`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Marca` (
  `Kid_marca` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `paisOrigen` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_marca`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Producto` (
  `Kid_detalle_producto` INT NOT NULL,
  `Kid_producto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `presentacion` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_detalle_producto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Ubicacion` (
  `Kid_ubicacion` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `capacidad` INT(10) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_ubicacion`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Producto_Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Producto_Marca` (
  `Kid_producto` INT NOT NULL,
  `Kid_marca` INT NOT NULL,
  PRIMARY KEY (`Kid_producto`, `Kid_marca`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_UbicacionProdcuto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_UbicacionProdcuto` (
  `Kid_ubicacion` INT NOT NULL,
  `Kid_producto` INT NOT NULL,
  PRIMARY KEY (`Kid_ubicacion`, `Kid_producto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Moviemiento_Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Moviemiento_Inventario` (
  `Kid_moviemiento_inventario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `naturaleza` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_moviemiento_inventario`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Sucursal` (
  `Kid_sucursal` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_sucursal`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Bodega` (
  `Kid_bodega` INT NOT NULL,
  `Kid_sucursal` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_bodega`, `Kid_sucursal`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Historia_Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Historia_Inventario` (
  `Kid_producto` INT NOT NULL,
  `Kid_movimiento_inventario` INT NOT NULL,
  `Kid_bodega` INT NOT NULL,
  `Kid_sucursal` INT NOT NULL,
  `fecha` DATETIME NULL,
  `cantidad` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_producto`, `Kid_movimiento_inventario`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Existencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Existencia` (
  `Kid_existencia` INT NOT NULL,
  `kid_producto` INT NOT NULL,
  `cantidad` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_existencia`, `kid_producto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Inventario` (
  `Kid_bodega` INT NOT NULL,
  `Kid_producto` INT NOT NULL,
  `Kid_stock` INT NOT NULL,
  `Kid_existencia` INT NOT NULL,  
  `cantidad` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_bodega`, `Kid_producto`, `Kid_stock`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;