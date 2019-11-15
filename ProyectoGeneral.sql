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

--
-- Disparadores `tbl_tipo_habitacion`
--
DELIMITER $$
CREATE TRIGGER `EstadoHabitaciones` AFTER UPDATE ON `tbl_tipo_habitacion` FOR EACH ROW BEGIN
UPDATE tbl_habitaciones set estado = new.estado WHERE tbl_habitaciones.KidTipoHabitacion=new.KidTipoHabitacion;
END
$$
DELIMITER ;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Categorias_Habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Categorias_Habitacion` (
  `KidCategoria` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCategoria`))
ENGINE = InnoDB;


--
-- Disparadores `tbl_categorias_habitacion`
--
DELIMITER $$
CREATE TRIGGER `EstadoHabitaciones2` AFTER UPDATE ON `tbl_categorias_habitacion` FOR EACH ROW BEGIN
UPDATE tbl_habitaciones set estado = new.estado WHERE tbl_habitaciones.KidCategoria=new.KidCategoria;
END
$$
DELIMITER ;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Habitaciones` (
  `KidNumeroHabitacion` INT NOT NULL,
  `KidTipoHabitacion` VARCHAR(45) NULL,
  `KidCategoria` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  `disponibilidad` INT,
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
  `estado` TINYINT(1),
  PRIMARY KEY (`KidTipoCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Clientes`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Clientes` (
  `KidCliente` INT NOT NULL,
  `nombres_cliente` VARCHAR(45) NULL,
  `apellidos_cliente` VARCHAR(45) DEFAULT NULL,
  `telefono_cliente` VARCHAR(10) NULL,
  `direccion_cliente` TEXT NULL,
  `dpi_cliente` INT DEFAULT NULL,
  `nit_cliente` VARCHAR(10) NULL,
  `contacto_cliente` VARCHAR(45) NULL,
  `telefono_contacto` VARCHAR(10) NULL,
  `KidTipoCliente` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidCliente`),
  CONSTRAINT `fk_Cliente_TipoCliente`
    FOREIGN KEY (`KidTipoCliente`)
    REFERENCES `proyectogeneral`.`Tbl_TipoCliente` (`KidTipoCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--
-- Table structure for table `tbl_areas`
--

DROP TABLE IF EXISTS `tbl_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_areas` (
  `KidArea` int(11) NOT NULL,
  `nombreArea` varchar(45) DEFAULT NULL,
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
-- Table structure for table `tbl_puestos`
--

DROP TABLE IF EXISTS `tbl_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_puestos` (
  `KidPuesto` int(11) NOT NULL,
  `KidArea` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `sueldofijo` varchar(45) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidPuesto`),
  CONSTRAINT `fk_Area_Puestos`
    FOREIGN KEY (`KidArea`)
    REFERENCES `proyectogeneral`.`Tbl_Areas` (`KidArea`)
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
-- Table structure for table `tbl_conceptos`
--

DROP TABLE IF EXISTS `tbl_conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_conceptos` (
  `KidConcepto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `debe_haber` tinyint(2) DEFAULT NULL,
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
    REFERENCES `proyectogeneral`.`tbl_empleado` (`KidEmpleado`)
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
  `fechaApertura` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidFolio`))
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
    REFERENCES `proyectogeneral`.`tbl_empleado` (`KidEmpleado`)
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
  `KidCheckIn` INT NOT NULL AUTO_INCREMENT,
  `KidCliente` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `fecha` DATE NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCheckIn`),
  CONSTRAINT `fk_Tbl_Check_In_Tbl_Empleados1`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `proyectogeneral`.`tbl_empleado` (`KidEmpleado`)
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
  `KidCheckOut` INT NOT NULL AUTO_INCREMENT,
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
    REFERENCES `proyectogeneral`.`tbl_Empleado` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Mesas` (
  `KidNumeroMesa` INT(11) NOT NULL AUTO_INCREMENT,
  `KidArea` INT(11) NOT NULL,
  `capacidad` INT(11) NULL,
  `estadoMesa` INT(11) NULL,
  `estado` TINYINT(1) NULL DEFAULT 1,
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
  `cantidad_producto` INT,
  `precio_producto` DOUBLE,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidProducto`),
  CONSTRAINT `fk_Producto_TipoProducto1`
    FOREIGN KEY (`KidTipoProducto`)
    REFERENCES `proyectogeneral`.`Tbl_TipoProducto` (`KidTipoProducto`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_descuentos`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_descuentos`(
  KidDescuentos INT NOT NULL,
  KidProducto INT NULL,
  nombre_descuentos VARCHAR(45),
  porcentaje_descuentos DOUBLE,
  fecha_inicio_descuentos DATE,
  fecha_final_descuentos DATE,
  estado TINYINT(1),
  PRIMARY KEY(KidDescuentos),
  CONSTRAINT `fk_Producto_Descuentos`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
)ENGINE = InnoDB;


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
  `KidRecetas` INT NOT NULL,
  `receta` VARCHAR(500) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidRecetas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Platillos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Platillos` (
  `KidPlatillo` INT NOT NULL,
  `KidMenu` INT NOT NULL,
  `nombrePlatillo` VARCHAR(45) NULL,
  `precio` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidPlatillo`, `KidMenu`),
  CONSTRAINT `menu`
    FOREIGN KEY (`KidMenu`)
    REFERENCES `proyectogeneral`.`Tbl_Menus` (`KidMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
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
-- Table `proyectogeneral`.`tbl_tipomovimiento`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_tipomovimiento`(
  KidtipoMovimiento INT NOT NULL,
  NombreMovimiento VARCHAR(45),
  detalle VARCHAR(255),
  naturaleza VARCHAR(25),
  estado TINYINT(1),
  PRIMARY KEY(KidtipoMovimiento)
)ENGINE = InnoDB;


-- -------------------------------------------------------
-- Table `proyectogeneral`.`Tbl_GestionMovimientoCliente`
-- -------------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_GestionMovimientoCliente`(
  KidGestionMovimientoCliente INT NOT NULL,
  KidEncabezadoComprobante INT NOT NULL,
  SaldoCliente DOUBLE,
  Debe DOUBLE,
  Haber DOUBLE,
  SaldoComprobante DOUBLE,
  PRIMARY KEY(KidGestionMovimientoCliente),
  CONSTRAINT `FK_encabezadoComprobante_GestionMovimientoCliente`
  FOREIGN KEY (`KidEncabezadoComprobante`)
  REFERENCES `proyectogeneral`.`tbl_EncabezadoComprobante`(`KidEncabezadoComprobante`) 
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Serie` (
  `KidSerie` INT NOT NULL,
  `serie_serie` VARCHAR(45) NULL,
  `certificado_serie` VARCHAR(45) NULL,
  `regimen_fiscal_serie` VARCHAR(45) NULL,
  `formato_serie` VARCHAR(45) NULL,
  `estado` TINYINT(1),
  PRIMARY KEY (`KidSerie`)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_tipo_lista_precios`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS tbl_tipo_lista_precios(
  Kidtipo_lista_precios INT NOT NULL,
  nombre_lista_precios_detalle VARCHAR(45),
  descuento_lista_precios DOUBLE,
  estado TINYINT(1),
  PRIMARY KEY(Kidtipo_lista_precios)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Encabezado_Lista_Precios`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Encabezado_Lista_Precios`(
	KidEncabezadoListaPrecios INT NOT NULL,
    Fecha_inicio_listaprecios DATE,
    fecha_modificacion_listaprecios DATE,
    PRIMARY KEY(KidEncabezadoListaPrecios)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Detalle_Lista_Precios`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Detalle_Lista_Precios`(
	KidEncabezadoListaPrecios INT NOT NULL,
    KidDetalleListaPrecios INT NOT NULL,
    KidProducto INT,
    Kidtipo_lista_precios INT,
    nombre_listaprecios VARCHAR(50),
    precio_listaprecios DOUBLE,
    PRIMARY KEY(KidEncabezadoListaPrecios, KidDetalleListaPrecios),
    CONSTRAINT `FK_EncabezadoLista_Precios_Detalle_Lista_Precios`
    FOREIGN KEY (`KidEncabezadoListaPrecios`)
    REFERENCES `proyectogeneral`.`Tbl_Encabezado_Lista_Precios` (`KidEncabezadoListaPrecios`),
    CONSTRAINT `FK_Productos_DetallePedido`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`),
	CONSTRAINT `FK_TipoListaPrecios_DetalleListaPrecios`
    FOREIGN KEY (`Kidtipo_lista_precios`)
    REFERENCES `proyectogeneral`.`tbl_tipo_lista_precios` (`Kidtipo_lista_precios`)
)ENGINE = InnoDB;


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
-- Table `proyectogeneral`.`tbl_cotizacionEncabezado`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_cotizacionEncabezado`(
	KidCotizacionEncabezado INT,
    KidCliente INT,
    fecha_cotizacionEncabezado DATE,
	vencimiento_cotizacionEncabezado DATE,
    PRIMARY KEY(KidCotizacionEncabezado),
	CONSTRAINT `FK_clientes_cotizacionEncabezado`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_cotizacionDetalle`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_cotizacionDetalle`(
	KidCotizacionDetalle INT,
    KidProducto INT,
    KidCotizacionEncabezado INT,
    cantidad_cotizacionDetalle INT,
    monto_cotizacionDetalle DOUBLE,
    PRIMARY KEY(KidCotizacionDetalle),
    CONSTRAINT `FK_cotizacionEncabezado_CotizacionDetalle`
    FOREIGN KEY (`KidCotizacionEncabezado`)
    REFERENCES `proyectogeneral`.`tbl_cotizacionEncabezado` (`KidCotizacionEncabezado`),
    CONSTRAINT `FK_Productos_cotizacionDetalle`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
)ENGINE=InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_FacturaEncabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_FacturaEncabezado` (
  `KidFacturaEncabezado` INT NOT NULL,
  `KidEncabezadoListaPrecios` INT NULL,
  `KidEncabezadoPedido` INT NULL,
  `KidCotizacionEncabezado` INT NULL,
  `fecha_facturaencabezado` DATE NULL,
  `descripcion_facturaencabezado` VARCHAR(45) NULL,
  `KidSerie` INT NOT NULL,
  `KidCliente` INT NOT NULL,
  `KidImpuesto` INT NOT NULL,
  `KidMoneda` INT NOT NULL,
  `KidDescuentos` INT NULL,
  `impuesto_facturaencabezado` DOUBLE NULL,
  `monto_facturaencabezado` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidFacturaEncabezado`, `KidSerie`),
  CONSTRAINT `fk_FacturaEncabezado_Cliente1`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `FK_EncabezadoPedido_FacturaEncabezado`
    FOREIGN KEY (`KidEncabezadoPedido`)
    REFERENCES `proyectogeneral`.`tbl_EncabezadoPedido` (`KidEncabezadoPedido`),
  CONSTRAINT `fk_FacturaEncabezado_Serie1`
    FOREIGN KEY (`KidSerie`)
    REFERENCES `proyectogeneral`.`Tbl_Serie` (`KidSerie`)
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
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_Descuentos_facturaEncabezado`
    FOREIGN KEY (`KidDescuentos`)
    REFERENCES `proyectogeneral`.`tbl_descuentos` (`KidDescuentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT `FK_EncabezadoLista_Precios_FacturaEncabezado`
    FOREIGN KEY (`KidEncabezadoListaPrecios`)
    REFERENCES `proyectogeneral`.`Tbl_Encabezado_Lista_Precios` (`KidEncabezadoListaPrecios`),
    CONSTRAINT `FK_cotizacionEncabezado_FacturaEncabezado`
    FOREIGN KEY (`KidCotizacionEncabezado`)
    REFERENCES `proyectogeneral`.`tbl_cotizacionEncabezado` (`KidCotizacionEncabezado`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS tbl_periodo(
	KidPeriodo INT NOT NULL,
    Periodo INT,
	estado TINYINT,
    PRIMARY KEY(KidPeriodo)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_EncabezadoComprobante`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_EncabezadoComprobante`(
  KidEncabezadoComprobante INT NOT NULL,
   KidFacturaEncabezado INT,
  KidCliente INT NOT NULL,
  KidEmpleado INT NOT NULL,
  KidtiposComprobantes INT NOT NULL,
  fecha DATE,
  Moneda VARCHAR(45),
  Cotizacion DOUBLE,
  Centro VARCHAR(45),
  fechaVencimiento DATE,
  Periodo INT,
  accion VARCHAR(45),
  estado TINYINT(1),
  PRIMARY KEY(KidEncabezadoComprobante),
  CONSTRAINT `FK_cliente_encabezadoComprobante`
  FOREIGN KEY(`KidCliente`)
  REFERENCES `proyectogeneral`.`Tbl_Clientes`(`KidCliente`),
  CONSTRAINT `FK_empleado_encabezadoComprobante`
  FOREIGN KEY(`KidEmpleado`)
  REFERENCES `proyectogeneral`.`tbl_empleado`(`KidEmpleado`),
  CONSTRAINT `FK_tipoComprobante_encabezadoComprobante`
  FOREIGN KEY(`KidtiposComprobantes`)
  REFERENCES `proyectogeneral`.`tbl_tipomovimiento`(`Kidtipomovimiento`),
  CONSTRAINT `FK_FacturaEncabezado_EncabezadoComprobante`
    FOREIGN KEY (`KidFacturaEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`),
     CONSTRAINT `FK_Periodo_EncabezadoComprobante`
    FOREIGN KEY (`Periodo`)
    REFERENCES `proyectogeneral`.`tbl_periodo` (`KidPeriodo`)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_DetalleComprobante`(
  KidDetalleComprobante INT NOT NULL,
  ValorComprobante DOUBLE,
  Descripcion VARCHAR(255),
  Descuento DOUBLE,
  Naturaleza VARCHAR(25),
  kidCodigoEncabezado INT NOT NULL,
  PRIMARY KEY(KidDetalleComprobante),
  CONSTRAINT `fk_encabezado_detalleMov`
  FOREIGN KEY  (`kidCodigoEncabezado`)
  REFERENCES `proyectogeneral`.`tbl_EncabezadoComprobante` (`KidEncabezadoComprobante`)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_EncabezadoPedido`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_EncabezadoPedido`(
	KidEncabezadoPedido INT NOT NULL,
    KidCotizacionEncabezado INT NULL,
    KidCliente INT,
    fecha_encabezado DATE,
    vencimiento_encabezado DATE,
    PRIMARY KEY(KidEncabezadoPedido),
    CONSTRAINT `FK_CotizacionEncabezado_EncabezadoPedido`
    FOREIGN KEY (`KidCotizacionEncabezado`)
    REFERENCES `proyectogeneral`.`tbl_cotizacionencabezado` (`KidCotizacionEncabezado`),
    CONSTRAINT `FK_clientes_EncabezadoPedido`
    FOREIGN KEY (`KidCliente`)
    REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_DetallePedido`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_DetallePedido`(
	KidDetallePedido INT NOT NULL,
    KidEncabezadoPedido INT,
    KidProducto INT,
    cantidad_Detallepedido INT,
    monto_Detallepedido DOUBLE,
    PRIMARY KEY(KidDetallePedido),
    CONSTRAINT `FK_EncabezadoPedido_DetallePedido1`
    FOREIGN KEY (`KidEncabezadoPedido`)
    REFERENCES `proyectogeneral`.`tbl_EncabezadoPedido` (`KidEncabezadoPedido`),
    CONSTRAINT `FK_Productos_DetallePedido1`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
)ENGINE=InnoDB;


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
  `KidSerie` INT NOT NULL,
   `estado` TINYINT,
  PRIMARY KEY (`kidDevoluciones`),
  CONSTRAINT `fk_Devoluciones_FacturaEncabezado1`
    FOREIGN KEY (`KidFacturaEncabezado`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_Devoluciones_Serie1`
    FOREIGN KEY (`KidSerie`)
    REFERENCES `proyectogeneral`.`Tbl_Serie` (`KidSerie`))
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
  `KidSerie` INT NOT NULL,
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
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_FacturaDetalle_Serie1`
    FOREIGN KEY (`KidSerie`)
    REFERENCES `proyectogeneral`.`Tbl_Serie` (`KidSerie`))
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
  `KidFacturaDetalle` INT,
  `descripcion` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `monto` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidPoliza`),
  CONSTRAINT `FK_FacturaDetalle_Poliza`
    FOREIGN KEY (`KidFacturaDetalle`)
    REFERENCES `proyectogeneral`.`Tbl_FacturaDetalle` (`KidFacturaDetalle`)
 )
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
  `KidProducto` INT NOT NULL,
  `fecha_comisiones` DATE NULL,
  `descripcion_comisiones` VARCHAR(45) NULL,
  `monto_comisiones` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidComisiones`),
   CONSTRAINT `fk_Producto_Comisiones`
    FOREIGN KEY (`KidProducto`)
    REFERENCES `proyectogeneral`.`Tbl_producto` (`KidProducto`))
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
    REFERENCES `proyectogeneral`.`tbl_empleado` (`KidEmpleado`)
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
  `KidProveedor` INT(16) NOT NULL,
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
  `KidBanco` INT(11) NOT NULL AUTO_INCREMENT,
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


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_Transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Transporte` (
 `KidTransporte` INT NOT NULL,
 `placa_transporte` VARCHAR(45) NULL,
 `chasis_transporte` VARCHAR(45) NULL,
 `nummotor_transporte` VARCHAR(45) NULL,
 `capacidad_transporte` INT NULL,
 `estado` TINYINT NULL,
 PRIMARY KEY (`KidTransporte`))
ENGINE = InnoDB;


-- --------------------------------------------------------------------------SCRIPT DE FINANZAS -----------------------------------------------------------------

 -- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_tipoCuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_tipoCuenta` (
  `KidTipoCuenta` VARCHAR(10) NOT NULL,
  `nombre_tipoCuenta` VARCHAR(25) NULL,
  `descripcion_tipoCuenta` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidTipoCuenta`))
ENGINE = InnoDB;
 
-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_cuentas` (
  `KidCuenta` VARCHAR(10) NOT NULL,
  `KidTipoCuenta` VARCHAR(10) NOT NULL,
  `Kidentificador` INT,	
  `nombre` VARCHAR(25) NULL,
  `descripcion` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidCuenta`, `KidTipoCuenta`,`Kidentificador`),
  CONSTRAINT `fk_tbl_cuentas_contables_tbl_tipoCuentaContable1`
    FOREIGN KEY (`KidTipoCuenta`)
    REFERENCES `proyectogeneral`.`tbl_tipoCuenta` (`KidTipoCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_tipo_poliza`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS tbl_tipo_poliza(
	KidTipoDePoliza VARCHAR(5) NOT NULL,
    descripcion VARCHAR(200),
    estado TINYINT,
    PRIMARY KEY(KidTipoDePoliza)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_poliza_encabezado`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS tbl_poliza_encabezado(
	KidPoliza INT NOT NULL AUTO_INCREMENT,
    KidTipoDePoliza VARCHAR(5) NOT NULL,
    KidDocumentoAsociado INT NOT NULL,
    descripcion VARCHAR(150),
    fecha_poliza DATE,
    total_poliza DOUBLE,
    estado TINYINT,
    PRIMARY KEY(KidPoliza, KidTipoDePoliza, KidDocumentoAsociado),
    CONSTRAINT `fk_tipoDePoliza_PolizaEncabezado`
    FOREIGN KEY (`KidTipoDePoliza`)
    REFERENCES `proyectogeneral`.`tbl_tipo_poliza` (`KidTipoDePoliza`)
)ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_poliza_detalle`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS tbl_poliza_detalle(
	KidPoliza INT NOT NULL,
    KidCuenta VARCHAR(10) NOT NULL,
    debe DOUBLE,
    haber DOUBLE,
    PRIMARY KEY (KidPoliza, KidCuenta),
    CONSTRAINT `fk_PolizaEncabezado_PolizaDetalle`
    FOREIGN KEY (`KidPoliza`)
    REFERENCES `proyectogeneral`.`tbl_poliza_encabezado` (`KidPoliza`),
    CONSTRAINT `fk_Cuentas_PolizaDetalle`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`)
)ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_libroDiario_Encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_libroDiario` (
  `KidLibroDiario` INT NOT NULL AUTO_INCREMENT,
  `KidPoliza` INT NOT NULL,
  `fecha` DATE NULL,
  `total_debe` FLOAT NULL,
  `total_haber` FLOAT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidLibroDiario`, `KidPoliza`),
  CONSTRAINT `fk_polizaEncabezado_libroDiario`
    FOREIGN KEY (`KidPoliza`)
    REFERENCES `proyectogeneral`.`tbl_poliza_encabezado` (`KidPoliza`))
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
-- Table `proyectogeneral`.`tbl_BalanceGeneral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_BalanceGeneral` (
  `KidBalanceGeneral` INT NOT NULL AUTO_INCREMENT,
  `KidCuenta` VARCHAR(10) NOT NULL,
  `debe` DOUBLE DEFAULT 0.0,
  `haber` DOUBLE DEFAULT 0.0,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidBalanceGeneral`),
  CONSTRAINT `fk_tbl_BalanceGeneral_tbl_cuentas_contables1`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`))
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


 -- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_divisa`
--

CREATE TABLE `tbl_divisa` (
  `KidDivisa` varchar(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `estado` TINYINT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estructura de tabla para la tabla `tbl_tipocambio`
--

CREATE TABLE `tbl_tipocambio` (
  `KidMonedaBase` varchar(11) NOT NULL,
  `KidMonedaConversion` varchar(11) NOT NULL,
  `tipo_cambio` float DEFAULT NULL,
  `fecha_tipo_cambio` date DEFAULT NULL	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indices de la tabla `tbl_divisa`
--
ALTER TABLE `tbl_divisa`
  ADD PRIMARY KEY (`KidDivisa`);

--
-- Indices de la tabla `tbl_tipocambio`
--
ALTER TABLE `tbl_tipocambio`
  ADD PRIMARY KEY (`KidMonedaBase`,`KidMonedaConversion`),
  ADD KEY `fk_tbl_tipoCambio_tbl_Divisa_idx` (`KidMonedaConversion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_tipocambio`
--
ALTER TABLE `tbl_tipocambio`
  ADD CONSTRAINT `fk_tbl_tipoCambio_tbl_Divisa` FOREIGN KEY (`KidMonedaConversion`) REFERENCES `tbl_divisa` (`KidDivisa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_tipoCambio_tbl_Divisa1` FOREIGN KEY (`KidMonedaBase`) REFERENCES `tbl_divisa` (`KidDivisa`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_presupuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_presupuesto` (
  `Kidpresupuesto` INT NOT NULL AUTO_INCREMENT,
  `KidMoneda` INT,
  `KidArea` INT NOT NULL,
  `KidCuenta` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45),
  `fecha` DATE NULL,
  `descripcion` VARCHAR(300) NULL,
  `monto` DOUBLE,
  `anotacion` VARCHAR(45),
  `estado` TINYINT NULL,
  PRIMARY KEY (`Kidpresupuesto`),
  CONSTRAINT `FK_Moneda_Presupuesto`
    FOREIGN KEY (`KidMoneda`)
    REFERENCES `proyectogeneral`.`tbl_moneda` (`KidMoneda`),
     CONSTRAINT `FK_area_presupuesto`
    FOREIGN KEY (`KidArea`)
    REFERENCES `proyectogeneral`.`tbl_areas` (`KidArea`),
   CONSTRAINT `FK_cuentas_presupuesto`
    FOREIGN KEY (`KidCuenta`)
    REFERENCES `proyectogeneral`.`tbl_cuentas` (`KidCuenta`)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `proyectogeneral`.`tbl_estado_perdidas_ganacias_Detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_estado_perdidas_ganacias_Detalle` (
  `KidPerdidasGanancias` INT NOT NULL,
  `KidCuenta`VARCHAR(10) NOT NULL,
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
  `KidCuenta` VARCHAR(10) NOT NULL,
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


-- --------------------------------------------------------

CREATE TABLE `proyectogeneral`.`tbl_tipocuentabancaria` (
 `KidTipoCuentaBancaria` INT(2) NOT NULL AUTO_INCREMENT , 
`Nombre` VARCHAR(20) NOT NULL , 
`Descripción` VARCHAR(100) NOT NULL , 
`estado` TINYINT(1) NOT NULL , 
PRIMARY KEY (`KidTipoCuentaBancaria`)) ENGINE = InnoDB;

--
-- Estructura de tabla para la tabla `tbl_cuentabancaria`
--

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`tbl_cuentabancaria` (
`KidCuentaBancaria` int(11) NOT NULL AUTO_INCREMENT,
`NumeroCuenta` varchar(20) NOT NULL,
`Descripcion` varchar(45) DEFAULT NULL,
`KidBanco` int(11) NOT NULL,
`KidMoneda` varchar(11) NOT NULL,
`Firmas_Individuales` varchar(45) DEFAULT NULL,
`Firmas_Conjuntas` varchar(45) DEFAULT NULL,
`Saldo` varchar(20) DEFAULT NULL,
`KidTipoCuentaBancaria` INT(2),
`estado` tinyint(1) NOT NULL,
PRIMARY KEY(KidCuentaBancaria),
 CONSTRAINT `FK_Bancos_CuentaBancaria`
    FOREIGN KEY (`KidBanco`)
    REFERENCES `proyectogeneral`.`tbl_bancos` (`KidBanco`),
     CONSTRAINT `FK_Moneda_CuentaBancaria`
    FOREIGN KEY (`KidMoneda`)
    REFERENCES `proyectogeneral`.`tbl_divisa` (`KidDivisa`),
    CONSTRAINT `FK_tipocuenta_CuetabancariaAL` 
    FOREIGN KEY (`KidTipoCuentaBancaria`) 
    REFERENCES `tbl_tipocuentabancaria`(`KidTipoCuentaBancaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_chequera`
--

CREATE TABLE `proyectogeneral`.`tbl_chequera` (
`KidChequera` int(4) NOT NULL AUTO_INCREMENT,
`KidCuentaBancaria` int(11) NOT NULL,
`No_cheques` int(4) NOT NULL,
`estado` tinyint(1) NOT NULL,
PRIMARY KEY(KidChequera),
CONSTRAINT `FK_CuentaBancaria_Chequera`
    FOREIGN KEY (`KidCuentaBancaria`)
    REFERENCES `proyectogeneral`.`tbl_cuentabancaria` (`KidCuentaBancaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------------------------SCRIPT DE RECURSOS HUMANOS -----------------------------------------------------------------
-- Funciona


--
-- Table structure for table `tbl_encabezadoReporte`
--

CREATE TABLE IF NOT EXISTS Tbl_EncabezadoReporteVacante(
	KidReporteVacante INT,
    KidEmpleado INT,
    KidPuesto INT,
    fechaCreacion DATE,
    tipoDeContratacion VARCHAR(45),
    estado TINYINT(1),
    PRIMARY KEY(`KidReporteVacante`),
    CONSTRAINT `FK_Empleado_ReporteVacante`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `proyectogeneral`.`tbl_empleado` (`KidEmpleado`),
	CONSTRAINT `FK_Puesto_ReporteVacante`
    FOREIGN KEY (`KidPuesto`)
    REFERENCES `proyectogeneral`.`tbl_puestos` (`KidPuesto`)
);

CREATE TABLE IF NOT EXISTS Tbl_DetalleReporteVacante(
	KidReporteVacante INT,
    razon VARCHAR(200),
    DescripcionCualidades VARCHAR(200),
    estado TINYINT(1),
    PRIMARY KEY(`KidReporteVacante`),
    CONSTRAINT `FK_Encabezado_DetalleReporteVacante`
    FOREIGN KEY(`KidReporteVacante`)
    REFERENCES `proyectogeneral`.`Tbl_EncabezadoReporteVacante`(`KidReporteVacante`)
);

CREATE TABLE IF NOT EXISTS Tbl_BancoTalento(
	KidBancoTalento INT,
    nombre_candidato VARCHAR(45),
    apellido_candidato VARCHAR(45),
    numero INT,
    direccion VARCHAR(45),
    correoelectronico VARCHAR(45),
    KidReporteVacante INT,
    estado TINYINT(1),
    PRIMARY KEY(`KidBancoTalento`),
    CONSTRAINT `FK_encabezadoReporteVacante_BancoTalento`
    FOREIGN KEY(`KidReporteVacante`)
    REFERENCES `proyectogeneral`.`Tbl_EncabezadoReporteVacante`(`KidReporteVacante`)
);

CREATE TABLE IF NOT EXISTS Tbl_Pruebas(
	KidPruebas INT,
    nombre VARCHAR(45),
    descripcion VARCHAR(45),
    TiempoDuracion VARCHAR(45),
    PreRequisitos VARCHAR(45),
    estado TINYINT(1),
    PRIMARY KEY(`KidPruebas`)
);

CREATE TABLE IF NOT EXISTS Tbl_Resultados(
	KidResultados INT,
    KidBancoTalento INT,
    KidPruebas INT,
    Resultado VARCHAR(45),
    estado TINYINT(1),
    PRIMARY KEY(`KidResultados`),
    CONSTRAINT `FK_BancoTalento_Resultados`
    FOREIGN KEY(`KidBancoTalento`)
    REFERENCES `proyectogeneral`.`Tbl_BancoTalento`(`KidBancoTalento`),
    CONSTRAINT `FK_Pruebas_Resultados`
    FOREIGN KEY(`KidPruebas`)
    REFERENCES `proyectogeneral`.`Tbl_Pruebas`(`KidPruebas`)
);



CREATE TABLE `tbl_nominasencabezado` (
  `KidNomina` int(11) NOT NULL,
  `KidEmpleado` int(11) NOT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `totalnominal` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `periodo_inicial`  date DEFAULT NULL,
  `periodo_final`  date DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`KidNomina`),
  KEY `fk_Tbl_nominasEncabezado_Tbl_empleado1_idx` (`KidEmpleado`),
  CONSTRAINT `fk_Tbl_nominasEncabezado_Tbl_empleado1` FOREIGN KEY (`KidEmpleado`) REFERENCES `tbl_empleado` (`KidEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `tbl_nominasdetalle`
--

DROP TABLE IF EXISTS `tbl_nominasdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_nominasdetalle` (
  `KidLinea` int(11)  NOT NULL AUTO_INCREMENT,
  `KidNomina` int(11) NOT NULL,
  `sueldo_bruto` float DEFAULT NULL,
  `sueldo_liquido` float DEFAULT NULL,
  PRIMARY KEY (`KidLinea`,`KidNomina`),
  KEY `fk_Tbl_nominasDetalle_Tbl_nominasEncabezado1_idx` (`KidNomina`),
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


CREATE TABLE `tbl_empcontable` (
  `KidEmpContable` int(11)  NOT NULL AUTO_INCREMENT,
  `KidEmpleado` int(11) NOT NULL,
  `dias` int(11) DEFAULT NULL,
  `salariobase` float DEFAULT NULL,
  `KidConcepto` int(11) NOT NULL,
  `total` float DEFAULT NULL,
  `suma_resta` tinyint(2) DEFAULT NULL,
  `sueldo_bruto` float DEFAULT NULL,
  `sueldo_liquido` float DEFAULT NULL,
  PRIMARY KEY (`KidEmpContable`,`KidEmpleado`),
  KEY `fk_tbl_empcontable_Tbl_empleados_idx` (`KidEmpleado`),
  CONSTRAINT `fk_tbl_empcontable_Tbl_empleados` FOREIGN KEY (`KidEmpleado`) REFERENCES `tbl_empleado` (`KidEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_empcontable_Tbl_conceptos` FOREIGN KEY (`KidConcepto`) REFERENCES `tbl_conceptos` (`KidConcepto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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

CREATE TABLE `proyectogeneral`.`tbl_desempeñoempleado` (
  `KidDesempeño` INT NOT NULL,
  `KidEmpleado` INT NOT NULL,
  `KidPruebas` INT NOT NULL,
  `Resultado` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidDesempeño`, `KidEmpleado`, `KidPruebas`),
  CONSTRAINT `FK_Empleado_DesempeñoEmpleado`
    FOREIGN KEY (`KidEmpleado`)
    REFERENCES `proyectogeneral`.`tbl_empleado` (`KidEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pruebas_DesempeñoEmpleado`
    FOREIGN KEY (`KidPruebas`)
    REFERENCES `proyectogeneral`.`tbl_pruebas` (`KidPruebas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `proyectogeneral`.`tbl_plandecarrera` (
  `KidPlanCarrera` INT NOT NULL,
  `KidDesempeño` INT NOT NULL,
  `Fecha` DATE NULL,
  `Descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`KidPlanCarrera`, `KidDesempeño`),
 CONSTRAINT `FK_DesempeñoEmpleado_PlanDeCarrera`
    FOREIGN KEY (`KidDesempeño`)
    REFERENCES `proyectogeneral`.`tbl_desempeñoempleado` (`KidDesempeño`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- ------------------------------------------ OBJETO COMUNES (COMPONENTES) ------------------------------------


-- --------------------------------------------- NAVEGADOR ---------------------------------

CREATE TABLE `ayuda` (
  `Id_ayuda` int(11) NOT NULL,
  `Ruta` text COLLATE utf8_unicode_ci NOT NULL,
  `indice` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` TINYINT(1)
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

CREATE PROCEDURE procedimientoInsertarDetallePoliza(IN idPoliza INT, IN idCuenta VARCHAR(15), IN debe DOUBLE, IN haber DOUBLE)
BEGIN
  INSERT INTO tbl_poliza_detalle VALUES(idPoliza, idCuenta, debe, haber);
END$$

CREATE PROCEDURE procedimientoInsertarEncabezadoPoliza(IN idTipoPoliza VARCHAR(15), IN idDocAsociado VARCHAR(15), IN descripcion VARCHAR(100), IN total DOUBLE) 
BEGIN
  DECLARE idPoliza INT;
    SELECT idPoliza = MAX(KidPoliza) FROM tbl_poliza_encabezado;
    IF idPoliza = NULL
    THEN
		SET idPoliza = 0;
	ELSE 
		SET idPoliza = idPoliza+1;
    END IF;
    INSERT INTO tbl_poliza_encabezado VALUES(idPoliza,idTipoPoliza,idDocAsociado,descripcion,CURDATE(), total, '1');
END$$

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

-- ----------------------------------------- CONSULTAS INTELIGENTES ----------------------------------------------------------

CREATE TABLE IF NOT EXISTS tbl_consulta(
  `KidConsulta` int(11) NOT NULL,
  `cadena_consulta` varchar(255) DEFAULT NULL,
  `nombreconsulta_consulta` varchar(45) DEFAULT NULL,
  `descripcion_consulta` VARCHAR(255) DEFAULT NULL,
  `KidUsuario` varchar(45),
  `disponible` tinyint(1) NOT NULL,
  PRIMARY KEY(KidConsulta, KidUsuario),
  CONSTRAINT `FK_usuario_consulta`
  FOREIGN KEY(`KidUsuario`)
  REFERENCES `proyectogeneral`.`tbl_usuario`(`PK_id_usuario`)
)ENGINE = InnoDB;


-- ---------------------------------------------- REPORTEADOR -----------------------------------------

CREATE TABLE `tbl_reporte`(
	`PK_id_reporte` int(12) NOT NULL,
    `nombre` varchar(95) NOT NULL,
    `nombre_archivo` varchar(100) NOT NULL, 
    `estado` tinyint default NULL 
);
ALTER TABLE `tbl_reporte` ADD CONSTRAINT PRIMARY KEY (`PK_id_reporte`);	

CREATE TABLE `Tbl_rpt_app`(
	`PK_id_reporte` int(12) NOT NULL,
	`PK_id_aplicacion` int(11) NOT NULL,
	`PK_id_Modulo` int(11) NOT NULL,
    `estado` tinyint default NULL 
);
ALTER TABLE `Tbl_rpt_app` ADD CONSTRAINT PRIMARY KEY (`PK_id_reporte` , `PK_id_aplicacion`, `PK_id_Modulo`);
ALTER TABLE `Tbl_rpt_app` ADD CONSTRAINT `FK_Tbl_Reporte_Tbl_rpt_app` FOREIGN KEY (`PK_id_reporte`)
REFERENCES `tbl_reporte` (`PK_id_reporte`);
ALTER TABLE `Tbl_rpt_app` ADD CONSTRAINT `FK_Tbl_Aplicacion_Tbl_rpt_app` FOREIGN KEY (`PK_id_aplicacion`)
REFERENCES `tbl_aplicacion` (`PK_id_aplicacion`);
ALTER TABLE `Tbl_rpt_app` ADD CONSTRAINT `FK_Tbl_Modulo_Tbl_rpt_app` FOREIGN KEY (`PK_id_Modulo`)
REFERENCES `tbl_modulo` (`PK_id_Modulo`);

CREATE TABLE `Tbl_rpt_mdl` (
	`PK_id_reporte` int(12) NOT NULL,
	`PK_id_Modulo` int(11) NOT NULL,
    `estado` tinyint default NULL 
);
ALTER TABLE `Tbl_rpt_mdl` ADD CONSTRAINT PRIMARY KEY (`PK_id_reporte`, `PK_id_Modulo`);
ALTER TABLE `Tbl_rpt_mdl` ADD CONSTRAINT `FK_Tbl_reporte_Tbl_rpt_mdl` FOREIGN KEY (`PK_id_reporte`)
REFERENCES `tbl_reporte` (`PK_id_reporte`);
ALTER TABLE `Tbl_rpt_mdl` ADD CONSTRAINT `FK_Tbl_modulo_Tbl_rpt_mdl` FOREIGN KEY (`PK_id_Modulo`)
REFERENCES `tbl_modulo` (`PK_id_Modulo`);

CREATE TABLE `Tbl_propiedad_Rpt` (
	`PK_id_reporte` int (12) NOT NULL,
	`PK_id_usuario` varchar(25) NOT NULL,
	`PK_id_aplicacion` int(11) NOT NULL,
	`PK_id_Modulo` int(11) NOT NULL,
	`imprimir` tinyint default NULL,
    `estado` tinyint default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----- CAMBIO AL SCRIPT---------------------------------------
ALTER TABLE `Tbl_propiedad_Rpt` ADD CONSTRAINT PRIMARY KEY
(`PK_id_Modulo`, `PK_id_usuario`, `PK_id_aplicacion`);

-- ---------------------------------------------------------------

ALTER TABLE `Tbl_propiedad_Rpt` ADD CONSTRAINT `FK_Tbl_reporte_Tbl_propiedad_Rpt` FOREIGN KEY (`PK_id_reporte`)
	REFERENCES `tbl_reporte` (`PK_id_reporte`);
ALTER TABLE `Tbl_propiedad_Rpt` ADD CONSTRAINT `FK_Tbl_usuario_Tbl_propiedad_Rpt` FOREIGN KEY (`PK_id_usuario`)
	REFERENCES `tbl_usuario` (`PK_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `Tbl_propiedad_Rpt` ADD CONSTRAINT `FK_Tbl_Aplicacio_Tbl_propiedad_Rpt` FOREIGN KEY (`PK_id_aplicacion`)
	REFERENCES `tbl_aplicacion` (`PK_id_aplicacion`);
ALTER TABLE `Tbl_propiedad_Rpt` ADD CONSTRAINT `FK_Tbl_Modulo_Tbl_propiedad_Rpt` FOREIGN KEY (`PK_id_Modulo`)
	REFERENCES `tbl_modulo` (`PK_id_Modulo`);


-- --------------------------- CAMBIOS ---------------------------------------------------------


-- -----------------------------------------------------
-- Table `tbl_tipo_movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_tipo_movimiento` (
  `KidTipoMovimiento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(200) NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidTipoMovimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tbl_libro_bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_libro_bancos` (
  `KidMovimientoBancario` INT NOT NULL AUTO_INCREMENT,
  `cuenta_debito` BIGINT(20) NOT NULL,
  `cuenta_credito` BIGINT(20) NOT NULL,
  `monto` DOUBLE NOT NULL,
  `tipo_movimiento` VARCHAR(45) NULL,
  `fecha_movimiento` DATE NULL,
  `beneficiario` VARCHAR(45) NULL,
  `descripcion` VARCHAR(400) NULL,
  `movimiento_conciliado` TINYINT NULL,
  `movimiento_trasladado_contabilidad` TINYINT NULL,
  `KidCuenta_Contable_debito`  VARCHAR(10) NULL,
  `KidCuenta_Contable_Credito` VARCHAR(10) NULL,
  `KiDTipo_movimiento` INT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidMovimientoBancario`),
  CONSTRAINT `fk_tbl_libro_bancos_tbl_tipo_movimiento`
    FOREIGN KEY (`KiDTipo_movimiento`)
    REFERENCES `tbl_tipo_movimiento` (`KidTipoMovimiento`),
    CONSTRAINT `FK_cuentaContable_cuentaDebito`
    FOREIGN KEY (`KidCuenta_Contable_debito`)
    REFERENCES `tbl_cuentas` (`KidCuenta`),
    CONSTRAINT `FK_cuentaContable_cuentaCredito`
    FOREIGN KEY (`KidCuenta_Contable_Credito`)
    REFERENCES `tbl_cuentas` (`KidCuenta`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tbl_conciliacion_bancaria_encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_conciliacion_bancaria_encabezado` (
  `KidConciliacion_Bancaria` INT NOT NULL AUTO_INCREMENT,
  `KidBanco` INT NOT NULL,
  `moneda` VARCHAR(45) NOT NULL,
  `mes_conciliacion` VARCHAR(45) NOT NULL,
  `diferencia_total` DOUBLE NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidConciliacion_Bancaria`),
  CONSTRAINT `FK_Bancos_ConciliacionEncabezado`
  FOREIGN KEY(`KidBanco`)
  REFERENCES `tbl_bancos`(`KidBanco`),
  CONSTRAINT `FK_Moneda_ConciliacionEncabezado`
  FOREIGN KEY(`moneda`)
  REFERENCES `tbl_divisa`(`KidDivisa`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tbl_conciliacion_bancaria_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_conciliacion_bancaria_detalle` (
  `KidConciliacion_Bancaria` INT NOT NULL,
  `KidMovimientoBancario` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidConciliacion_Bancaria`, `KidMovimientoBancario`),
  CONSTRAINT `fk_tbl_conciliacion_bancaria_detalle_tbl_conciliacion_bancari1`
    FOREIGN KEY (`KidConciliacion_Bancaria`)
    REFERENCES `tbl_conciliacion_bancaria_encabezado` (`KidConciliacion_Bancaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_conciliacion_bancaria_detalle_tbl_libro_bancos1`
    FOREIGN KEY (`KidMovimientoBancario`)
    REFERENCES `tbl_libro_bancos` (`KidMovimientoBancario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE `proyectogeneral`.`tbl_perfil_profesional` (
  `KidPerfil` INT NOT NULL,
  `Nombre_Puesto` VARCHAR(45) NULL,
  `Ubicacion_Organigrama` VARCHAR(45) NULL,
  `Descripcion_Tareas` VARCHAR(45) NULL,
  `Objetivo_Principal` VARCHAR(100) NULL,
  `Conocimientos_Necesarios` VARCHAR(100) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidPerfil`));

CREATE TABLE `proyectogeneral`.`tbl_medios_comunicacion` (
  `KidMediosComunicacion` INT NOT NULL,
  `Nombre_medio` VARCHAR(45) NULL,
  `Tipo_medio` VARCHAR(45) NULL,
  `Contacto_medio` VARCHAR(45) NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidMediosComunicacion`));

CREATE TABLE `proyectogeneral`.`tbl_curriculums` (
  `KidCurriculum` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Correo_Electronico` VARCHAR(45) NULL,
  `Conocimientos` VARCHAR(45) NULL,
  `Experiencia_Previa` VARCHAR(45) NULL,
  `KidReporteVacante` INT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`KidCurriculum`),
  CONSTRAINT `FK_encabezadoReporteVacante_Curriculums`
    FOREIGN KEY (`KidReporteVacante`)
    REFERENCES `proyectogeneral`.`tbl_encabezadoreportevacante` (`KidReporteVacante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_MovimientoEncabezado`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_MovimientoEncabezado` ( 
`KidMovimientoEncabezado` INT NOT NULL,
`fecha_movimientoencabezado` DATE NULL,
`concepto_movimientoencabezado` VARCHAR(45) NULL,
`KidTipoMovimiento` INT NOT NULL,
`KidBodega_destino` INT(16)  NULL,
`KidBodega_origen` INT(16)  NULL,
`KidProveedor` INT NULL,
`KidClientes` INT NULL,
`KidOrdenCompraEncabezado` INT(16)  NULL,
`KidFacturaEncabezado` INT  NULL,
`estado` TINYINT NULL,
PRIMARY KEY (`KidMovimientoEncabezado`),
CONSTRAINT `fk_Tbl_MovimientoEncabezado_Tbl_Proveedor1`
FOREIGN KEY (`KidProveedor`)
REFERENCES `proyectogeneral`.`Tbl_Proveedor` (`KidProveedor`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Tbl_MovimientoEncabezado_Tbl_TipoMovimiento1`
FOREIGN KEY (`KidTipoMovimiento`)
REFERENCES `proyectogeneral`.`tbl_tipo_movimiento` (`KidTipoMovimiento`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Tbl_MovimientoEncabezado_Tbl_Bodega1`
FOREIGN KEY (`KidBodega_destino`)
REFERENCES `proyectogeneral`.`tbl_bodega` (`KidBodega`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Tbl_MovimientoEncabezado_Tbl_Bodega2`
FOREIGN KEY (`KidBodega_origen`)
REFERENCES `proyectogeneral`.`tbl_bodega` (`KidBodega`)
ON DELETE NO ACTION
ON UPDATE NO ACTION, 
CONSTRAINT `fk_Tbl_MovimientoEncabezado_Tbl_FacturaEnca`
FOREIGN KEY (`KidFacturaEncabezado`)
REFERENCES `proyectogeneral`.`Tbl_FacturaEncabezado` (`KidFacturaEncabezado`)
ON DELETE NO ACTION
ON UPDATE NO ACTION, 
CONSTRAINT `fk_Tbl_MovimientoEncabezado_Tbl_OrdenCompra`
FOREIGN KEY (`KidOrdenCompraEncabezado`)
REFERENCES `proyectogeneral`.`Tbl_orden_compra_encabezado` (`KidOrdenCompraEncabezado`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_Tbl_MovimientoEncabezado_Tbl_Clientes1`
FOREIGN KEY (`KidClientes`)
REFERENCES `proyectogeneral`.`Tbl_Clientes` (`KidCliente`)
ON DELETE NO ACTION
ON UPDATE NO ACTION) 
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectogeneral`.`Tbl_MovimientoDetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_MovimientoDetalle` (
 `KidMovimientoDetalle` INT NOT NULL,
  `cantidad_movimientodetalle` INT NULL,
  `KidProducto` INT NOT NULL,
  `KidMovimientoEncabezado` INT NOT NULL,
  `estado` TINYINT NULL,
  PRIMARY KEY (`KidMovimientoDetalle`,`KidMovimientoEncabezado`),
  CONSTRAINT `fk_Tbl_MovimientoDetalle_Tbl_MovimientoEncabezado1`
 FOREIGN KEY (`KidMovimientoEncabezado`)
  REFERENCES `proyectogeneral`.`Tbl_MovimientoEncabezado` (`KidMovimientoEncabezado`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tbl_MovimientoDetalle_Tbl_Producto1`
  FOREIGN KEY (`KidProducto`)
 REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`)
 ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `proyectogeneral`.`Tbl_Producto_Tbl_Bodega` ( 
`KidProducto` INT NOT NULL, 
`KidBodega` INT NOT NULL, 
`stockmin_producto_bodega` VARCHAR(45) NULL, 
`stockmax_producto_bodega` VARCHAR(45) NULL, 
`stock_producto_bodega` VARCHAR(45) NULL, 
`KidSucursal` INT NOT NULL, `KidTransporte` INT NOT NULL, 
`estado` TINYINT NULL, PRIMARY KEY (`KidProducto`, `KidBodega`), 
CONSTRAINT `fk_Tbl_Producto_has_Tbl_Bodega_Tbl_Producto` 
FOREIGN KEY (`KidProducto`) 
REFERENCES `proyectogeneral`.`Tbl_Producto` (`KidProducto`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION, 
CONSTRAINT `fk_Tbl_Producto_has_Tbl_Bodega_Tbl_Bodega1`
FOREIGN KEY (`KidBodega`) 
REFERENCES `proyectogeneral`.`Tbl_Bodega` (`KidBodega`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION, 
CONSTRAINT `fk_Tbl_Producto_Tbl_Bodega_Tbl_Sucursal1` 
FOREIGN KEY (`KidSucursal`) 
REFERENCES `proyectogeneral`.`Tbl_Sucursal` (`KidSucursal`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION, 
CONSTRAINT `fk_Tbl_Producto_Tbl_Bodega_Tbl_Transporte1` 
FOREIGN KEY (`KidTransporte`) 
REFERENCES `proyectogeneral`.`Tbl_Transporte` (`KidTransporte`) 
ON DELETE NO ACTION 
ON UPDATE NO ACTION) 
ENGINE = InnoDB; 


CREATE TABLE IF NOT EXISTS tbl_bebidas(
	KidBebida INT(11) NOT NULL AUTO_INCREMENT,
    KidMenu INT(11),
    nombreBebida VARCHAR(50),
    precio FLOAT,
    estado TINYINT(1) DEFAULT 1,
    PRIMARY KEY(KidBebida),
    CONSTRAINT `tbl_menus_bebidas` 
	FOREIGN KEY (`KidMenu`) 
	REFERENCES `proyectogeneral`.`tbl_menus` (`KidMenu`) 
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS tbl_produccion_encabezado(
	KidEncabezado INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    fecha date,
    concepto VARCHAR(50),
    estado TINYINT(1) DEFAULT 1,
	PRIMARY KEY(KidEncabezado)
)ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS tbl_produccion_detalle(
	KidOrden INT(11) NOT NULL AUTO_INCREMENT,
    KidPlatillo INT(11),
    KidEncabezado INT(11),
    KidBebida INT(11),
    Cantidad INT(4),
    estado TINYINT(1) DEFAULT 1,
    PRIMARY KEY(KidOrden),
    CONSTRAINT `tbl_produccionEncabezado_Detalle` 
	FOREIGN KEY (`KidEncabezado`) 
	REFERENCES `proyectogeneral`.`tbl_produccion_encabezado` (`KidEncabezado`),
    CONSTRAINT `tbl_platillos_produccionDetalle` 
	FOREIGN KEY (`KidPlatillo`) 
	REFERENCES `proyectogeneral`.`tbl_platillos` (`KidPlatillo`),
     CONSTRAINT `tbl_bebidas_produccionDetalle` 
	FOREIGN KEY (`KidBebida`) 
	REFERENCES `proyectogeneral`.`tbl_bebidas` (`KidBebida`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS reportes(
	Id_reporte INT(11),
    ruta VARCHAR(100),
    estado TINYINT(1),
    PRIMARY KEY(Id_reporte)
)ENGINE = InnoDB;

-- ---------------- ALTER TABLE --------------------------
ALTER TABLE tbl_producto_marca ADD estado TINYINT;
ALTER TABLE tbl_tipoproducto ADD estado TINYINT;
ALTER TABLE tbl_bodega ADD CONSTRAINT	 FK_Sucursal_Bodega	FOREIGN KEY(KidSucursal) REFERENCES tbl_sucursal(KidSucursal);
ALTER TABLE `proyectogeneral`.`tbl_resultados` 
CHANGE COLUMN `Resultado` `Resultado` INT NULL DEFAULT NULL;

ALTER TABLE `proyectogeneral`.`tbl_encabezadoreportevacante` 
DROP FOREIGN KEY `FK_Puesto_ReporteVacante`;
ALTER TABLE `proyectogeneral`.`tbl_encabezadoreportevacante` 
DROP COLUMN `KidPuesto`,
ADD COLUMN `KidPerfil` INT NOT NULL AFTER `KidEmpleado`,
ADD COLUMN `KidMedioComunicacion` INT NOT NULL AFTER `tipoDeContratacion`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`KidReporteVacante`, `KidPerfil`, `KidMedioComunicacion`),
DROP INDEX `FK_Puesto_ReporteVacante` ;

ALTER TABLE `proyectogeneral`.`tbl_encabezadoreportevacante` 
CHANGE COLUMN `KidReporteVacante` `KidReporteVacante` INT(11) NOT NULL AUTO_INCREMENT ;
ALTER TABLE `tbl_balancegeneral` ADD `fecha_balance` DATE NOT NULL AFTER `KidCuenta`;

ALTER TABLE `proyectogeneral`.`tbl_detallereportevacante` 
DROP COLUMN `razon`,
ADD COLUMN `Primaria` TINYINT(1) NULL AFTER `KidReporteVacante`,
ADD COLUMN `Secundaria` TINYINT(1) NULL AFTER `Primaria`,
ADD COLUMN `Bachillerato` TINYINT(1) NULL AFTER `Secundaria`,
ADD COLUMN `Estudiante_Universitario` TINYINT(1) NULL AFTER `Bachillerato`,
ADD COLUMN `GraduadoU` TINYINT(1) NULL AFTER `Estudiante_Universitario`,
ADD COLUMN `CursoExtra` TINYINT(1) NULL AFTER `GraduadoU`,
ADD COLUMN `Sueldo_Base` DOUBLE NULL AFTER `DescripcionCursos`,
CHANGE COLUMN `DescripcionCualidades` `DescripcionCursos` VARCHAR(200) NULL DEFAULT NULL ;

ALTER TABLE `proyectogeneral`.`tbl_curriculums` 
DROP COLUMN `Conocimientos`,
ADD COLUMN `Primaria` TINYINT(1) NULL AFTER `Correo_Electronico`,
ADD COLUMN `Secundaria` TINYINT(1) NULL AFTER `Primaria`,
ADD COLUMN `Bachillerato` TINYINT(1) NULL AFTER `Secundaria`,
ADD COLUMN `Estudiante_Universitario` TINYINT(1) NULL AFTER `Bachillerato`,
ADD COLUMN `GraduadoU` TINYINT(1) NULL AFTER `Estudiante_Universitario`,
ADD COLUMN `CursoExtra` TINYINT(1) NULL AFTER `GraduadoU`,
ADD COLUMN `DescripcionCursos` VARCHAR(100) NULL AFTER `CursoExtra`,
ADD COLUMN `SueldoEsperado` DOUBLE NULL AFTER `Experiencia_Previa`;

ALTER TABLE `proyectogeneral`.`tbl_bancotalento` 
DROP FOREIGN KEY `FK_encabezadoReporteVacante_BancoTalento`;
ALTER TABLE `proyectogeneral`.`tbl_bancotalento` 
DROP COLUMN `KidReporteVacante`,
DROP COLUMN `correoelectronico`,
DROP COLUMN `direccion`,
DROP COLUMN `numero`,
DROP COLUMN `apellido_candidato`,
DROP COLUMN `nombre_candidato`,
ADD COLUMN `KidCurriculum` INT NOT NULL AFTER `KidBancoTalento`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`KidBancoTalento`, `KidCurriculum`),
DROP INDEX `FK_encabezadoReporteVacante_BancoTalento` ;
;

ALTER TABLE `proyectogeneral`.`tbl_bancotalento` 
CHANGE COLUMN `KidBancoTalento` `KidBancoTalento` INT(11) NOT NULL AUTO_INCREMENT ;


ALTER TABLE `proyectogeneral`.`tbl_encabezadoreportevacante` 
ADD CONSTRAINT `FK_Perfil_ReporteVacante`
  FOREIGN KEY (`KidPerfil`)
  REFERENCES `proyectogeneral`.`tbl_perfil_profesional` (`KidPerfil`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_Medio_ReporteVacante`
  FOREIGN KEY (`KidMedioComunicacion`)
  REFERENCES `proyectogeneral`.`tbl_medios_comunicacion` (`KidMediosComunicacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `proyectogeneral`.`tbl_bancotalento` 
ADD CONSTRAINT `FK_Curriculum_BancoT`
  FOREIGN KEY (`KidCurriculum`)
  REFERENCES `proyectogeneral`.`tbl_curriculums` (`KidCurriculum`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- ---------------- INSERTS DE PRUEBA -----------------------

-- MANTENIMIENTOS
INSERT INTO tbl_modulo(PK_id_Modulo, nombre_modulo, descripcion_modulo, estado_modulo)
VALUES (1,'Contabilidad', 'Contabilidad', 1);

INSERT INTO tbl_aplicacion(PK_id_aplicacion, PK_id_modulo, nombre_aplicacion, descripcion_aplicacion, estado_aplicacion)
VALUES(1, 1, 'Tipo Cuenta Contable', 'Tipo Cuenta Contable', 1);

INSERT INTO tbl_aplicacion(PK_id_aplicacion, PK_id_modulo, nombre_aplicacion, descripcion_aplicacion, estado_aplicacion)
VALUES(2, 1, 'Cuentas Contables', 'Cuentas Contables', 1);

INSERT INTO tbl_aplicacion(PK_id_aplicacion, PK_id_modulo, nombre_aplicacion, descripcion_aplicacion, estado_aplicacion)
VALUES(3, 1, 'Tipo Poliza', 'Tipo Poliza', 1);

INSERT INTO tbl_usuario_aplicacion(PK_id_usuario, PK_id_aplicacion, ingresar, consultar, modificar, eliminar, imprimir)
VALUES('MiUsuario',1,1,1,1,1,1);

INSERT INTO tbl_usuario_aplicacion(PK_id_usuario, PK_id_aplicacion, ingresar, consultar, modificar, eliminar, imprimir)
VALUES('MiUsuario',2,1,1,1,1,1);

INSERT INTO tbl_usuario_aplicacion(PK_id_usuario, PK_id_aplicacion, ingresar, consultar, modificar, eliminar, imprimir)
VALUES('MiUsuario',3,1,1,1,1,1);

-- AYUDAS FINANZAS
INSERT INTO ayuda(Id_ayuda, Ruta, indice, estado) VALUES(500, 'Ayudas/Man-TipoPoliza.chm', 'Mantenimiento-TipoPoliza.html',1);
INSERT INTO ayuda(Id_ayuda, Ruta, indice, estado) VALUES(501, 'Ayudas/Man-TipoCC.chm', 'Mantenimiento-TipoCuentaContable.html',1);
INSERT INTO ayuda(Id_ayuda, Ruta, indice, estado) VALUES(503, 'Ayudas/Man-CuentaContable.chm', 'Mantenimiento-CuentaContable.html',1);
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('504', 'Man-CuentasBancarias-Bancos.chm', 'Man-CuentasBancarias-Bancos.html', '1'), ('505', 'Man-Chequeras-Bancos.chm', 'Man-Chequeras-Bancos.html', '1'), ('506', 'Man-Bancos-Bancos.chm', 'Man-Bancos-Bancos.html', '1'), ('507', 'Man-ClasMovs-Bancos.chm', 'Man-ClasMovs-Bancos.html', '1');

-- AYUDAS RECURSOS HUMANOS

INSERT INTO ayuda values(401,"Página web ayuda/Ayuda-Rhhh.chm","Area.html",1);
INSERT INTO ayuda values(402,"Página web ayuda/Ayuda-Rhhh.chm","Conceptos.html",1);
INSERT INTO ayuda values(403,"Página web ayuda/Ayuda-Rhhh.chm","Departamentos.html",1);
INSERT INTO ayuda values(404,"Página web ayuda/Ayuda-Rhhh.chm","Empleados.html",1);
INSERT INTO ayuda values(405,"Página web ayuda/Ayuda-Rhhh.chm","Prueba.html",1);
INSERT INTO ayuda values(406,"Página web ayuda/Ayuda-Rhhh.chm","Puestos.html",1);
INSERT INTO ayuda values(407,"Página web ayuda/Ayuda-Rhhh.chm","Roles de pago.html",1);
INSERT INTO ayuda values(408,"Página web ayuda/Ayuda-Rhhh.chm","Curriculum.html",1);
INSERT INTO ayuda values(409,"Página web ayuda/Ayuda-Rhhh.chm","MediosComunicacion.html",1);
INSERT INTO ayuda values(410,"Página web ayuda/Ayuda-Rhhh.chm","Perfil_Profesional.html",1);

-- AYUDAS HOTELERIA

INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('301', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'DMI.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('302', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Habitaciones.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('303', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Tipodehabitaciones.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('304', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'CategoriaHabitaciones.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('305', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Salones.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('306', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Mesa.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('307', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Tienda.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('308', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Menu.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('309', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Area.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('310', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Servicios.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('311', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Comanda.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('312', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Recetas.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('313', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'Platillos.html', '1');
INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`, `estado`) VALUES ('314', 'Ayuda-Hoteleria/Ayuda-Hotel.chm', 'ObjetosP.html', '1');


-- AYUDAS VENTAS

INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`,`estado`) VALUES
(100, 'AyudasVentas\\Ayudas_Ventas.chm', 'index1.html','1'),
(101, 'AyudasVentas\\Ayudas_Ventas.chm', 'index2.html','1'),
(102, 'AyudasVentas\\Ayudas_Ventas.chm', 'index3.html','1'),
(103, 'AyudasVentas\\Ayudas_Ventas.chm', 'index4.html','1'),
(104, 'AyudasVentas\\Ayudas_Ventas.chm', 'index5.html','1'),
(105, 'AyudasVentas\\Ayudas_Ventas.chm', 'index6.html','1'),
(106, 'AyudasVentas\\Ayudas_Ventas.chm', 'index7.html','1'),
(107, 'AyudasVentas\\Ayudas_Ventas.chm', 'index8.html','1'),
(108, 'AyudasVentas\\Ayudas_Ventas.chm', 'index9.html','1'),
(109, 'AyudasVentas\\Ayudas_Ventas.chm', 'index10.html','1'),
(110, 'Ayudas_CtasporCobrar\\Ayudas_CuentasPorCobrar.chm', 'index.html','1'),
(111, 'Ayudas_CtasporCobrar\\Ayudas_CuentasPorCobrar.chm', 'index11a.html','1'),
(112, 'Ayudas_CtasporCobrar\\Ayudas_CuentasPorCobrar.chm', 'indexab.html','1'),
(113, 'Ayudas_CtasporCobrar\\Ayudas_CuentasPorCobrar.chm', 'index61.html','1'),
(114, 'AyudasVentas\\Ayudas_Ventas.chm', 'indexaaaa.html','1'),
(115, 'Ayudas_CtasporCobrar\\Ayudas_CuentasPorCobrar.chm', 'index879.html','1');

-- CUENTAS CONTABLES
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('1', 'ACTIVO', 'ACTIVO', 1);
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('1.1', 'ACTIVO CORRIENTE', 'ACTIVO CORRIENTE', 1);
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('1.2', 'ACTIVO NO CORRIENTE', 'ACTIVO NO CORRIENTE', 1);

INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('2', 'PASIVO', 'PASIVO', 1);
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('2.1', 'PASIVO CORRIENTE', 'PASIVO CORRIENTE', 1);
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('2.2', 'PASIVO NO CORRIENTE', 'PASIVO NO CORRIENTE', 1);

INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('3.1', 'CAPITAL', 'CAPITAL', 1);
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('4.1', 'INGRESOS', 'INGRESOS', 1);
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('5.1', 'COMPRAS', 'COMPRAS', 1);
INSERT INTO tbl_tipocuenta(KidTipoCuenta, nombre_tipoCuenta, descripcion_tipoCuenta, estado) VALUES('6.1', 'GASTOS', 'GASTOS', 1);


INSERT INTO `tbl_cuentas` (`KidCuenta`, `KidTipoCuenta`, `Kidentificador`, `nombre`, `descripcion`, `estado`) VALUES
('1.1.1', '1.1', 100, 'Caja', 'Caja', 1),
('1.1.2', '1.1', 101, 'Bancos', 'Bancos', 1),
('1.1.3', '1.1', 103, 'Clientes', 'Clientes', 1),
('1.1.4', '1.1', 104, 'IVA por Cobrar', 'IVA por Cobrar', 1),
('1.1.5', '1.1', 105, 'Cuentas Por Cobrar', 'Cuentas Por Cobrar', 1),
('1.1.6', '1.1', 106, 'Inventarios Neto', 'Inventarios Neto', 1),
('1.1.7', '1.1', 107, 'Mercaderia', 'Mercaderia', 1),
('1.1.10', '1.1', 108, 'Valores Mobiliarios', 'Valores Mobiliarios', 1),
('1.2.1', '1.2', 201, 'Equipo De Computo', 'Equipo De Computo', 1),
('1.2.2', '1.2', 202, 'Mobiliario y Equipo', 'Mobiliario y Equipo', 1),
('1.2.3', '1.2', 203, 'Inmueble', 'Inmueble', 1),
('1.2.4', '1.2', 204, 'Licencias y programas', 'Licencias y programas', 1),
('1.2.5', '1.2', 205, 'Vehiculos', 'Vehiculos', 1),
('1.2.6', '1.2', 206, 'Patente de comercio', 'Patente de comercio', 1),
('1.2.7', '1.2', 207, 'Papeleria y utiles', 'Papeleria y utiles', 1),
('1.2.8', '1.2', 208, 'Gastos de Organizacion e ', 'Gastos de Organizacion e Inst', 1),
('1.2.9', '1.2', 209, 'Alquieres pagados por ant', 'Alquileres pagados por anticipado', 1),
('1.2.10', '1.2', 209, 'Edificios', 'Edificios', 1),
('2.1.1', '2.1', 301, 'IVA por Pagar', 'IVA Por Pagar', 1),
('2.1.2', '2.1', 302, 'Cuentas Por Pagar', 'Cuentas Por Pagar', 1),
('2.1.3', '2.1', 303, 'Proveedores', 'Proveedores', 1),
('2.1.4', '2.1', 304, 'Retencion IGSS Laboral', 'Retencion IGSS Laboral', 1),
('2.1.5', '2.1', 305, 'Prestaciones Laborales', 'Prestaciones Laborales Por pagar', 1),
('2.1.10', '2.1', 306, 'Acreedores', 'Acreedores', 1),
('2.2.1', '2.2', 401, 'Hipoteca', 'Hipoteca', 1),
('2.2.2', '2.2', 402, 'Documentos Por Pagar', 'Documentos Por Pagar', 1),
('2.2.3', '2.2', 403, 'Prestamos Bancarios', 'Prestamos Bancarios', 1),
('2.2.10', '2.2', 404, 'Impuesto sobre la renta', 'Impuesto sobre la renta', 1),
('3.1.1', '3.1', 501, 'Capital', 'Capital', 1),
('3.1.2', '3.1', 502, 'Ganancia En Operacion', 'Ganancia En Operacion', 1),
('4.1.1', '4.1', 601, 'Ventas', 'Ventas', 1),
('4.1.2', '4.1', 602, 'Descuentos Sobre Comrpas', 'Descuentos Sobre Compras', 1),
('4.1.3', '4.1', 603, 'Intereses Cobrados', 'Intereses Cobrados', 1),
('4.1.10', '4.1', 604, 'Seguros Pagados Anticipad', 'Seguros Pagados Por Anticipado', 1),
('5.1.1', '5.1', 701, 'Compras', 'Compras', 1),
('6.1.1', '6.1', 801, 'Publicidad', 'Publicidad', 1),
('6.1.2', '6.1', 802, 'Combustibles', 'Combustibles', 1),
('6.1.3', '6.1', 803, 'Cuota Patronal', 'Cuota Patronal', 1),
('6.1.4', '6.1', 804, 'Seguros Vencidos', 'Seguros Vencidos', 1),
('6.1.10', '6.1', 805, 'Depreciaciones', 'Depreciaciones', 1);

INSERT INTO `tbl_balancegeneral` (`KidBalanceGeneral`, `KidCuenta`, `fecha_balance`, `debe`, `haber`, `estado`) VALUES
(1, '1.1.1', '2019-11-14', 2000, 0, 1),
(2, '1.1.2', '2019-11-14', 63103, 0, 1),
(3, '1.1.4', '2019-11-14', 16363.26, 0, 1),
(4, '1.1.7', '2019-11-14', 42554.2, 0, 1),
(5, '1.1.10', '2019-11-14', 10000, 0, 1),
(6, '1.2.2', '2019-11-14', 9025.6, 0, 1),
(7, '1.2.5', '2019-11-14', 75410, 0, 1),
(8, '1.2.7', '2019-11-14', 395.7, 0, 1),
(9, '1.2.8', '2019-11-14', 2100, 0, 1),
(10, '1.2.9', '2019-11-14', 7500, 0, 1),
(11, '2.1.3', '2019-11-14', 0, 17021.68, 1),
(12, '2.1.10', '2019-11-14', 0, 4520.3, 1),
(13, '2.2.2', '2019-11-14', 0, 30000, 1),
(14, '2.2.10', '2019-11-14', 0, 74.71, 1),
(15, '3.1.1', '2019-11-14', 176835.07, 0, 1);


-- TIPOS DE POLIZA
INSERT INTO tbl_tipo_poliza(KidTipoDePoliza, descripcion, estado) VALUES('V','Ventas', 1);
INSERT INTO tbl_tipo_poliza(KidTipoDePoliza, descripcion, estado) VALUES('C','Compras', 1);
INSERT INTO tbl_tipo_poliza(KidTipoDePoliza, descripcion, estado) VALUES('B','Bancos', 1);
INSERT INTO tbl_tipo_poliza(KidTipoDePoliza, descripcion, estado) VALUES('H','Hoteleria', 1);
INSERT INTO `proyectogeneral`.`tbl_tipo_poliza` (`KidTipoDePoliza`, `descripcion`, `estado`) VALUES ('R', 'Recursos Humanos', '1');

-- POLIZAS
INSERT INTO tbl_poliza_encabezado (`KidPoliza`, `KidTipoDePoliza`, `KidDocumentoAsociado`, `descripcion`, `fecha_poliza`, `total_poliza`, `estado`) VALUES ('2', 'V', '1', 'Ventas', '2019-10-31', '2000', '1');

INSERT INTO tbl_poliza_detalle (`KidPoliza`, `KidCuenta`, `debe`, `haber`) VALUES ('2', '1.1.1', '1000', '0');
INSERT INTO tbl_poliza_detalle (`KidPoliza`, `KidCuenta`, `debe`, `haber`) VALUES ('2', '1.1.2', '1000', '0');
INSERT INTO tbl_poliza_detalle (`KidPoliza`, `KidCuenta`, `debe`, `haber`) VALUES ('2', '2.1.1', '0', '1750');
INSERT INTO tbl_poliza_detalle (`KidPoliza`, `KidCuenta`, `debe`, `haber`) VALUES ('2', '2.1.2', '0', '250');

INSERT INTO tbl_poliza_encabezado (`KidPoliza`, `KidTipoDePoliza`, `KidDocumentoAsociado`, `descripcion`, `fecha_poliza`, `total_poliza`, `estado`) VALUES ('3', 'H', '1', 'Hoteleria', '2019-10-25', '500', '1');

INSERT INTO tbl_poliza_detalle (`KidPoliza`, `KidCuenta`, `debe`, `haber`) VALUES ('3', '1.1.1', '500', '0');
INSERT INTO tbl_poliza_detalle (`KidPoliza`, `KidCuenta`, `debe`, `haber`) VALUES ('3', '2.1.1', '0', '500');

INSERT INTO `ayuda` (`Id_ayuda`, `Ruta`, `indice`,`estado`) VALUES (512, 'Ayudas/CreacionPresupuesto.chm', 'Creacion-Presupueto.html',1);

INSERT INTO `tbl_moneda` (`KidMoneda`, `nombre_moneda`, `tasa_moneda`, `estado`) VALUES ('1', 'USD', '', '1');
INSERT INTO `tbl_moneda` (`KidMoneda`, `nombre_moneda`, `tasa_moneda`, `estado`) VALUES ('2', 'GTQ', '', '1');
INSERT INTO `tbl_moneda` (`KidMoneda`, `nombre_moneda`, `tasa_moneda`, `estado`) VALUES ('3', 'EUR', '', '1');

INSERT INTO `tbl_areas` (`KidArea`, `nombreArea`, `estado`) VALUES ('1', 'Ventas', '1');
INSERT INTO `tbl_areas` (`KidArea`, `nombreArea`, `estado`) VALUES ('2', 'Compras', '1');
INSERT INTO `tbl_areas` (`KidArea`, `nombreArea`, `estado`) VALUES ('3', 'Hoteleria', '1');
INSERT INTO `proyectogeneral`.`tbl_areas` (`KidArea`, `nombreArea`, `estado`) VALUES ('4', 'Area4', '1');
INSERT INTO `tbl_areas`(`KidArea`, `nombreArea`, `estado`) VALUES ('5','Gimnasio',1), ('6','Tecnologia',1), ('7','Restaurante',1), ('8','Piscina',1);


INSERT INTO `proyectogeneral`.`tbl_areas` (`KidArea`, `nombreArea`, `estado`) VALUES ('9', 'Area5', '1');

INSERT INTO `proyectogeneral`.`tbl_areas` (`KidArea`, `nombreArea`, `estado`) VALUES ('10', 'Area6', '1');


INSERT INTO `tbl_presupuesto` (`Kidpresupuesto`, `KidMoneda`, `KidArea`, `KidCuenta`, `nombre`, `fecha`, `descripcion`, `monto`, `anotacion`, `estado`) VALUES ('1', '1', '2', '1.1.1', 'Ventas', '2019-11-04', 'Preuba Presupuesto', '3500', 'Ninguna', '2');
INSERT INTO `tbl_presupuesto` (`Kidpresupuesto`, `KidMoneda`, `KidArea`, `KidCuenta`, `nombre`, `fecha`, `descripcion`, `monto`, `anotacion`, `estado`) VALUES ('2', '2', '2', '1.1.2', 'Hoteleria', '2019-11-10', 'Prueba Prespuesto', '2500', 'Ninguna', '1');
INSERT INTO `tbl_presupuesto` (`Kidpresupuesto`, `KidMoneda`, `KidArea`, `KidCuenta`, `nombre`, `fecha`, `descripcion`, `monto`, `anotacion`, `estado`) VALUES ('3', '2', '2', '2.1.2', 'Compras', '2019-11-10', 'Prueba Prespuesto', '5550', 'Ningunsa', '0');

INSERT INTO `tbl_tipocuentabancaria` (`KidTipoCuentaBancaria`, `Nombre`, `Descripción`, `estado`) VALUES
(1, 'Corriente', 'Cuenta Corriente', 1),
(2, 'Ahorro', 'Cuenta ahorro', 1);


INSERT INTO `tbl_tipo_movimiento` (`KidTipoMovimiento`, `nombre`, `descripcion`, `estado`) VALUES
(2, 'Salarios', 'Pago empleados', 1),
(3, 'Proveedores', 'pago a proveedores', 1),
(4, 'Papelería y Útiles', 'Gastos de Oficina', 1),
(5, 'Cuentas por Pagar a Largo Plazo', 'Cuentas por pagar', 1),
(6, 'Depósito', 'Ingreso a Cuenta Bancaria', 1),
(7, 'Transferencias Propias', 'flujo entre cuentas bancarias', 1);

INSERT INTO `tbl_bancos` (`KidBanco`, `nombre`, `descripcion`, `estado`) VALUES
(2, 'Industrial', 'Siempre de tu lado.', 1),
(3, 'Banrural', 'El amigo que te ayuda a crecer', 1),
(4, 'G&T Continental', 'El banco de tu vida', 1),
(5, 'Bantrab', 'El banco de los trabajadores', 1);

INSERT INTO `tbl_divisa` (`KidDivisa`, `Nombre`, `estado`) VALUES
('GTQ', 'Quetzal', 1),
('EUR', 'Euro', 1),
('USD', 'Dolar Estadounidense', 1);

INSERT INTO `tbl_cuentabancaria` (`KidCuentaBancaria`, `NumeroCuenta`, `Descripcion`, `KidBanco`, `KidMoneda`, `Firmas_Individuales`, `Firmas_Conjuntas`, `Saldo`, `KidTipoCuentaBancaria`, `estado`) VALUES
(2, '2899049300', 'Cuenta Hotel San Carlos', 4, 'GTQ', 'Francisco Pérez', 'Hotel San Carlos S.A.', '9554', 1, 1),
(3, '8475639128', 'Cuenta Banrural Hotel San Carlos', 3, 'GTQ', 'Charlie Brown', 'Hote San Carlos S.A.', '50600', 1, 1),
(4, '3892761726', 'Cuenta de Bantrab', 5, 'GTQ', 'Eduardo Colón', 'Hotel San Carlos S.A.', '4768', 1, 1);


INSERT INTO `tbl_chequera` (`KidChequera`, `KidCuentaBancaria`, `No_cheques`, `estado`) VALUES
(2, 2, -1, 1),
(3, 4, -1, 1),
(4, 3, 29, 1);

INSERT INTO `tbl_libro_bancos` (`KidMovimientoBancario`, `cuenta_debito`, `cuenta_credito`, `monto`, `tipo_movimiento`, `fecha_movimiento`, `beneficiario`, `descripcion`, `movimiento_conciliado`, `movimiento_trasladado_contabilidad`, `KidCuenta_Contable_debito`, `KidCuenta_Contable_Credito`, `KiDTipo_movimiento`, `estado`) VALUES
(6, 8475639128, 3892761726, 200, 'Cheques', '2019-11-12', 'Eduardo Colon', 'Pago a proveedores', 0, 0, '1.1.2', '1.1.1', 3, 1),
(7, 2899049300, 2899049300, 200, 'Transacciones entre Cuentas propias', '2019-11-12', 'Eduardo Colon', 'transferencia propia', 0, 0, '1.1.1', '1.1.2', 7, 1),
(8, 0, 8475639128, 150, 'Depositos', '2019-11-12', 'Rodolfo', 'Pago por servicios', 0, 0, '1.1.3', '1.1.2', 6, 1),
(9, 0, 8475639128, 150, 'Depositos', '2019-11-12', 'Rodolfo', 'Pago por servicios', 0, 0, '1.1.3', '1.1.2', 6, 1),
(10, 2899049300, 2323222, 300, 'ACH (Pagos por transferencia)', '2019-11-12', 'Arnoldo', 'Compra de materiales', 0, 0, '1.1.2', '1.1.1', 4, 1),
(11, 3892761726, 2899049300, 232, 'Transacciones entre Cuentas propias', '2019-11-12', 'Eduardo', 'Pago entre cuentas propias', 0, 0, '1.1.1', '1.1.2', 7, 1),
(12, 0, 8475639128, 200, 'Depositos', '2019-11-12', 'Eduardo', 'Deposito a cuenta', 0, 0, '1.1.1', '1.1.2', 6, 1),
(13, 0, 8475639128, 300, 'Depositos', '2019-11-12', 'Rodolfo', 'Pago por salarios', 0, 0, '1.1.3', '1.1.2', 6, 1),
(14, 8475639128, 0, 400, 'Cheques', '2019-11-12', 'Eduardo', 'Para pago de salarios', 0, 0, '1.1.2', '1.1.3', 2, 1);


-- PUESTOS

INSERT INTO `proyectogeneral`.`tbl_puestos` (`KidPuesto`, `KidArea`, `nombre`, `descripcion`, `sueldofijo`, `estado`) VALUES ('1', '1', 'Puesto1', 'Desc', '1000', '1');

INSERT INTO `proyectogeneral`.`tbl_puestos` (`KidPuesto`, `KidArea`, `nombre`, `descripcion`, `sueldofijo`, `estado`) VALUES ('2', '2', 'Puesto2', 'Desc', '2000', '1');

INSERT INTO `proyectogeneral`.`tbl_puestos` (`KidPuesto`, `KidArea`, `nombre`, `descripcion`, `sueldofijo`, `estado`) VALUES ('3', '3', 'Puesto3', 'Desc', '3000', '1');


/*DEPARTAMENTOS*/
INSERT INTO `proyectogeneral`.`tbl_departamentos` (`KidDepartamento`, `nombre`, `numdepartamento`, `direccion`, `telefono`, `KidArea`, `estado`) VALUES ('1', 'Depa1', '10', 'Dir1', '24345234', '1', '1');

INSERT INTO `proyectogeneral`.`tbl_departamentos` (`KidDepartamento`, `nombre`, `numdepartamento`, `direccion`, `telefono`, `KidArea`, `estado`) VALUES ('2', 'Depa2', '20', 'Dir2', '54234234', '2', '1');

INSERT INTO `proyectogeneral`.`tbl_departamentos` (`KidDepartamento`, `nombre`, `numdepartamento`, `direccion`, `telefono`, `KidArea`, `estado`) VALUES ('3', 'Depa3', '30', 'Dir3', '34455632', '3', '1');

/*EMPLEADOS*/
INSERT INTO `proyectogeneral`.`tbl_empleado` (`KidEmpleado`, `nombres`, `apellidos`, `dpi`, `nit`, `direccion`, `telefono`, `telefonoalternativo`, `correo`, `correoalternativo`, `fechanacimiento`, `estadoCivil`, `KidPuesto`, `KidDepartamento`, `estado`) VALUES ('1', 'Emp1', 'afaf', '2342', '32432', 'werew', '23324', '52352', 'weerw', 'dsf', '2019-10-10', '1', '1', '1', '1');

INSERT INTO `proyectogeneral`.`tbl_empleado` (`KidEmpleado`, `nombres`, `apellidos`, `dpi`, `nit`, `direccion`, `telefono`, `telefonoalternativo`, `correo`, `correoalternativo`, `fechanacimiento`, `estadoCivil`, `KidPuesto`, `KidDepartamento`, `estado`) VALUES ('2', 'Emp2', 'asdf', '234', '5325', 'ewrew', '345', '6436', 'wert', 'rete', '2019-11-11', '1', '2', '2', '1');

INSERT INTO `proyectogeneral`.`tbl_empleado` (`KidEmpleado`, `nombres`, `apellidos`, `dpi`, `nit`, `direccion`, `telefono`, `telefonoalternativo`, `correo`, `correoalternativo`, `fechanacimiento`, `estadoCivil`, `KidPuesto`, `KidDepartamento`, `estado`) VALUES ('3', 'Emp3', 'agsda', '234', '264', 'rwer', '6426', '754', 'ter', 'eter', '2018-10-10', '1', '3', '3', '1');

/*EMP CONTABLE*/
insert into proyectogeneral.tbl_empcontable value (7,1,30,0,1,120,1,0,0);
    
insert into proyectogeneral.tbl_empcontable value (8,2,30,0,1,240,1,0,0);
    
insert into proyectogeneral.tbl_empcontable value (9,3,30,0,1,360,1,0,0);

/*NOMINAS*/
INSERT INTO `proyectogeneral`.`tbl_nominasencabezado` (`KidNomina`, `KidEmpleado`, `observaciones`, `totalnominal`, `fecha`, `periodo_inicial`, `periodo_final`, `estado`) VALUES ('1', '1', 'Observacion1', '10000', '2019-11-11', '2019-10-10', '2019-11-11', '1');

INSERT INTO `proyectogeneral`.`tbl_nominasencabezado` (`KidNomina`, `KidEmpleado`, `observaciones`, `totalnominal`, `fecha`, `periodo_inicial`, `periodo_final`, `estado`) VALUES ('2', '2', 'Observacion2', '20000', '2019-10-10', '2019-09-10', '2019-10-10', '1');

INSERT INTO `proyectogeneral`.`tbl_nominasencabezado` (`KidNomina`, `KidEmpleado`, `observaciones`, `totalnominal`, `fecha`, `periodo_inicial`, `periodo_final`, `estado`) VALUES ('3', '3', 'Observacion3', '30000', '2019-05-05', '2019-01-01', '2019-07-07', '1');

/*INTEGRACION*/
INSERT INTO `tbl_curriculums` VALUES (1,'ivan','ivan','123','15 calle','ivan',1,1,1,1,1,1,'asiiiii','qweqwe',100,7,1),(2,'fabio','fabio','456','78 avenida','fabio',1,1,0,1,1,1,'assssssssss','qweqwewqe',500,7,1),(3,'iker','iker','098','71 calle','iker',1,0,0,0,0,0,'qwe','asdass',50,7,1);
INSERT INTO `tbl_bancotalento` VALUES (1,1,1),(2,2,1),(3,3,1);


INSERT INTO `tbl_perfil_profesional` VALUES (1,'conta','2','asfad','conta','asdfghj',1),(2,'pogra','3','qwertyu','progra','asdfghjf',1);
INSERT INTO `tbl_medios_comunicacion` VALUES (1,'internet','internet','123',1),(2,'periodico','periodico','321',1);
INSERT INTO `tbl_encabezadoreportevacante` VALUES (1,1,1,'2019-08-11','Planilla',1,1),(1,2,2,'2019-11-16','Contrato Temporal',2,1),(2,2,2,'2019-11-09','Contrato Indefinido',2,1),(3,1,1,'2019-11-09','Contrato Indefinido',1,1),(4,1,1,'2019-11-09','Planilla',1,1),(5,1,1,'2019-11-09','Contrato Indefinido',1,1),(6,1,1,'2019-11-08','Contrato Indefinido',1,1),(7,1,1,'2019-11-09','Contrato Indefinido',1,1),(8,1,1,'2019-11-11','Planilla',1,1);
INSERT INTO `tbl_detallereportevacante` VALUES (1,1,1,1,1,1,0,'No tiene',1000,1),(2,1,1,0,0,0,1,'adios',10.5,1),(3,1,0,0,0,0,1,'asd',11,1),(4,1,0,0,0,0,1,'we',100,1),(5,1,0,0,0,0,1,'qweewqweq',12,1),(6,1,0,0,0,0,0,'',1050.3,1),(7,1,0,0,0,0,0,'',50,1),(8,1,0,0,0,0,1,'Curso de tecnico.',5000,1);
INSERT INTO `tbl_pruebas` VALUES (1,'d','d','1:10','1',1),(2,'As','as','2:50','1',1);

INSERT INTO `tbl_resultados` VALUES (1,1,1,'12',1),(2,1,2,'50',1);
INSERT INTO `tbl_desempeñoempleado` VALUES (1,1,1,80,1),(2,1,2,90,1);

-- REPORTES HOTELERIA

INSERT INTO `reportes` (`Id_reporte`, `ruta`, `estado`) VALUES
 
(308, 'C:/Users/Randy/Desktop/Reportes/reporteMENUS.rpt', 1),

(309, 'C:/Users/Randy/Desktop/Reportes/reporteAREAS.rpt', 1),

(310, 'C:/Users/Randy/Desktop/Reportes/reporteSERVICIOS.rpt', 1),

(311, 'C:/Users/Randy/Desktop/Reportes/reporteCOMANDAS.rpt', 1);

/* PRODUCCIÓN ENCABEZADO */
INSERT INTO `tbl_produccion_encabezado` (`KidEncabezado`, `nombre`, `fecha`, `concepto`, `estado`) VALUES 
('1', 'Juan', '2019-11-08', 'evento 15 años', '1');

/* MENUS */
INSERT INTO `tbl_menus` (`KidMenu`, `nombreMenu`, `estado`) VALUES
 (1, 'Desayunos', 1), 
(2, 'Almuerzos', 1), (3, 'Postres', 1),

(4, 'Bebidas Naturales', 1),
(5, 'Bebidas Alcoholicas', 1);


/* BEBIDAS */
INSERT INTO `tbl_bebidas`(`KidBebida`, `KidMenu`, `nombreBebida`, `precio`, `estado`) VALUES ('1','5','Corona','15','1');
INSERT INTO `tbl_bebidas`(`KidBebida`, `KidMenu`, `nombreBebida`, `precio`, `estado`) VALUES ('2','4','Horchata','10','1');
INSERT INTO `tbl_bebidas`(`KidBebida`, `KidMenu`, `nombreBebida`, `precio`, `estado`) VALUES ('3','4','jamaica','10','1');

/* PRODUCCIÓN DETALLE */
INSERT INTO `tbl_produccion_detalle` (`KidOrden`, `KidPlatillo`, `KidEncabezado`, `KidBebida`, `cantidad`, `estado`) VALUES 
(1, '1', '1', '1', '10', '1');


/* SERVICIOS */
INSERT INTO `tbl_servicios` (`KidServicio`, `KidArea`, `nombreServicio`, `estado`) VALUES ('1', '3', 'Restaurante', '1');


/* COMANDAS */
INSERT INTO `tbl_comandas` (`KidNumeroComanda`, `KidServicio`, `estado`) VALUES ('1', '1', '1');


/* PLATILLOS */
INSERT INTO `tbl_platillos` (`KidPlatillo`, `KidMenu`, `nombrePlatillo`, `precio`, `estado`) VALUES
(1, 1, 'Palitos de Pan', 35, 1),
(2, 1, 'Quesitos Dobles', 25, 1),
(3, 1, 'Bocaditos de Carne', 40, 0),
(4, 1, 'Pan de Ajo', 35, 1),
(5, 1, 'Nachos Supremos', 25, 1);


/* RECETAS */
INSERT INTO `tbl_recetas` (`KidRecetas`, `receta`, `estado`) VALUES
(1, 'Camarones', 1),
(2, 'Filete bulebu', 0),
(3, 'Arroz BLanco', 1),
(4, 'Ensalada Cesear', 1),
(5, 'Pollo con Champiñones', 1);

/* TIPO HABITACIÓN */
INSERT INTO `tbl_tipo_habitacion` (`KidTipoHabitacion`, `numeroCamas`, `numeroAmbientes`, `numeroPersonas`, `estado`) VALUES ('Especial', '5', '8', '2', '1');
INSERT INTO `tbl_tipo_habitacion` (`KidTipoHabitacion`, `numeroCamas`, `numeroAmbientes`, `numeroPersonas`, `estado`) VALUES ('Normal', 5, 6, '6', 1);


/* CATEGORIA HABITACIÓN */
INSERT INTO `tbl_categorias_habitacion` (`KidCategoria`, `estado`) VALUES ('Familiar', 1),('Individual', 1), ('VIP', 1);

/* HABITACIONES */
INSERT INTO `tbl_habitaciones` (`KidNumeroHabitacion`, `KidTipoHabitacion`, `KidCategoria`, `precio`, `estado`, `disponibilidad`) VALUES 
(1, 'Especial', 'Familiar', 3500, 1, 1),
(2, 'Especial', 'Individual', 3450, 1, 1),
(3, 'Especial', 'Familiar', 1775, 1, 1); 


/* OBJETOS PERDIDOS */
INSERT INTO `tbl_objetos_perdidos` (`KidObjeto`, `KidNumeroHabitacion`, `fecha`, `descripcion`, `estado`) VALUES
(1, 1, '2019-11-13', 'Zapato Rojo', 1),
(2, 1, '2019-11-13', 'Camisa Colo Azul', 0),
(3, 1, '2019-11-13', 'Reloj Casio', 1),
(4, 1, '2019-11-13', 'Corbata Negra', 0),
(5, 1, '2019-11-13', 'Gorra Blanca', 1);

/* SALONES */
INSERT INTO `tbl_salones` (`KidNumeroSalon`, `capacidad`, `precio`, `estado`) VALUES ('1', '20', '1200', '1');
INSERT INTO `tbl_salones` (`KidNumeroSalon`, `capacidad`, `precio`, `estado`) VALUES ('2', '20', '3000', '1');

/* TIENDAS */
INSERT INTO `tbl_tiendas`(`KidTienda`, `KidArea`, `descripcion`, `estado`) VALUES 
('1','2','Deportes','1'), ('2','3','Comedor','1'), ('3','3','Dulceria','1'), ('4','1','Cosmeticos','1'); 


/* MESAS */
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (1, '3', '4','1', '1');
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (2, '3', '8','3', '1');
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (3, '3', '4','3', '1');
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (4, '3', '2','1', '1');
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (5, '1', '4','2', '1');
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (6, '1', '4','3', '1');
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (7, '1', '4','2', '1');
INSERT INTO `tbl_mesas` (`KidNumeroMesa`, `KidArea`, `capacidad`, `estadoMesa`, `estado`) VALUES (8, '1', '4','2', '1');

use proyectogeneral;

-- ------------------------------------------------------------TITPO PRODUCTO ------------------------------------------------------------------------------
INSERT INTO `tbl_tipoproducto`(`KidTipoProducto`, `tipo_tipoproducto`, `descripcion_tipoproducto`) VALUES (1,'Pintura de Hule Cubeta','Pintura de Hule ');
INSERT INTO `tbl_tipoproducto`(`KidTipoProducto`, `tipo_tipoproducto`, `descripcion_tipoproducto`) VALUES (2,'Pintura de Aceite Cubeta','Pintura de Aceite');
INSERT INTO `tbl_tipoproducto`(`KidTipoProducto`, `tipo_tipoproducto`, `descripcion_tipoproducto`) VALUES (3,'Brochas','Brochas');
INSERT INTO `tbl_tipoproducto`(`KidTipoProducto`, `tipo_tipoproducto`, `descripcion_tipoproducto`) VALUES (4,'Solvente','Solvente');
INSERT INTO `tbl_tipoproducto`(`KidTipoProducto`, `tipo_tipoproducto`, `descripcion_tipoproducto`) VALUES (5,'Pintura de Hule Galon','Pintura de Hule ');
INSERT INTO `tbl_tipoproducto`(`KidTipoProducto`, `tipo_tipoproducto`, `descripcion_tipoproducto`) VALUES (6,'Pintura de Aceite Galon','Pintura de Aceite');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------------MARCA----------------------------------------------------------------------------------------
INSERT INTO `tbl_producto_marca`(`Kidproducto`, `Kidmarca`) VALUES ('1','Sherwin Williams');
INSERT INTO `tbl_producto_marca`(`Kidproducto`, `Kidmarca`) VALUES ('2','Protecto');
INSERT INTO `tbl_producto_marca`(`Kidproducto`, `Kidmarca`) VALUES ('3','Corona');

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------


-- -----------------------------------------------------------PRODUCTO---------------------------------------------------------------------------------------
-- ----Cubetas---
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('1','1','Pintura de Hule ','Color azul Sherwin Williams','1','10','2777.6');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('2','1','Pintura de Hule ','Color rojo Sherwin Williams','1','12','3333.12');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('3','1','Pintura de Hule ','Color amarillo Sherwin Williams','1','13','3610.88');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('4','1','Pintura de Hule ','Color verde Sherwin Williams','1','14','3888.64');
-- -----Galones

INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('5','5','Pintura de Hule ','Color amarillo Sherwin Williams','1','50','2777.5');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('6','5','Pintura de Hule ','Color verde Sherwin Williams','1','55','3055.25');

-- -----Protecto---------

INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('7','1','Pintura de Hule ','Color naranja Protecto','1','8','1366.4');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('8','1','Pintura de Hule ','Color melon Protecto','1','10','1708');

INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('9','5','Pintura de Hule ','Color Zapote Protecto','1','30','1024.8');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('10','5','Pintura de Hule ','Color VioletaProtecto','1','32','1093.12');

-- --------Corona-----------

INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('11','6','Pintura de Aceite ','Color gris Corona','1','25','4323.25');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('12','6','Pintura de Aceite ','Color negro Corona','1','35','6052.55');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('13','6','Pintura de Aceite ','Color cafe Corona','1','38','6571.4');

-- ---Brochas

INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('14','3','Brochas ','Tamaño 5 pulgadas','1','40','461.6');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('15','3','Brochas ','Tamaño 4 pulgadas','1','40','367.2');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('16','3','Brochas ','Tamaño 3 pulgadas','1','40','260');
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('17','3','Brochas ','Tamaño 2 pulgadas','1','40','161.2');

-- ---solventes
INSERT INTO `tbl_producto`(`KidProducto`, `KidTipoProducto`, `nombre_producto`, `descripcion_producto`, `estado`,`Cantidad_Producto`,`Precio_Producto`) VALUES ('18','4','Solvente ','Botellas','1','50','106.5');

INSERT INTO `tbl_comisiones`(`KidComisiones`, `KidProducto`, `fecha_comisiones`, `descripcion_comisiones`, `monto_comisiones`, `estado`) VALUES ('1','1','31-01-2019','Vendedora Morena Quijada otuvo comision','200 ','1');
INSERT INTO `tbl_comisiones`(`KidComisiones`, `KidProducto`, `fecha_comisiones`, `descripcion_comisiones`, `monto_comisiones`, `estado`) VALUES ('2','1','31-01-2019','Vendedora Simeona Gallina del Monte recibe comsion','200 ','1');
	
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