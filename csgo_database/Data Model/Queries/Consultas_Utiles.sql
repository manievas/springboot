--Consulta general de los datafiles
SELECT * FROM dba_data_files;

--Consulta de Tablespaces, datafile name y espacio asignado
SELECT tablespace_name, 
       file_name, 
       bytes / 1024/ 1024  MB
  FROM dba_data_files;
  
--Usuarios  
SELECT * FROM dba_users where username = 'INV';

--System privileges for a user:
SELECT PRIVILEGE
  FROM sys.dba_sys_privs
 WHERE grantee = :p_user
UNION
SELECT PRIVILEGE 
  FROM dba_role_privs rp JOIN role_sys_privs rsp ON (rp.granted_role = rsp.role)
 WHERE rp.grantee = :p_user
 ORDER BY 1;
 
--Direct grants to tables/views:
SELECT owner, table_name, select_priv, insert_priv, delete_priv, update_priv, references_priv, alter_priv, index_priv 
  FROM table_privileges
 WHERE grantee = :p_user
 ORDER BY owner, table_name;

--Indirect grants to tables/views:
SELECT DISTINCT owner, table_name, PRIVILEGE 
  FROM dba_role_privs rp JOIN role_tab_privs rtp ON (rp.granted_role = rtp.role)
 WHERE rp.grantee = :p_user
 ORDER BY owner, table_name;