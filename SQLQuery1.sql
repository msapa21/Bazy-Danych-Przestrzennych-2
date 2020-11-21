

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'FactInternetSales'  -- MS SQL

/*
select * from all_tab_cols where owner = 'FactInternetSales'; -- Oracle
select dbms_metadata.get_ddl('FactInternetSales', table_name) from user_tables; -- Oracle v2

SELECT COLUMN_NAME, DATA_TYPE FROM information_schema.COLUMNS WHERE TABLE_NAME = 'FactInternetSales'; -- postgresql

DESCRIBE FactInternetSales; --MySql
SHOW COLUMNS FROM FactInternetSales; --MySql
DESC FactInternetSales; --MySql
EXPLAIN FactInternetSales; --MySql  */

