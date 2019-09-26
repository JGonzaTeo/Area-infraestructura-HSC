-- MySQL Workbench Forward ering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hoteleriaBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hoteleriaBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hoteleriaBD` DEFAULT CHARACTER SET utf8 ;
USE `hoteleriaBD` ;

-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Tipo_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Tipo_Habitacion` (
  `KidTipoHabitacion` VARCHAR(45) NOT NULL,
  `numeroCamas` INT NULL,
  `numeroAmbientes` INT NULL,
  `numeroPersonas` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidTipoHabitacion`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Categorias_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Categorias_Habitacion` (
  `KidCategoria` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCategoria`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Habitaciones` (
  `KidNumeroHabitacion` INT NOT NULL,
  `KidTipoHabitacion` VARCHAR(45) NULL,
  `KidCategoria` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroHabitacion`),
  INDEX `tipo` (`KidTipoHabitacion` ASC),
  INDEX `categoria` (`KidCategoria` ASC))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Clientes` (
  `KidCliente` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCliente`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Puestos` (
  `KidPuesto` INT NOT NULL,
  `nombrePuesto` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPuesto`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Empleados` (
  `KidEmpleado` INT NOT NULL,
  `KidPuesto` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `estadoCivil` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidEmpleado`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Reservaciones` (
  `KidReservacion` INT NOT NULL,
  `KidCliente` INT NULL,
  `KidEmpleado` INT NULL,
  `fechaReservacion` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidReservacion`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Detalle_Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Detalle_Reservacion` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidReservacion` INT NULL,
  `KidNumeroHabitacion` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroDetalle`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Folios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Folios` (
  `KidFolio` INT NOT NULL,
  `KidCliente` INT NULL,
  `fechaApertura` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidFolio`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Areas` (
  `KidArea` INT NOT NULL,
  `nombreArea` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidArea`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Servicios` (
  `KidServicio` INT NOT NULL,
  `KidArea` INT NULL,
  `nombreServicio` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidServicio`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Comandas` (
  `KidNumeroComanda` INT NOT NULL,
  `KidServicio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroComanda`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Detalle_Folio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Detalle_Folio` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidFolio` INT NULL,
  `KidComanda` INT NULL,
  `fecha` DATE NULL,
  `monto` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroDetalle`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Eventos` (
  `KidEvento` INT NOT NULL,
  `KidCliente` INT NULL,
  `KidEmpleado` INT NULL,
  `fechaEvento` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidEvento`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Salones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Salones` (
  `KidNumeroSalon` INT NOT NULL,
  `capacidad` INT NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroSalon`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Detalle_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Detalle_Evento` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidNumeroSalon` INT NULL,
  `KidEvento` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `requisitos` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroDetalle`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Quejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Quejas` (
  `KidQueja` INT NOT NULL,
  `KidCliente` INT NULL,
  `fecha` DATE NULL,
  `queja` TEXT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidQueja`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Objetos_Perdidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Objetos_Perdidos` (
  `KidObjeto` INT NOT NULL,
  `KidNumeroHabitacion` INT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidObjeto`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Check_In`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Check_In` (
  `KidCheckIn` INT NOT NULL,
  `KidCliente` INT NULL,
  `KidEmpleado` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCheckIn`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Check_Out`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Check_Out` (
  `KidCheckOut` INT NOT NULL,
  `KidCliente` INT NULL,
  `KidEmpleado` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCheckOut`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Mesas` (
  `KidNumeroMesa` INT NOT NULL,
  `KidArea` INT NULL,
  `capacidad` INT NULL,
  `estadoMesa` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroMesa`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Tiendas` (
  `KidTienda` INT NOT NULL,
  `KidArea` INT NULL,
  `descripcion` TEXT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidTienda`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Recetas` (
  `KidRecetas` INT NULL,
  `receta` VARCHAR(500) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidRecetas`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Producto` (
  `KidProducto` INT NOT NULL,
  `KidRecetas` INT NOT NULL,
  `KidTienda` INT NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidProducto`, `KidRecetas`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Bodegas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Bodegas` (
  `KidBodega` INT NOT NULL,
  `nombreBodega` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidBodega`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Existencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Existencias` (
  `KidExistencia` INT NOT NULL,
  `KidProducto` INT NULL,
  `KidBodega` INT NULL,
  `existencia` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidExistencia`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Control_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Control_Mesas` (
  `KidControl` INT NOT NULL,
  `KidNumeroMesa` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidControl`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Menus` (
  `KidMenu` INT NOT NULL,
  `nombreMenu` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidMenu`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Platillos` (
  `KidPlatillo` INT NOT NULL,
  `KidMenu` INT NULL,
  `nombrePlatillo` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPlatillo`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Detalle_Control`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Detalle_Control` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidControl` INT NULL,
  `KidPlatillo` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidNumeroDetalle`))
 ;


-- -----------------------------------------------------
-- Table `hoteleriaBD`.`Tbl_Devoluciones_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleriaBD`.`Tbl_Devoluciones_Platillos` (
  `KidDevPlatillo` INT NOT NULL,
  `KidPlatillo` INT NOT NULL,
  `motivo` VARCHAR(45) NULL,
  `resolucion` VARCHAR(45) NULL,
  `costo` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidDevPlatillo`, `KidPlatillo`))
 ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;