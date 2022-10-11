/*********** fileformat table *************/

-- fileformat이란?
-- create table 에서 데이터 저장 방식을 정할 수 있다.
-- TEXTFILE, SEQUENCEFILE, RCFILEORC, PARQUET, AVRO, JSONFILE
-- 다양한 형식으로 처리 가능하다.

-- CREATE TABLE WITH File Format 
CREATE TABLE default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
STORED AS [ORC, PARQUET, TEXTFILE, AVRO, JSON, etc ...];

-- transactional true를 주게 되면 STORED AS File Format은  ORC만 가능
CREATE TABLE default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
STORED AS ORC
TBLPROPERTIES('transactional'='true');

-- CREATE TABLE WITH parquet
-- parquet 파일은 꼭 Schema의 datatype을 맞춰야 한다.
CREATE TABLE if not exsits default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
PARTITIONED BY (year int, month int, day int)
STORED AS PARQUET;
