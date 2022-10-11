/*********** Location table *************/

-- Location이란?
-- Location을 hive default path에 table 데이터를 관리하게 되는데 default path가 아닌 다른 곳으로 설정하는 옵션이다.
-- HDFS에 저장을 해도 되며 외부 옵션인 곳도 설정 가능하다 대표적으로 S3에 적재가 가능하다.
-- S3 plugin은 hive 최신 버전에 내장 되어있다.

-- CREATE TABLE WITH LOCATION-HDFS
CREATE TABLE default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
STORED AS ORC
LOCATION 'hdfs://{hdfs-domain}:{port}/{path}';


CREATE TABLE default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
STORED AS ORC
LOCATION 'hdfs://namenode:8020/person/';

-- CREATE TABLE WITH LOCATION-AWS S3
CREATE TABLE default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
STORED AS ORC
LOCATION 's3a://{bucket_name}/{path}';
