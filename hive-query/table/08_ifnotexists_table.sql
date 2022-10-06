/*********** if not exists table *************/

-- if not exists란?
-- if not exists 옵션을 주게 되면 person테이블이 있는지 없는지 확인 하여 
-- 있으면 생성하지 않고 
-- 없으면 생성하게 된다.
-- 보통 에러 없이 처리 하고 싶을 때 이 옵션을 사용하게 된다.

-- CREATE TABLE WITH [if not exists] option
CREATE TABLE if not exsits default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
STORED AS ORC;
