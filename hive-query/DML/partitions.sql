-- Partition 테이블 생성 manual
-- 형식은 'hdfs://{hadoop_domain}:{port}/{path}/depth1/depth2/depth3' 로 관리 된다.
CREATE TABLE if not exsits default.person(
    col1  INT,
    col2  STRING,
    col3  INT,
    col4  STRING
)
PARTITIONED BY(depth1 int, depth2 int, depth3 int) -- depth
STORED AS ORC
LOCATION 'hdfs://{hadoop_domain}:{port}/{path}';


-- table 생성
CREATE TABLE if not exists default.person(
        pid     INT,
        name    STRING,
        age     INT,
        address STRING
)
PARTITIONED BY(year int, month int, day int) -- depth
STORED AS ORC
LOCATION 'hdfs://namenode:8020/person/';

-- partition dummy data 생성 
insert into table default.person partition(year=2022, month=9, day=15) values
(1, 'James', 22, 'Seoul'),(2, 'Tom', 23, 'New York'),(3, 'Jace', 24, 'San Francisco'),
(4, 'Catalina', 25, 'Virginia'),(5, 'Nilla', 31, 'Florida'),(6, 'Hyun', 32, 'Busan'),
(7, 'Jack', 45, 'Tokyo'),(8, 'Micheal', 82, 'Fukuoka'),(9, 'Sunny', 31, 'Gwangju'),
(10, 'John', 42, 'Canberra');

insert into table default.person partition(year=2022, month=9, day=16) values
(11, 'James', 94, 'Seoul'),(12, 'Tom', 47, 'New York'),(13, 'Jace', 56, 'San Francisco'),
(14, 'Catalina', 22, 'Florida'),(15, 'Nilla', 36, 'Busan'),(16, 'Hyun', 22, 'Tokyo'),
(17, 'Jack', 26, 'Fukuoka'),(18, 'Micheal', 52, 'Fukuoka'),(19, 'Sunny', 38, 'Gwangju'),
(20, 'John', 34, 'Canberra');

insert into table default.person partition(year=2022, month=9, day=17) values
(21, 'james', 22, 'Seoul'),(22, 'Tom', 47, 'New York'),(23, 'Jace', 56, 'San Francisco'),
(24, 'Catalina', 36, 'Florida'),(25, 'Nilla', 26, 'Seoul'),(26, 'Hyun', 52, 'Seoul'),
(27, 'Jack', 34, 'Tokyo'),(28, 'Sunny', 38, 'Fukuoka');

-- partition 조회
show partitions default.person;

-- partitions filter 적용 조회
select * from person where day = 15;

-- partition 추가 
ALTER TABLE person ADD PARTITION (year=2022, month=10, day=1)
LOCATION 'hdfs://namenode:8020/person/year=2022/month=10/day=1';

-- 미리 생성된 partition 한번에 추가 
msck repair TABLE default.person;

-- partition 삭제 
ALTER TABLE default.person DROP PARTITION(day=1);

-- 조건문으로 삭제 
ALTER TABLE default.person DROP PARTITION(day > 1);