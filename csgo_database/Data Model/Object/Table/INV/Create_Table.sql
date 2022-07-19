--inventario
CREATE TABLE inv_inventario
(
  inventario_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  codigo VARCHAR2(3) NOT NULL,
  inventario VARCHAR2(100),
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10)
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_inventario IS 'Maestro de inventario (Ej: Casa, Supermercado, Consumido)';

COMMENT ON COLUMN inv_inventario.inventario_id IS 'Identificador secuencial de la tabla';
COMMENT ON COLUMN inv_inventario.codigo IS 'Codigo de 3 digitos del inventario (Ej: CAS, SUP, CON)';
COMMENT ON COLUMN inv_inventario.inventario IS 'Nombre del inventario';
COMMENT ON COLUMN inv_inventario.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_inventario.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_inventario.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_inventario.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';

--Categoria
CREATE TABLE inv_categoria 
(
  categoria_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  codigo VARCHAR2(3) NOT NULL UNIQUE,
  categoria VARCHAR2(50) NOT NULL,
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10)  
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_categoria IS 'Maestro de categorias de inventario (Ej: Limpieza, Bebida, Congelado)';

COMMENT ON COLUMN inv_categoria.categoria_id IS 'Identificador secuencial de la tabla';
COMMENT ON COLUMN inv_categoria.codigo IS 'Codigo de 3 digitos de la categoria del item de inventario (Ej: LIM, BEB, CON)';
COMMENT ON COLUMN inv_categoria.categoria IS 'Nombre de la categoria del item de inventario (Ej: Limpieza, Bebida, Congelado)';
COMMENT ON COLUMN inv_categoria.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_categoria.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_categoria.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_categoria.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';

--Tipo
CREATE TABLE inv_subcategoria
(
  subcategoria_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  codigo VARCHAR2(3) NOT NULL UNIQUE,
  subcategoria VARCHAR2(50) NOT NULL,
  categoria_id NUMBER NOT NULL,
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10),  
  CONSTRAINT categoria_fk FOREIGN KEY (categoria_id) references inv_categoria(categoria_id)
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_subcategoria IS 'Maestro de subcategorias de item de inventario (Ej: Gaseosa, Carne, Soda)';

COMMENT ON COLUMN inv_subcategoria.subcategoria_id IS 'Identificador secuencial de la tabla';
COMMENT ON COLUMN inv_subcategoria.codigo IS 'Codigo de 3 digitos de la subcategoria de item de inventario (Ej: GAS, CAR, SOD)';
COMMENT ON COLUMN inv_subcategoria.subcategoria IS 'Nombre de la subcategoria de item de inventario (Ej: Gaseosa, Carne, Soda)';
COMMENT ON COLUMN inv_subcategoria.categoria_id IS 'ID del tipo de categoria al que pertenece (inv_categoria.categoria_id)';
COMMENT ON COLUMN inv_subcategoria.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_subcategoria.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_subcategoria.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_subcategoria.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';


--Unidad de Medida
CREATE TABLE inv_unidad_medida
(
  unidad_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  codigo VARCHAR2(3) NOT NULL UNIQUE,
  unidad_medida VARCHAR2(50) NOT NULL,
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10)
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_unidad_medida IS 'Maestro de unidades de medida (Ej: Litro)';

COMMENT ON COLUMN inv_unidad_medida.unidad_id IS 'Identificador secuencial de la tabla';
COMMENT ON COLUMN inv_unidad_medida.codigo IS 'Codigo unico de la unidad de medida (Ej: LTR)';
COMMENT ON COLUMN inv_unidad_medida.unidad_medida IS 'Nombre de la unidad de medida (Ej: Litro)';
COMMENT ON COLUMN inv_unidad_medida.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_unidad_medida.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_unidad_medida.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_unidad_medida.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';

--Item
CREATE TABLE inv_item
(
  item_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  codigo VARCHAR2(150) NOT NULL UNIQUE,
  item VARCHAR2(100) NOT NULL,
  subcategoria_id NUMBER NOT NULL,
  marca VARCHAR2(100),
  medida FLOAT,
  unidad_medida VARCHAR2(3),
  pack VARCHAR2(1) DEFAULT 'N',
  cantidad NUMBER DEFAULT 1,
  estado VARCHAR2(1) DEFAULT 'A' NOT NULL,
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10),  
  CONSTRAINT subcategoria_fk FOREIGN KEY (subcategoria_id) references inv_subcategoria(subcategoria_id),
  CONSTRAINT unidad_fk FOREIGN KEY (unidad_medida) references inv_unidad_medida(unidad_id)
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_item IS 'Maestro de items de inventario (Ej: Coca Cola, Alfajor Jorgito, Leche Sancor)';

COMMENT ON COLUMN inv_item.item_id IS 'Identificador secuencial de la tabla';
COMMENT ON COLUMN inv_item.codigo IS 'Codigo unico del item de inventario compuesto por: Categoria-Tipo-Pack-Item-Medida-Unidad de medida (Ej: BEB-GAS-PACK-Coca Cola-2.25 litros)';
COMMENT ON COLUMN inv_item.item IS 'Nombre del item de inventario (Ej: Coca Cola,  Alfajor Jorgito, Leche Sancor)';
COMMENT ON COLUMN inv_item.subcategoria_id IS 'ID de la subcategoria de item al que pertenece (inv_subcategoria.subcategoria_id)';
COMMENT ON COLUMN inv_item.marca IS 'Marca del item de inventario (muchas veces coincidira con el item)';
COMMENT ON COLUMN inv_item.medida IS 'Medida del item (Ej: 2.25, 2, 100)';
COMMENT ON COLUMN inv_item.unidad_medida IS 'Unidad de medida del item de inventario (inv_unidad_medida.unidad_id)';
COMMENT ON COLUMN inv_item.pack IS 'Flag que indica si el item es un pack';
COMMENT ON COLUMN inv_item.cantidad IS 'Cantidad del item (1 para los que no son packs)';
COMMENT ON COLUMN inv_item.estado IS 'Estado del item de inventario (A: Activo, I: Inactivo)';
COMMENT ON COLUMN inv_item.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_item.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_item.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_item.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';

--serial
CREATE TABLE inv_item_serial
(
  serial_id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  codigo_barras VARCHAR2(13),
  item_id NUMBER NOT NULL,
  fecha_vencimiento DATE,
  inventario_id NUMBER NOT NULL,
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10),  
  CONSTRAINT item_fk FOREIGN KEY (item_id) references inv_item(item_id),
  CONSTRAINT inventario_fk FOREIGN KEY (inventario_id) references inv_inventario(inventario_id)   
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_item_serial IS 'Tabla de seriales de inventario';

COMMENT ON COLUMN inv_item_serial.serial_id IS 'Identificador secuencial de la tabla';
COMMENT ON COLUMN inv_item_serial.codigo_barras IS 'Codigo de barras del serial (13 digitos)';
COMMENT ON COLUMN inv_item_serial.item_id IS 'ID del item al que pertenece (inv_item.item_id)';
COMMENT ON COLUMN inv_item_serial.inventario_id IS 'ID del inventario al que pertenece (inv_inventario.item_id)';
COMMENT ON COLUMN inv_item_serial.fecha_vencimiento IS 'Fecha de vencimiento del serial';
COMMENT ON COLUMN inv_item_serial.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_item_serial.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_item_serial.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_item_serial.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';


--transaccion
CREATE TABLE inv_transaccion
(
  transaccion_id NUMBER PRIMARY KEY,
  inventario_id NUMBER NOT NULL,
  tipo VARCHAR2(3) NOT NULL,
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10),
  CONSTRAINT trx_inventario_fk FOREIGN KEY (inventario_id) references inv_inventario(inventario_id)
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_transaccion IS 'Tabla de cabecera de transacciones de inventario';

COMMENT ON COLUMN inv_transaccion.transaccion_id IS 'Identificador secuencial de la tabla. Se calcula con la secuencia seq_transaccion_id';
COMMENT ON COLUMN inv_transaccion.inventario_id IS 'ID del inventario de la transaccion (inv_inventario.inventario_id)';
COMMENT ON COLUMN inv_transaccion.tipo IS 'Tipo de transaccion (Entrada o Salida)';
COMMENT ON COLUMN inv_transaccion.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_transaccion.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_transaccion.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_transaccion.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';

--detalle de transaccion
CREATE TABLE inv_detalle_transaccion
(
  transaccion_id NUMBER NOT NULL,
  serial_id NUMBER NOT NULL,
  creation_date DATE DEFAULT SYSDATE,
  created_by VARCHAR2(10) DEFAULT USER,
  last_update_date DATE,
  last_upadted_by VARCHAR2(10),
  CONSTRAINT transaccion_fk FOREIGN KEY (transaccion_id) references inv_transaccion(transaccion_id),
  CONSTRAINT serial_fk FOREIGN KEY (serial_id) references inv_item_serial(serial_id)
)
TABLESPACE tbs1_eco;

COMMENT ON TABLE inv_detalle_transaccion IS 'Tabla de detalle de de transacciones de inventario';

COMMENT ON COLUMN inv_detalle_transaccion.transaccion_id IS 'ID de la cabecera de transaccion (inv_transaccion.transaccion_id)';
COMMENT ON COLUMN inv_detalle_transaccion.serial_id IS 'ID del serial (inv_item_serial.serial_id)';
COMMENT ON COLUMN inv_detalle_transaccion.creation_date IS 'Auditoria: Fecha de creacion del registro';
COMMENT ON COLUMN inv_detalle_transaccion.created_by IS 'Auditoria: Creado por (usuario)';
COMMENT ON COLUMN inv_detalle_transaccion.last_update_date IS 'Auditoria: Fecha de actualizacion del registro';
COMMENT ON COLUMN inv_detalle_transaccion.last_upadted_by IS 'Auditoria: Actualizado por (usuario)';