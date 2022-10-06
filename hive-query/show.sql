
-- Show Tables
SHOW TABLES [IN database_name] ['identifier_with_wildcards'];

-- Show Partitions
SHOW PARTITIONS table_name;
SHOW PARTITIONS table_name PARTITION(partition_depth='{value}');

-- Show Table Properties
SHOW TBLPROPERTIES table_name;
SHOW TBLPROPERTIES table_name("{property_name}");

-- Show Create Database
-- Database DDL 보기
SHOW CREATE DATABASE db_name;

-- Show Create Table
-- Table DDL 보기 
SHOW CREATE TABLE table_name;

-- Show Locks
SHOW LOCKS table_name;

-- Show Transactions
-- Transactions 모두 보기
SHOW Transactions;

-- Show Compactions
-- Compactions 설정 모두 보기
SHOW COMPACTIONS;

