--Cambiando a la base de datos PLUGGEABLE
alter session set container = CDB$ROOT;
alter session set container = ORCLPDB;

--Creando TS
create tablespace tbs_csgo datafile 'C:\Oracle\DB\oradata\ORCL\orclpdb\tbs_csgo.dbf' SIZE 1G;
create tablespace tbs_admin datafile 'C:\Oracle\DB\oradata\ORCL\orclpdb\tbs_admin.dbf' SIZE 100M autoextend on maxsize 100M;

--Autoextend 500 megas
alter database datafile 'C:\Oracle\DB\oradata\ORCL\orclpdb\tbs_csgo.dbf' autoextend on maxsize 512M;

drop tablespace tbs1_csgo;
drop tablespace tbs1_admin;
drop user csgo;
drop user admin;

--Ruta de los Datafile
--C:\Oracle\DB\oradata\ORCL\orclpdb\

--Creating users and qiving quota
--CSGO: write in tbs1_csgo unlimited
create user csgo identified by csgo default tablespace tbs_csgo quota unlimited on tbs_csgo;

--ADMIN: Superuser, own of all objects cross-user, write in tbs1_admin unlimited
create user admin identified by admin default tablespace tbs_admin quota unlimited on tbs_admin;

alter session set "_ORACLE_SCRIPT"=false; 
--Setting Grants
--CSGO
GRANT CONNECT TO CSGO;
GRANT CREATE SESSION TO CSGO;
GRANT CREATE TABLE TO CSGO;
GRANT CREATE PROCEDURE TO CSGO;
GRANT CREATE SEQUENCE TO CSGO;
GRANT CREATE SYNONYM TO CSGO;
GRANT CREATE TRIGGER TO CSGO;
GRANT CREATE TYPE TO CSGO;
GRANT CREATE VIEW TO CSGO;
GRANT CREATE MATERIALIZED VIEW TO CSGO;
GRANT CREATE PUBLIC SYNONYM TO CSGO;
GRANT DEBUG ANY PROCEDURE TO CSGO;
GRANT DROP PUBLIC SYNONYM TO CSGO;

--Admin
GRANT CONNECT TO admin;
GRANT CREATE SESSION TO admin;
GRANT CREATE TRIGGER TO admin;


CREATE OR REPLACE TRIGGER logon_trg 
  AFTER LOGON ON DATABASE
BEGIN
    IF (user = 'CSGO') THEN
      EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA = CSGO';
    ELSIF (user = 'ADMIN') THEN
      EXECUTE IMMEDIATE 'ALTER SESSION SET CURRENT_SCHEMA = ADMIN';  
    end if;
EXCEPTION 
  WHEN OTHERS 
    THEN NULL; -- prevent a login failure due to an exception
END logon_trg;
/  
