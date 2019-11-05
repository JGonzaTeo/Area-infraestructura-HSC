use proyectogeneral;

-- ----------- INVENTARIO --------------------------
ALTER TABLE tbl_producto_marca ADD estado TINYINT;
ALTER TABLE tbl_tipoproducto ADD estado TINYINT;
ALTER TABLE tbl_bodega ADD CONSTRAINT	 FK_Sucursal_Bodega	FOREIGN KEY(KidSucursal) REFERENCES tbl_sucursal(KidSucursal);