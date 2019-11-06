use proyectogeneral;

-- ----------- INVENTARIO --------------------------
ALTER TABLE tbl_producto_marca ADD estado TINYINT;
ALTER TABLE tbl_tipoproducto ADD estado TINYINT;
ALTER TABLE tbl_bodega ADD CONSTRAINT	 FK_Sucursal_Bodega	FOREIGN KEY(KidSucursal) REFERENCES tbl_sucursal(KidSucursal);

-- ----------- RECURSOS HUMANOS ---------------------
ALTER TABLE `proyectogeneral`.`tbl_resultados` 
CHANGE COLUMN `Resultado` `Resultado` INT NULL DEFAULT NULL;


-- ------------ CONTABILIDAD -----------------------------
ALTER TABLE tbl_cuentas ADD debe DOUBLE;
ALTER TABLE tbl_cuentas ADD haber DOUBLE;