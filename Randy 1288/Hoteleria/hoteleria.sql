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
  `Kid_tipo_habitacion` VARCHAR(45) NOT NULL,
  `numeroCamas` INT NULL,
  `numeroAmbientes` INT NULL,
  `numeroPersonas` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_tipo_habitacion`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Categorias_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Categorias_Habitacion` (
  `Kid_categoria` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_categoria`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Habitaciones` (
  `Kid_numero_habitacion` INT NOT NULL,
  `Kid_tipo_habitacion` VARCHAR(45) NULL,
  `Kid_categoria` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_numero_habitacion`),
  INDEX `tipo` (`Kid_tipo_habitacion` ASC),
  INDEX `categoria` (`Kid_categoria` ASC));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Clientes` (
  `Kid_cliente` INT NOT NULL,
  `nombre1` VARCHAR(45) NULL,
  `nombre2` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_cliente`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Puestos` (
  `Kid_puesto` INT NOT NULL,
  `nombrePuesto` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_puesto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Empleados` (
  `Kid_empleado` INT NOT NULL,
  `Kid_puesto` INT NULL,
  `nombre1` VARCHAR(45) NULL,
  `nombre2` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `estadoCivil` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_empleado`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Reservaciones` (
  `Kid_reservacion` INT NOT NULL,
  `Kid_cliente` INT NULL,
  `Kid_empleado` INT NULL,
  `fechaReservacion` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_reservacion`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Reservacion` (
  `Kid_numero_detalle` INT NOT NULL,
  `Kid_reservacion` INT NULL,
  `Kid_numero_habitacion` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_numero_detalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Folios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Folios` (
  `Kid_folio` INT NOT NULL,
  `Kid_cliente` INT NULL,
  `fechaApertura` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_folio`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Areas` (
  `Kid_area` INT NOT NULL,
  `nombreArea` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_area`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Servicios` (
  `Kid_servicio` INT NOT NULL,
  `Kid_area` INT NULL,
  `nombreServicio` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_servicio`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Comandas` (
  `Kid_numero_comanda` INT NOT NULL,
  `Kid_servicio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_numero_comanda`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Folio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Folio` (
  `Kid_numero_detalle` INT NOT NULL,
  `Kid_folio` INT NULL,
  `Kid_comanda` INT NULL,
  `fecha` DATE NULL,
  `monto` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_numero_detalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Eventos` (
  `Kid_evento` INT NOT NULL,
  `Kid_cliente` INT NULL,
  `Kid_empleado` INT NULL,
  `fechaEvento` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_evento`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Salones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Salones` (
  `Kid_numero_salon` INT NOT NULL,
  `capacidad` INT NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_numero_salon`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Evento` (
  `Kid_numero_detalle` INT NOT NULL,
  `Kid_evento` INT NULL,
  `Kid_numero_salon` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `requisitos` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_numero_detalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Quejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Quejas` (
  `Kid_queja` INT NOT NULL,
  `Kid_cliente` INT NULL,
  `fecha` DATE NULL,
  `queja` TEXT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_queja`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Objetos_Perdidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Objetos_Perdidos` (
  `Kid_objeto` INT NOT NULL,
  `numeroHabitacion` INT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_objeto`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Check_In`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Check_In` (
  `Kid_check_in` INT NOT NULL,
  `Kid_cliente` INT NULL,
  `Kid_empleado` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_check_in`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Check_Out`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Check_Out` (
  `Kid_check_out` INT NOT NULL,
  `Kid_cliente` INT NULL,
  `Kid_empleado` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_check_out`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Mesas` (
  `Kid_numero_mesa` INT NOT NULL,
  `Kid_area` INT NULL,
  `capacidad` INT NULL,
  `estadoMesa` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_numero_mesa`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Tiendas` (
  `Kid_tienda` INT NOT NULL,
  `Kid_area` INT NULL,
  `descripcion` TEXT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_tienda`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Recetas` (
  `Kid_recetas` INT NULL,
  `receta` VARCHAR(500) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_recetas`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Producto` (
  `Kid_producto` INT NOT NULL,
  `Kid_recetas` INT NOT NULL,
  `Kid_tienda` INT NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_producto`, `Kid_recetas`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Bodegas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Bodegas` (
  `Kid_bodega` INT NOT NULL,
  `nombreBodega` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_bodega`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Existencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Existencias` (
  `Kid_existencia` INT NOT NULL,
  `Kid_producto` INT NULL,
  `Kid_bodega` INT NULL,
  `existencia` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_existencia`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Control_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Control_Mesas` (
  `Kid_control` INT NOT NULL,
  `numeroMesa` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_control`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Menus` (
  `Kid_menu` INT NOT NULL,
  `nombreMenu` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_menu`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Platillos` (
  `Kid_platillo` INT NOT NULL,
  `Kid_menu` INT NULL,
  `nombrePlatillo` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_platillo`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Detalle_Control`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Detalle_Control` (
  `Kid_numero_detalle` INT NOT NULL,
  `Kid_control` INT NULL,
  `Kid_platillo` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`Kid_numero_detalle`));

-- -----------------------------------------------------
-- Table `mydb`.`Tbl_Devoluciones_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tbl_Devoluciones_Platillos` (
  `Kid_dev_platillo` INT NOT NULL,
  `Kid_platillo` INT NOT NULL,
  `motivo` VARCHAR(45) NULL,
  `resolucion` VARCHAR(45) NULL,
  `costo` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kid_dev_platillo`,`Kid_platillo`));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;