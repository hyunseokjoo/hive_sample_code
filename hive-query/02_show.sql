
--
CREATE EXTERNAL TABLE if not exists default.person(
    pid INT,
    name STRING,
    age INT,
    address STRING
)
PARTITIONED BY (year int, month int, day int, hour int) STORED AS PARQUET
LOCATION 's3a://{bucket_name}/{path}';








/*
datatype document 
https://cwiki.apache.org/confluence/display/hive/languagemanual+types
*/