-- CREATE DATABASE HotelSanCarlosCompras CHARACTER SET UTF8;
create schema HotelSanCarlosCompra;
USE HotelSanCarlosCompra;

-- TABLAS
CREATE TABLE Tbl_orden_compra_encabezado(
	Kid_orden_compra_encabezado int(16) not null, 
	estadoOrdenCompraEncabezado		tinyint(1) NOT NULL, 
    fechaEmisionOrdenCompraEncabezado 	date NOT NULL,
    fechaRevisionOrdenCompraEncabezado  date NOT NULL,
    nombreOrdenCompraEncabezado	varchar(30),
    descripcionOrdenCompraEncabezado 	varchar(100),
    fechaEstimadaEntregaOrdenCompraEncabezado  datetime,
    estado TINYINT(1) NULL DEFAULT '1'
);

CREATE TABLE Tbl_orden_compra_detalle(
	Kid_orden_compra_encabezado int(16) not null, 
	Kid_orden_compra_detalle int(16) not null, 
	Kid_producto_encabezado int(16) not null, 
	Kid_proveedor int(16) not null, 
    precioUnitario	FLOAT(4,2),
    cantidadProducto INT(3), 
    estado TINYINT(1) NULL DEFAULT '1'
);

CREATE TABLE Tbl_bodega (
	Kid_bodega	INT(16),
    Kid_sucursal INT(16),
    direccion VARCHAR(20),
    maxStock INT(3),
    minStock INT(3),
    nombre VARCHAR(30),
    descripcion VARCHAR(100),
    estado TINYINT(1) NULL DEFAULT '1'
);

CREATE TABLE Tbl_producto_encabezado(
    Kid_producto_encabezado INT(16),
    nombre 	VARCHAR(30),
    descripcion VARCHAR(100), 
    estado TINYINT(1) NULL DEFAULT '1'
);

CREATE TABLE Tbl_producto_detalle(
    Kid_producto_encabezado INT(16),
    Kid_producto_detalle INT(16),
	Kid_proveedor	INT (16),
    kid_bodega INT(16),
    stock	INT(3),
    maxStock INT(3),
    minStock INT(3), 
    estado TINYINT(1) NULL DEFAULT '1'
);

CREATE TABLE Tbl_sucursal(
	Kid_sucursal INT(16),
    nombre VARCHAR(30), 
    estado TINYINT(1) NULL DEFAULT '1'
);

CREATE TABLE Tbl_proveedor(
	Kid_proveedor	INT (16),
    nombre VARCHAR(30),
    telefono VARCHAR(15),
    direccion VARCHAR(20),
    Kid_contacto INT(16),
    pagina VARCHAR(20), 
    estado TINYINT(1) NULL DEFAULT '1'
);

CREATE TABLE Tbl_contacto(
	Kid_contacto INT(16),
    nombre VARCHAR(30),
    telefono VARCHAR(15),
    email VARCHAR(20), 
    estado TINYINT(1) NULL DEFAULT '1'
);

-- LLAVES PRIMARIAS
ALTER TABLE TBL_ORDEN_COMPRA_ENCABEZADO ADD CONSTRAINT ORDEN_COMPRA_ENCABEZADO_PK PRIMARY KEY (kid_orden_compra_encabezado);
ALTER TABLE TBL_ORDEN_COMPRA_DETALLE ADD CONSTRAINT ORDEN_COMPRA_DETALLE_PK PRIMARY KEY (Kid_orden_compra_encabezado, Kid_orden_compra_detalle, Kid_producto_encabezado, Kid_proveedor);
ALTER TABLE TBL_BODEGA ADD CONSTRAINT BODEGA_PK PRIMARY KEY (kid_bodega);
ALTER TABLE TBL_PRODUCTO_ENCABEZADO ADD CONSTRAINT PRODUCTO_ENCABEZADO_PK PRIMARY KEY (Kid_producto_encabezado);
ALTER TABLE TBL_PRODUCTO_DETALLE ADD CONSTRAINT PRODUCTO_DETALLE_ID PRIMARY KEY (Kid_producto_encabezado, Kid_producto_detalle);
ALTER TABLE TBL_SUCURSAL ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY (kid_sucursal);
ALTER TABLE TBL_PROVEEDOR ADD CONSTRAINT PROVEEDOR_PK PRIMARY KEY (Kid_proveedor);
ALTER TABLE TBL_CONTACTO ADD CONSTRAINT CONTACTO_PK PRIMARY KEY (kid_contacto);

-- LLAVES FORANEAS
ALTER TABLE TBL_ORDEN_COMPRA_DETALLE ADD CONSTRAINT ORDEN_COMPRA_DETALLE_ORDEN_COMPRA_ENCABEZADO FOREIGN KEY (kid_orden_compra_encabezado) REFERENCES TBL_ORDEN_COMPRA_ENCABEZADO(kid_orden_compra_encabezado);
ALTER TABLE TBL_ORDEN_COMPRA_DETALLE ADD CONSTRAINT ORDEN_COMPRA_DETALLE_PRODUCTO_ENCABEZADO FOREIGN KEY (Kid_producto_encabezado) REFERENCES TBL_PRODUCTO_ENCABEZADO(Kid_producto_encabezado);
ALTER TABLE TBL_ORDEN_COMPRA_DETALLE ADD CONSTRAINT ORDEN_COMPRA_DETALLE_PROVEEDOR FOREIGN KEY (Kid_proveedor) REFERENCES TBL_PROVEEDOR(Kid_proveedor);

ALTER TABLE TBL_BODEGA ADD CONSTRAINT BODEGA_SUCURSAL FOREIGN KEY (kid_sucursal) REFERENCES TBL_SUCURSAL(kid_sucursal);

ALTER TABLE TBL_PRODUCTO_DETALLE ADD CONSTRAINT PRODUCTO_DETALLE_PROVEEDOR FOREIGN KEY (Kid_proveedor) REFERENCES TBL_PROVEEDOR(Kid_proveedor);
ALTER TABLE TBL_PRODUCTO_DETALLE ADD CONSTRAINT PRODUCTO_DETALLE_BODEGUA FOREIGN KEY (kid_bodega) REFERENCES TBL_BODEGA(kid_bodega);

ALTER TABLE TBL_PROVEEDOR ADD CONSTRAINT PROVEEDOR_CONTACTO FOREIGN KEY (kid_contacto) REFERENCES TBL_CONTACTO(kid_contacto);
