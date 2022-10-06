/*********** internal or managed table *************/

-- create managed or internal table 예제
-- 아무 옵션을 주지 않으면 기본적으로 internal or managed table로 생성이 된다.
-- internal table은 drop table을 하게 되면 안에 있는 데이터도 같이 삭제 된다.
CREATE [INTERNAL or MANAGED] TABLE default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
);