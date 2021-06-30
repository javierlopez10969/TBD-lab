\! clear;
\c postgres;
drop database test;
\i dbCreate.sql;    
\i loadData.sql;