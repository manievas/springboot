SELECT * FROM all_Tables where table_name = 'INV_CATEGORIA';
SELECT * FROM all_objects where owner = 'INV' AND object_TYPE = 'TABLE';

SELECT * FROM inv_categoria;
SELECT * FROM inv_inventario;
SELECT * FROM inv_tipo_item;
SELECT r.*, r.rowid FROM inv_item_serial r ORDER BY 1 desc;
SELECT * FROM inv_item ORDER BY 1 desc;
SELECT * FROM inv_transaccion ORDER BY transaccion_id desc;
SELECT * FROM inv_detalle_transaccion WHERE transaccion_id = 58 ORDER BY transaccion_id desc;

DELETE FROM INV_DETALLE_TRANSACCION WHERE TRANSACCION_ID IN (45,46);
DELETE FROM INV_TRANSACCION WHERE TRANSACCION_ID IN (45,46);

SELECT * FROM all_constraints WHERE owner = 'INV';

INSERT INTO inv_tipo_item (codigo, tipo, categoria_id) values ('GAS','Gaseosa',1);
INSERT INTO inv_tipo_item (codigo, tipo, categoria_id) values ('HAM','Hamburguesa',2);

 INSERT INTO inv_item (codigo, item, tipo_id, marca, medida, unidad_medida)
    VALUES (upper(p_codigo), p_item, p_tipo_id, p_marca, p_medida, p_unidad_medida);
    
    INSERT INTO inv_item_serial (codigo_barras,item_id, fecha_vencimiento) VALUES ('AAAABBBBCCCCD', 121, '12/SEP/2021');
    
        SELECT t.codigo, c.codigo
      FROM inv_tipo_item t,
           inv_categoria c
     WHERE t.categoria_id = t.categoria_id
       AND t.tipo_id = 1;
       
  
INSERT INTO inv_inventario (codigo, inventario)  VALUES ('DIS','Disponible');
INSERT INTO inv_inventario (codigo, inventario)  VALUES ('COM', 'Compras');
INSERT INTO inv_inventario (codigo, inventario)  VALUES ('CON', 'Consumido');
INSERT INTO inv_inventario (codigo, inventario)  VALUES ('TRN', 'Transito');

SELECT * FROM inv_item WHERE marca like '%'||:p_marca ||'%' AND unidad_medida like '%'||:p_unidad ||'%' ;

SELECT * FROM inv_item WHERE item_id IN (SELECT distinct item_id FROM inv_item_serial WHERE inventario_id = 23);

DELETE FROM inv_detalle_transaccion;
DELETE FROM inv_transaccion;
DELETE FROM inv_item_serial;
DELETE FROM inv_item;
DELETE FROM inv_subcategoria;
DELETE FROM inv_categoria;


INSERT INTO inv_unidad_medida (codigo, unidad_medida) VALUES ('CAN','Cantidad')
;

SELECT * FROM inv_unidad_medida WHERE unidad_id  = 1;