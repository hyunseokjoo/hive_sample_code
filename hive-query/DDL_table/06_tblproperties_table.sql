/*********** tblproperties table *************/

-- CREATE TABLE WITH Transaction
CREATE TABLE default.person(
    pid     INT,
    name    STRING,
    age     INT,
    address STRING
)
TBLPROPERTIES('transactional'='true');
