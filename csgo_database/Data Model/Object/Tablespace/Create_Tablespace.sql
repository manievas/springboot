--Tablespace para la gestion de gastos del hogar
--Creando TS
create tablespace tbs1_eco datafile 'A:\Trabajo\Oracle\Base_XE_18c\product\18.0.0\oradata\XE\XEPDB1\tbs1_eco.dbf' SIZE 1G;
create tablespace tbs1_admin datafile 'A:\Trabajo\Oracle\Base_XE_18c\product\18.0.0\oradata\XE\XEPDB1\tbs1_admin.dbf' SIZE 100M autoextend on maxsize 100M;

--Autoextend 500 megas
alter database datafile 'A:\Trabajo\Oracle\Base_XE_18c\product\18.0.0\oradata\XE\XEPDB1\tbs1_eco.dbf' autoextend on maxsize 512M;



--Ruta de los Datafile
--A:\Trabajo\Oracle\Base_XE_18c\product\18.0.0\oradata\XE\XEPDB1