-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hoteleria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hoteleria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hoteleria` DEFAULT CHARACTER SET utf8 ;
USE `hoteleria` ;

-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Tipo_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Tipo_Habitacion` (
  `KidTipoHabitacion` VARCHAR(45) NOT NULL,
  `numeroCamas` INT NULL,
  `numeroAmbientes` INT NULL,
  `numeroPersonas` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidTipoHabitacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Categorias_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Categorias_Habitacion` (
  `KidCategoria` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Habitaciones` (
  `KidNumeroHabitacion` INT NOT NULL,
  `KidTipoHabitacion` VARCHAR(45) NULL,
  `KidCategoria` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroHabitacion`),
  CONSTRAINT `tipoHabitacion`
    FOREIGN KEY (`KidTipoHabitacion`)
    REFERENCES `hoteleria`.`Tbl_Tipo_Habitacion` (`KidTipoHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `categoria`
    FOREIGN KEY (`KidCategoria`)
    REFERENCES `hoteleria`.`Tbl_Categorias_Habitacion` (`KidCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Clientes` (
  `KidCliente` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Puestos` (
  `KidPuesto` INT NOT NULL,
  `nombrePuesto` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidPuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Empleados` (
  `KidEmpleado` INT NOT NULL,
  `KidPuesto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `estadoCivil` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidEmpleado`),
  CONSTRAINT `fk_Tbl_Empleados_Tbl_Puestos1`
    FOREIGN KEY (`KidPuesto`)
    REFERENCES `hoteleria`.`Tbl_Puestos` (`KidPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Reservaciones` (
  `KidReservacion` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `fechaReservacion` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidReservacion`),
  CONSTRAINT `fk_Tbl_Reservaciones_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `hoteleria`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Reservaciones_Tbl_Empleados1`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `hoteleria`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Detalle_Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Detalle_Reservacion` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidReservacion` INT NULL,
  `KidNumeroHabitacion` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroDetalle`),
  CONSTRAINT `reservacion`
    FOREIGN KEY (`KidReservacion`)
    REFERENCES `hoteleria`.`Tbl_Reservaciones` (`KidReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `habitacion`
    FOREIGN KEY (`KidNumeroHabitacion`)
    REFERENCES `hoteleria`.`Tbl_Habitaciones` (`KidNumeroHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Folios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Folios` (
  `KidFolio` INT NOT NULL,
  `KidCliente` INT NULL,
  `fechaApertura` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidFolio`),
  CONSTRAINT `folio`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `hoteleria`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Areas` (
  `KidArea` INT NOT NULL,
  `nombreArea` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidArea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Servicios` (
  `KidServicio` INT NOT NULL,
  `KidArea` INT NOT NULL,
  `nombreServicio` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidServicio`),
  CONSTRAINT `fk_Tbl_Servicios_Tbl_Areas1`
    FOREIGN KEY (`KidArea`)
    REFERENCES `hoteleria`.`Tbl_Areas` (`KidArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Comandas` (
  `KidNumeroComanda` INT NOT NULL,
  `KidServicio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroComanda`),
  CONSTRAINT `service`
    FOREIGN KEY (`KidServicio`)
    REFERENCES `hoteleria`.`Tbl_Servicios` (`KidServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Detalle_Folio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Detalle_Folio` (
  `KidFolio` INT NOT NULL,
  `KidNumeroDetalle` INT NOT NULL,
  `KidComanda` INT NULL,
  `fecha` DATE NULL,
  `monto` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidFolio`, `KidNumeroDetalle`),
  CONSTRAINT `servicio`
    FOREIGN KEY (`KidComanda`)
    REFERENCES `hoteleria`.`Tbl_Comandas` (`KidNumeroComanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Detalle_Folio_Tbl_Folios1`
    FOREIGN KEY (`KidFolio`)
    REFERENCES `hoteleria`.`Tbl_Folios` (`KidFolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Eventos` (
  `KidEvento` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `_KidEmpleado` INT NOT NULL,
  `fechaEvento` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidEvento`),
  CONSTRAINT `fk_Tbl_Eventos_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `hoteleria`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Eventos_Tbl_Empleados1`
    FOREIGN KEY (`_KidEmpleado`)
    REFERENCES `hoteleria`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Salones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Salones` (
  `KidNumeroSalon` INT NOT NULL,
  `capacidad` INT NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroSalon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Detalle_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Detalle_Evento` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidNumeroSalon` INT NOT NULL,
  `KidEvento` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `requisitos` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroDetalle`),
  CONSTRAINT `reservacion0`
    FOREIGN KEY (`KidEvento`)
    REFERENCES `hoteleria`.`Tbl_Eventos` (`KidEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Detalle_Evento_Tbl_Salones1`
    FOREIGN KEY (`KidNumeroSalon`)
    REFERENCES `hoteleria`.`Tbl_Salones` (`KidNumeroSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Quejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Quejas` (
  `KidQueja` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `fecha` DATE NULL,
  `queja` TEXT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidQueja`),
  CONSTRAINT `fk_Tbl_Quejas_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `hoteleria`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Objetos_Perdidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Objetos_Perdidos` (
  `KidObjeto` INT NOT NULL,
  `KidNumeroHabitacion` INT NOT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidObjeto`),
  CONSTRAINT `fk_Tbl_Objetos_Perdidos_Tbl_Habitaciones1`
    FOREIGN KEY (`KidNumeroHabitacion`)
    REFERENCES `hoteleria`.`Tbl_Habitaciones` (`KidNumeroHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Check_In`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Check_In` (
  `KidCheckIn` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCheckIn`),
  CONSTRAINT `fk_Tbl_Check_In_Tbl_Empleados1`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `hoteleria`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Check_In_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `hoteleria`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Check_Out`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Check_Out` (
  `KidCheckOut` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCheckOut`),
  CONSTRAINT `fk_Tbl_Check_Out_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `hoteleria`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Check_Out_Tbl_Empleados1`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `hoteleria`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Mesas` (
  `KidNumeroMesa` INT NOT NULL,
  `KidArea` INT NOT NULL,
  `capacidad` INT NULL,
  `estadoMesa` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroMesa`),
  CONSTRAINT `fk_Tbl_Mesas_Tbl_Areas1`
    FOREIGN KEY (`KidArea`)
    REFERENCES `hoteleria`.`Tbl_Areas` (`KidArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Tiendas` (
  `KidTienda` INT NOT NULL,
  `KidArea` INT NOT NULL,
  `descripcion` TEXT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidTienda`),
  CONSTRAINT `fk_Tbl_Tiendas_Tbl_Areas1`
    FOREIGN KEY (`KidArea`)
    REFERENCES `hoteleria`.`Tbl_Areas` (`KidArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Producto` (
  `KidProducto` INT NOT NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Bodegas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Bodegas` (
  `KidBodega` INT NOT NULL,
  `nombreBodega` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidBodega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Existencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Existencias` (
  `KidExistencia` INT NOT NULL,
  `KidProducto` INT NULL,
  `KidBodega` INT NULL,
  `existencia` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidExistencia`),
  CONSTRAINT `prod`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `hoteleria`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bode`
    FOREIGN KEY (`KidBodega`)
    REFERENCES `hoteleria`.`Tbl_Bodegas` (`KidBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Control_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Control_Mesas` (
  `KidControl` INT NOT NULL,
  `KidNumeroMesa` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidControl`),
  CONSTRAINT `mesa`
    FOREIGN KEY (`KidNumeroMesa`)
    REFERENCES `hoteleria`.`Tbl_Mesas` (`KidNumeroMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Menus` (
  `KidMenu` INT NOT NULL,
  `nombreMenu` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Recetas` (
  `KidRecetas` INT NULL,
  `receta` VARCHAR(500) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidRecetas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Platillos` (
  `KidPlatillo` INT NOT NULL,
  `KidRecetas` INT NOT NULL,
  `KidMenu` INT NULL,
  `nombrePlatillo` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidPlatillo`, `KidRecetas`),
  CONSTRAINT `menu`
    FOREIGN KEY (`KidMenu`)
    REFERENCES `hoteleria`.`Tbl_Menus` (`KidMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Platillos_Tbl_Recetas1`
    FOREIGN KEY (`KidRecetas`)
    REFERENCES `hoteleria`.`Tbl_Recetas` (`KidRecetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Detalle_Control`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Detalle_Control` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidControl` INT NOT NULL,
  `KidPlatillo` INT NOT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroDetalle`),
  CONSTRAINT `fk_Tbl_Detalle_Control_Tbl_Control_Mesas1`
    FOREIGN KEY (`KidControl`)
    REFERENCES `hoteleria`.`Tbl_Control_Mesas` (`KidControl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Detalle_Control_Tbl_Platillos1`
    FOREIGN KEY (`KidPlatillo`)
    REFERENCES `hoteleria`.`Tbl_Platillos` (`KidPlatillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Devoluciones_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Devoluciones_Platillos` (
  `KidDevPlatillo` INT NOT NULL,
  `KidPlatillo` INT NOT NULL,
  `motivo` VARCHAR(45) NULL,
  `resolucion` VARCHAR(45) NULL,
  `costo` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidDevPlatillo`, `KidPlatillo`),
  CONSTRAINT `fk_Devoluciones_platillos1`
    FOREIGN KEY (`KidDevPlatillo`)
    REFERENCES `hoteleria`.`Tbl_Platillos` (`KidPlatillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Ingredientes` (
  `KidIngredientes` INT NOT NULL,
  `KidProducto` INT NOT NULL,
  `KidRecetas` INT NOT NULL,
  PRIMARY KEY (`KidIngredientes`, `KidRecetas`, `KidProducto`),
  CONSTRAINT `fk_Tbl_Ingredientes_Tbl_Producto1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `hoteleria`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Ingredientes_Tbl_Recetas1`
    FOREIGN KEY (`KidRecetas`)
    REFERENCES `hoteleria`.`Tbl_Recetas` (`KidRecetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hoteleria`.`Tbl_Tiendas_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hoteleria`.`Tbl_Tiendas_Producto` (
  `KidProducto` INT NOT NULL,
  `KidTienda` INT NOT NULL,
  PRIMARY KEY (`KidProducto`, `KidTienda`),
  CONSTRAINT `fk_Tbl_Producto_has_Tbl_Tiendas_Tbl_Producto1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `hoteleria`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Producto_has_Tbl_Tiendas_Tbl_Tiendas1`
    FOREIGN KEY (`KidTienda`)
    REFERENCES `hoteleria`.`Tbl_Tiendas` (`KidTienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;