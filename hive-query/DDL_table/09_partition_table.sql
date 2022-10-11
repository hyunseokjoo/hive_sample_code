/*********** partitions table *************/

-- partitions란?
-- create table시 데이터를 한곳에 보관하는 것이 아니라 여러개에 나눠서 보관하는 방법이 여러가지 있는데 
-- 그 중 하나가 partitions이다. bucket은 column기준으로 캐싱하여 논리적 처리를 하지만
-- partition은 폴더를 나눠서 보관하여 물리적 처리를 한다.

CREATE TABLE if not exists default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
PARTITIONED BY(year int, month int, day int) -- depth
STORED AS ORC
LOCATION 'hdfs://namenode:8020/person/';

-- 아래 파티션 폴더 뎁스 예시 (ex : /person/year=2022/month=09/day=29)

-- tip!!
-- partitions은 depth가 설정 되는것이기 때문에 
-- 너무 많은 depth를 설정하면 조회로직 처리가 복잡해져 오히려 속도가 느려진다.
-- 적당한 partitions을 설정하는 것으로 작성하는게 좋다.