/*********** external table *************/

-- CREATE TABLE WITH EXTERNAL
-- external table은 location에 설정된 파일이 삭제 되지 않는다.
-- external을 설정하지 않으면 default로 internal or managed table로 설정 된다.
CREATE EXTERNAL TABLE if not exists default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
STORED AS PARQUET;