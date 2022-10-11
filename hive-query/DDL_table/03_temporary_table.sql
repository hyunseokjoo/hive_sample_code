/*********** temporary table *************/

-- CREATE TABLE WITH TEMPORARY
-- temporary를 설정하면 yarn이나, Tez등의 세션에서만 존재하는 테이블로 생성되고 
-- 세션이 끊기거나 종료되면 삭제 된다.
CREATE TEMPORARY TABLE if not exists default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
PARTITIONED BY (year int, month int, day int)
STORED AS PARQUET;