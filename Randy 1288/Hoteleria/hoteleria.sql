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
-- Table `mydb`.`Tbl_Tipo_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Tipo_Habitacion` (
  `tipoHabitacion` VARCHAR(45) NOT NULL,
  `numeroCamas` INT NULL,
  `numeroAmbientes` INT NULL,
  `numeroPersonas` VARCHAR(45) NULL,
  `estado` INT NULL,
  PRIMARY KEY (`tipoHabitacion`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Categorias_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Categorias_Habitacion` (
  `categoria` VARCHAR(45) NOT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`categoria`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Habitaciones` (
  `numeroHabitacion` INT NOT NULL,
  `tipoHabitacion` VARCHAR(45) NULL,
  `categoria` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroHabitacion`),
  INDEX `tipo` (`tipoHabitacion` ASC),
  INDEX `categoria` (`categoria` ASC));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Clientes` (
  `idCliente` INT NOT NULL,
  `nombre1` VARCHAR(45) NULL,
  `nombre2` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idCliente`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Puestos` (
  `idPuesto` INT NOT NULL,
  `nombrePuesto` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idPuesto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Empleados` (
  `idEmpleado` INT NOT NULL,
  `idPuesto` INT NULL,
  `nombre1` VARCHAR(45) NULL,
  `nombre2` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `estadoCivil` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idEmpleado`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Reservaciones` (
  `idReservacion` INT NOT NULL,
  `idCliente` INT NULL,
  `fechaReservacion` DATE NULL,
  `idEmpleado` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idReservacion`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Reservacion` (
  `numeroDetalle` INT NOT NULL,
  `idReservacion` INT NULL,
  `numeroHabitacion` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroDetalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Folios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Folios` (
  `idFolio` INT NOT NULL,
  `idCliente` INT NULL,
  `fechaApertura` DATE NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idFolio`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Areas` (
  `idArea` INT NOT NULL,
  `nombreArea` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idArea`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Servicios` (
  `idServicio` INT NOT NULL,
  `nombreServicio` VARCHAR(45) NULL,
  `idArea` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idServicio`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Comandas` (
  `numeroComanda` INT NOT NULL,
  `idServicio` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroComanda`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Folio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Folio` (
  `numeroDetalle` INT NOT NULL,
  `idFolio` INT NULL,
  `idComanda` INT NULL,
  `fecha` DATE NULL,
  `monto` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroDetalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Eventos` (
  `idEvento` INT NOT NULL,
  `idCliente` INT NULL,
  `fechaEvento` DATE NULL,
  `idEmpleado` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idEvento`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Salones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Salones` (
  `numeroSalon` INT NOT NULL,
  `capacidad` INT NULL,
  `precio` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroSalon`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Evento` (
  `numeroDetalle` INT NOT NULL,
  `idEvento` INT NULL,
  `numeroSalon` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `requisitos` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroDetalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Quejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Quejas` (
  `idqueja` INT NOT NULL,
  `idCliente` INT NULL,
  `fecha` DATE NULL,
  `queja` TEXT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idqueja`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Objetos_Perdidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Objetos_Perdidos` (
  `idObjeto` INT NOT NULL,
  `numeroHabitacion` INT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idObjeto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Check_In`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Check_In` (
  `idChech-In` INT NOT NULL,
  `idCliente` INT NULL,
  `fecha` DATE NULL,
  `idEmpleado` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idChech-In`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Check_Out`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Check_Out` (
  `idChech-Out` INT NOT NULL,
  `idCliente` INT NULL,
  `fecha` DATE NULL,
  `idEmpleado` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idChech-Out`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Mesas` (
  `numeroMesa` INT NOT NULL,
  `idArea` INT NULL,
  `capacidad` INT NULL,
  `estadoMesa` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroMesa`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Tiendas` (
  `idTienda` INT NOT NULL,
  `idArea` INT NULL,
  `descripcion` TEXT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idTienda`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Recetas` (
  `idRecetas` INT NULL,
  `Receta` VARCHAR(500) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idRecetas`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Producto` (
  `idProducto` INT NOT NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `idTienda` INT NULL,
  `estado` tinyInt(1),
  `Recetas_idRecetas` INT NOT NULL,
  PRIMARY KEY (`idProducto`, `Recetas_idRecetas`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Bodegas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Bodegas` (
  `idBodega` INT NOT NULL,
  `nombreBodega` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idBodega`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Existencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Existencias` (
  `idExistencia` INT NOT NULL,
  `idProducto` INT NULL,
  `existencia` INT NULL,
  `idBodega` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idExistencia`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Control_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Control_Mesas` (
  `idControl` INT NOT NULL,
  `numeroMesa` INT NULL,
  `fecha` DATE NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idControl`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Menus` (
  `idMenu` INT NOT NULL,
  `nombreMenu` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idMenu`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Platillos` (
  `idPlatillo` INT NOT NULL,
  `idMenu` INT NULL,
  `nombrePlatillo` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idPlatillo`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Control`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Control` (
  `numeroDetalle` INT NOT NULL,
  `idControl` INT NULL,
  `idPlatillo` INT NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`numeroDetalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Devoluciones_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Devoluciones_Platillos` (
  `idDevoluciones` INT NOT NULL,
  `platillos_idPlatillo` INT NOT NULL,
  `motivo` VARCHAR(45) NULL,
  `resolucion` VARCHAR(45) NULL,
  `costo` VARCHAR(45) NULL,
  `estado` tinyInt(1),
  PRIMARY KEY (`idDevoluciones`, `platillos_idPlatillo`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;