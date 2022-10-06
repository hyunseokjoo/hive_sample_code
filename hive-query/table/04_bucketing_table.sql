/*********** bucketing table *************/

-- CREATE TABLE WITH BUCKETING
-- bucket이란? - hive에서는 파일 단위로 데이터를 관리하는데
-- 이 데이터들를 관리용이 및 성능 개선을 위해 하나의 파일에 몰아서 관리하는 것이 아니라 여러개의 파일로 나눠서 데이터를 관리하는 것

-- CREATE TABLE을 하게 되면 default로 설정된 bucket갯수 만큼 파일이 생기게되는데 (보통 10개에 나눠서 데이터 나뉜 파일이 생성)
-- bucketing은 cluster옵션에 설정한 컬럼기준으로 캐싱이 되어 설정한 컬럼 기준으로 데이터 처리하여 빨라지게 되며
-- 설정한 bucket 숫자 만큼 파일이 생성되고 그 파일들에 데이터를 나눠서 보관하게 된다.

-- bucket을 하게 되면 트랜잭션 속도는 빨라지지만, select할 때 속도는 늘려지게 된다.
-- 그래서 최적의 속도를 찾을 수 있는 bucket숫자를 지정하고, Compaction을 빡세게 해야한다.

-- This property is not needed if you are using Hive 2.x or later
set hive.enforce.bucketing = true;

CREATE EXTERNAL TABLE if not exists test.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
CLUSTERED BY (pid) SORTED BY (name ASC) into 256 BUCKETS 
LOCATION 'hdfs://namenode:8020/temp/';

-- tip
-- pid 기준으로 bucketing하고, name 기준으로 내림차순, 256 bucket에 나눠서 데이터 담기
