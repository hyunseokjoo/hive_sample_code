-- person table 생성
CREATE TABLE if not exists default.person(
        pid     INT,
        name    STRING,
        age     INT,
        address STRING
)
CLUSTERED BY (pid) into 1 BUCKETS 
STORED AS ORC
LOCATION 'hdfs://namenode:8020/person/'
TBLPROPERTIES('transactional'='true');

-- dummy data insert 
insert into table default.person values
(1, 'James', 22, 'Seoul'),
(2, 'Tom', 23, 'New York'),
(3, 'Jace', 24, 'San Francisco'),
(4, 'Catalina', 25, 'Virginia'),
(5, 'Nilla', 31, 'Florida'),
(6, 'Hyun', 32, 'Busan'),
(7, 'Jack', 45, 'Tokyo'),
(8, 'Micheal', 82, 'Fukuoka'),
(9, 'Sunny', 31, 'Gwangju'),
(10, 'John', 42, 'Canberra'),
(11, 'James', 94, 'Seoul'),
(12, 'Tom', 47, 'New York'),
(13, 'Jace', 56, 'San Francisco'),
(14, 'Catalina', 22, 'Florida'),
(15, 'Nilla', 36, 'Busan'),
(16, 'Hyun', 22, 'Tokyo'),
(17, 'Jack', 26, 'Fukuoka'),
(18, 'Micheal', 52, 'Fukuoka'),
(19, 'Sunny', 38, 'Gwangju'),
(20, 'John', 34, 'Canberra'), 
(21, 'james', 22, 'Seoul'),
(22, 'Tom', 47, 'New York'),
(23, 'Jace', 56, 'San Francisco'),
(24, 'Catalina', 36, 'Florida'),
(25, 'Nilla', 26, 'Seoul'),
(26, 'Hyun', 52, 'Seoul'),
(27, 'Jack', 34, 'Tokyo'),
(28, 'Sunny', 38, 'Fukuoka');

-- 여분 테이블 생성
CREATE TABLE if not exists default.incremental_temp_person(
        pid     INT,
        name    STRING,
        age     INT,
        address STRING
)
CLUSTERED BY (pid) into 1 BUCKETS 
STORED AS ORC
LOCATION 'hdfs://namenode:8020/incremental_temp_person/'
TBLPROPERTIES('transactional'='true');

-- incremental dummy data insert
insert into table default.incremental_temp_person values
(1, 'James', 100, 'Seoul'),
(29, 'Joon', 38, 'Fukuoka'),
(30, 'Brown', 38, 'Florida'),
(31, 'Sonny', 38, 'Seoul'),
(32, 'Hammer', 38, 'New York');

-- merge 
MERGE INTO default.person as t
USING ( select  pid, 
                name, 
                age,
                address
        from default.incremental_temp_person
       ) s
  ON s.pid = t.pid
WHEN MATCHED THEN 
  UPDATE set  name    = s.name
            , age     = s.age
            , address = s.address 
WHEN NOT MATCHED THEN 
  INSERT VALUES(s.pid
              , s.name
              , s.age
              , s.address);
