/*********** select as table *************/

-- select as를 이용한 create table도 지원
CREATE TABLE default.person2 AS 
SELECT pid, 
    name, 
    age, 
    address 
from default.person