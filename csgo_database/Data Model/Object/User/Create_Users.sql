--INV: Escribe en el tbs1_eco ilimitadamente
create user inv identified by inv default tablespace tbs1_eco quota unlimited on tbs1_eco;

--ADMIN: Usuario administrativo, dueño de objetos cross-user
create user admin identified by admin default tablespace tbs1_admin quota unlimited on tbs1_admin;

--AR: Escribe en el tbs1_eco ilimitadamente
create user ap identified by ap default tablespace tbs1_eco quota unlimited on tbs1_eco;
