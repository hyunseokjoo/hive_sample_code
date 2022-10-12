-- select 
select pid, name, age, address  
  from default.person;


-- filter fing
select pid, name, age, address  
  from default.person
 where pid = 20;

-- group by 
-- filter fing
select count(*)
  from default.person;

-- distinct 
select distinct pid, name, age, address  
  from default.person;




  