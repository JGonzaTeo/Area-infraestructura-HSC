CREATE SCHEMA IF NOT EXISTS `proyectogeneral` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `proyectogeneral`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- --------------------------------------------------------------------------SCRIPT DE HOTELERIA -----------------------------------------------------------------

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Tipo_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Tipo_Habitacion` (
  `KidTipoHabitacion` VARCHAR(45) NOT NULL,
  `numeroCamas` INT NULL,
  `numeroAmbientes` INT NULL,
  `numeroPersonas` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidTipoHabitacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Categorias_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Categorias_Habitacion` (
  `KidCategoria` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Habitaciones` (
  `KidNumeroHabitacion` INT NOT NULL,
  `KidTipoHabitacion` VARCHAR(45) NULL,
  `KidCategoria` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroHabitacion`),
  CONSTRAINT `tipoHabitacion`
    FOREIGN KEY (`KidTipoHabitacion`)
    REFERENCES `proyectogeneral`.`Tbl_Tipo_Habitacion` (`KidTipoHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `categoria`
    FOREIGN KEY (`KidCategoria`)
    REFERENCES `proyectogeneral`.`Tbl_Categorias_Habitacion` (`KidCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_TipoCliente`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_TipoCliente` (
  `KidTipoCliente` INT NOT NULL,
  `tipo_tipocliente` VARCHAR(45) NULL,
  `descripcion_tipocliente` VARCHAR(45) NULL,
  PRIMARY KEY (`KidTipoCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Clientes`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Clientes` (
  `KidCliente` INT NOT NULL,
  `nombres_cliente` VARCHAR(45) NULL,
  `apellidos_cliente` VARCHAR(45) NULL,
  `genero_cliente` TINYINT NULL,
  `telefono_cliente` VARCHAR(10) NULL,
  `direccion_cliente` TEXT NULL,
  `dpi_cliente` INT NULL,
  `nit_cliente` VARCHAR(10) NULL,
  `KidTipoCliente` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidCliente`),
  CONSTRAINT `fk_Cliente_TipoCliente`
    FOREIGN KEY (`KidTipoCliente`)
    REFERENCES `mydb`.`Tbl_TipoCliente` (`KidTipoCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--
-- Table structure for table `tbl_puestos`
--

DROP TABLE IF EXISTS `tbl_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_puestos` (
  `KidPuesto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `sueldofijo` varchar(45) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidPuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_puestos`
--

LOCK TABLES `tbl_puestos` WRITE;
/*!40000 ALTER TABLE `tbl_puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_areas`
--

DROP TABLE IF EXISTS `tbl_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_areas` (
  `KidArea` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `numarea` int(11) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidArea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_areas`
--

LOCK TABLES `tbl_areas` WRITE;
/*!40000 ALTER TABLE `tbl_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conceptos`
--

DROP TABLE IF EXISTS `tbl_conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_conceptos` (
  `KidConcepto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `naturalezaconcepto` varchar(45) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidConcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conceptos`
--

LOCK TABLES `tbl_conceptos` WRITE;
/*!40000 ALTER TABLE `tbl_conceptos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamentos`
--

DROP TABLE IF EXISTS `tbl_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_departamentos` (
  `KidDepartamento` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `numdepartamento` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `KidArea` int(11) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidDepartamento`),
  KEY `fk_Tbl_departamentos_Tbl_areas1_idx` (`KidArea`),
  CONSTRAINT `fk_Tbl_departamentos_Tbl_areas1` FOREIGN KEY (`KidArea`) REFERENCES `tbl_areas` (`KidArea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamentos`
--

LOCK TABLES `tbl_departamentos` WRITE;
/*!40000 ALTER TABLE `tbl_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalle_roles`
--

DROP TABLE IF EXISTS `tbl_detalle_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_detalle_roles` (
  `KidRolpago` int(11) NOT NULL,
  `KidEmpleado` int(11) NOT NULL,
  `remuneracion` float DEFAULT NULL,
  `horasExtras` int(11) DEFAULT NULL,
  `aporteigss` int(11) DEFAULT NULL,
  `gastos` float DEFAULT NULL,
  `vacaciones` int(11) DEFAULT NULL,
  `sueldototal` float DEFAULT NULL,
  `prestamos` float DEFAULT NULL,
  PRIMARY KEY (`KidRolpago`,`KidEmpleado`),
  KEY `fk_Tbl_detalle_roles_Tbl_empleado1_idx` (`KidEmpleado`),
  CONSTRAINT `fk_Tbl_detalle_roles_Tbl_empleado1` FOREIGN KEY (`KidEmpleado`) REFERENCES `tbl_empleado` (`KidEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_detalle_roles_Tbl_roles_de_pago` FOREIGN KEY (`KidRolpago`) REFERENCES `tbl_roles_de_pago` (`KidRolpago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalle_roles`
--

LOCK TABLES `tbl_detalle_roles` WRITE;
/*!40000 ALTER TABLE `tbl_detalle_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalle_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_empleado`
--

DROP TABLE IF EXISTS `tbl_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `tbl_empleado` (
  `KidEmpleado` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `dpi` varchar(35) DEFAULT NULL,
  `nit` varchar(25) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `telefonoalternativo` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `correoalternativo` varchar(45) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `estadoCivil` VARCHAR(45) NULL,
  `KidPuesto` int(11) DEFAULT NULL,
  `KidDepartamento` int(11) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidEmpleado`),
  KEY `fk_Tbl_empleado_Tbl_puestos1_idx` (`KidPuesto`),
  KEY `fk_Tbl_empleado_Tbl_departamentos1_idx` (`KidDepartamento`),
  CONSTRAINT `fk_Tbl_empleado_Tbl_departamentos1` FOREIGN KEY (`KidDepartamento`) REFERENCES `tbl_departamentos` (`KidDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_empleado_Tbl_puestos1` FOREIGN KEY (`KidPuesto`) REFERENCES `tbl_puestos` (`KidPuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_empleado`
--

LOCK TABLES `tbl_empleado` WRITE;
/*!40000 ALTER TABLE `tbl_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_empleado` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Reservaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Reservaciones` (
  `KidReservacion` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `fechaReservacion` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidReservacion`),
  CONSTRAINT `fk_Tbl_Reservaciones_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Reservaciones_Tbl_Empleados1`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `proyectogeneral`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Detalle_Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Detalle_Reservacion` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidReservacion` INT NULL,
  `KidNumeroHabitacion` INT NULL,
  `llegada` DATE NULL,
  `salida` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroDetalle`),
  CONSTRAINT `reservacion`
    FOREIGN KEY (`KidReservacion`)
    REFERENCES `proyectogeneral`.`Tbl_Reservaciones` (`KidReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `habitacion`
    FOREIGN KEY (`KidNumeroHabitacion`)
    REFERENCES `proyectogeneral`.`Tbl_Habitaciones` (`KidNumeroHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Folios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Folios` (
  `KidFolio` INT NOT NULL,
  `KidCliente` INT NULL,
  `fechaApertura` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidFolio`),
  CONSTRAINT `folio`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Areas` (
  `KidArea` INT NOT NULL,
  `nombreArea` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidArea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Servicios` (
  `KidServicio` INT NOT NULL,
  `KidArea` INT NOT NULL,
  `nombreServicio` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidServicio`),
  CONSTRAINT `fk_Tbl_Servicios_Tbl_Areas1`
    FOREIGN KEY (`KidArea`)
    REFERENCES `proyectogeneral`.`Tbl_Areas` (`KidArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Comandas` (
  `KidNumeroComanda` INT NOT NULL,
  `KidServicio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroComanda`),
  CONSTRAINT `service`
    FOREIGN KEY (`KidServicio`)
    REFERENCES `proyectogeneral`.`Tbl_Servicios` (`KidServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Detalle_Folio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Detalle_Folio` (
  `KidFolio` INT NOT NULL,
  `KidNumeroDetalle` INT NOT NULL,
  `KidComanda` INT NULL,
  `fecha` DATE NULL,
  `monto` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidFolio`, `KidNumeroDetalle`),
  CONSTRAINT `servicio`
    FOREIGN KEY (`KidComanda`)
    REFERENCES `proyectogeneral`.`Tbl_Comandas` (`KidNumeroComanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Detalle_Folio_Tbl_Folios1`
    FOREIGN KEY (`KidFolio`)
    REFERENCES `proyectogeneral`.`Tbl_Folios` (`KidFolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Eventos` (
  `KidEvento` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `_KidEmpleado` INT NOT NULL,
  `fechaEvento` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidEvento`),
  CONSTRAINT `fk_Tbl_Eventos_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Eventos_Tbl_Empleados1`
    FOREIGN KEY (`_KidEmpleado`)
    REFERENCES `proyectogeneral`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Salones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Salones` (
  `KidNumeroSalon` INT NOT NULL,
  `capacidad` INT NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroSalon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Detalle_Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Detalle_Evento` (
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
    REFERENCES `proyectogeneral`.`Tbl_Eventos` (`KidEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Detalle_Evento_Tbl_Salones1`
    FOREIGN KEY (`KidNumeroSalon`)
    REFERENCES `proyectogeneral`.`Tbl_Salones` (`KidNumeroSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Quejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Quejas` (
  `KidQueja` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `fecha` DATE NULL,
  `queja` TEXT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidQueja`),
  CONSTRAINT `fk_Tbl_Quejas_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Objetos_Perdidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Objetos_Perdidos` (
  `KidObjeto` INT NOT NULL,
  `KidNumeroHabitacion` INT NOT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidObjeto`),
  CONSTRAINT `fk_Tbl_Objetos_Perdidos_Tbl_Habitaciones1`
    FOREIGN KEY (`KidNumeroHabitacion`)
    REFERENCES `proyectogeneral`.`Tbl_Habitaciones` (`KidNumeroHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Check_In`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Check_In` (
  `KidCheckIn` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCheckIn`),
  CONSTRAINT `fk_Tbl_Check_In_Tbl_Empleados1`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `proyectogeneral`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Check_In_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Check_Out`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Check_Out` (
  `KidCheckOut` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCheckOut`),
  CONSTRAINT `fk_Tbl_Check_Out_Tbl_Clientes1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Check_Out_Tbl_Empleados1`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `proyectogeneral`.`Tbl_Empleados` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Mesas` (
  `KidNumeroMesa` INT NOT NULL,
  `KidArea` INT NOT NULL,
  `capacidad` INT NULL,
  `estadoMesa` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroMesa`),
  CONSTRAINT `fk_Tbl_Mesas_Tbl_Areas1`
    FOREIGN KEY (`KidArea`)
    REFERENCES `proyectogeneral`.`Tbl_Areas` (`KidArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Tiendas` (
  `KidTienda` INT NOT NULL,
  `KidArea` INT NOT NULL,
  `descripcion` TEXT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidTienda`),
  CONSTRAINT `fk_Tbl_Tiendas_Tbl_Areas1`
    FOREIGN KEY (`KidArea`)
    REFERENCES `proyectogeneral`.`Tbl_Areas` (`KidArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_TipoProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_TipoProducto` (
  `KidTipoProducto` INT NOT NULL,
  `tipo_tipoproducto` VARCHAR(45) NULL,
  `descripcion_tipoproducto` VARCHAR(45) NULL,
  PRIMARY KEY (`KidTipoProducto`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Producto` (
  `KidProducto` INT NOT NULL,
  `KidTipoProducto` INT NOT NULL,
  `nombre_producto` VARCHAR(45) NULL,
  `descripcion_producto` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidProducto`),
  CONSTRAINT `fk_Producto_TipoProducto1`
    FOREIGN KEY (`KidTipoProducto`)
    REFERENCES `proyectogeneral`.`Tbl_TipoProducto` (`KidTipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TblSucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_sucursal` (
  `KidSucursal` INT(16) NOT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL,
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
  `status` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidBodega`));


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Existencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Existencias` (
  `KidExistencia` INT NOT NULL,
  `KidProducto` INT NULL,
  `KidBodega` INT NULL,
  `existencia` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidExistencia`),
  CONSTRAINT `prod`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bode`
    FOREIGN KEY (`KidBodega`)
    REFERENCES `proyectogeneral`.`Tbl_bodega` (`KidBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Control_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Control_Mesas` (
  `KidControl` INT NOT NULL,
  `KidNumeroMesa` INT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidControl`),
  CONSTRAINT `mesa`
    FOREIGN KEY (`KidNumeroMesa`)
    REFERENCES `proyectogeneral`.`Tbl_Mesas` (`KidNumeroMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Menus` (
  `KidMenu` INT NOT NULL,
  `nombreMenu` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Recetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Recetas` (
  `KidRecetas` INT NULL,
  `receta` VARCHAR(500) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidRecetas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Platillos` (
  `KidPlatillo` INT NOT NULL,
  `KidMenu` INT NULL,
  `nombrePlatillo` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  `Tbl_Recetas_KidRecetas` INT NOT NULL,
  PRIMARY KEY (`KidPlatillo`, `Tbl_Recetas_KidRecetas`),
  CONSTRAINT `menu`
    FOREIGN KEY (`KidMenu`)
    REFERENCES `proyectogeneral`.`Tbl_Menus` (`KidMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Platillos_Tbl_Recetas1`
    FOREIGN KEY (`Tbl_Recetas_KidRecetas`)
    REFERENCES `proyectogeneral`.`Tbl_Recetas` (`KidRecetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Detalle_Control`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Detalle_Control` (
  `KidNumeroDetalle` INT NOT NULL,
  `KidControl` INT NOT NULL,
  `KidPlatillo` INT NOT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidNumeroDetalle`),
  CONSTRAINT `fk_Tbl_Detalle_Control_Tbl_Control_Mesas1`
    FOREIGN KEY (`KidControl`)
    REFERENCES `proyectogeneral`.`Tbl_Control_Mesas` (`KidControl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Detalle_Control_Tbl_Platillos1`
    FOREIGN KEY (`KidPlatillo`)
    REFERENCES `proyectogeneral`.`Tbl_Platillos` (`KidPlatillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Devoluciones_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Devoluciones_Platillos` (
  `KidDevPlatillo` INT NOT NULL,
  `KidPlatillo` INT NOT NULL,
  `motivo` VARCHAR(45) NULL,
  `resolucion` VARCHAR(45) NULL,
  `costo` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidDevPlatillo`, `KidPlatillo`),
  CONSTRAINT `fk_Devoluciones_platillos1`
    FOREIGN KEY (`KidDevPlatillo`)
    REFERENCES `proyectogeneral`.`Tbl_Platillos` (`KidPlatillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Ingredientes` (
  `KidIngredientes` INT NOT NULL,
  `KidProducto` INT NOT NULL,
  `KidRecetas` INT NOT NULL,
  PRIMARY KEY (`KidIngredientes`, `KidRecetas`, `KidProducto`),
  CONSTRAINT `fk_Tbl_Ingredientes_Tbl_Producto1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Ingredientes_Tbl_Recetas1`
    FOREIGN KEY (`KidRecetas`)
    REFERENCES `proyectogeneral`.`Tbl_Recetas` (`KidRecetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_tiendas_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_tiendas_producto` (
  `KidProducto` INT NOT NULL,
  `KidTienda` INT NOT NULL,
  PRIMARY KEY (`KidProducto`, `KidTienda`),
  CONSTRAINT `fk_Tbl_Producto_has_Tbl_Tiendas_Tbl_Producto1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_Producto_has_Tbl_Tiendas_Tbl_Tiendas1`
    FOREIGN KEY (`KidTienda`)
    REFERENCES `proyectogeneral`.`Tbl_Tiendas` (`KidTienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- --------------------------------------------------------------------------SCRIPT DE VENTAS Y CUENTAS POR COBRAR -----------------------------------------------------------------

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Serie` (
  `KidSerie` INT NOT NULL,
  `serie_serie` VARCHAR(45) NULL,
  `descripcion_serie` VARCHAR(45) NULL,
  PRIMARY KEY (`KidSerie`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_TipoFactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_TipoFactura` (
  `KidTipoFactura` INT NOT NULL,
  `tipo_tipofactura` VARCHAR(45) NULL,
  `descripcion_tipofactura` VARCHAR(45) NULL,
  PRIMARY KEY (`KidTipoFactura`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Impuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Impuesto` (
  `KidImpuesto` INT NOT NULL,
  `nombre_impuesto` VARCHAR(45) NULL,
  `descripcion_impuesto` VARCHAR(150) NULL,
  `porcentaje_impuesto` DOUBLE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidImpuesto`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Moneda` (
  `KidMoneda` INT NOT NULL,
  `nombre_moneda` VARCHAR(45) NULL,
  `tasa_moneda` DOUBLE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidMoneda`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_FacturaEncabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_FacturaEncabezado` (
  `KidFacturaEncabezado` INT NOT NULL,
  `fecha_facturaencabezado` DATE NULL,
  `descripcion_facturaencabezado` VARCHAR(45) NULL,
  `KidSerie` INT NOT NULL,
  `KidTipoFactura` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidImpuesto` INT NOT NULL,
  `KidMoneda` INT NOT NULL,
  `impuesto_facturaencabezado` DOUBLE NULL,
  `monto_facturaencabezado` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidFacturaEncabezado`, `KidSerie`, `KidTipoFactura`),
  CONSTRAINT `fk_FacturaEncabezado_Cliente1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Cliente` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaEncabezado_Serie1`
    FOREIGN KEY (`KidSerie`)
    REFERENCES `proyectogeneral`.`Tbl_Serie` (`KidSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaEncabezado_TipoFactura1`
    FOREIGN KEY (`KidTipoFactura`)
    REFERENCES `proyectogeneral`.`Tbl_TipoFactura` (`KidTipoFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_FacturaEncabezado_Tbl_Impuesto1`
    FOREIGN KEY (`KidImpuesto`)
    REFERENCES `proyectogeneral`.`Tbl_Impuesto` (`KidImpuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_FacturaEncabezado_Tbl_Moneda1`
    FOREIGN KEY (`KidMoneda`)
    REFERENCES `proyectogeneral`.`Tbl_Moneda` (`KidMoneda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_SolicitudRembolso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_SolicitudRembolso` (
  `KidSolicitudRembolso` INT NOT NULL,
  `fecha_solicitudrembolso` DATE NULL,
  `motivo_solicitudrembolso` VARCHAR(45) NULL,
  `KidFacturaEncabezado` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidSolicitudRembolso`),
  CONSTRAINT `fk_SolicitudRembolso_FacturaEncabezado1`
    FOREIGN KEY (`KidFacturaEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Devoluciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Devoluciones` (
  `kidDevoluciones` INT NOT NULL,
  `motivo_devoluciones` VARCHAR(45) NULL,
  `fecha_devoluciones` DATE NULL,
  `KidFacturaEncabezado` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`kidDevoluciones`),
  CONSTRAINT `fk_Devoluciones_FacturaEncabezado1`
    FOREIGN KEY (`KidFacturaEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_FacturaDetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_FacturaDetalle` (
  `KidFacturaDetalle` INT NOT NULL,
  `cantidad_facturadetalle` INT NULL,
  `monto_facturadetalle` DOUBLE NULL,
  `KidProducto` INT NOT NULL,
  `KidFacturaEncabezado` INT NOT NULL,
  PRIMARY KEY (`KidFacturaDetalle`),
  CONSTRAINT `fk_FacturaDetalle_Producto1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaDetalle_FacturaEncabezado1`
    FOREIGN KEY (`KidFacturaEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Stock` (
  `Kidstock` INT NOT NULL,
  `cantidadMaxima` INT NULL,
  `cantidadMinima` INT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kidstock`));
  
    -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Existencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Existencia` (
  `Kidexistencia` INT NOT NULL,
  `kidproducto` INT NOT NULL,
  `cantidad` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kidexistencia`, `kidproducto`),
  CONSTRAINT `fk_Producto_Existencia`
  FOREIGN KEY (`Kidproducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`)
  );

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Inventario` (
  `KidInventario` INT NOT NULL,
  `KidProducto` INT NOT NULL,
  `Kidbodega` INT NOT NULL,
  `Kidstock` INT NOT NULL,
  `Kidexistencia` INT NOT NULL,  
  `fecha_inventario` DATE NULL,
  `cantidad_inventario` INT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidInventario`),
  CONSTRAINT `fk_Inventario_Producto1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`),
      CONSTRAINT `fk_Inventario_Bodegas`
    FOREIGN KEY (`Kidbodega`)
    REFERENCES `proyectogeneral`.`Tbl_bodega` (`Kidbodega`),
      CONSTRAINT `Fk_Inventario_Stock`
    FOREIGN KEY (`Kidstock`)
    REFERENCES `proyectogeneral`.`Tbl_Stock` (`Kidstock`),
      CONSTRAINT `fk_Inventario_Existencia`
    FOREIGN KEY (`Kidexistencia`)
    REFERENCES `proyectogeneral`.`Tbl_Existencia` (`Kidexistencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Poliza` (
  `KidPoliza` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `monto` DOUBLE NULL,
  `KidFacturaEncabezado` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidPoliza`),
  CONSTRAINT `fk_Ventas_FacturaEncabezado1`
    FOREIGN KEY (`KidFacturaEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_TipoPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_TipoPago` (
  `KidTipoPago` INT NOT NULL,
  `tipo_tipopago` VARCHAR(45) NULL,
  `descripcion_tipopago` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidTipoPago`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Pagos` (
  `KidPagos` INT NOT NULL,
  `fecha_pagos` DATE NULL,
  `descripcion_pagos` VARCHAR(45) NULL,
  `monto_pagos` DOUBLE NULL,
  `KidTipoPago` INT NOT NULL,
  `KidFacturaEncabezado` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidPagos`, `KidTipoPago`),
  CONSTRAINT `fk_Pagos_TipoPago1`
    FOREIGN KEY (`KidTipoPago`)
    REFERENCES `proyectogeneral`.`Tbl_TipoPago` (`KidTipoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pagos_FacturaEncabezado1`
    FOREIGN KEY (`KidFacturaEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Comisiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Comisiones` (
  `KidComisiones` INT NOT NULL,
  `fecha_comisiones` DATE NULL,
  `descripcion_comisiones` VARCHAR(45) NULL,
  `monto_comisiones` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidComisiones`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Asignacion_Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Asignacion_Empleado` (
  `KidPoliza` INT NOT NULL,
  `KidComisiones` INT NOT NULL,
  `KidEmpleados` INT NOT NULL,
  PRIMARY KEY (`KidPoliza`, `KidComisiones`),
  CONSTRAINT `fk_Ventas_has_Comisiones_Ventas1`
    FOREIGN KEY (`KidPoliza`)
    REFERENCES `proyectogeneral`.`Tbl_Poliza` (`KidPoliza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_has_Comisiones_Comisiones1`
    FOREIGN KEY (`KidComisiones`)
    REFERENCES `proyectogeneral`.`Tbl_Comisiones` (`KidComisiones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignacion_Empleado_Empleados1`
    FOREIGN KEY (`KidEmpleados`)
    REFERENCES `proyectogeneral`.`Tbl_Empleados` (`KidEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Precios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Precios` (
  `KidPrecios` INT NOT NULL,
  `precio_precios` DOUBLE NULL,
  `descripcion_precios` VARCHAR(45) NULL,
  `KidProducto` INT NOT NULL,
  PRIMARY KEY (`KidPrecios`),
  CONSTRAINT `fk_Precios_Producto1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- --------------------------------------------------------------------------SCRIPT DE COMPRAS Y CUENTAS POR PAGAR -----------------------------------------------------------------

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
  PRIMARY KEY (`KidContacto`),
  CONSTRAINT `fk_proveedor_contacto`
    FOREIGN KEY (`KidProveedor`)
    REFERENCES `proyectogeneral`.`Tbl_proveedor` (`KidProveedor`)
  );
  
  -- -----------------------------------------------------
-- Table `TblOrdenCompraEncabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tbl_orden_compra_encabezado` (
  `KidOrdenCompraEncabezado` INT(16) NOT NULL,
  `KidProveedor` INT(16) NOT NULL,
  `KidImpuesto` INT(12) NULL DEFAULT NULL,
  `fechaEmisionOrdenCompraEncabezado` DATE NOT NULL,
  `fechaRevisionOrdenCompraEncabezado` DATE NOT NULL,
  `nombreOrdenCompraEncabezado` VARCHAR(30) NULL DEFAULT NULL,
  `descripcionOrdenCompraEncabezado` VARCHAR(100) NULL DEFAULT NULL,
  `fechaEstimadaEntregaOrdenCompraEncabezado` DATETIME NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidOrdenCompraEncabezado`),
  CONSTRAINT `fk_OrdenEncabezado_proveedor`
    FOREIGN KEY (`KidProveedor`)
    REFERENCES `proyectogeneral`.`Tbl_proveedor` (`KidProveedor`),
    CONSTRAINT `Fk_ordenencabezado_impuesto`
    FOREIGN KEY (`KidImpuesto`)
    REFERENCES `proyectogeneral`.`Tbl_impuesto` (`KidImpuesto`)
  );

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
  PRIMARY KEY (`KidOrdenCompraDetalle`, `KidOrdenCompraEncabezado`, `KidProducto`),
   CONSTRAINT `fk_OrdenEncabezado_detalle`
    FOREIGN KEY (`KidOrdenCompraEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_orden_compra_encabezado` (`KidOrdenCompraEncabezado`),
    CONSTRAINT `fk_ordendetalle_producto`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`)
  );

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
  PRIMARY KEY (`KidProveedorBodega`),
  CONSTRAINT `FK_proveedor_bodega`
    FOREIGN KEY (`KidProveedor`)
    REFERENCES `proyectogeneral`.`Tbl_proveedor` (`KidProveedor`),
    CONSTRAINT `FK_bodega_proveedor`
    FOREIGN KEY (`KidBodega`)
    REFERENCES `proyectogeneral`.`Tbl_bodega` (`KidBodega`),
   CONSTRAINT `Fk_proveedor_bodega_producto`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`)
  );
  
 -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Acreedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Acreedor` (
  `KidAcreedor` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidAcreedor`)); 
  

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Bancos` (
  `KidBanco` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidBanco`));
  
 -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Pedido` (
  `KidPedido` INT(12) NOT NULL,
  `KidProveedor` INT(12) NOT NULL,
  `KidOrdenCompra` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPedido`),
   CONSTRAINT `FK_proveedor_pedido`
    FOREIGN KEY (`KidProveedor`)
    REFERENCES `proyectogeneral`.`Tbl_proveedor` (`KidProveedor`),
     CONSTRAINT `fk_OrdenEncabezado_pedido`
    FOREIGN KEY (`KidOrdenCompra`)
    REFERENCES `proyectogeneral`.`Tbl_orden_compra_encabezado` (`KidOrdenCompraEncabezado`)
  ); 
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_CreditoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_CreditoPedido` (
  `KidCreditoPedido` INT(12) NOT NULL,
  `KidPedido` INT(12) NOT NULL,
  `KidBanco` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `cuotas` INT(2) NOT NULL,
  `fechaIni` TIMESTAMP NULL DEFAULT NULL,
  `fechaFin` TIMESTAMP NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCreditoPedido`),
  CONSTRAINT `FK_credito_pedido`
    FOREIGN KEY (`KidPedido`)
    REFERENCES `proyectogeneral`.`Tbl_Pedido` (`KidPedido`),
     CONSTRAINT `fk_credito_banco`
    FOREIGN KEY (`KidBanco`)
    REFERENCES `proyectogeneral`.`Tbl_Bancos` (`KidBanco`)
  );
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_CredPedDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_CredPedDet` (
  `KidCodigoCresDet` INT(12) NOT NULL,
  `KidCreditoPedido` INT(12) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCodigoCresDet`, `KidCreditoPedido`),
	CONSTRAINT `FK_creditoPedDet_CreditoPedido`
    FOREIGN KEY (`KidCreditoPedido`)
    REFERENCES `proyectogeneral`.`Tbl_CreditoPedido` (`KidCreditoPedido`)
  );
  
 -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Servicio` (
  `KidServicio` INT(12) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidServicio`)); 
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_PagoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_PagoServicio` (
  `KidPagoServicio` INT(12) NOT NULL,
  `KidAcreedor` INT(12) NOT NULL,
  `KidServicio` INT(12) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `impuesto` INT(12) NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPagoServicio`),
  CONSTRAINT `FK_pago_acreedor`
    FOREIGN KEY (`KidAcreedor`)
    REFERENCES `proyectogeneral`.`Tbl_Acreedor` (`KidAcreedor`),
    CONSTRAINT `FK_pago_servicio`
    FOREIGN KEY (`KidServicio`)
    REFERENCES `proyectogeneral`.`Tbl_Servicio` (`KidServicio`)
  );
  
 -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_CreditoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_CreditoServicio` (
  `KidCreditoServicio` INT(12) NOT NULL,
  `KidPagoServicio` INT(12) NOT NULL,
  `KidBanco` INT(12) NOT NULL,
  `total` DOUBLE(12,2) NOT NULL,
  `cuotas` INT(2) NOT NULL,
  `fechaIni` TIMESTAMP NULL DEFAULT NULL,
  `fechaFin` TIMESTAMP NULL DEFAULT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCreditoServicio`),
   CONSTRAINT `FK_credigo_pagoServicio`
    FOREIGN KEY (`KidPagoServicio`)
    REFERENCES `proyectogeneral`.`Tbl_PagoServicio` (`KidPagoServicio`),
     CONSTRAINT `fk_creditoServicio_banco`
    FOREIGN KEY (`KidBanco`)
    REFERENCES `proyectogeneral`.`Tbl_Bancos` (`KidBanco`)
  ); 
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_CredServDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_CredServDet` (
  `KidCredServDet` INT(12) NOT NULL,
  `KidCreditoServicio` INT(12) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidCredServDet`, `KidCreditoServicio`),
  CONSTRAINT `fk_credServDet_CreditoServicio`
    FOREIGN KEY (`KidCreditoServicio`)
    REFERENCES `proyectogeneral`.`Tbl_CreditoServicio` (`KidCreditoServicio`)
  );

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_PedidoDet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_PedidoDet` (
  `KidPedido` INT(12) NOT NULL,
  `KidProducto` INT(12) NOT NULL,
  `cantidad` INT(3) NOT NULL,
  `valor` DOUBLE(12,2) NOT NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`KidPedido`, `KidProducto`),
  CONSTRAINT `fk_PedidoDet_producto`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`)
  );


-- --------------------------------------------------------------------------SCRIPT DE INVENTARIOS -----------------------------------------------------------------
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Marca` (
  `Kidmarca` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `paisOrigen` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kidmarca`));
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Detalle_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Detalle_Producto` (
  `Kiddetalleproducto` INT NOT NULL,
  `Kidproducto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `presentacion` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kiddetalleproducto`),
   CONSTRAINT `fk_DetalleProducto_Producto`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`)
  );
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Ubicacion` (
  `Kidubicacion` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `capacidad` INT(10) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kidubicacion`));
  
  -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Producto_Marca`
-- -----------------------------------------------------
  
  CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Producto_Marca` (
  `Kidproducto` INT NOT NULL,
  `Kidmarca` INT NOT NULL,
  PRIMARY KEY (`Kidproducto`, `Kidmarca`),
  CONSTRAINT `fk_Producto_Marca`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`),
    CONSTRAINT `fk_Marca_Producto`
    FOREIGN KEY (`Kidmarca`)
    REFERENCES `proyectogeneral`.`Tbl_Marca` (`Kidmarca`)
  );
  
 -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_UbicacionProdcuto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_UbicacionProdcuto` (
  `Kidubicacion` INT NOT NULL,
  `Kidproducto` INT NOT NULL,
  PRIMARY KEY (`Kidubicacion`, `Kidproducto`),
  CONSTRAINT `fk_Producto_Ubicacion`
    FOREIGN KEY (`Kidproducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`),
    CONSTRAINT `fk_Ubicacion_Producto`
    FOREIGN KEY (`Kidubicacion`)
    REFERENCES `proyectogeneral`.`Tbl_Ubicacion` (`Kidubicacion`)
  ); 
  
 -- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Moviemiento_Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Moviemiento_Inventario` (
  `Kidmoviemientoinventario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `naturaleza` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kidmoviemientoinventario`)
  ); 
  
  
-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Historia_Inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Historia_Inventario` (
  `Kidproducto` INT NOT NULL,
  `Kidmovimientoinventario` INT NOT NULL,
  `Kidbodega` INT NOT NULL,
  `Kidsucursal` INT NOT NULL,
  `fecha` DATETIME NULL,
  `cantidad` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`Kidproducto`, `Kidmovimientoinventario`),
  CONSTRAINT `fk_Producto_HistoriaInventario`
  FOREIGN KEY (`Kidproducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`),
    CONSTRAINT `fk_MovimientoInventario_HistoriaInventario`
    FOREIGN KEY (`Kidmovimientoinventario`)
    REFERENCES `proyectogeneral`.`Tbl_Moviemiento_Inventario` (`Kidmoviemientoinventario`),
    CONSTRAINT `FK_Bodega_HistoriaInventario`
    FOREIGN KEY (`Kidbodega`)
    REFERENCES `proyectogeneral`.`Tbl_Bodega` (`Kidbodega`),
    CONSTRAINT `fk_Sucursal_HistoriaInventario`
    FOREIGN KEY (`Kidsucursal`)
    REFERENCES `proyectogeneral`.`Tbl_sucursal` (`Kidsucursal`)
  );

  
-- --------------------------------------------------------------------------SCRIPT DE FINANZAS -----------------------------------------------------------------

  
 -- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_tipoCuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_tipoCuenta` (
  `KidTipoCuenta` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipoCuenta` VARCHAR(25) NULL,
  `descripcion_tipoCuenta` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidTipoCuenta`))
ENGINE = InnoDB;
 
-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_cuentas` (
  `KidCuenta` INT NOT NULL AUTO_INCREMENT,
  `KidTipoCuenta` INT NOT NULL,
  `nombre` VARCHAR(25) NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidCuenta`, `KidTipoCuenta`),
  CONSTRAINT `fk_tbl_cuentas_contables_tbl_tipoCuentaContable1`
    FOREIGN KEY (`KidTipoCuenta`)
    REFERENCES `proyectogeneral`.`tbl_tipoCuenta` (`KidTipoCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
  
-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_libroDiario_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_libroDiario_Encabezado` (
  `KidLibroDiarioEncabezado` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `total_debe` FLOAT NULL,
  `total_haber` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidLibroDiarioEncabezado`))
ENGINE = InnoDB; 

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_libroDiario_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_libroDiario_Detalle` (
  `KidLibroDiarioEncabezado` INT NOT NULL,
  `KidCuentaContable` INT NOT NULL,
  `KidPoliza` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  PRIMARY KEY (`KidLibroDiarioEncabezado`, `KidCuentaContable`,`KidPoliza`),
  CONSTRAINT `fk_tbl_libroDiario_Detalle_tbl_libroDiario_Encabezado`
    FOREIGN KEY (`KidLibroDiarioEncabezado`)
    REFERENCES `proyectogeneral`.`tbl_libroDiario_Encabezado` (`KidLibroDiarioEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_libroDiario_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuentaContable`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`),
     CONSTRAINT `fk_tbl_libroDiario_Detalle_Poliza`
    FOREIGN KEY (`KidPoliza`)
    REFERENCES `proyectogeneral`.`Tbl_Poliza` (`KidPoliza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_libroMayor_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_libroMayor_Encabezado` (
  `KidLibroMayor` INT NOT NULL AUTO_INCREMENT,
  `KidLibroDiarioEncabezado` INT NOT NULL,
  `fecha` DATE NULL,
  `saldo_final` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidLibroMayor`, `KidLibroDiarioEncabezado`),
  CONSTRAINT `fk_tbl_libroMayor_tbl_libroDiario_Encabezado1`
    FOREIGN KEY (`KidLibroDiarioEncabezado`)
    REFERENCES `proyectogeneral`.`tbl_libroDiario_Encabezado` (`KidLibroDiarioEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_libroMayor_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_libroMayor_Detalle` (
  `KidLibroMayor` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  `saldo_parcial` FLOAT NULL,
  PRIMARY KEY (`KidLibroMayor`),
  CONSTRAINT `fk_tbl_libroMayor_Detalle_tbl_libroMayor1`
    FOREIGN KEY (`KidLibroMayor`)
    REFERENCES `proyectogeneral`.`tbl_libroMayor_Encabezado` (`KidLibroMayor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_BalanceGeneral_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_BalanceGeneral_Encabezado` (
  `KidBalanceGeneral` INT NOT NULL AUTO_INCREMENT,
  `capital` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidBalanceGeneral`))
ENGINE = InnoDB; 

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_estado_perdidas_ganancias_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_estado_perdidas_ganancias_Encabezado` (
  `KidPerdidasGanancias` INT NOT NULL AUTO_INCREMENT,
  `gananciaEnOperacion` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidPerdidasGanancias`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_BalanceGeneral_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_BalanceGeneral_Detalle` (
  `KidBalanceGeneral` INT NOT NULL,
  `KidCuentaContable` INT NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`KidBalanceGeneral`, `KidCuentaContable`),
  CONSTRAINT `fk_tbl_BalanceGeneral_Detalle_tbl_BalanceGeneral_Encabezado1`
    FOREIGN KEY (`KidBalanceGeneral`)
    REFERENCES `proyectogeneral`.`tbl_BalanceGeneral_Encabezado` (`KidBalanceGeneral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_BalanceGeneral_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuentaContable`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_presupuesto_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_presupuesto_Encabezado` (
  `Kidpresupuesto` INT NOT NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(300) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`Kidpresupuesto`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_presupuesto_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_presupuesto_detalle` (
  `Kidpresupuesto` INT NOT NULL,
  `KidCuenta` INT NOT NULL,
  `cantidad` INT NULL,
  `monto` DOUBLE NULL,
  PRIMARY KEY (`Kidpresupuesto`),
  CONSTRAINT `fk_tbl_presupuesto_detalle_tbl_presupuesto_Encabezado1`
    FOREIGN KEY (`Kidpresupuesto`)
    REFERENCES `proyectogeneral`.`tbl_presupuesto_Encabezado` (`Kidpresupuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_presupuesto_detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_estado_perdidas_ganacias_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_estado_perdidas_ganacias_Detalle` (
  `KidPerdidasGanancias` INT NOT NULL,
  `KidCuenta` INT NOT NULL,
  `debe` FLOAT NULL,
  `haber` FLOAT NULL,
  PRIMARY KEY (`KidPerdidasGanancias`),
  CONSTRAINT `fk_tbl_estado_perdidas_ganacias_Detalle_tbl_estado_perdidas_g1`
    FOREIGN KEY (`KidPerdidasGanancias`)
    REFERENCES `proyectogeneral`.`tbl_estado_perdidas_ganancias_Encabezado` (`KidPerdidasGanancias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_estado_perdidas_ganacias_Detalle_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ``.`tbl_flujoEfectivo_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_flujoEfectivo_Encabezado` (
  `KidFlujoEfectivo` INT NOT NULL AUTO_INCREMENT,
  `total_efectivo` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidFlujoEfectivo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_flujoEfectivo_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_flujoEfectivo_Detalle` (
  `KidFlujoEfectivo` INT NOT NULL,
  `KidCuenta` INT NOT NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`KidFlujoEfectivo`, `KidCuenta`),
  CONSTRAINT `fk_tbl_flujoEfectivo_Detalle_tbl_flujoEfectivo_Encabezado1`
    FOREIGN KEY (`KidFlujoEfectivo`)
    REFERENCES `proyectogeneral`.`tbl_flujoEfectivo_Encabezado` (`KidFlujoEfectivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_flujoEfectivo_Detalle_tbl_cuentas1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_libro_bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_libro_bancos` (
  `KidMovimiento` INT NOT NULL AUTO_INCREMENT,
  `KidBanco` INT NOT NULL,
  `fecha_movimiento` DATE NULL,
  `monto` FLOAT NULL,
  PRIMARY KEY (`KidMovimiento`, `KidBanco`),
  CONSTRAINT `fk_tbl_libro_bancos_tbl_bancos1`
    FOREIGN KEY (`KidBanco`)
    REFERENCES `proyectogeneral`.`tbl_bancos` (`KidBanco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_conciliacion_bancaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_conciliacion_bancaria` (
  `KidBanco` INT NOT NULL,
  `Kperiodo` DATE NOT NULL,
  `diferencia` FLOAT NULL,
  PRIMARY KEY (`KidBanco`, `Kperiodo`),
  CONSTRAINT `fk_tbl_conciliacion_bancaria_tbl_bancos1`
    FOREIGN KEY (`KidBanco`)
    REFERENCES `proyectogeneral`.`tbl_bancos` (`KidBanco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

 
-- --------------------------------------------------------------------------SCRIPT DE RECURSOS HUMANOS -----------------------------------------------------------------
-- Funciona

--
-- Table structure for table `tbl_nominasdetalle`
--

DROP TABLE IF EXISTS `tbl_nominasdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nominasdetalle` (
  `KidLinea` int(11) NOT NULL,
  `KidNomina` int(11) NOT NULL,
  `KidConcepto` int(11) DEFAULT NULL,
  PRIMARY KEY (`KidLinea`,`KidNomina`),
  KEY `fk_Tbl_nominasDetalle_Tbl_nominasEncabezado1_idx` (`KidNomina`),
  KEY `fk_Tbl_nominasDetalle_Tbl_conceptos1_idx` (`KidConcepto`),
  CONSTRAINT `fk_Tbl_nominasDetalle_Tbl_conceptos1` FOREIGN KEY (`KidConcepto`) REFERENCES `tbl_conceptos` (`KidConcepto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_nominasDetalle_Tbl_nominasEncabezado1` FOREIGN KEY (`KidNomina`) REFERENCES `tbl_nominasencabezado` (`KidNomina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nominasdetalle`
--

LOCK TABLES `tbl_nominasdetalle` WRITE;
/*!40000 ALTER TABLE `tbl_nominasdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nominasdetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nominasencabezado`
--

DROP TABLE IF EXISTS `tbl_nominasencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nominasencabezado` (
  `KidNomina` int(11) NOT NULL,
  `KidEmpleado` int(11) NOT NULL,
  `dias` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `sueldoliquido` float DEFAULT NULL,
  `perdidaoganancia` tinyint(1) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidNomina`,`KidEmpleado`),
  KEY `fk_Tbl_nominasEncabezado_Tbl_empleado1_idx` (`KidEmpleado`),
  CONSTRAINT `fk_Tbl_nominasEncabezado_Tbl_empleado1` FOREIGN KEY (`KidEmpleado`) REFERENCES `tbl_empleado` (`KidEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nominasencabezado`
--

LOCK TABLES `tbl_nominasencabezado` WRITE;
/*!40000 ALTER TABLE `tbl_nominasencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nominasencabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_planillasdetalle`
--

DROP TABLE IF EXISTS `tbl_planillasdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_planillasdetalle` (
  `KidPlanilla` int(11) NOT NULL,
  `Ktipo` int(11) NOT NULL,
  `documento` varchar(45) DEFAULT NULL,
  `KidEmpleado` int(11) DEFAULT NULL,
  `ingresos` float DEFAULT NULL,
  `descuentos` float DEFAULT NULL,
  `importeneto` float DEFAULT NULL,
  `estadoenvio` float DEFAULT NULL,
  `estadoregistro` float DEFAULT NULL,
  PRIMARY KEY (`KidPlanilla`,`Ktipo`),
  KEY `fk_Tbl_PlanillasDetalle_Tbl_empleado1_idx` (`KidEmpleado`),
  CONSTRAINT `fk_Tbl_PlanillasDetalle_Tbl_empleado1` FOREIGN KEY (`KidEmpleado`) REFERENCES `tbl_empleado` (`KidEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_PlanillasDetalle_Tbl_planillasEncabezado1` FOREIGN KEY (`KidPlanilla`) REFERENCES `tbl_planillasencabezado` (`KidPlanilla`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_planillasdetalle`
--

LOCK TABLES `tbl_planillasdetalle` WRITE;
/*!40000 ALTER TABLE `tbl_planillasdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planillasdetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_planillasencabezado`
--

DROP TABLE IF EXISTS `tbl_planillasencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_planillasencabezado` (
  `KidPlanilla` int(11) NOT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `clase` varchar(25) DEFAULT NULL,
  `fechaemision` date DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidPlanilla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_planillasencabezado`
--

LOCK TABLES `tbl_planillasencabezado` WRITE;
/*!40000 ALTER TABLE `tbl_planillasencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planillasencabezado` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tbl_roles_de_pago`
--

DROP TABLE IF EXISTS `tbl_roles_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_roles_de_pago` (
  `KidRolpago` int(11) NOT NULL,
  `anio` date DEFAULT NULL,
  `mes` date DEFAULT NULL,
  `quincena` date DEFAULT NULL,
  `fechaelaboracion` date DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidRolpago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles_de_pago`
--

LOCK TABLES `tbl_roles_de_pago` WRITE;
/*!40000 ALTER TABLE `tbl_roles_de_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_roles_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyectogeneral'
--
-- --------------------------------------------- NAVEGADOR ---------------------------------

CREATE TABLE `ayuda` (
  `Id_ayuda` int(11) NOT NULL,
  `Ruta` text COLLATE utf8_unicode_ci NOT NULL,
  `indice` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`) VALUES
(1, 'Página web ayuda/ayuda.chm', 'menu.html'),
(2, 'Página web ayuda/ayuda.chm', 'Menúboletos.html');



-- -------------------------------------------- SEGURIDAD --------------------------------------

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedimientoLogin` (IN `usuario` VARCHAR(25), IN `clave` VARCHAR(25))  NO SQL
Select tbl_usuario.PK_id_Usuario FROM tbl_usuario where tbl_usuario.PK_id_Usuario = usuario and tbl_usuario.password_usuario = MD5(clave) AND tbl_usuario.estado_usuario=1$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aplicacion`
--

CREATE TABLE `tbl_aplicacion` (
  `PK_id_aplicacion` int(11) NOT NULL,
  `PK_id_modulo` int(11) NOT NULL,
  `nombre_aplicacion` varchar(45) DEFAULT NULL,
  `descripcion_aplicacion` varchar(200) DEFAULT NULL,
  `estado_aplicacion` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `PK_id_bitacora` int(11) NOT NULL,
  `PK_id_usuario` varchar(25) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `host` varchar(45) DEFAULT NULL,
  `ip` varchar(25) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `tabla` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modulo`
--

CREATE TABLE `tbl_modulo` (
  `PK_id_Modulo` int(11) NOT NULL,
  `nombre_modulo` varchar(45) DEFAULT NULL,
  `descripcion_modulo` varchar(200) DEFAULT NULL,
  `estado_modulo` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perfil_detalle`
--

CREATE TABLE `tbl_perfil_detalle` (
  `PK_id_perfil` int(11) NOT NULL,
  `PK_id_aplicacion` int(11) NOT NULL,
  `ingresar` tinyint(4) DEFAULT NULL,
  `consultar` tinyint(4) DEFAULT NULL,
  `modificar` tinyint(4) DEFAULT NULL,
  `eliminar` tinyint(4) DEFAULT NULL,
  `imprimir` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perfil_encabezado`
--

CREATE TABLE `tbl_perfil_encabezado` (
  `PK_id_perfil` int(11) NOT NULL,
  `nombre_perfil` varchar(45) DEFAULT NULL,
  `descripcion_perfil` varchar(200) DEFAULT NULL,
  `estado_perfil` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `PK_id_usuario` varchar(25) NOT NULL,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `apellido_usuarios` varchar(45) DEFAULT NULL,
  `password_usuario` varchar(45) DEFAULT NULL,
  `cambio_contrasena` tinyint(4) DEFAULT NULL,
  `estado_usuario` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`PK_id_usuario`, `nombre_usuario`, `apellido_usuarios`, `password_usuario`, `cambio_contrasena`,  `estado_usuario`) VALUES
('MiUsuario', 'Usuario', 'Prueba', 'e19d5cd5af0378da05f63f891c7467af', 0, 1);

--
-- Disparadores `tbl_usuario`
--
DELIMITER $$
CREATE TRIGGER `actualizarClave` BEFORE UPDATE ON `tbl_usuario` FOR EACH ROW IF NEW.password_usuario <> OLD.password_usuario THEN
SET NEW.password_usuario = MD5(NEW.password_usuario);
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `encriptarClave` BEFORE INSERT ON `tbl_usuario` FOR EACH ROW BEGIN
SET NEW.password_usuario = MD5(NEW.password_usuario);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_aplicacion`
--

CREATE TABLE `tbl_usuario_aplicacion` (
  `PK_id_usuario` varchar(25) NOT NULL,
  `PK_id_aplicacion` int(11) NOT NULL,
  `ingresar` tinyint(4) DEFAULT NULL,
  `consultar` tinyint(4) DEFAULT NULL,
  `modificar` tinyint(4) DEFAULT NULL,
  `eliminar` tinyint(4) DEFAULT NULL,
  `imprimir` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_perfil`
--

CREATE TABLE `tbl_usuario_perfil` (
  `PK_id_usuario` varchar(25) NOT NULL,
  `PK_id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_aplicacion`
--
ALTER TABLE `tbl_aplicacion`
  ADD PRIMARY KEY (`PK_id_aplicacion`,`PK_id_modulo`),
  ADD KEY `fk_Aplicacion_Modulo` (`PK_id_modulo`);

--
-- Indices de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`PK_id_bitacora`,`PK_id_usuario`),
  ADD KEY `fk_Bitacora_Usuario1` (`PK_id_usuario`);

--
-- Indices de la tabla `tbl_modulo`
--
ALTER TABLE `tbl_modulo`
  ADD PRIMARY KEY (`PK_id_Modulo`);

--
-- Indices de la tabla `tbl_perfil_detalle`
--
ALTER TABLE `tbl_perfil_detalle`
  ADD PRIMARY KEY (`PK_id_perfil`,`PK_id_aplicacion`),
  ADD KEY `fk_Perfil_detalle_Aplicacion1` (`PK_id_aplicacion`);

--
-- Indices de la tabla `tbl_perfil_encabezado`
--
ALTER TABLE `tbl_perfil_encabezado`
  ADD PRIMARY KEY (`PK_id_perfil`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`PK_id_usuario`);

--
-- Indices de la tabla `tbl_usuario_aplicacion`
--
ALTER TABLE `tbl_usuario_aplicacion`
  ADD PRIMARY KEY (`PK_id_usuario`,`PK_id_aplicacion`),
  ADD KEY `fk_tbl_usuario_aplicacion_tbl_aplicacion1` (`PK_id_aplicacion`);

--
-- Indices de la tabla `tbl_usuario_perfil`
--
ALTER TABLE `tbl_usuario_perfil`
  ADD PRIMARY KEY (`PK_id_usuario`,`PK_id_perfil`),
  ADD KEY `fk_Usuario_perfil_Perfil1` (`PK_id_perfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `PK_id_bitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_aplicacion`
--
ALTER TABLE `tbl_aplicacion`
  ADD CONSTRAINT `fk_Aplicacion_Modulo` FOREIGN KEY (`PK_id_modulo`) REFERENCES `tbl_modulo` (`PK_id_Modulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `fk_Bitacora_Usuario1` FOREIGN KEY (`PK_id_usuario`) REFERENCES `tbl_usuario` (`PK_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_perfil_detalle`
--
ALTER TABLE `tbl_perfil_detalle`
  ADD CONSTRAINT `fk_Perfil_detalle_Aplicacion1` FOREIGN KEY (`PK_id_aplicacion`) REFERENCES `tbl_aplicacion` (`PK_id_aplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Perfil_detalle_Perfil1` FOREIGN KEY (`PK_id_perfil`) REFERENCES `tbl_perfil_encabezado` (`PK_id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_usuario_aplicacion`
--
ALTER TABLE `tbl_usuario_aplicacion`
  ADD CONSTRAINT `fk_Usuario_aplicacion_Usuario1` FOREIGN KEY (`PK_id_usuario`) REFERENCES `tbl_usuario` (`PK_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuario_aplicacion_tbl_aplicacion1` FOREIGN KEY (`PK_id_aplicacion`) REFERENCES `tbl_aplicacion` (`PK_id_aplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_usuario_perfil`
--
ALTER TABLE `tbl_usuario_perfil`
  ADD CONSTRAINT `fk_Usuario_perfil_Perfil1` FOREIGN KEY (`PK_id_perfil`) REFERENCES `tbl_perfil_encabezado` (`PK_id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_perfil_Usuario1` FOREIGN KEY (`PK_id_usuario`) REFERENCES `tbl_usuario` (`PK_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;


--
-- Dumping routines for database 'proyectogeneral'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;