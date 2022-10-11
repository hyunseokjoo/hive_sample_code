-- create 
CREATE TABLE if not exists default.person(
        pid     INT,
        name    STRING,
        age     INT,
        address STRING
)
CLUSTERED BY (pid) into 24 BUCKETS 
STORED AS ORC
LOCATION 'hdfs://namenode:8020/person/'
TBLPROPERTIES('transactional'='true');


-- transaction dummy data 생성 
-- insert
insert into table default.person values
(1, 'James', 22, 'Seoul'),(2, 'Tom', 23, 'New York'),(3, 'Jace', 24, 'San Francisco'),
(4, 'Catalina', 25, 'Virginia'),(5, 'Nilla', 31, 'Florida'),(6, 'Hyun', 32, 'Busan'),
(7, 'Jack', 45, 'Tokyo'),(8, 'Micheal', 82, 'Fukuoka'),(9, 'Sunny', 31, 'Gwangju'),
(10, 'John', 42, 'Canberra');

insert into table default.person values
(11, 'James', 94, 'Seoul'),(12, 'Tom', 47, 'New York'),(13, 'Jace', 56, 'San Francisco'),
(14, 'Catalina', 22, 'Florida'),(15, 'Nilla', 36, 'Busan'),(16, 'Hyun', 22, 'Tokyo'),
(17, 'Jack', 26, 'Fukuoka'),(18, 'Micheal', 52, 'Fukuoka'),(19, 'Sunny', 38, 'Gwangju'),
(20, 'John', 34, 'Canberra');

insert into table default.person values
(21, 'james', 22, 'Seoul'),(22, 'Tom', 47, 'New York'),(23, 'Jace', 56, 'San Francisco'),
(24, 'Catalina', 36, 'Florida'),(25, 'Nilla', 26, 'Seoul'),(26, 'Hyun', 52, 'Seoul'),
(27, 'Jack', 34, 'Tokyo'),(28, 'Sunny', 38, 'Fukuoka');

-- 조회
select * from person;

-- update
UPDATE person SET age = 100 WHERE pid = 20;
UPDATE person SET age = 34 WHERE pid = 20;

-- delete
DELETE FROM person WHERE pid = 20;